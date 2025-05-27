Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3E322655B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748332549; cv=none; b=qMoo866KNR19w8yI3W+6Vv3q0S1ewI2YhzmyP43YUju/pK8db6MTrWcFwywCk4foYWVlKLsXFF0CakefB9RDcNVP0YNXr35NMP+4xCGOfwa1Hm3aaFJFb8YtOIHDKcol7KMyUW7R1g+0Z64CrFfgx6IMKmV1ulGfM1BmIyRDh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748332549; c=relaxed/simple;
	bh=YkQQddHb8jlPo3SKLo59UpwD65Y7ZPEUTHo35ozEy+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2329yrw7RqJGpjortiLlENfSN12K92X3Ru4Lncj14/nyQW9tXybFZdE8DKdLLHb7he1ZivvFbWF/k5qbhhC37asAut6egmoaiuQEQ8lB0Fkp3SZSDxZtTyZGQqExv9YEC3uHb66wKJvbwfTEcvFfkKAmtvudvPTu1geL3jLYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmfN5Zls; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmfN5Zls"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R00Ksj016904
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSQWEBsBEF9PnfN+71Hx0sgWBcdAij9SMJAFGtN0t2E=; b=nmfN5ZlsYQ54EIHM
	Oj8+vRsULwUXZ8hmAVEjFTWJqg3oaemHWt+g/JKEP88oDLn6hVrdVcf6fqGo46JQ
	3QbDR/IWqQa2SJS/FfK6iS+MzHGz5fuOpAPqdtkcMnm9lYrkF9jEJvsnrPeQqNef
	HzohpjcG4t6S7O7rVKfK77q7IxxOX7ZexW++VoeFDF5w6LCeY+2ED/uUVZFTXTDW
	c7gQwEuti+Gguwl8ohhA7dB6uAwdF02GH6F27JDpfbK1+PLs57W67i75yL1+rDaQ
	C/tBPuOmlia4h+Tn+9jWwBQk6/VuQ5L6naJys9FwLGtAxgQ5t4kr1/91C7Y0d7kP
	4lWIGA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgctjmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:55:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2343bf73872so19821075ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 00:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332545; x=1748937345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSQWEBsBEF9PnfN+71Hx0sgWBcdAij9SMJAFGtN0t2E=;
        b=pW8MQv0Z3kMO0tmHpxrt3uFkiIFT7KQIwvPaKPONyyoA3wTvUT8gVJp9dAg+Srrnwu
         8XzJ5QPtybgpxcKRzLJWNUKyQo52c9oQCV42xqb0P9c8/0SUJ0VehFKiYUMtjxR9+077
         PM46Z/b6P5x1VjOL4JCSc1HcFQuaj3RIVr2XGzhapFe1zX//28QcGGF333x6rta4BStn
         xf0BMouBsy14oQszeItIWjNDyXmIxHQIIB29nIVBgr2uq44AhmPGUHiwB8eLPoaDWaMs
         y5I0ZnmJUaMqESK1V49ZIH41cxQjvyeZOtwPZbRIrpTXGZCws/hgxj/aJbqyeXYv62hM
         G8xg==
X-Forwarded-Encrypted: i=1; AJvYcCWaaCZJmcsLIa109+2sqWqEh9WLnPJZAhfX6UrQfldPm+BtXYi/U9qrQYY12Pzq0MxP0VHlzcJLQuYaNSk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw06Eon/z4COjy9qTcL1r6W8hUGJIe+LoQtrXerc5mG3CvCXp+N
	n2ehqvalhePun25loUq6smXvJjtEjby+z/SSsjqli4eNRxodUeIPjzDLpoeHRpYGoUPpt4Fi1/E
	WNdGl20tjyv22MBMetNdqpxPSFEaW6JpiwZu7AxRozPtAF/jz0RgbHdmSVEDZPx5AfWs=
X-Gm-Gg: ASbGncuHoRTfoxwxZwq+2lk9Wob2HyfbDd6IYwKu0ZaFaqlzDOQndGTwCNPwL5OrGL+
	+4LzJptTqdXP+24qNS3CjLhnH9i3ytX7pM2ByD8+v9hOZasGdw0NRyi7U1HvMlJtp+tv4dxmXBA
	bKHkYfwMdGk/8bMaxr5reysy9Xw7SYO7OKdjgUNybGHNjWZ7kdb0BOg3prse7xj7T5YN4ZNfSAU
	JfB4Z6nBiL9RM3vqy13EVQSLK7sit8d/EgJCHUQMuRMR/ZY7b4YLqmDPXEj2NzMPUqQhgbQNJnt
	e9O30KP3Eq+p7J2wbiFMEjVaL5bDNFar7hdCdD+Y3+Wqd0RS1A==
X-Received: by 2002:a17:902:fc84:b0:22e:566f:bca7 with SMTP id d9443c01a7336-23414f6e2a2mr178065375ad.17.1748332544961;
        Tue, 27 May 2025 00:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqcJUwDQW18Rp+AmlPMd2GnC8aI6d9TNf36XirBj5sKw3tRyXu3GPUgfP+hb+ogtTPpdBA1A==
