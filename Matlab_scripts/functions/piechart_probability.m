function p = piechart_pstwo(M)

P1=nnz(M(:,4)==1);
P080=nnz(M(:,4)>0.8)-P1;
P060=nnz(M(:,4)>0.6)-P1-P080;
P040=nnz(M(:,4)>0.4)-P1-P080-P060;
P020=nnz(M(:,4)>0.2)-P1-P080-P060-P040;
P000=nnz(M(:,4)<0.2);

labels = {'P=1','0.8<P<1','0.6<P<0.8','0.4<P<0.6','0.2<P<0.4','P<0.2'};
p=pie([P1 P080 P060 P040 P020 P000],'%.4g%%');
legend(labels,'Location',"southeastoutside")
title({'Wykres kołowy prawdopodobieństwa porażenia'; 'w przeprowadzonej symulacji'})
p(1).FaceColor='y';
p(3).FaceColor='#EDB120';
p(5).FaceColor='#77AC30';
p(9).FaceColor='#0072BD';
p(11).FaceColor='#7E2F8E';
end

