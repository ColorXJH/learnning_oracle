--7����������ļ�����־�ļ�
    oracle���ݿ���������ļ��������ļ�����־�ļ�3�����͵������ļ������������ļ������洢���ݣ������ļ�����־�ļ�Ŷ�����ά��oracle���ݿ����������
    1�������ļ��Ķ�·����
      1������control_files����
      alter system set control_files='C:\APP\COLORXJH\ORADATA\ORCL\CONTROL01.CTL','C:\APP\COLORXJH\FLASH_RECOVERY_AREA\ORCL\CONTROL02.CTL','E:\oracleFile\controlfiles\CONTROL03.CTL' scope=spfile;
      2�����ƿ����ļ�
            1���˳�sqlplus��������ϵͳ�д�windows���񴰿ڣ��ر�OracleServiceORCL��OracleDBConsoleORCL,��֮ǰ�Ŀ����ļ�����һ�ݲ���������Ȼ���������������񣬴�sqlplus��ѯv$controlfile�ֵ�
     
    2�����������ļ�
         ��������ļ�����ʧ�ˣ������Լ�����һ������
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
                
                --db_name�����ݿ����ƣ�ͨ����orcl
                --redofiles_list1:������־�ļ�
                --datafile1:�����ļ�·��
                             --����Ϊ�����Բ���������Ҫ�޸����ǣ���Ҫ���´��������ļ�
                --max_value1:���������־�ļ���
                --max_value2:���������־���Ա��
                --max_value3:���ʵ����
                --max_value4:��������ļ���
                
                select * from v$controlfile;
                
                --1:�鿴�����ļ���������־�ļ�
                select member from v$logfile;
                select name from v$datafile; 
                
                --2:�ر����ݿ�
                shutdown immediate
                
                --3:�����ļ����������е������ļ���������־�ļ�
                
                --4���������ݿ�ʵ��
                startup nomount
                
                --5:�����µĿ����ļ�
                        create controlfile reuse database "orcl" logfile group 1 ...
                --6:�༭����
                   alter system set control_file='.....'  scope=spfile
                   
                --7�������ݿ�
                   alter database open [resetlogs]
                
                
     3�����ݺͻָ������ļ�
                   
                   
                   
                   
                            
                
