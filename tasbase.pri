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

isEmpty(TASBASE_PRI) {
    TASBASE_PRI=1

    TAS_VERSION=2.0.0


    isEmpty(LOG_PATH) {
        LOG_PATH=/logs/testability/
    }
    isEmpty(LOG_SIZE) {
        LOG_SIZE=100000
    }
    isEmpty(SETTINGS_PATH) {
        win32: {
            SETTINGS_PATH=/qttas/conf
        } else {
            SETTINGS_PATH=/etc/testability
        }
    }
    isEmpty(SETTINGS_FILE) {
        SETTINGS_FILE=$$SETTINGS_PATH/qt_testability.ini
    }


    # Expose settings to code
    DEFINES*=LOG_PATH=\\\"$$LOG_PATH\\\"
    DEFINES*=LOG_SIZE=$$LOG_SIZE
    DEFINES*=SETTINGS_FILE=\\\"$$SETTINGS_FILE\\\"
    DEFINES*=SETTINGS_PATH=\\\"$$SETTINGS_PATH\\\"

    CONFIG(no_webkit) {
        DEFINES += NO_WEBKIT
    } else {
        !qtHaveModule(webkitwidgets): { # TODO: Verify that this works! module name could be different?
            CONFIG += no_webkit
            DEFINES += NO_WEBKIT
        }
    }

    CONFIG(debug_enabled) {
        DEFINES += DEBUG_ENABLED
    }

    # TODO: Nothing is using this macro
    CONFIG(qml_id){
        DEFINES += QML_ID
    }

    isEmpty(PREFIX) {
        unix:!macx:PREFIX=/usr
        macx:PREFIX=/usr/local
        win32:PREFIX=/qttas
    }

    isEmpty(PREFIX_PLUGINS) {
      PREFIX_PLUGINS = $$[QT_INSTALL_PLUGINS]/
    }

    TAS_TARGET_BIN=$$PREFIX/bin
    TAS_TARGET_LIB=$$PREFIX/lib ## (bin on windows?)
    TAS_TARGET_PLUGIN=$$PREFIX_PLUGINS # TODO: needs to be handled during install time
    win32: {
        TAS_TARGET_HEADERS=$$PREFIX/inc
    } else: {
        TAS_TARGET_HEADERS=$$PREFIX/include/tdriver
    }
    win32: {
        TAS_TARGET_STEPS=$$SETTINGS_PATH/../cucumber
    } else: {
        TAS_TARGET_STEPS=$$SETTINGS_PATH/cucumber
    }

    #TODO: verify that all install locations supported?
}
