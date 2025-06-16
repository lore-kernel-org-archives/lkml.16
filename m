Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13591E5B69
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066174; cv=none; b=KED7Qo36EXBLR5pJ0XdcrKjP9Er83nyZZOp08vCuWr8KqIniMfG7HIydbdZ1l8b7DDa6atLimWc7mPUIpblqseHvugyljgkeNan105XcLHl34LuLSvFRVHpTJk3Zz6rhoObW4Vd+akzesrex26PCX+JnCHM1VH/LvoDLHW3y6No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066174; c=relaxed/simple;
	bh=y4Bez+SzF4gjaMsLLDH7zveHRGwHpVNi0bnLbVkNFlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjSPZ3q6WLpWwhJm1XvcWbaCnLWtLIqMONsYy3KW0wJvh7/ywyY71KsgJ51ZuPY9/WrIVtGbBi1BPUWNlU4QUIsrl+C7UxPipbCSLp2PqfjC36qNnIRmTn4bescr1iCwW4laY2uw0Sk5Ib/28zsYEB8sMKB0hg7lN4uxb7cA7As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuFSwdep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuFSwdep"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8kegD002743
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyMuhoSMhWise6f0DE4q8u4a+CVo9/qSkPnVgBek2l0=; b=AuFSwdepGzor/9XV
	LpBiNvGenqsuJRj0XhD9bmJJ/zc9OwF9LUDynEbwsyoSGNJ06zbKcg7H6YCLvodQ
	MbfDQeyAJkg/SdRmGN6Y8EmaG5+U+jpvRYoSS43kpj73Fa3vOox+Fd1nZhF+HDxR
	BjGRuBRt1YOtzhhZaOVQPE/hC52OJKGXg8rjvNLVr2ydycCoaACPPEMThsOc37Gt
	D4z6t9tnhMyJ/Fn6SLuokajxc/s9rWrSzi0iuElGiNX8VTOCBF/JeB3b13iQuLSF
	hZw7oZc45tsm9u4KRhM9gvyMNnckxTQfuPDRjdpGLjY/wPo17o6oZk+uL6U3F3yi
	UOsZ+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag23041y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31366819969so3749337a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066170; x=1750670970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyMuhoSMhWise6f0DE4q8u4a+CVo9/qSkPnVgBek2l0=;
        b=CdSNnBfU2rgHPfZs8ps/cWU2Xx+hTevZX9IZMBEtzI67n9v2SJIpFQb1EKEEvTm4zj
         GtTyZIJ0MpE7wtKYvM6zyZ3ICwPjMSqJorCLYNAajYPmxYIDAk1FFWayadQqCqw5e2SH
         mO/Uz4YRGRHz+2ONN6tWobDeS68/t082mIUWS4KMv3fOh4yoCqwhpvbgcX0pK7iTQxNT
         uZkMGtIe46SG0FQ8CQzBFPZbsMAhN6YFOozerCv2KUC/5ExeNmgw5ORuCOZCP1tlAK88
         YRTxw5sBrBehJa69WX0t2r32wz2cX7tNviNDhBhn/murKq9w3UmOXz7Cm4lS96gcTGuP
         Y4NA==
X-Forwarded-Encrypted: i=1; AJvYcCXW0PA0k6s0qv4oNorfafIxqfJpx+ZhK7+VsqwTnv/sfyT93/2OU02MVVdrKAx8MKopeNR6KME2I+qG2sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCT65htZOwFpxu7Uri6ycOSgm8LKpS74MZ75cz96WTUpUTl7Tp
	hf+K9b2Qx6ENj8QzSa3h3saKRE7VZe+yJ2dPhbjxkKyO4NSW+o/eIVaHw1lTsoC2JKpm2gaDPw1
	3i72KD8qO1EStXkefMhCfJ1xKijHvIAd5Nf2v7kfS5jV6JCbhCaxH1oSdlt59+sySsik=
