Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F329D19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622919; cv=none; b=Z6HO2A+mMZo5Nx3JxnkXeyAlaq0SCBQvcYCZ/UpEdSOcX8PSCb5+pzrnzaI49WY2IPMcORshWhLp6fUrGgR17Z3Uxuci4j1mAIvjjVm2xDhKKt6dVWfKTSSEqXjH6ueLGk6zjm2ZbqJMVyCFZtHMKTapHsZxGrALDb7Z4CMw7ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622919; c=relaxed/simple;
	bh=p+SXQbXpWY8nrFUTHgArld6DddwBE1LEIAWnhEzPGRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NojJra3M9aNKYnD50q8o/RoTFGooIFWqjOpyNm+ZopYEB53dRHN3oEj35cni2AIzzUQbWFElvDN3KviN9YOeBy+JdA88DyW1EvqsZRuMKfNF9LMk+AMZnfF84trTN96pV+E/kpbgDukV0+neu3IW81e17xzhT0v314FHzZM9CD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0kSTR02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0kSTR02"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qbU011413
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/tChIsO+AfaAF6VSG18Zad4p25Eyylh9VoM+tiR1XI=; b=o0kSTR02vhkBdUmU
	6YMvf7ddPQjws8Tdnq0BEf6/oU2rAw+jBAGWCSYj/jTfmmUAbxqOEgqFgTcOaDdE
	smGdD2PYh1trG/zOTVAMr1DtWaO1OeXF+UpF7rPhpI952f2WaDAUT8u9KlUejbC5
	8uYdDQtdvuwAXFS/FsSbKJNmZVbWKHZji+IXuGUVjRLmY5MMdmD0+66AHZwPBVdf
	XbqPBYDQ2vvVGaMty0598RfT3SWgJokRq6ZxJbhOE5Ed9H+O9+uJz3Xgb6O+Z2Us
	DtSyGqArq2J5yI+5X3ccPkWkfToG9c87gYMQpVx6JiSCUSltTp6vfgPEiOn1i4du
	EcKhVQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wc06w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:28:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8fae3e448so81514786d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622916; x=1745227716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/tChIsO+AfaAF6VSG18Zad4p25Eyylh9VoM+tiR1XI=;
        b=rA7OQ+BOv+LYlQJA4WYCeCf7IjI78qPUurLJKWGhP81B15Uu5QK/FzvNzlIGQmC0kg
         dCTs5losCML+d34R+64fyNj/caYQG8IcmV8QaAw2DraCgoKhGPictZEibvwsd5PMS+R2
         ZHdZySfk1BP9waLO4A/sjT6SEit6VyKgkK7uHymxFa9r6EdMliuXnuQrifsEADHggYhb
         uOckcw3od1Lam3+cV+2lK9XNcjeIivajNHzty/VurEqGiTplJMPcWT2dPQ4jjI8gKHEH
         z9P/LhAzLA4ijByR/cdYsEB7JS101qLOV0H25OCo9/mdwnUhhq+1AtP/uljBdYSuibDJ
         TqdA==
X-Forwarded-Encrypted: i=1; AJvYcCXWDo3em6pLm0WlJwllQzTjjbfpnFD6GKHKrde3tayVLgQiPzPuXXY5X0np69Sf/f4iQ/eZT4+WbOWUp2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGgxrWYT2Er5zgFcv1oqURHZbHI2nN0ip6/GSG368+FmOirh12
	pwVfZoRN/cXTDL+9hq+yTPg1An9ljqA3dLxmI3g9UiUdbUEMhmOK50ePsh5rCQgMSrtI5sfNlKR
	Zb1Vc8IyG0Azixfrnx48WzKrorNeM8+/jCNYfrDkdQMF6PMshARxua1c2TvzCeM0=
