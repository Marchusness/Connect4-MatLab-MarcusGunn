% Function to output a good computer move.

function [ position ] = computerMove(board, difficulty, turns)
disp("Computer move being calculated...");
% makes vector with the columns with all legal moves
legalMoves = [];
for i = 1:7
    if legalMove(board, i)
        legalMoves = [legalMoves i];
    end
end
position = 0;
for j = legalMoves % tests if any of the moves will result in a connect 4. if true the conter position which results in connect 4 will be returned.
    if testConnect4(placeCounter(board, j, "o"),j)
        position = j;
    end
end
if position == 0 
    for j = legalMoves % tests if any moves block a connect 4 from the other player
        if testConnect4(placeCounter(board, j, "x"),j)
            position = j;
        end
    end
end
if position == 0 % makes sure the first 2 moves will stop the player from putting 3 in a row along the bottom as this can sometimes be hard forthe computer.
    if turns == 1 && board(7, 8) == "x"
        position = 3;
    end
end
if position == 0 
    if turns == 1 && (board(7, 10) == "x" || board(7, 6) == "x")
        position = 4;
    end
end
if position == 0 % if a position has not already been decided the following code will be run
    results = [];
    for j = legalMoves % tests all legal moves
        results = [results randomSuccessRatio(board, j, difficulty*100)]; % radnom success ratio is a function which runs many simulations and averages the wins and losses to return a numerical win probobability
    end
    [~, idx] = max(results); % finds the index for the max result 
    disp(results)
    position = legalMoves(idx); % make the function return the coumn with the highest calculated probability of winning
end


end

