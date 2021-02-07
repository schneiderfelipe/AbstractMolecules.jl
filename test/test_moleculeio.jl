@time @testset "moleculeio.jl" begin
    waterio() = IOBuffer("""
        2
        water molecule
        O 0.00000  0.00000  0.22700
        H 0.00000  1.35300 -0.90800
        H 0.00000 -1.35300 -0.90800
    """)
    
    @test read(waterio(), XYZ) == read(waterio(), XYZ{Molecule})
    @test read(waterio(), XYZ{Molecule}) == Molecule(
        [ce"O", ce"H", ce"H"],
        [0.00000  0.00000  0.22700;
         0.00000  1.35300 -0.90800;
         0.00000 -1.35300 -0.90800]',
    )
end