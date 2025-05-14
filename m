Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38592920B2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250583; cv=none; b=Tvov+R5ciQQLZDl0XsZO8HVC9q94Y9l5CaIPUnu+4QagfikfasxeXnjVq/21Ed9Gbcd02OD/0Zmjf5B2uTCvFyPTbZOSSNTCAlub/RhUPNe0sH6HlcoMN3mfDT10v/fxq8wKBlUZwCHxyEjBCs8Y5jkB2KEZ/vjwoF63WAbW/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250583; c=relaxed/simple;
	bh=j9uir9V+Z0qRL1i3pxGeOyaqYFJZMvlZCDZP+qy5Goc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbiB7E0e7gA8DMhM5NqHErPV3YhTWI7Ih3y6TrvGNDX2dRA3kANcubhrp/K7BUn/q67y9XBqdUrC36mVt513vV49MLlLnjJSuBcb1g2QnNHhXKJP73PVSQDj1u9M+274DiCYnajN7g4wsPYfxCvYul0YiCygoABcA4FNzfQLyA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHA/JbaB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHA/JbaB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ6G3W016105
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mKY2kA0Hg4toLKxTT6H9DxX4
	STNTctz5Vp4Wq2VSocY=; b=NHA/JbaBtrnn8S1Mi7izXk+v+tDAebAEvZrsK2Uf
	q0GBIWoVBmku2nPWQyXU/RqRfyZhPM9MDpGg6YvFcNGsLfbiwnjMMsl3ZGBtmw5i
	3fXrcUH2ezo60TSqGK0aaSFxaMdmOvvhj04EZj+wQBtcidFO/lqqcJJ8vAF5HmuC
	wBr8HlzK6JsKSXod5ZbUC5yI+wdQ0gpsiB7mNixXytmL9QOkzG9FpP3IU7nKhQlc
	rYvNjgaX+FLoAd2oZrKejdzfEmO0Kj3MenBfd3qwMsIh2dpPCT2dZs3ydanmRDvh
	WHJEeynonl7ZBsZWWO9b0wenoVGt8FGxWjA7elO+b5nScA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmuxc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:23:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990715so26505085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250579; x=1747855379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKY2kA0Hg4toLKxTT6H9DxX4STNTctz5Vp4Wq2VSocY=;
        b=QU3xWRVwCpr9m2w96u0XC1QVQeyusyhmh75rv8PMGsEIbmT/YkD4HVkexSiSwgln9V
         9VxOZH9Lkpi7AV6Y2H5fJJWO8Uug8G2qiPL2AT/1EWkyal4IMrOQGRddMy/l2ZfZKmNR
         GjKjIG5etslGoys03fZZZNyyCj9p43Vb1uNBTP3QtLjQRrws+2CaJToWl/K7rBnrSpZQ
         StsPUFeVukYr9lvePh1JEJ1HRtIzbtCXuxwauKHFOC6KWs05Y5BdpVKBffHAcrzwAbo4
         YbglEt+lYTL6FvXDYYmWCyvorkQHMVe4a2+v11JWsKNsY6ZAInoJ00NYC+YHZM2TenL6
         xn+w==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0lzZoGbFzHCxtsflqxInCIqYR1+eUFVYDqWdcoZiTJD0oHUPRbF8LFGkfY29hMT4elnUP9xqqDzSQkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJKt1Ky2xwOA4h25uGVaQ3BhCEcIyZbJMrpDHAFKrxQYz24QNJ
	Is8bI4GmVWZluzFVTXZrcSWE0MN29ln/mddovko0Z8lLz7WkYmoTVq3YyO/sCZuY40UVu50xvcA
	hRbW1/GmdkhKdPKbPSK+EZDoArsqY0elPGPF/e42NUcAOk2Mbw4J/bAwAx9+4d64=
X-Gm-Gg: ASbGncsTAcYwDA7S+mFg0eQE0Qc55zsSk2DepSee9jxVypXSHP16chx3MhXXDL0/Eqz
	u1Qau29cAcxAXJbpJAumUOxpF8GaEXHZY9+HBdbNzFbwDSctevELQpY22du7UMeINxIqBY05Nxa
	XyZOgpwq88d3uu/Lr7gkTOOlEUt1Ep3woUe5WefJLPYBLTluV5MMIv8SVDt+FKyyyuJZnow3N3T
	vOvZi22H97tSyw0O3I3ANSpv82YHKUcwAC4eEL/Yk9H/bAmo5EyuqxuRCeVNE+taQAp7qYMsYSq
	+yCYVZ02SzpsYvAQZTHM0k/FsTtmYzbiZeYNDSmWwJVqrFsEL4erEJoqeSVgUuAIwBjh1QASrKY
	=
