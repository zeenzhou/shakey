VERSION=`cat pom.xml|grep -e '<version>\(.*\)</version>'|head -n 1|sed  's/^.*<version>\(.*\)<\/version>/\1/g'`
echo $VERSION
MVN_OPTS="-Xmx1g" mvn -Dmaven.test.skip=true -DskipTests=true -Darguments="-DskipTests" -DBUILD_ID=`date +%Y%m%d_%H%M%S` -DBUILD_NUMBER=$BUILD_NUMBER -P production clean package
echo makensis -DSHAKEY_VERSION=$VERSION support/nsis/app.nsi
makensis -DSHAKEY_VERSION=$VERSION support/nsis/app.nsi
echo makensis -DSHAKEY_VERSION=$VERSION support/nsis/install.nsi
makensis -DSHAKEY_VERSION=$VERSION support/nsis/install.nsi
