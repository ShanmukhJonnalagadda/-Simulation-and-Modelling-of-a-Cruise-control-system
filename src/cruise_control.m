function result = cruise_control(show_plots)
% Updated numerical simulation based on the original PI controller script.
if nargin < 1, show_plots = true; end
m=1000; b=50; Kp=500; Ki=50; dt=0.01; step_time=10;
t=0:dt:100; N=numel(t); ref=20*(t>=step_time);
v=zeros(size(t)); x=v; F=v; e=v; integral=0;
for i=1:N
    e(i)=ref(i)-v(i);
    integral=integral+e(i)*dt;
    F(i)=Kp*e(i)+Ki*integral;
    if i<N
        v(i+1)=v(i)+dt*(F(i)-b*v(i))/m;
        x(i+1)=x(i)+dt*v(i);
    end
end
k=find(t>=step_time,1); tt=t(k:end)-step_time; vv=v(k:end);
lo=find(vv>=2,1); hi=find(vv>=18,1);
rise=NaN; if ~isempty(lo)&&~isempty(hi), rise=tt(hi)-tt(lo); end
last=find(abs(vv-20)>0.4,1,'last'); settling=NaN;
if isempty(last), settling=0; elseif last<numel(tt), settling=tt(last+1); end
result=struct('time',t,'reference',ref,'speed',v,'position',x,'force',F,'error',e,...
    'rise_time',rise,'settling_time',settling,'overshoot',max(0,100*(max(vv)-20)/20),...
    'steady_state_error',abs(v(end)-20));
fprintf('Rise time: %.2f s\nSettling time: %.2f s\nOvershoot: %.2f %%\nFinal error: %.4f m/s\n',rise,settling,result.overshoot,result.steady_state_error);
if show_plots
    figure;
    subplot(4,1,1); plot(t,ref,'--',t,v); grid on; ylabel('Speed (m/s)'); legend('Reference','Actual');
    subplot(4,1,2); plot(t,x); grid on; ylabel('Position (m)');
    subplot(4,1,3); plot(t,F); grid on; ylabel('Force (N)');
    subplot(4,1,4); plot(t,e); grid on; ylabel('Error (m/s)'); xlabel('Time (s)');
end
end
