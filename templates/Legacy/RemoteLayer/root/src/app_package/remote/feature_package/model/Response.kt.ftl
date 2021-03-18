package ${packageName}.remote.${feature_name}.model

import ${itemPackage}.${itemName}
import com.google.gson.annotations.SerializedName

class ${responseName}(
    @SerializedName("items")
    val items: List<${itemName}>
)