import Roulette0_Eonebyone_L1divn_S17100K_R10_D095_A171
import Roulette0_Eonebyone_L1divn08_S17100K_R10_D095_A171
from pylab import *

params = {
            'backend': 'ps',
            #'backend': 'GTKAgg',
           'axes.labelsize': 15,
           'text.fontsize': 15,
           'xtick.labelsize': 15,
           'ytick.labelsize': 15,
           'text.usetex': True }
 
rcParams.update(params)


fig = figure(2,(6,1.8))
fig.subplots_adjust(.12,.27,.75,.82,.05,.1)

subplot(121)
title('$\\alpha = 1/n(s,a)$')
xlabel('$\mathrm{Number}$ $\mathrm{of}$ $\mathrm{trials}$')
ylabel('$\mathrm{Expected}$ $\mathrm{profit}$')

l1 = plot([1000*(i+1) for i in range(100)],_Roulette0_Eonebyone_L1divn_S17100K_R10_D095_A171.MeanQ[0][0],"-k",label='Q')
l2 = plot([1000*(i+1) for i in range(100)],_Roulette0_Eonebyone_L1divn_S17100K_R10_D095_A171.MeanQ[1][0],"-.k",label='Double Q')

axis([1,100000,-5,42])
xticks([1,50000,100000],('$1$','$5 \\times 10^4$','$10^5$'))
yticks([0,20,40],['$\$0$','$\$20$','$\$40$'])

leg = figlegend( (l1,l2), ('$\mathrm{Q}$', '$\mathrm{Double}$ $\mathrm{Q}$'), borderpad=0.1, labelspacing=0.1,borderaxespad=0.2, loc=(0.76,0.4) )
for t in leg.get_texts():
    t.set_fontsize('medium')    # the legend text fontsize

subplot(122)
title('$\\alpha = 1/n(s,a)^{0.8}$')
xlabel('$\mathrm{Number}$ $\mathrm{of}$ $\mathrm{trials}$')

plot([1000*(i+1) for i in range(100)],[ r for r in _Roulette0_Eonebyone_L1divn08_S17100K_R10_D095_A171.MeanQ[0][0]],"-k",label='Q')
plot([1000*(i+1) for i in range(100)],[ r for r in _Roulette0_Eonebyone_L1divn08_S17100K_R10_D095_A171.MeanQ[1][0]],"-.k",label='Double Q')

axis([1,100000,-5,42])
xticks([50000,100000],('$5 \\times 10^4$','$10^5$'))
yticks([0,20,40],[])

savefig("Roulette.eps", format="eps")
#show()

