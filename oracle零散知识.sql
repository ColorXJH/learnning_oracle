--��ѯ�ж����û�
select * from dba_users
--����һ�����û�
create user scott identified by "2012WananXJH";  
--���û���Ȩ
grant connect,resource,unlimited tablespace to scott;
--�����û�
alter user scott account unlock;

--�޸��û�����
alter user HR identified by "2012WananXJH";
