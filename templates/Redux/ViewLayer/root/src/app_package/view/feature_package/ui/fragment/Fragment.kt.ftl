package ${packageName}.view.${feature_name}.ui.fragment
<#include "../../../../../common/Common.kt.ftl" />
import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import ${packageName}.R
import ${packageName}.presentation.${feature_name}.${featureName}
import ${packageName}.view.${feature_name}.viewmodel.${viewModel}
import ${packageName}.presentation.${feature_name}.model.${listItemName}
import kotlinx.android.synthetic.main.${fragmentLayoutName}.*
import ru.nobird.android.presentation.redux.container.ReduxView
import ru.nobird.android.ui.adapters.DefaultDelegateAdapter
import ru.nobird.android.view.base.ui.delegate.ViewStateDelegate
import ru.nobird.android.view.redux.ui.extension.reduxViewModel
import javax.inject.Inject

class ${fragmentName} :
    Fragment(R.layout.${fragmentLayoutName}) {

    companion object {
        fun newInstance(): ${fragmentName} =
            ${fragmentName}()
    }

    @Inject
    internal lateinit var viewModelFactory: ViewModelProvider.Factory

    private val reduxViewDelegate =
        object : ReduxView<${featureName}.State, ${featureName}.Action.ViewAction> {
            override fun render(state: ${featureName}.State) {
                this@${fragmentName}.render(state)
            }

            override fun onAction(action: ${featureName}.Action.ViewAction) {
                this@${fragmentName}.onAction(action)
            }
        }

    private val viewModel: ${viewModel} by reduxViewModel(reduxViewDelegate) { viewModelFactory }

    private val adapter = DefaultDelegateAdapter<${listItemName}>()

    private val viewStateDelegate = ViewStateDelegate<${featureName}.State>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        injectComponent()
    }

    private fun injectComponent() {
        App.component()
            .${componentName}Builder()
            .build()
            .inject(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        with(recycler) {
            this.adapter = adapter
            layoutManager = LinearLayoutManager(context)
        }

        //viewStateDelegate.addState<${featureName}.State.Idle>(progress_spinner)
        //viewStateDelegate.addState<${featureName}.State.Loading>(progress_spinner)
        //viewStateDelegate.addState<${featureName}.State.Content>(recycler)
    }

    private fun render(state: ${featureName}.State) {
        viewStateDelegate.switchState(state)
        when (state) {
            ${featureName}.State.Init, ${featureName}.State.Loading -> {

            }

            is ${featureName}.State.Content -> {

            }
        }
    }

    private fun onAction(action: ${featureName}.Action.ViewAction) {
        when (action) {

        }
    }
}