X-Gm-Gg: ASbGnct0MNE/4V2AthlIgc+sGpHRpJsoohVVPvZGMKf88Py50vACAXHKoB/HVBKm47r
	5llv5xmf7UdguXOTDDB4/jGv60H3pBW74QKJfIPRQu759skYWVd9qW/4gWJcn77+MR4I00oALbp
	3I0r5Vbwq8HqwnLyo/puziydo93RF7KaY9XXW2V6t9bReNKBri7epxHtVDSTB5DZNRSXSdwVl+T
	HFOh/SZe+7uVrWRkjbWYM1fNN/NjoNB2Ij6LTgGtVtbLIOZVF6XGdZSxR/NQ9RqOsDx+evpSesv
	madiBPSNb41nAOi1bJJU3oPxRikULgwXgNWXlROWx+w+pvrSIGw=
X-Received: by 2002:a17:90b:2b45:b0:313:b1a:3939 with SMTP id 98e67ed59e1d1-313f1cdaa59mr15010971a91.15.1750066170260;
        Mon, 16 Jun 2025 02:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsUd2qFGuMXKuccZvrFk7CIMKUwpb0xUUFf9RE6u/Crka9A/TnucG3IcOlzpJlwgNnMDfteA==
X-Received: by 2002:a17:90b:2b45:b0:313:b1a:3939 with SMTP id 98e67ed59e1d1-313f1cdaa59mr15010915a91.15.1750066169791;
        Mon, 16 Jun 2025 02:29:29 -0700 (PDT)
