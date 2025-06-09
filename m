Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0311DE2C9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474004; cv=none; b=FtH5zyHnAtDhywJT6wdV6j3rhuKxhieGY/0FfYvzr9VnQF2qGQoCzefPX6R8vUCwU7ddK08PE6Q9jGua/5md1lNO02S2zNMfNVIBgQmkL/aurd3tICqGJiBGh1ztVqHa4XvY+5cBq1Vu2ak3OrwfJvUBEVAOs64wLA+Z1RDXM5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474004; c=relaxed/simple;
	bh=IOxbquketRPZYcOdbwyuZVHrQ7TC3aistuXFVJzWzWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA8yW7+fSq7AFfkOhXX3bF71ml9fh1PnOE47Aht+xd5ktL6skJPaKJ8h6mEUVJhilERTYilFuY6JvhdQwfwK0+z4kzOWcvDp58xFzFzhlpb3HbGUfJqHIfzKBOj1oM+bCtgFIWhzveVR3+Ig0JXCJonPshSUPX5NXTcCZRsAVwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYzfyYYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYzfyYYg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598OgBG002426
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=di6vHrGN6TNqeaLXUN/IIJgI
	V03heHngu198qZhXzWE=; b=dYzfyYYgctOPIR3H62+DzNEqfYagCsfLmj1SMOKe
	Gh6hweShrDPRyRD5QwBs9ywCy+J45YGcdB//BFgBswyjMyKrYEqCkp3x7+B1woee
	z+E5Nc2OwosXQGeh3peN/fZUb8Fm2OfUbHtbHlJkF3/a9Z56q3mj2kxPfZyEPVnT
	u04j+mp3g+f38h8z9lU/HuHQ1JeO4+W8JLFbrQiPGk2Aae0zcv8FVFrCadXGi4O9
	XFu+zxSGdOF+ZQfi1wx45Wpt8QdYvAgWiV+8VPmeqUd72RULmwMb7PAMfenwFoMw
	4KqszTsyUbT5RmXNCFAbcD3YrlvTRaG1lAwANvBdyd6sKg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y0tca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:00:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso116175706d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474000; x=1750078800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=di6vHrGN6TNqeaLXUN/IIJgIV03heHngu198qZhXzWE=;
        b=VWIyeELlGHcpPyT1T6YkyAifgKEv3L5FKXdoLfZ4D8cyTjCjDZcv3+TFCr+XVWVPaI
         NIFzPGJiaOk6ZeuTRIJev4CIuVk0IZ9zQrvu1G8zk1HYgNfM4BhoqSj6P+NtXIdE6X3Y
         PYuJEdI5M6IBgdHUmYqpkloLmhPsRnGNrotpaN5POxZvOfGn65ls2CiKtxuj41dqpSPj
         Jf3zasF51bvRY/YE8ebVtgj8+BozpMtChUepTugPNHRYlEegbCMKIbnvlEJOLrtFkf4w
         Z/B9BB3le7JmUek89LEnZk+Q51ERXE0rJZrdPAwjktnh2I7BJ26x1RRDYZjMhjDXh6Vc
         SNJw==
X-Forwarded-Encrypted: i=1; AJvYcCXmSBIUpQ46PF1hrCcQOhMAKPAM+GmYCMZNZ371i+vtcZk0CmKQDk2F2HajL179aXKgCZF+2GTWVM7o6VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEN4v641Lo/SUSIAlWrYad1HTBu+EpDl3feQqVrrvUxsydGKmn
	MJA9lUqRL8nOXPBbz98u/aURZPztkOCcnYKlQGbbsSP7t/pl4CLLNLO1ajg56oFIybmz8tvMGzL
	rzeMm72C0uhqtY6c81jf7dPMsTUwtvtdLhUwJuFR3nsexXM7E7J8vKUGm9pMkt5VqN0xrVOQBhd
	k=
X-Gm-Gg: ASbGnctsdwKe8xJDtD9x44r9+EgxG5b0dTtNLolvG5BFFuLVCr3WHIPfdApY9kr1+JU
	oZan30S+fHwhKgCiJEckfWzoH9AZfGXTQydjv6oBxqCDYB78qjNV32eeX/ItjwiVJp0AD88rp51
	omw1/7BCDXz+P8wa9x17dWG2lNqGD+dLg98HHqO5rhqJwe/zSS3OaoRJHYSejjv3gROfx9VTgbc
	99xRLBzDo7M5d3DAcIqJ/TrJFJC+s1OEKwwPyx+uz4MIaALfTaCz2YBCNgZJjNPBlQlESBsAbXd
	nrnoAF3hSGLfv+reayfxCntvya9VPRa+zLsKxljMRkH+i/2WXP9dP0YL7dkXsCHkdxWdJOjcjVw
	=
