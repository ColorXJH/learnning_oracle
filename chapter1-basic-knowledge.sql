--1:oracle 11g概述
           --1.1:oracle发展史概述
            oracle 西方翻译为“神谕，预言”，中国人翻译为“甲骨文”，oracle是一款强大而安全的数据库管理系统
           --1.2:关系型数据库的基本理论
            数据库管理技术经历了人工管理，文件系统，数据库系统3个阶段，在数据库系统中，数据模型主要有层次模型，网状模型，关系模型（面向对象模型还在探讨），关系模型是关系型数据库的理论基础
            关系型数据库是建立在关系模型基础上的数据库，在该类型数据库中，关系可以看成由行列交叉组成的二维表格
            关系是一种规范化的二维表格，具有如下性质：
            1：属性值具有原子性，不可分解
            2：没有重复的元组，即没有重复的行
            3：理论上没有行序，但是有时使用时可以有行序
            
            关键码：又称为键，通常是行（元组）的一个或者几个列（属性）组成，如果是一个列组成称为唯一键，如果由多个列组成称之为复合键，类型如下：
            1：超键：在一个关系中，能唯一标识元组的属性或属性集，称为关系的超键
            2：候选键：如果一个属性集能唯一标识元组，而且又不含多余的属性，那么这个属性集称为关系的候选键
            3：主键：如果一个关系中有多个候选键，则选择其中一个键作为关系的主键，主键可以实现关系定义中“表中任意两行不能相同”的约束
            4：外键：如果一个关系R中包含另一个关系A的主键所对应的属性组T,则称此属性组T为关系R的外键，并称关系A为参照关系，关系R是依赖关系
                     为了表示关联，可以将一个关系的主键作为属性放入另一个关系中。第二个关系中的那些属性就称为外键
                     当出现外键时，主键与外键的列名称可以是不同的，但必须要求他们的值集相同
                     
            这些二维表格中存储的数据通常以物理文件的形式存储在磁盘中，这种物理文件称为“数据文件”，用户可以使用一种数据库软件实现与磁盘上的数据文件进行交互，这种数据库软件被称为数据库管理系统DBMS
            DBMS是建立在操作系统基础上的，它可以对数据库文件进行统一的管理控制，用户对数据库的访问请求都是由DBMS来处理的，DBMS还提供了多种实用的管理数据的工具
            
            关系型数据库的E-R模型
                     关系型数据库的逻辑模型被称为E-R模型，主要有实体，属性，关系三部分组成
                     实体：是一个数据对象，用矩形表示
                     属性：属性用椭圆表示
                     关系：用连接线表示，包含一对一，一对多，多对多关系
                     
            关系型数据库的设计范式
                     1：第一范式
                      1：数据组的每个属性只可以包含一个值 --每一列都是不可分割的原子属性
                      2：关系中的每个数组必须包含相同数量的值 --每一行的属性列必须相同
                      3：关系中的每个数组一定不能相同 --每一行的类容不能相同
                     2：第二范式
                      1：数据库表中的每个实体必须可以被唯一的区分 --有区分列--》主键
                      2：实体的属性完全依赖于主关键字（主键），如果有其他属性不依赖，则需要将这些属性分离成新的实体，与原实体形成一对多关系
                     3：第三范式
                      1：关系表不存在非关键字列对任意候选关键字列的传递函数依赖--要求一个关系表中不包含已在其他表中已包含的非主关键字信息
                            --一个实体中存在：员工编号，员工姓名，年龄，部门编号，部门经理等信息
                            --如果创建一张员工表EMPLOYEE,使用员工编号作为主键，存在 员工编号-》决定-》（员工姓名，年龄，部门编号，部门经理）
                            --但是：存在非关键字段，部门编号-》决定-》部门经理，即存在：非关键字段（部门编号）对关键字段（员工编号）传递了函数依赖
                            --需要将该实体划分为两个表:员工信息表（员工编号，姓名。年龄，部门编号），部门信息表（部门编号，部门经理），目的是为了降低数据冗余
                           
                      
             orcle 11g的安装与卸载
                   oracle 11g数据库服务器是由oracle数据库软件和oracle实例组成，安装数据库服务器就是将管理工具，实用工具，网络服务和基本的客户端组件从安装盘复制到计算机硬盘的文件夹结构中，并创建
                   数据库实例，配置网络，和启动服务等
                   
             SQLPLUS的使用
                   配置oracle安装目录的bin路径到path,命令行运行cmd,然后sqlplus命令，然后输入用户名，密码，也可以使用一条命令登录
                   --sqlplus system/2012WananXJH@127.0.0.1:1521/orcl [as sysdba]   这种登录方式也是可以的
                   还可以使用：sqlplus / as sysdba,或者sqlplus/nolog 然后 conn system/2012WananXJH 连接到指定用户
                   可以指定启动文件 startup pfile='安装目录的admin路径下的pfile下面的init.ora'文件
                   
             启动与关闭数据库实例
                   启动：startup [nomount|mount|open|force][resetrict][pfile=filename]
                   --nomount:表示启动实例但是不加载数据库
                   --mount:表示启动实例，加载数据库并保持数据库的关闭状态
                   --open:表示启动实例，加载并打开数据库，这个是默认选项
                   --force:表示终止实例并重新启动数据库
                   --resetrict:用于指定以受限制的会话方式启动数据库
                   --pfile:用于指定启动实例时所使用的文本参数文件 filename就是文件名
                   startup启动时必须读取一个初始化参数文件
                   如果没有指定pfile,首先读取默认位置的服务器初始化参数文件spfile,若没有找到，则读取默认位置的文本初始化参数文件
                   
                   --eg:nomount模式
                   connect system/2012WananXJH as sysdba;--已连接（已 sysdba身份登录，才具有关闭和启动数据库实例的权限）
                   shutdown immediate--数据库已经关闭
                   startup nonmount--oracle例程已启动
                   
                   
                   --mount模式
                   shutdown immediate --（关闭数据库实例）
                   startup mount --oracle 例程已启动，数据库装载完毕
                   
                   --open模式
                   startup open --oracle例程已启动，数据库装载完毕，数据库已经打开
                   
                   --force模式
                   startup force --oracle例程已启动，数据库装在完毕，数据库已经打开（该模式具有一定强制性，在其他模式失效时可以尝试使用这种模式）
                   
                   
                  关闭:与启动相似，关闭数据库实例包含三个部分，分别是关闭数据库，卸载数据库，关闭oracle实例
                  shutdown [normal|transactional|immediate|abort]
                  --normal:表示以正常的方式关闭数据库
                  --transactional:表示在当前所有的活动事务被提交完毕后，关闭数据库
                  --immediate:表示在尽可能短的时间内立即关闭数据库
                  --abort:表示以终止方式来关闭数据库
                  
                  --eg:normal方式
                  shutdown normal --数据库已经关闭，已经卸载数据库，oracle例程已经关闭（1：阻止用户新建链接，2：等待当前连接用户主动断开连接，3：断开连接后，关闭数据库）
                  shutdown transactional--1:阻止用户新建连接，2：等待活动事务提交后，再断开当前用户连接，3：活动事务提交后，所有用户断开连接后，关闭数据库
                  shutdown immediate --1:组织用户新建连接，2：将未提交的活动事务回退，3：关闭数据库
                  shutdown abort --1:阻止用户新建连接，2：取消未提交的活动事务，而不是回退，3立刻终止正砸执行的任何sql语句，4：立即关闭数据库 --具有一定的强制性和破坏性
                  
                  
                  
