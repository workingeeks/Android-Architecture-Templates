package ${packageName}.remote.${feature_name}.mapper

import ${packageName}.remote.${feature_name}.model.${responseName}
import ${itemPackage}.${itemName}
import javax.inject.Inject

class ${responseMapperName}
@Inject
constructor() {
    fun mapFromResponse(response: ${responseName}): List<${itemName}> =
        response.items
}