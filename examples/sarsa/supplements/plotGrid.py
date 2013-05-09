import Grid22_Eegreedy1divn05_L1divn_S10000_R10000_D095_A4
import Grid22_Eegreedy1divn05_L1divn08_S10000_R10000_D095_A4
from pylab import *

fig = figure(1,(6,3))
fig.subplots_adjust(.13,.17,.76,.89,.05,.1)

params = {
            'backend': 'ps',
            #'backend': 'GTKAgg',
            'axes.labelsize': 15,
            'text.fontsize': 15,
            'xtick.labelsize': 15,
            'ytick.labelsize': 15,
            'text.usetex': True,
            'font.family': 'serif' }

rcParams.update(params)

subplot(221)
title(r'$\alpha = 1/n(s,a)$')
ylabel('$r$ $\mathrm{per}$ $\mathrm{step}$')

l1 = plot([100*(i+1) for i in range(100)],[ r/100. for r in Grid22_Eegreedy1divn05_L1divn_S10000_R10000_D095_A4.R[0]],"-k",label='Q')
l2 = plot([100*(i+1) for i in range(100)],[ r/100. for r in Grid22_Eegreedy1divn05_L1divn_S10000_R10000_D095_A4.R[1]],"-.k",label='Double Q')

leg = figlegend( (l1,l2), ('$\mathrm{Q}$', '$\mathrm{Double}$ $\mathrm{Q}$'), borderpad=0.1, labelspacing=0.1,borderaxespad=0., loc=(0.77,0.4) )
for t in leg.get_texts():
    t.set_fontsize('medium')    # the legend text fontsize

axis([1,10000,-1.15,0.2])
xticks([1,5000,10000],[])
yticks([-1,-0.5,0],['$-1.0$','$-0.5$','$0.0$'])


subplot(222)
title(r'$\alpha = 1/n(s,a)^{0.8}$')

plot([100*(i+1) for i in range(100)],[ r/100. for r in Grid22_Eegreedy1divn05_L1divn08_S10000_R10000_D095_A4.R[0]],"-k",label='Q')
plot([100*(i+1) for i in range(100)],[ r/100. for r in Grid22_Eegreedy1divn05_L1divn08_S10000_R10000_D095_A4.R[1]],"-.k",label='Double Q')

axis([1,10000,-1.15,0.2])
xticks([1,5000,10000],[])
yticks([-1,-0.5,0],[])


subplot(223)
xlabel('$\mathrm{Number}$ $\mathrm{of}$ $\mathrm{steps}$')
ylabel('$\displaystyle\max_a Q(S,a)$')

plot([100*(i+1) for i in range(100)],[Grid22_Eegreedy1divn05_L1divn_S10000_R10000_D095_A4.MaxQ[0][0][i] for i in range(100)],"-k",label='Q')
plot([100*(i+1) for i in range(100)],[Grid22_Eegreedy1divn05_L1divn_S10000_R10000_D095_A4.MaxQ[1][0][i] for i in range(100)],"-.k",label='Double Q')
plot([0,10000],[0.3626,0.3626],":k")
axis([1,10000,-8,18])
xticks([1,5000,10000],('$1$','$5 \\times 10^3$','$10^4$'))
yticks([0,10],['$0$','$10$'])


subplot(224)
xlabel('$\mathrm{Number}$ $\mathrm{of}$ $\mathrm{steps}$')

plot([100*(i+1) for i in range(100)],[Grid22_Eegreedy1divn05_L1divn08_S10000_R10000_D095_A4.MaxQ[0][0][i] for i in range(100)],"-k",label='Q')
plot([100*(i+1) for i in range(100)],[Grid22_Eegreedy1divn05_L1divn08_S10000_R10000_D095_A4.MaxQ[1][0][i] for i in range(100)],"-.k",label='Double Q')
plot([0,10000],[0.3626,0.3626],":k")

axis([1,10000,-8,18])
xticks([5000,10000],('$5 \\times 10^3$','$10^4$'))
yticks([0,10],[])

savefig("Grid.eps", format="eps")
#show()

