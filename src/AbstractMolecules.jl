module AbstractMolecules

using LinearAlgebra

using ChemicalElements
export @ce_str  # reexported

export AbstractMolecule
export Molecule
export element
export coord
export bonds

include("abstractmolecule.jl")
include("molecule.jl")

# NOTE: the below will probably go somewhere else soon.
export XYZ
include("moleculeio.jl")

end
