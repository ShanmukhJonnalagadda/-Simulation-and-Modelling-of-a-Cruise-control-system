% Run from repository root: addpath('tests'); test_cruise_control
function test_cruise_control()
root=fileparts(fileparts(mfilename('fullpath'))); addpath(fullfile(root,'src'));
r=cruise_control(false);
assert(all(isfinite(r.speed)));
assert(all(r.speed(r.time<10)==0));
assert(abs(r.speed(end)-20)<0.01);
assert(isfinite(r.rise_time) && r.rise_time>0);
assert(isfinite(r.settling_time) && r.settling_time>=0);
k=find(r.time>=10+r.settling_time-1e-9,1);
assert(all(abs(r.speed(k:end)-20)<=0.4+1e-9));
assert(abs(r.force(end)-1000)<1);
fprintf('All cruise control checks passed.\n');
end
