Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0A9125D6
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 01:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738979322; cv=none; b=MrQBI+WN+6jjMVRmpVeUUN/IBwOm2pYWH8Lkv40RoEklDFMtschttAqTdD5ehgSsLGDz33yk+MISce4GB5FbwfYKxEIvtuYwZlNf/fdhDsakDBGD+TjLWwZRedRvG6GuFBXTk1lIq0noOmvJ0ZydpTrv/DqPYNNuZ3vh/udTcdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738979322; c=relaxed/simple;
	bh=VpnMtAzmUxjiP0Pu54O3XMOA1CWxorcIsLG1hejl4CY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nW/rRuQJZrDdoIvJgH2QQPnUTY9xib9B0dLp28GanqgymVXlPWXG6l0+UVWy7sw48adKYU/qN03JGpqJiu6qpvv/+CPglxMzFamqAQF8bXQvcYtUkEtJ43s6ZwM0KwtdeXS27k7Wsp06PdGxFJUaLMbCkoyfjrkcDPKeakCXQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TsB+Vd+W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TsB+Vd+W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5180K2i3008230
	for <linux-kernel@vger.kernel.org>; Sat, 8 Feb 2025 01:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl9UdSwizgDLzhJeCFKLohTvtuP335q16GE/Hoo/GDI=; b=TsB+Vd+WjAPWLV8S
	SWRLnk3lUbmSLak+N6HWs8Y2yR/zz0dXx94bjOjbYjn+04Al3ZHfQQb3ZTKgxx4H
	bV298dCuuBKRsctsaHNI7mj/DSuRkNhEsQFxpm5MH8Y4FFlP8crhoRu7bSDcBiEd
	J7ckFc/2hmALwhubbfE9pV3epDkL+j6rkcCXtIhZ7LOe4z5WHYATQ+Z2FZV6xfCV
	z8nu5LjUvPXF15rtGpFxu5Osr/qggExRTK/Qznqb+Nk8EyWGZoj7U2lAmlhc+VgU
	QiPNJlOvw+8Lri6OyMfeky/c69DGaHuA68q+35cy7BsN/u0gO9laxdZHcuLUWITD
	TxwvQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nvmkg479-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 01:48:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7b6e132c31eso34400585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 17:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738979318; x=1739584118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xl9UdSwizgDLzhJeCFKLohTvtuP335q16GE/Hoo/GDI=;
        b=IPX4lzEwhmEPzJmaeYzxEkncygGRikL/XAbfTp2uqGhhYo3Arrk/TX+y3EFo9JBAsE
         PuPoGz9TkZTBZaL4J4C4yWuG+W7PKYUcS9dcXxAsz/wGv6Kse3Wh+KR42grJLRRlZvEM
         bNTtdQ7w1LDaGaoBfssFRay7pcTvBB5TOpPgNOtqOXLGWGL52Z4DcM9DCAZh9RyYK/Je
         4Np/EzhELYDC1yNfhkhHI3QltaMOIVY1vLCxU09US3HzfN4TrGAHtA/qDvSPAluPWobR
         9AVylFHdTQvnEU9KLWqyLJObztQpT0rYUc3RcwEUFaFTqCHZOoKDBFBiGPy7L2gt9o65
         EJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUBzaW+nQ+lVtK4lthW+dK3k9m3h5xh0stQVoqpkN1l+F5twQqGQ4+MwmF2VXI0NDmKjqnAuiNlFIkUQkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydzjq+LlzXdas7VSSWVpqANLC2NG82ZPeUT/G2z2dECbEJFw5S
	5hJOwqZGW+G1wbcjMoUoFqDnx9GI/358NZEXhzdxVt/27kTP4C7NJjwzmVaHxlKxz/YKDPol/rP
	qu4QnsRJzidwwfZDNVTqq1AVM7C/Fy75dIaa/qy5Uuy1osYxTxhSQOxBTbixMQO0=
X-Gm-Gg: ASbGncuEKK1m/VHuF/7lwfqwlved0RREO6L6vyu4UNY7SzNCSQDFUMXrCxQgekQ7QfD
	ATxQkdJ5FUMgZBJBxh/kv8TN08qiorjmNX2sss8UN0pV+TzewsECaM+bHr62OsoHLsH/c5T2iZ1
	OmKRze5UPP+EF8nglV2zLrIyO4J7m2LGGwm250gcmggmtbia9e2pksy6GPT55WVjnN35WBFKG7V
	HEWW96sRmgnL+Z42x0XnF3W1n+GFULZ3LsZ+QNVyjS3UZaUhj2WjofLS7/S05qJgZSffTKR5Jeg
	75Dtc1jCvmvZtfcjhslrHAT6bIeXKF2wZy3mjZUWJM2Bfa/kYVuw/xWnPhw=
X-Received: by 2002:a05:620a:244d:b0:7b6:d26e:9d76 with SMTP id af79cd13be357-7c047c4ae40mr346170885a.14.1738979317967;
        Fri, 07 Feb 2025 17:48:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5DxAxvukpLhR34rHx9sdZvjTULj5Sql9mnUYRGRBbRwhSXMt6xgJkwCmMUpmSdxZ5jouzaA==
X-Received: by 2002:a05:620a:244d:b0:7b6:d26e:9d76 with SMTP id af79cd13be357-7c047c4ae40mr346169885a.14.1738979317611;
        Fri, 07 Feb 2025 17:48:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a275537csm32549966b.66.2025.02.07.17.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 17:48:36 -0800 (PST)
Message-ID: <a02922b6-7b48-4305-8cf3-8019cbe9a069@oss.qualcomm.com>
Date: Sat, 8 Feb 2025 02:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add BWMONs
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
References: <20250113-sm8750_bwmon_master-v1-0-f082da3a3308@quicinc.com>
 <20250113-sm8750_bwmon_master-v1-2-f082da3a3308@quicinc.com>
 <Z4k8T31cw_CxHFLC@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z4k8T31cw_CxHFLC@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VSDIUkQQ5wmCJu_FgRnMB09WCFm4iAmE
X-Proofpoint-GUID: VSDIUkQQ5wmCJu_FgRnMB09WCFm4iAmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_11,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502080011

On 16.01.2025 6:05 PM, Stephan Gerhold wrote:
> On Mon, Jan 13, 2025 at 01:08:18PM -0800, Melody Olvera wrote:
>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>
>> Add the CPU BWMONs for SM8750 SoCs.
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 74 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..09fe3149da1926b74a98280fe209ae7f423db864 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2802,6 +2802,80 @@ rpmhpd_opp_super_turbo_no_cpr: opp-480 {
>>  			};
>>  		};
>>  
>> +		/* cluster0 */
>> +		pmu@240b3400 {
>> +			compatible = "qcom,sm8750-cpu-bwmon", "qcom,sdm845-bwmon";
>> +			reg = <0x0 0x240b3400 0x0 0x600>;
>> +
>> +			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> 
> The start of the interconnect path is QCOM_ICC_TAG_ACTIVE_ONLY, but the
> destination is QCOM_ICC_TAG_ALWAYS? This is strange. Interconnect used
> by the CPU should be QCOM_ICC_TAG_ACTIVE_ONLY.

I'm not sure if this is a question, but I second, both should be ACTIVE_ONLY

Konrad
