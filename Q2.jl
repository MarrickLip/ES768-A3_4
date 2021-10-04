# import Pkg
# Pkg.add(["JuMP", "Ipopt"])

using JuMP, Ipopt

model = Model(Ipopt.Optimizer)
set_silent(model)

@variable(model, x₁)
@variable(model, x₂)

@NLobjective(model, Min, 4*(x₁-2)^2 + (x₂-1)^2)
@NLconstraint(model, (x₁-2)^2 + x₂^2 >= 4)
@NLconstraint(model, x₁ + x₂ >= 4)

optimize!(model)
@show termination_status(model)
@show objective_value(model)
@show value.([x₁, x₂])


