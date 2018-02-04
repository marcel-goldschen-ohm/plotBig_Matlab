function e004_blog_post()

%% Figure 1
y = [1 2 3 4 5 6 7 8 9 8 7 6 7 6 5 4 3 2 4 8 9 7 4 5 6 7 7 7 7 7];
subplot(1,2,1)
plot(y,'Linewidth',2)
set(gca,'FontSize',16)
subplot(1,2,2)
plot(y,'Linewidth',2)
set(gca,'xlim',[-1e6 1e6],'FontSize',16)
set(gcf,'position',[1,1,800,400]);

%% Figure 2
%Jim
figure(1)
s1 = big_plot_tests.examples.e001_interestingInput('type',0);

%Matlab
figure(2)
s2 = big_plot_tests.examples.e001_interestingInput('type',2,'y',s1.y,'t',s1.t);

h_fig = figure(3);
clf;
ax1 = copyobj(s1.ax(1),h_fig);
ax2 = copyobj(s2.ax(2),h_fig);

ax1.Position = s1.ax(1).Position;
ax2.Position = s2.ax(2).Position;
set(gcf,'position',[1,1,800,400]);

%% Figure 3
y = [1 2 3 4 5 6 7 8 9 8 7 6 7 6 5 4 3 2 4 8 9 7 4 5 6 7 7 7 7 7];
subplot(1,2,1)
plot(y,'-o','Linewidth',2)
set(gca,'FontSize',16)
subplot(1,2,2)
plot(y,'-o','Linewidth',2)
set(gca,'xlim',[-1e6 1e6],'FontSize',16)
set(gcf,'position',[1,1,800,400]);

end