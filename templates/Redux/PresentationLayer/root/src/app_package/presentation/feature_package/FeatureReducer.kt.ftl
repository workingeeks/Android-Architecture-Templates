package ${packageName}.presentation.${feature_name}

import ru.nobird.android.presentation.redux.reducer.StateReducer
import javax.inject.Inject

internal class ${featureReducerName}
@Inject
constructor(
) : StateReducer<${featureName}.State, ${featureName}.Message, ${featureName}.Action> {
    override fun reduce(
        state: ${featureName}.State,
        message: ${featureName}.Message
    ): Pair<${featureName}.State, Set<${featureName}.Action>> =
        when (message) {
        }
}
