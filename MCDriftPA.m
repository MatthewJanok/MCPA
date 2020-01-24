clc
clear

mo = 9.11e-31;
kb = 1.381e-23;
T = 300;

%Initialise the particles
initialX = 0;
initialY = 0;





%set acceleration
force = 18e-30;
vold = 0;
vth = sqrt((kb*T)/mo);


for time = 0:0.001:1
    
    accel = force/mo;
    
    %randomise angles
    angleRad = 2*pi*rand(1,1);

    %Find new positions
    scatter = randi(100,1);
    
    if scatter <= 5
        vnew = 0;
        t1 = time;
        
    else
        vnew = (force/mo)*2 + vold;
        deltaLx = (force/mo)*(0.001^2/2) + (vold*0.001);
        newX = initialX + deltaLx;
        figure(1)
        subplot(2,2,1:2)
        title('Position')
        plot(newX,0, 'o')
        hold on
        axis ([0 1000 -50 50])
        t2 = time;
       
    end
    
    vdrift = mean(vnew)
    
    figure(1)
    subplot(2,2,3:4)
    string = ['Velocity, Drift Velocity = ', num2str(vdrift)]
    title(string)
    plot([time-0.001 time], [vold, vnew], 'r')
    hold on
    axis ([0 1 0 6000])

    %calculate drift velocity
    %vdrift = (newX - initialX)/0.001
    
%     figure(1)
%     subplot(2,2,1,4:5)
%     plot([t2 t1], 
    vold = vnew;
    initialX = newX;

    pause(0.01)
    time

end

hold off





