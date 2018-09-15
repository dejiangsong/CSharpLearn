using System;
using System.Collections.Generic;
using System.Text;

namespace Study {
    class Box { 
        private string _name;   //字段
        private string Name { get; set; }   //属性

        public int _age;
        public int Age { get; set; }

        public void Say1(string a, string b) {  //两参数情况
            Console.WriteLine("111");
            Console.WriteLine(a);
            Console.WriteLine(b);
        }

        public void Say2() {    // 无参数情况
            Console.WriteLine("222");
        }

        public void Say3(string a, int b, Box box) {  // 不同类型参数的情况
            Console.WriteLine("444");
            Console.WriteLine(a);
            Console.WriteLine(b);
            box.Say2();
        }

        private void Say4() {    // 私有方法的情况，需要设置GetMethod()方法的第二个参数才能反射调用
            Console.WriteLine("333");
        }
        
    }
}
