close all; clear all; clc

run('../../params_data.m');

pkg load control
pkg load symbolic

syms k1 k2 s real;

G_armadura =
