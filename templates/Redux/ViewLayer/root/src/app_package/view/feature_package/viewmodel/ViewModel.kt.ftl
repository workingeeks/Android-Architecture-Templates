package ${packageName}.view.${feature_name}.viewmodel

import ${packageName}.presentation.${feature_name}.${featureName}
import ru.nobird.android.presentation.redux.container.ReduxViewContainer
import ru.nobird.android.view.redux.viewmodel.ReduxViewModel

internal class ${viewModel}(
    viewContainer: ReduxViewContainer<${featureName}.State, ${featureName}.Message, ${featureName}.Action.ViewAction>
) : ReduxViewModel<${featureName}.State, ${featureName}.Message, ${featureName}.Action.ViewAction>(viewContainer)
