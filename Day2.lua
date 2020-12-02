file = io.open("C:\\Users\\Elan Gleiber\\Desktop\\30Days\\passwords.txt", "r");

io.input(file);

local function ParseInput(lineToCheck)
  inputTable = {};
  
  local checkTable = {};
  for w in lineToCheck:gmatch("%a+") do
    table.insert(checkTable, w);
  end
  
  inputTable.character = checkTable[1];
  inputTable.password = checkTable[2];
  
  inputTable.minCount, inputTable.maxCount = string.match(lineToCheck,"(%d+)-(%d+)");
  
  inputTable.minCount = tonumber(inputTable.minCount);
  inputTable.maxCount = tonumber(inputTable.maxCount);
  
  return inputTable;
end

local function RunPasswordCheck(inputTable)
  local charCount = 0;
  
  for w in string.gmatch(inputTable.password, "(%w)") do
    if w == inputTable.character then
      charCount = charCount + 1;
    end
  end
  
  if charCount >= inputTable.minCount and charCount <= inputTable.maxCount then
    return true;
  else
    return false;
  end
end

local function RunPasswordCheck2(inputTable)
  minFound = string.sub(inputTable.password, inputTable.minCount,inputTable.minCount) == inputTable.character;
  maxFound = string.sub(inputTable.password, inputTable.maxCount,inputTable.maxCount) == inputTable.character;
  
  return minFound ~= maxFound;
end

successCount = 0;
successCount2 = 0;

for line in io.lines() do
  if RunPasswordCheck(ParseInput(line)) then
    successCount = successCount + 1;
  end
  
  if RunPasswordCheck2(ParseInput(line)) then
    successCount2 = successCount2 + 1;
  end
end

print(successCount);
print(successCount2);