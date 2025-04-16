Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876D213221
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819760; cv=none; b=dQO+uxch7u5ieUu2FJkrZK5iSzZ+SwXOeE7kd+oQOUbpQWy+VWkdpGJ/GGog+3nnA8drKH9jDMSNkP1OCUffC577f9LNTUdsZrmFP9MS/m3HwZ5I3v1ij4Cmfkbe4aTN1rogrGutsqGg5yRDn61dOWw2mOagjvfXXhf0pRY+CgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819760; c=relaxed/simple;
	bh=FwIeW4qgOB5haxONFHXw7a6R1kS+Pg8/36trjRhroCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q8Xb+1LkNrI+nRmYpwkpSP+JAT6hoCiU/uIX1xPDzHi4zudDx7760i7UKgzCG0gajQP6p/B7WLKcdev+rtuDDADDU1/Yrtdad6TYvvTrGfkQKygNW3I+0LSqcr8F5wfjz1HkWe7lWBVYYXMses6uaQPGSGQDtf5RPDChVI1i0J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmzkTcl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmzkTcl3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mjwI007820
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=; b=AmzkTcl3OozdoeXI
	QOXa/7IT9EFhYmScZ021lQK85PBqhd/1vF8wBbc/9HjrE1131NbqkhogJz5pWlce
	T4PoC4Wvfj/9JUB/KBOVG1CYWgl34wZOo1J4qIEJlME9TiUuzZz0F3lcDvAJR3X+
	5Zf9uCwfTBXVamSw9o6zEnV3uibaPIaF1nPaJ1lP79yQRNUUHcxmcKJX3kItSKvo
	sBxrhH0+QAW3OhNCw83pBVU/A5HFGu+SfGJRTledNqAQUWCP/VhKMXVeLnsBR+v5
	B1OUXkFys97L5RMOsRgWvyfNgFPNeONuCNVzs2z4m2/w8CSZFEOouSVyUxDCEKFA
	iQj6lg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6m53h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:09:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so167420585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819756; x=1745424556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=;
        b=Kjby5kYTkuLXJeOcg+6Tms14Q3P5FduH6YH5ZIJJ+7BtysUyWZs1KFZ06YxMxkboqV
         zhsEGPVMKLC6vRYIY/aU/ghX31bAKrB+VV9wUdBBEQf4U3+KvxESf8smXU02Cyex/WiK
         yknwp8nJJ6AXQnldSA7sAKcMCU9WC5OIdsE0O3PF3LWZJmUbRhapuVSVvbK/mYjsQYag
         lTtg1FEgt8QW5z4k1zBJxIkkWWItuE+00dmmqVW2PqrTsuaVmRyF7zffPWDEOXXvGs+R
         EHCHaZqMdEdhKcP0nDsDXauVOpr22OpYWg9LBUq+UF78BCpdPUM1lqbbqn6M0dJatYSo
         RmwA==
X-Forwarded-Encrypted: i=1; AJvYcCWqY5R0LCgAPtnEJ8AYNqvX1yQ0JccRpo97xH549riUI5CbqieAiKold9AQ0lszkf1D8/nP7KeNJJU0sgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DZFFewvY68dgICA5oCqLy0SdHSGb/gZDjfh4I2Df1RDXAX+C
	z5w/Z0wr4VYeLTxQILgZwFD2kIudt7Tk+52+BG7CEtBEkjPXaajGtPrT+Q8s2EbjjH01V8FcrZn
	hMfqlJn+ouPqVewh3b5V5q/lg9MzaYk9/h36xgkEUMpQqGa2MYqnKunK6ss75tug=
X-Gm-Gg: ASbGncuMFtxXZHixxSuUgSZT6iODoXqXSL8/BTLRB4FSh8qDNnkKEzNFGNkmjgtrNk7
	pAx5ZTFWu2lwZBuR70dZ6tNKzW1LZ0mu8bSqTJ7vBsMNfrHpbhPsm9jy/6UIYZjLe+kSbTW3+Li
	349ha8IbMjqY4W83DUn0Zh26unLCRo/MN77ljqxgj35v74PH31FUoRbLjyvRJafBxdaYGP3HDHi
	gYCYl6aFYgIcZLTRwHb/Kq3s5YIeHrHd8RpOkSxJFrtPFJzATdC4A8Y1cos97r95wLBQT53LcNs
	kYRhLMCAgDzQWglaSqlXQ5XuwGITmDL2NEZBjky5OxoTsv8rtLKqXVwk/kUgopdt9DM=
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1424036d6.2.1744819755813;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqTEn4ZwnP85Wl9OFLZVFMob3CDIEgC8OxR/srPtQNfxgXZMTXzLdDo2GRaFTa3vUSJvc1xg==
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1423916d6.2.1744819755308;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d127970sm153280866b.113.2025.04.16.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 09:09:14 -0700 (PDT)
Message-ID: <b6c941d3-85d4-45e8-ae69-9d9e4dab8440@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 18:09:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <6e98b5ca-3ff1-44c3-928f-e993cf29215f@oss.qualcomm.com>
 <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XXSucyMb1JyiOxyfNcg1F5KNWq9Dq4f2
X-Proofpoint-GUID: XXSucyMb1JyiOxyfNcg1F5KNWq9Dq4f2
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ffd62d cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=eWPriOLmkRKYu5JWBSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=941 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160132

On 4/16/25 5:29 PM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:14 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>>>   1 file changed, 187 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 3394ae2d1300..83640fef05d2 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -7,6 +7,7 @@
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>> @@ -3796,6 +3797,192 @@ videocc: clock-controller@abf0000 {
>>>               #power-domain-cells = <1>;
>>>           };
>>>   +        camss: isp@ac7a000 {
>>> +            compatible = "qcom,sa8775p-camss";
>>> +
>>> +            reg = <0x0 0xac7a000 0x0 0x0f01>,
>>> +                  <0x0 0xac7c000 0x0 0x0f01>,
>>> +                  <0x0 0xac84000 0x0 0x0f01>,
>>> +                  <0x0 0xac88000 0x0 0x0f01>,
>>> +                  <0x0 0xac8c000 0x0 0x0f01>,
>>> +                  <0x0 0xac90000 0x0 0x0f01>,
>>> +                  <0x0 0xac94000 0x0 0x0f01>,
>> These I think should begin 0x1000 earlier and as a result be 0x1000
> Hi Konrad,
> Thanks for your comments.
> First 0x1000 bytes of CSID are for secure usecase. Actually CSID register address space starts from
> 'TITAN_A_RT_1_CSID_WRAPPER_CLC_CSID0_HW_VERSION' which is 0xac7a000.

Alright, thanks

Konrad
