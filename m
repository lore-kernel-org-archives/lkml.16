Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C1D1AA1E0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326073; cv=none; b=D8eYQF4ry4v7TC8WqdEQntzrBV7wv8PtEtf6/JmDgA5n27Z7qFtmR/X6dvlVQdTa74sWrXocTab/oZ7TIiEyzG4sSpoQ/cTZ6GpIbj/+ApNBVAb5LfT9qlRcsDVeywP0AruEC6JoMBMgfDxI/QHAT+jrxNKSgfbeCQW1l2aTzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326073; c=relaxed/simple;
	bh=OdV5xtby0NaZtkm8ktq0lFOKdk3sTIFj5kO3sjL0nVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lctkRv9TR6jhXUODKMYy10/RPNyF3JAWvBoiJQYGPmhL95HrUo2ICeFQ90heXIa+aUZg2W+1cXSpC9ju1PEJc9ViywpuiuOwzkpqAf2iQf182r8eAc+uknlm5hZFCeD6R2mrhHb7gTiW+RJdVu8RgUNT3VBAjPmX99vN4gksvv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qzhs6woK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qzhs6woK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFGl0024687
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTTwAwIwQWjmD8gLCq4Q+1jUTZITLoJMG79zsA19CmE=; b=Qzhs6woKqgLcQM4F
	mo3bSRNGgibENom+M/j8TlDg+uKulhCrhAa71MSSZxBpQZUZ3z/0aLoT0kbfBtdf
	+lMZ8I+/nLGHa23jAiWkuyYhGHz9XXz4Aok5pddGEOoK1w+bhY5ltH6RPAH79Mqv
	NZB6EQ6QBKK+sGTuYkt/HOgG/2yHkFb/KyCJD3/UTwwSCKDaK7YKggtEO/e41tkZ
	ib+NahtjwEukfPr8GpHJ4BW0R1uqd6wS1PyjlXxLmP2f7TG80CNeEpU6JMu3mE4U
	wcKhdE54Sx2jUuWuWIkmsLeCc2u15HR6cV9/oosEbUMue8gpXr+rcVv9OoAmM++o
	c+xYKQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxv5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:21:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6e5d2f612so29314756d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747326070; x=1747930870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTTwAwIwQWjmD8gLCq4Q+1jUTZITLoJMG79zsA19CmE=;
        b=ZOVR7FxS6YTYS4egjya0h11Iq2Ag9IZVL8lmGpZsOzFZ+eIAyGtVXjGAv+1wYNb0D7
         ZFYsvoQj4rJHW8kCqLHE836Yn/O7o9HXVHYCUAYW7Qzyq0jnabqD/eom6LD1v7S8rkL0
         XzpNkFOoyCT55+mEquICJpUVVVjrm7rUF5aV4pjcwYayGxWT07VbuO28q7VhwzVsgPgi
         di6HX9iHCg7+CfDUxAuo1YMLSW0vxLXhkkxy41+Ee1kU/5KpU0424nsNdUo8TT61TQ+N
         Ggpb9apmywwK/vy0vwu6xwG5e6WWKTGdi3ZxCOL4cvhNigrtjPmxS/r05gnu7q8rLgW9
         LiOg==
X-Forwarded-Encrypted: i=1; AJvYcCVKCitHlQDDwIdsAIsjeucCYrTAzVl3ZEJScmlHVVh8O3oaGf2MtpAM7gs5q04bBk7TF4V+AdLvZzydBJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzMJ6CWA5Lb85rMyfvU9MrdNyQuTYpAsvHIk76AMAPHuwq31H
	rmgglZIm3b4Zfe/tYzezsmKxfeySO3GCi2skbQv06Bth6IN8Cp/u6YHnIVtn/DwTgIZRjIpdlSt
	0AoMxdu/bp+zHtTiyJLcYceeytdCTB3CW+d2YfDmN7EU0dNvxM6dgb2v+CcEIkPxCKVw=