Received: from [10.152.204.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b6d56bsm9195325a91.46.2025.06.16.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 02:29:29 -0700 (PDT)
Message-ID: <63c2c889-0a09-4b25-a1d2-2aaa92d75d9f@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 14:59:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: fix dest ring-buffer corruption
To: Baochen Qiang <quic_bqiang@quicinc.com>, Johan Hovold <johan@kernel.org>,
        P Praneesh <quic_ppranees@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Remi Pommarel <repk@triplefau.lt>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250604144509.28374-1-johan+linaro@kernel.org>
 <20250604144509.28374-2-johan+linaro@kernel.org>
 <6f3eb9fa-617e-4434-8fc4-33dd92c4bdd2@quicinc.com>
 <aEFqsghEuJc3xxlU@hovoldconsulting.com>
 <ed06d62a-4b98-443a-a2ed-c92058bb521a@quicinc.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <ed06d62a-4b98-443a-a2ed-c92058bb521a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -cYTeYez2zLyHd4aG4TBMTFPka7sHZ3H
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=684fe3fb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Ske-G14cY86dgNt0HIsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2MSBTYWx0ZWRfXzMa93+AFw/pc
 TYjHDa0x9sc4P4D79YQTgdk8MsZ9gcpdP2rs+I+kAqSQi7kih681U9UE0FuXB6IuBrnOu46z89d
 yzrT7PmybXVahJoAFF4Ly9ju0/ShVnGsl3+im5wHhUK6pXrsOc8WFDd680zm3jX1X+dV7O26WcN
 zmF0HF8zqKO80hrR1xenU9Hq42ZA0K3VLDyLvszmMl0O7l0glt+cmQ7evFMRmTz6nrcDRlKd3dV
 FNUcJRu9B7abgK/kICxl0d9LxU2Lxoq/gigrTnZ8tP9+TfWJD1SPHiUYQPltEojvGsTT8B4r6Ik
 Kxpd7C1ZLISqBz+/HniJL2C9r8TZGjmIckifxDqvkS0ndmFXJN2WDlfBU3Aiux5JPTwD3JMSEWj
 WbCR5uC5l9S9oP3J5EQYCedFrptEqy+7/AerpuUyPO8Lmwte57fkpjdVtgVdmlO9eqxJsLok
X-Proofpoint-GUID: -cYTeYez2zLyHd4aG4TBMTFPka7sHZ3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160061


On 6/5/2025 4:19 PM, Baochen Qiang wrote:
>
> On 6/5/2025 6:00 PM, Johan Hovold wrote:
>> On Thu, Jun 05, 2025 at 04:41:32PM +0800, Baochen Qiang wrote:
>>> On 6/4/2025 10:45 PM, Johan Hovold wrote:
>>>> Add the missing memory barrier to make sure that destination ring
>>>> descriptors are read after the head pointers to avoid using stale data
>>>> on weakly ordered architectures like aarch64.
>>>>
>>>> The barrier is added to the ath12k_hal_srng_access_begin() helper for
>>>> symmetry with follow-on fixes for source ring buffer corruption which
>>>> will add barriers to ath12k_hal_srng_access_end().
>>>>
>>>> Note that this may fix the empty descriptor issue recently worked around
>>>> by commit 51ad34a47e9f ("wifi: ath12k: Add drop descriptor handling for
>>>> monitor ring").
>>> why? I would expect drunk cookies are valid in case of HAL_MON_DEST_INFO0_EMPTY_DESC,
>>> rather than anything caused by reordering.
>> Based on a quick look it seemed like this could possibly fall in the
>> same category as some of the other workarounds I've spotted while
>> looking into these ordering issues (e.g. f9fff67d2d7c ("wifi: ath11k:
>> Fix SKB corruption in REO destination ring")).
>>
>> If you say this one is clearly unrelated, I'll drop the comment.
> Praneesh, could you comment here since you made that change?
Empty/Drop descriptor is intentionally issued by the hardware during 
backpressure scenario
and is unrelated to the issue discussed in this patch series.
>>>> @@ -343,9 +343,6 @@ static int ath12k_ce_completed_recv_next(struct ath12k_ce_pipe *pipe,
>>>>   		goto err;
>>>>   	}
>>>>   
>>>> -	/* Make sure descriptor is read after the head pointer. */
>>>> -	dma_rmb();
>>>> -
>>>>   	*nbytes = ath12k_hal_ce_dst_status_get_length(desc);
>>>>   
>>>>   	*skb = pipe->dest_ring->skb[sw_index];
>>>> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
>>>> index 91d5126ca149..9eea13ed5565 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/hal.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/hal.c
>>>> @@ -2126,13 +2126,24 @@ void *ath12k_hal_srng_src_get_next_reaped(struct ath12k_base *ab,
>>>>   
>>>>   void ath12k_hal_srng_access_begin(struct ath12k_base *ab, struct hal_srng *srng)
>>>>   {
>>>> +	u32 hp;
>>>> +
>>>>   	lockdep_assert_held(&srng->lock);
>>>>   
>>>> -	if (srng->ring_dir == HAL_SRNG_DIR_SRC)
>>>> +	if (srng->ring_dir == HAL_SRNG_DIR_SRC) {
>>>>   		srng->u.src_ring.cached_tp =
>>>>   			*(volatile u32 *)srng->u.src_ring.tp_addr;
>>>> -	else
>>>> -		srng->u.dst_ring.cached_hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
>>>> +	} else {
>>>> +		hp = READ_ONCE(*srng->u.dst_ring.hp_addr);
>>>> +
>>>> +		if (hp != srng->u.dst_ring.cached_hp) {
>>> This consumes additional CPU cycles in hot path, which is a concern to me.
>>>
>>> Based on that, I prefer the v1 implementation.
>> The conditional avoids a memory barrier in case the ring is empty, so
>> for all callers but ath12k_ce_completed_recv_next() it's an improvement
>> over v1 in that sense.
>>
>> I could make the barrier unconditional, which will only add one barrier
>> to ath12k_ce_completed_recv_next() in case the ring is empty compared to
>> v1. Perhaps that's a good compromise if you worry about the extra
>> comparison?
> I guess the unconditional barrier also has impact on performance? If so I am not sure
> which one is better then ...
>
> Let's just keep it as is and see what others think.
>
>> I very much want to avoid having both explicit barriers in the caller
>> and barriers in the hal end() helper. I think it should be either or.
>>   
>>>> +			srng->u.dst_ring.cached_hp = hp;
>>>> +			/* Make sure descriptor is read after the head
>>>> +			 * pointer.
>>>> +			 */
>>>> +			dma_rmb();
>>>> +		}
>>>> +	}
>> Johan
>
