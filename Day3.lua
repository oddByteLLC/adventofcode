file = io.open("C:\\Users\\elang\\Documents\\30Days\\ski.txt", "r");

io.input(file);

Geography = {};

currentLine = 1;
currentPos = 1;
treeCharacter = "#";

lineIncrease = 1;
posIncrease = 3;
maxLineCount = 0;
maxPosCount = 0;

for line in io.lines() do
  table.insert(Geography, line);
  maxLineCount = maxLineCount + 1;
end

maxPosCount = string.len(Geography[1]);

local function GetNextLine()
  if currentLine + lineIncrease <= maxLineCount then
    return currentLine + lineIncrease;
  else
    return nil;
  end
end

local function GetNextPos()
  if currentPos + posIncrease <= maxPosCount then
   return currentPos + posIncrease;
  else
    return (currentPos + posIncrease) - maxPosCount;
  end
end

local function HitTest(lineToTest, curPos)
  if string.sub(lineToTest, curPos, curPos) == treeCharacter then
    return true;
  else
    return false;
  end
end

local function Run(newLineIncrease, newPosIncrease)
  local treesHit = 0;
  currentLine = 1;
  currentPos = 1;
  lineIncrease = newLineIncrease;
  posIncrease = newPosIncrease;
  while true do
    currentLine = GetNextLine();   
    if currentLine == nil then break end;
    currentPos = GetNextPos();
    if HitTest(Geography[currentLine], currentPos) then
      treesHit = treesHit + 1; 
    end
  end
  return treesHit;
end

print(Run(1, 3));

-- Second Part

print(Run(1,1) * Run(1,3) * Run(1,5) * Run(1,7) * Run(2,1));