X-Received: by 2002:a05:620a:31a2:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cd28846e95mr586959085a.43.1747250579145;
        Wed, 14 May 2025 12:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYk5rRAMy+pvInB6ryC0ZgCWwQPsPkasd4Ia5p0Xo2g1JVmVd9E35s1zaspBWgK2FjvyRDqQ==
X-Received: by 2002:a05:620a:31a2:b0:7c5:5768:40b9 with SMTP id af79cd13be357-7cd28846e95mr586954885a.43.1747250578639;
        Wed, 14 May 2025 12:22:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a3c1sm21135191fa.1.2025.05.14.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:22:57 -0700 (PDT)
Date: Wed, 14 May 2025 22:22:56 +0300
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
Subject: Re: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FrwepriXnbRFxY6u5on_WK-cXcHCf9mU
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6824ed94 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UGnGT-y4eEc3t3GJXRIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: FrwepriXnbRFxY6u5on_WK-cXcHCf9mU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfXwY6zwUtXPoGL
 95PJPA4vWsAWeRxSG6TkNrFkW0NG0opxzZgURTO5Bi6kitYRU/bAqFJu/BBH/5tQ4MypreMH5+S
 iZiOUwB+A3LQIkIC4FTnqpiu9CQgj80qAF0sFpTPiKSUknrU0B1Fpqcyj4XVdF1VqWLcJaB6Q4e
 yNFfaa9RVKSF0/Wamr1Wki55Np76xSte37PSVvm3ztxF9r5jeSovdL79NwL3+YYzLIWcIpcBrYk
 7jQNhagFJDwU/6varMtoDR8L12SyCm/sIzhQ5VI+qNEeWudpt8GXcplNKX0j+HwDX6ZIIL1Jc8W
 hqq4FiNEDqAm370AES7w6deryUDZpp+mWW+b5KFZOk0MFpgE6EHzrVmGMZ/diiwo0CLtEYZGNaY
 7FMbM+yksTZvp4B4xLmDPEzjKR+N4ngcZrkhPsBBebMmF35XDcvn8VKA9I3Hwzaly7URY9UH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140177

On Wed, May 14, 2025 at 05:10:31PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
>  4 files changed, 50 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>  
> -	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
> +	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
>  
>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
> @@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct qcom_ubwc_cfg_data *common_cfg;
>  	struct a5xx_gpu *a5xx_gpu = NULL;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
>  	a5xx_preempt_init(gpu);
>  
> -	/* Set the highest bank bit */
> -	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
> -		adreno_gpu->ubwc_config.highest_bank_bit = 15;
> -	else
> -		adreno_gpu->ubwc_config.highest_bank_bit = 14;
> +	/* Inherit the common config and make some necessary fixups */
> +	common_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(common_cfg))
> +		return ERR_PTR(-EINVAL);
>  
> -	/* a5xx only supports UBWC 1.0, these are not configurable */
> -	adreno_gpu->ubwc_config.macrotile_mode = 0;
> -	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> +	adreno_gpu->_ubwc_config = *common_cfg;
> +	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;

Ugh. I'd rather keep the ubwc config r/o.

>  
>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  
>  static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +	const struct qcom_ubwc_cfg_data *common_cfg;
> +	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
> +
>  	/* Inherit the common config and make some necessary fixups */
> -	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> -	if (IS_ERR(gpu->common_ubwc_cfg))
> +	common_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(common_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.ubwc_swizzle = 0x6;
> -	gpu->ubwc_config.macrotile_mode = 0;
> -	gpu->ubwc_config.highest_bank_bit = 15;
> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> +	*cfg = *common_cfg;
> +
> +	cfg->ubwc_swizzle = 0x6;
> +	cfg->highest_bank_bit = 15;
>  

This begs for WARN_ON(cfg->ubwc_swizzle !=
gpu->common_ubwc_cfg->ubwc_swizzle) and similar change for HBB. Then
after testing we should be able to drop r/w part of the config.


>  	if (adreno_is_a610(gpu)) {
> -		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.ubwc_swizzle = 0x7;
> +		cfg->highest_bank_bit = 13;
> +		cfg->ubwc_swizzle = 0x7;
>  	}
>  
> 

-- 
With best wishes
Dmitry
