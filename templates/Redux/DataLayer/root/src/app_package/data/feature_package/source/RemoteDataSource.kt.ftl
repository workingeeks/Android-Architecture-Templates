package ${packageName}.data.${feature_name}.source
<#include "../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}

interface ${remoteDataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isSuspend=true />
}