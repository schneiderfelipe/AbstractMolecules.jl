"""
All you have to define is `element(::YourMolecule)::AbstractVector` and
`coord(::YourMolecule)::AbstractMatrix` for
`YourMolecule <: AbstractMolecule`.
"""
abstract type AbstractMolecule end
Base.length(m::AbstractMolecule) = length(element(m))

Base.iterate(m::AbstractMolecule, n::Int=1) = n > length(m) ? nothing : ((element(m, n), coord(m, n)), n + 1)

# The two definitions below might be inefficient, not sure. In any case, the
# user can always implement efficient versions of them.
element(m::AbstractMolecule, n::Int) = element(m)[n]
coord(m::AbstractMolecule, n::Int) = coord(m)[:, n]

# NOTE: We assume molecules are equal if their elements and coordinates
# are equal. This can lead to surprises when atoms are permuted.
function Base.hash(m::AbstractMolecule, h::UInt)
    return hash(coord(m),
        hash(element(m),
        hash(:AbstractMolecule, h)))
end

function Base.:(==)(m::AbstractMolecule, n::AbstractMolecule)
    return isequal(coord(m), coord(n)) &&
        isequal(element(m), element(n))
end

function bonds(m::AbstractMolecule)
    res = Tuple{Int, Int}[]

    n = length(m)
    for i in 1:n, j in (i + 1):n
        ceᵢ, coordᵢ = ChemicalElement(element(m, i)), coord(m, i)
        ceⱼ, coordⱼ = ChemicalElement(element(m, j)), coord(m, j)

        # The 0.6 is required so that some hydrogens don't get too many bonds.
        if norm(coordⱼ - coordᵢ) < 0.7 * (radius(ceᵢ) + radius(ceⱼ))
            push!(res, (i, j))
        end
    end

    return res
end
