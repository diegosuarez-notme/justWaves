s.boot
s.meter
n=NetAddr("127.0.0.1",57120);

~freqR=[0,0,0,0,0,0,0,0,0,0];
~freqG=[0,0,0,0,0,0,0,0,0,0];
~freqB=[0,0,0,0,0,0,0,0,0,0];

~ampR=[0,0,0,0,0,0,0,0,0,0];
~ampB=[0,0,0,0,0,0,0,0,0,0];
~ampG=[0,0,0,0,0,0,0,0,0,0];

~areaR=[0,0,0,0,0,0,0,0,0,0];
~areaB=[0,0,0,0,0,0,0,0,0,0];
~areaG=[0,0,0,0,0,0,0,0,0,0];


~notasRed=[50,100,200];
~notasGreen=[100,120,140];
~notasBlue=[60,80,100];


//RED OSC
{
~oscArray=OSCdef{\redStatic,{|msg|
		var tam=msg[1];
		if(tam>0){
			msg.do(arg x,i;
				if( (i>1) && (i<12)){var area,aY,aX;
					$aX,AY,area=x.asString.split{$,};
					y=aY.asFloat;
					x1=aX.asFloat;
					~areaR[i-2]=(area.asFloat)-0.5;
					if(y<0.3){~freqR[i-2]=~notasRed[0]}if((y>0.3)&&(y<0.6)){~freqR[i-2]=~notasRed[1]}{~freqR[i-2]=~notasRed[2]};};
					~freqR[i-2]=aY.asFloat;
					~areaR[i-2]=area.asFloat;
				   }
		};
			Ndef(\diegoRed).set(\f1,(~freqR[0]+1)*~notasRed[0],\f2,(~freqR[1])*~notasRed[1],\f3,(~freqR[2])*~notasRed[2]);
			Ndef(\diegoRed).set(\a1,0.2/tam,\a2,0.2/tam,\a3,0.2/tam);

			msg.postln;
		}{Ndef(\diegoRed).set(\a1,0,\a2,0,\a3,0);
			Ndef(\diegoRed).set(\f1,0,\f2,0,\f3,0);
		}
	},'/red',n);
}


//BLUE OSC
{
~oscArray=OSCdef{\blueStatic,{|msg|
		var tam=msg[1];
		if(tam>0){
			msg.do(arg x,i;
				if( (i>1) && (i<4)){var area,aY,aX;
					$aX,AY,area=x.asString.split{$,};
					~freqB[i-2]=aY.asFloat;
					~areaB[i-2]=area.asFloat;
				   }
			    );
			Ndef(\diegoBlue).set(\f1,(~freqB[0]+1)*~notasBlue[0],\f2,(~freqB[1])*~notasBlue[1],\f3,(~freqB[2])*~notasBlue[2]);
			Ndef(\diegoBlue).set(\a1,0.2/tam,\a2,0.2/tam,\a3,0.2/tam);

			msg.postln;
		}{Ndef(\diegoBlue).set(\a1,0,\a2,0,\a3,0);
			Ndef(\diegoBlue).set(\f1,0,\f2,0,\f3,0);
		}
	},'/blue',n);
}




{
Ndef(\diegoRed,(
	arg f1=0, f2=0, f3=0,a1=0.3,a2=0.2, a3=0.1, ampg=0.2;
	var sig;
	sig=SinOsc.ar([f1,f1+1,f2,f2+3,f3],[a11,a2,a3]);
	sig=FreeVerb.ar(sig,SinOsc.kr(4).reange(1.7));
	sig=sig*ampg;
}).play;
}

{
Ndef(\diegoGreen,(
	arg f1=0, f2=0, f3=0,a1=0.3,a2=0.2, a3=0.1, ampg=0.2;
	var sig;
	sig=SinOsc.ar([f1,f1+1,f2,f2+3,f3],[a11,a2,a3]);
	sig=FreeVerb.ar(sig,SinOsc.kr(4).reange(1.7));
	sig=sig*ampg;
}).play;
}


{
Ndef(\diegoBlue,(
	arg f1=0, f2=0, f3=0,a1=0.3,a2=0.2, a3=0.1, ampg=0.2;
	var sig;
	sig=SinOsc.ar([f1,f1+1,f2,f2+3,f3],[a11,a2,a3]);
	sig=FreeVerb.ar(sig,SinOsc.kr(4).reange(1.7));
	sig=sig*ampg;
}).play;
}


//OTHER SYNTHS

Ndef{\diegoWave


Ndef{\diegoNoise

{
Synthdef{\kick,{
		arg freqA=400,freqB=40,freqC=10,freqDur1=0.0001,freqDur2=0.3,freqC1=9,freqC2=(-1),atk=0.01,rel=1,c1=4,c2=(-12),amp=1,pa=0,out=0;
	var sig,env,freqSweep;
		env=Env{[0,3,0],[atk,rel],[c1,c2]).kr(2)};
	sig
	sig
	sig
	Out.ar{out,sig};
}).add;
}