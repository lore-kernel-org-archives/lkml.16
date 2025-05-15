Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE7229B17
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331911; cv=none; b=Iw53W9iPQcbAstN8viuvdaq+djJoT+UY6QShad8Ta1SiJgZLAVfrZ69TyM7/qJ/E9rJeDJEBHOOcO0YhhNhUWniSh9i7juC+dXZWkYVz8GPuH2FXc7u4z+MCgf42947RXN/anodBLwt2olLOM3u10ruEbaQeuVjEch8qX0Ng+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331911; c=relaxed/simple;
	bh=BySC4UMAcVIefF49MxKim22luf8rf78wLAPeEfsIQvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OfNf7Tarhdllvp6Jv2nm7dZbAKPfMWsvbeD4eUNphHqi9VzofV9JcY7TMORsyiNdxINLig3O3VF2B2M00IqmrHZ0Cp5ZJ3QtTgptGT7+ja94NTAIsZaxwYYABKBy/J0tokeZesa6KwE2MDmX2JKqRnahSgERjeN2lPRYrSNSz28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXMWZGNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXMWZGNP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFZUH031752
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vCMFGmwTleTheZqkW0G39yLmvjFdm3qxDc0K4mQmoM=; b=CXMWZGNPcwHSMZ9k
	ir4W8Ug9lzwxl9RFKmxDGQazm8ncyDNmQjalDV1gKzBY6YvWD3d5Zxs01JlBicLa
	e2S3oAI3fRZ2+eja+IBJICv5Dxt/AK+mfFGYGWiI1HsPUwQdNHy8xZuSsi/5GpS3
	FkoDD6DWna+tFXVHpvfvPrKw6y/wWM/4MPuc6E0wxUruBz9okLGZLh2RRF1goJ4K
	j8Od1KqlgdmSpWMs2HohNLzhcGTVF0wuTAZ5Ef8eyo4u0EFFkyardJDPX0smRiMd
	hCjJoOcL05fwUxDEqvTq29UjfVQHRgPl1UPB3al9BDCx7lKgIrL7uejs2dEQyurW
	gbrMCQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr70ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:58:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6e7c6a3fbso29600376d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331907; x=1747936707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vCMFGmwTleTheZqkW0G39yLmvjFdm3qxDc0K4mQmoM=;
        b=YUUN6S5rzDuy70v+7jlKS7stWmoNw6SSmvgURpQxX4fSzk0uOhM4wEEPXHUV1K0L7H
         +jGJ2Zfs8TepuPffkffMHxhSITDx+plkwEr99zhLZLJPI9t1ifdPZI4UrtWzGjDjUjxE
         2gBKZNvg6qLeKnN1oztyF2zkqPx0tkX7QE6caVhHbFs6M5O1yy+Ar7R1LYbdDcbelQ77
         5Tjig2sXjM+BUiZzi05wyfzrjJpl3cOBJr+X/nV97S3BLVzCg081fXDXFzKq/4r4xZAc
         YKUL26UQbNhGIn58cSUI+SVMztA7Iqum7rEIQqaedwS/jz1KcZ46QRwsSlALaLMc9K6Q
         /T5A==
X-Forwarded-Encrypted: i=1; AJvYcCXuKaSsu8puZjClsk3gT4cZaoeJflAPPEFM1uxjG1h1QPxK5txj9Vji9p4tO0t6UUQraRSk44oc4LCq/WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YziPjLyi4lSUktnvEuhCs56iUX/C9BYZEvDQBq792TyxN+2MZqg
	DVl8jhKVlNcZNobswXAmf/1QQG4Rzv1niX40Zwfy8dHPp9WmGD9HwlkPkEPs8TZcmgX2iQdCAAL
	IaA8oEvW/tv9nMdAbjQCYtXVM+B9k2pFCP1RlihE53UYAZDTZo1It7QpA6lRapMm8Ipw=
X-Gm-Gg: ASbGncu0MMAUxOPiRDTNeovTFyEp0hCdjza8IAjG6ejiQf7t8V3jS6fbWgY4HXWj04B
	OvmyVwW9JNX4nGr5ywG/2Qwrs94zgaAkeV1G72wi/+TAHZ7HhZzXg/Tow1fvGtADyOhvr1s+s0v
	jzJlyJc28yrogOXFpeEZvG0an5ywKaWDZo3VxcgBoLZ2MOWKUQnSGSXZIefybZx9gPgStsXh2yb
	z7MPju/XYf37QzaBQNoS2FkWjFPanut8z5OIYIie6lQHDXmvHv1WV+7ow3mTP/Shjp1dS2zarBr
	zPKL+1p8iRfGj44GbjSengUfg9GtY0iMzQAug2o7TpKXO9PuYA6kFZSz5fvhibvFmL6P5InHH0Y
	bA4+M1bWWFZOh/Q==
