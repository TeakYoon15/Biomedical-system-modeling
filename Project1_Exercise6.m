%% Parameter Setting
t=(0:0.5:120);
k=0.05;
y=75*exp(-k.*t);
linear=log(y);
global interval_K;
global interval_cnt;
global flag;
global ssq1;
global K_array;
interval_K=[];
interval_cnt=1;
flag=0;
ssq1=[];
K_array=[];
clear k
%% fminsearch
fminsearch(@(k) fSSQ(k,t,y),0);
%% Plot SSQ vs. iterration
flag=1;
fminsearch(@(k) fSSQ(k,t,y),0);
figure(1);
plot(interval_K(1,:),ssq1,'-r');
xlabel('interval(number)');
ylabel('SSQ');
hold on
%% Plot k_estimated vs. Iteration
figure(2);
plot(interval_K(1,:),interval_K(2,:),'-r');

xlabel('interval(number)');
ylabel('k estimated(arbitray)');
hold on
%% Plot fitting curve at every iteration
flag=2;
fminsearch(@(k) fSSQ(k,t,y),0);
figure(3);
L=length(K_array);
for n=1:L
d=75*exp(-K_array(1,n).*t);
plot(d);
hold on
end

xlabel('interval(number)');
ylabel('drug in body(g)');
