package ${packageName}.presentation.${feature_name}

import ${packageName}.domain.${feature_name}.interactor.${interactorName}
import io.reactivex.Scheduler
import ru.nobird.android.presentation.redux.dispatcher.RxActionDispatcher
import ru.nobird.android.view.injection.base.RxScheduler
import javax.inject.Inject

internal class ${actionDispatcherName}
@Inject
constructor(
    private val interactor: ${interactorName},

    @RxScheduler.Background
    private val backgroundScheduler: Scheduler,
    @RxScheduler.Main
    private val mainScheduler: Scheduler
) : RxActionDispatcher<${featureName}.Action, ${featureName}.Message>() {

    override fun handleAction(action: ${featureName}.Action) {
        when (action) {
        }
    }
}
