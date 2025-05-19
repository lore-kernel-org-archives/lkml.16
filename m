Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027AD7FD
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673592; cv=none; b=jayi9BfxKxQc1tu5wfsME7YU+AQKVL1oxMCY4PXRvCdVE4Xq8GkkyJ4IWiz5A0EnwRGL554J5jvoGyL0INWBr6aUmoDt006Jq0Oaa8jjvCS7Y1dGAoFqBwsODANlbzMEVzKprwkwDw3RvxBmyIB6eNzEsheL5T0lSkuSJ+7bvI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673592; c=relaxed/simple;
	bh=k+WX/VGR+GLyTcXpjgk0GiZP4ydVVhFRDfjsBGYfPvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUwKJiOxdz30KEzoHU6WHL6SrqtCSsJpur3zyeknynzZJypWc3umuSPLgA632X2q7qMeFoYgxMRZB73lA0Q5neFmUqrbS5vqfUOmf9oZuBmfvbkBB9sfesUj4rx/rBtmDJbnmmVdtbdBCLPfac34FA2WFUVe1vLdW1+WOPbxUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L3IWVzl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L3IWVzl4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JA5L2F013378
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mb4xLfXZNKPtfn9wmLcWyrskW+Yx8ILVuk5MPBj/GR8=; b=L3IWVzl42QPTsvqb
	hCmT8q7X/25zGTL2aMN3lLVLS1K+IxsKT4F7nzx1yTuXlqM8kfS1lduqhVdTM8zd
	zoxRxc3BmMrj5J5K6gchQzCskuPmr8cJE3MTxbODocuzCeZXFKj9jOZfmVNXvqES
	FTQNY+sbyk04EXbf6GtGO/42+UCcNjgJCz7Qw6O9rnWcPrpbykvUiMtpkKTraTZY
	itQuSPzRKAelUHUuv8LckKQ+gayHYEZC2Oo6QYkeGcBNmQ8RhIv6OdoStXYqskSg
	OqGKk3qdP+cCkzYT4hPq10ybt6c+hRZ8wX7AUEtX0i1t2Sy54uiTs4sCDfGcYKiv
	cijs5A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4mymc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:53:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d8f77d4fso22283556d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673589; x=1748278389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mb4xLfXZNKPtfn9wmLcWyrskW+Yx8ILVuk5MPBj/GR8=;
        b=pGTRM0rySlhYVaqSyL1Wg+oCXx8ij5wsBXiYPiECvyQFGDkt+c6m9fbhCElpkBLGiU
         y1L2ZJ2jPMQTx1gCvi13zESWFAitb2OgnZzSMrMzEf/irJRAPMRZb11kfQ2TRRd7IFxk
         aCtHttn3SCtghoT7L2cSusJvIrt6360paDCef/adLPrnHfheSHBY5504dqh5UZX7cEcr
         PfTMX8zSyQe40M9u+RDAyPDzsTRbiQY7nj8qebmZOCdMNn4GezqrLZKV+A7L/tntYOdw
         lqsEI7lez//bpAr4ZXneiXgpJRRMaoxoQ8LWgoY6gCduTTgh0dvNHZwnj8MwEjs3bq3w
         5Ktg==
X-Forwarded-Encrypted: i=1; AJvYcCX86tuH/7pKn44pcp44Zxi+e5TtSlSsQET/AH6Ipn08NODvF1T2CiBVkCdmMotQe3Oz2IdNuPAX8N8K2LA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19N51u+xOSbuZ2eo3pYuYkk7KsNm7N4d9gvt6n5BvCyABiu5T
	VqtOPICQHaoUSWCcaiMwtc7VEpOiwYdFCQvdj8kHpC3oCcZOjCOFn9mt+GDdx9sMoVVEgXFRZR5
	SwmgIxyVCAURZNtdBV7oV1Qn4iL3gkct7Uu5GvPw+5Xny8WwguEal9LovzsfSzivIra4=
X-Gm-Gg: ASbGncv69VFNcZxtl3a/66Ln+BOGZfD6wpQbtlVTMv9AbFA49VCUYBFZcai0zt+yJYR
	GNhvEtvV8DX5ejH+GJOh/zlIg8iU+hocZEBElb4muYQyNiZZaOHDOlTFxE+0taZeP7ToTVX37zk
	WtmUOdWKgUBBKznHaT92o+XXXpWGSXw439LRKjCFbV+pH98SW58dwUNXorKwHfdUGbdPskI/PbM
	TI4X0Tmg3YvKcUhWZgdJaZJsdmmxinm4vQkYZFUzCSI+yFoR62tixPA9zFcGnBPQGolprKUi5Dq
	/BUHYXNcMfiOqV2zXFj38sd1Ay7j2mqa2GlwiaGQXeP7vD4VhwSPYxnFCLTEzmzcVai+
X-Received: by 2002:a05:6214:405:b0:6f5:3e46:63eb with SMTP id 6a1803df08f44-6f8b0833007mr195921946d6.13.1747673588591;
        Mon, 19 May 2025 09:53:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvIqC4SYEoxg7ld+LNMo4kHLPjNfRWk0GWcdCnLzJRTGyDzMhLlP7Cr3xiD3OkNvOQg+196A==
