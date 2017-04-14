
module TightBinding

using JuLIP
using JuLIP: @protofun
using JuLIP.Potentials: @pot, SitePotential

import JuLIP: energy, forces, cutoff
import JuLIP.Potentials: evaluate, evaluate_d

# using FixedSizeArrays
export hamiltonian, densitymatrix



# TODO: where does this go?????
# TODO: default evaluate!; should this potentially go into JuLIP.Potentials?
evaluate!(pot, r, R, target)  = copy!(target, evaluate(pot, r, R))
evaluate_d!(pot, r, R, target)  = copy!(target, evaluate_d(pot, r, R))
grad(pot, r, R) = R .* (evaluate_d(pot, r, R) ./ r)'
grad!(p, r, R, G) = copy!(G, grad(p, r, R))


# ============================================================================


# abstractions
include("types.jl")

# basics for slater-koster type hamiltonians
include("slaterkoster.jl")

# the TB toy model for quick tests (a slater-koster s-orbital model)
include("toymodel.jl")

# the NRLTB model
# include("NRLTB.jl")

# The Kwon model - a simple orthogonal TB model for Silicon
# include("kwon.jl")

# define how to go from eigenvalues (energy-levels) to potential energy
include("smearing.jl")

# basic calculators for energy and forces
# include("calculators.jl")

# implement the contour integral variants of the TB model
# include("contour.jl")



# perturbation theory module
# include("perturbation.jl")

# implements the "classical" site energy
# include("site_energy.jl")

# implements the "classical" site energy
# include("site_energy.jl")

# implement the contour integral variants
# in particular the site energy
# include("Contour.jl")

# The model of Kwon et al, PRB 49(11)
# include("Orthogonal.jl")


end    # module
