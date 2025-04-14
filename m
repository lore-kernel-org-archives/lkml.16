Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8EB262801
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624430; cv=none; b=hL0kJkCMOwNVSF9+pK5LbAYiFde8mahdR9hfqdGXHbnPO+74jVm+XHaQohMHEL5BGXuElnKKH7lnHuccBfBJBtjAf/E7cIf6uUqcMJadqqV29lpGoejsDkwBdDA24kQ8UFU7B0BlZ7wcbJ5NsluNxe7N1ZFJartmr4b8Up1ZQdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624430; c=relaxed/simple;
	bh=fE+JE5cENnrFnAtimgq9nSWmgLL8B8MGJLAmn4zv+vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rflvB26SO4EecOmMXGFq5HGu8ZYLdEKDomOt1j/GqCiuKKcNK3UoTZSbyfW2XttOtMxEQAQ7Ubs5xhN4vVAEMuDtA7CucYvrLNc5LJJKEI3I+2mDmWaq1xa1F0wuPdHys3Iq48ZSqaK3kx1taRml5KiUwcPdriYcmYK+AK/wsFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYG2sVfB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYG2sVfB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99o8m031346
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EdclKkXxFTt0I2OWvs6ezf5xV8oX2spytT768VYcNQo=; b=UYG2sVfBCarTcUZ4
	Eau8ZJPh1ckqR0jc8pUV/a17Pw4W/yl5434cRscP+fR8qBEYQ31C8hPMaenrWdqA
	DCCex1srCikdUyb0+VT1Yymz8pAwWoQ9Hcrst+3EsjsdKwJqj92swyTFWd74xDox
	5LubjTS27sBK1zuOJRQyK9mduRuJObMIEHU4Tho2DT3VBI/ACryRgUP136AZNzlP
	UpJ/gVUGMD5Wz4v3GNDJQGQtH8K3ioxwkTfhJ1TQxDhonRnS4Q8b8bZQS2OayyH1
	nHKntVEOgCfbldqpfcPGGAYlIBB+LobUB8Mgy517LUbFeGW5HZiv2q/Q7KQZtMiO
	LCgg+Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjv0t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:53:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso9156176d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744624426; x=1745229226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdclKkXxFTt0I2OWvs6ezf5xV8oX2spytT768VYcNQo=;
        b=qYefZHQ14TdDOI8P3h39wSvRBt4POG//UPK71WpFsSgGGkRQfeMXuEiSyLjDgo6FY+
         F5aIt/CA+QsIcOuzhFxBBDe4ToR6i4l9Mmz94EgiKbTyALirxo7pLV3Cy3ZL48qJ7x3c
         nqxtdPtDhGFdWG6Ei9lvecEFvBHfAz30YlceMvn3dB3XSBkrDhcNldiD8xTGqfMyhu5o
         cqVuun356tDPUK2tn5w3mfxUfDB/Mp4k5JjXVaC+ySdBvRgQHTA9PJ9LJJQa/O48qyAr
         Bx+LiiE1jmdL0+QFHTVhv4ElkpeFZV8W0iv5GvldjrGpzlfUDcG+KRbGIvDtJnQwUTyg
         wJTw==
X-Forwarded-Encrypted: i=1; AJvYcCXbZUZ24pXRja8PZLTDwIC5wK45TCqb23VB5AAiMiISr6TvmBh5/ZJqexIvzfyUKpHQHp8aWUbx/9zn37w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtA+7xdbgEGqvMD5tFWbyW4FHzouYfWKxpkqpIeyw4YqaUJrc6
	KLO8BR3r9vu6YSJrZqmig25xgktqz8ftNm+kJPUaH+m3z4Q1CV8kHLaa6Dtia+lMzg8UbxjP1gK
	U71XMiqXZQvo00OgaPugRZB40K7plNBi3BiOUlqQKJ+DRfD9RmQwseuMLw/LMoc0=
