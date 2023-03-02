#!/bin/bash

mv migration-tools.jar pub/jar
bin/signAllJarsOneByOne.sh cfg/calypsoJAWS.key calypso calypso pub/jar/migration-tools.jar
cd pub
cp me-launch.jnlp reportgenerator.jnlp

sed -i 's/<\/resources>/<jar href=\"jar\/migration-tools.jar\" main=\"yes\"\/><\/resources>/g' reportgenerator.jnlp
cp reportgenerator.jnlp messagegenerator.jnlp

sed -i 's/com.calypso.apps.startup.StartMainEntry/calypsox.testutils.reportgenerator.ReportGeneratorGUI/g' reportgenerator.jnlp
sed -i 's/com.calypso.apps.startup.StartMainEntry/calypsox.testutils.msggenerator.MessageGeneratorGUI/g' messagegenerator.jnlp

chmod 744 *.jnlp

sed -i 's/<h2><a href="dbbrowser-launch.jnlp">DB Browser<\/a><\/h2>/<h2><a href="reportgenerator.jnlp">Report Generator<\/a><\/h2><h2><a href="messagegenerator.jnlp">Message Generator<\/a><\/h2>/g' index.html

