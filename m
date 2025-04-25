Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDEE2D78A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609174; cv=none; b=tAiKGBHw5WyNGRkqKiw+PruDbNU5fFYJfialXWkAww5zMcHPn/R6F6BWW/0zk1Tgl6aFYITpPI6U4EdodUrLIAvdSq8RKP/xH++Ng4r4KtUkFYTiM0TQUnSkQWchgFoC5mxyBnqdbqMqxH19NmhOp4zEfHatPaKiUADfdKIrtAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609174; c=relaxed/simple;
	bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwK7ZBVH763QHZAV2WHxqHejYfYjVSuL2oX36O8a45fEdD4gCY+UCnahqhKUfbR52R2WmtsFm7sAjiINbaJ6rJxpMEGwS569yDWS0eb76xxNt+9BHj6ESTxI/TFXR5vtASz1yZRhj2LOZzoAuRTzhVpVv8IlJ5kBR9UJc/b0H6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D4RMZY/Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4RMZY/Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtP6001323
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=; b=D4RMZY/YHGrtcRQw
	lVQYHp18r3mZtZ9ZsHHzxGCjgDID+iqFkDbxU4b+CzOWpSPob5qovR9UtF2y7i04
	Q9TyAar5JYujyG1OjGF0BmcsCIL2fQb0lY2c6ingVPmIh1p1CWFFVK7UuplXnaX9
	cbAbCc1ysortnRatYOjDgV4WedQXvO4/8SVgtuaviiWgw+VYspu3a7MYpDky3jKG
	MubdZPAed2QbA/CzjjVmfbfKOfTHHL75UC+ZznfpyoYZqoNunvuf8rJIezSTMtqB
	ke0u5kwSASdhQK7+3c2IforuyCKPF35xaWS7UECVzKKBxIliPe9HkLjWMHOLdsU1
	wFD1sA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j49x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:26:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47aeab7b918so5954401cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609170; x=1746213970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
        b=d0wNxi6g9R2jTwF2Nm1YuEtCT1YFXVg8C7J7AlP4ddg4zeExFRgXe7WI+6m8oLekzt
         FNP+z8sUvdi8qHMT82KwSRiemecLvVaHceT1NL1VWGtMXhoB7Ihrn5oeNZX97XiE6EGP
         kn5+BJ8K2zjEVZ9G1Mk+/+V66k5mjL8BLcf/fF1+mtQBtq6ONn5z3v4NzSpm5fXykEUO
         NzV0XKVtYMIKWOv69ScvKJeK6KyOLUaoBGPsE8A1HFtN7UEbfHoM7udTgtGccof8wdzO
         5JMiL+crVAUVJWEMkXy5jkdxLGvCzh1dRoEotHM1DWGr4Y7e8q/1QACmJhC8ewT8X/g0
         POPg==
X-Forwarded-Encrypted: i=1; AJvYcCVdWOdhfnnh01K42HF2jpRnSR2XOBheT5JCiy20PoTmvQ75pkOPssI06K29mVeSOmSWwMrGZDt55BjrMtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+NyiIxU9hzAZxkaEZHM59TOttnKIciVVdpXgcxU3y46tpw+e
	qV9hdydaQOztUQXVxQ0efbIF2Y7JB0+ui0IjO1khNfwT7Z3fv4utOVrPMZXNXXkC467k0G1Mdsq
	7NgeqUyQ+H8SKqcvXio8kM8sSjecdWxxDXGqJvoQlk2+YTnj/fkvzAQ4mYPeAV/c=
X-Gm-Gg: ASbGncvgrVxGv9b1HNNV40puv2R/AUH95jLYN35RRdO+MV0IR58GDITWQDLGUPTPtat
	WXRLdcXTOhDCraMjpP9g1433t6g6oVjWqDLf6/AAAIeelMxJAtmVtmGX/wZCmP3xiQVcRTmPsgS
	zDb3l5iWVKuSQD65lme5GgdPElsHX1uh9kSNA6LjMH7mSa8QmDicOK97xt9D5s4zkoVBLfFt/4/
	xwI8NUcA1mV7urgiLneLeBwXm6YTWZBGm7SkIQntSo0hK1fYcGsfQa6hQxjFtO0ZX7lczT4xVe2
	fssQ+v3G5WtLzVBgC31zGLVN5c1FeNf/U9SX8+4O0yTJeSVZ6T+V3gVgn+g7WE10SD8=
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-4801e0172e5mr21297921cf.10.1745609169935;
        Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2r9L2pHOoYHGaxcw9IGqNIifgrl5bAlz4s9wksJ/7yXxAXtbVK+GxNShhVnzb9jvGPXJzw==
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id d75a77b69052e-4801e0172e5mr21297581cf.10.1745609169507;
        Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf7397sm180940066b.92.2025.04.25.12.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:26:08 -0700 (PDT)
Message-ID: <68e2c0ee-d5e2-40fd-9ca0-262ed3270628@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:26:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski
 <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
 <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfXzTZpVEb38mmZ q7HcovYgtNhe/ot1Xt/NNvhGHJITQjPicuv5k3bJH491aH7Ya8YWgUdl26e5xExds9vINEEQ037 xrgDI139Wjm0uP4d7gYW07KB1oJICODSwNtjOdS4JYk9Pqjiw17D0ZW/FvFVK3hj/wvAu2tBq53
 AhIWnFD3+817fpeLmyhY2ETySp8dv+GOkmMWoBzY+R6Mr9ZI4Rd76xbstHkPWx6J/2WFXz99C/I 1dkzVOrcc8mw22ASvK49+tT7fWisGaHmKV9WyAGhjaV69i8NTxMKHPFiICMIEWaXOIKNJ3QWg2F IuQEcuFN34CsdfiQnqtSqLfDTnvDm3IA7N7lLYHQ/QPW7LoMKef9h7gMlEAd2GxUdp3YtHZYIOn
 I0WH+q7xncjsdnSS7aY2VdaCg96jglTSc4pflyRZ8/kdHubdz9DjvBnITkRaCnjk0PYbViAH
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680be1d3 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=uxr0c4oy3NFgYiDcH2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: QTmfD1-2ygjCBLWmwJgPy101GWfsbZ_9
X-Proofpoint-GUID: QTmfD1-2ygjCBLWmwJgPy101GWfsbZ_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139

On 4/25/25 5:13 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-25 11:57, Konrad Dybcio wrote:
>> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>>> From: Dang Huynh <danct12@riseup.net>
>>>>>
>>>>> Add initial support for MSM8937 SoC.
>>>>>
>>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>
>> [...]
>>
>>>>> +            gpu_opp_table: opp-table {
>>>>> +                compatible = "operating-points-v2";
>>>>> +
>>>>> +                opp-19200000 {
>>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>>> +                    opp-supported-hw = <0xff>;
>>>>
>>>> The comment from the previous revision still stands
>>> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.
>>
>> Right, I have a series pending to improve this situation a bit..
>>
>> In the meantime, you should be able to define the nvmem cell and
>> fill in meaningful values for this platform
> As I wrote in the previous revision there is no nvmem for GPU on msm8937 only on msm8940.

This seems not to be the case

https://github.com/penglezos/android_kernel_xiaomi_msm8953/blob/pie/arch/arm/boot/dts/qcom/msm8937.dtsi#L2046-L2191

Konrad

