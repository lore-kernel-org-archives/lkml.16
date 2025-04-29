Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C982749F6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924077; cv=none; b=Qlonw7IFrOQbe0kB2LLSFkjtRZuvRKsfBlIJb2CFnahVsZGA2YNPg8CkkfdWS67jZSXdfD+t36NlkiEA1Rr8zjz3UW4C66p7D5eOHvkgIrrP/Qj1xjkLm3jlct7PhWk/A34Pvz9Eu83V8DJXnS1MnRah1xLm2YTEupYglA4NX/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924077; c=relaxed/simple;
	bh=R+R5owaDqiRtDGdV54f3tvu5tpjQYX5gZAf48U5swnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/+ZRa0RonzDAEbBHUuv6r2KJ1umxnj3vPEKX3A/GAS1jkfSGkUkQ4kloLaoQ1Jy0M7lfg/lNlnexwtmo8snPr3ri4hiNPoDIBAasY67hAWuPNmHv62GwUCxz3T9A0X7H069h0ZV8rl655Tv7RKVypl94W7qyzS/Z7S3zOAJ1us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2q8Jnx1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2q8Jnx1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAT88M014387
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rlwbv5Ny3csX6621th9RuiqaZUc7eazYNnVFD4rwNQ=; b=U2q8Jnx1g66evgcM
	gbO/avSqpnjlcmVTSII7Tyybd0oVrcuBwWnr9qx1SI0bX3nOyHY3g+KOUTnQfecM
	npMu6gbp7DhnTGeaIVIA4yeuenq1rV+6RveNVGKHFY0RnWLAPdrroU5uCW34xL0/
	GGtaOs3gim4SGEqz8RnkxvdnfYRlIXpVpguuqLd4v1UsDgfKCnbOkR8+taAYY6yO
	bp1XR+26PhviWWa2AdiplmoP59Y9MQ2aE3afUv+5v6wT7TBKhFP1pP1R8JgOvMGh
	Sw6gVPz/O4QKz1FNTXJGH+kehJMYwcRjDkseBmDGsii7+qnDxRgTCiyO3vlR/h6J
	DYu6TA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn34uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:54:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so19945436d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924074; x=1746528874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rlwbv5Ny3csX6621th9RuiqaZUc7eazYNnVFD4rwNQ=;
        b=U7GWQFVfdnw6OUpITdtKf7ctoaJLkIm6IEuRT3jXhRVPLMDum5CLy50ilqciXHi/Sp
         l7zdKknK3b5dB92gTpDUuZzjyE4rwacIhAY5YOX+Ax+BOHgxpM/5O0yQtXDY5RYLxSyS
         ub4xJs8Mv/HMwDEJV+aYEWFb/L1QBfRFyThUbhZmXC/R2cc4azfPPOQVVDSLSgT5QZVq
         dwI89aph7NU/ocnDrrYxYj+C1jp5b25r/t6ZxQtb66X/oalBbZlarNMkytG3k4EYZF9b
         CnjU3/E5rtToOcTZeISyoyzSunl/UhwhyWeCcCn6+xar/vwWoIL1NTC8k76wyGnxLCV6
         Kuqg==
X-Forwarded-Encrypted: i=1; AJvYcCXqll+t4qaf8w+RIx+d7wjHEawCPD7L1jXzKG7Cqz7S8DOr6k7jPzWFiBefFR/jlaqc+q8+1/YqrXwDrKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU5vf96TNjaozo0kl7K2+BrQ+6gC5brn6vAgct/2aAFbEslvFZ
	nU7em5rS7RA5+F2WZ+ICRd35pmpMaREpM65NV8r6ERb0Y2vmxEA14Chs+bPdmb4Q2znZzp+HXpS
	gMO1kpVPw7uTwpUMG4BaRpL012psYKDpIFP/U0PpUBAB9GTB7v9MkCEX4cgA2rHY=
X-Gm-Gg: ASbGnctNFr8JYN8C8NJhojVYwjb8q/annylJa7o11GjmslSGOUIDfoN+RDfHgMORH4q
	buD3KdXtADWTC1Aix0Fx/Dn1Qm0QRA6Or+0unMMS5VSB4d5fOZRLFIs8m5nM6GFDosoEr6gkAXC
	1xVIJNcesyC1qENdT5qo4oIvB571SEASxxLwe2FHIfn2Z8HLvmxlWH2mAWlQz0j43QjXUMj1wtp
	gHF8zWJmPFsiYuRSGaeKmN4YwGarAGJ452qYv/BQ9XwngJZ5VcxR3/3NMpPARrAaY4Gn6kOts1I
	VGrUo7G/+Jti7IDHy6TksB5aL36s8FkadKiCmbb8C2ZTKCVAeob5xIkf+t+9YBTT1Q==
X-Received: by 2002:a05:6214:27ee:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6f4f1c5027emr14214536d6.6.1745924073879;
        Tue, 29 Apr 2025 03:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2N9lav3OZuTTsmb+XCemA8XnPPaA9TM90PwF3DYQcPvu+55T3OzOMzCwrbsGph9xAhK9OA==
X-Received: by 2002:a05:6214:27ee:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6f4f1c5027emr14214366d6.6.1745924073541;
        Tue, 29 Apr 2025 03:54:33 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703545218sm7152933a12.53.2025.04.29.03.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:54:33 -0700 (PDT)
Message-ID: <12ccf19f-10f9-42a7-b61d-fd54d5922bf7@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8xuVi_AEEmWyyUIXYlUb22rAxFy7WJ_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfX6PWQWiDqw/0s 3LkanN4vYcTuhJKyCzI2G2wBdTlRamCb/5xIWEauq23Jr/BRbkjyT1Qw91iC8JYiqCnXQRJ2RCc JZteSvbW2VnSob/mo/TyKFy3pHDP1dGF+ijs2k0OxW8Yc4qaVhtHYIJZMtWtzfCWHpO5HQc8XxJ
 vL8zmAloGc2zVxfuURY6XCfB/VbR2+ID18Xy7/1nBVW7D43ccl+CtI8HHjjIvwkjgtJIPb3egOn q6CjpL75a0M3DVrlHymHToEMR+OQKMIdtRP+o3DXaQ4+wmvi6GGSqWg6pFB1n19Z6omab6plODn 4YBmyGPKGKivvHpeGbs11UwNyabPdNp59wUWBomrV4gr1SUfnX9HDaGLzQbkvOjArCyA5KlxwrZ
 IEm/s2Dnl4R2rQamAYUw2CrsQcYEhZ4zALlRBGfXJRbs13mBAnh2eqE8jNnea1aX9hXYGlKR
X-Proofpoint-GUID: 8xuVi_AEEmWyyUIXYlUb22rAxFy7WJ_g
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6810afeb cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=QeD8PW6LcMo_rznnNcoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index b11b9eea64c1..f3859d805ea7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -11,6 +11,54 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
> +&lpass_rx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

TX -> RX?

[...]

> +&lpass_wsa_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

TX -> WSA?

Konrad
