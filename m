Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D4135971
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331810; cv=none; b=fUs5x07gHRzG3KvgBSEXKN55vTN4vdOtli/lOUYMlxsN2hEt+AhOerGsnGLJeo6EaHnFE+CZY2wm05poBO5aQTnHC2pOYFnyaWRvzXRUdndB7FTZtoQXcmL4cZAlchJIqLnNuKIh9RgZ/joI1NYBHIVF2F/JmGd7IB1YTiTrWaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331810; c=relaxed/simple;
	bh=Z2zgZ20MbKzC8RsCCnFPqBCamGxGynTOl1qSbQCDhwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWi7i/zP8nNsA3+o+nFxoomy9edtlZUa4MT7JgS33W/LV+9ecPKOq4hSrisIZJa2Vke3qJuwo+DL6l7ttMGcNPIJ7DM2kAPwbHvpYrqkYMbyBbOzL3HS4UdBFR0mlxaDq6OKgSMOC5GanUx5IhufVltdRK4i53EWyMNmXKjJJmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HwMzc4Ld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HwMzc4Ld"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFUmS025636
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:56:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO7osz8wRUJZDY0Z+dnUrmrOR+9j3qqdgRHC4Q77+38=; b=HwMzc4LdGegn2rqq
	nkZVXl5aFZQ6ueCZuOzufVXlUV88Vm4mLCc3lMLzS2Sm7FVtd9L/YGtAjF5NQRDK
	Re3k9oE+Y9EvziJl84rb9/9JjOZOQ+eKYkQLuH0sh2wvJWbx4Mqwtsn441p5L44r
	RYOGwT+cYYUzpdk6EH+K4PLWtT/mnK0ZMNLDy6Xlf+/kAersK5fvZKDCdGFavROI
	9fmGBO9TVvBgFXEwNK3Elilq5IbQPpFP5JOK9hLa6r1QAWtgwXahsQdNbh34p5my
	WyV+pLY7nB67LaRYrMdTC2wjasqhpR9hve94u1QU5sq8GxsIQYN6fQgSh9VlowDE
	MMjvVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcny6tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:56:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5841ae28eso30662385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747331806; x=1747936606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nO7osz8wRUJZDY0Z+dnUrmrOR+9j3qqdgRHC4Q77+38=;
        b=sL/pgUrIQlVp9hSewpCa8mSa82/xCkGB4Uhp/vKbz9OgaiQWTYKtWq778n9ajj90Q4
         hwZ7oOfeJ56wA4Q/0ZtpP5bc0vqHD7FTreCKCLXYaTRZqFFpBKY9dT0YOsbmMR3fzhkV
         pnF7Rhukdn4DQ8Xy4Kn+9WJfCLpys2dBxf6uYxx0lc6c8PWyji33VHJZCPXPHEIFx3E4
         tAS7MISacjTum6wZTLbI8gDWMkBDDW+PvWlroX/7OlEbhmH7dTPZUl8OuueS5i+xp7sU
         uA8NFhYpj8JT3a6OkZMxmSvLbGfWsc6epJGkSQVc6PZjOYsoXMRgE9cOo2HqjKPtDC2v
         5m9g==
X-Forwarded-Encrypted: i=1; AJvYcCV2YfVw7xuJlL5XDgkgo2/dDXCwW9EunGQjbg1qVJ9DBe1cv5vT3SUyKy0BE7OHgqmK36dJ7A6Z4E4rfhE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8I8IguQ7MFDLNKZSUwrkzHod/QgMJrHHQpcYE6ygK8TvIhee7
	bMmuEKa3BbdZwyvmSKnl761OrLPDtSB0qw6XLWdzqSbZTUeSiovrOxNgqpCjEDIAyRTP+eie/Zb
	+/CbID8Ca3ELjoMFgDpVr6S2TliWl4px77l1uqpSjiy+Q5YxcNnSLMw7WWnaMCJdrjvo=
X-Gm-Gg: ASbGnctvYpsFeSzeBpylXWv8JUUDZlCIoBjfY8Z+0yBx+KCTQfHITITw5zWND3GAM9G
	FLHuhvwaK0FQZV0JkkiRWadehEFzJymu1E1IQDsJgGnlT+3u/9aO2Y0f0N65zLryjEeXgLuarO0
	KxBvgUaNQuwTZuyIh453qfCcIgVDcjBzA49Dd0bdgtFoyFzI2iwM8YFvPMjq3gtMrNXlfmcKKXZ
	GIg7X1p7M1xtmopF6utp09c/7H86uhrxoHgh9akDs0gAdfNT6bqC/6jPo+cAv8j2Yi7/bpgp3B1
	twikuRQAqR8l0Pg8mTI4DSFNqmidVWu7FJOxns0bbguQlRoAXJxkQt+BMCrpIy+zbw==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr25636785a.6.1747331806299;
        Thu, 15 May 2025 10:56:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3ibf+MjEukbdNgXoiuGdyW6XD2s0VHGguMOsCRyXNY9KKGsFmIMV8aCJE2HbDHDTsZjO7oQ==