X-Received: by 2002:a05:6214:ac5:b0:6f5:38a2:52dd with SMTP id 6a1803df08f44-6fb0903b302mr215982326d6.31.1749473988154;
        Mon, 09 Jun 2025 05:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr5yuu5mauyWCNTwmDa/j65qV8oygF697meHKN70F4r4H3UBpOaJwgybMfv2NYe55o4bgsQg==
X-Received: by 2002:a05:620a:40d0:b0:7cf:159:9aea with SMTP id af79cd13be357-7d2298615a4mr2047449885a.2.1749473976281;
        Mon, 09 Jun 2025 05:59:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536773896dsm1142872e87.254.2025.06.09.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:59:35 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:59:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NSBTYWx0ZWRfX5kv0lJaDMSFs
 3nTS2OWw834vP/6LrbfUojj6RkxPv03nVyqMNrICA0ELNKpn7VLCzbdRfv44jDye0AN8GbJx0Ap
 V80NScFyHewg3h/5TgBPxeRrm1QNr8Daq6Y64xlxhJlPoo3fBMSo/aciiT4eUvhgr4GqhJZqmtz
 w3CZzjyyOn0uPzFJlWgtd6P0GAXjW1RTtas0tz1uAB/TjxO/0H52w37k/VHTyfu1ScNCy29GgcK
 lGX+6I1H0ZXwQraiTA7gJZQzt+Aim3e8gQbWHN91zw5T44oRSoj3vvZzvddgbhG+eEEzteWyFzE
 xdwngS1AlzKKsXjI6Vzu28EWznDEN0vDo6UxrYqFqSxx0KvBNdYsVe1SEhs5kIfm/GcBzSlfasp
 15xCM+sLpyqdt1PhBJsqUEPnuoLPjCTfNg0LC6YWrbMXsiYcX5lr7rdCVQyZjw/vP8XjPyq9
X-Proofpoint-GUID: sg4-Og8SJ4S2Zi2HKCivHsTOAqeSacvG
X-Proofpoint-ORIG-GUID: sg4-Og8SJ4S2Zi2HKCivHsTOAqeSacvG
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846dad1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=873dXA8KE1yyv6hqAaMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090095

On Mon, Jun 09, 2025 at 08:21:22PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_enable() currently re-trains the link if needed
> and then enables the pixel clock, programs the controller to
> start sending the pixel stream. Splite these two parts into
> prepare/enable APIs, to support MST bridges_enable inserte

typos

> the MST payloads funcs between enable stream_clks and programe
> register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 99 +++++++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  4 files changed, 111 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index a50bfafbb4ea85c114c958ea0ed24362a1f23136..1e13ca81b0155a37a4ed7a2e83c918293d703a37 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1980,40 +1980,61 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>  	return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>  }
>  
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
> +int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
>  {
>  	int ret = 0;
> -	bool mainlink_ready = false;
>  	struct msm_dp_ctrl_private *ctrl;
> -	unsigned long pixel_rate;
> -	unsigned long pixel_rate_orig;
>  
>  	if (!msm_dp_ctrl)
>  		return -EINVAL;
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> -
> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> -		pixel_rate >>= 1;
> -
> -	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
> -		ctrl->link->link_params.rate,
> -		ctrl->link->link_params.num_lanes, pixel_rate);
> +	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d\n",
> +		   ctrl->link->link_params.rate,
> +		   ctrl->link->link_params.num_lanes);

Please don't mix whitespace changes with the actual code changes. It
makes reviewing the patch much harder.

