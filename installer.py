#! /usr/bin/env python
# -*- coding: UTF-8 -*-

import sys
from subprocess import call

def get_lines_from_file(filename):
    lines = []
    with open(filename, "r") as f:
        all_lines = f.readlines()
    for line in all_lines:
        sanity = line.strip()
        if len(sanity) and sanity[0] != '#':
            lines.append(sanity)
    return lines

def get_dict_from_file(filename):
    lines = get_lines_from_file(filename)
    pkg_list = list()
    curr_pkg = -1
    curr_cmd = -1
    for line in lines:
        tmp = line.split('[')
        if len(tmp) == 3:
            curr_cmd += 1
            pkg_list[curr_pkg][1].append(list([tmp[2].split(']')[0], []]))
        elif len(tmp) == 2:
            curr_pkg += 1
            curr_cmd = -1
            pkg_list.append(list([tmp[1].split(']')[0], []]))
        elif len(tmp) == 1:
            pkg_list[curr_pkg][1][curr_cmd][1].append(line)
    return pkg_list

def call_command(lst):
    for cmd in lst:
        for arg in cmd[1]:
            for dup in cmd[0].split(','):
                call(dup.strip().split(' ') + [arg[0]] + arg[1])

if __name__ == "__main__":
    filename = None
    if len(sys.argv) == 1:
        filename = "requirements.txt"
    else:
        filename = str(sys.argv[1]).strip()
    lines = get_dict_from_file(filename)
    call_command(lines)
