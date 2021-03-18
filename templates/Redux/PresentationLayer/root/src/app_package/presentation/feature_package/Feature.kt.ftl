package ${packageName}.presentation.${feature_name}

<#if isCreateListItem!false>
import ${packageName}.presentation.${feature_name}.model.${listItemName}
</#if>

interface ${featureName} {
    sealed class State {
        object Idle : State()
        object Loading : State()

        data class Content(val items: List<<#if isCreateListItem!false>${listItemName}<#else>${itemName}</#if>>) : State()
    }

    sealed class Message {
        object Init : Message()
    }

    sealed class Action {
        sealed class ViewAction : Action() {
        }
    }
}