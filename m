Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D54A0C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946113; cv=none; b=OMrjHXDWy5FLshKvr1ywcC5Zv16fKNyz5pnAyLGpacZEGmzBluHdukWD7gEyhKc8Ia6AebEWkwkOdzZ/Up80MBgf7GdeeaCQYBNK5t8VkCJijEumZr1ugGAWNq9p/3yzSMopSUIHu/okk9uNadbew7YKziibxnF2hde4HOJB+kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946113; c=relaxed/simple;
	bh=ezOuF7W6HNCJbC9cen5o46QHDezcQjfR39ml6O7jggw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt7+AexSulWVTQmnqiM8FcCgBPXMPEHtDElVg9wX6MUdXe3BN+j53+oXMBeyEViGFZuGGG2VpQyWWaV1P4CKICknHT3IBn2tk/YyYLS2LTEI1JvNlLr1EVj8SY7Q7rduxcvPiJ+ZTiYM7kiIhQkBDfbnQSZQ/TM8vYZofn9CrZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lem0NO5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lem0NO5p"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JEZL032286
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 10:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+yFMWYOsepgGCv6WJkDjVObj
	uomJ6ssrQYWGuL/VKH0=; b=Lem0NO5pvjbail51CcHRVfcA0l0GTaXc05Qefe6O
	960aIU+/kNbrsaJBcTaXHzf7mlS0XezUvHhn3K9iNApgLy76iFOBdTnwBCmSCH8w
	v1Eu0gBIww/WDLtC/Ss7P2s7hNy3lvBlUxDmGnMJS9L8HdbVLWEbirdutky90ola
	0L9w7bG0K9lLYsXSr9I/YXgeqbL01h5LfTzGgygYgodj+IqCYkzldzjgaw/7j2dU
	2WAswJYh/pzL1zMI1VgFtLta4vxawuNxtamJrzVd2VjOv8YAmpPFMgpmfKBA90t+
	Q83CGn93zZDXpRy8vDKhOjj3yYfO8XETcV8xamVk0cjtfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfus0ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:21:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0981315c8so562785685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946109; x=1749550909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFMWYOsepgGCv6WJkDjVObjuomJ6ssrQYWGuL/VKH0=;
        b=F1wOlcVGfZN5oUod0ciKO7h9xj5OiiC11f1nGB7NIZ/taQdz9GzREYcZNUuZ+MQsE4
         BMnKdF/+bHywZT2AJi2mNNrWy/mPoPV84z5HHmyIE4jKna1Xgq14bk1QgcxjUnRvIWg5
         ZUELfRDCjLkofrc/CzX1q0oD9RV8TVeSrqE2W70WPhmH5uMq7groupZK3Kz4mYqJ2/76
         v8jUFYmyxajCDlnWUhoH2hUcY07N90CiKKfCqi2Bcy/GA47djsszEryWXFiE644PDWIG
         pXqL45tX2B8UnbIaNgAc7wCzC8KRSaedKeFBgULlSCbajUCE7uLLapcU7esLi3J+82mN
         XGpw==
X-Forwarded-Encrypted: i=1; AJvYcCU99uafWv9W56dJNMij51ZFobeGCXuESN1EdkhO4Txo9VFVEYLbwooB4sFO326JikTRunazywvhrjZOuio=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGT4jV/A90g0YH4evtzzMqvu3SZMC85OtzJcnaUHxVX72UMpdT
	27fZt25dcQ/GC8W4x4GhvAsWw5FY5uI6Y2APzxuIePEw48c6oZsiD9A+vMJsgKzO1ze/HCQfEHE
	y6ZYXyVNIAdaBmtmy4vRi1j6TLnyR/m8fAUFtD7IxJtdXvBsdcfVVWpQbQ47xhjVfkBo=
X-Gm-Gg: ASbGncvudB9BZRQmwRJhhcVJZgPGiOYKWHL+OidXXC3D/BUvdvNoDV5w26qoc9Iun2c
	1TB4IZN7/GYe4BUN7MUKXwCIOAKk2ZFmMK2OOa5kpfvVO4ayGba7RGun6Ns2wmhbIreI102T9Fo
	C5MaQOJ9Q5xMDV5BxC53uwKBa7ESrYSoGfJDJkzRKfPReNBXZAIsiGYH++4cAy9PYHt68vfMCDZ
	0zb5CCrn9ECkJUgg3sS5wgU40HDe3bJNzI60Q8OkpPPuUsEOtBoDZxMOJ3v2+UBxZjMo2egmpRk
	CaR09cUVUqNb8rcWYjEJHJnqZ2ljRcyLE1AjcUuDn4RLryTzikjcoytWtWTS5huMsScAccPsiKw
	=
X-Received: by 2002:a05:620a:4142:b0:7c5:6678:ab18 with SMTP id af79cd13be357-7d0eacd7f28mr1482546385a.42.1748946109522;
        Tue, 03 Jun 2025 03:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA+wh/4FKedlrkOPQwatQTrmIQIx7FrIJJHycPWZsT+nXMzTZkh9eMA7K4VeFJbCto3w398Q==
