Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2496C182D0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747268891; cv=none; b=pdvNHeZ41QsQs5Fsw7KXyfUeNqul7I8UI2JdNcpYTbOgC0tsG7brti8ovUAof9XP6AhUtUbbADATbOwdD0DXbok2NlyAN37et9QNYDfp34AhAHIY7U0IfGngd0qEJ3ifVsPrwDwlkAd5TYSsXRcAp3FPi7ZrsQ8OqG1Cn9XmrDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747268891; c=relaxed/simple;
	bh=+q4GAhcVN7Mro6zssuEEWH3i70quaTZT16lMRtQFayQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxgiE8OCKgSWD8pzUv+eZeW4tYEC5nkB9cYHmwCWXxDncVqcM1r33k+MLaml0VAmaNqSc27gDWEcqKuUwPy4F90y7c0T0jsS8PpYG9Kbl3qJsl2FbFSV8XeT+vdJ8fqP5EpLqxzmjZz686xStzVpmQrT6T/3N3eKsvQ1IZGXaBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dx+XTGRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx+XTGRP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKYTJf009097
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2cvFYkDiNTcJpepfH9pXulh
	1NUdq2hXaOLZdeTdJc0=; b=dx+XTGRPNXPEIu5UdnahImaAP9VxwgudhGUBxdiq
	XlXFf2qiIiJkkTg9mC132unm/Yrk/n1R7BzQA7obddC3YkWEXuT+Zz2URarbI69X
	BwNr9msMUNqwhAYtCUjkg1GTyUStZURsIJ05M//4lyrsptkS1AbUGLoAKseF15Yz
	ZSf1wuuYa2jsQfxTSqvQytTwGdwm9YZaAJ+Q9aafVrs5UeEVDaaFT/+xDWPhPVRo
	Fz6YV2b2vVBYEfftW8Co5ZSI2ncZWEUJSVCo3yiUy7cqk/d4/6JFAuyoqGxIX3qq
	+yl5SCcK9LWwtP7vLWEwq3B0ArnMkHVb32GPvzJ7JgEvfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpvf17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:28:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c793d573b2so54000085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747268888; x=1747873688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2cvFYkDiNTcJpepfH9pXulh1NUdq2hXaOLZdeTdJc0=;
        b=HOrAPi5XZrOQd9Gmm4vVY+MI7MDJBb/4Q1z3FwXGzZf/0tKfYzmyvsxK1gEWe4N6zS
         TtJeglBw54vz6XvuxCi+P1eYoHtxhHn93M0tv5v035bId2vRtMcnrQZRscwabJfkfNnQ
         S/5XBScs281k87G9gFXwX3nr7ud1DlxxFJ/oNAYu+8ZzQrr80lACDLscWmpzAeJ+nDGe
         YFBlZWG65oKgBpdxYGI4WntXS1VPkYX5iisUxJMLTNqRUMZoG0t5d4HRHcYG55Yj4qF7
         ssjOiZBrAToeojrXDLU1hqzu0J3Larl7gqKWZplIPrxFd2EVvo8S8/eQjkAqdKA/heL8
         2C3w==
X-Forwarded-Encrypted: i=1; AJvYcCVTz02lhPIH7wIhzWmjEPKa2JDdbs4Wp33WqANo8IgnBOje3L8q5lCLBDbiG2z87GhRR+nAaNfsUOiH5/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+V8jPHfRVqBcMZM0zJV9uh1hNHXQrMV6ONsRqkJuoNpiRjMoI
	xJyULfrf5oOMX3aumWiyJ7rhTsdz15+9aeTcNs+fv3voh3tvdZCHJbNLNpxnnPenQVF5Gfn7Wom
	ANDepNV8UYVEgXmAtE1a37pcdHwctc5anGlWBdaF6z8oPwCUv94VZo9mRrB6OLXE=
X-Gm-Gg: ASbGncsBzuM99bzoOkwC/MNW6QL23B8GlCsArZpmn1GoVxj7bTRQMtC7jyzckHPmKSc
	Dg9ac754bemjAbkJLvnxG0X70XzX/Z0lK0q4MNDUZBZ0yE3k99zE08Rygyci7T98bmMgtLF2H9z
	hCsT10JlkI8nC+D6sHWWeBdG8qyW+vn+X2U8EpsV8MiLPZnVh8kex+mUXJOgyAMc65PQ0Fk+dMY
	Et5P6rZ5Q5AkGUjTYzL70B2duid9kOIO9OMfuOcOiaLglpi3M4m4Gs7vh9LnGWwkb3VAYa0gO8n
	+UqOiBeeua6FhAlK+CvHlJXSQGGkTt7R2xHkANmvs84juvX4YsGPUOUZXq6m7+mICaviuI3Br7o
	=
