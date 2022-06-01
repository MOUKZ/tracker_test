import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracker_demo/data/data_source/dto_models/activity_dto.dart';
import 'package:tracker_demo/data/data_source/remote/base/activity_api_base.dart';
import 'package:tracker_demo/data/models/activity/activity.dart';

import '../../../../exceptions/http_call_exception.dart';
import '../end_points.dart';

class ActivityApiImpl extends ActivityApiBase {
  @override
  Future<List<Activity>> getActivities() async {
    try {
      final response = await get(Uri.parse(EndPoints.activityEndPoint),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200) {
        throw HttpCallExcetopn(
            message: "Faild To Reach Server", statusCode: response.statusCode);
      }
      Iterable list = jsonDecode(response.body);
      List<Activity> activityDtoList = [];
      for (var dto in list) {
        ActivityDto activityDto = ActivityDto.fromJson(dto);
        activityDtoList.add(activityDto.toActivity());
      }

      return activityDtoList;
    } catch (e) {
      rethrow;
    }
  }
}