X-Received: by 2002:a05:6214:f23:b0:6f8:aa6f:438b with SMTP id 6a1803df08f44-6f8b08352f5mr12431916d6.3.1747331907587;
        Thu, 15 May 2025 10:58:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3V9qZSnGxsnRyLDYMo3pHnOqJ9QpCV03/pBIinMn3/xs6ruVL1Dp6RhU3IOueCwwwetRN/Q==
X-Received: by 2002:a05:6214:f23:b0:6f8:aa6f:438b with SMTP id 6a1803df08f44-6f8b08352f5mr12431416d6.3.1747331906935;
        Thu, 15 May 2025 10:58:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018073sm44037e87.129.2025.05.15.10.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:58:26 -0700 (PDT)
Message-ID: <73b8087a-6bf2-4f59-a9df-2a439a04fe1c@oss.qualcomm.com>
Date: Thu, 15 May 2025 20:58:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
 <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
 <d0a036e7-605b-4475-8ddc-69482e16f0b3@oss.qualcomm.com>
 <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
 <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kjKJLyLDFr1JONroUvFNE8xJ2Cz0NUd7
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=68262b44 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PtrESY3dGf2tItbbhh4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: kjKJLyLDFr1JONroUvFNE8xJ2Cz0NUd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3NiBTYWx0ZWRfX4Z9nHWJQvokf
 UVTsvpSmXUdC7tXQFPoXKzCxyad9seK1VlXCwdpPn1P3CNdYiPPOuJ5LRLfRV5KEyYfpXp/mu/y
 vBIlT0oHJz6tBnod75UHKzA1MnlkfAsMrTuZgh//C7ivXlad1krAm7ZUAY3LDCcaz7k3BdKgTbh
 Ua+vgYjPTICTVSsjYHqLGRYZHMaxbYVp/MVoaemRxYRV+l1RcaWLmJTElAyXLoq7zcCToJhymI3
 qfAU5vVf1luOCK6ClPBC/QlNIWW8B0ME3l9FcvRQVGeOGb7b0bQcxgoVWMnBxRFUDfAimiM4n8L
 d4M+URIV1eCxwZEw7KqutbA0N1khoDig/kt+grJo3cILadoDnDZsHmqcZ9amIoSIpuWkhAmvId3
 y8MDvLpuRem2uFG4kMgorbmwSczs+iGFeVzK7uy0ZpLY2APMznVEmLT0KWV29x2RR4DEl50v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150176

On 15/05/2025 20:56, Konrad Dybcio wrote:
> On 5/15/25 7:15 PM, Dmitry Baryshkov wrote:
>> On Thu, 15 May 2025 at 19:36, Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
>>>> On 15/05/2025 19:18, Konrad Dybcio wrote:
>>>>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>>>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>>>>> 1.0 encoder).
>>>>>>>>>
>>>>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>>>>> bits, as they weren't consumed on this platform).
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>     drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>>>>     static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>>>>         .ubwc_enc_version = UBWC_1_0,
>>>>>>>>>         .ubwc_dec_version = UBWC_3_0,
>>>>>>>>> -    .ubwc_swizzle = 1,
>>>>>>>>> +    .ubwc_swizzle = 7,
>>>>>>>>>         .highest_bank_bit = 14,
>>>>>>>>>     };
>>>>>>>>
>>>>>>>> Add a comment and squash into the patch 1.
>>>>>>>
>>>>>>> I don't think that's a good idea, plus this series should be merged
>>>>>>> together anyway
>>>>>>
>>>>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>>>>
>>>>>> - MDSS: offset HBB by 13 (patch 2)
>>>>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>>>>> - get a handle (patch 4)
>>>>>> - resolve / simplify (patches 5-10, not squashed)
>>>>>> - fix sm6125 (patch 13)
>>>>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>>>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>>>>
>>>>> Does this bring any functional benefit? This series is unfun to remix
>>>>
>>>> I know the pain.
>>>>
>>>> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>>>
>>> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
>>> should be good enough (tm) - I scanned through the values in the driver
>>> and couldn't find anything wrong just by eye
>>
>> Well. What is the ubwc_swizzle value used for SDM845? I think it
>> should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
>> Yes, higher bits are most likely ignored. Still, we'd better have one
>> correct value.
> 
> Ehh, so laziness bites after all..
> 
> Unfortunately it seems like I don't have a good answer for you
> - although I can infer a technically valid config for these
> at the very least:
> 
> msm8937
> msm8998
> sc8180x
> sdm670
> sdm845
> sm6150
> sm7150
> sm8150

WARN_ON would be a good thing in the end

> 
> with the ubwc1.0 platforms receiving all 3 levels and ubwc 2.0/
> 3.0 enabling 2/3
> 
> this however I'm not sure matches what downstream does..

Well, let's match previous GPU config, so 6 whenever we don't define 
anything special.

> 
> Konrad


-- 
With best wishes
Dmitry