X-Gm-Gg: ASbGnct9mnVTNBE6s9M8a3lng9TvR/w8XkxLQ+YCMstT5I1K25do9Y5RVnYCgPEH2xQ
	jFx8RjL+ylwNkMQTOso2CERJWN2k50IsvoHBr1W2GB4JnRIt/hRd9cGQ4vXWPzqlRfWSkpnAPWh
	1sliB7NGJpJc6RfrUWrxKgWYiPgbmiTS3s5LMh1CGuVa06f9mWAUoj7kobDieebYWfl3/4+8wkT
	OZ/W7+9edFWb0bRoQYzuj1kOPhwajG3YAwuavqoQsFxj3BQcaTovRD+KasizLjBSo8yq9uQ70+D
	33tMGJoewsuKM+v0ZpHKja0ClDVEnbhn907hxZpgWBcodqCrEwwFhpGu0ouTbAjgI7KjtBndhAf
	6gLzSGwX+UWnW1w==
X-Received: by 2002:a05:6214:2602:b0:6f4:c422:53e6 with SMTP id 6a1803df08f44-6f8b083535dmr5196746d6.1.1747326068402;
        Thu, 15 May 2025 09:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECqqbNfcUEPKfdTCgqfKl4Z0zZC1Q0WBDRWwk2WXOPhNGQkHsa6MQR6aSQ0s64MqRrX5qcBg==
X-Received: by 2002:a05:6214:2602:b0:6f4:c422:53e6 with SMTP id 6a1803df08f44-6f8b083535dmr5196206d6.1.1747326067958;
        Thu, 15 May 2025 09:21:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328042e18a4sm1346261fa.14.2025.05.15.09.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:21:07 -0700 (PDT)
Message-ID: <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
Date: Thu, 15 May 2025 19:21:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
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
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fIQP6QARrmoTWRBde7dIe9-S3WlRRxGO
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68261477 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GOhw9KrRKE3HJMKjvYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX9YBgvXB0TLwF
 qLnJ71mKDkYY5npRzV2jclDsHFLbL07hDb4qe/XmjjDG/yRUXvsuJ3vPK3ZQOhEexBjR5QexMox
 JEdHSLd/T+UDr8vDTnzWC5/H0eVfF6YVCTNwMUxSZ49AV9f6EfW/4ka/csnpe+1FCmsdoMgk49c
 Dr4KcCTJtnh11hlv52PueWLG6sf6/6Nx3wUstfYsX6BN/7A9ktaBcuLqAZEJPkDXSmvTGAYKoa/
 2HOYFg6tl+jNaSU4FI15TIRkZsMF05vSTp1eCtuVlzums2ZKDMmw6NhjQv0aAYB3cdYbiEKwiqy
 9UoAhyRL4fQmk9ON5FyapIZf254OyCEwVfCzBH0eayfSDReZVsupmbgrOr3r+9OgnFYNPDZSm41
 3uL9+tB2y9G9FbtepzfLkMyORm3LIuenyLbcTatessk8kmNFf/He2B6ujKWb43VR4bsLFXU1
X-Proofpoint-GUID: fIQP6QARrmoTWRBde7dIe9-S3WlRRxGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150162

On 15/05/2025 19:18, Konrad Dybcio wrote:
> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>> 1.0 encoder).
>>>>>
>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>> bits, as they weren't consumed on this platform).
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>> -    .ubwc_swizzle = 1,
>>>>> +    .ubwc_swizzle = 7,
>>>>>        .highest_bank_bit = 14,
>>>>>    };
>>>>
>>>> Add a comment and squash into the patch 1.
>>>
>>> I don't think that's a good idea, plus this series should be merged
>>> together anyway
>>
>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>
>> - MDSS: offset HBB by 13 (patch 2)
>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>> - get a handle (patch 4)
>> - resolve / simplify (patches 5-10, not squashed)
>> - fix sm6125 (patch 13)
>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
> 
> Does this bring any functional benefit? This series is unfun to remix

I know the pain.

The functional benefit is to have the WARN_ON and side-by-side 
comparison of common_ubwc_config vs computed ubwc_config for HBB and 
swizzle.

You can say that I dislike the idea of copying & modifying config as 
this is the code that we will drop later (hopefully).



-- 
With best wishes
Dmitry
