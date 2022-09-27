prob = optimproblem("Description", "Radiation Therapy Optimization")
I = optimvar("I",8,"LowerBound",0)

d = [10 7 3 8 8 5 9 10]
D = d*I

prob.Objective = D

prob.Constraints.spinal = 2*I(3) +2*I(7) <=5 

prob.Constraints.A = 3*I(2) +3*I(6) >= 7 
prob.Constraints.B = 3*I(3) +2*I(6) >= 7
prob.Constraints.C = 4*I(3) +2*I(5) >= 7
prob.Constraints.D = 2*I(4) +1*I(7) >= 7

sol = solve(prob)
bar(sol.I)

verticalBeamTable = [4 4 4 4; 3 3 3 3; 2 2 2 2; 1 1 1 1];
horizontalBeamTable = [4 3 2 1; 4 3 2 1; 4 3 2 1; 4 3 2 1];

verticalIntensity = [0 2.33 0 0];
horizontalIntensity = [0 0 1.75 3.5];

horizontalDose = horizontalBeamTable .* horizontalIntensity';
verticalDose = verticalBeamTable .* verticalIntensity;

Doses = horizontalDose + verticalDose;

imagesc(Doses)
hold on
plot([.5 .5 1.5 1.5 2.5 2.5 3.5 3.5 2.5 2.5 0.5],...
 [3.5 2.5 2.5 1.5 1.5 3.5 3.5 4.5 4.5 3.5 3.5], 'r-', "LineWidth",2)
hold off
colorbar

