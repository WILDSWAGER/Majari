clear all

win=20;
%day=3522;
day=200;
stock=350;

% obtain logarithmic increments ri(t) of each stock i
price=SP500N35020062019(1:200,:);
tic
for numcolom=1:1:stock
    for numrows=1:1:day
      if numrows==1 
          logreturn(numrows, numcolom)=0;
      else
          logreturn(numrows, numcolom)=log(price(numrows, numcolom))-log(price(numrows-1, numcolom));
          
      end
    end
end
 toc
 
%obtain pearson correlation for windowes

epislon=0.9;

for i=win:1:day;
   j=(i)-(win-1);
   
  
epchs=logreturn(i-(win-1):i,:);


pearsoncorrelation=corrcoef(epchs);

                 
powermapcorr{j}=pearsoncorrelation./abs(pearsoncorrelation).*abs((pearsoncorrelation).^(1+epislon));
 

end 

...................................................................................................
%definition of distance matrix:                           
gm=(size(powermapcorr));
gm2=gm(1,2);

for ix=1:1:gm2
    for jx=1:1:gm2
        distancematrix(ix,jx)=mean2(abs(powermapcorr{ix}-powermapcorr{jx}));
    end
end
...................................................................................................
 %Multidimensional Scaling (MDS)
reduceddimention=3;

 yy=cmdscale(distancematrix,reduceddimention);
 nn=size(yy,1);
 
 plot3(yy(:,1),yy(:,2),yy(:,3),'marker','.','MarkerSize',4, 'LineStyle','none','LineWidth',2); hold on;
......................................................................................


%% kmeans
nc=5; %% number of clusters
X=yy;

[idx,C] = kmeans(X,nc);


%% % color code of kmeans clustering
%% % color code of kmeans clustering
gold=[1.0000  0.8398 0];
Dimgray=[0.4102 0.4102 0.4102];
saddlebrown=[0.5430 0.2695 0.0742];
indigo=[0.2930 0 0.5078];
gray=[0.4102 0.4102 0.4102];
addpath('/home/hirdesh/RMT_finance/MATLAB_prog/Matlab_codes/prog_2006-19full')
if nc==3;Cl = {'g','b','r'};end


if nc==4;Cl = {'g','m','b','r'};end
if nc==5;Cl = {'g','m',gold,'b','r'};end
if nc==6;Cl = {'g','m',gold,saddlebrown,'b','r'};end


if nc==7;Cl = {'g','m',indigo,gray,gold,'b','r'};end
if nc==8;Cl = {'g','m','k','y',[0.9297 0.5078 0.9297],'c','b','r'};end

%%
y=X
h1=figure(1);
for i=1:nc
    plot3(X(idx==i,1),X(idx==i,2),X(idx==i,3),'color',Cl{i}, ...
        'marker','.','MarkerSize',4, 'LineStyle','none','LineWidth',2); hold on;
end

xlabel('x');ylabel('y');zlabel('z');
xlim([min(y(:,1)), max(y(:,1))]); ylim([min(y(:,2)), max(y(:,2))]);zlim([min(y(:,3)), max(y(:,3))]);
hold on;n=length(distancematrix);k = 1:n;
%%

    for i=1:nc
       text(X(k(idx==i),1),X(k(idx==i),2),X(k(idx==i),3),num2str((i)),'FontSize',20,'color',Cl{i});
    end
 
 .........................................................................................................
     %orgenize the stats acording to mean of correlations matixs
 
 

 %state 1

gv=idx;

    con=0
for hnumrowx=1:1:size(gv,1)
    bv=gv(hnumrowx,1);
     if bv==1
        con=con+1;
        zz(con,1)=hnumrowx;
    end
end
    
   
    

for  hhn=1:1:size(zz,1)
    nc=zz( hhn,1);
    tt{hhn}=powermapcorr{nc};
end


for bq=1:1:size(zz,1)
B11(bq)= mean2(tt{bq});
end

b11=mean(B11);

%state2
con2=0
for hnumrowx2=1:1:size(gv,1)
    bv2=gv(hnumrowx2,1);
     if bv2==2
        con2=con2+1;
        zz2(con2,1)=hnumrowx2;
    end
