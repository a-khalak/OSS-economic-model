function plotstat (stat, cb, plt);
% plotstat does some plots...
%
% function plotstat (stat, cb, plt);
%

plottype = 'endgraph1';
symbol   = 'x';

if exist('plt'),
 if isfield (plt, 'plottype'),
   plottype = plt.plottype;
 end;
 if isfield (plt, 'symbol');
   symbol = plt.symbol;
 end;
end;

if strmatch (plottype, 'endgraph1'),
  a1 = find ([stat(:).endmean] > 0.9);
  a2 = find ([stat(:).endmean] < 0.9 &  [stat(:).endmean] < 0.75 );
  a3 = find ([stat(:).endmean] < 0.75 &  [stat(:).endmean] < 0.5 );
  a4 = find ([stat(:).endmean] < 0.5 &  [stat(:).endmean] < 0.4 );
  a5 = find ([stat(:).endmean] < 0.4 &  [stat(:).endmean] < 0.2 );
  a7 = find ([stat(:).endmean] < 0.2 &  [stat(:).endmean] < 0.1 );
  a8 = find ([stat(:).endmean] < 0.2);

splot ([cb(a1).b1], [cb(a1).b2], 'ro', 12);
hold on;

splot ([cb(a2).b1], [cb(a2).b2], 'rx', 10);
splot ([cb(a3).b1], [cb(a3).b2], 'bx', 10);
splot ([cb(a4).b1], [cb(a4).b2], 'bd', 8);
splot ([cb(a5).b1], [cb(a5).b2], 'gd', 8);
splot ([cb(a7).b1], [cb(a7).b2], 'g.', 15);
splot ([cb(a8).b1], [cb(a8).b2], 'b.', 9);

axis ([-0.1 1.1 -0.1 1.1]);

end;
