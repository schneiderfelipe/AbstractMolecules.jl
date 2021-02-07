abstract type FileFormat end

struct XYZ{M<:AbstractMolecule} <: FileFormat end

function Base.read(input::IO, ::Type{XYZ{M}}) where {M<:AbstractMolecule}    
    # TODO: allow going straight to atoms (i.e., "no number, no comment"
    # dialect).
    line = readline(input)
    
    n = parse(Int, line)
    comment = readline(input)

    # TODO: allow reading many molecules from a single stream.
    elements = ChemicalElement[]
    coords = Matrix{Float64}(undef, 3, 0)
    for line in eachline(input)
        fields = split(line)

        element = ChemicalElement(fields[1])
        coord = parse.(Float64, fields[2:4])

        push!(elements, element)
        coords = hcat(coords, coord)
    end

    return M(elements, coords)
end
# We default to Molecule if no AbstractMolecule was given.
Base.read(input::IO, ::Type{XYZ}) = read(input, XYZ{Molecule})
