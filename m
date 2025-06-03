Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E761A9B39
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946287; cv=none; b=kszk6aZlI83KMLVomqVKQ0e8rQWTv/7dX6LDHKsRtbSps7G2jiqvFGp53O7TjGDW7s68oX78LEIrx1Mpcj2ze9k7Rnb/XEoLuYZaCR/GdiXndmr/ZFOZbjCpOBoj4vcmBOwsmvacInnZcmWVnoWMMTIFBCt8WP3l1Rb9F5Y+UF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946287; c=relaxed/simple;
	bh=L5SSiNoM99AoVFDZrjuwmHOFjybATeShnd6SJRZziS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSIkRyInQTsqKG1FjQazxohVPr/l4os6aLQRK+20cdYtkc2grl+mnDtV8V8iz9X/eov1csWF7Nege3UPbJZPR5E8UavmbpH5LDUN2sA0Bm6J31a1w0r0tZ37qltBlqaxaQGWDMowu4zyTKA19c/7VTPmkbahnVCOtqnEp4zsBKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQ5oROgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQ5oROgZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JK9d006543
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8X/sdHFYG4xEls9KgUDjyGuo
	Kkp1AX+QACpgspI0LJs=; b=HQ5oROgZMVVuu3tSigG8HkTg7bnK44pS11ajrjga
	ty5ORBWMri/ln0RysVOeAa5/dFvdLbsxAVZWFhcLpYvlaCUrXBK9BlK3W6pIUkjs
	EBToKoh9MrCD5kFUJ48yxY8Y3isvkwMWU3q1hK6nJOUMTcezSukoadf5IdOLqV6w
	sr1BYbyMft6j2Rpc4EgvMdqy9ykGqb5CCcy4RWceHLwH191LJ+uKv6oXinr/UqUq
	spTBif9cEg414zA/w9D8+XihOXRxf9lvwPv3xS/Nvu/S9v1ROhiBdIU585rR45yP
	SQzkhSyp75PMm0Y/siaT+qzGl5LU1mMWvil2W85x/1SXHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8st6j6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:24:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09bc05b77so794947285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946284; x=1749551084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8X/sdHFYG4xEls9KgUDjyGuoKkp1AX+QACpgspI0LJs=;
        b=uUZFrRSBul6DeeKs+Dk03YNAsNRMIkZtpZ2jzEyqHyAmyIMLNQRdRzSjz5GgUBH4aB
         ze3kb3FV6tp93dlcMvNmqJd/x8BM65nEM7EccfOwSMFuUOJHi7nArxqTAfZIKqc76wco
         CM4rmF1B8u0mYFVELJbt/DJF82b4D46DTZLFjKYzN8KnXbmmaVZEKcyqYGMvWBnEWH0K
         2G7sNZ3KogD4iLKoGhqiFT13jcA1agkRX21a5Zcx1NakyVvKd9mF/NETZh15Va90rlkp
         a94qDwyyc1TqI1SnhnqO1SIDimwK0vPHKS2zKSsUfVbAzpzjOZEtO+yTQKzhGXaLzso/
         TqDg==
X-Forwarded-Encrypted: i=1; AJvYcCUhrkmWVgZmWIsN3083EB4EQ3ERbHCcGH74VXIkCSTwk15x47rjnA8BPG0oJr8Y8obo95+5G94Im5rd6/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgkLyLtv52dWTVT9bo5i8+Q46Yvt2XXasnuQ1Un8/qOWQQPJGC
	WcAy/7zGSpRvGqJCllIwzq/yGwCoDn9YUxXPF2tJiB5ZKhAC85+GKHsnqDxSHHs83lLJTJ3fbuX
	qpnjhHgyxbhHMYq2dnsb45bZpHdR8KnvqOGMez0q3IR1O5Ibb+nGTCGWc94WWc6eTGM4=
X-Gm-Gg: ASbGncsCPTRJ2ipBKs5l65Tw1CnWqwIIyfdYyjtLvyo+UWIFUcfUUJWrur8Ls6ieL8K
	tNhrhpxlK+L0ix0WJycUi5Pbjr4sGdXjWok/mw5VOzDuJ7pAG2SeghF2auTtPKbjG1culJqctJa
	pODm1bPPcxYhV0agEQ1f3jnz4AE7JUlf88wC5T0lRBabtyfqs9emfvU1hX3EzmkCZDpajQTVjIK
	nOChw1UcnEEB12OFPY/INmJVR1zSLwcGxRxqXBM6ZkjOLCzS0MxyNwAtQGQVlBBmqkIklpdTDFd
	BeywqVO+gFqBNXMvCpH8A+OBG84Ck3l+bkI37OEI4gXbXSk7XAy9ULeiYKdEp0o5jwdnLb6QzAb
	f5OQlby0Jzw==
X-Received: by 2002:a05:620a:2a05:b0:7cd:565b:dbc9 with SMTP id af79cd13be357-7d0eacaff1emr1546419485a.26.1748946283769;
        Tue, 03 Jun 2025 03:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIHzhH2SJMVGYPwtzq1agpq1FHt0yACqP7MZbotmEP0Z6ueg0f6IDu07/7/Dr+I9bfBtdGsA==
