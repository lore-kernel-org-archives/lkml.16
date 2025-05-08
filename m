Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE579285409
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722713; cv=none; b=hdXtLGVl4++bjP7YWn1iTAXKeUk8mu/dkpI/10ibaROnsJ3D0PelNhT/JT68vswBrzpxcZkCMIcHlzvR64MjM3IQxJ/F67hXuN0X48rgD+gq/lobCZz3SDUrkTr19oTclCvz/QFGBIMHgFd1zJ2elj05aR6jWckkVL9NbswHZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722713; c=relaxed/simple;
	bh=kwiaz6X37w2p+rGl0TL9E9E/OK/1JhUxEEvizn3ahAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouPU/LQ77HC2iXiIa2mpfyRLHt+YzdTc5KA4HBp7D3PcBeFGW15LRtJKANTCj32shhgJ/kXsgLrVOj84bYrKzyYToyO+v0gsrqoe7RLiBaIMRVFicp1HGSjgj6iKvk5gw+BjrneHbcOuC+rjnC/88u3ASgm0L4n/preWnJ0YCQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx1VbU0K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gx1VbU0K"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DHFSa008635
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 16:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSgwUqkSfEKmNonIWMkEu2HDYErCYBP3rkqztUMDifA=; b=gx1VbU0KJBasGDR9
	9olNE3xQg9wIMhXlglOw419otAS8RjI9tm29pMl9cuOGntVpwelD3Hnod88u/nTa
	6rKuCG5ENY+tx3Ta8FQbqfEDXCjNAJLeLwLE2DCvDPQYTvEdO8co67Xl4Xe0a6AJ
	TEA4LQclneCObVzAH1hLWrDxB+LBYHOXUUpYbSxdGUVvMIJGnhuXSWXHKJgHx7Cb
	E7kx0rPC576uavyDgHm3/KWSeegXuj0sb62z+36kFF26TsRlYYUS8qTPNi8TD0Ot
	Vx9HDrUWEiDoVO3c2p/ElBGGDQ1CB3eva2yhiPuDTKfSkoT3NlMPLBLbdK5AFfte
	QEaZNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5a0h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 16:45:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54be4b03aso24448585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746722709; x=1747327509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSgwUqkSfEKmNonIWMkEu2HDYErCYBP3rkqztUMDifA=;
        b=F8VuqFruAxl8nO3a7SnHkcrVM/PBvnrgcdIFK6uzULAUAx9vwWDK0ZiEL5wovT4xQJ
         Fzlx0YbuTYh3AHNn2FiCnWd6nFoJs2jNaw0jJ53nQOJqdxjVvLEa26AuVvrn0IYD3paB
         8WCpuFP8xK/mN0bmoYyOzq6QsCr/eIj+YwLwC4iqFSupDoB4cB7/0r6jND6FtgCETG/x
         sx9QKuigj5XYNvERgtI4Ccd1Io89GNNZd8BwZHAdjHqW5RgZSNdsdMLe/OxdDa9fk9ik
         xPJyUXem0e2fIzJNOxJIrNFP2jYD/WiO9yR0tcmkIdNFVY6r8rP51J+/OA0Z0eUHEi5A
         +Yqw==
X-Forwarded-Encrypted: i=1; AJvYcCXFTx9KdeniJpbWNCQEr8+fqCZmwN5CtSbwwXT2Cq4AWfE8AZiRSU//+K592IglpzHERlCJfsbI1t4rpbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqJZKPOZnD18cov99t/aGOFFs2375ShWkSCxnFUs2DDB7MpV/0
	+By8aTVmMp1Iz0L2/Anx3AE0fkZW7Fs5wlaUl3wRdF19MJ5P6aX6xjCD4JpbVmbbQolJ4urOOPv
	rLYzGGnqYaNNYAxRzIqH6ESJKIXbAHGHUJHBJ02KJi1QA59h0KQ7+efGQtGly2XU=
