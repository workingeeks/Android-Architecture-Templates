package ${packageName}.presentation.${feature_name}

import ${packageName}.domain.${feature_name}.interactor.${interactorName}
import ru.nobird.android.presentation.redux.dispatcher.CoroutineActionDispatcher
import javax.inject.Inject

internal class ${actionDispatcherName}
@Inject
constructor(
    private val interactor: ${interactorName}
) : CoroutineActionDispatcher<${featureName}.Action, ${featureName}.Message>() {

    override fun handleAction(action: ${featureName}.Action) {
        when (action) {
        }
    }
}
