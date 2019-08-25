import Foundation 

public extension BidirectionalCollection where Element: Hashable {
    func firstIndexBM(of collection: Self) -> Index? {
        guard !collection.isEmpty && collection.endIndex <= endIndex else { return nil }

        let cCount = collection.count
        // Construct skip table for all elements, except for the last one 
        var skipTable = Dictionary(zip(collection.dropLast(), (0..<cCount).reversed()), uniquingKeysWith: { $0 < $1 ? $0 : $1 })
        // The last element is left as it is if already defined, otherwise set to count 
        skipTable[collection.last!] = skipTable[collection.last!, default: cCount]

        var offset = cCount-1
        var end = index(startIndex, offsetBy: offset)

        outer: while end < endIndex {
            for (char1, char2) in zip(self[...end].reversed(), collection.reversed()) {
                guard char1 == char2 else {
                    offset = skipTable[self[end]] ?? cCount
                    end = index(end, offsetBy: offset, limitedBy: endIndex) ?? endIndex
                    continue outer
                }
            }

            return index(end, offsetBy: -cCount+1)
        }

        return nil
    }
}

func assertFirstIndexBM<C: BidirectionalCollection>(of pattern: C, in source: C, is result: Int?) where C.Element: Hashable { 
    let firstIndex = source.firstIndexBM(of: pattern).map { source.distance(from: source.startIndex, to: $0) }
    // print(firstIndex as Any)
    assert(firstIndex == result)
}