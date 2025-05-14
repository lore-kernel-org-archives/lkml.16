Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA028CF7E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250050; cv=none; b=Pjs1MbNG4TE66inhMWDLe+onv26kBPW7e4rwjPGoTBDAuY2VVjjaB0MzeVgsYwQB0r7fYoWDSq8LsI4ThEgawypdH1R0tipFyNVRZ4qIy36zXw0D5ic5LJaEUHi85dghHC4G9QiLZGUuZCaIC/Xug1Q03I2BFfy+1pFQbzA7dZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250050; c=relaxed/simple;
	bh=cM24UCMjnPNXlC3iuWfinz3WNJ8qtlAK1LZqb6IXESI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxHH+L5HDquFbHEr6u1N6zfMzj9F6jNmFwiDDYtnwv+5P9OvDwD5t9p5AVtBPZ1Exngo1HQ5z4etuXsRWT3XymEFAek7yFT7NRwiO33sj3bobzlyk4LdeXJ3EweIb/1UwqTYM5pAV4qTWAIw5RPBlBc9GpgeRQr0GR2PPhqcEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a5FV9cIq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a5FV9cIq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuxfc025440
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cEyZrO40PEn2gGFuwvOPBFUx
	osfxunWMlYajZudAZqs=; b=a5FV9cIqdn6EfDQqc2bxiPbCMCE8E5uUlrK5r3rK
	AdJCSbaI8TDtZ52l0ts6e8fe0qLmcSnTybOxe70G2+9UaiabkP0bTyElBYqnYWbH
	/euQ3Aqm6/P14HJsIOXZ5lb8BdPbSnZyqzyDCUOho/qdvumO4mzmq3E4AayE21BX
	Yul6sIvMUfT/x2Sl0Xebh/Le5JMQ8S5ixh5cC6d+q4yGxfYBapbw5E4BRSJfGW/Q
	htNPQ7hNnRcis/o0LdJ2+A8ZMfzUpyvpdcWkRvBu4Jxc6MhqPg8Yo2QsrmK4UF/B
	sa0oFl4ft4fx/sDbvge+gp+htE8pBlENIusOR/OGI09Khg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew3rmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:14:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95e424b62so229836185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250046; x=1747854846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEyZrO40PEn2gGFuwvOPBFUxosfxunWMlYajZudAZqs=;
        b=oWQo+bxWTyBN6Dif17riXQGV91YWVr9pXmSdycSC3nX9Yvv045OlQGlBzVEgkWHb09
         CDsYkq5rYgTc3nCCdb3c/YQ3URZQyEbLg1IJlJXuiERHg1/BSNGjAoryNlYg4utXg2Tv
         wGD2OuwpERAZraHApwo0/K9Aep0E7THsKOKakSVOft+ZYIM4O8Sue7iZctYQyDu4Z2j5
         HtphLNr685B11HvX1NUp25/sr0VlLydEHsYKqarCFYCJaxHxgux3UP4ygeK9nqKgQiCz
         KST7Y9jTBiTRIVX/RykbedrByukUsMrgIjTrbLMEruBR+KkSROqp9V0WcF+fXzYP/+Hf
         k5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7nNjPfz4FjLU3Kp8taEDylUesv6hb/DBWAKqFUhUMOgBWJDmBqLDaA3ctzTi0U3sjoGhWlPzrRYjJNps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWtDgZ7b7OD73+49T5PVQz4sJo4XZICA1St7azUTgmh0LvW0Um
	HuoX4uuxDSZtHDOClSEmvWXPjK54FQqVVG2q66Lqg1pb1ZbF4a1GgqWDvB5IvgINB+Rb12zu6IG
	kP/9zXiTpuVjZeXWnXM2pskHKQzFPMzQs3IURBJjtxEZZOPeDgKHbu+oWKUqkAk3NVYk=
X-Gm-Gg: ASbGncv0WXnkvTr6zA41f+3CpIxTnBe8ZfLlJd7ZSZHx3qPCDKFR4QgAOUea0T9c/Qc
	HQ2Z/6l2Mw0J8wbvIC5XxsNFycegIPgyc+sEgvGT+7A9hj8FLMN4MUNsQvD28Gk7BXC4mGuwEg3
	5vj1I+iWPa+gcYdJiiCqb/+3XHlbVViLEsXsC8JfWIE1DWObGkvLCgxMsNPTWGp3UMBXXc2Z9Fo
	xvbrhg9SCiNlzR7fNmzH/biB3RJHWSIRI8hEeEPksv3DNCIR7WMfl4T2UXjQbONZxGXqzSb5Jg5
	wd6Spo7+6D0Mi+BUjugBiTbnGtqrL2WoKIku1zBc9C5WW9a4AMvu0a1Ax7jJzN4L8O7nQT/94n8
	=
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7cd39e1a9b4mr108997885a.23.1747250045981;
        Wed, 14 May 2025 12:14:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENQD6g+af8BVweLVGomGSmit4xW6yU7n1cZOKrGyOrGWd0BKRa1jc8t5a8tIHnfZ3HWev7hA==
X-Received: by 2002:a05:620a:690c:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7cd39e1a9b4mr108995085a.23.1747250045622;
        Wed, 14 May 2025 12:14:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645dd25sm2380206e87.104.2025.05.14.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:14:04 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 06/15] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <wdbyamwsp6bozskerzcrsj5wt57ntuc6nwsb5rlw6e7xdk4rlr@3fcr23w3qum2>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: mrFQ6DrZ36BRJMxe4-YezdD6BNnDQOXA
X-Proofpoint-ORIG-GUID: mrFQ6DrZ36BRJMxe4-YezdD6BNnDQOXA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX0vk+Ur2JL1Y2
 HONbOumW7QNn1av654M9VLfPPhys2YdSc5KFFRRqwTRUHGMmDmOeD62mEKUIymwm0V+yExN2uXk
 sMFYCFHa1qY0AKt6PHx4nJ2t45Sb1v217JYqwg/6rsCHa9zSJg0pH+1chytGWRUtw2aVx3+55gx
 WZp0RHsr81an3bTxdtbXS2b4K5kFBhY3OZ3QXLAJ3UxbYpDmcJRYf3Cat86BaPsusrLD+LHLnn3
 /ap7QmI9lnu50e23kGgViza7HOjde3YEsmd8n6R4r1xHmSMkl9clxmzsGefQdOfku5g9V6ndNn6
 8i7TslhHd5E002fvp/UWnv/rqdB/8CYdz36Do0rNgN8PQ2UU4MlO73hSe91fTJ5s3zqnboGsLSM
 lqhJhpKpfWGvveXemlT1+X+QPiDgwYBN7w/Ht8ivDTxCou1NYKTPa1+Se0/eBDEZ0CGHmP8i
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6824eb7e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-dXeqa5UtyYKIXAyS0MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:26PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> @@ -667,6 +660,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;

Nit: could you please move the assignment after the variable section? It
will be more readable this way. Or set it to 0 here and override later.

>  	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
>  	/*
>  	 * We subtract 13 from the highest bank bit (13 is the minimum value
> @@ -695,7 +689,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>  		  level2_swizzling_dis << 12 | hbb_hi << 10 |
> -		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> +		  uavflagprd_inv << 4 |
>  		  adreno_gpu->ubwc_config.min_acc_len << 3 |
>  		  hbb_lo << 1 | ubwc_mode);
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