X-Received: by 2002:a05:620a:628a:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7cd4672fd7bmr25635285a.6.1747331805816;
        Thu, 15 May 2025 10:56:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm22310566b.52.2025.05.15.10.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:56:45 -0700 (PDT)
Message-ID: <6d7b30b1-60ac-45bf-9ff8-72461f1b21c3@oss.qualcomm.com>
Date: Thu, 15 May 2025 19:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeWHMUf66Vb0XPw9eHRoAXzroSSqQRzW1o+e509-BK+Y7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OSWRKUwweh54TWZM9z9MP0T_40Q3QziX
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68262adf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=S0qm8UsrUeb_ptZHZhEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3NiBTYWx0ZWRfX3TeTfK8u7xd6
 WLEVSSgV+AJKqc3gWQrgVaOdY9/LwMNxtszuqdm2/dySKmWPGtwqIhe9jmQxKAIPWVBRp0AUlSr
 5fNochQFml8WmEPXbS4jn0Io20UDqc8BVnqTmJFp88VLYg8lfkP6S6ssElitC15cm8j815xPvgs
 QvRoTOL5aTLZBnmafkF1ClHOCvL7gleGAl2IA4i3056tZpjxvv5GIZmEFF12W7nVH7j/gMmvmc0
 SiPKnnWt6dsAJrXr7JsVCdMROLDddwmPNGkHqvMrveZwoktKjC1LuBIP5VitsRTgUxo5PVsm4fF
 l1vBA189VbUDiotFPFBMBHBr2vDjMuq9sYlMj3vxG6oCuKp7puuU5he59+f+pmmdjxA4Ke+Rfae
 x95PCxtD5FxdIgC1O60Yu93uqcOt1hqZ1c2MkaCAfOyhmt4vu6gUu/35afUZy7jF+/Ppp4Na
X-Proofpoint-GUID: OSWRKUwweh54TWZM9z9MP0T_40Q3QziX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150176

On 5/15/25 7:15 PM, Dmitry Baryshkov wrote:
> On Thu, 15 May 2025 at 19:36, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/15/25 6:21 PM, Dmitry Baryshkov wrote:
>>> On 15/05/2025 19:18, Konrad Dybcio wrote:
>>>> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>>>>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>>>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>>>>> 1.0 encoder).
>>>>>>>>
>>>>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>>>>> bits, as they weren't consumed on this platform).
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>>>>> -    .ubwc_swizzle = 1,
>>>>>>>> +    .ubwc_swizzle = 7,
>>>>>>>>        .highest_bank_bit = 14,
>>>>>>>>    };
>>>>>>>
>>>>>>> Add a comment and squash into the patch 1.
>>>>>>
>>>>>> I don't think that's a good idea, plus this series should be merged
>>>>>> together anyway
>>>>>
>>>>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>>>>
>>>>> - MDSS: offset HBB by 13 (patch 2)
>>>>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>>>>> - get a handle (patch 4)
>>>>> - resolve / simplify (patches 5-10, not squashed)
>>>>> - fix sm6125 (patch 13)
>>>>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>>>>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
>>>>
>>>> Does this bring any functional benefit? This series is unfun to remix
>>>
>>> I know the pain.
>>>
>>> The functional benefit is to have the WARN_ON and side-by-side comparison of common_ubwc_config vs computed ubwc_config for HBB and swizzle.
>>
>> HBB I agree, since we'll be outsourcing it to yet another driver, swizzle
>> should be good enough (tm) - I scanned through the values in the driver
>> and couldn't find anything wrong just by eye
> 
> Well. What is the ubwc_swizzle value used for SDM845? I think it
> should be 6 according to a6xx_gpu.c and 0 according to msm_mdss.c.
> Yes, higher bits are most likely ignored. Still, we'd better have one
> correct value.

Ehh, so laziness bites after all..

Unfortunately it seems like I don't have a good answer for you
- although I can infer a technically valid config for these
at the very least:

msm8937
msm8998
sc8180x
sdm670
sdm845
sm6150
sm7150
sm8150

with the ubwc1.0 platforms receiving all 3 levels and ubwc 2.0/
3.0 enabling 2/3

this however I'm not sure matches what downstream does..

Konrad
