clear;
load('myExperimentAgeGData23.mat')
T1=load('FinalTree.mat');
T2=load('FinalTreeCg.mat');
Zout=Zfinal(:,1:112);
PCAresult=Zout*T1.trainedModel.PCACoefficients;
[coeff,score,latent,tsquared,explained,mu] = pca(Zout);
PCAratio=latent/sum(latent);


yfit = T1.trainedModel.predictFcn(Zout);
yfit2 = T2.trainedModel.predictFcn(Zout);
figure(1)
for i=1:1:10
subplot(5,2,i)
scatter(Zfinal(:,end),PCAresult(:,i),SizeData=1)
xlabel("△Ct(%)")
ylabel(num2str(i))
grid on
end

figure(2)
for i=1:1:10
subplot(5,2,i)
scatter(Zfinal2(:,end)/3,PCAresult(:,i),SizeData=1)
xlabel("△Cg(%)")
ylabel(num2str(i))
grid on
end

figure(3)
subplot(121)
scatter(Zfinal(:,end)*100,yfit*100,SizeData=1)
grid on
xlabel('True △Ct(%)')
ylabel('Estimated △Ct(%)')
subplot(122)
scatter(Zfinal(:,end)*100,(yfit-Zfinal(:,end))*100,SizeData=1)
grid on
xlabel('True △Ct(%)')
ylabel('Estimated error in △Ct(%)')

figure(4)
subplot(121)
scatter(Zfinal2(:,end)/3*100,yfit2/3*100,SizeData=1)
grid on
xlabel('True △Cg(%)')
ylabel('Estimated △Cg(%)')

subplot(122)
scatter(Zfinal2(:,end)/3*100,(yfit2-Zfinal2(:,end))/3*100,SizeData=1)
grid on
xlabel('True △Cg(%)')
ylabel('Estimated error in △Cg(%)')