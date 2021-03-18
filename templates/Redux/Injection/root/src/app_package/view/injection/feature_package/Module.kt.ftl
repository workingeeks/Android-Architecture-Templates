package ${packageName}.view.injection.${feature_name}

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import ${packageName}.presentation.${feature_name}.${actionDispatcherName}
import ${packageName}.presentation.${feature_name}.${featureName}
import ${packageName}.presentation.${feature_name}.${featureReducerName}
import ${packageName}.view.${feature_name}.viewmodel.${viewModelName}
import dagger.Binds
import dagger.Module
import dagger.Provides
import dagger.multibindings.IntoMap
import io.reactivex.Scheduler
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import ru.nobird.android.presentation.redux.container.wrapWithViewContainer
import ru.nobird.android.presentation.redux.dispatcher.wrapWithActionDispatcher
import ru.nobird.android.presentation.redux.feature.ReduxFeature
import ru.nobird.android.view.injection.base.RxScheduler
import ru.nobird.android.view.injection.base.presentation.DaggerViewModelFactory
import ru.nobird.android.view.injection.base.presentation.ViewModelKey

@Module
internal abstract class ${moduleName} {
    @Binds
    internal abstract fun bindViewModelFactory(daggerViewModelFactory: DaggerViewModelFactory): ViewModelProvider.Factory

    @Module
    companion object {
        @Provides
        @IntoMap
        @ViewModelKey(${viewModelName}::class)
        internal fun provide${viewModelName}(
            reducer: ${featureReducerName},
            actionDispatcher: ${actionDispatcherName}
        ): ViewModel =
            ${viewModelName}(
                ReduxFeature(${featureName}.State.Idle, reducer)
                    .wrapWithActionDispatcher(actionDispatcher)
                    .wrapWithViewContainer()
            )

        @Provides
        @RxScheduler.Background
        internal fun provideBackgroundScheduler(): Scheduler =
            Schedulers.io()

        @Provides
        @RxScheduler.Main
        internal fun provideMainScheduler(): Scheduler =
            AndroidSchedulers.mainThread()
    }
}
