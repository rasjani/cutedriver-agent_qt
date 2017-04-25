############################################################################
##
## Copyright (C) 2010 Nokia Corporation and/or its subsidiary(-ies).
## All rights reserved.
## Contact: Nokia Corporation (testabilitydriver@nokia.com)
##
## This file is part of Testability Driver Qt Agent
##
## If you have questions regarding the use of this file, please contact
## Nokia at testabilitydriver@nokia.com .
##
## This library is free software; you can redistribute it and/or
## modify it under the terms of the GNU Lesser General Public
## License version 2.1 as published by the Free Software Foundation
## and appearing in the file LICENSE.LGPL included in the packaging
## of this file.
##
############################################################################


TEMPLATE = lib
TARGET = mobilitysfwfixture
CONFIG += plugin

include(../../tasbase.pri)

target.path = $$TAS_TARGET_PLUGIN/tasfixtures

DEPENDPATH += .
INCLUDEPATH += . ../../tascore/corelib

# Input
HEADERS += mobilitysfwfixture.h
SOURCES += mobilitysfwfixture.cpp
OTHER_FILES += mobilitysfwfixture.json

DESTDIR = lib

INSTALLS += target

LIBS += -L../../tascore/lib/ -lqttestability

CONFIG += mobility
MOBILITY += serviceframework
QT += xml widgets
