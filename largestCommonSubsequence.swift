import Foundation

/// Return largest common subsequence between self and given collection.
/// Time: O(N^3)
/// Space: O(1)
public extension Collection where Element: Equatable {
    func largestCommonSubsequence(with collection: Self) -> SubSequence? {
        var result: SubSequence?
        var resultCount = 0

        let count = self.count

        for (low, i) in zip(indices, (0..<count)) {
            for (high, j) in zip(indices[low...].reversed(), (i..<count).reversed()) {
                if collection.contains(self[low...high]) { // O(N)
                    if result == nil || (j - i) > resultCount {
                        result = self[low...high]
                        resultCount = j - 1
                    }
                }
            }
        }

        return result
    }

    private func contains(_ collection: SubSequence) -> Bool {
        return self[startIndex..<endIndex].firstIndex(of: collection) != nil
    }
}

func assertLargestCommonSubsequence<C: Collection>(of first: C, with second: C, is result: C.SubSequence?) where C.Element: Equatable { 
    let lcs = first.largestCommonSubsequence(with: second)
    // print(lcs as Any)
    let areEqual = (lcs == nil && result == nil) ||
                    lcs?.count == result?.count && zip(lcs!, result!).reduce(true, { $0 && $1.0 == $1.1 })
                
    assert(areEqual)
}