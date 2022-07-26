% this was the testing for the randomSuccessRatio function. this was the
% first itteration to function. whereas there were a couple bugs in this
% function which were changed before making the final randomSuccessRatio
% function used in the game

function [ successRatio ] = randomSuccessRatioTesting(board, firstMove, iterations)
Board = placeCounter(board, firstMove, "o");
moves = legalMoveVector(Board);
results = [];
for i = 1:iterations
    winnerDecided = false;
    while ~winnerDecided
        if moves == [0 0 0 0 0 0 0]
            winnerDecided = true;
        else
            Player1 = 0;
            for j = 1:7
                if moves(j) > 0
                    if testConnect4(placeCounter(Board, j, "x"),j)
                        Player1 = j;
                    end
                end
            end
            if Player1 == 0
                for j = 1:7
                    if moves(j) > 0
                        if testConnect4(placeCounter(Board, j, "o"),j)
                            Player1 = j;
                        end
                    end
                end
            end
            if Player1 == 0
                Player1 = randi(7);
            end
            while moves(Player1) < 1
                Player1 = randi(7);
            end
            moves(Player1) = moves(Player1)-1;
            Board = placeCounter(Board, Player1, "x");
            if testConnect4(Board, Player1)
                winnerDecided = true;
                results = [results 1];
            else
                if moves == [0 0 0 0 0 0 0]
                    winnerDecided = true;
                    results = [results 10];
                else
                    Player2 = 0;
                    for j = 1:7
                        if moves(j) > 0
                            if testConnect4(placeCounter(Board, j, "o"),j)
                                Player2 = j;
                            end
                        end
                    end
                    if Player2 == 0
                        for j = 1:7
                            if moves(j) > 0
                                if testConnect4(placeCounter(Board, j, "x"),j)
                                    Player2 = j;
                                end
                            end
                        end
                    end
                    if Player2 == 0
                        Player2 = randi(7);
                    end
                    while moves(Player2) < 1
                        Player2 = randi(7);
                    end
                    moves(Player2) = moves(Player2)-1;
                    Board = placeCounter(Board, Player2, "o");
                    if testConnect4(Board, Player2)
                        winnerDecided = true;
                        results = [results 100];
                    end
                end
            end
        end
    end
end

successRatio = mean(results);
end