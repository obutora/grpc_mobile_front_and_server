import '../grpc_gen/google/protobuf/timestamp.pb.dart';

class TimestampConverter {
  static DateTime fromTimestamp(Timestamp value) {
    return value.toDateTime();
  }

  static Timestamp toTimestamp(DateTime value) {
    return Timestamp.fromDateTime(value);
  }
}
