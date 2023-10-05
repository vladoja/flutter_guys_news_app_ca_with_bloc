import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../domain/usecases/get_article.dart';
import '../../../bloc/article/remote/remote_article_event.dart';
import '../../../bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticleUseCase _getArticleUserCase;
  RemoteArticlesBloc(this._getArticleUserCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    // GetArticleUseCase is a callbale class, because it implements call() method
    final dataState = await _getArticleUserCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
