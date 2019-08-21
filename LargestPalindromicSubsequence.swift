import Foundation

/// Return larges palindromic subsequnce in the collection.
/// Time: O(N^3)
/// Space: O(1)
public extension Collection where Element: Equatable { 
    func largestPalindromicSubsequence() -> SubSequence? {
        var result: (startIndex: Index, count: Int) = (startIndex, 0)

        for (low, i) in zip(indices, 0...) {
            for (high, j) in zip(indices[low...], i...) {
                let subSequenceCount = j-i+1

                if subSequenceCount > result.count && self[low...high].isPalindrome() {
                    result = (low, subSequenceCount)
                }
            }
        }

        return result.count == 0 ? nil : self[result.startIndex..<index(result.startIndex, offsetBy: result.count)]
    }

    private func isPalindrome() -> Bool { 
        for (i, j) in zip(indices, indices.reversed()) { 
            guard self[i] == self[j] else { return false }
        }
        return true
    }
}

func assertLargestPalindromicSubsequence<C: Collection>(of collection: C, is result: C?) where C.Element: Equatable {
    let result = result.map { $0.prefix($0.count) }

    let lps = collection.largestPalindromicSubsequence()
    // print(lps as Any)
    let areEqual = (lps == nil && result == nil) ||
                    lps?.count == result?.count && zip(lps!, result!).reduce(true, { $0 && $1.0 == $1.1 })
                
    assert(areEqual)
}