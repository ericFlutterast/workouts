import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

final class UuidUtil {
  UuidUtil._();

  final _uuid = const Uuid();

  static UuidUtil instance = UuidUtil._();

  String v8({V8Options? config}) => _uuid.v8(config: config);

  String v1() => _uuid.v1();

  String v4() => _uuid.v4();

  String v(
    String? namespace,
    String? name, {
    Map<String, dynamic>? options,
    V5Options? config,
  }) =>
      _uuid.v5(
        namespace,
        name,
        options: options,
        config: config,
      );
}
