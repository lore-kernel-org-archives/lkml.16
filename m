Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE1522B597
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842183; cv=none; b=CEsabNR7Vr9Ok8kPJYmCXkWqsqde53NABBimzoaV2QjWoKbeWhYaG7XEEWjNUUjdEl3ktEb6UaknNR0j+oGiZo1+lvazraJ6j3yoRRh1ozdr3s8Ng3rRUhSuh7XR2tO7R+WVrfoDwb0XnJxfUQRfuK/pJwFyvnNaKqWZPs8nN7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842183; c=relaxed/simple;
	bh=IwaoInNcCkxg6/wBAtRUA/RpZGtkbwebs+NS57oZcfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMzXO6XyQqTDSAITVu8wdshVgB6aSXAXfzXJ6pzTH+Zifmwt4MnlQYQZtSKcaJcFO96RyAmVaKfYlpeMMaUgPzaFzh9c0unJoVA89+pmz42j9KmaUu2oPOKU/OJAb3ytLA2wNwBV5FYWdCYVDZ9aj3RHzjJH/vzZNlckjMgWHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PP1x1jAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PP1x1jAh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169lqb3026712
	for <linux-kernel@vger.kernel.org>; Thu, 6 Feb 2025 11:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GgDXbvInhlAhGwSeq8KXKEuEDVn2eZuEs+oZJFMqka8=; b=PP1x1jAh6tqyOms+
	cLKFBlMXOPCCQgN7xbtq81Lcx3i9LqAwcVricq3xtWlCsdvt/XmBdyLboEuTnb4a
	pIwWXk50WzNozb6mLNpO4Dc7/Ezdj+FkRKpbKkbuAm6DSoXveeA4zBpwuRflClfX
	CuHGbRQwWH8XevU1l3LQvZxWW/+Fae55ngqe1NYXpY4NahS2HBT+LRz6NHcAZL8B
	KsGMM/kiwlwt0XhvabPQfZLlyDXT4Y3SOobg62I1vFsl94WHLQ20OjWK+KOZamg1
	+33LYeYQvO5kXKq7SEdTLvrECzxIBERQ/lJyxFH5B5ljWDNd283Iq4jEMa6wIwZO
	3waelg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtrx89av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:43:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467975f1b53so2826521cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:43:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842179; x=1739446979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GgDXbvInhlAhGwSeq8KXKEuEDVn2eZuEs+oZJFMqka8=;
        b=iH0aoSRFu6oT0nuh1fGHqbSwikdoF1I/EbsJXMi9dFeV3ge1l1OMHA31i7y6tXvC3G
         aBn5hXKd1RGV2owKAjnDKIVp9jf0n7ZmCUSco1IoeDdWZIidvxmXb+XfaruLvIy8xyQD
         1drqw2c/1VH7q01NH35QAoyovNH+jxwJa55U3AD28UqIiCCKnQot2zsufTrtH7bvHa5z
         /r7XlQ6CV/dpAuPPnwTa07TbHjb8z6udQA7XwfBMLEyoftuNykH0d0qkv+jNPp6Z00nd
         3iWHrwUqfNoBrA9I7qPq9D4wK5wzunvqK/3AJq//SFVkp7l59nTyCax2kNydHWKN/MZM
         6bGw==
X-Forwarded-Encrypted: i=1; AJvYcCUIostOyJ6ELcXlx9AhTa/Yl0MO42r1/KxwQaC+iFY3hXUCNUBeKujI6xjG3jtOfyOz1qkyMEYs/Un+73k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOQTTgrCS64+K2Rgu6wpzirORdchadPnTkiZU/3IaKGuilEPI
	ZiKllH7vPBzL3C9quA9S3q/6Nz0asMG5wFZMwkqwBuf07Yvfj5ZmRIB5eiu6ATyAcSxECSDx2ZR
	ePlOCyj6jsQy+U/jOkdoV7NVNbQ6xjC1kSeqGuqFwXNzsJ7TumaXCtwuLFPbD5jk=
