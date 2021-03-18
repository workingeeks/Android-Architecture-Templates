package ${packageName}.domain.${feature_name}.interactor

import ${packageName}.domain.${feature_name}.repository.${repositoryName}
import ${itemPackage}.${itemName}
import javax.inject.Inject

class ${interactorName}
@Inject
constructor(
    private val ${repositoryName?uncap_first}: ${repositoryName}
) {

}