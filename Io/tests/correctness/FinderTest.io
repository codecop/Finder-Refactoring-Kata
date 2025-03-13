doRelativeFile("../../io/Finder.io")
doRelativeFile("../../io/F.io")
doRelativeFile("../../io/FT.io")
doRelativeFile("../../io/Thing.io")

FinderTest := UnitTest clone do(

    sue := Thing clone
    greg := Thing clone
    sarah := Thing clone
    mike := Thing clone

    setUp := method(
        self sue name = "Sue"
        self sue birthDate = Date clone setYear(1970) setMonth(1) setDay(1)
        self greg name = "Greg"
        self greg birthDate = Date clone setYear(1972) setMonth(6) setDay(1)
        self sarah name = "Sarah"
        self sarah birthDate = Date clone setYear(2002) setMonth(1) setDay(1)
        self mike name = "Mike"
        self mike birthDate = Date clone setYear(1999) setMonth(1) setDay(1)
    )

    test_returns_Empty_Results_When_Given_Empty_List := method(
        l := list()
        finder := Finder with(l)

        result := finder Find(FT One)

        assertEquals(nil, result P1)
        assertEquals(nil, result P2)
    )

    test_returns_Empty_Results_When_Given_One_FT := method(
        l := list()
        l append(sue)

        finder := Finder with(l)

        result := finder Find(FT One)

        assertEquals(nil, result P1)
        assertEquals(nil, result P2)
    )

    test_returns_One_Two_For_Two_FTs := method(
        l := list()
        l append(sue)
        l append(greg)
        finder := Finder with(l)

        result := finder Find(FT One)

        assertEquals(sue, result P1)
        assertEquals(greg, result P2)
    )

    test_returns_Two_Two_For_Two_FTs := method(
        l := list()
        l append(mike)
        l append(greg)
        finder := Finder with(l)

        result := finder Find(FT Two)

        assertEquals(greg, result P1)
        assertEquals(mike, result P2)
    )

    test_returns_Two_Two_For_Four_FTs := method(
        l := list()
        l append(sue)
        l append(sarah)
        l append(mike)
        l append(greg)
        finder := Finder with(l)

        result := finder Find(FT Two)

        assertEquals(sue, result P1)
        assertEquals(sarah, result P2)
    )

    test_returns_One_Two_For_Four_FTs := method(
        l := list()
        l append(sue)
        l append(sarah)
        l append(mike)
        l append(greg)
        finder := Finder with(l)

        result := finder Find(FT One)

        assertEquals(sue, result P1)
        assertEquals(greg, result P2)
    )

)
