TOP=../..

include $(TOP)/configure/CONFIG

PROD_IOC = virtMotors

DBD += virtMotors.dbd

virtMotors_DBD += base.dbd
virtMotors_DBD += motorSupport.dbd devSoftMotor.dbd
virtMotors_DBD += devIocStats.dbd

virtMotors_LIBS += motor softMotor
virtMotors_LIBS += devIocStats

virtMotors_SRCS += virtMotors_registerRecordDeviceDriver.cpp
virtMotors_SRCS += virtMotorsMain.cpp

virtMotors_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
