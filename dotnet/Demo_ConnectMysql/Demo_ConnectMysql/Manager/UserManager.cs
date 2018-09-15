using System;
using System.Collections.Generic;
using System.Text;
using Demo_ConnectMysql.Model;
using Demo_ConnectMysql.Utils;
using NHibernate;
using NHibernate.Criterion;

namespace Demo_ConnectMysql.Manager {
    class UserManager : IUserManager {
        public void Add(User user) {
            using (ISession session = NHibernateHelper.OpenSession()) {
                using (ITransaction transaction = session.BeginTransaction()) {     // 使用事务(添加好像使用事务没什么用)
                    session.Save(user);
                    transaction.Commit();
                }
            }
        }

        public void Remove(User user) {
            using (ISession session = NHibernateHelper.OpenSession()) {
                using (ITransaction transaction = session.BeginTransaction()) {     // 使用事务
                    session.Delete(user);
                    transaction.Commit();
                }
            }
        }

        public void Update(User user) {
            using (ISession session = NHibernateHelper.OpenSession()) {
                using (ITransaction transaction = session.BeginTransaction()) {     // 使用事务
                    session.Update(user);
                    transaction.Commit();
                }
            }
        }

        public User GetById(int id) {
            using (ISession session = NHibernateHelper.OpenSession()) {
                User user = session.Get<User>(id);      // 查询，session通过Get<>指定User映射的表
                return user;
            }
        }

        public User GetByName(string name) {
            using (ISession session = NHibernateHelper.OpenSession()) {
                //ICriteria criteria = session.CreateCriteria(typeof(User));      // 创建准则(操作查询语句的类)，指定查询的表
                //criteria.Add(Restrictions.Eq("Name", name));     // 限制(查询条件)
                //User user = criteria.UniqueResult<User>();      // 返回满足条件的<User>类型结果
                /* 集合为一句 */
                User user = session.CreateCriteria(typeof(User)).Add(Restrictions.Eq("Name", name)).UniqueResult<User>();
                return user;
            }
        }

        public ICollection<User> GetAllUsers() {
            using (ISession session = NHibernateHelper.OpenSession()) {
                IList<User> users = session.CreateCriteria(typeof(User)).List<User>();
                return users;
            }
        }

        public bool VerifyUser(string name, string password) {
            using (ISession session = NHibernateHelper.OpenSession()) {
                //ICriteria criteria = session.CreateCriteria(typeof(User));      // 创建准则(操作查询语句的类)，指定查询的表
                //criteria.Add(Restrictions.Eq("Name", name));     // 限制(查询条件)
                //User user = criteria.UniqueResult<User>();      // 返回满足条件的<User>类型结果
                /* 集合为一句 */
                User user = session.CreateCriteria(typeof(User))
                    .Add(Restrictions
                    .Eq("Name", name))
                    .UniqueResult<User>();
                return user.Password == password;
            }

        }
    }
}
