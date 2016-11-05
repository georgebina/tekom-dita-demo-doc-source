#!/bin/bash

echo "Publish $TRAVIS_BRANCH !"

java -version

echo "====================================="
echo "download DITA-OT"
echo "====================================="
wget https://github.com/dita-ot/dita-ot/releases/download/2.3.3/dita-ot-2.3.3.zip

echo "====================================="
echo "extract DITA-OT"
echo "====================================="
unzip dita-ot-2.3.3.zip


echo "====================================="
echo "download WebHelp plugin"
echo "====================================="

wget https://www.oxygenxml.com/InstData/Editor/Webhelp/DITA-OT%202.x/oxygen-webhelp.zip

echo "====================================="
echo "extract WebHelp to DITA-OT"
echo "====================================="
unzip oxygen-webhelp.zip 
cp -R com.oxygenxml.* dita-ot-2.3.3/plugins/
mv dita-ot-2.3.3/plugins/com.oxygenxml.webhelp/plugin_2.x.xml dita-ot-2.3.3/plugins/com.oxygenxml.webhelp/plugin.xml

echo $WEBHELP_LICENSE | tr " " "\n" | head -3 | tr "\n" " " > licensekey.txt
echo "" >> licensekey.txt
echo $WEBHELP_LICENSE | tr " " "\n" | tail -8  >> licensekey.txt

echo "****"
cat licensekey.txt | head -8
echo "****"

cp licensekey.txt dita-ot-2.3.3/plugins/com.oxygenxml.webhelp/licensekey.txt


echo "====================================="
echo "Add Edit Link to DITA-OT"
echo "====================================="

# Add the editlink plugin
git clone https://github.com/georgebina/ditaot-editlink-plugin dita-ot-2.3.3/plugins/com.oxygenxml.editlink/

echo "====================================="
echo "integrate plugins"
echo "====================================="
cd dita-ot-2.3.3/
bin/ant -f integrator.xml 
cd ..


REPONAME=`basename $PWD`
PARENTDIR=`dirname $PWD`
USERNAME=`basename $PARENTDIR`

echo "====================================="
echo "publish"
echo "====================================="

# Send some parameters to the "editlink" plugin as system properties
export ANT_OPTS="$ANT_OPTS -Dditamap.path=$MAP"
export ANT_OPTS="$ANT_OPTS -Dcwd=`pwd`"
export ANT_OPTS="$ANT_OPTS -Drepo.url=github://getFileContent/$USERNAME/$REPONAME/$TRAVIS_BRANCH/"
export ANT_OPTS="$ANT_OPTS -Dwebapp.url=https://www.oxygenxml.com/webapp-demo-aws/"

# Send parameters for the Webhelp styling.
export ANT_OPTS="$ANT_OPTS -Dwebhelp.fragment.welcome='$WELCOME'"

export ANT_OPTS="$ANT_OPTS -Dwebhelp.responsive.template.name=bootstrap" 
export ANT_OPTS="$ANT_OPTS -Dwebhelp.responsive.variant.name=tiles"
export ANT_OPTS="$ANT_OPTS -Dwebhelp.responsive.skin.name=$SKIN"

dita-ot-2.3.3/bin/dita -i $MAP -f webhelp-responsive -o out
echo "====================================="
echo "index.html"
echo "====================================="
cat out/$TRAVIS_BRANCH/index.html
