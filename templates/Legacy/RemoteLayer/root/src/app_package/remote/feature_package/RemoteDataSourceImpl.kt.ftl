package ${packageName}.remote.${feature_name}
<#include "../../../common/Common.kt.ftl">
<#if isCreateService!false>
import ${packageName}.remote.${feature_name}.service.${serviceName}
</#if>
<#if isCreateResponseMapper!false>
import ${packageName}.remote.${feature_name}.mapper.${responseMapperName}
</#if>
import ${packageName}.data.${feature_name}.source.${dataSourceName}
import ${itemPackage}.${itemName}
import io.reactivex.Completable
import io.reactivex.Single
import javax.inject.Inject

class ${dataSourceName}Impl
@Inject
constructor(
<#if isCreateService!false>
    private val ${serviceName?uncap_first}: ${serviceName},
</#if>
<#if isCreateResponseMapper!false>
    private val ${responseMapperName?uncap_first}: ${responseMapperName}
</#if>
) : ${dataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isOverride=true /> =
        <#if isCreateService!false>
        ${serviceName?uncap_first}
            .get${itemName}s(<#if isSingleItemOperation!false>id<#else>*ids</#if>)
        <#else>
        TODO()
        </#if>
        <#if isCreateResponseMapper == true>
            .map { it.map(${responseMapperName?uncap_first}::mapFromResponse) }
        </#if>
}