X-Received: by 2002:a05:620a:2a05:b0:7cd:565b:dbc9 with SMTP id af79cd13be357-7d0eacaff1emr1546416385a.26.1748946283327;
        Tue, 03 Jun 2025 03:24:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337913421sm1880194e87.117.2025.06.03.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:24:42 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:24:40 +0300
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
Subject: Re: [PATCH v11 11/12] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <5hmgt4v4nop3xpqt34wq4yyfjnypkrnlrr5fnt6r72k5c6r4vn@ykmg5ni6hjyt>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-11-c3af7190613d@linaro.org>
X-Proofpoint-ORIG-GUID: PQvkMXJUpgULBuOo9Xwh4Hq-hPQGujSC
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683ecd6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=OoP3oNsDoWyiozS0VdIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PQvkMXJUpgULBuOo9Xwh4Hq-hPQGujSC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MSBTYWx0ZWRfXxKBYrZONVv/X
 cNnHRH0i5SmiWMwVsJxo97d4Gcudo6ljBeOcwjAZQnNwu7SiwdxAW4HNqo1ypfpx9m7Wwcfqh+l
 BLReyG4Aw6cm5G87v4xZib3yMJL53JRo+H60lBOoWMti7tb8l4XKrYIEBmOSC/+/rGRHzJ97SVC
 QWldTBoKX5/rcColn7zbwxdztjT/x4Jan/k2jPGH/GI+EadLp75BbiIjXm3/IYes21mU3GCRo34
 UqoZ3bv/AFSPNDxr49q9cNYbMLZo7Nuw36u/Yhr58tFhFnsIS44fPYrc3+xgqqcq6iBhXny+u/O
 g+JUckz2qWpqYi4rW4VtudVA7U+K0RvIu8sQ5RFqgq6stBjgpOUF7Cn83QZ+3ZQra1wt5XoMX/e
 yvQYl6CvjpPVGgaxhBffHsTUx12lC5k0E3PNgJZSLZtx+/vAac8Rn77fleHUxYpFDONIQ+Ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030091

On Tue, Jun 03, 2025 at 03:10:10PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
>  3 files changed, 110 insertions(+), 40 deletions(-)
> 
> @@ -886,35 +887,94 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&init_pipe_cfg.src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> +	/*
> +	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> +	 * configs for left and right half screen in case of 4:4:2 topology.
> +	 * But we may have 2 rect to split wide plane that exceeds limit with 1
> +	 * config for 2:2:1. So need to handle both wide plane splitting, and
> +	 * two halves of screen splitting for quad-pipe case. Check dest
> +	 * rectangle left/right clipping first, then check wide rectangle
> +	 * splitting in every half next.
> +	 */
> +	num_stages = (num_lm + 1) / 2;

I thought we agreed to loop over all stages, dropping the need for
num_lm.

> +	/* iterate mixer configs for this plane, to separate left/right with the id */
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		struct drm_rect mixer_rect = {
> +			.x1 = stage_id * mode->hdisplay / num_stages,
> +			.y1 = 0,
> +			.x2 = (stage_id + 1) * mode->hdisplay / num_stages,
> +			.y2 = mode->vdisplay
> +			};
> +		int cfg_idx = stage_id * PIPES_PER_STAGE;
> +
> +		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
> +		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> +
> +		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +		pipe_cfg->dst_rect = new_plane_state->dst;
> +
> +		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +				" vs clip window " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect),
> +				DRM_RECT_ARG(&mixer_rect));
> +
> +		/*
> +		 * If this plane does not fall into mixer rect, check next
> +		 * mixer rect.
> +		 */
> +		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> +					  &pipe_cfg->dst_rect,
> +					  &mixer_rect)) {
> +			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> +
> +			continue;
>  		}
>  
> -		*r_pipe_cfg = *pipe_cfg;
> -		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -	} else {
> -		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -	}
> +		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
> +		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
> +
> +		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +
> +		/* Split wide rect into 2 rect */
> +		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> +		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +				return -E2BIG;
> +			}
> +
> +			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
> +			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> +			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> +			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> +			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> +			DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> +					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect),
> +					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> +		} else {
> +			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
> +		}
>  
> -	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -			    new_plane_state->fb->width, new_plane_state->fb->height,
> -			    new_plane_state->rotation);
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> -		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> -				    new_plane_state->fb->width, new_plane_state->fb->height,
> +		drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +				    new_plane_state->fb->width,
> +				    new_plane_state->fb->height,
>  				    new_plane_state->rotation);
>  
> +		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> +			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +					    new_plane_state->fb->width,
> +					    new_plane_state->fb->height,
> +					    new_plane_state->rotation);
> +	}
> +
>  	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>  
>  	return 0;
> @@ -997,20 +1057,17 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	int ret = 0;
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> -					  &crtc_state->adjusted_mode,
> -					  new_plane_state);
> -	if (ret)
> -		return ret;
> +	struct dpu_sw_pipe *pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int ret = 0, i;
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		pipe = &pstate->pipe[i];
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		if (!pipe->sspp)
> +			continue;
> +		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
>  						  &crtc_state->adjusted_mode,
>  						  new_plane_state);
>  		if (ret)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
