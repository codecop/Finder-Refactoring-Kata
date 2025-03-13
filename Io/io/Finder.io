Finder := Object clone do(

    with := method(p,
        result := self clone
        result _p := p
        result
    )

    Find := method(ft,
        tr := list()

        for(i, 0, _p size - 1,
            j := i + 1
            while (j < _p size,
                r := F clone
                if (_p at(i) birthDate asNumber < _p at(j) birthDate asNumber,
                    r P1 = _p at(i)
                    r P2 = _p at(j)
                ,
                    r P1 = _p at(j)
                    r P2 = _p at(i)
                )
                r D = r P2 birthDate asNumber - r P1 birthDate asNumber
                tr append(r)
                j = j + 1
            )
        )

        if (tr size < 1,
            return F clone
        )

        answer := tr at(0)
        tr foreach(result,
            ft switch (
                FT One,
                if (result D < answer D,
                    answer = result
                )
                ,
                FT Two,
                if (result D > answer D,
                    answer = result
                )
            )
        )

        answer
    )
)
