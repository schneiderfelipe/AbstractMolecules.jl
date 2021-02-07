using AbstractMolecules
using Test

@testset "AbstractMolecules.jl" begin
    include("test_molecule.jl")
    include("test_moleculeio.jl")
end
