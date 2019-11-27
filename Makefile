all: oto.gen.hfst 

oto.lexc.hfst: oto.lexc
	hfst-lexc $< -o $@

oto.twol.hfst: oto.twol
	hfst-twolc $< -o $@

oto.gen.hfst: oto.twol.hfst oto.lexc.hfst
	hfst-compose-intersect -1 oto.lexc.hfst -2 oto.twol.hfst -o $@
