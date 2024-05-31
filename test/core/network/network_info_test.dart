import 'package:common/infrastructure-layer/utils/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockInternetConnection mockInternetConnection;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    networkInfo = NetworkInfoImpl(internetConnection: mockInternetConnection);
  });

  group('isConnected', () {
    test('should forward the call to InternetConnection.hasInternetAccess',
        () async {
      final tHasInternetConnection = Future.value(true);

      /// arrange
      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((_) => tHasInternetConnection);

      /// act
      final result = networkInfo.isConnected;

      /// assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, tHasInternetConnection);
    });
  });
}
