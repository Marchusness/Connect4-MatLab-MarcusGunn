% a function to test if a move inputed is legal (return true) or not legal
% (return false)
function [ legal ] = legalMove(board, position)
legal = false;
if position > 0 && position < 8
    if board(2, position*2) == " "
        legal = true;
    end
end
end