X-Gm-Gg: ASbGnctPcz787pVHuDZMMdrJFKGk3VTdhXM5OV1dRwCp32qgHroqRSFoy1+PtJqaRVG
	w1Zoutqs7PFekbizBESns/lrlZvdY1JrabEnggrzM/+fIm271HGKvbMCU8lqNX3Gi7svd5Lb7Qg
	sAd6Q+natw3Ycr2Ae7ckCI5/7izb6cq3roExgKA+Q0/Lea5qW/RD0VZmUPkBikaKMdKs9SyfXn1
	3baxekPIe0xxVme5uXiSLLRZNQHRqV/LCemGBzJaMBxtMh96j1nvrBWmWn+675safUBNA9tCmCk
	gpxhvUrVtLpYFYCEiRgJ4AiMR8IE/Vlh4cCFRkIE03vgxp4ZnGgH+YWuwU5LcFkDWBw=
X-Received: by 2002:a05:622a:44:b0:474:f601:c21e with SMTP id d75a77b69052e-4945272e639mr384681cf.5.1746722709666;
        Thu, 08 May 2025 09:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjCAPrSx/92bGi1x7He7ajN3/L+4Y9gypA2HsWqw0iZxERYDr2h8wCQykaB1fY5i9aXZ5LlA==
X-Received: by 2002:a05:622a:44:b0:474:f601:c21e with SMTP id d75a77b69052e-4945272e639mr384241cf.5.1746722709030;
        Thu, 08 May 2025 09:45:09 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bdddcsm10190466b.140.2025.05.08.09.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:45:08 -0700 (PDT)
Message-ID: <b488ac7b-46dd-44e1-a132-c92daf95b421@oss.qualcomm.com>
Date: Thu, 8 May 2025 18:45:06 +0200
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
 <12ccf19f-10f9-42a7-b61d-fd54d5922bf7@oss.qualcomm.com>
 <82e6c229-8852-4ae9-add0-5fdc0a15f7c5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82e6c229-8852-4ae9-add0-5fdc0a15f7c5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cdf96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=FNMLLXcm4HOaPzSYPkwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I08rPWYKt4WdJngON8gNVF4fkPDTs0zz
X-Proofpoint-ORIG-GUID: I08rPWYKt4WdJngON8gNVF4fkPDTs0zz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NiBTYWx0ZWRfXwUi6JmDMs8Q/
 /5dkeDbNBL0I/ZQY0FVHIKfHceSUOcWd5ef6C0FMtku2T8wJdtthGP+Yd2mMvf7dn9i62D6nbJs
 vDhN5EUARQ8jw7SoOSJzAciTQgRClN96UHLFioEhY5xn5NwQlzVPHS7zIs4Uwc+32+ZplQ8xPc/
 kn+YfnH5vThgI5p4+/OMjxDdTI0AO6pZ7POxdb+By3/WRMUTyUfHhR3BSxrO8osTf2YTLhEuv3k
 xiCxJ6PUo549Zel7G52YBVlYPPG3gLxYDqzYc8truVIPGVEU1hMnkhjhcn3R6Fq46xmk6XDNar+
 cGHE2wqRu5rrhW2MubMypVpZ04m9pWIG7T3O2XQMzXZM+tqVtJ/+t3WfwAtWOpiFnagvylcQkqI
 N3H7YEKGJqepRSaBlJk23BgbBNxJFB63cXRsD/6bROVQlDZfNhm7MITvj7fcViAD1xH4g54Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080146

On 5/8/25 6:38 PM, Prasad Kumpatla wrote:
> 
> 
> On 4/29/2025 4:24 PM, Konrad Dybcio wrote:
>> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
>>> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
>>> through the q6prm clock driver.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---
>>>   .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 48 +++++++++++++++++++
>>>   1 file changed, 48 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>> index b11b9eea64c1..f3859d805ea7 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
>>> @@ -11,6 +11,54 @@
>>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>>   #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>   +&lpass_rx_macro {
>>> +    /delete-property/ power-domains;
>>> +    /delete-property/ power-domain-names;
>>> +    clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +         <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>
>> TX -> RX?
>>
>> [...]
>>
>>> +&lpass_wsa_macro {
>>> +    /delete-property/ power-domains;
>>> +    /delete-property/ power-domain-names;
>>> +    clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>> +         <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
>>
>> TX -> WSA?
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side, Unlike sm8450 dedicated core clocks. Core TX clk is used for both RX and WSA as per DSP recommendations.

Please leave a comment as it's not obvious

Konrad
