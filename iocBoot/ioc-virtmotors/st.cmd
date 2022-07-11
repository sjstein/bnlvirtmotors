#!../../bin/linux-x86_64/virtMotors

< envPaths
< /epics/common/xf19id2-ioc1-netsetup.cmd

# Name of the DCM Energy virtual motor, and of related real motors
epicsEnvSet("ENGY",      "XF:19IDC-OP{Mono:DCM-Ax:E}Mtr")
epicsEnvSet("BRAGGMTR",  "XF:19IDC-OP{Mono:DCM-Ax:B}Mtr")
epicsEnvSet("PERPMTR",   "XF:19IDC-OP{Mono:DCM-Ax:Perp}Mtr")
epicsEnvSet("PARAMTR",   "XF:19IDC-OP{Mono:DCM-Ax:Para}Mtr")

# Name of the DCM 2nd Crystal Bend virtual motor, and of the two real motors
epicsEnvSet("C2BND",     "XF:19IDC-OP{Mono:DCM-Ax:C2Bnd}Mtr")
epicsEnvSet("C2BND1MTR", "XF:19IDC-OP{Mono:DCM-Ax:Bnd1}Mtr")
epicsEnvSet("C2BND2MTR", "XF:19IDC-OP{Mono:DCM-Ax:Bnd2}Mtr")

# Name of the DCM Fine Pitch piezo motor, and its real output
epicsEnvSet("FP",        "XF:19IDC-OP{Mono:DCM-Ax:FP}Mtr")
epicsEnvSet("FPDESC",    "Fine Pitch")
epicsEnvSet("FPMTR",     "XF:19IDC-CT{DIODE-Local:3}OutCh00:Data-SP")

# Name of the DCM Fine Roll piezo motor, and its real output
epicsEnvSet("FR",        "XF:19IDC-OP{Mono:DCM-Ax:FR}Mtr")
epicsEnvSet("FRDESC",    "Fine Roll")
epicsEnvSet("FRMTR",     "XF:19IDC-CT{DIODE-Local:3}OutCh01:Data-SP")

dbLoadDatabase("$(TOP)/dbd/virtMotors.dbd",0,0)
virtMotors_registerRecordDeviceDriver(pdbbase)

dbLoadRecords("$(TOP)/db/energy.template",      "P=$(ENGY),BRAGGMTR=$(BRAGGMTR),PERPMTR=$(PERPMTR),PARAMTR=$(PARAMTR)")
dbLoadRecords("$(TOP)/db/dcm_c2_bend.template", "P=$(C2BND),C2BND1MTR=$(C2BND1MTR),C2BND2MTR=$(C2BND2MTR)")
dbLoadRecords("$(TOP)/db/dcm_piezo.template",   "P=$(FP),DESC=$(FPDESC),MTR=$(FPMTR)")
dbLoadRecords("$(TOP)/db/dcm_piezo.template",   "P=$(FR),DESC=$(FRDESC),MTR=$(FRMTR)")

dbLoadRecords("$(IOCSTATS)/db/iocAdminSoft.db", "IOC=XF:19IDC-OP{VirtMotors}")

iocInit()

dbpf $(C2BND).SYNC 1
dbpf $(ENGY).SYNC 1
dbpf $(FP).SYNC 1
dbpf $(FR).SYNC 1
