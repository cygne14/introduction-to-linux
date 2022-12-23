#!/usr/bin/env python3

import sys


score = {}

with open(sys.argv[1]) as inp:
	for line in inp:
		line = line.strip()
		args = line.split()

		if args[0] == "add":
			if args[1] not in score:
				score[args[1]] = 0
			score[args[1]] += int(args[3])

		elif args[0] == "summary":
			print(" ".join(args[1:]))

			sScore = sorted(score.items())
			for i in range(len(score)):
				print("  {}: {}".format(sScore[i][0], sScore[i][1]))

		elif args[0] == "csv":
			f = open(args[1], "w")
			f.write("team,score")
			sScore = sorted(score.items())
			for i in range(len(score)):
				f.write("\n{},{}".format(sScore[i][0], sScore[i][1]))
			f.close	

		elif args[0] == "podium":
			print("Medal podium")
			score = sorted(score.items(), key=lambda x: x[1], reverse=True)
			print(" ", score[0][0])
			print(" ", score[1][0])
			print(" ", score[2][0])