X-Received: by 2002:a17:902:fc84:b0:22e:566f:bca7 with SMTP id d9443c01a7336-23414f6e2a2mr178065165ad.17.1748332544573;
        Tue, 27 May 2025 00:55:44 -0700 (PDT)
Received: from [10.218.21.68] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23452e810basm33558115ad.40.2025.05.27.00.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 00:55:44 -0700 (PDT)
Message-ID: <04a93057-c67b-4042-9ff9-fec4183a85ab@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:25:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <cfd4f557-7f97-4da9-8eff-fe3749e336db@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <cfd4f557-7f97-4da9-8eff-fe3749e336db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XXWyrhbMcBgAEByKKpnXAhqAIUWnbHLU
X-Proofpoint-GUID: XXWyrhbMcBgAEByKKpnXAhqAIUWnbHLU
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68357002 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YJSMDzQey5MvNt0fXBwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA2MyBTYWx0ZWRfX5NO9OYngdpPh
 saDwW7E3fODq5Lv9V8PCm9fiCAqz6BQHmGePR48kpZD9NiPC/6D7NzwT1bFYPF+NKntu8rw8J94
 bN1a0nfzQrIMqQLI37oxP1tyjezektZ7qumQsKkGHS7LID83ktkC+LlSA2779fBgsb/5L/L5jEv
 7b3dffSqeVBPxT1/1BqhcZGUIVbzZH6zLURm46ucZbg7EZ9Eyd8olhcgiZ/qT/4dYF5yaiAdzuL
 XDQ1rUjw2Gofeix3rlHy60Fn18VB6W2/QAsdrZGU34NgzPRroNagLv5kUxNyo5FP0ctZIjOVnVk
 +/8AsRYET7ak/u0pXQpPNr+s9gA58qtgtvRSRx3CLPz3CAcNK4OS18NUaMyoTzSdKyN/MAxfOAV
 qi803s1v0WaF3ixLv0p40ZZrgdUsQjHfbUv08SFuRZxItDwNAMdvK1qi9S8rwXCH4u0IfaQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270063



On 5/25/2025 10:43 PM, Dmitry Baryshkov wrote:
> On 25/05/2025 18:53, Mohammad Rafi Shaik wrote:
>> Add the sound card node with tested playback over max98357a
>> i2s speakers and i2s mic.
> 
> I2S
> 
> speaker amplifier

Ack, will update in next patch version
> 
>>
>> Introduce HS (High-Speed) MI2S pin control support.
>> The I2S max98357a speaker is connected via HS0 and I2S
> 
> speaker amplifier

Ack

> 
>> microphones utilize the HS2 interface.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>>   2 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/ 
>> arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> index 0e44e0e6dbd4..1ebf42b0b10e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
>> @@ -6,6 +6,7 @@
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
>>   #include "qcs9075-som.dtsi"
>> @@ -20,6 +21,57 @@ aliases {
>>       chosen {
>>           stdout-path = "serial0:115200n8";
>>       };
>> +
>> +    max98357a: audio-codec-0 {
>> +        compatible = "maxim,max98357a";
>> +        #sound-dai-cells = <0>;
>> +    };
>> +
>> +    dmic_codec: dmic-codec {
> 
> Just dmic or audio-codec-1

Ack,

Yes right, should be audio-codec-1

will update in next version.
> 
>> +        compatible = "dmic-codec";
>> +        #sound-dai-cells = <0>;
>> +        num-channels = <1>;
>> +    };
>> +
>> +    sound {
>> +        compatible = "qcom,qcs9075-sndcard";
>> +        model = "qcs9075-rb8-snd-card";
> 
> Were the bindings and the driver sent? Cover letter doesn't mention 
> them. It is better to send them as a single patch series (this is the 
> case for all subsys except net-next and trees maintained by Greg, e.g. 
> USB).
>

https://lore.kernel.org/linux-sound/174773911882.44858.10139663344496764867.b4-ty@kernel.org/

The Bindings and driver compatible change is already merged, Will add 
patch link in next version cover-letter.

Thanks & Regards,
Mohammad Rafi Shaik

> +
>> +        pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
>> +        pinctrl-names = "default";
>> +
>> +        hs0-mi2s-playback-dai-link {
>> +            link-name = "HS0 mi2s playback";
>> +
>> +            codec {
>> +                sound-dai = <&max98357a>;
>> +            };
>> +
>> +            cpu {
>> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6apm>;
>> +            };
>> +        };
>> +
>> +        hs2-mi2s-capture-dai-link {
>> +            link-name = "HS2 mi2s capture";
>> +
>> +            codec {
>> +                sound-dai = <&dmic_codec>;
>> +            };
>> +
>> +            cpu {
>> +                sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6apm>;
>> +            };
>> +        };
>> +    };
>>   };
> 