X-Received: by 2002:a05:6214:405:b0:6f5:3e46:63eb with SMTP id 6a1803df08f44-6f8b0833007mr195921246d6.13.1747673587898;
        Mon, 19 May 2025 09:53:07 -0700 (PDT)
Received: from [10.153.41.224] (176-93-133-115.bb.dnainternet.fi. [176.93.133.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702da4dsm1935650e87.202.2025.05.19.09.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 09:53:06 -0700 (PDT)
Message-ID: <7d7f1712-b037-4f47-96a3-e57a13b58295@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:53:05 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <ygd6givaigkmypmaufpeidkqauoujcndm2xemi5pm5zue6ou7j@zonusie3tuap>
 <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <b4dace94-afa1-4910-b77d-20de08b5a6b9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f4lIykW8Oga2dP66NNsACSeL5eCEGygn
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b61f5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wJfVPMc1y4yLOrLMgEZDyw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=QqOX20ToenTIRIA7GcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: f4lIykW8Oga2dP66NNsACSeL5eCEGygn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1NiBTYWx0ZWRfX8oKNPDQnUV3P
 z6AowpNp9+1yTLZFro1B1g9aQ2Dw1+o2Fr6Kd69QEg/uY0h/tzmy+sHmex4gC1IFbCMaJKJu/vD
 xZm0jFCpsqABmSlj3uXx/Rr/9D0/j2M9mQ4zbJthXEybs5+7opJqhrTUs5/SiPl9jkT6udcoPsq
 wqZF04GFLXiJZ35wDmZ1KsK7BbHbiVAjTrSsu432ZwsQTaFKStpILK3+paQLNjR1t6N5SVH/G9t
 vzZ23cP4mj7Kw4PNIZHOpoQGem/QjJwnZAlLqYvwGsf3+S9cGfxbq5NhFWIk8wYORYyA4XQzg34
 KkGwLngAfGZV+2SBRjHyTc0WwogNtq99BsNFIbPBv1+ZVIviJ38KHp7h/5sux0KMM7lFOXCvpMu
 SnhEJF5Fgbt7B4YfBZRXh08MoybHbC5l/SUDGB3Nho6PFiSW6+5z7Cv9E5h8fRBk4Tcm1c8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190156

On 19/05/2025 19:49, Abhinav Kumar wrote:
> 
> 
> On 5/5/2025 5:24 AM, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:51PM +0200, Krzysztof Kozlowski wrote:
>>> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
>>> differences and new implementations of setup_alpha_out(),
>>> setup_border_color() and setup_blend_config().
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v4:
>>> 1. Lowercase hex, use spaces for define indentation
>>> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
>>>
>>> Changes in v3:
>>> 1. New patch, split from previous big DPU v12.0.
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 ++++++++++++++++++++ 
>>> +++++++++--
>>>   2 files changed, 94 insertions(+), 9 deletions(-)
>>>
>>> @@ -175,12 +246,19 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct 
>>> drm_device *dev,
>>>       c->idx = cfg->id;
>>>       c->cap = cfg;
>>>       c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
>>> -    if (mdss_ver->core_major_ver >= 4)
>>> +    if (mdss_ver->core_major_ver >= 12)
>>> +        c->ops.setup_blend_config = 
>>> dpu_hw_lm_setup_blend_config_combined_alpha_v12;
>>> +    else if (mdss_ver->core_major_ver >= 4)
>>>           c->ops.setup_blend_config = 
>>> dpu_hw_lm_setup_blend_config_combined_alpha;
>>>       else
>>>           c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
>>> -    c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>>> -    c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>>> +    if (mdss_ver->core_major_ver < 12) {
>>> +        c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
>>> +        c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
>>> +    } else {
>>> +        c->ops.setup_alpha_out = dpu_hw_lm_setup_color3_v12;
>>> +        c->ops.setup_border_color = dpu_hw_lm_setup_border_color_v12;
>>> +    }
>>
>> I tried picking up these patches, and choked on this one. This heavility
>> depends on the DPU fetures bits rework patchset (mentioned in the cover
>> letter, it's fine), but granted the lack of the reviews / updates on
>> that patchset I can neither apply this patch (and its dependencies) nor
>> steer Krzysztof away from basing on that patchset (this patch provides a
>> perfect example of why that series is useful and correct).
>>
>> Abhinav, could you please continue reviewing that patch series?
>>
> 
> I think we could have continued this series on top of the current 
> feature bits model and I thought we were doing that based on #linux-arm- 
> msm chats in Feb between you and me. Not sure what happened there.

I'm also not so sure. Krzysztof has been posting it on top of the 
feature-removal series, so be it. Let's see, how many patches of that 
series would be acceptable in the end and decide the fate of this series 
afterwards.

> 
> Regarding the review, myself and Jessica have discussed this last week 
> and Jessica will take over the review of that series and please work 
> with addressing the comments provided there by her.

Ack

-- 
With best wishes
Dmitry