X-Received: by 2002:a05:620a:4142:b0:7c5:6678:ab18 with SMTP id af79cd13be357-7d0eacd7f28mr1482541885a.42.1748946108944;
        Tue, 03 Jun 2025 03:21:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a02bbsm1868277e87.84.2025.06.03.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:21:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:21:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683eccbe cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=kVcFuMI1zxpe4gVQ-GQA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BoQsneTOzubjg4qcfmBZ7dxePuuwLk3P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MCBTYWx0ZWRfX5c0Gysz/EMDT
 jvKkQ5cBDuC8Bg8shHhLL+OUpCmPkbb/rATuLkveFKzrhBK+Ub0fANtSYskKtMmdmu8HQXIK3lQ
 yxZw2tEu2Ot5fYYWJzdzlWX2I/lgmCuNCkuV7uOUFZdoa8lsLwHwCU+FwXAdlY7Be/Bd2LYzMIA
 WoekWiSYXYcpM3N/WCYzhPyaXAcQcdv/F+JMdUVBugubASL8V5S2jqGEuF+afTZNmwGMVUX+ISt
 CV30WRJI42iuNfm4QpycaL6qzbnZ1vO5nZwSm/ySp8swajM+fWW/uCAfRcoi3xKWLSgYb8O8x//
 Imem83sl5sbMBvupKHayugvOcC/KMNSjqpBRVMfQUbMXbZ6Mso/XjDWncxdKzFfPE7ks/iaDath
 Km9DlK8AlOtJK5HfZvIq4XiqlvRkKeTJ/BYUY4keyeKU77vvR3hgKoERlzPQQlS6xXvt9152
X-Proofpoint-GUID: BoQsneTOzubjg4qcfmBZ7dxePuuwLk3P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030090

On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
>  1 file changed, 94 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
>  		dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
>  }
>  
> +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> +				      struct dpu_sw_pipe **single_pipe,
> +				      struct dpu_sw_pipe_cfg **single_pipe_cfg,
> +				      bool config_pipe)

Could you please describe, what does this function do? Why is it
returning the pipe or configuring a pipe?

> +{
> +	int i, valid_pipe = 0;
> +	struct dpu_sw_pipe *pipe;
> +
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> +			valid_pipe++;
> +			if (valid_pipe > 1)
> +				return false;
> +			*single_pipe = &pstate->pipe[i];
> +			*single_pipe_cfg = &pstate->pipe_cfg[i];
> +		} else {
> +			if (!config_pipe)
> +				continue;
> +			pipe = &pstate->pipe[i];
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			pipe->sspp = NULL;
> +		}
> +	}
> +
> +	return true;
> +}
>  
>  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  				       struct drm_atomic_state *state,
> @@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  					  const struct msm_format *fmt,
>  					  uint32_t max_linewidth)
>  {
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> -	struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe *pipe, *prev_pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
>  	const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
>  	u16 max_tile_height = 1;
>  
> -	if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> +	if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, true))
> +		return false;
> +
> +	if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe, &prev_pipe_cfg, false) ||
>  	    prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
>  		return false;
>  
> @@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
>  	if (MSM_FORMAT_IS_UBWC(prev_fmt))
>  		max_tile_height = max(max_tile_height, prev_fmt->tile_height);
>  
> -	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -	r_pipe->sspp = NULL;
> -
>  	if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
>  	    dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
>  	    (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> @@ -1183,6 +1205,51 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +static int dpu_plane_try_multirect_in_stage(struct dpu_sw_pipe *pipe,
> +					    struct dpu_sw_pipe_cfg *pipe_cfg,
> +					    struct drm_plane_state *plane_state,
> +					    struct dpu_global_state *global_state,
> +					    struct drm_crtc *crtc,
> +					    struct dpu_rm_sspp_requirements *reqs)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_sw_pipe *r_pipe = pipe + 1;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> +	int i;
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i++, pipe++, pipe_cfg++) {
> +		if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +			continue;
> +
> +		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> +		if (!pipe->sspp)
> +			return -ENODEV;
> +
> +		/*
> +		 * If current pipe is the first pipe in a stage, check
> +		 * multi-rect opportunity for the 2nd pipe in the stage.
> +		 * SSPP multi-rect mode cross stage is not supported.
> +		 */
> +		if (!i &&

Unroll the loop. I think I've asked a similar change in the review of
the previous patch.

> +		    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +		    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +						      pipe->sspp,
> +						      msm_framebuffer_format(plane_state->fb),
> +						      dpu_kms->catalog->caps->max_linewidth)) {
> +			goto stage_assinged;
> +		} else {
> +			/* multirect is not possible, use dedicated SSPP */
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		}
> +	}
> +
> +stage_assinged:
> +	return 0;
> +}
> +
>  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
> @@ -1195,11 +1262,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate, *prev_adjacent_pstate;
>  	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, stage_id, ret;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1209,11 +1274,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	prev_adjacent_pstate = prev_adjacent_plane_state ?
>  		to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1227,44 +1287,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> -		if (!prev_adjacent_pstate ||
> -		    !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> -						    dpu_kms->catalog->caps->max_linewidth)) {
> -			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!pipe->sspp)
> -				return -ENODEV;
> -
> -			r_pipe->sspp = NULL;
> -
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> -	} else {
> -		pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!pipe->sspp)
> -			return -ENODEV;
> -
> -		if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -						      pipe->sspp,
> -						      msm_framebuffer_format(plane_state->fb),
> -						      dpu_kms->catalog->caps->max_linewidth)) {
> -			/* multirect is not possible, use two SSPP blocks */
> -			r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -			if (!r_pipe->sspp)
> -				return -ENODEV;
> -
> -			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	if (prev_adjacent_pstate &&
> +	    dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> +					    dpu_kms->catalog->caps->max_linewidth)) {

And this needs to take care of LMs. prev_adjacent_pstate should be
per-stage, otherwise you can end up sharing the SSPPs between stages
(which is not allowed).

> +		goto assigned;
> +	}
>  
> -			r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -			r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -		}
> +	for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> +		pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> +		pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> +		ret = dpu_plane_try_multirect_in_stage(pipe, pipe_cfg,
> +						       plane_state,
> +						       global_state,
> +						       crtc, &reqs);
> +		if (ret)
> +			return ret;
>  	}
>  
> +assigned:
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
