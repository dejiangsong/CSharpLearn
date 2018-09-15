using Common;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace SocketServer {
    class Program {
        static void Main(string[] args) {
            StartServerAsync();

            Console.ReadKey();      // 暂停
        }

        #region 异步接收
        //static byte[] dataBuffer = new byte[1024];        // 直接接收数据
        static Message message = new Message();             // 处理粘包的类

        static void StartServerAsync() {
            // 创建Socket对象用作通信
            Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            // 创建IP地址
            IPAddress ipAddress = IPAddress.Parse("127.0.0.1");             // ip
            IPEndPoint ipEndPoint = new IPEndPoint(ipAddress, 8088);        // ip + port

            // 绑定ip、监听客户端、接收客户连接
            serverSocket.Bind(ipEndPoint);        // 绑定ip和端口号
            serverSocket.Listen(10);      // 设置最长的连接请求队列长度

            Console.WriteLine("Server running...");

            //Socket clientSocket = serverSocket.Accept();        // 接收一个客户端连接
            serverSocket.BeginAccept(acceptCallBack, serverSocket);          // 开始异步接收一个客户端连接

        }

        /// <summary>
        /// 异步接收客户端连接的回调函数
        /// </summary>
        static void acceptCallBack(IAsyncResult ar) {
            Socket serverSocket = ar.AsyncState as Socket;
            Socket clientSocket = serverSocket.EndAccept(ar);       // 结束异步接收一个客户端连接

            // 向客户端发送消息
            string msg = "Connected";
            byte[] data = Encoding.UTF8.GetBytes(msg);
            clientSocket.Send(data);

            // 异步接收
            //clientSocket.BeginReceive(dataBuffer, 0, 1024, SocketFlags.None, receiveCallBack, clientSocket);        // 开始接收数据，回调ReceiveCallBack()方法，可以传入自己clientSocket作为参数
            clientSocket.BeginReceive(message.Data, message.StartIndex, message.RemainSize, SocketFlags.None, receiveCallBack, clientSocket);        // 处理粘包

            // 再次异步开始接收客户端（接入其它客户端的连接）
            serverSocket.BeginAccept(acceptCallBack, serverSocket);
        }

        /// <summary>
        /// 异步接收数据的回调函数
        /// </summary>
        /// <param name="ar"></param>
        static void receiveCallBack(IAsyncResult ar) {
            Socket clientSocket = null;

            try {
                clientSocket = ar.AsyncState as Socket;      // 获取传入的参数
                int count = clientSocket.EndReceive(ar);            // 结束异步接收

                if (count == 0) {
                    Console.WriteLine("退出");
                    clientSocket.Close();       // 正常退出关闭客户端连接
                    return;
                }

                // 为了处理粘包问题，使用Message处理，读取的数据不再放入dataBuffer，注释以下2行
                //string msg = Encoding.UTF8.GetString(dataBuffer, 0, count);
                //Console.WriteLine("从客户端接收到数据：" + msg);

                // 再次异步接收数据（接收下一条数据）
                //clientSocket.BeginReceive(dataBuffer, 0, 1024, SocketFlags.None, receiveCallBack, clientSocket);        // 开始接收数据，回调ReceiveCallBack()方法，可以传入自己clientSocket作为参数
                message.ReadMessage(count);
                while (message.DataList.Count > 0)
                    Console.WriteLine("解析的数据为：" + message.GetData());
                clientSocket.BeginReceive(message.Data, message.StartIndex, message.RemainSize, SocketFlags.None, receiveCallBack, clientSocket);        // 处理粘包
            } catch (Exception e) {
                Console.WriteLine(e);
                if (clientSocket != null) {
                    clientSocket.Close();       // 异常关闭客户端连接
                }
            }
        }
        #endregion


        #region 同步通信
        /// <summary>
        /// 同步通信
        /// </summary>
        static void StartServerSync() {
            // 创建Socket对象用作通信
            Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            // 创建IP地址
            IPAddress ipAddress = IPAddress.Parse("127.0.0.1");             // ip
            IPEndPoint ipEndPoint = new IPEndPoint(ipAddress, 8088);        // ip + port

            // 绑定ip、监听客户端、接收客户连接
            serverSocket.Bind(ipEndPoint);        // 绑定ip和端口号
            serverSocket.Listen(10);      // 设置最长的连接请求队列长度
            Socket clientSocket = serverSocket.Accept();        // 接收一个客户端连接

            // 向客户端发送消息
            string msg = "hi (｡･∀･)ﾉﾞ";
            byte[] data = Encoding.UTF8.GetBytes(msg);
            clientSocket.Send(data);

            // 接收客户端的消息
            byte[] dataBuffer = new byte[1024];
            int count = clientSocket.Receive(dataBuffer);       // 接收到的数据存放到数组中，返回接收到的字节数
            string msgReceive = Encoding.UTF8.GetString(dataBuffer, 0, count);      // 转码接收到的数据

            Console.WriteLine(msgReceive);      // 打印接收到的数据

            // 关闭处理
            clientSocket.Close();       // 先关闭客户端
            serverSocket.Close();
        }
        #endregion
    }
}