end

for  hhn2=1:1:size(zz2,1)
    nnc2=zz2( hhn2,1);
    tt2{hhn2}=powermapcorr{nnc2};
end


for bq2=1:1:size(zz2,1)
B112(bq2)= mean2(tt2{bq2});
end
b12=mean(B112);

%state3
con3=0
for hnumrowx3=1:1:size(gv,1)
    bv3=gv(hnumrowx3,1);
     if bv3==3
        con3=con3+1;
        zz3(con3,1)=hnumrowx3;
    end
end



for  hhn3=1:1:size(zz3,1)
    nnc3=zz3( hhn3,1);
    tt3{hhn3}=powermapcorr{nnc3};
end


for bq3=1:1:size(zz3,1)
B113(bq3)= mean2(tt3{bq3});
end
b13=mean(B113);

%state4
con4=0
for hnumrowx4=1:1:size(gv,1)
    bv4=gv(hnumrowx4,1);
     if bv4==4
        con4=con4+1;
        zz4(con4,1)=hnumrowx4;
    end
end


for  hhn4=1:1:size(zz4,1)
    nnc4=zz4( hhn4,1);
    tt4{hhn4}=powermapcorr{nnc4};
end


for bq4=1:1:size(zz4,1)
B114(bq4)= mean2(tt4{bq4});
end
b14=mean(B114);

%state5
con5=0
for hnumrowx5=1:1:size(gv,1)
    bv5=gv(hnumrowx5,1);
     if bv5==5
        con5=con5+1;
        zz5(con5,1)=hnumrowx5;
    end
end



for  hhn5=1:1:size(zz5,1)
    nnc5=zz5( hhn5,1);
    tt5{hhn5}=powermapcorr{nnc5};
end


for bq5=1:1:size(zz5,1)
B115(bq5)= mean2(tt5{bq5});
end
b15=mean(B115);



barr=[b11 b12 b13 b14 b15 ];
bvw=[1 2 3 4 5 ];
[barr,idxnew]=sort(barr);
bvw = bvw(idxnew);

ab1=bvw(1,1);
ab2=bvw(1,2);
ab3=bvw(1,3);
ab4=bvw(1,4);
ab5=bvw(1,5);

 ps = changem(idx,[1,2,3,4,5],[ab1,ab2,ab3,ab4,ab5]);
 
..........................................................................................
%% kmeans
nc=5; %% number of clusters

%% % color code of kmeans clustering
%% % color code of kmeans clustering
gold=[1.0000  0.8398 0];
Dimgray=[0.4102 0.4102 0.4102];
saddlebrown=[0.5430 0.2695 0.0742];
indigo=[0.2930 0 0.5078];
gray=[0.4102 0.4102 0.4102];
addpath('/home/hirdesh/RMT_finance/MATLAB_prog/Matlab_codes/prog_2006-19full')
if nc==3;Cl = {'g','b','r'};end


if nc==4;Cl = {'g','m','b','r'};end
if nc==5;Cl = {'g','m',gold,'b','r'};end
if nc==6;Cl = {'g','m',gold,saddlebrown,'b','r'};end


if nc==7;Cl = {'g','m',indigo,gray,gold,'b','r'};end
if nc==8;Cl = {'g','m','k','y',[0.9297 0.5078 0.9297],'c','b','r'};end

%%
y=X
h1=figure(1);
for i=1:nc
    plot3(X(ps==i,1),X(ps==i,2),X(ps==i,3),'color',Cl{i}, ...
        'marker','.','MarkerSize',4, 'LineStyle','none','LineWidth',2); hold on;
end

xlabel('x');ylabel('y');zlabel('z');
xlim([min(y(:,1)), max(y(:,1))]); ylim([min(y(:,2)), max(y(:,2))]);zlim([min(y(:,3)), max(y(:,3))]);
hold on;n=length(distancematrix);k = 1:n;
%%

    for i=1:nc
       text(X(k(ps==i),1),X(k(ps==i),2),X(k(ps==i),3),num2str((i)),'FontSize',20,'color',Cl{i});
    end
    
........................................................................................
    
 