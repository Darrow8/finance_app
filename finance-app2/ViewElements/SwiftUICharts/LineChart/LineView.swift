//
//  LineView.swift
//  LineChart
//
//  Created by András Samu on 2019. 09. 02..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct LineView: View {
    @ObservedObject var data: ChartData
    public var title: String?
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    public var valueSpecifier:String
    public var totalPoints: Int
    public var yPosChange: CGFloat?

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var showLegend = false
    @State private var dragLocation:CGPoint = .zero
    @State private var indicatorLocation:CGPoint = .zero
    @State private var closestPoint: CGPoint = .zero
    @State private var opacity:Double = 0
    @State private var currentDataNumber: Double = 0
    @State private var hideHorizontalLines: Bool = false
    @State private var totalHeight: CGFloat = 380
    
    public init(data: [Double],
                title: String? = nil,
                legend: String? = nil,
                style: ChartStyle = Styles.lineChartStyleOne,
                valueSpecifier: String? = "%.1f",
                totalPoints: Int,
                yPosChange: CGFloat? = nil
    ) {
        
        self.data = ChartData(points: data)
        self.title = title
        self.legend = legend
        self.style = style
        self.valueSpecifier = valueSpecifier!
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
        self.totalPoints = totalPoints
        self.yPosChange = yPosChange
    }
    
   public var body: some View {
       GeometryReader{ geometry in
           VStack(alignment: .leading, spacing: 8) {
               Group{
                   if (self.title != nil){
                       Text(self.title!)
                           .font(.title)
                           .bold().foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.textColor : self.style.textColor)
                   }
                   if (self.legend != nil){
                       Text(self.legend!)
                           .font(.callout)
                           .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.legendTextColor : self.style.legendTextColor)
                   }
               }.offset(x: 10, y: 10)
               ZStack{
                   GeometryReader{ reader in
                       Rectangle()
                           .foregroundColor(self.colorScheme == .dark ? self.darkModeStyle.backgroundColor : self.style.backgroundColor)
                       if(self.showLegend){
                           Legend(data: self.data,
                                  frame: .constant(reader.frame(in: .local)), hideHorizontalLines: self.$hideHorizontalLines)
                               .transition(.opacity)
                               .animation(Animation.easeOut(duration: 1).delay(1))
                       }
                    Line(data: self.data, lineRatio: (self.totalPoints/self.data.points.count),
                            frame: .constant(CGRect(x: 0, y: 0, width: reader.frame(in: .local).width - 30, height: reader.frame(in: .local).height)),
                            touchLocation: self.$indicatorLocation,showIndicator: self.$hideHorizontalLines ,showBackground: false)
                           .offset(x: 30, y: 0)
                           .onAppear(){
                               self.showLegend.toggle()
                           }
                   }
                   .frame(width: geometry.frame(in: .local).size.width, height: self.totalHeight)
                   .offset(x: 0, y: 40 )
                   MagnifierRect(currentNumber: self.$currentDataNumber, valueSpecifier: self.valueSpecifier)
                       .opacity(self.opacity)
                       .offset(x: self.dragLocation.x - geometry.frame(in: .local).size.width/2, y: 36)
               }
               .frame(width: geometry.frame(in: .local).size.width, height: self.totalHeight)
               .gesture(DragGesture()
                   .onChanged({ value in
                       self.dragLocation = value.location
                       self.indicatorLocation = CGPoint(x: max(value.location.x-30,0), y: 32)
                       self.opacity = 1
                    self.closestPoint = self.getClosestDataPoint(toPoint: value.location, width: geometry.frame(in: .local).size.width-30, height: self.totalHeight)
                       self.hideHorizontalLines = true
                   })
                   .onEnded({ value in
                       self.opacity = 0
                       self.hideHorizontalLines = false
                   })
               )
           }.position(x: (geometry.frame(in: .local).size.width)/2, y: self.yPosChange!)
       }
   }
    
    func getClosestDataPoint(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let points = self.data.onlyPoints()
        let stepWidth: CGFloat = width / CGFloat(points.count-1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)

        let index:Int = Int(floor((toPoint.x-15)/stepWidth))
        if (index >= 0 && index < points.count){
            self.currentDataNumber = points[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(points[index])*stepHeight)
        }
        return .zero
    }
//    func getPercentVal(reader: View, commonVal: Int)-> CGFloat{
//        //reader.frame(in: .local).width
//        return CGFloat((reader.frame(in: .local).width - 30)*(data.points.count/commonVal)!)
//    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(data: [8,23,54,32,12,37,7,23,43], title: "Full chart", style: Styles.lineChartStyleOne, totalPoints: 9, yPosChange: 100)
    }
}

struct IndicatorCircle: View {
    var body: some View {
       Circle()
        .size(width: 12, height: 12)
        .fill(Colors.BorderBlue)
    }
}

struct MagnifierRect: View {
    @Binding var currentNumber: Double
    var valueSpecifier:String
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        ZStack{
            Text("\(self.currentNumber, specifier: valueSpecifier)")
                .font(.system(size: 18, weight: .bold))
                .offset(x: 0, y: -110)
                .foregroundColor(self.colorScheme == .dark ? Color.white : Color.black)
            if (self.colorScheme == .dark ){
                 RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white, lineWidth: self.colorScheme == .dark ? 2 : 0)
                    .frame(width: 60, height: 260)
                    
            }else{
                 RoundedRectangle(cornerRadius: 16)
                    .frame(width: 60, height: 280)
                    .foregroundColor(Color.white)
                    .shadow(color: Colors.LegendText, radius: 12, x: 0, y: 6 )
                    .blendMode(.multiply)
            }
           

        }
    }
}