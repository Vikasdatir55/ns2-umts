==========
Supplementary material for the paper ``Double Q-learning'' (Hado van 
Hasselt, 2010) as accepted for publication in Advances in Neural
Information Processing Systems, volume 23 (i.e., NIPS 2010).

The supplied source code can be freely used for all non-commercial
applications and academic research.
==========

The supplementary material includes:

1) This file:

Readme.txt

2) A proof for the overestimation for the single estimator:

overestimation.pdf

This proof can be seen as a generalization of the one referenced in the
paper.

3) The source code for the plots and experiments in the paper:

plotGrid.py
plotRoulette.py
Grid.py
Roulette.py
Run.py
RL.py
Roulette0_Eonebyone_L1divn_S17100K_R10_D095_A171.py
Roulette0_Eonebyone_L1divn08_S17100K_R10_D095_A171.py
Grid22_Eegreedy1divn05_L1divn_S10000_R10000_D095_A4.py
Grid22_Eegreedy1divn05_L1divn08_S10000_R10000_D095_A4.py

The plots in the Double Q-learning paper were made with Python with the
matplotlib library. See:

http://matplotlib.sourceforge.net/

These plots can be reproduced by running:

python plotGrid.py
python plotRoulette.py

These programs use the files Roulette0*.py and Grid22*.py which were
created with Grid.py and Roulette.py. These programs use Run.py to run
an experiment, which in turn uses RL.py which contains the algorithms,
the MDPs and more. One could also include different algorithms, such as
Sarsa in the plots, simply by replacing

algs = [ "Q", "DoubleQ" ]

with e.g.

algs = [ "Q", "DoubleQ", "Sarsa" ]

and making corresponding changes to the plot programs, e.g. replacing

l1 = plot((...)A4.R[0]],,"-k",label='Q')
l2 = plot((...)A4.R[1]],,"-.k",label='Double Q')

leg = figlegend( (l1,l2), (...) )

with

l1 = plot((...)A4.R[0]],,"-k",label='Q')
l2 = plot((...)A4.R[1]],,"-.k",label='Double Q')
l3 = plot((...)A4.R[2]],,":k",label='Sarsa')

leg = figlegend( (l1,l2.l3), (...) )

and so on.

Note that the Roulette0*.py and Grid22*.py contain more information
than is used in the paper. For instance, they contain the number of
times each action is chosen and the average Q value for each possible
action for each of the 100 data points (i.e. after each 100 steps in
the grid and after each 1000 trials in roulette).

Note that the programs Roulette.py and especially Grid.py take some
time to complete. If this takes prohibitively long, one can reduce the
number of runs, e.g. change

noRuns  = 10000

to something like

noRuns  = 1000

in Grid.py. This produces similar results with somewhat more noise.

You can of course also change things like the discount factor.
Q-learning especially dislikes higher discount factors: setting it to
0.99 increases the overestimation with polynomial learning rates in the
grid world from about 6 (as shown in the paper) to about 15. Double
Q-learning seems far less effected.
