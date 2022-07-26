% as can be seen i was intially going to use a low of if statements before
% i ddecided that using wile statements would be far better and easier to
% understand



function [ connect4 ] = testConnect4Testing(board, position)
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

while position - 1 - leftUp > 0 && row - 1 - leftUp > 1 && board(row-1-leftUp, (position-1-leftUp)*2) == board(row, position*2)
    leftUp = leftUp + 1;
end

while position - 1 - left > 0 && board(row, (position-1-left)*2) == board(row, position*2)
    left = left + 1;
end

while position - 1 - leftDown > 0 && row + 1 + leftDown < 8 && board(row+1+leftDown, (position-1-leftDown)*2) == board(row, position*2)
    leftDown = leftDown + 1;
end

while row + 1 + down < 8 && board(row+1+down, (position)*2) == board(row, position*2)
    down = down + 1;
end

while position + 1 + rightDown < 8 && row + 1 + rightDown < 8 && board(row+1+rightDown, (position+1+rightDown)*2) == board(row, position*2)
    rightDown = rightDown + 1;
end

while position + 1 + right < 8 && board(row, (position+1+right)*2) == board(row, position*2)
    right = right + 1;
end

while position + 1 + rightUp < 8 && row - 1 - rightUp > 1 && board(row-1-rightUp, (position+1+rightUp)*2) == board(row, position*2)
    rightUp = rightUp + 1;
end

if down > 2 || leftUp + rightDown > 2 || left + right > 2 || leftDown + rightUp > 2
    connect4 = true ;
end

% if col < 5
%     if board(col+1, position*2) == board(col, position*2) && board(col+2, position*2) == board(col, position*2) && board(col+3, position*2) == board(col, position*2)
%         connect4 = true;
%     end
%     if position > 3
%         if board(col+1, position*2-2) == board(col, position*2) && board(col+2, position*2-4) == board(col, position*2) && board(col+3, position*2-6) == board(col, position*2)
%             connect4 = true;
%         end
%     end
%     
%     if position < 5
%         if board(col+1, position*2+2) == board(col, position*2) && board(col+2, position*2+4) == board(col, position*2) && board(col+3, position*2+6) == board(col, position*2)
%             connect4 = true;
%         end
%     end
% end
% 
% if position > 3
%     if board(col, position*2-2) == board(col, position*2) && board(col, position*2-4) == board(col, position*2) && board(col, position*2-6) == board(col, position*2)
%         connect4 = true;
%     end
%     if col > 4
%         if board(col-1, position*2-2) == board(col, position*2) && board(col-2, position*2-4) == board(col, position*2) && board(col-3, position*2-6) == board(col, position*2)
%             connect4 = true;
%         end
%     end
% end
% 
% if position < 5
%     if board(col, position*2+2) == board(col, position*2) && board(col, position*2+4) == board(col, position*2) && board(col, position*2+6) == board(col, position*2)
%         connect4 = true;
%     end
%     if col > 4
%         if board(col-1, position*2+2) == board(col, position*2) && board(col-2, position*2+4) == board(col, position*2) && board(col-3, position*2+6) == board(col, position*2)
%             connect4 = true;
%         end
%     end
% end

end

