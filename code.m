clc,clear,close all

%% solving the IVP
%
% decalare the symbolic variables (including the initial condition y0)
syms y(t) y0
% define the ode
ode = diff(y,t) == t*sin(y);
% set the initial condition to the symbolic variable y0
cond = y(0) == y0;
% solve the ode
ysol = dsolve(ode,cond)

%% varying the initial conditions and plotting the solution
%
conds = [1 1.5 2]; % assume some values for y0
t = linspace(0,4,50); %assume some values for time

% evaluate y(t) at each value of the initial condition
for i=1:numel(conds)
y0 = conds(i);
y = subs(ysol,y0); % substitute the initial condition
y = subs(y,t); % substitute the time vector
y = double(y); % convert the resulting array to double for plotting
plot(t,y,'color',rand(1,3),'linewidth',2)
legendInfo{i} = strcat('y(0) = ',num2str(conds(i)));
hold on
end
title('Symbolic Solutions'),legend(legendInfo,'location','best')
xlabel('t'),ylabel('y(t)'),grid on
