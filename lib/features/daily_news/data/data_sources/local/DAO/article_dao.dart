import 'package:floor/floor.dart';
import '../../../models/article.dart';

@dao
abstract class ArticleDao {
  @insert
  Future<void> insertArticle(ArticleModel article);

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();
}
