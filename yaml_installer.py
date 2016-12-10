#!/usr/bin/env python
# -*- coding: utf-8 -*-

import yaml
import sys
from subprocess import call

def get_lines_from_file(filename):
    with open(filename, "r") as f:
        all_lines = yaml.load(f)
    return all_lines

def get_dict_from_file(lines, prefix=''):
    storage = []
    for line in lines:
        if not isinstance(line, dict):
            storage.append(line)
            continue
        for key in line:
            val = line[key]
            if isinstance(val, dict):
                storage += [key, get_dict_from_file(val, key)]
            elif val is not None:
                if isinstance(val, list):
                    storage += [key, get_dict_from_file(val, key)]
                else:
                    storage += [key, [val]]
            else:
                storage += [key]
    return storage

def print_list_of_lists(lst, indent=0):
    for item in lst:
        if isinstance(item, list):
            print_list_of_lists(item, indent + 1)
        elif isinstance(item, dict):
            for key in item:
                print(' '*4*indent + key)
                print_list_of_lists(item[key], indent + 1)
        elif item is not None:
            print(' '*4*indent + item)

def call_command(lst, prefix="", noaction=False):
    for i, item in enumerate(lst):
        if isinstance(item, list):
            call_command(item, prefix + ' ' + lst[i-1], noaction)
        elif isinstance(item, dict):
            for key in item:
                call_command(item[key], prefix + ' ' + key, noaction)
        elif item is not None:
            if i + 1 == len(lst) or not isinstance(lst[i + 1], list):
                cmd = (prefix + ' ' + item).strip().split(' ')
                print(cmd)
                if noaction == False:
                    call(' '.join(cmd), shell=True)

if __name__ == "__main__":
    filename = None
    if len(sys.argv) == 1:
        filename = "requirements.txt"
    else:
        filename = str(sys.argv[1]).strip()
    lines = get_lines_from_file(filename)
    lst = get_dict_from_file(lines)
    # print_list_of_lists(lst)
    call_command(lst, noaction=False)
