Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F3F1AAC4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573093; cv=none; b=ccY0GvhNhwJT/BsThlkjgrTrBxQypMRNPiE7p0TH8wmZ9CA60egbv0PsFyYAE0wrevRFcwloAVIzwzCd0yb0+8hsSt12SduLwbsPUsV2wn1LlMKWnSUAnn43cSuFNZPn7XZSQquulP+XFxaMFXRg1ZTS0xlMO58j4rx36rXSPqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573093; c=relaxed/simple;
	bh=Yc4BwXcDlBm1F9/eAPkhhmBz3Iwfa2QIOUzglIaGc98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+vtpf4cvDlf832x4wAcT8EyPnaX0CysoSK1DcY/VaP4T+d0mwIVpmd27lm9Bc1iiWn8CdCf+LkogMruwBX/sq/2Thex2Aet/aamMni7yzWh1ZxXMDPqTUphQXHlEcJBoVztUHwzJBOmLB+1SGZ5az0rFhUX5aUDE+3MiMLIl+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fb0THmZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fb0THmZo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TCsM008732
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TOVSLiHysmlmuAA0RHIHbn82IoarWugi9dE7AH6+e8=; b=fb0THmZotVS5nHV8
	0N130J808EBa/0W5Gm8f/hAMIKSxI3bAFiZRZf1zTqz4bmTqelFz8wJU6IfKsbhY
	o9W68ieDv/RsIWpNZ3rbMbjrPlpx87bUbKFMgicGJ4qWnO/9c0EwtyrLJZ8mM7uQ
	7czMfxp8TYtvAS346utC/03lQkvESDO7ytrbF9Qcp5VmBAsWawLAIhb1SpQDmpDt
	WMOae9a6xYXqjWHVMGCZsrloG5kbhOAcMfMQGzjGJaqPQ5CyqbEeih9qObRyiPYK
	DNUfDtC2VAkSuNq/t+LCIT2moIv37QCB/2yvR7xd7JAWlDe5ytyPedxsp0a/M+Z1
	7TfnZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8eby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:24:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae9ed8511so3637321cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573088; x=1746177888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TOVSLiHysmlmuAA0RHIHbn82IoarWugi9dE7AH6+e8=;
        b=BpC9vGngjgtZBHcBFAwyd2/W8JSEKZd+mjQKccp+H4t82weSIH3k+8im37rt5VgeQ0
         Lx3ogA6RokmrB3OYRH6Jcd8JyZYtYSzcW/8o7SYxNkktq6AE/lHJW1tKC91mcMZ7GkjL
         y3y+MI1p9lchg9+zyjOeGm3L6RdoBjMwAdkqpFLNADoRE1lyaklg3PTJ1K7jw53i1MgI
         X3VSFAbcYaEUwoK+Xz3QxNKsFw4Pl7CeERGETzIc6/iCA9YEy7FrhSttjEoudKA4d8Zm
         ZchETbLIKfUV7uKlliaNjB1M3cNUVifsV5syTB0XLK6U9HR5k8P/OS+xht5s8Kc/jQp8
         FRYg==
X-Forwarded-Encrypted: i=1; AJvYcCU8G3105KGAKhefc74Kg6KUheRajem7VOjSCtK3Uw3I0pZXejK5L7Y0SlNdMSU2kl0EipabTAYBFArumHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywcMc6leiUu8ictfWLOh5LGQCQWKVyWKENiZRBjbg70EbVO0rn
	6lVDZ7OqlOP6gppOp4T5XofcSddvdJNppfLr0vDbXuvZTHmR6fT9te2fk1NZMVWBkGU3nh7mY2p
	7VHJSWJaLocwEPt0eg5J2q+0f2xHPbqts9yxLX6h9tn/iR5cDzeTUENGCSf0nQ2Q=
X-Gm-Gg: ASbGncswmdOyKvy3uzw8J/oFSzDn7r+1BdU+RClaSqQ5EAdNnBwNKAF/aTyuOQQCRkw
	Sr5bRuP2NXrVvEBEhE0gfuTbnsidTVF7gUuazJbyPfPX5eng0Tfu87uR1MPj4CBukkKakntFfcV
	8L8AVYoWcWr5KC/+P0ZEbUQXi/3s61s78Jjw+SHWnKG2x4kLJSHUdei4IEJrtfuBtgjfg/srBbe
	P0AYcGe6AwzklZoek35+mS7i5beK8FI0LWYTrGeUiJGGmNuAcH6QADUOI6QUPCqLppLxcSXVsHX
	BpzpSvvT8U5lCfL1wIhlBMjiDXk=
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr7967931cf.6.1745573088536;
        Fri, 25 Apr 2025 02:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECDV4NjfiCTRpDdBppQk7mkiFY9COAykAendzS1IIWlk9k/YXc3xDR978i701ANPjxYOXj4Q==
X-Received: by 2002:a05:622a:1a28:b0:472:1de1:bc59 with SMTP id d75a77b69052e-4801c796973mr7967881cf.6.1745573088207;
        Fri, 25 Apr 2025 02:24:48 -0700 (PDT)
Received: from [192.168.65.5] ([78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb0becsm102529766b.167.2025.04.25.02.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 02:24:47 -0700 (PDT)
Message-ID: <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:24:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX1q6zsbWDgOf1 qcPbnm+vHhMSTL0CJV85QC9tgJkD+ekU7neDv8U5XzgbljweN9PS1KRXm0Cb4wYWvQfMCL5QC1e IQCbsx50y/e/nQBLGRFffQ/xUW/a7mqpf8bgiijZoeDE4M8ybiRG7+e/jxKfcdKsWRj7W1Ir4HU
 FWg81ppiCXRtMBNSOarxD46iK9DiLxxhDgXVS0eBotSzfOGZSR3o2DoUMdMjS7vZIJnveiUu8LM whBnyi5W+Or1Be2AfRpcvwGJmwikAZ8HmPZvXMW9UG7S9zsd2TcydiUv/b1YVEz7xoHbg0dAhoi eMSmbtRS0TGerr6GWVnoxvoZa8ZYjJoTasbVXSli/es/sckTbnMXA4vhUj27GLtfNUiUUykFzYh
 IOTK3f+bNcI2HAtoY6YPcQ7XTBwiRHSPKGF+Mw7+ghLmSHnZfZg5zpuraHhTGl3ypu/6XOnK
X-Proofpoint-GUID: h0mKcoHQ2hNBTSKvX3mzkcnclGJ-2I-y
X-Proofpoint-ORIG-GUID: h0mKcoHQ2hNBTSKvX3mzkcnclGJ-2I-y
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b54e1 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qkmjNN0peoRQDp3El6UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=788 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068

On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
> Add Soundwire controllers on SM8750, fully compatible with earlier
> SM8650 generation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
>  			#sound-dai-cells = <1>;
>  		};
>  
> +		swr3: soundwire@6ab0000 {
> +			compatible = "qcom,soundwire-v2.0.0";

They're v2.1.0, same on 8650, there's a number of new registers

[...]


> +		swr2: soundwire@7630000 {
> +			compatible = "qcom,soundwire-v2.0.0";
> +			reg = <0 0x07630000 0 0x10000>;
> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "core", "wakeup";
> +			clocks = <&lpass_txmacro>;
> +			clock-names = "iface";
> +			label = "TX";
> +
> +			pinctrl-0 = <&tx_swr_active>;
> +			pinctrl-names = "default";
> +
> +			qcom,din-ports = <4>;
> +			qcom,dout-ports = <0>;

There's 1 OUT port on this instance

otherwise (modulo the settings I don't have a reference for)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
