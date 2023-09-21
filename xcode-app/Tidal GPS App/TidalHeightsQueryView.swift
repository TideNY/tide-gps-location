//
//  TidalHeightsQueryView.swift
//  Tidal GPS App
//
//  Created by Alice Hepburn on 9/20/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct TidalHeightView: View {
    @EnvironmentObject var locationManagerModel: LocationManagerModel
    var coordinateLatitude: CLLocationDegrees {locationManagerModel.lastSeenLocation?.coordinate.latitude ?? 0}
    var coordinateLongitude: CLLocationDegrees {locationManagerModel.lastSeenLocation?.coordinate.longitude ?? 0}
    @EnvironmentObject private var tidalHeightsQueryModel: TidalHeightsQueryModel
    @EnvironmentObject var dateTimeManagerModel: DateTimeManagerModel

    var body: some View {
        VStack{
            Button {
                //                passing right query for fetch
                Task {tidalHeightsQueryModel.retrieveTidesForDisplay(latitude: coordinateLatitude, longitude: coordinateLongitude)
                }
                
            }label: {
                Text("Refresh Tide")
            }
            List(tidalHeightsQueryModel.tidesForDisplay) {tide in
                HStack(alignment: .center) {
                    Text(tide.DateTime)
                    Spacer()
                    Text(String(tide.Prediction))
                        .fontWeight(.bold)
                        .frame(maxWidth: 150)
                    Spacer()
                    Text("height from low water")

                }
            }
//            HStack{
//                Text(String(tidalHeightsQueryModel.tidesForDisplay[0].Prediction)
//
//            }
            .frame(maxHeight: 50)
//            Text(flood ? "Flood" : "Ebb")
        }
    }
}
