package ${packageName}.view.injection.${feature_name}

import dagger.Subcomponent

@Subcomponent(modules = [

])
interface ${componentName} {
    @Subcomponent.Builder
    interface Builder {
        fun build(): ${componentName}
    }


}