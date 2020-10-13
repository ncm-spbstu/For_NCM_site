
clc

% LOAD ------------------------------------------
importTable = readtable('table.xlsx');
for i = 1:size(importTable,1)
    disp(['Load ' num2str(i) ' of ' num2str(size(importTable,1))])
    publication(i).Number = string(importTable(i,:).N);
    publication(i).Title = string(cell2mat(importTable(i,:).title));
    publication(i).Authors = string(cell2mat(importTable(i,:).authors));
    publication(i).Date = string(importTable(i,:).date);
    publication(i).Year = extractBetween(publication(i).Date,7,10);
    publication(i).Journal = string(cell2mat(importTable(i,:).journal));
    publication(i).Source = string(cell2mat(importTable(i,:).source));
end
disp(newline)
%------------------------------------------------


% SAVE ------------------------------------------
folder = 'output';
for i = 1:size(importTable,1)
    disp(['Save ' num2str(i) ' of ' num2str(size(importTable,1))])
    
fileNum = num2str(i,'%04u');
filename = [fileNum '.md'];
fileaddr = [folder '/' filename];
fileid = fopen(fileaddr, 'wt' );

fprintf(fileid, "---\n");
fprintf(fileid, "layout: publication\n");
fprintf(fileid, "title: """ + publication(i).Title + """\n");
fprintf(fileid, "authors: """ + publication(i).Authors + """\n");
fprintf(fileid, "date: " + publication(i).Date + "\n");
fprintf(fileid, "year: " + publication(i).Year + "\n");
fprintf(fileid, "journal: " + publication(i).Journal + "\n");
fprintf(fileid, "source: " + publication(i).Source + "\n");
fprintf(fileid, "---\n");

fclose(fileid);
end
%------------------------------------------------



% example ---------------------------------------

% ---
% layout: publication
% title: "Electrical Conductivity of NaNO2 Confined within Porous Glass"
% authors: "L. Korotkova, V. Dvornikova, M. Vlasenko, T. Korotkova, A. Naberezhnov, Ewa Rysiakiewicz-Pasek"
% date: 2012-12-20
% year: 2012
% journal: Ferroelectrics
% source: http://www.tandfonline.com/doi/abs/10.1080/00150193.2013.786600
% ---










