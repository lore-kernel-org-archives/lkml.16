Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E571B4242
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329204; cv=none; b=XfzIXPszT7za4Lb8O8TcPODR/5lypQXtl8cPp3jUtoG/mrtHR+nJzNr18Pmq5uJMCe+j+vv76BDPXzBQr0/eiocNnILVXU4lRWtm4lHujnsMXu89l/yanKOIX8InsxZeil6Hzga+w3WplsC7duBi/iK8wcjuVkx3kSZRY+Vo1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329204; c=relaxed/simple;
	bh=O63cXBs+Xx3OU/kGfCocj7yS4CxizcWT/oxTtnSxx3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxn6v1RlAIrIJ975e+5nd3slxeWxyJnuPF6gnhOZaP0H6uMHgPT+1MltMJYvqwDe69D9u3XEana5XRyFKbHK+QkS3X0N+b1g+vE5EWt+IFLlVtbc23Xh1MybsLk8/g7GnDj62PVJ5RQc+FEuiUxvinqyUtTTY1xfQJlsZR/Hev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y5GcOq9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y5GcOq9j"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFPeg031652
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=; b=Y5GcOq9jFeWOZVDD
	Wp0cXL7yUw4LnTspT78KA03rujBHrF7cXUO/6KD3mzlgkEHiicB0Ytq2lQtoQad8
	4N1SAwIhxX3Aa/Gc1l6xPR1ZVa6Vp8idrnEOYmgSDkv3HAWUZYbnuNF5z4voWMAP
	hd1ei+t35uiJmG9EHY5U8Mqds8UbUKC6b7oGUpGjU8Kld0SbCP/qna4vc4jsApIP
	vc85l6eaNVSYhHGxJcl3qDn5/lkIpNwKx8Op+w696lD4gX5ihJd+t4LKP4CjnwXm
	oK20wWCxR7rVJgqVnKKMzTPBNC5eJ0hv3LGC205kIEfZTh1TjBjuQjiCePRfru+/
	nAn7Lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr6v93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:13:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e57a372dcso1104430a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329200; x=1747934000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yYY5LgPRLIrcdKBo4sFGaqpoE0nGNKtVE2RVccwfFlg=;
        b=Nm3P/QXawE0P+ZASaJAD8gv2Ip5tlLlntKNtsQ4HUQNrXBB1paRghQV87ygAi8mv3f
         2Q9obionS9QoMF1EGf/lqXgMkOk6YKXVH7LHY4lHP8nv/96vN3iiI5jyEjRY+NWe3Zdy
         FJbR1/nbMcTyfQg9LNqFaLw2ooAGdnpPsr47j25U96Atq8pFCrczAcGIbenY16FukexQ
         G4aeOuPFxBTHJAGT9GLgQRQokm6XyMKa5a69dE9vrlHxBIytY2LZIcbr5+afrWNafc9h
         JQrkt2T9sKDIot/iKD3wb8wPMyrxB1k74GEyadBVg629rWD5cwRw3hPeLEOht1tSyEsb
         fcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtvJGyYJqUk3TBkK4kfoM2yzt+gZh7QzlV03AQ4puZmjG5qH53v1ccFwSqT+kMil4IPl2a8LMfspirN4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/4z65K/tBugBVmdOsEMo+vLNRznSTlZTdnAgtBdBEOu/QZJd
	m6m9XAuDDASINk6iv5Ykj2PiXJw1RQsbEUzxtGsSHy2LRiws8SSRL0s6YFue2xehNNqUqhTjeCG
	iWWqR1pZrN1v6biyhQbF+bgsFSqBWjQkniWzBFDv03ALGn18Az+aGbM7f+qLb68VWQK8=
X-Gm-Gg: ASbGncvTXkZoMV92B6r0usX183aQsIv1OXQkceG4+vBihgy92uMDSSNhuVU1kpCD/RR
	j/3+9//divUuGR0lUakQF74Das2cXmOclLWPG+DPQQM2cOOjG56aOzlQmSOWZKubZ0GPjqqWYJy
	ngxNy01F+MNvp0Y5NKcAcFfCkbb4OzpmmEsXnNosrkPtVsidK0/xJ8dBKv5wRTkFnHdFVKnZ+rW
	aopCly6B2C4LzYqjRN07jkwyDJ+SNyDHdsGcZwRG7RsPaCBAO7tCepldyiKZLNbnyRObVospkyM
	/EMpVfeW4DAfPlQu/Nqc7A5pVhREG+IBgwLn6579ocZUjACQoCqAj7BYXvB5L9iurbkB3Q==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30e7d544fd4mr288087a91.9.1747329199743;
        Thu, 15 May 2025 10:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNDu7NvHwl9BxUYwJis4ASPQgBchI/AV8+LYPCkrCV2kofbKQRnSnmom5F9mPfzufGWwElaA==
X-Received: by 2002:a17:90b:33c2:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-30e7d544fd4mr288065a91.9.1747329199310;
        Thu, 15 May 2025 10:13:19 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d5918aesm64070a91.49.2025.05.15.10.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:13:19 -0700 (PDT)
Message-ID: <abc767ff-acb9-47c3-8b6e-6c6150f7b19e@oss.qualcomm.com>
Date: Thu, 15 May 2025 10:13:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
 <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: coCgeV2aBgZgJIzWTKzeqMl0wb6LnSY0
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=682620b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=_YleJFLcT2wxSgV-J2oA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: coCgeV2aBgZgJIzWTKzeqMl0wb6LnSY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE3MCBTYWx0ZWRfXzTitVOTFRn/4
 mV1JpcqOBMvUdsnjFU8LmOJxbcYMHCKMY050dW1PYHpsBmhq/tx2FNz44VKHehBqzkb8LvDPNGB
 EB0CXiSQjzol9RLCMCo9z2whnlYcHFO18Fnc/6OudbGLriVs41qXOA7n3nx7+mol8aXoOhfGaEO
 d0Qw2Rgre4Mc2Q4UeXjC+hRjtlXkpWQXni9U77dTHvBytG8D+cpJw+RNib7rKWJi0EFLUK9KBG0
 LcV1/RrYrm++EC89d3Zio6stUBehH90J0W5tNPzFILbW18EVaMm046el3gHYXPTPXFf4JT2nA9T
 tG69t/Re71hFxkFmIsafWm8g0elSuxpQH9f4KUninwsssdOMHXN9jiHB4sBZ/+CS2NjuM6M58+9
 1Y1ELmiGTMnS5bWqpWbRuGC683UfVxPBkgbme+HlWB7jjbjPt4sjqDEmkmRn1zkTPuS8p6Xc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150170



On 5/14/2025 5:21 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
>> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
>> dpu_pingpong_cfg for all chipsets within the HW catalog.
>>
>> Note: The max supported PINGPONG width was 4096 but increased to 5120
>> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
>> of PINGPONG_0 specifically to 8960.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++
> 
> This needs to be rebased on top of linux-next, otherwise you've missed
> dpu_9_1_sar2130p.h .

Ah yes, forgot to update my local working branch.

Thanks,

Jessica Zhang

> 

