using System;
using System.Reflection;    // 反射类

namespace Study {

    class Program {
        static void Main(string[] args) {
            fun1();     // 反射调用有两个参数的方法
            fun2();     // 反射调用无参数的方法
            fun3();     // 反射调用有各种参数的方法
            fun4();     // 反射调用私有方法
            fun5();     // 反射获取/设置 - 字段/属性
            fun6();     // 反射获取一组类的字段/属性/方法成员

            Console.ReadKey();
        }


        /**
         * 反射调用有两个参数的方法
         */
        static void fun1() {
            // 获取类的类型Type
            // 方法一：使用字符串直接设置Type：命名空间.类名
            Type type = Type.GetType("Study.Box");
            // 方法二：使用typeof()函数获得类的Type
            //Type type = typeof(Box);
            // 方法三：使用类的实例去得到Type
            //Box box = new Box();
            //Type type = box.GetType();

            // 获取类中的方法
            MethodInfo method = type.GetMethod("Say1");

            // 实例化类
            object boxObj = Activator.CreateInstance(type);

            // 反射调用方法
            if (method != null) {
                // 方法一：传递创建好的object[]参数
                object[] parameters = new object[] { "---01", "---02" };
                method.Invoke(boxObj, parameters);
                // 方法二：传入当场创建的string对象参数
                method.Invoke(boxObj, new string[] { "---03", "---04" });
                // 方法三：传入的第一个参数，可以直接是Box的的实例，而不是Activator.CreateInstance(type);创造的实例
                Box box = new Box();
                method.Invoke(box, new string[] { "---05", "---06" });
            }

        }


        /**
         * 反射调用无参数的方法
         */
        static void fun2() {
            // 获取类
            Type type = typeof(Box);

            // 获取类中的方法
            MethodInfo method = type.GetMethod("Say2");

            // 实例化类
            object boxObj = Activator.CreateInstance(type);

            // 反射调用方法
            if (method != null) {
                method.Invoke(boxObj, null);     // 无参方法，传入null
            }

        }


        /**
         * 反射调用有各种参数的方法
         */
        static void fun3() {
            // 获取类
            Type type = typeof(Box);

            // 获取类中的方法
            MethodInfo method = type.GetMethod("Say3");

            // 实例化类
            object boxObj = Activator.CreateInstance(type);

            // 反射调用方法
            // 注：传入的参数obj，可以是实例的此类对象，如：Box box = new Box();的box传入
            if (method != null) {
                object[] parameters = new object[] { "---01", 1018, new Box() };
                method.Invoke(boxObj, parameters);     // 传入之前创建好的参数对象
            }

        }


        /**
         * 反射调用私有方法
         */
        static void fun4() {
            // 获取类
            Type type = typeof(Box);

            // 获取类中的方法 - 想要访问私有方法需设置第二个参数
            BindingFlags flags = BindingFlags.NonPublic | BindingFlags.Instance;
            MethodInfo method = type.GetMethod("Say4", flags);

            // 实例化类
            object boxObj = Activator.CreateInstance(type);

            // 反射调用方法
            if (method != null) {
                method.Invoke(boxObj, null);
            }

        }


        /**
         * 反射获取/设置 - 字段/属性
         */
        static void fun5() {
            // 获取类
            Type type = typeof(Box);

            // 获取类中的方法 - 想要访问私有方法需设置第二个参数
            BindingFlags flags = BindingFlags.NonPublic | BindingFlags.Instance;

            // 实例化类
            object boxObj = Activator.CreateInstance(type);

            // 1.获取/设置私有字段的值
            FieldInfo fi = type.GetField("_name", flags);
            fi.GetValue(boxObj);
            fi.SetValue(boxObj, "nekroz");
            // 2.获取/设置私有成员的值
            PropertyInfo pi = type.GetProperty("Name", flags);
            pi.GetValue(boxObj);
            pi.SetValue(boxObj, "nekroz");

            Console.WriteLine(fi.GetValue(boxObj));
            Console.WriteLine(pi.GetValue(boxObj));
        }


        /**
         * 反射获取一组类的字段/属性/方法成员
         */
        static void fun6() {
            // 获取类
            Type type = typeof(Box);

            // 获取类中的方法 - 想要访问私有方法需设置第二个参数
            BindingFlags flags = BindingFlags.NonPublic | BindingFlags.Instance;

            // 实例化类
            object boxObj = Activator.CreateInstance(type);

            // 1.获取所有的方法
            MethodInfo[] mis = type.GetMethods();
            // 2.获取所有的字段
            FieldInfo[] fis = type.GetFields();
            // 3.获取所有的属性
            PropertyInfo[] pis = type.GetProperties();

            // 遍历
            // 注：不设置BindingFlags时，只获取的时public成员
            // 注：遍历方法时，发现会有所有类都公有的4个方法：ToString、Equals、GetHashCode、GetType
            for (int i = 0; i < mis.Length; i++) {
                Console.WriteLine("方法名：" + mis[i].Name);
            }
            for (int i = 0; i < fis.Length; i++) {
                Console.WriteLine("字段名：" + fis[i].Name);
            }
            for (int i = 0; i < pis.Length; i++) {
                Console.WriteLine("属性名：" + pis[i].Name);
            }
        }
    }
}
