#! /bin/sh
#
# generateModule.sh
# Copyright (C) 2015 Nate Cornell <nate@natecornell.com>
#
# Distributed under terms of the MIT license.
#

NAMESPACE=$1
MODULE_NAME=$2

if [ -z $MODULE_NAME -o -z $NAMESPACE ]; then
  echo "Usage: magModSkel.sh <Namespace> <ModuleName>"
  exit 1
fi

mkdir -p ./app/code/local/$NAMESPACE/$MODULE_NAME/Block
mkdir -p ./app/code/local/$NAMESPACE/$MODULE_NAME/controllers
mkdir -p ./app/code/local/$NAMESPACE/$MODULE_NAME/etc
mkdir -p ./app/code/local/$NAMESPACE/$MODULE_NAME/Helper
mkdir -p ./app/code/local/$NAMESPACE/$MODULE_NAME/Model
mkdir -p ./app/code/local/$NAMESPACE/$MODULE_NAME/sql/$MODULE_NAME_setup

mkdir -p ./app/etc/modules

mkdir -p ./app/design/adminhtml
mkdir -p ./app/design/frontend

mkdir -p ./skin/frontend
mkdir -p ./skin/adminhtml

touch ./app/etc/modules/${NAMESPACE}_${MODULE_NAME}.xml 

printf '
<config>
  <modules>
    <%s_%s>
      <active>false</active>
      <codePool>local</codePool>
    </%s_%s>
  </modules>
</config>
' $NAMESPACE $MODULE_NAME $NAMESPACE $MODULE_NAME > ./app/etc/modules/${NAMESPACE}_${MODULE_NAME}.xml 

touch ./app/code/local/$NAMESPACE/$MODULE_NAME/Helper/Data.php

printf '
<?php

class %s_%s_Helper_Data extends Mage_Core_Helper_Abstract
{
}
' $NAMESPACE $MODULE_NAME > ./app/code/local/$NAMESPACE/$MODULE_NAME/Helper/Data.php

touch ./app/code/local/$NAMESPACE/$MODULE_NAME/etc/config.xml

printf '
<?xml version="1.0" ?>
<config>

  <modules>
    <%s_%s>
      <version>0.0.1</version>
    </%s_%s>
  </modules>

  <global>

    <blocks>
    </blocks>

    <helpers>
    </helpers>

    <models>
    </models>

    <resources>
    </resources>

  </global>

</config>
' $NAMESPACE $MODULE_NAME $NAMESPACE $MODULE_NAME > ./app/code/local/$NAMESPACE/$MODULE_NAME/etc/config.xml

printf 'Module skeleton generated. 
Module is disabled by default, so change the value of the "<active>" node within 
./app/etc/modules/%s_%s.xml to "true" when ready.' $NAMESPACE $MODULE_NAME

exit 0
