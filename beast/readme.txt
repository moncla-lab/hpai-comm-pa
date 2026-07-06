README

D11 full genome alignment from nextstrain build with D1.1 seqs removed (be_w4 and ch_w1)

**The final version is what we went with for analysis was with 215 seqs from 4/29 \**
One iteration (it2) had a weird result, so reran an additional 2 iterations (1,3-5) and everything was consistent so used those 4 iterations for log combining/onward analysis.

All alignments and fastas have been removed for public git repository. All GISAID sequences have been cited in the gisaid acknowledgements table. Other sequences are from NCBI or produced from this project.



For the xml- I wanted jumps and rewards for states_grouped and dom_stat involving PA and LBM only. 
Had some iterations that were first not doing rewards and were also doing counts for reconstructing for the nt sequence which I think was making the files HUGE so I got rid of all of that too. 

Also had to make sure the run is outputting the jumps history log file 


Tried a couple things (4/28):
1) same as 4-23 but merged location to just PA, NY, NJ, and other + dom_stat + relaxed clock --use 314 w meta2
2) PA-dom, NY-dom, PA-unknown, NY-unknown, wild, other (which is all other dom or unknown), DTA + relaxed clock + jumps + rewards --use 314 w meta2
3) 4-29 remove all unknown, and do location_domstat PA-dom, NY-dom, all-wild, other-dom, + structured  BEAST2 --use 215w_meta
4)An additional modified version was run 5/13 that corrected the logging of jumps and rewards but was ultimately not used for analysis.
