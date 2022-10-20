%% Mesh for Breakwater Paper. 

clearvars; clc; % clears and arguments and variables 

addpath(genpath('utilities')) % add necessasry folders to the active path
addpath(genpath('datasets'))
addpath(genpath('m_map1.4'))

%% North Atlantic Ocean Level: 

bbox_NA = [-99 -60; 8 45];  % define meshing limits    

min_el_NA    = 3e3;  	% minimum resolution in meters. constant grid spacing palaner meter. 
max_el_NA    = 70e3; 	% maximum resolution in meters

R_NA         = 3;    	% number of elements to resolve feature width 


grade     = 0.25; 	% 0.2< g <0.3
dt           = 1;   % time step. the default is 2 sec 


coastline = 'polygon_MD_coastline BMJ_v3_Breakwater'; % read in coastline 

dem_NA       = 'continental_gebco_2019.nc'; % DEM must be in WGS84 NetCDF 

gdat_NA = geodata('shp',coastline,...   % geodata base object 
                  'bbox',bbox_NA,...
                  'dem',dem_NA,...
                  'h0',min_el_NA); 

% plot(gdat_NA,'shp'); 
% plot(gdat_NA,'dem'); 

fh_NA = edgefx('geodata',gdat_NA,...    % size function for the mesh element size 
                'fs',R_NA,...
                'max_el',max_el_NA,...
                'dt',dt,...
                'g',grade); 

%% Coastal Shelf Level: 

%% 
bbox_CS = [-72.91386414	38.29096222;    % meshing boundary long and lat or x and y
-73.7906189	37.47682953;
-74.29161835	36.52850342;
-74.48844147	35.56228256;
-75.52623749	35.6964798;
-76.89505005	36.19748306;
-77.83442688	37.30684662;
-77.89705658	38.48778534;
-77.58393097	39.31085968;
-76.08950806	39.93711472;
-74.34887695	39.6794548;
-73.36405182	39.45042419;
-72.89453888	38.92365646;
-72.91386414	38.29096222];
%%

min_el_CS    = 1e3;  	
max_el_CS    = 3e3; 	
R_CS         = 3;    	


dem_CS       = 'se_atl_crm_v1.nc'; 

gdat_CS = geodata('shp',coastline,...
                  'dem',dem_CS,...
                  'bbox',bbox_CS,...
                  'h0',min_el_CS); 

% plot(gdat_CS,'shp');
% plot(gdat_CS,'dem');

fh_CS = edgefx('geodata',gdat_CS,...
               'fs',R_CS,...
               'max_el',max_el_CS,...
               'dt',dt,...
               'g',grade);

%% Chesapeak Bay Level: 

% bbox that covers overland as well 

%%
bbox_CB = [-75.9329667313 36.8010329671; 
-76.0549141078 36.7998432365; 
-76.2544319132 36.7827111173; 
-76.4809566009 36.7827111173; 
-76.6795226219 36.7909202578; 
-76.750906452  36.8474324567; 
-76.750906452  36.966405507; 
-76.7628037571 37.0199433796; 
-76.8163416297 37.0496866422; 
-76.8877254599 37.1121474936; 
-77.0215701415 37.1508137349; 
-77.155414823  37.18650565; 
-77.2386959582 37.2103002601; 
-77.3727785859 37.1570003335; 
-77.458082263  37.1895989493; 
-77.4616514545 37.2656227284; 
-77.4528474488 37.4095801193; 
-77.4721210829 37.5208199213; 
-77.4504679878 37.6001749459; 
-77.4379758175 37.6802438087; 
-77.4231041862 37.7694735964; 
-77.3814636186 37.8230114691; 
-77.3071054622 37.8765493417; 
-77.2654648946 37.9300872143; 
-77.259516242  37.9984967182; 
-77.2833108521 38.099623811; 
-77.3190027672 38.1501873574; 
-77.3606433348 38.1829049462; 
-77.4052582286 38.1977765775; 
-77.4587961013 38.2245455138; 
-77.5182826264 38.2632117551; 
-77.5182826264 38.3554158691; 
-77.4944880164 38.4297740255; 
-77.455821775  38.4892605507; 
-77.4082325549 38.5606443809; 
-77.351720356  38.6379768636; 
-77.2952081571 38.6855660837; 
-77.2505932633 38.7212579988; 
-77.1970553906 38.7896675027; 
-77.155414823  38.8491540278; 
-77.1650516401 38.9474257674; 
-77.1307874016 38.9799054101; 
-77.0453647515 38.9889473619; 
-76.9650579426 39.0038189932; 
-76.8817768074 38.9681270781; 
-76.8133673034 38.9294608368; 
-76.7747010621 38.9562297731; 
-76.7568551046 39.0454595608; 
-76.7479321258 39.1703812636; 
-76.715214537  39.2536623988; 
-76.6554900657 39.3188596304; 
-76.5099860252 39.3904814066; 
-76.3761413436 39.4499679318; 
-76.2363480095 39.5183774357; 
-76.1491407637 39.6448457882; 
-76.0587212454 39.6424663272; 
-75.934751327  39.6314018335; 
-75.811733193  39.6457975726; 
-75.5968678642 39.6096297653; 
-75.5535616739 39.5700117395; 
-75.5629605449 39.5259917109; 
-75.6492754929 39.5151056768; 
-75.7298797344 39.4810198979;
-75.7473687728 39.395954167; 
-75.7085835584 39.3036310799; 
-75.6044821394 39.0487908062; 
-75.5021653162 38.8427294831; 
-75.0442380456 38.6653406651; 
-75.0246074923 38.4375072738; 
-75.0686275209 38.2893858262; 
-75.1774878619 38.0645267611; 
-75.3267990401 37.8581085189; 
-75.4065109837 37.80159632;
-75.4927664452 37.7605506177;
-75.5445197221 37.6844078655;
-75.5576067576 37.6183778226; 
-75.5677194669 37.5571067017; 
-75.6307751835 37.4440823039; 
-75.6771746732 37.3709138779; 
-75.7378509288 37.285848147; 
-75.7753274397 37.1942388983; 
-75.7396355246 37.0568250252; 
-75.8377882911 36.9259546699;
-75.9329667313 36.8010329671];
%%

