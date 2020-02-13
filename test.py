#!/usr/bin/env python3

"""
Simple exercise to construct a controller that controls the simulated Duckiebot using pose.
"""

import os
import time
import sys
import argparse
import math
import numpy as np
import gym
from gym import wrappers
from gym_duckietown.envs import DuckietownEnv


parser = argparse.ArgumentParser()
parser.add_argument('--env-name', default=None)
parser.add_argument('--map-name', default='testing_track.yaml')
parser.add_argument('--no-pause', action='store_true', help="don't pause on failure")
parser.add_argument('--reverse', default=False)
args = parser.parse_args()

if args.env_name is None:
    env = DuckietownEnv(
        map_name=args.map_name,
        domain_rand=False,
        draw_bbox=False
    )
else:
    env = gym.make(args.env_name)

env = wrappers.Monitor(env, os.getcwd() + 'gym-duckietown/results/' + time.strftime("%H:%M:%S", time.localtime()) + '/', force=True)
obs = env.reset()
env.render()

total_reward = 0

steering = 0.5
speed = 0.1
start_angle = env.cur_angle

if args.reverse:
    speed = -0.1

while env.step_count < 50:

    if env.cur_angle >= start_angle + 6.28319:
        steering = -0.5
    if env.cur_angle <= start_angle:
        steering = 0.5

    obs, reward, done, info = env.step([speed, steering])
    total_reward += reward

    print('Steps = %s, Timestep Reward=%.3f, Total Reward=%.3f' % (env.step_count, reward, total_reward))

    env.render()


