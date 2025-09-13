#!/usr/bin/env python3
#

def getlist(fname: str) -> list[tuple[str, str]]:
	r = []
	f = open(fname, 'rb')
	l = f.read().decode('utf-8').split('\n')
	# remove empty lines and trailing newline item
	l = list(filter(None, l))
	f.close()
	for item in l:
		t = item.split(' ', 1)
		# allows using $ as a placeholder for input filename
		t[1] = t[1].replace('$', t[0])
		r.append((t[0], t[1]))
	return r

def main(args: list[str]) -> int:
	itms = getlist('translate.lst')
	from os import makedirs, sep
	from shutil import copy2
	# list comprehension to remove each basename from the tuples of
	# translations, remove duplicates and turn it back into a list
	dirs = list(set([sep.join(i[1].split(sep)[:-1]) for i in itms]))
	for d in dirs:
		makedirs(d, exist_ok=True)
	for i in itms:
		copy2(i[0], i[1], follow_symlinks=True)
	return 0

if __name__ == '__main__':
	from sys import argv, exit
	exit(main(argv))
