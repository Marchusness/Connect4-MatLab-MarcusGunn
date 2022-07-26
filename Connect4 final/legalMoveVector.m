% creates a vector with the number of legal moves in each column. makes it
% quicker for the computer move as the legal move wont need to be checked
% every move. instead the position in the vector can be checked.
function [ legal ] = legalMoveVector(board)
legal = [0 0 0 0 0 0 0];
for i = 1:7
    for j = 2:7
        if board(j, i*2) == " "
            legal(i) = j-1;
        end
    end
end
end

