prob = optimproblem("Description","Factory Location");

x = optimvar("x");
y = optimvar("y");

X = [5 40 70];
Y = [20 50 15];

d = sqrt((x-X).^2 + (y-Y).^2);

dTotal = sum(d);

prob.Objective = dTotal;

show(prob)

initialGuess.x = 14;
initialGuess.y = 34; 

[sol,optval] = solve(prob,initialGuess)

xOpt = sol.x 
yOpt = sol.y

plotStores

hold on
scatter(xOpt,yOpt)
hold off

dTotalEval = evaluate(dTotal,sol)

dEval = evaluate(d,sol)

dTotalEval = sum(dEval)