--2:oracle 11g体系结构
           oracle数据库管理系统中有3个重要的概念，实例（instance） 数据库（Database） 数据库服务器（Database Server）                  
               实例：是指一组oracle后台进程以及在服务器中分配的共享内存区域
               数据库：基于磁盘的数据文件，控制文件，日志文件，参数文件，归档日志文件等组成的物理文件集合
               数据库服务器：管理数据库的各种软件工具（sqlplus,oem）,实例，以及是数据库三个部分
               实例用于管理和控制数据库，数据库为实例提供数据，一个数据库可以被多个实例装载和打开，一个实例在其生存周期内只能装载和打开一个数据库
               
               数据库存储数据的方式称为存储结构，oracle的存储结构分为逻辑存储结构和物理存储结构
               启动oracle数据库服务器实际上是在服务器的内存中创建一个oracle实例，然后用这个实例来控制访问磁盘中的数据文件，当用户连接到数据库时，实际上连接的是数据库的实例
               然后由实例负责与数据库进行通信，最后将结果返回给用户
               
               user process->server process->instance(shared pool,database buffer cache,redo log buffer cache)->database(database files)
               
               --逻辑存储结构
                                                                                     oracle数据库
                         数据库
                         表空间                                 表空间
                         逻辑对象                          表，索引，视图
                         数据段                           数据段 索引段 临时段 回滚段
                         数据区                           数据区
                         数据块                           数据块（oracle逻辑存储结构中最小的逻辑单位，也是执行输入输出操作的最小存储单位，它通常是操作系统块的整数倍，初始化参数为DB_BLOCK_SIZE）
                   
                   数据块（data blocks）（oracle逻辑存储结构中最小的逻辑单位，也是执行输入输出操作的最小存储单位，它通常是操作系统块的整数倍，初始化参数为DB_BLOCK_SIZE）           
                   select name,value from v$parameter where name='db_block_size' ;  --初始值为8192B
                   --数据块包含：1：块头，2：表目录，3：行目录，4：空余空间，5：行数据
                     
                   数据区(extent)：由一组连续的数据块构成，当一段中的所有空间被使用完毕后，oracle系统将自动为该段分配一个新的数据区，可见数据区是oracle存储分配的最小单位
                   oracle就是以数据区为单位进行存储空间的扩展
                   
                   数据段（segment）:由一个或多个数据区构成，是一个独立的逻辑存储结构，用于存储表，索引，簇等占用空间的数据对象
                   段（segment）是为特定的数据对象（表，索引，回滚等）分配的一系列数据区，通常有以下四种类型的段
                   --1：数据段：保存表中的数据记录
                   --2：索引段：包含用于提高系统性能的索引
                   --3：回滚段：保存了回滚条目，当一个事务开始处理时，系统为之分配回滚段
                   --4：临时段：当执行创建索引，查询等操作时，使用的临时存储空间   --create index /    select order by  /    seleect distinct  /  select group by 
                                                                                   oracle系统会在临时表空间中为这些语句的操作分配一个临时段
                                                                    
                   表空间：将相关逻辑结构（段，数据区等）组合在一起，表空间是数据库的最大逻辑划分区域，通常用来放表，索引，回滚段等数据对象，任何数据对象在创建时都必须指定存储在某个表空间中
                   表空间（逻辑存储结构）与数据文件（物理存储结构）相对应，一个表空间由一个或多个数据文件组成，一个数据文件只属于一个表空间，每个数据库至少包含一个表空间system表空间，
                   表空间的大小等于所有从属于它的数据文件大小的总和
                   --创建数据库时，oracle系统自动创建多个默认表空间： 如下
                   1：system表空间 --系统表空间
                               select * from dict;--数据字典信息
                               select * from v$fixed_view_definition;--数据库内部系统表信息
                   2：sysaux表空间 --辅助系统表空间
                   3：undo表空间   --撤销表空间
                   4：users表空间  --用户表空间，是oracle建议用户使用的表空间
                   
                   
                   
               --物理存储结构：大致上说：oracle的数据 在逻辑上存储在表空间中，在物理上存储在表空间所包含的物理文件（数据文件）中，包括：
                   1：数据文件 
                       select file_name,tablespace_name from dba_data_files; --查询oracle系统数据文件信息
                       --系统数据文件，撤销数据文件，用户数据文件
                       select file_name,tablespace_name from dba_temp_files; --查看oracle系统临时文件信息
                       
                   2：控制文件
                      一般由oracle系统安装或创建数据库时自动创建，位置由服务器参数文件spfileorcl.ora的control_files参数值来指定
                      出于安全考虑，在安装oracle数据库或者创建数据库时，会自动创建2-3个控制文件，确保某个控制文件损坏可以切换到另一个，如果所有都损坏则系统无法工作
                      select name from v$controlfile --查看系统控制文件信息
                      
                   3：日志文件
                      包含重做日志文件（redo log file）,归档日志文件（archive log file）
                                    重做：当用户执行commit命令时，数据库首先将每笔操作的原始记录写入到重做日志文件中，成功后，才把新的记录传递给应用程序
                                    --当对表，表空间设置NOLOGGING属性时，基于表，表空间的DML操作（创建表，删除视图，修改索引等操作），都不会产生日志信息
                                    select member from v$logfile;              
                                    oracle 系统在运行过程中产生的日志信息，首先被临时存放在系统的全局区的“重做日志缓冲区”中，当发出commit命令（或者缓冲区信息满1/3时）              
                                    LGWR(日志写入进程)将日志信息从重做日志缓冲区读出，写入日志文件中中序列号较小的文件中，写满接着写下一个，所有都写满则转入写向第一个
                      
                      
                                    归档：oracle有两个模式。归档模式和非归档模式，当所有的重做日志组被写满之后，在覆写第一个文件之前，由ARCH(归档进程)将即将被覆盖的日志文件中的信息读出
                                    并写入到归档日志文件中，在归档操作过程中，日志写入进程（LGWR）需要等待ARCH(归档进程)结束才能覆写文件，影响响应时间且日志本身占用磁盘空间，默认不采用归档模式运行
                                    
                                  
                     4：服务器参数文件
                        spfile(server parameter file)是二进制文件，用来记录oracle数据库的基本参数信息（数据库名，控制文件路径，日志缓冲区大小等），该文件在安装oracle数据库系统时由系统自动创建
                        名称为spfilesid.ora sid为数据库实例名
                        select * from v$parameter;--查看数据库服务器参数
                        修改服务器参数
                               通过OEM或alter system实现
                               alter system set db_block_size=4096;
                        
                        创建密码文件：                       
                        然后设置初始化参数remote_login_passwordfile控制密码文件使用状态：1：none:只要通过操作系统验证就无需oracle密码验证 2：shared:多个数据库实例都可以采用此密码验证
                        3：exclusive:只有一个数据库实例可以使用此密码验证
                        --eg:创建一个密码文件，其sys口令问012345，借助ORAPWD.EXE工具创建如下：
                        ORAPWD FILE=E:app\Admin\product\11.2\dbhome_1\database\PWDorcl.ora password=012345 entries=40
                        
                        警告文件：
                        select name,value from v$parameter where name='background_dump_dest';--查看警告文件的路径
                        
                        跟踪文件：
                        select value from v$parameter where name='user_dump_dest';--查看当前实例的用户跟踪文件路径
                        
                      
               --oracle 11g服务器结构       
                 oracle服务器由实例，数据库，程序全局区和前台进程组成，实例可进一步划分为系统全局区sga和后台进程，sga系统全局区又可以划分为：高速数据缓冲区，共享池，重做日志缓存区，java池，大型池，
                 数据库包含数据文件，控制文件，重做日志文件，程序全局区是一个非共享的内存区域，用于管理用户进程的私有资源，前台进程包含用户进程和服务器进程，     
                      高速数据缓冲区包括：脏数据区，空闲区，保留区
                      共享池包含：库高速缓冲区，字典告诉缓冲区
                      --修改共享池内存空间大小为30M
                      alter system set shared_pool_size=30m;
                      --修改大型池缓存区大小为16M
                      alter system set large_pool_size-16m;
                      show parameter large_pool_size;
                      --java池：java_pool_size,流池：stream_pool_size;
                      后台进程：
                           1:DBWR:数据写入进程
                           2:CKPT:检查点进程
                           3:LGWR:日志写入进程
                           4:ARCH:归档进程
                           5:SMON:系统监控进程
                           6:PMON:进程监控进程
                           7:LCKN:锁定进程
                           8:RECO:恢复进程
                           9:DNNN:调度进程
                           10:SNPN:快照进程
                           --查询当前实例进程信息
                           select name ,description from v$bgprocess;
                      
     
--数据字典
          数据字典是oracle存放关于数据库内部信息的地方，其用途是用来描述数据库内部的运行和管理情况。
          dba_:包含数据库实例的所有对象信息
          v$_:当前实例的动态视图，包含系统管理和系统优化等所使用的视图
          user_:记录用户的对象信息
          gv_:分布式环境下所有实例的动态视图，包含系统管理和系统优化使用的视图
          all_:记录用户的对象信息机被授权访问的对象信息                                 
           
          
                     
      

