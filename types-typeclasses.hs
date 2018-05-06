-- To check type of variable we use:
--      :t var
-- Types: Int, Integer (for big numbers), Float, Double, Bool, Char, String is [Char]

-- Typeclasses (it's like interfaces for vars):
--      Eq - tests equality of something with another
--      Ord - for ordering, so all less or grater operations or function x `compare` y
--      Show - for "show" function, makes string from value, eg. 3 -> "3", True -> "True"
--      Read - type for "read" function, converts from string to value, eg. "True" -> True.
--             "read" function cannot be used without any other value because GHCI doesn't know
--             to which type it should convert the value from string

-- We can cast value from read to given type like:
convertToFloat str =
    read str :: Float

convertToInt str =
    read str :: Int

convertListToIntList str =
    read str :: [Int]