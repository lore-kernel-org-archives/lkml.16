Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D6BE49
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355952; cv=none; b=c68PoDQsEp5C6qLyBrninlwWS4VStcgrWVesPgQbl6dXB2YIr9c5BF8fwK06AL2sGdGHoM3YV3Jy29crxYt6IuRdC/efA7WnAcktHk7Q9knw9O86AW7ZR6Tq33meZNjwbzo24Uhy0oo0fjPZ6cQ+NJeSci/DuCci1mdEp1SxLng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355952; c=relaxed/simple;
	bh=5f1s3Ff09Aq59wDQTqmIS2t0zVSVSDCLVqyAzxPQp9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=do+34VWVxaLTrheoc+I/3xZUaCUiNS4rKfyJbSIBjpo+ufPMSTerEbhMiXULotrRsxuVxIUUkGmdfPcetO+Ul1GdmD/gD3Mc9bLbeEkswq6hz6SfkC0fqT/EQ7IeeEyUtWIptHmeXhIOgWerwxz2aosu0XyKkwjIwnYZbdIVADc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhWIqLhA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhWIqLhA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCYL024592
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlqhZcs+erk3iBh+80fphQbFA+uOB/LMqliG0REwbBc=; b=dhWIqLhAtjrxwtE2
	pPBq6XHxgW9JdIiD1TWG0LkoytjCi2O4joojeUGxcMzCW5YfWAuWuxlidB3ZCaLE
	AtamsNgvWmIJtIGm/SOEQCWpX8F88vPLs0yNxK1Bw2HZ+R380ZJbvqlNaY+OPOaY
	Np1gumqPX7sYhMznsiZuKrxFvWQafOFTY3/c78erAGmsyRq3vIWz5j+WhOGIDdRn
	QdmKDxsWRK2OyxMTc8dtvvdFKbyBknu4TTxelCJD6tGR/pjk+juLUrHTtSmSHjYr
	ERK8JrINMKfa7rgA0SZASrpsiucWkln624roJfPHnhr4ZH1deH2OFTJGLX5mYi/2
	Z2nxIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp049r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:39:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2318043effaso16893595ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355949; x=1747960749;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlqhZcs+erk3iBh+80fphQbFA+uOB/LMqliG0REwbBc=;
        b=Qjy2lgCd6+ceHvdr2QeqRz5y1NHNSahGHxgN3kp29qlmemzCtsafUVgKONFKh9Hnm6
         rBSJj4nNPPDCa5EJSWq3tsVAbtmgeECQZDQJEEpkVytwddsitrWz+n0CY/ns8XMiQBRN
         ux5cRS6HX4wT7MTdeCmnqkRDsEzwFEo4wZUZ1MofqnCAPvIygbQpvpGtu8Wi9FnXanm7
         7AUMp7Smx9+YFC1XDYnu5rmfqQ69fiT58O0yA9O25VBIa4UjT5ikDnHnLjjhDvCVC0sT
         TZGeh4HsiHye9IIMXsvH/Q9s/7ZQv4jdKJkABBlHkyX155/g5iBaEVmxHbmElzK7ula6
         vcVw==
X-Forwarded-Encrypted: i=1; AJvYcCV5ywROFbbeF8f90vG0CPOUUQwE/JXhXpVxU4QRi0wnUGZnWW9BTO+3VqKjbdohXC9LiX+p/z9Li8o2KBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylMPAG1Bd7C+Fri6MQq9maXVNVx4MAeKG9oGTcSJquBIJD+TUa
	JBVqsXmqjwGlOgIC3tcWNGs86NHmGAkEUbHLCkfLHJyOOHHjl+4fnsLB4hTbVDdkHDNKmcbfqiX
	xDM9uUmIMpULLBkG+/R6qb12NvFeEZlRLfP2tWcrknl8P79eq3zRcXStC6i8oMyDSXtc=
