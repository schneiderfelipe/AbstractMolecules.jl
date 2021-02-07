using AbstractMolecules
using Documenter

makedocs(;
    modules=[AbstractMolecules],
    authors="Felipe S. S. Schneider <schneider.felipe@posgrad.ufsc.br> and contributors",
    repo="https://github.com/schneiderfelipe/AbstractMolecules.jl/blob/{commit}{path}#L{line}",
    sitename="AbstractMolecules.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://schneiderfelipe.github.io/AbstractMolecules.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/schneiderfelipe/AbstractMolecules.jl",
)
