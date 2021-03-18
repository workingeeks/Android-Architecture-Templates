package ${packageName}.presentation.${feature_name}

<#if isCreateListItem!false>
import ${packageName}.presentation.${feature_name}.model.${listItemName}
</#if>

interface ${viewName} {
    sealed class State {
        object Idle : State()
        object Loading : State()

        class Content(val items: List<<#if isCreateListItem!false>${listItemName}<#else>${itemName}</#if>>) : State()
    }

    fun setState(state: State)
    fun showNetworkError()
}