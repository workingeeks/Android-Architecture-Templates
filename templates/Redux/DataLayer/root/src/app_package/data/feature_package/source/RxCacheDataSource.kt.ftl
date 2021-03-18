package ${packageName}.data.${feature_name}.source
<#include "../../../../common/Common.kt.ftl">
import ${itemPackage}.${itemName}
import io.reactivex.Completable
import io.reactivex.Single

interface ${cacheDataSourceName} {
    <@getter itemName=itemName idType=idType isSingleItem=isSingleItemOperation />

    <@setter itemName=itemName isSingleItem=isSingleItemOperation />
}