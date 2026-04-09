'''
2) You are given a string, remove all the duplicates and print the unique string.Use loop in the python.
'''


text = input()
result = ""

for ch in text:
    if ch not in result:
        result += ch

print(result)
