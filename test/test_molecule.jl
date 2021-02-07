@time @testset "molecule.jl" begin
    carbon_monoxide = Molecule(
        [ce"C", ce"O"],
        [0.000 0.000 0.000;
         0.000 0.000 1.128]',
    )
    @test element(carbon_monoxide) == [ce"C", ce"O"]
    @test element(carbon_monoxide, 1) == ce"C"

    @test coord(carbon_monoxide) == [0.000 0.000 0.000;
                                     0.000 0.000 1.128]'
    @test coord(carbon_monoxide, 1) == [0.000, 0.000, 0.000]

    @test length(carbon_monoxide) == 2

    # Test iteration.
    @test iterate(carbon_monoxide) == ((ce"C", [0.000, 0.000, 0.000]), 2)
    @test iterate(carbon_monoxide, 2) == ((ce"O", [0.000, 0.000, 1.128]), 3)
    @test iterate(carbon_monoxide, 3) === nothing

    # Test equality.
    @test carbon_monoxide == carbon_monoxide
    @test carbon_monoxide == Molecule(
        [ce"C", ce"O"],
        [0.000 0.000 0.000;
         0.000 0.000 1.128]',
    )

    # Test bonds.
    @test bonds(carbon_monoxide) == [(1, 2)]
end