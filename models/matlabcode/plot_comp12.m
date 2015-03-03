% make a comparison plot between companies 1&2 for run i

l = 1:world(i).timelen;

if ~isfield(outcome, 'R')
    for j = 1:length(outcome)
        outcome(j).R = outcome(j).P(:,l) .* outcome(j).Q;
    end;
end;

figure(1);
clf;
plot (l, outcome(i).P(1,l), 'rx')
hold on
plot (l, outcome(i).P(2,l), 'bo')
plot (l, outcome(i).P(3,l), 'g+')
%plot (l, outcome(i).P(4,l), 'y<')
%plot (l, outcome(i).P(5,l), 'm*')
ylabel('price');

figure(2);
clf;
plot (l, outcome(i).Q(1,l), 'rx')
hold on
plot (l, outcome(i).Q(2,l), 'bo')
plot (l, outcome(i).Q(3,l), 'g+')
%plot (l, outcome(i).Q(4,l), 'y<')
%plot (l, outcome(i).Q(5,l), 'm*')
ylabel('quantity');

figure(3);
clf;
plot (l, outcome(i).R(1,l), 'rx')
hold on;
plot (l, outcome(i).R(2,l), 'bo')
plot (l, outcome(i).R(3,l), 'g+')
%plot (l, outcome(i).R(4,l), 'y<')
%plot (l, outcome(i).R(5,l), 'm*')
ylabel('revenue');
