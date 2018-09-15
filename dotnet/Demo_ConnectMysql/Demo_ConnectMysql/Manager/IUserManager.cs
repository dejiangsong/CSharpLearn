using Demo_ConnectMysql.Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace Demo_ConnectMysql.Manager {
    interface IUserManager {
        void Add(User user);
        void Update(User user);
        void Remove(User user);
        User GetById(int id);
        User GetByName(string name);
        ICollection<User> GetAllUsers();
        bool VerifyUser(string name, string password);
    }
}
