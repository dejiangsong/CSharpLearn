using System;
using System.Net;
using System.Net.Sockets;
using System.Text;
using Common;

namespace SocketClient {
    class Program {
        static void Main(string[] args) {
            ClientSendMessagePack();

            Console.ReadKey();
        }


        /// <summary>
        /// 客户端连接
        /// 控制端输入数据发送
        /// </summary>
        public static void ClientSendMessage() {
            Socket clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            // 连接到服务器端
            clientSocket.Connect(new IPEndPoint(IPAddress.Parse("127.0.0.1"), 8088));

            // 接收消息
            byte[] data = new byte[1024];
            int count = clientSocket.Receive(data);         // 会暂停在此接收数据
            string msg = Encoding.UTF8.GetString(data);

            Console.WriteLine(msg);     // 打印

            while (true) {
                // 发送数据到服务器端
                string str = Console.ReadLine();
                if (str == "/exit") {
                    // 关闭客户端
                    clientSocket.Close();
                    return;
                }
                clientSocket.Send(Encoding.UTF8.GetBytes(str));
            }
        }

        /// <summary>
        /// 客户端连接
        /// 循环发送小数据，产生粘包问题
        /// </summary>
        public static void ClientSendMessagePack() {
            Socket clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            // 连接到服务器端
            clientSocket.Connect(new IPEndPoint(IPAddress.Parse("127.0.0.1"), 8088));

            // 接收消息
            byte[] data = new byte[1024];
            int count = clientSocket.Receive(data);         // 会暂停在此接收数据
            string msg = Encoding.UTF8.GetString(data);

            Console.WriteLine(msg);     // 打印
            
            for (int i = 0; i < 100; i++) {
                clientSocket.Send(Message.GetBytes(i.ToString()));
            }

            clientSocket.Close();
        }
    }
}
