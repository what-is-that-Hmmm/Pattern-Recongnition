function [newline1,newline2,newline3] = plot_MS_3PCs(eigenvalues,new)
e_v = ones(1,19) * eigenvalues;
max1 = max(e_v,[],2);
temp_max2 = 0;
temp_min = max1+10;

% find the second largest value and corresponding location
for i=1:19
   if(max1 == e_v(1,i))
       temp_max_ax1 = i;     % find the 1st PC
   else
       if (e_v(1,i)>temp_max2)
           temp_max2 = e_v(1,i);     % temperary maximal value
           temp_max_ax2 = i;         % temperary maximal value's location
       end
       if (e_v(1,i)<temp_min)
           temp_min = e_v(1,i);     % temperary minimal value
           temp_min_ax = i;         % temperary minimal value's location
       end
   end
end

temp_max3 = 0;
for i=1:19
   if((max1 == e_v(1,i)) || (temp_max2 == e_v(1,i)))
       temp_max_ax1 = i;     % find the 1st PC
   else
       if (e_v(1,i)>temp_max3)
           temp_max3 = e_v(1,i);     % temperary maximal value
           temp_max_ax3 = i;         % temperary maximal value's location
       end
   end
end

newline1 = new(temp_max_ax1,:);
newline2 = new(temp_max_ax2,:);
newline3 = new(temp_max_ax3,:);

figure
acrylic = scatter3(new(temp_max_ax1,1:10), new(temp_max_ax2,1:10), ...
    new(temp_max_ax3,1:10), 30,[0.5 0.5 0.5],'filled');
hold on
black_foam = scatter3(new(temp_max_ax1,11:20), new(temp_max_ax2,11:20), ...
    new(temp_max_ax3,11:20), 30,[1 0 0.5],'filled');
car_sponge = scatter3(new(temp_max_ax1,21:30), new(temp_max_ax2,21:30), ...
    new(temp_max_ax3,21:30), 30,[0 0 0],'filled');
flour_sack = scatter3(new(temp_max_ax1,31:40), new(temp_max_ax2,31:40), ...
    new(temp_max_ax3,31:40), 30,[1 0.5 1],'filled');
kitchen_sponge = scatter3(new(temp_max_ax1,41:50), new(temp_max_ax2,41:50), ...
    new(temp_max_ax3,41:50), 30,[0 1 0.5],'filled');
steel_vase = scatter3(new(temp_max_ax1,51:60), new(temp_max_ax2,51:60), ...
    new(temp_max_ax3,51:60), 30,[0.25 1 1],'filled');

hold off
title('Scatter plot based on the most significant three PCs');
legend([acrylic black_foam car_sponge flour_sack kitchen_sponge steel_vase], ...
    {'acrylic', 'black foam', 'car sponge', 'flour sack', 'kitchen sponge', ...
    'steel vase'});
end

