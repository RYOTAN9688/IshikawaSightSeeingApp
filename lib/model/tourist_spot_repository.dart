// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'tourist_spot.dart';

class TouristSpotRepository {
  static List<TouristSpot> loadTouristSpots(District district) {
    const allTouristSpot = <TouristSpot>[
      TouristSpot(
        district: District.kanazawa,
        id: 0,
        name: '兼六園',
        address: '石川県金沢市兼六町1 兼六園',
      ),
      TouristSpot(
        district: District.kanazawa,
        id: 1,
        name: '金沢城公園',
        address: '石川県金沢市丸の内1-1',
      ),
      TouristSpot(
          district: District.kanazawa,
          id: 2,
          name: '近江町市場',
          address: '石川県金沢市上近江町50'),
      TouristSpot(
        district: District.kanazawa,
        id: 3,
        name: '21世紀美術館',
        address: '石川県金沢市広坂1丁目2-1',
      ),
      TouristSpot(
          district: District.kanazawa,
          id: 4,
          name: 'ひがし茶屋街',
          address: '石川県金沢市東山1-13 ひがし茶屋街'),
    ];
    if (district == District.all) {
      return allTouristSpot;
    } else {
      return allTouristSpot.where((TouristSpot t) {
        return t.district == district;
      }).toList();
    }
  }
}
