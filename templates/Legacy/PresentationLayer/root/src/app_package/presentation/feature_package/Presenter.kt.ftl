package ${packageName}.presentation.${feature_name}

<#if isCreateStateMapper!false>
import ${packageName}.presentation.${feature_name}.mapper.${stateMapperName}
</#if>
import ${packageName}.domain.${feature_name}.interactor.${interactorName}
import ${itemPackage}.${itemName}
import io.reactivex.Scheduler
import ru.nobird.android.presentation.base.PresenterBase
import javax.inject.Inject

class ${presenterName}
@Inject
constructor(
<#if isCreateStateMapper!false>
    private val ${stateMapperName?uncap_first}: ${stateMapperName},
</#if>
<#if interactorName?has_content>
    private val ${interactorName?uncap_first}: ${interactorName},
</#if>

    @BackgroundScheduler
    private val backgroundScheduler: Scheduler,
    @MainScheduler
    private val mainScheduler: Scheduler
) : PresenterBase<${viewName}>() {
    private var state: ${viewName}.State = ${viewName}.State.Idle
        set(value) {
            field = value
            view?.setState(value)
        }

    override fun attachView(view: ${viewName}) {
        super.attachView(view)
        view.setState(state)
    }
}