X-Gm-Gg: ASbGncvAyeTKAW2P05+d0oN1PXQmSJF5AGfh6E8AfFXGG8rU+xGqYr5Gf6whr8mkrKG
	S5HvLjHdGc/YUAv1Rl9V45XZPfMqnqqzQZhT8SdA3IOq6eQVsdxWUDwsL9U/v65lWrlXkTIxMmd
	2Z2QffIv/CpDok5czYdeuDtK8dIqXL2q9bCISc3Zmtwgi8j8nQH5/AhF53FaXptIqTXdm5fP6g6
	hK8qceTkRl8S5Cr1RV9VeFYRRe92bs/GNC9KuUXtPEkqhb/u6Ij2F7DQliL5LYPubalrMsUSxH7
	oWvufEQRYbGvpucUDsCPmtrR9fpV5lZV4FGiG1u6Ww5T70Xvqr7lZtaKF34=
X-Received: by 2002:a05:620a:bcb:b0:7b6:c597:fb51 with SMTP id af79cd13be357-7c039fa585bmr340531985a.3.1738842179452;
        Thu, 06 Feb 2025 03:42:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/D2i3WqJeQYDpNAy99elwHmlBbBk2BvmkS3Gbcrju8wFWJZzEf61R8s/GdQTqioJJvUkJHQ==
X-Received: by 2002:a05:620a:bcb:b0:7b6:c597:fb51 with SMTP id af79cd13be357-7c039fa585bmr340530485a.3.1738842179041;
        Thu, 06 Feb 2025 03:42:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f84400sm87987366b.57.2025.02.06.03.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 03:42:58 -0800 (PST)
Message-ID: <ff574ebe-041b-44f0-8335-6bfa332d8077@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 12:42:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs615: Add clock nodes for
 multimedia clock
To: Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
 <20250119-qcs615-mm-v2-dt-nodes-v2-1-c46ab4080989@quicinc.com>
 <19a83d67-7e1a-495b-8dff-e1d2ba05b878@oss.qualcomm.com>
 <da980161-087b-4fd7-a1a9-56576b6dfff9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <da980161-087b-4fd7-a1a9-56576b6dfff9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nCqFUBMYmAgh4VvtD1RaXOf4LJKj1VRe
X-Proofpoint-GUID: nCqFUBMYmAgh4VvtD1RaXOf4LJKj1VRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060097

On 4.02.2025 6:33 PM, Taniya Das wrote:
> 
> 
> On 2/3/2025 7:44 PM, Konrad Dybcio wrote:
>> On 19.01.2025 1:00 PM, Taniya Das wrote:
>>> Add support for video, camera, display and gpu clock controller nodes
>>> for QCS615 platform.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 51 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index f4abfad474ea62dea13d05eb874530947e1e8d3e..9d537019437c5202c4d398eecd0ce2a991083175 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -3,7 +3,11 @@
>>>    * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>    */
>>>   +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
>>> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
>>>   #include <dt-bindings/clock/qcom,qcs615-gcc.h>
>>> +#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
>>> +#include <dt-bindings/clock/qcom,qcs615-videocc.h>
>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>>   #include <dt-bindings/dma/qcom-gpi.h>
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>> @@ -1418,6 +1422,18 @@ data-pins {
>>>               };
>>>           };
>>>   +        gpucc: clock-controller@5090000 {
>>> +            compatible = "qcom,qcs615-gpucc";
>>> +            reg = <0 0x05090000 0 0x9000>;
>>> +
>>> +            clocks = <&rpmhcc RPMH_CXO_CLK>,
>>> +                 <&gcc GPLL0>;
>>
>> This would normally be GCC_GPU_GPLL0_(DIV_)CLK_SRC, is this intentional?
>>
> 
> Yes, Konard, but on QCS615 GPLL0 is connected and not the GCC_GPU_GPLL0 sources.

It looks like you're right.. if I'm looking in the right place, the _GPU_ ones
are not connected anywhere..

It also seems like the reset state of the _GPU_ ones is OFF (as expected),
should we remove them from the GCC driver to reduce confusion?

Konrad
