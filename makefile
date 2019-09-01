###########################################################################
#Copyright by snowlee , at 2019/9/1
# A main control for the whole project compile
###########################################################################

algorithm:
	make -C ./basealgo/src  all
algorithm_clean:
	make -C ./basealgo/src  clean
	
help:
	@echo =====make algorithm       ========
	@echo =====make algorithm_clean ========