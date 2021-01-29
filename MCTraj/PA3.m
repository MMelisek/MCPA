%Mitchell Melisek
%PA-3: MC

m=9.109e-31; %mass of an electron
q=1.602e-19; %charge of an electron

x=0;
v=0;
t=0;

field=5; %Initializing field
force=field*q; %Inittializing force equation

dt=1e-8; %Wavelength of electron (mm) used for time step
v=zeros(1,1); %Setting velocity v to zero
x=zeros(1,1); %Setting position x to zero
v_drift=0;
v_drift1=0;
v_total=0;

k=force/m*dt;
b=(force/(m*dt)^2)/2;


for j=2:1000
    
    t(j) = t(j-1)+dt; %Adjusting the time appropriately 
    v(:,j) = v(:,j-1) + k; %Adjusting current velocity accordingly
    x(:,j) = x(:,j-1) + v(:,j-1)*dt + b; %Incrementing current x postion with regard to velocity
    
    if (rand() <= 0.05) %Assigning scattering probability of 0.05
        v(:,j)=0;
    end
    
    v_drift1 = v_drift;
    v_total = v_total + v(:,j);
    v_drift(j,:) = v_total/j; %Calc for drift velocity to include in plot
    
    subplot(2,1,1);
    plot(t,v,'r'); %Plotting Velocity vs Time
    grid on
    xlabel('Time')
    ylabel('Velocity')
    hold on
    string=(['Velocity vs Time, Drift Velocity:' num2str(v_drift(j))]);
    title(string)
    
    subplot(2,1,2);
    plot(t,x,'g'); %Plotting x Position vs Time
    grid on
    hold off
    title('x Position vs Time')
    xlabel('Time')
    ylabel('x Position')

    pause(0.01)
    
end

hold off;
    
