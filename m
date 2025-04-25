Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12394225407
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615209; cv=none; b=pdTPf3+L0csr4/1bnlg0K+YDSchulOTxjIerEBzgV+mZYt/sDMlu4st/WY/Q+oWM9WJ5ALYEK/prYqH+YPTnk4JHEUvZdtB0GkXSaksAer4whfMB3y8QaKm7dvA9msJkzSo/3mZjK6Q1qE0t96ASR3VTGQzTdJfF1vjDF3PKpYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615209; c=relaxed/simple;
	bh=h00jeZq0iWeQNWIPqYKYS+5WOPWO32a5C7YtUmmJfdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2D0fFg0n2o38T/p+EUdHIr1hwafdx1x6klUW2cszY9kosfQCsI/SHKOdDrby7NfgkwIot2ZD/ki/ibum2TSJmbx9zzAQxBKbg0oreG9P4/OaD3a3MXQtL/kNx35UD21UvPUJHaaJrCvi1wCMKw8D5fq9oWbuPCVpj88ZyoFuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuqGT/Y4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuqGT/Y4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJw7O011512
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wMN4f5Q/NYPt8cjlej5JofRiRc0TnEknbiNnEj2rrn4=; b=LuqGT/Y4ATlFoSeK
	6vQEqqPIeptD1kdRNXtNbIaV4vgVRGDaqx8n71p/mrblpVqHMPtNsPvR5tDW6jox
	k+QHszpx9gCcue/HefHO0m3o6OwANCIlhr0TsYhYCk7D0FMVXYNWWLuPLhzhAzlD
	mygQ9LVI7bhAb1bcxpOPrpuw3mfOHTfLw6yqQlGJ9Cc/BQDFrcDqRPg6e4wJGgre
	l47cIeQDlXKwqXBAoPela/+SpS8OfYmlAlYmjEHjl44Ynk8wihKbpEksXRrTuI6i
	v8Nhpx/lnz+GEmSU14fbVqEKqPGYWPPUHQVRQWujFtS+lN9ROIxbcMjOJIN4vd/7
	VwKXRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3t7g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:06:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso58108785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615206; x=1746220006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wMN4f5Q/NYPt8cjlej5JofRiRc0TnEknbiNnEj2rrn4=;
        b=odDe2fM3rZ4/tdNcqJ+UEnFxTTCEKa5VsNzxPW3TLKclVTRxO5+EudViqAAzEh3UGU
         FVq7gJosUS9VilcfhY3s3PglRiv91waSBirscZVUoEoCt6JLUbXD/AYICS1i8ZpElffP
         5gGI1SkqB7sxjRoDvlmaQclxnS+UrECwUpyok2SgOG/Ex8YbKla0LULtQXycA66LSS+b
         iXpd0etdwdZ1bbKlC4h9kpapNkq91EsSqWOjjh1UqIvE85qVXOjaNfX6in/a5y5pqpk2
         MhpdddgI4Iw4IotxjJmzIBHZGUBR9jaHOrnXH1a1h1mXgNjDDwDvrYkMjKko/x6Fpned
         2arA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6kyqQKnAyge1QY0VDjk/s5cPaVxiWJj/7B/8olJztx7H4P/LAi1+F4knEntA0BhzDL61Nc/PpFKPZi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CXPyrSyCiuE2oWgqMfTRa+7UxGM9/xXEQTKsYpwyIultUs/t
	TUGYBakSFb5o9D2eVX3aHLt59PtXAESnRgCKZGc0X1FowZsSyi2TENMbNDFypKpH+rtYzM96BbM
	Ef8ZTGYkrX8zjnQEWa4Ij2EN/LphfpbaSpdNEnUobR8arrozhCM3/9b55pBqcq1s=
X-Gm-Gg: ASbGncs/Kp/FYai6beH/UHajRFJI3tppAZhiyFUdkGAJSWmoqfUX9KutSFgr7jMfF9w
	pFTTXQT8W88S6K5DrqVYP2kjnKCzlnXCC4COTR78rupH9YiBTY7Xw703Nsp4gHUH4xqrH9DPZes
	XgyJVR+6DuY5hSq01X2Y+5b0aoC3hCsAOb8JdHSrQmFyFe2vnB2GNz2SqXmJHTO4Uks7NSs0Pps
	3Ma1gWnSVbVDgM+ATEUUz7glon1xuRle9u0IrCJgUfrzs4zColNDesTs1oR4Av1IX9nV5hmY6Tq
	iIWV8kGGXBnRcpSt6IddEyV7VnrVOTJCy2IQXdJixdLo6T1Cpv8rNPnKgCXYmnMRLEs=
X-Received: by 2002:a05:620a:288e:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c9606a8ad3mr242922785a.2.1745615206037;
        Fri, 25 Apr 2025 14:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpInaWqBrWslLMEBHulOhEbn7os56AY7sdqmyXhYs3h7/KUwLESO/GdOIrc/pcmlw3H5y0w==
X-Received: by 2002:a05:620a:288e:b0:7c5:79e8:412a with SMTP id af79cd13be357-7c9606a8ad3mr242919085a.2.1745615205574;
        Fri, 25 Apr 2025 14:06:45 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafbf0sm187232566b.168.2025.04.25.14.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:06:45 -0700 (PDT)
Message-ID: <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 23:06:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b1qeyFCU_nhqOIJlfqv-H8-2Am2etYjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE1MiBTYWx0ZWRfX35ailX521xV4 GOLul7XV1Dt0ezIxnbNlBEvDb56m+A3XcAV9ShOHy9hQ/0xlRgE/FftS6KbSkWHVAmmWwpfsJGb FrU93OBlY2wO3Dy/rgR8bdDp+X/thCR0icqNmn9+Ya2fD8F2R5XMda734eu6ZMz9xbQtYo6/qLT
 PwSgJFXYe2dlb51pKg26LNK9NNIiMF1Br5i217OyPBdWcb4TIJ5Ah9UZWrX91qryPwIdySLAU+P ak1hhJxPUaIXYbZvwWg+rgTOulNTahtG1o02ttznGRftHq3NEAKZwC+dQ61iYfJD+aI38R5Kmhz gHl63rJCBTllAM7swHMzRrb/scKArpWN1juHAeZ0aOse4mve6K3jINjieF1Zf1d7bsniWY3y4O2
 UNq8hOB3Ya5WyXbsRqMyvJQsnN2Ix5zWttogdaUn2p7OrWh89K0el3sl7RHx2ig1krENNbqK
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bf966 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=fvTAydqcfIHFLh8AVZMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: b1qeyFCU_nhqOIJlfqv-H8-2Am2etYjW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250152

On 4/25/25 12:44 PM, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no interrupts should
> appear on the xhci-hcd interrupts during playback, instead the ADSP will
> be handling the playback.

"should" isn't very optimistic - I assume this works for you? > 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
[...]

> +&sound {
> +	compatible = "fairphone,fp4-sndcard";
> +	model = "Fairphone 4";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	usb-dai-link {
> +		link-name = "USB Playback";
> +
> +		cpu {
> +			sound-dai = <&q6afedai USB_RX>;
> +		};
> +
> +		codec {
> +			sound-dai = <&q6usbdai USB_RX>;
> +		};

'co'dec < 'cp'u> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <13 4>, <56 2>;
>  
> @@ -1178,6 +1214,7 @@ &usb_1 {
>  &usb_1_dwc3 {
>  	maximum-speed = "super-speed";
>  	dr_mode = "otg";
> +	num-hc-interrupters = /bits/ 16 <3>;
Where does this number come from?

Konrad
