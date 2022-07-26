% this driver was used to test each individual testing functions prior to
% making the final function version used by the real game.


% Board = [
%     '.1 2 3 4 5 6 7.';
%     '| | | | | | | |';
%     '| | | | | | | |';
%     '| | | | | | | |';
%     '| | | | | | | |';
%     '| | | | | | | |';
%     '| | | | | | | |'
% ];
% Board = placeCounterTesting(Board, 4, "x");
% Board = placeCounterTesting(Board, 4, "o");
% Board = placeCounterTesting(Board, 4, "x");
% Board = placeCounterTesting(Board, 4, "o");
% Board = placeCounterTesting(Board, 4, "x");
% Board = placeCounterTesting(Board, 4, "o");
% disp(Board);


% Board = [
%     '.1 2 3 4 5 6 7.';
%     '| | | |o| | | |';
%     '| | | |x| | | |';
%     '| | | |o| | | |';
%     '| | | |x| | | |';
%     '| | | |o| | | |';
%     '| | | |x| | | |'
% ];
% disp(legalMoveTesting(Board, 4));
% disp(legalMoveTesting(Board, 3));

% Board = [
%     '.1 2 3 4 5 6 7.';
%     '| | | | | | | |';
%     '| | |x| | | | |';
%     '| | | |x| | | |';
%     '| | | | |x| | |';
%     '| | | | | |x| |';
%     '| | | | | | | |'
% ];
% 
% 
% if testConnect4Testing(Board, 4)
%     disp("Winner");
% end



Board = [
    '.1 2 3 4 5 6 7.';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | | | | | | |';
    '| | |0|x|x|o| |'
];


disp(computerMoveTesting(Board,6))


    
    
    