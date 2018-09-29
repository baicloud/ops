将cache.sh文件复制到/root/shell/目录下，并添加可执行权限

   命令解释：
   `free -m | awk 'NR==2' | awk '{print $3}'` : 获取命令 "free -m" 输出的第二行(awk 'NR=2')，最后打印第二行的第三个变量
   $free -le  2000 : free变量输出值是否小于2000
   sync
   
   强制将缓存数据写入磁盘
   echo 1 > /proc/sys/vm/drop_caches      # 释放网页缓存
   echo 2 > /proc/sys/vm/drop_caches      # 释放目录项和索引
   echo 3 > /proc/sys/vm/drop_caches      # 释放网页缓存，目录和索引

创建定时任务

  第一步：写cron脚本文件,命名为cache.cron。
  
  */2 * * * /root/shell/cache.sh  表示，每隔两小时执行一次命令（写脚本时不要写相对目录）
  
  第二步：添加定时任务。执行命令 “crontab cache.cron” 
  
  第三步："crontab -l" 查看定时任务是否成功或者检测/var/spool/cron下是否生成对应cron脚本
  注意：这操作是直接替换该用户下的crontab，而不是新增，编辑使用命令crontab -e
