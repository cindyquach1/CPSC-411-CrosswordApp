//
//  Array2D.swift
//  crosswords_generator
//
//  Created by Cindy Quach on 5/11/20.
//  Copyright © 2020 Cindy Quach. All rights reserved.
//

import Foundation

open class Array2D<T> {
	
	open var columns: Int
	open var rows: Int
	open var matrix: [T]
	
	public init(columns: Int, rows: Int, defaultValue: T) {
		self.columns = columns
		self.rows = rows
		matrix = Array(repeating: defaultValue, count: columns * rows)
	}
	
	open subscript(column: Int, row: Int) -> T {
		get {
			return matrix[columns * row + column]
		}
		set {
			matrix[columns * row + column] = newValue
		}
	}
	
	open func columnCount() -> Int {
		return self.columns
	}
	
	open func rowCount() -> Int {
		return self.rows
	}
}
