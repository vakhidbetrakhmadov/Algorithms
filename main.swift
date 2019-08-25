import Foundation

assertFirstIndexBM(of: "", in: "", is: nil)
assertFirstIndexBM(of: "", in: "ABABDABACDABABCABAB", is: nil)
assertFirstIndexBM(of: "ABC", in: "", is: nil)
assertFirstIndexBM(of: "ABS", in: "BABA", is: nil)
assertFirstIndexBM(of: "ABABCABAB", in: "ABABDABACDABABCABAB", is: 10)
assertFirstIndexBM(of: "", in: "abcdefg", is: nil)
assertFirstIndexBM(of: "a", in: "abcdefg", is: 0)
assertFirstIndexBM(of: "g", in: "abcdefg", is: 6)
assertFirstIndexBM(of: "ab", in: "abcdefg", is: 0)
assertFirstIndexBM(of: "fg", in: "abcdefg", is: 5)
assertFirstIndexBM(of: "cde", in: "abcdefg", is: 2)
assertFirstIndexBM(of: "abcdefg", in: "abcdefg", is: 0)
assertFirstIndexBM(of: "x", in: "abcdefg", is: nil)
assertFirstIndexBM(of: "xw", in: "abcdefg", is: nil)
assertFirstIndexBM(of: "xbcdefg", in: "abcdefg", is: nil)

assertFirstIndex(of: "", in: "", is: nil)
assertFirstIndex(of: "", in: "ABABDABACDABABCABAB", is: nil)
assertFirstIndex(of: "ABC", in: "", is: nil)
assertFirstIndex(of: "ABS", in: "BABA", is: nil)
assertFirstIndex(of: "ABABCABAB", in: "ABABDABACDABABCABAB", is: 10)
assertFirstIndex(of: "", in: "abcdefg", is: nil)
assertFirstIndex(of: "a", in: "abcdefg", is: 0)
assertFirstIndex(of: "g", in: "abcdefg", is: 6)
assertFirstIndex(of: "ab", in: "abcdefg", is: 0)
assertFirstIndex(of: "fg", in: "abcdefg", is: 5)
assertFirstIndex(of: "cde", in: "abcdefg", is: 2)
assertFirstIndex(of: "abcdefg", in: "abcdefg", is: 0)
assertFirstIndex(of: "x", in: "abcdefg", is: nil)
assertFirstIndex(of: "xw", in: "abcdefg", is: nil)
assertFirstIndex(of: "xbcdefg", in: "abcdefg", is: nil)

assertAllIndices(of: "", in: "abcdefg", is: [])
assertAllIndices(of: "a", in: "abcdefg", is: [0])
assertAllIndices(of: "g", in: "abcdefg", is: [6])
assertAllIndices(of: "ab", in: "abcdefg", is: [0])
assertAllIndices(of: "fg", in: "abcdefg", is: [5])
assertAllIndices(of: "cde", in: "abcdefg", is: [2])
assertAllIndices(of: "abcdefg", in: "abcdefg", is: [0])
assertAllIndices(of: "x", in: "abcdefg", is: [])
assertAllIndices(of: "xw", in: "abcdefg", is: [])
assertAllIndices(of: "xbcdefg", in: "abcdefg", is: [])
assertAllIndices(of: "abc", in: "abcxabcabcxabc", is: [0, 4, 7, 11])

assertAllIndicesKMP(of: "", in: "abcdefg", is: [])
assertAllIndicesKMP(of: "a", in: "abcdefg", is: [0])
assertAllIndicesKMP(of: "g", in: "abcdefg", is: [6])
assertAllIndicesKMP(of: "ab", in: "abcdefg", is: [0])
assertAllIndicesKMP(of: "fg", in: "abcdefg", is: [5])
assertAllIndicesKMP(of: "cde", in: "abcdefg", is: [2])
assertAllIndicesKMP(of: "abcdefg", in: "abcdefg", is: [0])
assertAllIndicesKMP(of: "x", in: "abcdefg", is: [])
assertAllIndicesKMP(of: "xw", in: "abcdefg", is: [])
assertAllIndicesKMP(of: "xbcdefg", in: "abcdefg", is: [])
assertAllIndicesKMP(of: "abc", in: "abcxabcabcxabc", is: [0, 4, 7, 11])

assertLargestCommonSubsequence(of: "BABA", with: "ABS", is: "AB")
assertLargestCommonSubsequence(of: "ABS", with: "BABA", is: "AB")
#warning("Add more test cases ...")

assertLargestCommonSubsequenceDP(of: "BABA", with: "ABS", is: "AB")
assertLargestCommonSubsequenceDP(of: "ABS", with: "BABA", is: "AB")
#warning("Add more test cases ...")

assertLargestPalindromicSubsequenceDP(of: "forgeeksskeegfor", is: "geeksskeeg")
assertLargestPalindromicSubsequenceDP(of: "abb", is: "bb")
#warning("Add more test cases ...")

assertLargestPalindromicSubsequence(of: "forgeeksskeegfor", is: "geeksskeeg")
assertLargestPalindromicSubsequence(of: "abb", is: "bb")

print("Success")