X-Received: by 2002:a05:620a:294f:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7cd287df0e3mr755662685a.5.1747268887950;
        Wed, 14 May 2025 17:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt2xaXNowfMYXBT44y4aANaDgJRpOyGL+qTVAMGUeuxqwInoNRP+sTL7AzLDhnS1ZiX9uKoA==
X-Received: by 2002:a05:620a:294f:b0:7ca:f65c:2032 with SMTP id af79cd13be357-7cd287df0e3mr755660485a.5.1747268887560;
        Wed, 14 May 2025 17:28:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6f96sm2433950e87.142.2025.05.14.17.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:28:06 -0700 (PDT)
Date: Thu, 15 May 2025 03:28:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Message-ID: <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: U_b722pkwxEZL7ZNA2Sfl5pU3lnjjHlE
X-Proofpoint-ORIG-GUID: U_b722pkwxEZL7ZNA2Sfl5pU3lnjjHlE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMSBTYWx0ZWRfX8ZAP/Zx1IRRW
 +EAJ5fo9Qf9mLP8VsFD6nxqXNjxIVMJWIuXoc6ODKXi+ryPTeZ+EoxOaZiwAVyLkTNFSjRgbXA1
 vN7ePFhMsd1Ogdjrlxx2/KPZxNTCWk4fA9/g44i0iSSM5/IY41ed1N3KuCFQNg/lMMV9QhAG5FY
 ZbvMCL9RoyWQxUSQ43zEjoSKF2n8O5I1MboZUDo+Eu0EHOA2j+PQC7LzlVINgmhNAvACS//t0wp
 GiCRaVr9y4/2sQouGpgoA3cqxCprcAIMmmkuPsgBpN5ZFnzRDXhE6QrQs7HqNcmAaXzQ21Vl/MR
 9GshKnS6SEfRwtdyuApX7RUj13D2CQomjq4XOaO7ObF93OaqcKhvdK9v7wINnb2fwvCmVc+NVpv
 yclCAcyoHq2Cvn0NkikPxAP8xtqf6WzRADakh0IJpDnh5TJI3mVK0M6Q+AqUo+XmvFaWzReh
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=68253518 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=s1QDowjoCeJB2mqXB6oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150001

On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
> Validate requested mode and topology based on the PINGPONG or DSC encoder
> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> off of PINGPONG or DSC encoder max width

Separate commit for num_lm, please.

> 
> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> for PINGPONG_0, there is some additional logic that needs to be added to
> the resource manager to specifically try and reserve PINGPONG_0 for
> modes that are greater than 5k.
> 
> Since this is out of the scope of this series, add a helper that will
> get the overall minimum PINGPONG max linewidth for a given chipset.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0714936d8835..6131d071b051 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>  	_dpu_crtc_complete_flip(crtc);
>  }
>  
> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
> +{
> +	const struct dpu_pingpong_cfg *pingpong;
> +	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
> +
> +	/*
> +	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
> +	 * max_linewidth can differ between PINGPONGs even within the same
> +	 * chipset.
> +	 *
> +	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
> +	 * 8k resolutions, this requires reworking the RM to try to reserve
> +	 * PINGPONG_0 for modes greater than 5k.
> +	 *
> +	 * Once this additional logic is implemented, we can drop this helper
> +	 * and use the reserved PINGPONG's max_linewidth
> +	 */
> +	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
> +		pingpong = &dpu_kms->catalog->pingpong[i];
> +		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
> +	}

Since we are skipping PINGPONG_0, wouldn't it be enough to return
max_linewidth of PP_1 ?

I think, it would be easier to follow .max_dsc_encoder_width and store
.max_pingpong_linewidth in dpu_caps (and later add special
.max_pp0_linewidth).

> +
> +	return max_pingpong_width;
> +}
> +
>  static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  		struct drm_crtc_state *state)
>  {

-- 
With best wishes
Dmitry
