all: oto.gen.hfst oto.mor.hfstol

oto.lexc.hfst: oto.lexc
	hfst-lexc $< -o $@

oto.twol.hfst: oto.twol
	hfst-twolc $< -o $@

oto.gen.hfst: oto.twol.hfst oto.lexc.hfst
	hfst-compose-intersect -1 oto.lexc.hfst -2 oto.twol.hfst -o $@


oto.mor.hfst: oto.gen.hfst oto.mor.twol.hfst
	hfst-compose-intersect -1 oto.gen.hfst -2 oto.mor.twol.hfst | hfst-invert -o $@

oto.mor.hfstol: oto.mor.hfst
	hfst-fst2fst -w $< -o $@
	
oto.mor.twol.hfst: oto.mor.twol
	hfst-twolc oto.mor.twol.hfst -o oto.mor.hsft
	