min_el_CB    = 160;  	
max_el_CB    = 1e3; 	
R_CB         = 3;    	

dem_CB       = 'final_01292020_geo.nc'; 

gdat_CB = geodata('shp',coastline,...
                  'dem',dem_CB,...
                  'bbox',bbox_CB,...
                  'h0',min_el_CB); 

% plot(gdat_CB,'shp');
% plot(gdat_CB,'dem');

fh_CB = edgefx('geodata',gdat_CB,...
               'fs',R_CB, ...
               'max_el',max_el_CB, ...
               'dt',dt, ...
               'g',grade);

%% Dyke Marsh Location Level: 

%%
bbox_DM = [-77.00842401	38.71307817;
-77.02180978	38.71006336;
-77.05424915	38.71766068;
-77.06347777	38.74533713;
-77.06818842	38.77154008;
-77.07008372	38.81588637;
-77.05122274	38.82646692;
-77.03226976	38.82953988;
-77.01224953	38.82453482;
-76.99693993	38.81216938;
-76.99605669	38.7815502;
-76.99754054	38.75050706;
-77.00300489	38.7288381;
-77.00842401	38.71307817];
%%

min_el_DM    = 30;  	% The lowest that worked was 30. 
max_el_DM    = 160; 	    
R_DM         = 6;    	% max 6 worked

dem_DM       = 'Reproject_Chesapeake_Topo.nc'; 

gdat_DM = geodata('shp',coastline,...
                  'dem',dem_DM,...
                  'bbox',bbox_DM,...
                  'h0',min_el_DM); 

% plot(gdat_DM,'shp');
% plot(gdat_DM,'dem');

fh_DM = edgefx('geodata',gdat_DM,...
               'fs',R_DM, ...
               'max_el',max_el_DM, ...
               'dt',dt, ...
               'g',grade); 

%% Build Mesh

mshopts = meshgen('ef',{fh_NA fh_CS fh_CB fh_DM},...    % define mesh options
                  'bou', {gdat_NA, gdat_CS, gdat_CB gdat_DM},...
                  'enforceMin',1,...
                  'cleanup', 1,... 
                  'nscreen', 1,...
                  'itmax',100,...
                  'plot_on',1); 

mshopts = mshopts.build; % build method to build the mesh 

muw = mshopts.grd;      % save mesh in a table  

%% Adding Overland Area 

[pfix,egfix] = extractFixedConstraints(muw);    % extract original coastline boundary 

drawedge2(pfix,egfix); % visualize the original coastline  

%% Overland for Chesapeake Bay Level 
 
contour = 'overland2_fc_pol'; % read in upland coasline 5 meter contour line in meters 

gdat_CBO = geodata('shp',contour,...
                   'bbox',bbox_CB,...
                   'dem',dem_CB,... 
                   'h0',min_el_CB); 

% plot(gdat_CBO,'shp');

%% Overland for Dyke Marsh 
% do this step for higher resolution and including the overland area 

gdat_DMO = geodata('shp',contour,...
                   'bbox',bbox_DM,...
                   'dem',dem_DM,... 
                   'h0',min_el_DM); 

gdat_DMO.inpoly_flip =  mod(0,gdat_DMO.inpoly_flip); % This flips the meshing area between water and overland. change 0 to 1 to flip. 

% plot(gdat_DMO,'shp');


%%
mshopts = meshgen('ef', {fh_NA fh_CS fh_CB fh_DM}, ...
                  'bou', {gdat_NA gdat_CS gdat_CBO gdat_DMO}, ...
                  'cleanup', 1,... 
                  'nscreen', 1,...
                  'itmax', 100,...
                  'plot_on', 1,...
                  'pfix', pfix,'egfix', egfix); 

mshopts = mshopts.build;

m = mshopts.grd;

% write(m,'Proj_BigMeshOver');

%% Interpolation elevation  
% with every step new refined elevations will be added to the mesh 

m1 = interp(m,gdat_NA,'nan','fill','mindepth', 1); % The mindepth won't let the bathymetry be less then -136 (the highest elevation at the domain)
m2 = interp(m1,gdat_CS,'mindepth', 1); % The mindepth won't let the bathymetry be less then -136 (the highest elevation at the domain)
m3 = interp(m2,gdat_CBO,'mindepth',-136); % The mindepth won't let the bathymetry be less then -136 (the highest elevation at the domain)
m4 = interp(m3,gdat_DMO,'mindepth',-136); % The mindepth won't let the bathymetry be less then -136 (the highest elevation at the domain)
m5=m4;

%% Adding boundary condition 

m5 = lim_bathy_slope(m5, 0.1,0);    % smoothes the steep slopes in the mesh 

m5 = make_bc(m5,'auto',gdat_NA);    % makes automatic boundary condition 

write(m5,'Proj_BigMeshOverL_30_Final'); %  saves file as fort.15 
