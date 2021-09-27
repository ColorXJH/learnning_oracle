--7：管理控制文件和日志文件
    oracle数据库包含数据文件，控制文件和日志文件3种类型的物理文件，其中数据文件用来存储数据，控制文件和日志文件哦你过来维护oracle数据库的正常运行
    1：控制文件的多路复用
      1：更改control_files参数
      alter system set control_files='C:\APP\COLORXJH\ORADATA\ORCL\CONTROL01.CTL','C:\APP\COLORXJH\FLASH_RECOVERY_AREA\ORCL\CONTROL02.CTL','E:\oracleFile\controlfiles\CONTROL03.CTL' scope=spfile;
      2：复制控制文件
            1：退出sqlplus环境，在系统中打开windows服务窗口，关闭OracleServiceORCL和OracleDBConsoleORCL,将之前的控制文件复制一份并重命名，然后再重启两个服务，打开sqlplus查询v$controlfile字典
     
    2：创建控制文件
         如果控制文件都丢失了，可以自己创建一个补救
         create controlfike reuse database db_name 
                logfile
                group 1 redofiles_list1
                group 2 redofiles_list2
                ...
                datafile
                datafile1
                datafile2
                ...
                maxlogfiles max_value1
                maxlogmembers max_value2  
                maxinstances max_value3
                maxdatafiles max_value4
                noresetlogs|resetlogs
                archivelog|noarchivelog;
                
                --db_name：数据库名称，通常是orcl
                --redofiles_list1:重做日志文件
                --datafile1:数据文件路径
                             --以下为永久性参数，若需要修改他们，需要重新创建控制文件
                --max_value1:最大重做日志文件数
                --max_value2:最大重做日志组成员数
                --max_value3:最大实例数
                --max_value4:最大数据文件数
                
                select * from v$controlfile;
                
                --1:查看数据文件和重做日志文件
                select member from v$logfile;
                select name from v$datafile; 
                
                --2:关闭数据库
                shutdown immediate
                
                --3:备份文件：备份所有的数据文件和重做日志文件
                
                --4：启动数据库实例
                startup nomount
                
                --5:创建新的控制文件
                        create controlfile reuse database "orcl" logfile group 1 ...
                --6:编辑参数
                   alter system set control_file='.....'  scope=spfile
                   
                --7：打开数据库
                   alter database open [resetlogs]
                
                
     3：备份和恢复控制文件
                   
                   
                   
                   
                            
                