X-Gm-Gg: ASbGncsBUx8/sKrZHnMrbHOxofsWtBN0sUvCQChYeKZXthobQ3/JCL33LXG6jHDAhwc
	8lNLhfh4d1AnfGoaucdjpmCG8JH3K/r5OTQqrSELj+UETKd5fOMM3H3ZAMPl6QHfctRHxi+QROO
	Fim2K/sn88AdEqo9CtN7gqn/ONYyNgcF8A+k2YNTfaGSWvpta53t+oe5cGaf3r1alzG+jm8or/5
	xs7dLrw3Pdyb2vG32BtQ9wW9iw79TNyIn7R6hrAuDA2x3//Qe3N/qgwqXr8kd/Le1DtML7esUh/
	JlUUgre4nVl6/9oX3g3VyJmXAZqbkwd66nBvhC+IKIG17pDgadl58GXxX3H8Lhm2/w==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr552036785a.7.1744624426100;
        Mon, 14 Apr 2025 02:53:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoXdqkcpaAerObGEK8HRnwc8WmDaStUQwIiHR1xvbhIiHbRhcZx7+Jtthf6NJhgUhOWtDZ6w==
X-Received: by 2002:a05:620a:424f:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7c7af113653mr552035685a.7.1744624425611;
        Mon, 14 Apr 2025 02:53:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3513sm890098866b.11.2025.04.14.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:53:45 -0700 (PDT)
Message-ID: <2b889254-2847-4c6b-a01d-3626332dcb0a@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Enable TSENS support for QCS615
 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <cover.1744292503.git.quic_gkohli@quicinc.com>
 <76e0ce0e312f691abae7ce0fd422f73306166926.1744292503.git.quic_gkohli@quicinc.com>
 <7f893243-572b-4e23-8f2b-ae364d154107@oss.qualcomm.com>
 <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46cd600e-b388-4225-a839-a6af76524efe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcdb2b cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PLlEqiOu4NsstTQGM3oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bshKo1G6L2Z1NE2kCs2sg-N9QXSlkHbd
X-Proofpoint-ORIG-GUID: bshKo1G6L2Z1NE2kCs2sg-N9QXSlkHbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140071

On 4/14/25 10:28 AM, Gaurav Kohli wrote:
> thanks for review!
> 
> On 4/12/2025 5:13 AM, Konrad Dybcio wrote:
>> On 4/10/25 4:00 PM, Gaurav Kohli wrote:
>>> Add TSENS and thermal devicetree node for QCS615 SoC.
>>>
>>> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
>>> ---
>>
>> subject: "arm64: dts: qcom: qcs615: ..">  arch/arm64/boot/dts/qcom/qcs615.dtsi | 281 +++++++++++++++++++++++++++
>>>   1 file changed, 281 insertions(+)
>>>
> will fix this.
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index edfb796d8dd3..f0d8aed7da29 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -3668,6 +3668,17 @@ usb_2_dwc3: usb@a800000 {
>>>                   maximum-speed = "high-speed";
>>>               };
>>>           };
>>> +
>>> +        tsens0: tsens@c222000 {
>>> +            compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
>>> +            reg = <0x0 0xc263000 0x0 0x1ff>,
>>> +                <0x0 0xc222000 0x0 0x8>;
>> Pad the address part to 8 hex digits with leading zeroes> +            interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>>
>> &pdc 26
>>
>>> +                    <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
>>
>> &pdc 28
> we don't want to mark this as wake up capable, so using this approach.

Why not?

>>> +
>>> +        cpuss-0-thermal {
>>> +            thermal-sensors = <&tsens0 1>;
>>> +
>>> +            trips {
>>> +
>>> +                trip-point0 {
>>> +                    temperature = <115000>;
>>> +                    hysteresis = <5000>;
>>> +                    type = "passive";
>>> +                };
>>> +
>>> +                trip-point1 {
>>> +                    temperature = <118000>;
>>> +                    hysteresis = <5000>;
>>> +                    type = "passive";
>>> +                };
>>
>> Please drop the passive trip point for the *CPU* tzones, see
>>
> 
> we are using trip-point 0 for cpu idle injection mitigation which i will add in subsequent patches, if you are fine i will add cpu idle injection cooling map in this series only ?

The folks working on qcs9xxx have made this point too, but I'm lukewarm
on duplicating meaningless dt description everywhere. I've asked them to
conduct some measurements on whether random default settings (that would
be preset in the driver and require no additional dt fluff) show any
significant difference - if not, we can save up on boilerplate.

So let's wait to hear back from them on this.

>> commit 06eadce936971dd11279e53b6dfb151804137836
>> ("arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU")
>>
>> and add a single critical point instead, see
>>
> As critical shutdown is already supported by hardware, so we are not defining here.

The hardware critical shutdown will literally pull the plug out with the OS
having no chance to sync the filesystem etc.

Please define one that's like 5 degC below the hardware limit, so that the
operating system can try to take some steps to avoid data loss

Konrad
