% function to text is a connect 4 was achieved from the last counter placed
% on the board. 

function [ connect4 ] = testConnect4(board, position)
connect4 = false;
found = false;
row = 2;
while ~found
    if board(row, position*2) == " "
        row = row + 1;
    else
        found = true;
    end
end

leftUp = 0;
left = 0;
leftDown = 0;
down = 0;
rightDown = 0;
right = 0;
rightUp = 0;

%counts number of the same counters left up from the last counter placed 
while position - 1 - leftUp > 0 && row - 1 - leftUp > 1 && board(row-1-leftUp, (position-1-leftUp)*2) == board(row, position*2)
    leftUp = leftUp + 1;
end

%counts number of the same counters left from the last counter placed 
while position - 1 - left > 0 && board(row, (position-1-left)*2) == board(row, position*2)
    left = left + 1;
end

%counts number of the same counters left down from the last counter placed 
while position - 1 - leftDown > 0 && row + 1 + leftDown < 8 && board(row+1+leftDown, (position-1-leftDown)*2) == board(row, position*2)
    leftDown = leftDown + 1;
end

%counts number of the same counters down from the last counter placed 
while row + 1 + down < 8 && board(row+1+down, (position)*2) == board(row, position*2)
    down = down + 1;
end

%counts number of the same counters right down from the last counter placed 
while position + 1 + rightDown < 8 && row + 1 + rightDown < 8 && board(row+1+rightDown, (position+1+rightDown)*2) == board(row, position*2)
    rightDown = rightDown + 1;
end

%counts number of the same counters right from the last counter placed
while position + 1 + right < 8 && board(row, (position+1+right)*2) == board(row, position*2)
    right = right + 1;
end

%counts number of the same counters right up from the last counter placed
while position + 1 + rightUp < 8 && row - 1 - rightUp > 1 && board(row-1-rightUp, (position+1+rightUp)*2) == board(row, position*2)
    rightUp = rightUp + 1;
end

% if the number of counters in a line are larger than 2 (3 or above) a
% connect 4 is achieved and connect4 = true.
% only require 3 or above as the middle counter is not counted in the
% calculation
if down > 2 || leftUp + rightDown > 2 || left + right > 2 || leftDown + rightUp > 2
    connect4 = true ;
end

end

