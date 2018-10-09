1、删除索引命令：curl -XDELETE 'http://IP:9200/索引名字'

2、创建删除七天前数据的脚本文件，并添加可执行权限。内容如下

```
#!/bin/bash

# es-index-clear

LAST_DATA=`date +%Y.%m.%d -d "7 days ago"`

curl -XDELETE "IP:9200/*-${LAST_DATA}"
```

3、创建定时任务

执行" crontab -e "，添加定时任务

`0 1 * * * /u01/cron/es-clear.sh`

