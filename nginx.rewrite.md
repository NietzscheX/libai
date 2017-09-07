- 需要重写诸如topic.php?topic_id=2816 到 topic.php?topic_id=425
- 如果直接写rewrite topic.php?topic_id=2816   topic.php?topic_id=425 permanent; 是失败的，因为默认只识别到.php结尾，
- 问号后面的被忽略了。

- 应该用
* 15     if ($query_string ~* "topic_id=2816" ){
* 16        rewrite ^/mobile/topic\.php    /mobile/topic.php?topic_id=425 break;
* 17     }
