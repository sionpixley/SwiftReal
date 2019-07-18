/*func LongAdditionOperatorWithLargeNumbers_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long("74398479082349012869845798027349858192036512398749802134")
    let num2 = Long("128907345790813246578328471980237489162345786187237489172347129374901285")
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "128907345790813320976807554329250359008143813537095681208859528124703419"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongAdditionOperatorWithSmallNumbers_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long(13)
    let num2 = Long(98)
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "111"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongAdditionOperatorWithZeros_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "0"
    {
        return true
    }
    else 
    {
        return false
    }
}

func LongAdditionOperatorWithZeroAndSmallNumber_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(12)
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "12"
    {
        return true
    }
    else 
    {
        return false
    }
}

func LongAdditionOperatorWithZeroAndLargeNumber_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long("99920202")
    let num2 = Long()
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "99920202"
    {
        return true
    }
    else 
    {
        return false
    }
}

func LongAdditionOperatorWithCarry_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long(999)
    let num2 = Long(1)
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "1000"
    {
        return true
    }
    else 
    {
        return false
    }
}

func LongAdditionOperatorWithCarry2_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long(1)
    let num2 = Long(999)
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "1000"
    {
        return true
    }
    else 
    {
        return false
    }
}

func LongAdditionOperatorWithRandom_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long(515)
    let num2 = Long(392)
    
    // act
    let actual: Long = num1 + num2
    
    // assert
    if actual.toString == "907"
    {
        return true
    }
    else 
    {
        return false
    }
}

func LongSubtractionOperatorWithLargeNumbers_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long("65782346172398574326578234587120398471623457863247851237498017238957")
    let num2 = Long("6578623781235465765736485328174981256")
    
    // act
    let actual: Long = num1 - num2
    
    // assert
    if actual.toString == "65782346172398574326578234587113819847842222397482114752169842257701"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongSubtractionOperatorWithSmallNumbers_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long(67.5)
    let num2 = Long(30)
    
    // act
    let actual: Long = num1 - num2
    
    // assert
    if actual.toString == "37"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongSubtractionOperatorWithZeros_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual = num1 - num2
    
    // assert
    if actual.toString == "0"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongSubtractionOperatorWithZeroAndSmallNumber_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(56)
    
    // act
    let actual: Long = num1 - num2
    
    // assert
    if actual.toString == "-56"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongOppositeOperatorWithPositiveNumber_Long_Long() -> Bool
{
    // arrange
    let num = Long(85)
    
    // act
    let actual: Long = -num
    
    // assert
    if actual.toString == "-85"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongOppositeOperatorWithNegativeNumber_Long_Long() -> Bool
{
    // arrange
    let num = Long(-34)
    
    // act
    let actual: Long = -num
    
    // assert
    if actual.toString == "34"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithLargeNumbers_LongLong_Long() -> Bool
{
    // arrange 
    let num1 = Long("645234264675968736368794564321344893748972211114879667833354897")
    let num2 = Long("7442315689453212004897445054878333541548977045552242498798542134")
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "4802037091370768542673309177789219759822795773499689537147282979102654057816934190465510650172409043295416050144671081829730198"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithSmallNumbers_LongLong_Long() -> Bool
{
    // arrange 
    let num1 = Long(78)
    let num2 = Long(12)
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "936"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithZeros_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "0"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithZeroAndLargeNumber_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long("89072485661611114325678989472")
    let num2 = Long()
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "0"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithZeroAndSmallNumber_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(39)
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "0"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithOneNegativeNumber_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long("-27348975")
    let num2 = Long(87)
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "-2379360825"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongMultiplicationOperatorWithTwoNegativeNumbers_LongLong_Long() -> Bool
{
    // arrange
    let num1 = Long(-54)
    let num2 = Long("-2")
    
    // act
    let actual = num1 * num2
    
    // assert
    if actual.toString == "108"
    {
        return true
    }
    else
    {
        return false
    }
}

func LongGreaterThanOperatorWithLargeNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long("863459785413548967444787546431")
    let num2 = Long("863459785413548967443787546431")
    
    // act
    let actual: Bool = num1 > num2
    
    // assert
    return actual
}

func LongGreaterThanOperatorWithSmallNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long(783)
    let num2 = Long(12)
    
    // act
    let actual: Bool = num1 > num2
    
    // assert
    return actual
}

func LongGreaterThanOperatorWithZeros_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual: Bool = num1 > num2
    
    // assert
    return !actual
}

func LongGreaterThanOperatorWithZeroAndSmallNumber_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(32)
    
    // act
    let actual: Bool = num1 > num2
    
    // assert
    return !actual
}

func LongGreaterThanOrEqualToOperatorWithLargeNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long("78945631264879543132")
    let num2 = Long("78945631264879543132")
    
    // act
    let actual: Bool = num1 >= num2
    
    // assert
    return actual
}

func LongGreaterThanOrEqualToOperatorWithSmallNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long(98)
    let num2 = Long(99)
    
    // act
    let actual: Bool = num1 >= num2
    
    // assert
    return !actual
}

func LongGreaterThanOrEqualToOperatorWithZeros_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual: Bool = num1 >= num2
    
    // assert
    return actual
}

func LongGreaterThanOrEqualToOperatorWithZeroAndSmallNumber_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(87)
    
    // act
    let actual: Bool = num1 >= num2
    
    // assert
    return !actual
}

func LongLessThanOperatorWithLargeNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long("453189795643421515477878933215564787")
    let num2 = Long("453189795643421515477879933215564787")
    
    // act
    let actual: Bool = num1 < num2
    
    // assert
    return actual
}

func LongLessThanOperatorWithSmallNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long(45.9)
    let num2 = Long(45)
    
    // act
    let actual: Bool = num1 < num2
    
    // assert
    return !actual
}

func LongLessThanOperatorWithZeros_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual: Bool = num1 < num2
    
    // assert
    return !actual
}

func LongLessThanOperatorWithZeroAndSmallNumber_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(152)
    
    // act
    let actual: Bool = num1 < num2
    
    // assert
    return actual
}

func LongLessThanOrEqualToOperatorWithLargeNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long("456781234345")
    let num2 = Long("8974561")
    
    // act
    let actual: Bool = num1 <= num2
    
    // assert
    return !actual
}

func LongLessThanOrEqualToOperatorWithSmallNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long(82)
    let num2 = Long(82.1)
    
    // act
    let actual: Bool = num1 <= num2
    
    // assert
    return actual
}

func LongLessThanOrEqualToOperatorWithZeros_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual: Bool = num1 <= num2
    
    // assert
    return actual
}

func LongLessThanOrEqualToOperatorWithZeroAndSmallNumber_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long(1)
    
    // act
    let actual: Bool = num1 <= num2
    
    // assert
    return actual
}

func LongEqualToOperatorWithLargeNumbers_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long("456789132456879")
    let num2 = Long("789456451321345")
    
    // act
    let actual: Bool = num1 == num2
    
    // assert
    return !actual
}

func LongEqualToOperatorWithSmallNumbers_LongLong_Bool() -> Bool
{
    // arrange 
    let num1 = Long(12)
    var num2 = Long(9)
    num2 = num2 + Long(3)
    
    // act
    let actual: Bool = num1 == num2
    
    // assert
    return actual
}

func LongEqualToOperatorWithZeros_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long()
    let num2 = Long()
    
    // act
    let actual: Bool = num1 == num2
    
    // assert
    return actual
}

func LongEqualToOperatorWithZeroAndSmallNumber_LongLong_Bool() -> Bool
{
    // arrange
    let num1 = Long(718273)
    let num2 = Long()
    
    // act
    let actual: Bool = num1 == num2
    
    // assert
    return !actual
}

func LongAddAssignWithLargeNumbers_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long("657483885756738475")
    let num2 = Long("-72838495960")
    
    // act
    num1 += num2
    
    // assert
    return num1 == Long("657483812918242515")
}

func LongAddAssignWithSmallNumbers_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long(58)
    let num2 = Long(2)
    
    // act
    num1 += num2
    
    // assert
    return num1 == Long(60)
}

func LongAddAssignWithZeros_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long()
    let num2 = Long()
    
    // act
    num1 += num2
    
    // assert
    return num1 == Long()
}

func LongAddAssignWithZeroAndSmallNumber_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long()
    let num2 = Long(-38)
    
    // act
    num1 += num2
    
    // assert
    return num1 == Long(-38)
}

func LongSubAssignWithLargeNumbers_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long("-7332124256")
    let num2 = Long("99928475899212")
    
    // act
    num1 -= num2
    
    // assert
    return num1 == Long("-99935808023468")
}

func LongSubAssignWithSmallNumbers_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long(104)
    let num2 = Long(23)
    
    // act
    num1 -= num2
    
    // assert
    return num1 == Long(81)
}

func LongSubAssignWithZeros_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long()
    let num2 = Long("-0")
    
    // act
    num1 -= num2
    
    // assert
    return num1 == Long()
}

func LongSubAssignWithZeroAndSmallNumber_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long()
    let num2 = Long(-672)
    
    // act
    num1 -= num2
    
    // assert
    return num1 == Long(672)
}

func LongMultAssignWithLargeNumbers_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long("-3472849538294")
    let num2 = Long("-1738593824")
    
    // act
    num1 *= num2
    
    // assert
    return num1 == Long("6037874758959199896256")
}

func LongMultAssignWithSmallNumbers_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long(732)
    let num2 = Long(82)
    
    // act
    num1 *= num2
    
    // assert
    return num1 == Long(60024)
}

func LongMultAssignWithZeros_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long()
    let num2 = Long()
    
    // act
    num1 *= num2
    
    // assert
    return num1 == Long()
}

func LongMultAssignWithZeroAndSmallNumber_LongLong_Long() -> Bool
{
    // arrange
    var num1 = Long()
    let num2 = Long(888)
    
    // act
    num1 *= num2
    
    // assert
    return num1 == Long()
}

func LongPowerWithLargeNumber_LongInt_Long() -> Bool
{
    // arrange
    let num1 = Long("72189475")
    let num2: UInt = 5
    
    // act
    let actual = num1.pow(exponent: num2)
    
    // assert
    return actual == Long("1960511603350444742988276943299794921875")
}

func LongPowerWithSmallNumber_LongInt_Long() -> Bool
{
    // arrange
    let num1 = Long(12)
    let num2: UInt = 4
    
    // act
    let actual = num1.pow(exponent: num2)
    
    // assert
    return actual == Long(20736)
}

func LongPowerWithNegativeNumber_LongInt_Long() -> Bool
{
    // arrange
    let num1 = Long(-32)
    let num2: UInt = 7
    
    // act
    let actual = num1.pow(exponent: num2)
    
    // assert
    return actual == Long("-34359738368")
}

func LongPowerWithZeroExponent_LongInt_Long() -> Bool
{
    // arrange
    let num1 = Long("72934759324")
    let num2: UInt = 0
    
    // act
    let actual = num1.pow(exponent: num2)
    
    // assert
    return actual == Long(1)
}

func LongFactorialOperatorWithSmallNumber_Long_Long() -> Bool
{
    // arrange
    let num = Long(6)
    
    // act
    let actual = num.factorial
    
    // assert
    return actual == Long(720)
}

print(LongAdditionOperatorWithLargeNumbers_LongLong_Long())
print(LongAdditionOperatorWithSmallNumbers_LongLong_Long())
print(LongAdditionOperatorWithZeros_LongLong_Long())
print(LongAdditionOperatorWithZeroAndSmallNumber_LongLong_Long())
print(LongAdditionOperatorWithZeroAndLargeNumber_LongLong_Long())
print(LongAdditionOperatorWithCarry_LongLong_Long())
print(LongAdditionOperatorWithCarry2_LongLong_Long())
print(LongAdditionOperatorWithRandom_LongLong_Long())
print(LongSubtractionOperatorWithLargeNumbers_LongLong_Long())
print(LongSubtractionOperatorWithSmallNumbers_LongLong_Long())
print(LongSubtractionOperatorWithZeros_LongLong_Long())
print(LongSubtractionOperatorWithZeroAndSmallNumber_LongLong_Long())
print(LongOppositeOperatorWithPositiveNumber_Long_Long())
print(LongOppositeOperatorWithNegativeNumber_Long_Long())
print(LongMultiplicationOperatorWithLargeNumbers_LongLong_Long())
print(LongMultiplicationOperatorWithSmallNumbers_LongLong_Long())
print(LongMultiplicationOperatorWithZeros_LongLong_Long())
print(LongMultiplicationOperatorWithZeroAndLargeNumber_LongLong_Long())
print(LongMultiplicationOperatorWithZeroAndSmallNumber_LongLong_Long())
print(LongMultiplicationOperatorWithOneNegativeNumber_LongLong_Long())
print(LongMultiplicationOperatorWithTwoNegativeNumbers_LongLong_Long())
print(LongGreaterThanOperatorWithLargeNumbers_LongLong_Bool())
print(LongGreaterThanOperatorWithSmallNumbers_LongLong_Bool())
print(LongGreaterThanOperatorWithZeros_LongLong_Bool())
print(LongGreaterThanOperatorWithZeroAndSmallNumber_LongLong_Bool())
print(LongGreaterThanOrEqualToOperatorWithLargeNumbers_LongLong_Bool())
print(LongGreaterThanOrEqualToOperatorWithSmallNumbers_LongLong_Bool())
print(LongGreaterThanOrEqualToOperatorWithZeros_LongLong_Bool())
print(LongGreaterThanOrEqualToOperatorWithZeroAndSmallNumber_LongLong_Bool())
print(LongLessThanOperatorWithLargeNumbers_LongLong_Bool())
print(LongLessThanOperatorWithSmallNumbers_LongLong_Bool())
print(LongLessThanOperatorWithZeros_LongLong_Bool())
print(LongLessThanOperatorWithZeroAndSmallNumber_LongLong_Bool())
print(LongLessThanOrEqualToOperatorWithLargeNumbers_LongLong_Bool())
print(LongLessThanOrEqualToOperatorWithSmallNumbers_LongLong_Bool())
print(LongLessThanOrEqualToOperatorWithZeros_LongLong_Bool())
print(LongLessThanOrEqualToOperatorWithZeroAndSmallNumber_LongLong_Bool())
print(LongEqualToOperatorWithLargeNumbers_LongLong_Bool())
print(LongEqualToOperatorWithSmallNumbers_LongLong_Bool())
print(LongEqualToOperatorWithZeros_LongLong_Bool())
print(LongEqualToOperatorWithZeroAndSmallNumber_LongLong_Bool())
print(LongAddAssignWithLargeNumbers_LongLong_Long())
print(LongAddAssignWithSmallNumbers_LongLong_Long())
print(LongAddAssignWithZeros_LongLong_Long())
print(LongAddAssignWithZeroAndSmallNumber_LongLong_Long())
print(LongSubAssignWithLargeNumbers_LongLong_Long())
print(LongSubAssignWithSmallNumbers_LongLong_Long())
print(LongSubAssignWithZeros_LongLong_Long())
print(LongSubAssignWithZeroAndSmallNumber_LongLong_Long())
print(LongMultAssignWithLargeNumbers_LongLong_Long())
print(LongMultAssignWithSmallNumbers_LongLong_Long())
print(LongMultAssignWithZeros_LongLong_Long())
print(LongMultAssignWithZeroAndSmallNumber_LongLong_Long())
print(LongPowerWithLargeNumber_LongInt_Long())
print(LongPowerWithSmallNumber_LongInt_Long())
print(LongPowerWithNegativeNumber_LongInt_Long())
print(LongPowerWithZeroExponent_LongInt_Long())
print(LongFactorialOperatorWithSmallNumber_Long_Long())*/

let num = Long(100000)
let result = num.factorial
print(result.toString)
print()
print(result.count)
