--dml dcl ddl
sqlplus / as sysdba;
sqlplus 
conn scott/tiger

sqlplus -S walker/qwer@127.0.0.1@orcl @SQL.sql
#多实例 多数据库 sid导入环境变量导入  实例名
export ORACLE_HOME=/app/oracle/product/11.2.0
export ORACLE_SID=ora11g            #实例名 orcl 默认!!!!!!!!!!!!!!!!!!!!!
export PATH=$PATH:$ORACLE_HOME/bin
lsnrctl status  #监听状态 注意实例名!!!!和 home路径必须要有
lsnrctl start   #监听启动stop restart
sqlplus / as sysdba;
    --immediate shutdown db now;
    shutdown normal; 
    --start db  force;
    startup;     

--启动ora文件tablespace异常
alter database datafile 29 offline drop




STARTUP options | upgrade_options
options为：[FORCE] [RESTRICT] [PFILE=filename] [QUIET] [ MOUNT [dbname]
| [ OPEN [open_options] [dbname] ] | NOMOUNT ]，
NOMOUNT、MOUNT、OPEN为startup的三个阶段，不能在命令中同时存在。其中，open_options为：READ {ONLY
| WRITE [RECOVER]} | RECOVER。
upgrade_options为：[PFILE=filename] {UPGRADE | DOWNGRADE} [QUIET]
启动过程
启动数据库的步骤：
1，创建并启动例程，内存和服务进程得到分配，初始化和启动，初始化参数文件。由参数文件中初始化参数决定如何启动例程 startup nomount 2，装载数据库，打开数据库控制文件，并从中获取数据库名称，数据文件的位置和名称等关于数据库物理结构的信息，由参数文件找到控制文件，以便装载数据库startup mount 3，打开数据库，例程将打开所有处于联机状态的数据文件和重作日志文件。如果载控制文件中列出的任何一个数据文件或重作日志文件无法打开，数据库将返回错误信息，这时需要进行数据库恢复。startup open
启动数据库过程中，文件的使用顺序是：参数文件，控制文件，数据文件和重做日志文件。这些文件都正常时，数据库才能正常启动。
启动参数解释

shutdown normal、transactional、immediate、abort
缺省不带任何参数时表示是normal方式
关闭过程
关闭数据库步骤：
1，关闭数据库，oracle将重做日志高速缓存中的内容写入重做日志文件，并且将数据库高速缓存中被改动过的数据写入数据文件，然后再关闭所有的数据文件和重做日志文件，这时数据库的控制文件仍然处于打开状态，但是由于数据库处于关闭状态，所以用户无法访问数据库 2，卸载数据库，关闭数据库后，例程才能被卸载，控制文件再这个时候被关闭，但例程仍然存在 3，终止例程，进程终止，分配给例程的内存sga区被回收。
停止参数解释
shutdown normal
正常方式关闭数据库。
不允许新的连接、等待会话结束、等待事务结束、做一个检查点并关闭数据文件。启动时不需要实例恢复。
shutdown immediate
立即方式关闭数据库。 在SVRMGRL中执行shutdown immediate，数据库并不立即关闭， 而是在Oracle执行某些清除工作后才关闭(终止会话、释放会话资源)，
当使用shutdown不能关闭数据库时，shutdown immediate可以完成数据库关闭的操作。
不允许新的连接、不等待会话结束、不等待事务结束、做一个检查点并关闭数据文件。没有结束的事务是自动ROLLBACK的。启动时不需要实例恢复。
shutdown abort
直接关闭数据库，正在访问数据库的会话会被突然终止， 如果数据库中有大量操作正在执行，这时执行shutdown abort后，重新启动数据库需要很长时间。
shutdown transactional
不允许新的连接、不等待会话结束、等待事务结束、做一个检查点并关闭数据文件。启动时不需要实例恢复。
使用shutdown的时候 normal和immediate可能都因为连接没有释放而造成数据库无法重启的现象。
SQL>shutdown abort; --这个方法是不等待会话结束就直接关闭掉数据库，一般情况下事不推荐使用的。实在关不掉的话，一般也没有什么问题。跟直接KILL进程差不多。
SQL>startup --shutdown abort以后在启动数据库。
SQL>startup force; --这个方法是直接关闭掉数据库然后再重启数据库，这个方式也可以达到关闭并重启的目的。





D:\oracle\product\11.2.0\dbhome_1\NETWORK\ADMIN\SAMPLE


64位oracle安装，安装oracle xe，安装plsql，移动oci32 ，配置 oci dll 
E:\Oracle\instantclient_10_2
E:\oracle\instantclient_10_2\oci.dll 
localhost:1521/xe
--中文编码-环境变量
NLS_LANG
SIMPLIFIED CHINESE_CHINA.ZHS16GBK

  
-- 端口冲突问题
begin  
   dbms_xdb.sethttpport('8081');  
   dbms_xdb.setftpport('0');  
end;  




dbca  数据库管理
netca 监听管理

--删除数据库 报错 nt问题
权限管理员cmd执行dbca即可

--中文乱码问题2
$ sqlplus / as sysdba;
select userenv('language') from dual;
如果是：AMERICAN_AMERICA.WE8MSWIN1252  则需要调整编码格式为：AL32UTF8
SQL> shutdown immediate;
SQL> startup mount;
SQL> alter system enable restricted session;
SQL> alter system set job_queue_processes=0;
SQL> alter database open;
SQL> alter database character set internal_use AL32UTF8;
SQL> shutdown immediate;
SQL> startup
SQL>alter system disable restricted session;


 





