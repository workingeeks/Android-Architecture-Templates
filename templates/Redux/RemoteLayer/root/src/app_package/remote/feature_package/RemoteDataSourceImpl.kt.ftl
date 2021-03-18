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
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation isOverride=true isSuspend=true /> =
        <#if isCreateService!false>
        ${serviceName?uncap_first}
            .get${itemName}s(<#if isSingleItemOperation!false>id<#else>*ids</#if>)
        <#else>
        TODO()
        </#if>
        <#if isCreateResponseMapper == true>
            .let { ${responseMapperName?uncap_first}.mapFromResponse(it) }
        </#if>
}