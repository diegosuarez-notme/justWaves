s.boot
s.meter
n=NetAddr("127.0.0.1",57120);







//BLUE OSC
{
~oscArray=OSCdef{\blueStatic,{|msg|
		var tam=msg{1};
		if(tam>0){
			msg.do(arg x,i;
				if( (i>1) && (i<4)){var area,aY,aX;
					$aX,AY,area=x.asString.splt{$,};
					~freqB[i-2]=aY.asFloat;
					~areaB[i-2]=area.asFloat;
				   }
			    );
			Ndef(\diegoBlue).set(\f1,);
			Ndef(\diegoBlue)

			msg.postln;
		}{Ndef(\diegoBlue)
			Ndef(\diegoBlue)
		}
	},'/blue',n);
}

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