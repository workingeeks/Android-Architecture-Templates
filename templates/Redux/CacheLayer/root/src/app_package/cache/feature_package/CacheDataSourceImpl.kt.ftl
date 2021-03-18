package ${packageName}.cache.${feature_name}
<#include "../../../common/Common.kt.ftl">
<#if isCreateDao!false>
import ${packageName}.cache.${feature_name}.dao.${daoName}
</#if>
<#if isCreateEntityMapper!false>
import ${packageName}.cache.${feature_name}.mapper.${entityMapperName}
</#if>
import ${packageName}.data.${feature_name}.source.${dataSourceName}
import ${itemPackage}.${itemName}
import io.reactivex.Completable
import io.reactivex.Single
import javax.inject.Inject

class ${dataSourceName}Impl
@Inject
constructor(
<#if isCreateDao!false>
    private val ${daoName?uncap_first}: ${daoName},
</#if>
<#if isCreateEntityMapper!false>
    private val ${entityMapperName?uncap_first}: ${entityMapperName}
</#if>
) : ${dataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isOverride=true isSuspend=true /> =
        <#if isCreateDao!false>
        ${daoName?uncap_first}
            .get${itemName}s(<#if isSingleItemOperation!false>id<#else>*ids</#if>)
        <#else>
        TODO()
        </#if>
        <#if isCreateEntityMapper == true>
            .let { ${entityMapperName?uncap_first}.mapFromEntity(it) }
        </#if>

    <@setter itemName=itemName isSingleItem=isSingleItemOperation isOverride=true isSuspend=true /> <#if useRx == true>=<#else>{</#if>
    <#if useRx == true>
        <#if isCreateEntityMapper!false>
            Single
                .fromCallable { <#if isSingleItemOperation!false>${entityMapperName?uncap_first}.mapToEntity(item)<#else> items.map(${entityMapperName?uncap_first}::mapToEntity)</#if> }
        <#else>
            Single
                .just(<@items isSingleItem=isSingleItemOperation />)
        </#if>
        <#if isCreateDao!false>
                .flatMapCompletable(${daoName?uncap_first}::save${itemName}<#if !isSingleItemOperation!false>s</#if>)
        </#if>
    <#else>
        <#if isCreateEntityMapper!false>
            <#if isSingleItemOperation!false>${entityMapperName?uncap_first}.mapToEntity(item)<#else> items.map(${entityMapperName?uncap_first}::mapToEntity)</#if>
        <#else>
            <@items isSingleItem=isSingleItemOperation />
        </#if>
        <#if isCreateDao!false>
                .let(${daoName?uncap_first}::save${itemName}<#if !isSingleItemOperation!false>s</#if>)
        </#if>
    }
    </#if>
}