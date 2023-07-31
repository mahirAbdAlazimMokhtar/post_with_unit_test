import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:post_with_unit_test/core/service/network_services.dart';
import 'package:post_with_unit_test/datasources/remote_datasource.dart';
import 'package:post_with_unit_test/model/post_model.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late final RemoteDataSourceImpl remoteDataSourceImpl;
  late final NetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    remoteDataSourceImpl = RemoteDataSourceImpl(mockNetworkService);
  });
  test('Get Posts Should return posts without any exception  ', () async {
    //Arrange
    final posts = List.generate(
        5,
        (index) => PostModel(
              userId: index,
              id: index,
              title: "title",
              body: "body",
            ));
    final postsMap = posts.map((post) => post.toMap()).toList();
    when(mockNetworkService.get('https://jsonplaceholder.typicode.com/posts'))
        .thenAnswer((_) => Future.value(
              Response(
                requestOptions: RequestOptions(
                  path: 'https://jsonplaceholder.typicode.com/posts',
                
                ),
                  data: postsMap,
                  statusCode: 200,
  
              ),
            ));

    //ACT
    final result = await remoteDataSourceImpl.getPosts();

    //Assert

    expect(result, posts);
  });
}
