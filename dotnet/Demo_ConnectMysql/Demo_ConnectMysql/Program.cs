using System;
using System.Collections;
using System.Collections.Generic;
using Demo_ConnectMysql.Manager;
using Demo_ConnectMysql.Model;
using MySql.Data.MySqlClient;
using NHibernate;
using NHibernate.Cfg;

namespace Demo_ConnectMysql {
    class Program {
        static void Main(string[] args) {
            UserManager userManager = new UserManager();

            Console.WriteLine(userManager.VerifyUser("nekroz","12356"));

            Console.WriteLine("执行完毕");
            Console.ReadKey();      // 暂停
        }


        /// <summary>
        /// 测试mysql
        /// </summary>
        private static void testmysql() {
            string connectStr = "datasource=localhost;port=3306;database=demo;user=root;password=123456";   // 连接字符串
            using (MySqlConnection con = new MySqlConnection(connectStr)) {          // 用上面的字符串，实例化连接对象
                con.Open();     // 连接上Mysql

                string sql = "";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                //cmd.ExecuteReader();    // 执行查询
                //cmd.ExecuteNonQuery();      // 插入 删除
                //cmd.ExecuteScalar();    // 执行查询，返回单个值
                //MySqlDataReader reader = cmd.ExecuteReader();
                //while (reader.Read()) {
                //    Console.WriteLine(reader["id"].ToString() + reader["name"].ToString() + reader["ixmsg"].ToString());
                //}
                Console.WriteLine("已连接");
                con.Close();        // 关闭连接
            }
        }


        /// <summary>
        /// 测试NHibernate
        /// </summary>
        private static void testNHibernate() {
            var configuration = new Configuration();
            configuration.Configure();      // 解析nhibernate.cfg.xml
            //configuration.AddAssembly("Demo_ConnectMysql");     // 指定程序集（若在配置文件中新增mapping指定过程序集，此段代码可省略）

            ISessionFactory sessionFactory = null;      // （由NHibernate命名空间提供）
            ISession session = null;        // （由NHibernate命名空间提供）

            try {
                sessionFactory = configuration.BuildSessionFactory();      // 创建bhibernate和mysql会话的工厂
                session = sessionFactory.OpenSession();        // 打开一个跟数据库的会话
                User user = new User() { Name = "nekroz", Password = "123456" };       // 新建数据
                session.Save(user);     // 插入数据
            } catch (Exception e) {
                Console.WriteLine(e);
            } finally {
                if (sessionFactory != null)     // 关闭会话工厂
                    sessionFactory.Close();
                if (session != null)        // 关闭会话
                    session.Close();
            }
        }
    }
}
