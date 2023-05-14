# Program to solve economic load dispatch problem using coordination equation

#input data:
#Cost matrix: Ci = ai+(bi*Pgi)+(ci*Pgi^2)
#column1-ai, column2-bi,column3-ci
#PD
cost = [[150,25,0.1],[180,30,0.15],[200,20,0.125]]
print("Cost matrix = ",cost)
pd = 100

# no. of generators
N = len(cost)

b = [item[1] for item in cost]
c = [item[2] for item in cost]


#lambda
num=0
den=0
for i in range (0,N,1):
    num = num+(b[i]/(2*c[i]))
    den = den+(1/(2*c[i]))
lambda1=(pd+num)/den
print('lambda = ',lambda1)

#power generation
pg = [0]*N
for i in range (0,N,1):
    pg[i] = (lambda1-b[i])/(2*c[i])
    print('Power generation by generator-',i+1,' = ',pg[i])
print ('Pg = ',pg)