>  
>  	drm_dbg_dp(ctrl->drm_dev,
> -		"core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
>  
>  	if (!ctrl->link_clks_on) { /* link clk is off */
>  		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
>  		if (ret) {
>  			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
> -			goto end;
> +			return ret;
>  		}
>  	}
>  
> +	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
> +		msm_dp_ctrl_link_retrain(ctrl);
> +
> +	/* stop txing train pattern to end link training */
> +	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> +
> +	return ret;
> +}
> +
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	int ret = 0;
> +	bool mainlink_ready = false;
> +	struct msm_dp_ctrl_private *ctrl;
> +	unsigned long pixel_rate;
> +	unsigned long pixel_rate_orig;
> +
> +	if (!msm_dp_ctrl)
> +		return -EINVAL;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +
> +	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +		pixel_rate >>= 1;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> +
>  	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> @@ -2031,12 +2052,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
>  		ctrl->stream_clks_on = true;
>  	}
>  
> -	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
> -		msm_dp_ctrl_link_retrain(ctrl);
> -
> -	/* stop txing train pattern to end link training */
> -	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
> -
>  	/*
>  	 * Set up transfer unit values and set controller state to send
>  	 * video.
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index b7abfedbf5749c25877a0b8ba3af3d8ed4b23d67..42745c912adbad7221c78f5cecefa730bfda1e75 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -18,7 +18,8 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9d2db9cbd2552470a36a63f70f517c35436f7280..5ac5dcf35b789f2bda052a2c17aae20aa48d8e18 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -831,7 +831,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	return 0;
>  }
>  
> -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
> +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
> +{
> +	int rc = 0;
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	bool force_link_train = false;
> +
> +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> +	if (msm_dp_display->prepared) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> +		return 0;
> +	}

How can it be prepared here? It is called at the beginning of the
.atomic_enable() only, so there is no way this can be true.

> +
> +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
> +	if (rc) {
> +		DRM_ERROR("failed to pm_runtime_resume\n");
> +		return rc;
> +	}
> +
> +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
> +		msm_dp_display_host_phy_init(dp);
> +		force_link_train = true;
> +	}
> +
> +	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
> +	if (!rc)
> +		msm_dp_display->prepared = true;
> +
> +	return rc;
> +}
> +
> +static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  {
>  	int rc = 0;
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> @@ -842,7 +872,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_l
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, force_link_train);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -872,13 +902,10 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
>  	return 0;
>  }
>  
> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> +static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *dp)
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
> -	if (!msm_dp_display->power_on)
> -		return 0;
> -
>  	/* wait only if audio was enabled */
>  	if (msm_dp_display->audio_enabled) {
>  		/* signal the disconnect event */
> @@ -889,6 +916,14 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	}
>  
>  	msm_dp_display->audio_enabled = false;
> +}
> +
> +static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> +{
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +
> +	if (!msm_dp_display->power_on)
> +		return 0;
>  
>  	if (dp->link->sink_count == 0) {
>  		/*
> @@ -1506,9 +1541,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
>  	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
>  	int rc = 0;
> +
>  	struct msm_dp_display_private *msm_dp_display;
> -	u32 hpd_state;
> -	bool force_link_train = false;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> @@ -1516,29 +1550,23 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		msm_dp_hpd_plug_handle(msm_dp_display, 0);
>  
>  	mutex_lock(&msm_dp_display->event_mutex);
> -	if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> -		DRM_ERROR("failed to pm_runtime_resume\n");
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
> -	}
>  
> -	hpd_state = msm_dp_display->hpd_state;
> -	if (hpd_state == ST_DISCONNECT_PENDING) {
> +	rc = msm_dp_display_prepare(msm_dp_display);
> +	if (rc) {
> +		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
>  		mutex_unlock(&msm_dp_display->event_mutex);
>  		return;
>  	}
>  
> -	if (hpd_state == ST_CONNECTED && !dp->power_on) {
> -		msm_dp_display_host_phy_init(msm_dp_display);
> -		force_link_train = true;
> -	}
> -
> -	msm_dp_display_enable(msm_dp_display, force_link_train);
> -
> -	rc = msm_dp_display_post_enable(dp);
> -	if (rc) {
> -		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -		msm_dp_display_disable(msm_dp_display);
> +	if (dp->prepared) {
> +		rc = msm_dp_display_enable(msm_dp_display);
> +		if (rc)
> +			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
> +		rc = msm_dp_display_post_enable(dp);
> +		if (rc) {
> +			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> +			msm_dp_display_disable(msm_dp_display);
> +		}
>  	}
>  
>  	/* completed connection */
> @@ -1560,6 +1588,20 @@ void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  }
>  
> +static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> +{
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +
> +	if (!msm_dp_display->prepared) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> +		return;
> +	}

Why/ how is it possible?

> +
> +	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> +
> +	msm_dp_display->prepared = false;
> +}
> +
>  void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  				       struct drm_atomic_state *state)
>  {
> @@ -1580,6 +1622,8 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  		drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
>  			   dp->connector_type, hpd_state);
>  
> +	msm_dp_display_audio_notify_disable(msm_dp_display);
> +
>  	msm_dp_display_disable(msm_dp_display);
>  
>  	hpd_state =  msm_dp_display->hpd_state;
> @@ -1588,9 +1632,10 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  		msm_dp_display->hpd_state = ST_DISCONNECTED;
>  	}
>  
> +	msm_dp_display_unprepare(msm_dp_display);
> +
>  	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
>  
> -	pm_runtime_put_sync(&dp->pdev->dev);
>  	mutex_unlock(&msm_dp_display->event_mutex);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index cc6e2cab36e9c0b1527ff292e547cbb4d69fd95c..2394840e9f28e136705004c3e6af93fbe13c33c5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -19,6 +19,7 @@ struct msm_dp {
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool prepared;
>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
