import Foundation 

/// Return largest common subsequence between self and given first.
/// Time: O(n^2)
/// Space: O(n^2)
public extension Collection where Element: Equatable {
    func largestCommonSubsequenceDP(with collection: Self) -> SubSequence? {
        let count = self.count
        let cCount = collection.count

        typealias Entry = (startIndex: Index, count: Int)

        var dpTable: [[Entry?]] = .init(repeating: .init(repeating: nil, count: cCount), count: count)
        var result: Entry?

        for (rowIndex, i) in zip(indices, 0..<count) {
            for (colIndex, j) in zip(collection.indices, 0..<cCount) {
                if collection[colIndex] == self[rowIndex] {
                    if i-1 >= 0 && j-1 >= 0 && dpTable[i-1][j-1] != nil { 
                        let entry = dpTable[i-1][j-1]!
                        dpTable[i][j] = (entry.startIndex, entry.count+1)
                    } else { 
                        dpTable[i][j] = (rowIndex, 1)
                    }

                    if result == nil || dpTable[i][j]!.count > result!.count {
                        result = dpTable[i][j]! 
                    }
                }
            }
        }

        return result.map { self[$0.startIndex..<self.index($0.startIndex, offsetBy: $0.count)] }

    }
}

func assertLargestCommonSubsequenceDP<C: Collection>(of first: C, with second: C, is result: C?) where C.Element: Equatable { 
    let result = result.map { $0.prefix($0.count) }
    
    let lcs = first.largestCommonSubsequenceDP(with: second)
    // print(lcs as Any)
    let areEqual = (lcs == nil && result == nil) ||
                    lcs?.count == result?.count && zip(lcs!, result!).reduce(true, { $0 && $1.0 == $1.1 })
                
    assert(areEqual)
}