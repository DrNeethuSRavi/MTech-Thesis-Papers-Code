%% FUNCTION
function[MF,su,wm,wsd,skew,kurt,VF,M,A,mav,TCSC]=Final_features(ecg,Fs)

    %%Mean Frequency
    samples=(10*Fs)+20;
    ecg1=ecg(1:samples);
    L=length(ecg1);
    n=2^(nextpow2(L));
    n1=nextpow2(n);
    [ca4,cd]=dwt(ecg1,'db4');
    f=Fs*(0:(2^(n1-1)-1))/(2^n1);
    s=ca4;
    p1=(s.^2);
    x=length(f)-length(p1);
    p=[p1 zeros(1,x)];
    m=sum(p);
    m1=sum(f.*p);
    MF=m1/m;
    %display(['Median Frequency: ' num2str(mf) 'Hz'])

    %%Peak Frequency

    L=4*Fs; %Size of each ECG Block: To be defined
    Number_Blocks=20;  %Number of ECG Blocks to be processed; To be defined
    FFT_Size=fix(1.2*L ); % Size of FFT: To be defined
    Ec=10;   %Border care; To be defined in percentage
    First_Sample=20000;   %First sample for processing;  To be defined

    PF=zeros(2,Number_Blocks); %Matrix for the result
    Block_Number=1;

    for j=First_Sample:(L-1):(First_Sample+L*(Number_Blocks-1))

        ecg1=ecg(j:(j+L-1));
        n=1;
        v=(2.^(n+1));
        [ca3,cd1]=dwt(ecg1,'db4');
        %[ca2,cd2]=dwt(ca1,'db4');
        L1=length(ca3);
        FFTsize=2^(fix(log2(L1)+1));
        Z=abs(fft(ca3,FFTsize));
        Z1=Z(1:FFTsize/2);

        f=linspace(0,Fs/v,FFTsize/2);
        K=Z(fix(Ec*FFTsize/100):fix((50-Ec)*FFTsize/100));
        M=max(K)/1000;
        A=K/M/1000;
    %      figure
    %      plot(Z);
    %      figure
    %      plot(Z1);

        [C,I]=max(A);
        Peak_freq=(Fs/FFT_Size)*((fix(Ec*FFT_Size/100)+I));

    %     if(Peak_freq>Fs/4)
    %         Peak_freq=Fs/2-Peak_freq;
    %     end

        PF(1,Block_Number)=Peak_freq;
        PF1(1,Block_Number)=Peak_freq;
        PF(2,Block_Number)=M;
        Block_Number=Block_Number+1;
        %display(['Peak Amplitude: ' num2str(M)])
        %display(['Peak Frequency: ' num2str(Peak_freq) 'Hz'])
    end
    %display(PF);
    x=sort(PF1,'descend');
    po=length(x)-10;
    su=sum(x(6:15))/po;
    % matrix(count,1)=su;
    % count=count+1;
    %display(['Peak Frequency: ' num2str(su) 'Hz'])

    %% Wavelet Features(Mean,Standard Deviation, Skewness,Kurtosis)

        [ca4,cd2]=dwt(ecg1,'db4');
        [ca3,cd3]=dwt(ca4,'db4');
        [ca4,cd4]=dwt(ca3,'db4');
        [ca5,cd5]=dwt(ca4,'db4');
        ss=ca5;
        wm = mean(ss);                             % Mean
        wsd = std(ss);                              % Standard deviation
        skew = skewness(ss);                         % Skewness
        kurt = kurtosis(ss);                          % Kurtosis

      %% VF-Leakage

        samples=(10*Fs)+20;
        ecg1=ecg(1:samples);
        % [b,a]=butter(2,15/(Fs/2),'low');
        % q=filter(ecg,b,a);
        %q=reshape(smooth(ecg,10),1,samples);
        [ca6,cd6]=dwt(ecg1,'db4');
        s=ca6;
        L=length(s);
        f=linspace(1,Fs/4,L);
        s=abs(ca6);
        % z1=z(1:(L/2)+1);
        % figure
        % plot(f,s);
        %xlabel('Hz');
        m=max(s);
        s1=s/m;
        [C1,I1]=max(s1);
        f6 = f(I1);
        T = Fs/f6;
        sum1=0;
        sum2=0;
        for i =floor(T/2):L
            sum1 = sum1 + abs(ecg(i)+ecg(i+1-floor(T/2)));
            sum2 = sum2 + abs(ecg(i))+abs(ecg(i+1-floor(T/2)));
        end
        VF = sum1/sum2;

        %% Spectral Moment && Spectral Band Amplitude

        samples = 10*Fs+20;
        ecg1=ecg(21:samples);
        %q= reshape(smooth(ecg,15),1,samples); 
        % figure
        % plot(det1);
        % xlabel('samples');ylabel('volts');
        % title('Preprocessed Signal')
        L=length(ecg1);
        z = fft(ecg1);                
        g = linspace(0,Fs/2,L);
        s=abs(z);
        f=g;
        freq = find(f>.5 & f<=100);
        amp1 = max(s(freq));
        peak_freq = f(s==amp1);
        pf=min(peak_freq);
        s(s<.05*pf)=0;
        % Plot single-sided amplitude spectrum.
        % figure
        % plot(f,x) 
        % title('Amplitude Spectrum of y(t)')
        % xlabel('Frequency (Hz)')
        % ylabel('|Y(f)|')
        c = ceil(min(0.20*pf,100));
        rrr =find(floor(f)==c);
        sum1 = 0; sum2=0;
        for i=1:rrr(1)
            sum1 = sum1+f(i)*s(i);
            sum2 = sum2+s(i);
        end
        M = (sum1/sum2)*(1/sum(f));
        A = sum(s(f>.7 & f<1.4*pf))/sum(s(f>.5 & f<min(20*pf,100)));

        %% Mean Absolute Value

        samples=10*Fs+20;
        ecg1=ecg(20:samples);
        q=smooth(ecg1,15);
        L=length(q);
        m=max(q);
        a=q/m;
        %s=sum(abs(a))/L;
        mav=mean(abs(a));

        %% Threshold Crossing Sample Count

        samples=10*Fs+20;
        det = ecg(1:samples);
        %det = det-mean(det);
        det = det/max(det);
        det1 = smooth(det,15); 
        Le=10;
        acc=[];pos6=[];
        for i=1:Fs:6*Fs
            det2 = det1(i:(i+3*Fs-1));
            det2 = det2-min(det2);
            thresh = 0.8*max(det2); 
            diff = abs(det2-thresh);  
            pos = find(diff<=0.03);
            s = imfilter(pos,[1;-1]);
            pos(abs(s)<=2)=[];
            acc=[acc length(pos)];
            pos6=[pos6 i+pos'];
        %     figure,plot(det2)
        %     hold on
        %     plot(1:samples,thresh)
        %     hold off
        %     xlabel('samples');ylabel('voltage')
        %     title(['TCSC with thresh= ',num2str(thresh)])
        %     figure,plot(det2)
        %     hold on
        %     plot(pos,det2(pos),'--rs','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor','g','MarkerSize',5);
        %     hold off
        %     xlabel('samples');ylabel('voltage')
           %title(['TCSC with thresh= ',num2str(thresh)])
        end
        TCSC = round(sum(acc)/(Le));
      
end