'''
1) Given number of minutes, convert it into human readable form.
Example :
130 becomes “2 hrs 10 minutes”
110 becomes “1hr 50minutes”
'''

minutes = int(input())

hours = minutes // 60
mins = minutes % 60

print(f"{hours} hrs {mins} minutes")

