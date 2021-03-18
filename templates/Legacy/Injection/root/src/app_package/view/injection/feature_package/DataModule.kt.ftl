package ${packageName}.view.injection.${feature_name}

import dagger.Binds
import dagger.Module
import dagger.Provides
import ${packageName}.domain.${feature_name}.repository.${repositoryName}
import ${packageName}.data.${feature_name}.repository.${repositoryName}Impl
<#if hasCacheDataSource!false>
import ${packageName}.cache.${feature_name}.${cacheDataSourceName}Impl
import ${packageName}.data.${feature_name}.source.${cacheDataSourceName}
</#if>
<#if hasDao!false>
import ${packageName}.cache.${feature_name}.dao.${daoName}
</#if>
<#if hasRemoteDataSource!false>
import ${packageName}.remote.${feature_name}.${remoteDataSourceName}Impl
import ${packageName}.data.${feature_name}.source.${remoteDataSourceName}
</#if>
<#if hasService!false>
import ${packageName}.remote.${feature_name}.service.${serviceName}
</#if>

@Module
abstract class ${dataModuleName} {
    @Binds
    internal abstract fun bind${repositoryName}(
        ${repositoryName?uncap_first}Impl: ${repositoryName}Impl
    ): ${repositoryName}

<#if hasCacheDataSource!false>
    @Binds
    internal abstract fun bind${cacheDataSourceName}(
        ${cacheDataSourceName?uncap_first}Impl: ${cacheDataSourceName}Impl
    ): ${cacheDataSourceName}
</#if>

<#if hasRemoteDataSource!false>
    @Binds
    internal abstract fun bind${remoteDataSourceName}(
        ${remoteDataSourceName?uncap_first}Impl: ${remoteDataSourceName}Impl
    ): ${remoteDataSourceName}
</#if>

<#if (hasDao!false) || (hasService!false)>
    @Module
    companion object {
        <#if hasDao!false>
        @Provides
        @JvmStatic
        fun provide${daoName}(): ${daoName} = TODO()
        </#if>

        <#if hasService!false>
        @Provides
        @JvmStatic
        fun provide${serviceName}(): ${serviceName} = TODO()
        </#if>
    }
</#if>
}