import Foundation 

/// Return all matches of the collection (pattern) in the collection, or empty array if no matches are found.
/// Time: O(N)
/// Space: O(M)
/// N = self.count, M = collection.count
public extension Collection where Element: Equatable {
    func allIndicesKMP(of collection: Self) -> [Index] {
        guard !collection.isEmpty && collection.endIndex <= endIndex else { return [] }

        let cCount = collection.count
        
        // E.g: LPS table for ["a", "b", "c", "d", "e", "a", "b", "c", "d"]
        // would be [(0,0), (0,0), (0,0), (0,0), (0,0), (1,1), (2,2), (3,3), (4,4)].
        // That is lpsTable[i] contains (endInndex, length) of the largest prefix of the substring collection[0...i]
        // that is also its suffix.
        func largestPrefixSuffixTable(for collection: Self) -> [(endIndex: Index, count: Int)] {
            var lpsTable = [(Index, Int)](repeating: (collection.startIndex, 0), count: cCount)

            for (index, i) in zip(collection.indices.dropFirst(), 1..<cCount) {
                let (endIndex, count) = lpsTable[i-1]
                if collection[index] == collection[endIndex] { 
                    lpsTable[i] = (collection.index(after: endIndex), count+1)
                }
            }

            return lpsTable
        }

        let lpsTable = largestPrefixSuffixTable(for: collection)

        var next: Index!
        var result: [Index] = []
        var (cIndex, i) = (collection.startIndex, 0)

        for index in indices {
            if self[index] == collection[cIndex] && i == (cCount-1) {
                result.append(next ?? index) // `next` can be nil here when collection.count == 1
                next = nil
                (cIndex, i) = lpsTable[i]
            } else if self[index] == collection[cIndex] {
                next = next ?? index
                (cIndex, i) = (collection.index(after: cIndex), i+1)
            } else if cIndex != collection.startIndex { // self[index] != collection[cIndex] && ...
                next = nil
                (cIndex, i) = lpsTable[i-1]
            } // else if self[index] != collection[cIndex] && cIndex == collection.startIndex just continue ...
        }
        
        return result
    }
}

func assertAllIndicesKMP<C: Collection>(of pattern: C, in source: C, is result: [Int]) where C.Element: Equatable {
    let allIndices = source.allIndicesKMP(of: pattern).map { source.distance(from: source.startIndex, to: $0) }
    // print(allIndices)
    assert(allIndices == result)
}