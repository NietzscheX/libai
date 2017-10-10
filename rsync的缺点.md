* rsync 的一个大缺点是
* A disadvantage with Rsync synchronization is that normally directory and file moves result in a deletion of the move origin and a retransfer of the move destination of the wire.
* 幸好 lsyncd的rsyncssh可以解决这个问题 :D
* 使用方法 lsyncd -rsyncssh /home/USER/src REMOTEHOST TARGETDIR
