#! /usr/bin/env python
import gearman
import sys


class Monitor_Gearman():
    def __init__(self,addr):
        self.addr = addr
        self.gm_admin_client = gearman.GearmanAdminClient(self.addr)

    def watch(self,process,max_queued):
        status = self.gm_admin_client.get_status()
        found = False
        if not status:
            print("gearman status is unkonwn")
            exit(2)
        for index in status:
            workers = index.get('workers')
            task = index.get('task')
            queued = index.get('queued')
            if task == process:
                found = True
                if queued < max_queued:
                    print("OK,current task(%s) with workers(%s) queued(%d<%d)" % (task,workers,queued,max_queued))
                    exit(0)
                else:
                    print("BAD,current task(%s) with workers(%s) queued(%d>=%d)" % (task,workers,queued,max_queued))
                    exit(2)
        if  not found:
            print("BAD,current task(%s) is not founed" % process)
            exit(2)
            




if __name__ == '__main__':
    addr = ['127.0.0.1:4730']
    gm_admin = Monitor_Gearman(addr)

    #set process and it's max allowded queued
    #task_list = {
    #            'default_process':200,
    #            'internal_default_process':200,
    #            }
    #for k,v in task_list.items():
    #    gm_admin.watch(k,v)

    if len(sys.argv) != 3:
        print("params need to be match 3")
        exit(2)
    process=str(sys.argv[1])
    max_queued=int(sys.argv[2])
    gm_admin.watch(process,max_queued)
