part1 = (1, 2, 3)
part2 = ['a', 'b', 'c']
result = list(zip(part1, part2))
print(result)





with open('Lesson #5 zip.py', 'r') as file:
    contents = file.read()


words = contents.split()


freq_dict = {}
for word in words:
    if word in freq_dict:
        freq_dict[word] += 1
    else:
        freq_dict[word] = 1


sorted_freq = sorted(freq_dict.items(), key=lambda x: x[1], reverse=True)


for word, freq in sorted_freq:
    print(f"{word}: {freq}")


