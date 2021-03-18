package ${packageName}.domain.${feature_name}.repository
<#include "../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}

interface ${repositoryName} {
    <@getter itemName=itemName idType=idType isSupportSourceType=true isSingleItem=isSingleItemOperation primarySourceType="DataSourceType.REMOTE" isSuspend=true />

<#if isExposeSaveOperation!false>
    <@setter itemName=itemName isSingleItem=isSingleItemOperation isSuspend=true />
</#if>
}