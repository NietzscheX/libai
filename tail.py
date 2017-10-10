#! -*- coding:utf-8 -*-
import os
import sys 
import time

class Tail(object):
    def __init__(self,tail_file,new_line_flag='['):
        self.check_validate(tail_file)
        self.tail_file = tail_file
        self.callback = sys.stdout.write
        self._newlineflag = new_line_flag

    def follow(self,sleep=1):
        with open(self.tail_file) as f:
            f.seek(0,2)  #goto ending
            line_list = list()
            while True:
                curr_pos = f.tell()
                curr_line = f.readline()
                if not curr_line:
                    f.seek(curr_pos)
                    time.sleep(sleep)
                else:
    
                    if len(line_list) == 0:
                        line_list.append(curr_line)
                    else:
                        if curr_line.startswith(self._newlineflag):
                            full_str = ''.join('%s' %  line for line in line_list)
                            self.callback(full_str)
                            line_list = []
                            line_list.insert(0,curr_line)
                        else:
                            line_list.append(curr_line)
    
    

    def regist_callback(self,fun):
        self.callback=fun

    def check_validate(self,tail_file):
        if not os.access(tail_file,os.F_OK):
            raise TailError("File '%s' does not exist" % (tail_file))
        if not os.access(tail_file,os.R_OK):
            raise TailError("File '%s' not readable" % (tail_file))
        if  os.path.isdir(tail_file):
            raise TailError("Dir '%s' is not a file" % (tail_file))

class TailError(Exception):
    def __init__(self,msg):
        self.msg = msg 
    def __str__(self):
        return self.msg
