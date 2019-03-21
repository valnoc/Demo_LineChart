//
//  LineChartMapper.swift
//  Demo_LineChart
//
//  Created by Valeriy Bezuglyy on 17/03/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation

class LineChartMapper {
    func map(from json: [[AnyHashable: Any]]) -> [LineChart] {
        var result: [LineChart] = []
        
        for object in json {
            //  columns
            guard let objectColumns = object["columns"] as? [[Any]] else { continue }
            do {
                //  check for equal count of x and y values
                let set = Set(objectColumns.map({$0.count}))
                guard set.count == 1 else { continue }
            }
            
            // [["x", 1, 2, 3], ["y", 4, 5, 6]] => ["x": [1,2,3], "y": [4,5,6]]
            var columns: [String: [Double]] = [:]
            for item in objectColumns {
                guard let key = item.first as? String,
                    var value = Array(item.dropFirst()) as? [Double] else { continue }
                value = value.map({ $0 / 1000 })
                columns[key] = value
            }
            
            //  find name of "x" column
            guard let columnToType = object["types"] as? [String: String],
                let xKey = columnToType.first(where: { $0.value == "x" }).map({ $0.key }),
                let xValues = columns[xKey] else { continue }
            columns.removeValue(forKey: xKey)
            let yValues = columns
            
            //  other
            guard let names = object["names"] as? [String: String] else { continue }
            guard let colorsHex = object["colors"] as? [String: String] else { continue }
            
            //  create charts
            let lines: [LineChart.Line] = yValues.compactMap({
                guard let name = names[$0.key],
                    let hex = colorsHex[$0.key] else { return nil }
                return LineChart.Line(x: xValues,
                                       y: $0.value,
                                       colorHex: hex,
                                       name: name)
            })
            let chart = LineChart(lines: lines)
            result.append(chart)
        }
        
        return result
    }
}