--SQLPLUS命令
          oracle的sqlplsu是与数据库进行交互的客户端工具，sqlplus是一个基于c/s两层结构的客户端操作工具，包括客户层（即命令行窗口）和服务器层（即数据库实例），这两层既可以在一台主机上
          也可以在不同的主机上
          sqlplus具备以下功能：
          1：定义变量，编写sql语句
          2：插入、修改、删除、查询，以及执行命令和pl/sql语句，比如show parameter
          3：格式化查询结构，运算处理，保存，打印机输出
          4：显示任何一个表的字段含义，并实现与用户进行交互
          5：完成数据库的几乎所有管理工作，比如：维护表空间和数据表
          6：运行存储在数据库中的子程序或包
          7：以sysdba身份登录数据库实例，可以实现启动/停止数据库实例
                          
                      
           
        --set 命令：设置sqlplus运行环境
        set system_variable value
        --system_variable:变量名    value:变量值
        set time on --谁知窗口前显示时间    
        set pagesize 20--设置一页的行数
        show pagesize
        set newpage 20--设置一页中空行的数量
        set linesize 80--设置一行显示的字符数
        set pause on/off/text--输出结果是否滚动
        set numformat (9/0/$/s/,)--设置数值显示格式
        
        select ename,job ,sal from scott.emp
                      
                      
                       
        --常用sqlplus命令
        1：help
        help|?[topic] --?表示一个命令的部分字符，topic表示命令的完整名称
        --eg：help startup
        help index--查看sqlplus命令清单
        
        
        2：describe
        describe obj_name --查询指定数据对象的组成结构 obj_name表示要查询对象的名称
        desc dba_tablespaces;
        
        select empno,ename,#desc scott.emp sal from scott.emp;--#desc scott.emp表示在查询过程中查看原对象结构
        
        3：spool:把查询结果输出到指定文件中
        spool [filename [.ext] [create|replace|append|] |off|out]
        --create表示创建一个新的脱机文件，默认
        --replace替换原文件
        --append追加脱机内容
        --off|out 关闭spool输出
        
        4：其他常用命令
        1：define 
        define [variable|variable=text] --定义一个变量名并可以给他分配一个char值
        define vjob='saleswoman'
        define vjob --查看
        
        2:show 命令--显示sqlplus系统变量的值或者环境变量的值
        
        3：edit:编辑sql缓冲区中的内容
        edit [filename.txt]
        --edit默认不写，表示编辑最近的一条 sql缓冲区语句，带文件表示编辑某文件中的sql语句
        -- / 斜杠表示执行sql缓冲区中最近一条sql语句
        
        4：save --将sql缓冲区中的最后一条sql语句或pl/sql块保存到一个文件中
        save file_name
        
        5：get --把一个sql脚本文件的内容放进sql缓冲区（替换不是追加），清空SQL缓冲区的话可以使用 clear buffer命令
        
        
        6：start和@命令
        都以可以用来执行一个sql脚本文件，
        start {url|file_name}[args...]
        @ {url|file_name}[args...]       
        
        
        
     --格式化查询结果
        1：column
        column [column_name|alias|option] --column_name:要设置的列的名称，alias:指定列的别名，option:指定某个列的显示格式，option包含如下：
               format/clear/heading/justfy/null/print/noprint/on/off/wrapped/word_wrapped/truncate
               
          --eg：
          col sal format $999,999.00  --设置列显示格式
          select empno,ename,sal from scott.emp; 
          
          col empno heading 雇员编号 --修改列标题
          select ename,empno from scott.emp;
          
          col comm null '空值' --指定一个列值如果为null，则设置成默认值‘空值’
          select ename,empno,comm from scott.emp where comm is null
          
          col sal off --控制定义显示属性状态
          col sal format $999,999.00
          col sal off
          select sal from scott.emp;
          
          wrapped/word_wrapped --折行，前者按照指定长度，后者按照完整字符串
          select loc from scott.dept;
          col loc format a5;
          col loc wrapped/word_wrapped;
          
          
          ttitle/btitle --设置头标题和尾标题
          ttitle [printspec [text|variable]...] |[off|on]
          --printspec:作为头标题的修饰性选项：
            text:报表头文字
            variable:在头标题中输出相应变量值
            off/on:禁止/允许打印头标题
            
            ttitle left '销售表情况排行'
            btitle left '打印日期： 2021-04-25'
            
            set pagesize 20;
            define vA='操作员A';
            define vB='操作员B';
            ttitle left vA;
            btitle left vB;
            SELECT * FROM SCOTT.EMP;
            
            
            
 --SQL语言基础
            SQL全称结构化查询语言STRUCTURED QUERY LANGUAGE,是一种在关系型数据库中定义和操纵数据的标准语言，特点：集合性，统一性，易于移植性，数据库的操作任务通常包含以下几个方面
            1：查询数据
            2：在表中插入，修改和删除记录
            3：建立，修改和删除数据对象
            4：控制对数据和数据对象的读写
            5：保证数据库一致性和完整性
            
            
            SQL语言的分类
            1：DQL:数据查询语言：主要包含select语句
            2：DML:数据操纵语言：主要包含INSERT,UPDATE,DELETE
            3：TCL:事务控制语言；主要包括COMMIT,ROLLBACK,SAVEPOINT
            4：DDL:数据定义语言：建立，修改，删除数据库对象，create table ,alter table,ddrop table
            5：DCL:数据控制语言：执行权限授予 grant/revoke
            
            
            --1:SQL语言编写规则：
            1：关键字不缺分大小写，
            2：对象名和列名不区分大小写 
            3：字符值区分大小写
            4：‘;’表示结束符
            
            --2：模式与模式对象
            oracle 数据库中为了方便管理用户所创建的数据库对象，引入了模式概念，这样某个用户创建的数据库对象就属于该用户模式
            模式是一个数据库对象的集合，为一个数据库用户所有，与用户和具有相同名称
            模式对象是由用户创建的逻辑结构，
            一个不属于某个用户所拥有的数据库对象就不能称之为模式对象，比如角色，表空间，目录，他们称之为数据库对象
            
            
            --检索数据格式，重要！！
            select {[distinct|all] columns |*} [into table_name] from {tables| views| other select} [where conditions] [group by columns] [having conditions] [order by columns]
            
            --select子句：用于选择数据表，视图中的列
            --into子句：用于将原表中的数据和结构插入新表中
            --from子句：用于指定数据来源，包括表，，视图，和其他select语句
            --where子句：用于对检索的数据进行筛选
            --group by子句：用于对检索的数据进行分组显示
            --having子句：用于对分组后的结果进行筛选
            --order by子句：用来对结果集进行排序(升序/降序)
            
            1：简单查询
                    1：查询所有列
                    select * from scott.emp;
                    2：查询指定列
                    select  ename from scott.emp;
                    3：带表达式select
                    select sal*(1+0.1),sal from scott.emp;
                    4：为列指定别名
                    select ename as "员工名称" from scott.emp;
                    5：显示不重复记录
                    select distinct job from emp;
                    
            2：筛选查询
                    1：比较筛选
                    select ename,job from scott.emp where sal>=1000;
                    2：使用特殊关键字筛选
                    select ename,job from scott.emp where ename like 's%' --like ,not .in ,between,is null,
                    3：逻辑筛选
                    select empno.ename,sal from scott.emp where sal>=2000 and sal <=4000;--where子句中使用逻辑运算符and ,or ,not
                    4：分组查询
                    select deptno,job,from emp group by deptno,job order by deptno;
                           --group by 子句常与聚合函数一起使用，如果select子句包含聚合函数，则分组中不包含该列，任意一个非聚合函数的列都必须与分组查询配合使用
                           --having 可以包含聚合函数，但是group by/ where不行
                    select deptno as 部门编号，avg(sal) as 平均工资 from scott.emp group by deptno having avg(sal)>200;
                    5：排序查询
                    select * from scott.emp  order by deptno desc --asc升序，desc降序 默认asc
                    6：多表关联查询
                           1：表别名
                             select e.ename from emp e;
                           2：内连接：一般使用 inner join ... on  ,也可以使用 join ... on
                             select e.ename, e.empno,d.dname from emp e, inner join dept d on e.deptno=d.depeno;
                             --等价于如下：  select e.ename, e.empno, d.dname from emp e,dept d where e.deptno=d.deptno;  （不带条件则为笛卡尔集）
                           3：外连接： 左外连接：left outer join /left join/select * from a,b where a.id=b.id(+)  --显示匹配行和左表的不匹配行
                                       右外连接：right outer join/ right join /select * from a,b where a.id(+)=b.id --显示匹配行和右表的不匹配行
                                       完全外连接： full outer join /full join /select  --是匹配部分和a,b不配备部分的合集
                                              --即：执行一个完整的左外连接和右外连接，然后将查询结果合并，并去除重复的记录行
                                       交叉连接：1：隐式：不显示 cross join 没有关联关系==笛卡尔集
                                                     select o.id ,o.order_number,c.id from orders o,customers c where o.id=1;--(注意这里没有关联关系) 
                                                 2：显示：带 cross join， 结果和隐式相同
                                                 3：交叉连接也叫笛卡尔集
                                       笛卡尔集：查询不带条件 --select * from emp, dept;(笛卡尔集： a表5条，b表6条，结果集5*6=30条) 
                               内连接只包含符合条件的行，外连接也包含不符合条件的行，交叉连接又称为笛卡尔积，
                            4：自然连接：检索多个表时，oracle会将第一个表中的列与第二个表中具有相同名称的列进行自动连接，用户不需要指定行连接的列
                                       select empno,ename,job,dname from emp natural join dept where sal>200;
                            5：自连接：自己与自己关联，比如某个列的值可能是另一行的列值    
                                       select em2.ename , em1.ename  from emp em1 left join emp em2 on em1.mgr=em2.empno order by em1.mgr;      
                                       
                            6：交叉连接：不需要任何连接条件的连接，他的执行结果是一个笛卡尔集，非常冗余，cross join 可以默认不写
                            
                            
            --3：oracle常用系统函数
            
            
            1：字符类函数
            ascii(c) --c表示一个字符，返回字符的ascii码
            chr(i)--i表示一个ascii码值，返回一个字符，
            
                     select ascii('g') from dual;
                     select chr(103) from dual;
            concat(s1,s2)--将字符串s2连接到s1后面，如果s1为null，则返回s2,如果s2为null,则返回s1，如果都为null,则返回null
                     select concat('1230','456') from dual;
            
            initcap(s)--将s的每个单词的第一个字母大写，其余小写
                     select  initcap('on my god') from dual;
            instr(s1,s2[,i][,j])--该函数用于返回字符串s2在s1中第j次出现的位置，搜索从s1的第i个字符开始，没有找到则返回0，i如果为负数则搜索从右往左进行，但是函数的返回位置
            --还是从左向右计算，s1,s2均为字符串，i,j均为正整数，默认值为1
                     select instr('xjh love yourself','your',1,1) as position from dual; --10
                     select instr('xjh love yourself','your',-1,1) as position from dual;--10
                     select instr('xjh love yourself','o',-1,1) as position from dual;--11
            length(s) --返回字符串s的长度，如果s为null,则返回值为null
                     select length('xjh love yourself') as lengths from dual;
            lower(s)/upper(s)--返回字符串s的小写/大写形式
                     select lower('XsjkwEE') as lowers, upper('XsjkwEE') as uppers from dual;     
            ltrim(s1,s2),rtrim(s1,s2),trim(s1,s2)--删除字符串s1左边的字符串s2,删除字符串s1右边的字符串s2,删除s1两侧的字符串s2,如果不指定s2,删除空格
                     select ltrim('xjhx','x') as lft, rtrim('xjhx','x') as rts,  trim(' xjh ') as trr from dual;         
            replace(s1,s2[,s3])--使用s3字符串替换s1字符串中所有s2字符串，并且返回替换后的心字符串，s3默认为空字符串
                     select replace('xjxx','x','X') from dual;   
            substr(s,i[,j])--从字符串s的第i个位置截取长度为j的子字符串，如果省略j,则默认直接截取到尾部，i，j为正整数
                     select substr('xjhloveyourself','0') as ft,substr('xjhloveyourself',1) as se from dual;   --从0和1开始是一样的
             
            
            2：数字类函数：常用如下
            abs(n) --返回n的绝对值
            ceil(n) --返回大雨或等于n的最小整数
            cos(n) --返回n的余弦值
            exp(n) --返回e的n次幂 e=2.718...
            florr(n) --返回小于或等于n的最大整数
            log(n1,n2) --返回以n1为底，n2的对数
            mod(n1,n2) --返回n1除以n2的余数
            power(n1,n2) --返回n1的n2次方
            round(n1,n2) --返回舍入小数点右边n2位的n1的值，n2默认为0，所以默认返回整数，如果n2为负数，则舍入到小数点左边相应位置，n2必须为整数
                         select round(123.445,2) as r1, round(12345.345,-3) r2 from dual  --123.45   12000
            sign(n) --若n为负数，则返回-1，若n为正数，则返回1，若n=0,则返回0
            sin(n) --返回n的正弦值，n为弧度
            sqrt(n) --返回n的平方根，n为弧度
            trunc(n1,n2) --返回结尾到n2位小数的n1值，n2默认设置为0，所以默认返回整数，若n2为负数，则截尾在小数点左边
                         select trunc(1234.567) as f1,trunc(1234.567,2) as f2,trunc(1234.567,-2)as f3 from dual; --1234  1234.56  1200
            
            
            3:日期和时间类函数
            add_months(d,i) --返回日期d加上i个月之后的结果，其中，i为任意整数
                         select add_months(sysdate, 2) as s1, add_months(sysdate,-2) as f2 from dual
                               
            last_day(d) --返回包含日期d月份的最后一天
                         select last_day(sysdate) as ld from dual; 
            months_between(d1,d2) --返回d1,d2之间的数目
                         select months_between(sysdate, last_day(sysdate)) from dual;                
            new_time(d1,t1,t2) --d1是日期类型数据，t1,t2是不同的时区，返回t2时区对应的时间
                         select new_time(sysdate,'GMT','PST') from dual;    --PST：美国太平洋标准时区，GMT:格林威治标准时区
            sysdate() --返回系统当前时间
                         select  sysdate s2 from dual;                       
                                  
                            
                    
            4:转换类函数
            chartorwida(s) --将字符串s转换为rwid数据类型 s为长度为18的字符串，必须符合rowid格式
                           select chartorowid('123456yhjuiklo9098') from dual;  
            convert(s,aset[,bset]) --将字符串a由bset字符集转换为aset字符集
                            select convert('xjh','WE8DEC','US7ASCII') FROM DUAL;                                             
            ROWIDTOCHAR() --将rowid数据类型转化为char类型
            to_char(x[,format]) --将表达式转换为字符串
                            select to_char(sysdate,'yyyy-mm-dd')  from dual;   
            to_date(x[,format]) --将字符串转换为date类型
                            select to_date('2021-04-26','yyyy/MM/dd') from dual;    
            to_number(x[,format]) --返回字符串代表队而数字，格式化
                            select to_number('18f','xxx') as 十进制 from dual;  --16进制数18f转换为十进制数结果
                            
            
            
            
            5：聚合类函数
            avg(x[distinct|all]) --平均值
            count(x[distinct|all]) --返回查询结果记录数
            max(x[distinct|all]) --最大值
            min(x[distinct|all]) --最小值
            sum(x[distinct|all]) --返回列表项数之总和
            variance(x[distinct|all]) --返回列表的统计方差
            stddev(x[distinct|all]) --返回选择列表的标准偏差
                                    select avg(sal), count(sal),max(sal),min(sal),sum(sal),variance(sal),stddev(sal) from scott.emp;
            
            
            
            
            
            
    --5：子查询用法
         某个查询需要依赖另一个查询结果
         在 select insert update delete 命令中允许是一个表达式的地方都可以包含子查询
         
         select empno,ename,job from scott.emp where deptno=(select deptno from scott.dept where dname='RESEARCH'); 
         select e.empno,e.ename,e.job from scott.emp e  INNER join SCOTT.dept d on e.deptno=d.deptno where d.dname='RESEARCH';
                --子查询结构清晰，多表关联效率更高
                --子查询也成为内查询，一般情况下，外查询检索一行，子查询就要检索一遍数据，所以要相对慢些
                --子查询必须用（）包裹起来，子查询中不能包含order by 子句，子查询中允许多层嵌套，但不能超过255层
                
                1：单行子查询：返回一行数据的子查询
                               select empno,ename,sal from scott.emp where sal>(select min(sal) from scott.emp) and sal <(select max(sal) from scott.emp)
                2：多行子查询：返回多行数据的子查询语句,where子句需要使用到 in any all
                               select empno ,ename ,job from scott.emp where deptno in (select deptno from scott.dept where dname<> 'SALES')
                               SELECT empno ,ename ,job from scott.emp where sal >any(select sal from scott.emp where deptno=10) and deptno<>10                               
                               select deptno,ename ,job from scott.emp where sal >all(select sal from scott.emp where deptno=30); 
                3：关联子查询：在一些特殊的子查询中，内查询的执行需要借助于外查询，而外查询的执行又离不开内查询的执行，这时内查询和外查询是相互关联的，这种子查询被称为关联子查询
                               --查询工资大于同职位平均工资的员工信息
                               select empno,ename,sal from scott.emp f where sal>(select avg(sal) from scott.emp where job=f.job) order by job;               
                               --关联子查询可以作为select insert update delete语句的关联子查询
                               
         6：操作数据库
                1：插入数据：insert 语句
                              1：单条插入： insert int table_name[(col1,col2....)]values(value1,value2...)
                              insert into scott.dept(deptno,dname,loc)values(88,'design','beijing'); 
                              select * from scott.dept;           
                              insert into scott.dept values(18,'newbee','guangde');
                              
                              
                              
                              2：批量插入数据： insert into table_name[cols1,cols2...] select Subquery
                              create table scott.table1(
                                     tab_no number(2),
                                     tab_name varchar2(20),
                                     tab_loc varchar2(20)
                              );
                              
                              insert into scott.table1 select * from scott.dept; --列明可以不相同，但是数据类型必须相同
                              select * from scott.table1;
                              
                              
                              3：更新数据：update table_name set col1=value1,col2=value2...col3=value3 where condition
                              update scott.emp set sal=(select avg(sal) from scott.emp where job='MANAGER') where sal<2000;
                              
                              4：删除数据：delete / truncate
                                            delete from table_name where condition
                                            delete from scott.table1 where tab_no='10' 
                                            --delete删除会产生回滚记录，可以使用rollback 来撤销
                                            
                                            truncate table scott.table1;
                                            --truncate 比delete快，他不会产生回滚记录
                                            truncate table scott.table1 reuse storage --删除后保留记录所占用空间
                                            truncate table scott.table1 drop storage  --删除后立刻回收记录占用空间，默认为该选项
                                            
                                       
                                         
                  2：事务处理
                  事务包含四种重要的属性：ACID(原子性，一致性，隔离性，持久性)
                                            原子性：atomic:数据库对事物的操作，要么全部成功要么全部失败，不可再分割
                                            一致性：condemoltent:事务在完成时，必须使所有的数据保持一致的状态
                                            隔离性：isolated:事务间所作的修改相互隔离
                                            持久性：durability:当事务提交后，对数据库所做的修改会永久保存下来
                                            
                              1：操作事务：通常在一下情况，oracle认为一个事务结束了
                                            1：执行commit语句提交事务
                                            2：执行rollback语句撤销事务
                                            3：执行一条数据库定义语句：create,drop,alter 等，这些语句执行成功会自动执行commit命令，失败会自动执行rollbak命令
                                            4：执行一个数据控制命令： grant,revoke 等，操作完毕oracle会自动执行commit
                                            5：正常断开数据库连接,退出sqlplus,=>commit，否则执行rollback命令
                                            
                                            
                                     提交事务:1:回滚段记录         2:日志写入进程lgwr写入重做日志文件        3：释放事务处理所用资源          4：显示通知，事务成功提交
                                     回滚事务:1:回滚段记录撤销对数据库的修改  2：oracle后台服务进程释放事务所占用资源    3：显示通知，事务回滚成功
                                     
                                     select * from scott.table1;
                                     insert into scott.table1 values(27,'text','hangzhou');
                                     savepoint sp;
                                     insert into scott.table1 values(29,'text2','hangzhou');
                                     select * from scott.table1;
                                     rollback to savepoint sp;
                                     commit;
                                     select * from scott.table1;
                                     
                                     
                                     
                                                  
