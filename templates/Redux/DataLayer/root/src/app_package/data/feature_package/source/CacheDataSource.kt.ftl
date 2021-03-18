package ${packageName}.data.${feature_name}.source
<#include "../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}

interface ${cacheDataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isSuspend=true />

    <@setter itemName=itemName isSingleItem=isSingleItemOperation isSuspend=true />
}