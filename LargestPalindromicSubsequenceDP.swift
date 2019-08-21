import Foundation

/// Return larges palindromic subsequnce in the collection.
/// Time: O(N^2)
/// Space: O(N^2)
public extension Collection where Element: Equatable {
    func largestPalindromicSubsequenceDP() -> SubSequence? {
        guard !isEmpty else { return nil }

        let count = self.count
        var dpTable: [[Bool]] = .init(repeating: .init(repeating: false, count: count), count: count)
        var result: (startIndex: Index, count: Int) = (startIndex, 0)

        // - Faster version - //
        let rowIndices = indices
        var colIndices = indices.dropFirst(0)

        for subSequenceCount in (1...count) {
            let offset = subSequenceCount-1

            for ((rowIndex, colIndex), i) in zip(zip(rowIndices, colIndices), 0...) {
                let j = i+offset

                if subSequenceCount == 1 {
                    dpTable[i][j] = true
                } else if subSequenceCount == 2 && self[rowIndex] == self[colIndex] {
                    dpTable[i][j] = true
                } else if dpTable[i+1][j-1] && self[rowIndex] == self[colIndex] {
                    dpTable[i][j] = true
                }

                if dpTable[i][j] && subSequenceCount > result.count {
                    result = (rowIndex, subSequenceCount)
                }
            }

            colIndices = colIndices.dropFirst(1)
        }
        // - - - - - - - - - //

        // - Slowe version - // O(N^3)
        // for subSequenceCount in (1...count) {
        //     let offset = subSequenceCount-1

        //     for (rowIndex, i) in zip(indices.prefix(count-offset), 0..<count-offset) {
        //         let (colIndex, j) = (index(rowIndex, offsetBy: offset), i+offset) // O(N)

        //         if subSequenceCount == 1 {
        //             dpTable[i][j] = true
        //         } else if subSequenceCount == 2 && self[rowIndex] == self[colIndex] {
        //             dpTable[i][j] = true
        //         } else if dpTable[i+1][j-1] && self[rowIndex] == self[colIndex] {
        //             dpTable[i][j] = true
        //         }

        //         if dpTable[i][j] && subSequenceCount > result.count {
        //             result = (rowIndex, subSequenceCount)
        //         }
        //     }
        // }
        // - - - - - - - - - //

        return result.count == 0 ? nil : self[result.startIndex..<index(result.startIndex, offsetBy: result.count)]
    }
}

func assertLargestPalindromicSubsequenceDP<C: Collection>(of collection: C, is result: C?) where C.Element: Equatable {
    let result = result.map { $0.prefix($0.count) }

    let lps = collection.largestPalindromicSubsequenceDP()
    // print(lps as Any)
    let areEqual = (lps == nil && result == nil) ||
                    lps?.count == result?.count && zip(lps!, result!).reduce(true, { $0 && $1.0 == $1.1 })
                
    assert(areEqual)
}