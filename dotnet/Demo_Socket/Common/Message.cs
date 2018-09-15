using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Common {
    public class Message {
        private byte[] data = new byte[1024];       // 读取到的数据
        private int startIndex = 0;                 // 位置索引

        public List<string> DataList = new List<string>();     // 解析后的数据

        public byte[] Data {
            get {
                return data;
            }
        }
        public int StartIndex {
            get {
                return startIndex;
            }
        }
        public int RemainSize {
            get {
                return data.Length - startIndex;
            }
        }


        /// <summary>
        /// 字符串转字符数组，并添加int类型的数据长度在前面
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static byte[] GetBytes(string data) {
            byte[] dataBytes = Encoding.UTF8.GetBytes(data);
            int dataLength = dataBytes.Length;
            byte[] lengthBytes = BitConverter.GetBytes(dataLength);
            byte[] newBytes = lengthBytes.Concat(dataBytes).ToArray();
            return newBytes;
        }

        /// <summary>
        /// 读取数据后，移动接收的数据位置
        /// </summary>
        /// <param name="count"></param>
        public void AddCount(int count) {
            startIndex += count;
        }

        /// <summary>
        /// 读取数据，根据头的数据设置的长度解析数据
        /// </summary>
        public void ReadMessage(int c) {
            // 移动开始位置的索引
            AddCount(c);

            while (true) {
                // 不足4字节，直接返回
                if (startIndex <= 4) return;

                // 解析数据
                int count = BitConverter.ToInt32(data, 0);      // 读取4位字节得到，这条数据的长度
                if ((startIndex - 4) >= count) {
                    string str = Encoding.UTF8.GetString(data, 4, count);     // 根据数据长度解析出数据

                    Array.Copy(data, count + 4, data, 0, startIndex - 4 - count);       // 读取到数据后，将后面的数据前移到前面0的位置
                    startIndex -= count + 4;        // 更新数据位置索引

                    DataList.Add(str);      // 存储数据到解析后的数据列表中
                } else {
                    break;
                }
            }
        }
        
        /// <summary>
        /// 获取解析后的数据列表中的数据
        /// </summary>
        /// <returns></returns>
        public string GetData() {
            string data = null;
            if (DataList[0] != null) {
                data = DataList[0];
                DataList.RemoveAt(0);
            }
            return data;
        }
    }
}
