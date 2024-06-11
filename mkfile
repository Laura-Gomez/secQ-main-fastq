<config.mk

RESULTADOS:V:	008-count-PerSample
	bin/summary_results
	 
008-count-PerSample:V:	006-count-all
##NIVEL7-COUNT-PERSAMPLE
	cd $target
	../bin/run-module 3

007-count-AllRun:V:	006-count-all
##NIVEL7-COUNT-ALLRUN
	cd $target
	../bin/run-module 3


005d-Quality-PerSample:V:	004-Quality
##NIVEL7-QUALITY-PERSAMPLE
	cd $target
	../bin/run-module 3

005c-Quality-PerProject:V:	004-Quality
##NIVEL7-QUALITY-PERPROJECT
	cd $target
	../bin/run-module 3
	
005b-Quality-PerLane:V:	004-Quality
##NIVEL7-QUALITY-PERLANE
	cd $target
	../bin/run-module 3

005a-Quality-AllRun:V:	004-Quality
##NIVEL7-QUALITY-ALLRUN
	cd $target
	../bin/run-module 1

006-count-all:V:	003-Rename-PerProject
##NIVEL4-COUNT
	cd $target
	../bin/run-module 3

004-Quality:V:	003-Rename-PerProject
##NIVEL4-QUALITY
	cd $target
	../bin/run-module 3

003-Rename-PerProject:V:	002-FASTQ-Organize
##NIVEL3
	cd $target
	../bin/run-module 1

002-FASTQ-Organize:V:	001-BCL2FASTQ
##NIVEL2
	cd $target
        ../bin/run-module 1

001-BCL2FASTQ:V:	init
##NIVEL1
	cd $target
	../bin/run-module 1

init:
# connect pipelines
	ln -sfn '../001-BCL2FASTQ/results' '002-FASTQ-Organize/data'
	ln -sfn '../002-FASTQ-Organize/results' '003-Rename-PerProject/data'
	ln -sfn '../003-Rename-PerProject/results' '004-Quality/data'
	ln -sfn '../003-Rename-PerProject/results' '006-count-all/data'
	ln -sfn '../004-Quality/results' '005a-Quality-AllRun/data'
        ln -sfn '../004-Quality/results' '005b-Quality-PerLane/data'
        ln -sfn '../004-Quality/results' '005c-Quality-PerProject/data'
	ln -sfn '../004-Quality/results' '005d-Quality-PerSample/data'
	ln -sfn '../006-count-all/results' '007-count-AllRun/data'
	ln -sfn '../006-count-all/results' '008-count-PerSample/data'





RESULTADOS-FASTQ:V:   008-count-PerSample-FromFASTQ
        bin/summary_results_fastq

008-count-PerSample-FromFASTQ:V:  006-count-all-FromFASTQ
##NIVEL7005a-Quality-AllRun-FromFASTQ-COUNT-PERSAMPLE
        cd $target
        ../bin/run-module 3

007-count-AllRun-FromFASTQ:V:     006-count-all-FromFASTQ
##NIVEL7-COUNT-ALLRUN
        cd $target
        ../bin/run-module 3

005d-Quality-PerSample-FromFASTQ:V:      004-Quality-FromFASTQ
        cd $target
        ../bin/run-module 3

005a-Quality-AllRun-FromFASTQ:V:  004-Quality-FromFASTQ
##NIVEL7-QUALITY-ALLRUN
        cd $target
        ../bin/run-module 1

006-count-all-FromFASTQ:V:        000-cp-FromFASTQ
        cd $target
        ../bin/run-module 3

004-Quality-FromFASTQ:V:   000-cp-FromFASTQ
        cd $target
        ../bin/run-module 1

000-cp-FromFASTQ:V:        init-FASTQ
        cd $target
        ../bin/run-module 1

init-FASTQ:
# connect pipelines
        ln -sfn '../000-cp-FromFASTQ/results' '004-Quality-FromFASTQ/data'
        ln -sfn '../000-cp-FromFASTQ/results' '006-count-all-FromFASTQ/data'
        ln -sfn '../004-Quality-FromFASTQ/results' '005a-Quality-AllRun-FromFASTQ/data'
        ln -sfn '../004-Quality-FromFASTQ/results' '005d-Quality-PerSample-FromFASTQ/data'
        ln -sfn '../006-count-all-FromFASTQ/results' '007-count-AllRun-FromFASTQ/data'
        ln -sfn '../006-count-all-FromFASTQ/results' '008-count-PerSample-FromFASTQ/data'


clean:V:
	rm -rf '001-BCL2FASTQ/results/' \
	'002-FASTQ-Organize/results/' '002-FASTQ-Organize/data' \
	'003-Rename-PerProject/results/' '003-Rename-PerProject/data' \
        '004-Quality/results/' '004-Quality/data' \
	'006-count-all/results/' '006-count-all/data' \
        '005a-Quality-AllRun/results/' '005a-Quality-AllRun/data' \
	'005b-Quality-PerLane/results/' '005b-Quality-PerLane/data' \
	'005c-Quality-PerProject/results/' '005c-Quality-PerProject/data' \
	'005d-Quality-PerSample/results/' '005d-Quality-PerSample/data' \
	'007-count-AllRun/results/' '007-count-AllRun/data' \
	'008-count-PerSample/results/' '008-count-PerSample/data' \
	'001-BCL2FASTQ/data/' \
	'000-cp-FromFASTQ/results/' \
	'004-Quality-FromFASTQ/data/' '004-Quality-FromFASTQ/results/' \
	'005a-Quality-AllRun-FromFASTQ/data/' '005a-Quality-AllRun-FromFASTQ/results/' \
	'005d-Quality-PerSample-FromFASTQ/data/' '005d-Quality-PerSample-FromFASTQ/results/' \
        '006-count-all-FromFASTQ/data/' '006-count-all-FromFASTQ/results/' \
        '007-count-AllRun-FromFASTQ/data/' '007-count-AllRun-FromFASTQ/results/' \
	'008-count-PerSample-FromFASTQ/data/' '008-count-PerSample-FromFASTQ/results/'	
