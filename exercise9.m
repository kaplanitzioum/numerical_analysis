%Exercise 9
% algorithm 3
a=2; 
init_guesses = [1.1, 1.4, 1.5, 1.7, 1.8];

for i=1:length(init_guesses)
    y = init_guesses(i);
    fprintf('\n for initial guess: %.1f\n', y);
    for n = 1:6
        y = y +y^2 -a;
        
        fprintf('step %d: %.4e\n',n,y);
    end
end
