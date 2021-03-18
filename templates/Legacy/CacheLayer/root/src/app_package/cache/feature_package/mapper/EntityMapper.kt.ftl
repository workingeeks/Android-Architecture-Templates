package ${packageName}.cache.${feature_name}.mapper

import ${packageName}.cache.${feature_name}.model.${entityName}
import ${itemPackage}.${itemName}
import javax.inject.Inject

class ${entityMapperName}
@Inject
constructor() {
    fun mapToEntity(item: ${itemName}): ${entityName} = TODO()

    fun mapFromEntity(entity: ${entityName}): ${itemName} = TODO()
}