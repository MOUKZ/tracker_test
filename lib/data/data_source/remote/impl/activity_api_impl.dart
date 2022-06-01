import 'dart:convert';

import 'package:http/http.dart';
import 'package:tracker_demo/data/data_source/dto_models/activity_dto.dart';
import 'package:tracker_demo/data/data_source/remote/base/activity_api_base.dart';
import 'package:tracker_demo/data/models/activity/activity.dart';

class ActivityApiImpl extends ActivityApiBase {
  @override
  Future<List<Activity>> getActivities() async {
    try {
      final response = await get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          headers: {'Content-Type': 'application/json'});
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
