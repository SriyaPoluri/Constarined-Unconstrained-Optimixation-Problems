prob = optimproblem("Description","An Optimal Breakfast");
servings = optimvar("servings",16,"Lowerbound",0);
C = food.Price .* servings;
prob.Objective = sum(C)
[sol,optval] = solve(prob)

carbs = food.Carbs .* servings; 
totalCarbs = sum(carbs);
prob.Constraints.carbs = totalCarbs >= 45 

sol = solve(prob) 

bar(food.Name,sol.servings)

optCarbs = evaluate(totalCarbs,sol)

protein = food.Protein .* servings;
totalProtein = sum(protein)
prob.Constraints.protein = totalProtein >= 15

sol2 = solve(prob) 
bar(food.Name,sol2.servings)
optProtein = evaluate(totalProtein,sol2)

vitaminC = food.VitaminC .* servings;
totalVitaminC = sum(vitaminC)
prob.Constraints.vitaminC = totalVitaminC >= 60

sol3 = solve(prob)
bar(food.Name,sol3.servings)
optVitaminC = evaluate(totalVitaminC,sol3)

prob.Constraints.carbs = totalCarbs <= 30
prob.Constraints.protein = totalProtein >= 60  
prob.Constraints.vitaminC = totalVitaminC >= 60

[sol4,optval] = solve(prob)

% prob.Constraints.carbs = totalCarbs <= 14
% prob.Constraints.protein = totalProtein >= 25
% prob.Constraints.vitaminC = totalVitaminC >= 43
% [sol,optval] = solve(prob)
% bar(food.Name,sol.servings)


