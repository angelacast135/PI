
import numpy as np
import numpy.random as nprn
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from sklearn import metrics as mt
import math as math
import array
from scipy import signal
import scipy.io as sio
import pdb

# m_SignalsMat_laurier_micka
stn_record='laurier_micka'

class struct_MI:
    def __init__(self, means_mi_p, times_p, my_name_p):
        self.means_mi = means_mi_p
        self.times = times_p
        self.my_name = my_name_p
pdb.set_trace()
Fs = 256
events = sio.loadmat('./data/'+stn_record+'.mat')
v_TimeStartEvts = events['v_TimeStartEvts']
m_signals_mat = sio.loadmat('./data/m_SignalsMat_L13.mat')
m_signals_mat = m_signals_mat['m_SignalsMat']
st_Header = sio.loadmat('./data/st_Header_L13.mat')
st_Header = st_Header['st_Header']
st_Header = st_Header[0]; st_Header = st_Header[0]
st_Header = st_Header[9]
st_Header = st_Header[0]
my_list = []
my_name = []
pdb.set_trace()
for kk in range(0,6):
    # x_mat = sio.loadmat('./data/x_m_SignalsMat1.mat')
    # x = x_mat['x']
    x = m_signals_mat[kk] ###### EEG
    # x = np.random.rand(len(x))*2.5
    # y_mat = sio.loadmat('./data/y_m_SignalsMat8.mat')
    # y = y_mat['y']
    y = m_signals_mat[7] ######## EMG
    # y = np.random.randn(len(y))*2.5
    v_delay = np.arange(0,80)
    mean_mi = []
    time_mean = []
    for kkk in range(0,len(v_delay)): #####################
        mi = []
        for k in range(0,v_TimeStartEvts.shape[1]):
            t1 = int((v_TimeStartEvts[0,k]*Fs)+(Fs*0.5)); # -(Fs*2));  ####################################
            t2 = int(t1+(Fs*1.5))
            t3 = int((v_TimeStartEvts[0,k]*Fs)-(Fs*2)+(v_delay[kkk]*25)) 
            t4 = int(t3+(Fs*1.5))
            xn = x[t1:t2]
            yn = y[t3:t4]
            mi.append(mt.normalized_mutual_info_score(xn, yn))
        sio.savemat('./mi_delays/v_mi_L13_'+str(kkk)+'.mat', {'mi':mi})
        mean_mi.append(np.mean(mi))
        time_mean.append((v_delay[kkk]*25/256)-2)
    my_name.append(st_Header[kk][0])
    temp = struct_MI(mean_mi, time_mean,my_name)
    my_list.append(temp)
pdb.set_trace()
plt.figure()
for o in range(0, len(my_list)):
    a = my_list[o]
    times = a.times
    means = a.means_mi
    myName = a.my_name
    # plt.figure(o)
    plt.hold(True)
    plt.subplot(3,2,o+1)
    plt.plot(times,means)
    plt.ylabel('Norm_MI_Score')
    plt.title('Mutual Information, '+myName[o]+', '+stn_record)
    if o+1<5:
        plt.xticks([])
    else:
        plt.xlabel('Time [s]')

plt.show()


