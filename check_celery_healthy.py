#! /usr/bin/env python
import sys
import time
import xmlrpclib


class Monitor_Supervisor():
    def __init__(self,addr,process):
        self.client = xmlrpclib.ServerProxy(addr)
        self.info = self.client.supervisor.getProcessInfo(process)
        #self.fd = open('/opt/celery.txt','w+')

    def unix_datetime(self,inttime):
        temp = time.localtime(inttime)
        return time.strftime('%Y-%m-%d %H:%M:%S', temp)


    def write_file(self,str):
        fd = open('/opt/celery.txt','w+')
        fd.write(str)
        fd.flush()
        fd.close()
    
    def read_file(self):
        fd = open('/opt/celery.txt','r')
        last_start = fd.read()
        if not last_start:
            print("unable to get last_start then setting to defualt ")
            last_start = self.info.get('start')
        return int(last_start)

    def run(self):
        last_start = self.read_file()
        this_start = self.info.get('start')
        this_running = self.info.get('statename')
        this_stop = self.info.get('stop')
        #print last_start,this_start,this_running,this_stop,type(last_start),type(this_start)

        if this_running == 'RUNNING':
            if this_start == last_start:
                print("OK %s started at %s" % (process,self.unix_datetime(this_start)))
                sys.exit(0)
            else:
                print("Error %s old_start(%s)  and now_start(%s)")  % (process,self.unix_datetime(last_start),self.unix_datetime(this_start))
                self.write_file(str(this_start))
                sys.exit(2)
        else:
                print("BAD %s stoped at %s" % (process,self.unix_datetime(stop)))
                sys.exit(2)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("params need to be match 2")
        sys.exit(2)
    process=str(sys.argv[1])

    addr = 'http://hj:hj@127.0.0.1:8888/RPC2'
    super_admin = Monitor_Supervisor(addr,process)
    super_admin.run()