-- 5:PLSQL编程
   Procedural Language/SQL 是Oracle在数据库中引入的一种过程化编程语言，PL/SQL在SQL之上，可以用来编写包含SQL语句的程序
   
   PL/SQL块结构
   
              declare
                           --声明部分，可选, 通常声明变量，常量，游标，某个块声明的内容只能在当前块使用
              begin
                           --执行部分，必须，主要逻辑和运算在此完成
              exception
                           --异常处理部分，可选
              end             
                       
              
              --例子如下
              
              declare 
                    a int:=100;
                    b int:=200;
                    c number;
              begin
                c:=(a+b)/(a-b);
                dbms_output.put_line(c);
              exception
                when zero_divide then
                dbms_output.put_line('除数不许为0');
              end;  
              -------------------------------------- sqlplus命令行端可以设置set serveroutput on   实现在服务器端显示执行结果
                                                   
              
            
            
     代码注释和标识符
          单行注释 --
          多行注释 /* */       
          
     PL/SQL字符集
          1：大小写字母a-z A-Z
          2：数字0-9
          3：非显示的字符：制表符，空格，回车
          4：数学符号：： + - * / > < =
          5：间隔符：(),{},[],?,!,;,:,@,#,%,$,&,
          --plsql程序不区分字母的大小写，
          
          
          
          
      数据类型与定义变量和常量
          基本数据类型: 
          
          1：数值类型：number(整数/浮点数) , pls_integer(整数) , binary_integer(整数)   --number(p,s) p表示有效数字，s表示小数点后几位 --number(9,2) :精度为9，刻度范围为2的变量
          number 类型由很多子类型： dec , decimal , double , integer , int , numeric , smallint , binary_integer , pls_integer 
          2：字符类型：varchar2 , char , long , nchar , nvarchar2 --存储字符串或者字符数据 VARCHAR2(MAXLENGTH)
                          VARCHAR2:存储可变长度字符串，maxlength=4000,长度大于4000字节的，在plsql中不能赋值给varchar2，需要赋值给long类型数据库变量
                          char:指定长度字符串 ，maxlength=32767 ,长度不足 后面用空格补全
                                       --数据库中的char只有2000字节，如果plsql中的char类型变量长度大于2000，则不能赋值给数据库中的char
                                       
                          LONG:存储可变的字符串，长度为32767，数据库的long类型可以存储的最大长度可达2G,，所以任何字符串变量哦都可以赋值给它
                          nchar/nvarchar2: 需要根据各国的字符集来确定
          3：日期类型：DATE：存储空间为7个字节，分别为：世纪，年，月，日，时，分，秒
          4：布尔类型：BOOLEAN：流程控制和业务逻辑判断 true/false/null
          
          特殊数据类型
          
          1：%type:声明一个与指定列名相同的数据类型，它通常紧跟在指定列名的后面
                                     declare 
                                           v_job scott.emp.job%type;
                                           v_name scott.emp.ename%type;
                                     begin
                                       select ename,job into v_name,v_job from scott.emp where empno=7369;
                                       dbms_output.put_line(v_name||'的职务是'||v_job);
                                     end; 
                                     
          2：record类型：记录类型，存储多列组成的一行数据，在声明记录类型变量之前需要定义记录类型，是义中结构化数据类型
                                     type record_type is record(
                                          v_number1 data_type [not null] [:=default_value],
                                          v_number2 data_type [not null] [:=default_value]
                                     )       
                                     --record_type:记录类型名称
                                     --v_number:记录的成员变量名称
                                     --data_type:成员变量的数据类型
                                     
                                     declare 
                                          type emp_type is record(
                                               v_ename varchar2(20),
                                               v_job varchar2(20),
                                               v_sal number
                                          );
                                          empinfo emp_type;
                                      begin 
                                        select ename,job,sal into empinfo from scott.emp where empno=7369;
                                        dbms_output.put_line('雇员'||empinfo.v_ename||'的职务是'||empinfo.v_job||'工资是'||empinfo.v_sal);    
                                      end;
            3：%rowtype类型：根据表中的行的结构定义一种特殊的数据类型，用来存储数据表中检索到的一行数据
                                      row_val table_name%rowtype;
                                      --row_val:表示可以存储一行数据的变量名
                                      --table_name:表名
                                      
                                      declare
                                              row_val scott.emp%rowtype;
                                      begin
                                        select * into row_val from scott.emp where empno=7369;
                                        dbms_output.put_line('雇员'||row_val.ename||'编号'||row_val.empno||'职务'||row_val.job);
                                      end;
            
              
            定义变量和常量
            1：定义变量： var_name v_type :=value;
                          --value_name:变量名
                          --type:数据类型
                          --value:初始值
                          
                          var_country varchar2(100) :='中国';                                    
            2：定义常量： v_name constant v_type:=value;
                          --v_name:常量名
                          --v_type:数据类型
                          --value:常量值
                          v_cons constant integer:=50;
                          
                          
                          
            流程控制语句
            1：选择语句
                          1：if...then
                          if condition_expression then
                             plsql_statement
                          end if;
                          
                          
                          declare 
                              v_name varchar2(100);
                              v_job varchar2(100);
                          begin
                            v_name:='xjh';
                            v_job:='kcy';
                            if length(v_name)> length(v_job) then
                              dbms_output.put_line('666');
                            end if;
                            dbms_output.put_line('777');
                          end;         
                         
                          2：if...then...else
                          if condition_expression then
                            plsql_statement;
                          else
                            plsql_statement;
                          end if;
                          
                          3：if...then...elsif...
                          if condition_expression then
                            plsql_statement;
                          elsif condition_expression then
                            plsql_statement;
                          end if;
                          
                          4：case
                          case selector
                            when expression1 then plsql_statement1;
                            when expression2 then plsql_statement2;
                            ...
                            when expressionn then plsql_statementn;
                            else expression;
                          end case;
                          
                          --eg
                          declare
                              seasion int:=3;
                              aboutinfo varchar2(50);
                          begin
                            case seasion
                              when 1 then aboutinfo:='第一季';
                              when 2 then aboutinfo:='第二季';
                              when 3 then aboutinfo:='第三季';
                              when 4 then aboutinfo:='第四季';
                              else aboutinfo:='未知季节';
                             end case;
                             dbms_output.put_line(aboutinfo);
                          end; 
                          
                2:循环语句
                          1：loop语句 --循环体至少执行一次
                          loop 
                            plsql_statement; 
                            exit when end_condition_exp
                          end loop;
                          
                          --eg
                          declare
                              sum_i int:=0;
                              i int:=0;
                          begin
                            loop
                              i:=i+1;
                              sum_i:=sum_i+i;
                              exit when i=100;
                            end loop;
                            dbms_output.put_line('前100个数的和是'||sum_i);
                          end;         
                          
                          
                          2：while语句
                          while condition_exp loop
                            plsql_statement;
                          end loop;
                                      
                          --eg
                          declare
                              sum_i int:=0;
                              i int:=0;
                          begin
                            while i<100 loop
                              i:=i+1;
                              sum_i:=sum_i+i; 
                            end loop;
                            dbms_output.put_line('前100：sum is :'||sum_i);
                          end;                            
                          
                          
                          3：for 语句
                          for var_name in [reverse] lower_limit...heigh_limit loop
                            plsql_statement;
                          end loop;
                          --reverse:反向计数
                          
                          --eg 
                          declare 
                              sum_i int:=0;
                          begin                   
                            for i in reverse 1..100 loop
                              if mod(i,2)=0 then 
                                sum_i:=sum_i+i;
                              end if;
                            end loop;
                            dbms_output.put_line('前100个数中偶数和为'||sum_i);
                          end;
                            
                          
               --plsql游标
               游标提供了一种从表中检索数据并进行操作的灵活手段，相当于指针，通过游标可以一次处理查询结果集中的一行，oracle中游标分为显示游标和隐式游标和引用游标ref游标
               
               1：显示游标
                          通常用作查询结果集，使用它的步骤包括：声明游标，打开游标，读取游标和关闭游标，读取可以反复操作，每次只能读取一行数据
                          1：声明游标
                          cursor cur_name[(input_param1,input_param2...)] [return ret_type] is select_statement
                          --cur_name:游标名称
                          --input_param1:输入参数
                          --ret_type:执行游标操作后的返回值类型
                          --select_statement:select 查询语句
                          2：打开游标
                          open cur_name[(input_param1,input_param2...)];
                          3:读取游标
                          fetch cur_name into {variable}; --每调用一次，指针将自动指向下一行数据
                          --variable:表示一个变量列表或者‘记录’record
                            --%found属性会在遍历完之后（指针指向最后时）值为false
                          4:关闭游标
                          close cr_name;
                          
                          --eg:
                          
                          declare
                               cursor cur_emp(v_job in varchar2:='SALESMAN') is select empno,ename,sal from scott.emp where job=v_job;
                               type v_record is record(
                                    v_empno scott.emp.empno%type,
                                    v_ename scott.emp.ename%type,
                                    v_sal scott.emp.sal%type
                               );
                               emp_record v_record;
                          begin
                            open cur_emp('MANAGER');
                            fetch cur_emp into emp_record;
                                  while cur_emp%found loop
                                    dbms_output.put_line(emp_record.v_ename||'的编号是'||emp_record.v_empno||'工资是'||emp_record.v_sal); 
                                    fetch cur_emp into emp_record;
                                  end loop;
                            close cur_emp;
                          end;      
                游标属性：
                          %found:布尔型：sql语句是否影响到一行数据
                          %notfound:布尔型
                          %rowcount:数字型：返回受sql语句影响的行数
                          %isopen:布尔型：游标是否打开
                          
                          
                隐式游标: 在执行一个sql时，oracle 会自动创建一个隐式游标，当使用隐式游标的属性时，需要在前面加上隐式游标默认名称--sql
                --eg
                begin 
                  update scott.emp set sal=sal*1.2 where job='SALESMAN';
                  if sql%notfound then
                    dbms_output.put_line('没有雇员需要上调薪资');
                  else
                    dbms_output.put_line('有'||sql%rowcount||'人上调了薪资');
                  end if;
                end;
                  
                ref游标：动态关联结果集的临时对象，在运行时动态决定执行查询
                      1：声明ref游标类型，确定ref游标类型
                                  1：强类型ref游标：指定return type,ref游标变量的类型必须和return type 一致
                                                      type ref_name is ref cursor return return_type;
                                  2：弱类型ref游标：不指定 return type,能和任意类型的cursor变量匹配，用于获取任何结果集
                                                      type ref_name is ref cursor;
                      2：声明ref游标变量
                          v_ref refCursor
                      3：打开ref游标
                      4：获取记录，操作记录
                      5：关闭游标
                      
                      --eg:强类型游标
                      declare
                          type myRefCursor is ref cursor return scott.emp%rowtype;
                          v_myref myRefCursor;
                          v_temp v_myref%rowtype;
                      begin 
                        open v_myref for select * from scott.emp where sal>2000;
                        loop
                          fetch  v_myref  into  v_temp;
                          exit when v_myref%notfound;
                          dbms_output.put_line(v_myref%rowcount||' '||v_temp.empno||' '||v_temp.ename||'  '||v_temp.sal );
                        end loop;
                        close v_myref;
                      end;                
                      --eg：弱类型游标
                      
                      declare
                        type week_cursor is ref cursor;
                        v_week_ref_cursor week_cursor;
                        v_empno scott.emp.empno%type;
                        v_ename scott.emp.ename%type;
                        v_sal scott.emp.sal%type;
                      begin
                        open v_week_ref_cursor for select empno,ename,sal from scott.emp where job='MANAGER';
                        loop
                          fetch v_week_ref_cursor into v_empno,v_ename,v_sal;
                          exit when v_week_ref_cursor%notfound;
                          dbms_output.put_line(v_week_ref_cursor%rowcount||'  '||v_ename||' '||v_empno||' '||v_sal);
                        end loop;
                        close v_week_ref_cursor;
                      end;
                
                通过for语句循环游标
                      --eg：for语句循环隐式游标
                      begin
                        for emp_record in (select empno,ename,sal from scott.emp where job='MANAGER')  
                          loop
                            dbms_output.put_line('雇员编号'||emp_record.empno||'雇员姓名'||emp_record.ename||'雇员薪水'||emp_record.sal);
                          end loop;
                      end;
                      --eg：for语句循环显示游标
                      declare
                          cursor cus_emp is select * from scott.emp where deptno=30;
                      begin
                        for emp_record in cus_emp 
                          loop
                            dbms_output.put_line('雇员编号'||emp_record.empno||'雇员姓名'||emp_record.ename||'雇员薪水'||emp_record.sal);
                          end loop;
                      end;
                      
                      
               PL/SQL异常处理
                      异常处理代码通常放在plsql的exception代码块中，oracle系统异常分为两大类
                      1：预定义异常
                          --eg:
                          declare 
                              v_empno number;
                              v_ename varchar2(20);
                          begin
                            select empno,ename into v_empno,v_ename from scott.emp where deptno=10;
                            if sql%found then 
                              dbms_output.put_line('雇员编号'||v_empno||'雇员姓名'||v_ename);
                            end if;
                            
                          exception
                            when too_many_rows then
                              dbms_output.put_line('记录超过一条');
                            when no_data_found then
                              dbms_output.put_line('无记录');  
                          end;
                      2：自定义异常
                          --eg:1:错误编号异常 （该错误编号为系统内部提供的错误编号）
                          declare
                              primary_exp exception;
                              pragma exception_init(primary_exp,-00001);
                          begin
                            insert into scott.dept values(10,'软件开发部','深圳');
                           
                          exception
                            when primary_exp then
                                dbms_output.put_line('主键不允许重复'); 
                          end;
                          
                          --eg:2:业务逻辑异常
                          declare
                               null_exp exception;
                               dept_row scott.dept%rowtype;
                          begin
                            dept_row.deptno:=66;
                            dept_row.dname:='公关部';
                            insert into scott.dept values(dept_row.deptno,dept_row.dname,dept_row.loc);
                            if dept_row.loc is null then 
                              raise null_exp;
                            end if;
                          
                          exception
                            when null_exp then 
                              dbms_output.put_line('字段不允许为空');
                              rollback;
                          end;
                          
                        
                      
                      
                      
                      
     --6:过程、函数、触发器、包
     前面看到的PL/SQL块都是匿名的，无法保存到oracle数据库中，命名的PL/SQL程序块可以被独立编译并存储在数据库中，oracle提供了四种可存储的PL/SQL程序块：过程、函数、触发器、包
     
                          1：存储过程
                          create [or replace] procedure pro_name[(param1[,param2]...)] is|as
                          begin 
                            plsq_statement;
                          [exception]
                            [dowith_sentences;]                      
                          end [pro_name];
                          --param1:存储过程的参数，若是输入参数，需要在其后指定in关键字，若是输出参数，需要在其后指定out参数，in/out 后面的是参数类型，但不指定长度
                          
                          --eg
                          create or replace procedure pro_insertDept is
                          begin
                            insert into scott.dept values(32,'市场部111','beijing');
                            commit;
                            dbms_output.put_line('success');
                          
                          end pro_insertDept;
                          --plsql中调用
                          call pro_insertDept();
                          --命令行使用如下
                          execute/exec pro_insertDept;
                          --也可以在pl/sql块中调用存储过程
                          
                          begin
                            --一下两种情况都可以
                            --pro_insertDept;
                            pro_insertDept();                           
                          end;
                          
                         2：存储过程的参数
                            1：in 模式参数 
                            关键字in 位于参数名称之后
                            create or replace procedure insert_dept(num_deptno in number, var_ename in varchar2, var_loc in varchar2 ) is
                            begin 
                              insert into scott.dept values(num_deptno,var_ename,var_loc);
                              commit;
                            end insert_dept; 
                            --调用存储过程
                            call insert_dept(44,'xjh','shanghai');
                            --查询
                            select * from dept;
                            
                            2：out模式参数
                            create or replace procedure select_dept(num_deptno in number, var_dname out scott.dept.dname%type, var_loc out scott.dept.loc%type) is 
                            begin
                              select dname,loc into var_dname,var_loc from scott.dept where deptno=num_deptno;
                            exception
                              when no_data_found then
                                dbms_output.put_line('该部门编号不存在');
                            end select_dept;
                            
                            
                            --调用带out参数的存储过程：先定义变量
                            declare
                               var_dname scott.dept.dname%type;
                               var_loc scott.dept.loc%type;
                            begin
                               select_dept(44,var_dname,var_loc);
                               dbms_output.put_line(var_dname||'位于：'||var_loc);
                            end;
                                 
                            3：in out模式参数
                            create or replace procedure pro_square( num in out number,flag in boolean) is
                            begin
                              if flag then
                                num:=power(num,2);
                              else
                                num:=sqrt(num);
                              end if;
                            end;
                            
                            --调用存储过程
                            declare
                              var_number number;
                              var_temp number;
                              boo_flag boolean;
                            begin
                              var_temp:=3;
                              var_number:=var_temp;
                              boo_flag:=false;
                              pro_square(var_number,boo_flag);
                              dbms_output.put_line('old is '||var_temp||', and new is '||var_number);
                            end;
                            
                            
                            
                            4:in 参数的默认值--声明的同时给出默认参数值
                            create or replace procedure insert_depp(num_deptno in number,var_dname in varchar2 default 'kcy', var_loc in varchar2 default 'sanlin') is                           
                            begin 
                              insert into scott.dept values(num_deptno,var_dname,var_loc);
                              commit;
                            end;
                            --调用存储过程
                            call insert_depp(33);
                            select * from scott.dept;
                            
                            --删除存储过程; drop procedure pro_name
                            drop procedure insert_depp;
                            
                           
                         2:函数：与存储过程比较类似，也是数据库中的命名程序块 --注意函数必须有返回值，但是存储过程是没有的
                            1：创建函数
                                   create [or replace] function fun_name[(parameter1 [,parameter2]...)] return data_type is 
                                      [inner)variable]
                                   begin 
                                     plsql_sentence;
                                   [exception]
                                     [do with sentences;]                                   
                                   end [fun_name]
                                   
                                   --fun_name:函数名称
                                   --parameter1,parameter2... 函数的参数，可选项，函数可以没有参数
                                   --data_type:函数的返回值类型，必选项，前面加关键字return
                                   --inner_variable:函数的内部变量，不同于函数的参数，也是个可选项
                                   --plsql_sentence:pl/sql语句，是函数的主体
                                   --dowith_sentence：异常处理代码
                                   
                                   --eg:
                                   create or replace function get_avg_pay(num_deptno number) return number is
                                          num_avg_pay number;
                                   begin
                                     select avg(sal) into num_avg_pay from scott.emp where deptno=num_deptno;
                                     return (round(num_avg_pay,2));
                                   exception
                                     when no_data_found then
                                       dbms_output.put_line('该部门编号不存在');
                                       return (0);
                                   end;
                                   
                                   --调用函数:用定义的变量值接收函数的返回值
                                   declare
                                       var_avg_pay number;
                                   begin
                                     var_avg_pay:= get_avg_pay(10);
                                     dbms_output.put_line('平均工资是'||var_avg_pay);
                                   end;
                                   
                                   
                                   3：删除函数：drop function func_name
                                   drop function get_avg_pay;
                                   
                                   
                                   
                          3:触发器：触发器可以看作是一个特殊的存储过程，它定义了一写与数据库相关的事件（insert/update/create等事件），发生时执行相应代码，用于管理复杂的完整性约束，监控对表的修改，
                          通知其他程序，实现对数据的审计功能
                          
                                   概述：触发器中的概念：触发事件，触发事件如下：执行DML语句(INSERT/UPDATE/DELETE...),执行DDL语句(CREATE/DROP/ALTER),引发数据库系统事件(系统启动/退出/产生异常，错误)
                                   引发用户事件(登录/退出数据库操作)
                                --语法格式如下：
                                create [or replace] trigger tri_name [before| after| instead of] tri_event  on table_name| view_name| user_name| db_name [for each row] [when tri_condition]
                                begin
                                  plsql_sentence;
                                end;   
                                
                                --trigger: 触发器关键字，后面跟触发器名称 tri_name
                                --before|after|instead of:触发时机 before 表示在DML操作之前触发，after表示在DML操作之后触发，instead of 表示触发器为替代触发器
                                --for each row：指定触发器为行级触发器
                                --tri_event:触发事件如：insert ,update,delete,drop,create....
                                --tri_conditon:触发条件表达式，条件为true时才会执行触发器
                                
                                oracle支持的触发器分为一下5种类型：
                                1：行级触发器 ：DML语句对每一行数据进行操作会引发触发器运行
                                2：语句级触发器：无论DML语句影响多少行，触发器紧执行一次
                                3：替换触发器：该触发器是定义咋视图上的，而不是定义在表上，它是用来替换所使用的实际语句的触发器
                                4：用户事件触发器：DDL操作或者用户登录，退出数据库--eg； alter.... /用户登录到数据库
                                5：系统事件触发器：oracle数据库系统事件--eg:oracle实例的启动或关闭
                                
                                
                                
                                --eg:语句级触发器
                                --1:建表
                                create table dept_log(
                                       operate_tag varchar2(10),
                                       operate_time date
                                )    
                                
                                
                                --2：创建一个触发器
                                create or replace trigger tri_dept before insert or update or delete on scott.dept
                                declare 
                                       var_tag varchar2(10);
                                begin
                                  if inserting then
                                    var_tag:='插入';
                                  elsif updating then
                                    var_tag:='修改';
                                  elsif deleting then
                                    var_tag:='删除';
                                  end if;
                                  insert into dept_log values(var_tag,sysdate);
                                  commit;
                                end; 
                                
                                --3验证 
                                insert into scott.dept values(26,'wxy','wuhu');
                                update scott.dept set loc='wuhuqifei' where deptno=26;
                                delete from scott.dept where deptno=26
                                select * from dept_log; 
                                
                                --在判断条件谓词时，可以具体到哪一列
                                --eg
                                if updatting(dname) then
                                  ...
                                end if;
                                
                                
                                --eg：行级触发器
                                create table goods(
                                       id int primary key,
                                       good_name varchar2(50)
                                );
                                
                                create sequence seq_good;
                                
                                create or replace trigger tri_insert_good before insert on goods for each row 
                                begin
                                  select seq_good.nextval into :new.id from dual;
                                end;
                                
                                
                                --在行级触发器中，可以访问当前正在受影响的数据行，可以通过列标识符来实现，分为：原值标识符/新值标识符，分别使用:old/:new来表示原始行/新值行
                                --:new.id/:old.id
                                
                                --验证:无论是否指定id,插入都是成功的,指定的id值并没有起作用，
                                insert into goods(good_name) values('苹果');
                                insert into goods(id,good_name)values(9,'葡萄');
                                
                                select* from goods;
                                
                                
                                
                                --eg：替换触发器，定义在视图
                                grant create view to scott;
                                
                                create view view_emp as select empno,ename,scott.dept.deptno,dname,job,hiredate from scott.emp,scott.dept where  scott.emp.deptno=scott.dept.deptno;
                                
                                select * from view_emp;
                                select * from scott.dept where deptno=10;
                                
                                create or replace trigger tri_insert_view instead of insert on view_emp for each row
                                declare
                                       row_dept dept%rowtype;
                                begin
                                       select * into row_dept from scott.dept where deptno=:new.deptno;
                                       if sql%notfound then
                                         insert into scott.dept(deptno,dname)values(:new.deptno,:new.dname);
                                       end if;
                                       insert into scott.emp(empno,ename,deptno,job,hiredate)values(:new.empno,:new.ename,:new.deptno,:new.job,:new.hiredate);
                                end;
                                    
                                --测试：
                                SELECT * FROM scott.emp;
                                --袋贴插入，执行自己的逻辑
                                insert into view_emp(empno,ename,deptno,dname,job,hiredate)values(8888,'东方',10,'ACCOUNTXJH','CASHIER',SYSDATE);
                                SELECT * FROM view_emp WHERE EMPNO=8888;
                          
                          
                                --eg：用户事件触发器
                                create table ddl_oper_log(
                                       db_obj_name varchar2(50),
                                       db_obj_type varchar2(50),
                                       oper_action varchar2(50),
                                       oper_user   varchar2(50),
                                       oper_date   varchar2(50)
                                );
                                
                                create or replace trigger tri_ddl_oper before create or alter or drop on scott.schema
                                begin
                                  insert into ddl_oper_log values(ora_dict_obj_name,ora_dict_obj_type,ora_sysevent,ora_login_user,sysdate);
                                end;
                                
                                --测试
                                create table tb_test(id number);
                                create view my_view1 as select * from scott.emp;
                                drop table tb_test;
                                drop view my_view1;
                                select * from ddl_oper_log;
                          
                          
                          
                          
                          
                         4:程序包：程序包由plsql程序元素（如变量，类型）和匿名plsql块（如游标），命名plsql块（如存储过程和函数）组成，程序包可以整体被加载到内存，
                         dbms_output.put_line就是程序包的一个具体应用，其中dbms_output是程序包，put_line是其中的一个存储过程，程序包通常由规范和包主体组成
                                
                                1：程序包规范：规定在程序包中可以使用哪些变量，类型，游标，子程序（各种命名的plsql块），语法格式如下
                                create or replace package pack_name is
                                [declare_variable];
                                [declare_type];
                                [declare_cursor];
                                [declare_function];
                                [declare_procedure];
                                end [pack_name];
                                
                                --pack_name:程序包的名称
                                --declare_variable:规范内声明的变量
                                --declare_type:规范内声明的类型
                                --declare_cursor:规范内定义的游标
                                
                                
                                --eg
                                create or replace package pack_emp is
                                       function fun_avg_sal(num_deptno number) return number;
                                       procedure pro_regulate_sal(var_job varchar2,var_num number);
                                end pack_emp;
                                
                                2:程序包的主体：包含了在规范中声明的游标，过程，函数的实现代码，以及一些内部变量，主体名称必须与规范名称相同，这样通过这个相同的名称Oracle就可以将规范和主体
                                结合在一起组成程序包，语法如下
                                create or replace package body pack_name is
                                       [inner_variable]
                                       [cursor_body]
                                       [function_title]
                                       {
                                          begin
                                            fun_plsql;
                                          [exception]
                                            [dowith_sentences;]  
                                          end [fun_name]
                                       }
                                       [procedure_title]
                                       {
                                          begin
                                            pro_plsql;
                                          [exception]
                                            [dowith_sentences;]
                                          end [pro_name]
                                       }
                                       ...
                                  end [pack_name]   
                                  
                                  
                                  --eg
                                  create or replace package body pack_emp is
                                         function fun_avg_sal(num_deptno number) return number is
                                           num_avg_sal number;
                                         begin
                                           select avg(sal)into num_avg_sal from scott.emp where deptno=num_deptno;
                                           return (num_avg_sal);
                                         exception
                                           when no_data_found then
                                             dbms_output.put_line('不存在该员工编号');
                                             return 0;
                                         end fun_avg_sal;
                                         
                                         procedure pro_regulate_sal(var_job varchar2,var_num number) is 
                                         begin
                                             update scott.emp set sal=sal*(1+var_num) where job=var_job;
                                         end pro_regulate_sal;
                                    end   pack_emp; 
                             
                         
                                         --创建程序包的规范和主题之后，就可以像普通的存储过程和函数那样调用了，
                                         declare
                                             num_deptno scott.emp.deptno%type;
                                             var_job scott.emp.job%type;
                                             num_avg_sal scott.emp.sal%type;
                                             var_num number;
                                         begin
                                           num_deptno:=10;
                                           num_avg_sal:=pack_emp.fun_avg_sal(num_deptno);
                                           dbms_output.put_line(num_deptno||'部门的平均工资是'||num_avg_sal);
                                           var_job:='SALESMAN';
                                           var_num:=0.1;
                                           pack_emp.pro_regulate_sal(var_job,var_num);
                                         end; 
                                                
                                         
                      
                           





















