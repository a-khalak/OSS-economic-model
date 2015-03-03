function plotstat (stat, w, plt);
% plotstat does some plots...
%
% function plotstat (stat, w, plt);
%

plottype = 'comp1';
symbol   = 'x';

if exist('plt'),
 if isfield (plt, 'plottype'),
   plottype = plt.plottype;
 end;
 if isfield (plt, 'symbol');
   symbol = plt.symbol;
 end;
end;

if strmatch (plottype, 'comp1'),
 plot ([stat.preO1],'x');
hold on;
 plot ([stat.preO2],'rx');
 plot ([stat.ini1],'s');
 plot ([stat.ini2],'rs');
axis ([0 16 0 1]);
end;

if strmatch (plottype, 'OSS1'),
 plot ([stat.inimean],symbol);
end;

if strmatch (plottype, '1impact_vs_N'),
 plot ([w.N],[stat.ini1]-[stat.preO1],symbol);
end;

if strmatch (plottype, '2impact_vs_N'),
 plot ([w.N],[stat.ini2]-[stat.preO2],symbol);
end;

if strmatch (plottype, '2fimpact_vs_N'),
 plot ([w.N],([stat.ini2]-[stat.preO2])./[stat.preO2],symbol);
end;

if strmatch (plottype, '2fimpact_vs_NoM'),
 plot ([w.N]./[w.M],([stat.ini2]-[stat.preO2])./[stat.preO2],symbol);
end;
