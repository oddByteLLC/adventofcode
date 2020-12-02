print("Begin")

file = io.open("C:\\Users\\Elan Gleiber\\Desktop\\30Days\\numbers.txt", "r");

io.input(file);

local lines = {};

for line in io.lines() do
  table.insert(lines, line);
end

local function RunLoop(input1, input2)
  for k, v in ipairs(lines) do
    if (input1 ~= v and input2 ~= v and input1 + input2 + v == 2020) then
      print(input1 * input2 * v);
    end
  end
end

for i, l in ipairs(lines) do
  num1 = l;
  for k, v in ipairs(lines) do
    num2 = v;
    if(num1 ~= num2) then
      RunLoop(num1, num2);
    end
  end
end

print("End")