X-Gm-Gg: ASbGnculit7jOWcSZuA0Aox8Cmy4GHv2ltHUnU2PzlrFaTqMgDkSXvJN9qCiadoqB9l
	3Ng4i1zZghGlGmJ7CWN/LTD9iERobttAYE9C+8yUCrWuRF8KkZY+oXoTj8g9Z5xiuiXplaO0lkB
	2z1M5ABjpA96ibtvKKs9UCAZH3BckVHrqN/GUisNJ3JOEBkJU3OrZNt12b5Ratx5kLLVedDPGUW
	QxBASQ96KxBib4DsOVGGr6j1Xv/qVRSzWus2y2ofIdZxuydyotB9vAoYjvVDCYmfsYSdFIj3PJV
	drYW562F1qWr0G7bb7fH17mzQaT7+dK7QDLJXFwLiS6J240d/rkQJVhWVa/xRMqvo+lIgA==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id d9443c01a7336-231d43d36ffmr15463025ad.30.1747355948946;
        Thu, 15 May 2025 17:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIxa42I2fd9QBBq3jcy1OxAa7Gi6L2HevXKicZ0G0GjWZp48BnGCRKieCJE4fuG/o3RumIg==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id d9443c01a7336-231d43d36ffmr15462825ad.30.1747355948541;
        Thu, 15 May 2025 17:39:08 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e069c592sm755765ad.100.2025.05.15.17.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 17:39:08 -0700 (PDT)
Message-ID: <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:39:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GyPFquNOCqpoMetzfouwF9bFR03-q2AO
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6826892d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lZyNh1K7jJI6hNXvg3QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwMyBTYWx0ZWRfX9YzOm8yv52it
 mMq+K9D5hhBUbdDWmE5Co+FCZ9gh3pmWa5Uoz/vxuv39G6kct/tTAheoXxnMJok/PVyR74wgCf+
 Uq5hEYdu9dQDuLM+LF73aCvdnfMNylfsiVOQBOOX/oxHHVVQLhn5st9vKSmer492w1uBGkBp6Pp
 kRROcTzFwJt+7PHh2vyIqxnR3dicOLnbvIfxzP0GsFHavq9sbVCj42ENvkFCWk8cwpvlhBJMTOv
 uHymsWXY97dhEsryGONtR+GP63byZBLTg8UhFMp/otU++lRWaaF7zzjKv+M7uWGAPRXPYaDgyq4
 HGR+XDjhrYCcCpEyBE2l4tOj9ASPapsGYYzkGQRtDTtQcFFonQC7PUVMAzxiKLWQM5VhSL4NQkY
 Gb70W9sznOAoSU2QlqrvJsf3LnwVM1lnDMgugQIuIMYpFW+pAXhIVkOyvpUmMpQ64ONOcZlS
X-Proofpoint-GUID: GyPFquNOCqpoMetzfouwF9bFR03-q2AO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160003



On 5/14/2025 5:28 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
>> Validate requested mode and topology based on the PINGPONG or DSC encoder
>> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
>> off of PINGPONG or DSC encoder max width
> 
> Separate commit for num_lm, please.

Hi Dmitry,

Ack.

> 
>>
>> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
>> for PINGPONG_0, there is some additional logic that needs to be added to
>> the resource manager to specifically try and reserve PINGPONG_0 for
>> modes that are greater than 5k.
>>
>> Since this is out of the scope of this series, add a helper that will
>> get the overall minimum PINGPONG max linewidth for a given chipset.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>>   1 file changed, 39 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 0714936d8835..6131d071b051 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>>   	_dpu_crtc_complete_flip(crtc);
>>   }
>>   
>> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
>> +{
>> +	const struct dpu_pingpong_cfg *pingpong;
>> +	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
>> +
>> +	/*
>> +	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
>> +	 * max_linewidth can differ between PINGPONGs even within the same
>> +	 * chipset.
>> +	 *
>> +	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
>> +	 * 8k resolutions, this requires reworking the RM to try to reserve
>> +	 * PINGPONG_0 for modes greater than 5k.
>> +	 *
>> +	 * Once this additional logic is implemented, we can drop this helper
>> +	 * and use the reserved PINGPONG's max_linewidth
>> +	 */
>> +	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
>> +		pingpong = &dpu_kms->catalog->pingpong[i];
>> +		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
>> +	}
> 
> Since we are skipping PINGPONG_0, wouldn't it be enough to return
> max_linewidth of PP_1 ?

I don't think we're skipping PINGPONG_0 here since `u32 
max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;` at 
the top of the function.

> 
> I think, it would be easier to follow .max_dsc_encoder_width and store
> .max_pingpong_linewidth in dpu_caps (and later add special
> .max_pp0_linewidth).

Ack. I think my only concern for this is that max_pp0_linewidth won't be 
set for all chipsets. But if you're fine with that I'll go ahead and 
make this change.

Thanks,

Jessica Zhang

> 
>> +
>> +	return max_pingpong_width;
>> +}
>> +
>>   static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   		struct drm_crtc_state *state)
>>   {
> 

