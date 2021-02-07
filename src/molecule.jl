"""
Molecule with atomic numbers and coordinates as columns of a matrix.

In the future this will include charge and multiplicity as well.
"""
# TODO: force coords to be n×3 at construction.
struct Molecule{T<:Real, M<:AbstractMatrix{<:T}} <: AbstractMolecule
    elements::Vector{ChemicalElement}
    coords::M
end
element(m::Molecule) = m.elements
coord(m::Molecule) = m.coords
