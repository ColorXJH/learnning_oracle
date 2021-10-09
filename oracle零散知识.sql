--查询有多少用户
select * from dba_users
--创建一个新用户
create user scott identified by "2012WananXJH";  
--给用户授权
grant connect,resource,unlimited tablespace to scott;
--解锁用户
alter user scott account unlock;

--修改用户密码
alter user HR identified by "2012WananXJH";
