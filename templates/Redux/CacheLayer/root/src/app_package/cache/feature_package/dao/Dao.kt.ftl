package ${packageName}.cache.${feature_name}.dao
<#include "../../../../common/Common.kt.ftl">
<#if isCreateEntity!false>
import ${packageName}.cache.${feature_name}.model.${entityName}
<#else>
import ${itemPackage}.${itemName}
</#if>

interface ${daoName} {
<#if isCreateEntity!false>
    suspend fun get${itemName}s(vararg ids: ${idType}): List<${entityName}>

    suspend fun save${itemName}s(items: List<${entityName}>)
<#else>
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isSuspend=true />

    <@setter itemName=itemName isSingleItem=isSingleItemOperation isSuspend=true />
</#if>
}