package ${packageName}.remote.${feature_name}.service

<#if isCreateResponse!false>
import ${packageName}.remote.${feature_name}.model.${responseName}
import io.reactivex.Single
import retrofit2.http.GET
import retrofit2.http.Query
</#if>

interface ${serviceName} {
<#if isCreateResponse!false>
    @GET
    fun get${itemName}s(@Query("ids[]") ids: List<${idType}>): Single<${responseName}>
</#if>
}