X-Gm-Gg: ASbGncuqCQ4hhFmbAZ/lCcBtxcUt0idXdSfaHMw8ijOtk0xwo4onASX18a7nXDtHz5Q
	R0tKr+k4nkvoPaqnvJyMUfPdowtvCP5Tv7OfDDpT1ELobHqBsJkJZH5byIYq599fVZ4iMQETYCe
	hHGhn3Qqe98/sxd39iikbyjTqZ4MSXJloRrND+txGWDGkhJ3lvDCKbXglmP/ab3uM6/VWh2hbk8
	PRl3ATgoEDg/sr+7rgzu3vIM+No7Wigf0T0Em1cpCMVGwlzG62LXr9x7/F7RAtdnjH/IRrPMnhz
	edUiqb9AkEhy/nIGJg4ZV4hn95WlcWTGVygIhAtuSouPk/jMoRYKnu1IvwVoNU9A/eNbBa2Tl4k
	v7jPTLSWITkqKRuZSqAPXgTHFpwFJ+7b5v4ipQUufP7sNb7rt8w0LTb59tqVk
X-Received: by 2002:a05:620a:2a07:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7c7af0cdb43mr1407179285a.14.1744622915943;
        Mon, 14 Apr 2025 02:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGrpwkmGI1qGb6G96gQavHJhSrEGo7mCvhfYx3430oMZu4pJJtylHsiSrBskfpxniPNKTuQ==
X-Received: by 2002:a05:620a:2a07:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7c7af0cdb43mr1407177485a.14.1744622915366;
        Mon, 14 Apr 2025 02:28:35 -0700 (PDT)
Received: from ?IPV6:2001:14bb:c3:3f5:600b:83a3:2692:ef99? (2001-14bb-c3-3f5-600b-83a3-2692-ef99.rev.dnainternet.fi. [2001:14bb:c3:3f5:600b:83a3:2692:ef99])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51e147sm1037886e87.226.2025.04.14.02.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:28:33 -0700 (PDT)
Message-ID: <7b664533-ca6c-4d4a-a793-0c3961724d09@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 12:28:31 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
To: neil.armstrong@linaro.org
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
 <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
 <f637965b-dff5-45d4-b6be-de8c68c6c397@linaro.org>
 <gkgd7gelin2hbkm2ltsifibxs6laluc66yx5k5uupfa2p4sswc@ypkyrj25njew>
 <d7241218-388a-4749-a4c7-fafd9b10f352@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <d7241218-388a-4749-a4c7-fafd9b10f352@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fcd544 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=GmHQQg_rlXLpeqUa9FIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: emt7nma6b6bZ-dQYuA9QA2q-jjVStbsy
X-Proofpoint-GUID: emt7nma6b6bZ-dQYuA9QA2q-jjVStbsy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140067

On 14/04/2025 12:07, Neil Armstrong wrote:
> On 14/04/2025 09:39, Dmitry Baryshkov wrote:
>> On Fri, Apr 11, 2025 at 10:14:02AM +0200, Neil Armstrong wrote:
>>> On 10/04/2025 21:44, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
>>>>> Re-organize the platform support core into a gen1 catalog C file
>>>>> declaring common platform structure and include platform headers
>>>>> containing platform specific entries and iris_platform_data
>>>>> structure.
>>>>>
>>>>> The goal is to share most of the structure while having
>>>>> clear and separate per-SoC catalog files.
>>>>>
>>>>> The organization is based on the current drm/msm dpu1 catalog
>>>>> entries.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>    drivers/media/platform/qcom/iris/Makefile          |  2 +-
>>>>>    .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++ 
>>>>> ++++++++++++++
>>>>>    ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 + 
>>>>> +-------------------
>>>>
>>>> I'd suggest _not_ to follow DPU here. I like the per-generation files,
>>>> but please consider keeping platform files as separate C files too.
>>>
>>> This would duplicate all tables, do we really want this ?
>>
>> No. Keep the tables that are shared in iris_catalog_gen1.c, keep
>> platform data in iris_catalog_sm8250.c and iris_catalog_sm8550.c (and
>> later iris_catalog_sm8650.c)
> 
> This won't work, we need ARRAY_SIZE() for most of the tables

I see. Can you do it other way around: export platform-specific data 
from the iris_catalog_sm8250.c and use it inside iris_catalog_gen1.c?

> 
> Neil
> 
>>
>>>
>>> I want just to add SM8650 support, not to entirely rework the
>>> whole iris driver.
>>>
>>> Neil
>>>
>>>>
>>>>>    3 files changed, 89 insertions(+), 76 deletions(-)
>>>>>
>>>>
>>>
>>
> 


-- 
With best wishes
Dmitry
