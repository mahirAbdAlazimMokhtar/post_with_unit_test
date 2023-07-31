import 'package:post_with_unit_test/core/service/network_services.dart';
import 'package:post_with_unit_test/model/post_model.dart';

abstract class RemoteDataSource {
  Future<List<PostModel>> getPosts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final NetworkService networkService;

  RemoteDataSourceImpl(this.networkService);

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await networkService.get(
      'https://jsonplaceholder.typicode.com/posts',
    );
    final result = response.data as List; 
    final posts = result.map((e) => PostModel.fromMap(e)).toList();
    return posts;
  }
}
