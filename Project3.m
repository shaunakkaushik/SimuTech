thermalModel = createpde('thermal','steadystate');   
importGeometry(thermalModel,'Drawing1.stl');
figure
pdegplot(thermalModel,'FaceLabels','on');
thermalModel.generateMesh();
pdeplot3D(thermalModel);
kappa = 1.8 ;
thermalProperties(thermalModel,'ThermalConductivity',kappa);
thermalBC(thermalModel,'Face',[1,2,4,5],'ConvectionCoefficient',0.0015,'AmbientTemperature',298);
thermalBC(thermalModel,'Face',3,'Temperature',373);
Rt = solve(thermalModel);
pdeplot3D(thermalModel, 'ColorMapData', Rt.Temperature);    

