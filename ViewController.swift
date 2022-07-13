//
//  ViewController.swift
//  TrashHowProject
//
//  Created by 조다은 on 2022/07/11.
//

import UIKit


class ViewController: UIViewController, MTMapViewDelegate {
    
    var mapView: MTMapView?
//    var geocoder: MTMapReverseGeoCoder?
    
    var mapPoint1: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MTMapView(frame: self.view.frame)
        
        if let mapView = mapView {
            // 델리게이트 연결
            mapView.delegate = self
            // 지도의 타입 설정 - hybrid: 하이브리드, satellite: 위성지도, standard: 기본지도
            mapView.baseMapType = .standard
            
            // 현재 위치 트래킹
            mapView.currentLocationTrackingMode = .onWithoutHeading
            mapView.showCurrentLocationMarker = true

            
            self.mapPoint1 = MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.643114, longitude: 127.022693))

            // 임의의 위치
            poiItem1 = MTMapPOIItem()
            poiItem1?.itemName = "Somewhere"
            poiItem1?.mapPoint = mapPoint1
            poiItem1?.markerType = MTMapPOIItemMarkerType.redPin
            mapView.add(poiItem1)         // 지도에 임의의 위치 추가
            
            
            // 지도의 센터를 설정 (x와 y 좌표, 줌 레벨 등을 설정)
            self.view.addSubview(mapView)
        }
    }

}

