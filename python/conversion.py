#!/bin/python

import math

def to_meters(feet):
    return (2.504*12*feet)/100

def to_feet(meters):
    return (100*meters)/(2.504*12)

def to_degrees(radians):
    return (radians*180/math.pi)

def to_radians(degrees):
    return (degrees*math.pi/180)

def cos_c(a, b, c):
    return to_degrees(math.acos((a*a + b*b - c*c)/(2*a*b)))

def cos_c_efficient(a, b, c):
    return math.acos((a*a + b*b - c*c)/(2*a*b))

def find_angles(a, b, c):
    angles = []
    angles.append(cos_c(b,c,a))
    angles.append(cos_c(a,c,b))
    angles.append(cos_c(a,b,c))
    return angles

def find_angles_efficient(a, b, c):
    angles = []
    angles.append(cos_c_efficient(b,c,a))
    angles.append(cos_c_efficient(a,c,b))
    angles.append(cos_c_efficient(a,b,c))
    return angles

def find_auv_distance(base, hyp1, len1, hyp2, len2):
    triangle1 = find_angles_efficient(base, hyp1, len1)
    triangle2 = find_angles_efficient(base, hyp2, len2)
    mid_angle = math.pi - triangle1[2] - triangle2[2]
    other_angle = triangle1[2] + triangle2[2]
    distances = []
    demo1 = []
    demo2 = []
    demo1.append(base/math.sin(mid_angle)*math.sin(triangle1[2]))
    demo1.append(len1/math.sin(other_angle)*math.sin(triangle1[0]))
    demo2.append(base/math.sin(mid_angle)*math.sin(triangle2[2]))
    demo2.append(len2/math.sin(other_angle)*math.sin(triangle2[0]))
    distances.append(demo1)
    distances.append((demo1[0] + demo1[1])/2.0)
    distances.append(demo2)
    distances.append((demo2[0] + demo2[1])/2.0)
    demo3 = []
    demo4 = []
    demo3.append(hyp1 - distances[1])
    demo3.append(len1/math.sin(other_angle)*math.sin(triangle2[1] - triangle1[2]))
    demo4.append(hyp2 - distances[3])
    demo4.append(len2/math.sin(other_angle)*math.sin(triangle1[1] - triangle2[2]))
    distances.append(demo3)
    distances.append(demo4)
    distances.append((demo3[0] + demo3[1])/2.0)
    distances.append((demo4[0] + demo4[1])/2.0)
    answer = []
    answer.append(distances[1])
    answer.append(distances[3])
    return answer
