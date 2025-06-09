Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D2F20E6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475012; cv=none; b=WQksrUEHKnlRw8yzqMOtQsZmQhVMOFIY3yVYeheyfy5AyUvBkepI8/zTDvyfbWvSyF4hKBZMN1GypfHtEY5Y/Xxy4KRmfgWFGJtC2yS6V0FY4zs7naHkZ5EEMEhq+Yt2773jzPWyT2834bt7HskiKV8gb4VwP6aSk5AiRV1F9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475012; c=relaxed/simple;
	bh=SEnRXnZBrmVsyVkM+B747eS64ZtiBqgwIx7V/UaqO14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O73YZM1eDilJ/r7OCinyvm7UGYWDVQdtaRfY9K2wCZ+WAT1G+TRqXW5fHNIy82em38/WfJxsnFcvpxySVb9TuTxNil6YfSOZTAu5WAf1FLmMszPCge8GT5ugBOPeytIJiblkhPlJ2fB6huOmmOjfo7kStzNQir2jo8WTDstFmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxRqhYtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxRqhYtI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993xKv016492
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 13:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LqafI7UpDS2G2nMa59iMzkyR
	7WPx8aM+c9eWQscV7b4=; b=MxRqhYtIwoD2339euRI1eVA5/1yoh2y6a3NGPpRh
	OTibOgclf8nstd3PPA30xWY3rVTqqmR4Y/EZ1Kgu+oc7QPWBJW6AkboMDP+OHuHw
	qIIyY6eG1ab744wQXZ8R7KRqFLPovgmGKOSoxFGzWrPktJFu8q8aoFaScztnNoex
	X23yyvwYox3jzQ7p0GpPskOdW6iX898aCWzrTs2u6S2r6QFBKQw9znEAu4IL+z93
	fhNXsWQIAeO2iRxOz0ZxOqvBDL395YrmZK/MsTt/zM6Ppv8lswrcBlAWp1zLd/9V
	nW1I5QBm8WRzIbholXtjHeO2JpuZIiZh3NwCETep3vz8aw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdwk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 13:16:49 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-403317cd1ffso1312341b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:16:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749475008; x=1750079808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqafI7UpDS2G2nMa59iMzkyR7WPx8aM+c9eWQscV7b4=;
        b=kJqx8lkMYvMta7NSmBjD7LyFy8rzQF0rwRsgPTuNP2ua+zZIiOcx84zPh/TFRGWq3r
         9rz7aYi41Hg8blIaPrdGpa0KQ3KjD/apPEMCydTc3qIBcX/cpoWnThdVnhm7Gj3rcTRY
         9/vMqKE6PHAed5a6IyH/xUiLjoDY5qlQuj2WFIOQM46Cn5wCfv4XWjyNdopBp1g3A/ju
         LwZyim1V3MlMU7ScMqP8ySh274WOdGARrXRGPxX2X3QQV4EZ90BtcMYocxSAvq4JlpHr
         h8F056Ze3NnFagyFY199Mj7kOLPTI0lO2XxSEa04qVaofb46uRrpGDjgxbfw0FZjWTd8
         HWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkrnsg21pfK0NlgZNzgzsi+kOcfmolS5gRpbRhcIPVSHjrR+KV6vEHEnT/e/14faodHMNUHlLSh1LBeyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMq5uObvvq6hzzubMSDJG4FCtbUe0Mm8JdJzmUxuAEosiyzYF
	3LpJTSwZSPDHCOnNQ7ExkNVjHqA0FqkoOrfIWZpVH2KHtrMwPj81jr9AWz0/pCM7alHXqBId7q2
	yCYzul9dTYPlFpyk8Ca78XFORsVy5Yw2uJ1Nr2a4IBQ1zux/iQKldYpI2Pzzn1f4DlSiyrPW6M1
	A=
X-Gm-Gg: ASbGnctsPchAFSMVj5yTwRLtiJGi91ypeuLpBGZfkmEDr/a1dPHPB2Oa1SB2yGbiblf
	5tTLO/1vovTB9L0FapH/ksyDwYIYVux1CWR9W078TnCtUQyaBwjZ9WJDSMiPT2K2H/EiTzzVs6M
	AFcVTsJDbEVF+vYpUtcL2/Cfh+TPgP0oXqZj3loY0JWYSeHIXTBa2tQZ5YPPT8Doe7Yw5aFzqdR
	LaiNiQyOy6q3Nr98to7Z8GmbYD2BCoJPBpFAMw4SFVpV0rgdufXRrPUJtFkhalQfHJyJ46ew4V+
	VQEoC6uEsiDszWmrtbYvplT4QdBBr0WLm93+eh7g5svepUrYHAmtkSaepC4P7gUQRjkgweTaEuE
	=
X-Received: by 2002:a05:6808:6f97:b0:407:a5b1:c1d4 with SMTP id 5614622812f47-40905125435mr9007522b6e.28.1749475007903;
        Mon, 09 Jun 2025 06:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdXJjdZDljViV4FdBjdzNy5cmzSfLLgDg6pGta3W3UTkuyEnx8yRKEOFsY04mEbYRFh+EByA==
X-Received: by 2002:a05:6830:6681:b0:72b:80b4:dbca with SMTP id 46e09a7af769-73888d9e9b4mr10164715a34.5.1749474996438;
        Mon, 09 Jun 2025 06:16:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a899sm1134523e87.170.2025.06.09.06.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:16:34 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:16:32 +0300
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
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NiBTYWx0ZWRfX3IydAehF9fKL
 Yy6KIQif0/wRWTYDJK0qW03RalDSV8DWunLU87sy4vBmlQd2t9tgHnwskUNsUYtvCuQBs/73VHy
 6r8gLXgiukV8GN7vPT5YfiAmstk6rmtQdA5rreLC6gaSpEs0kPvd35I3gtcTQKhSYSGd9cAIjvG
 Y2NziTpjlzmtfp+9XWs+d/nHKkLTiAt6kKQ2LKadbqKArDzAgiPEstNUMFeaqZncOvybzwSRyP+
 uY8RPP7bOf/rNoEQ8KVJiD8+EezW5k/b8Omv4WY9UJ6GnfIUioV6p+PnLXFRWiqAYzt2o24flPN
 BEqcp5tS7pyLz3I7Dx6UI2pQ+JyQD2wW388jr7BR+3BZxi1dLpMQ62+bCON5iSJgsykoJVhQRx9
 tgbgfHQxlrR/JUMW6+zu9UEFnmpFYhTVs3CCj7eo7Ue8t9CTYXN8XSyEJailWLMhmLraCVew
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846dec1 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Spwbhj-UJuWzIqB0iS8A:9 a=CjuIK1q_8ugA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 28F8NuCGhBxDW8m18PUu_S_yZ1wKEkBO
X-Proofpoint-ORIG-GUID: 28F8NuCGhBxDW8m18PUu_S_yZ1wKEkBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090096

On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
>  
>  	bool core_clks_on;
>  	bool link_clks_on;
> -	bool stream_clks_on;
> +	bool pixel_clks_on;

As you are touching this part, how many paths lead to pixel clock being
enabled and/or disabled? Can we sort them out and drop this flag, making
sure that the clock can be enabled only in one place and disabled in
another one (hopefully)?

>  };
>  
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->core_clks_on = true;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  
> @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->core_clks_on = false;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  }
> @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->link_clks_on = true;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  
> @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
>  	ctrl->link_clks_on = false;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> -		   str_on_off(ctrl->stream_clks_on),
> +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> +		   str_on_off(ctrl->pixel_clks_on),
>  		   str_on_off(ctrl->link_clks_on),
>  		   str_on_off(ctrl->core_clks_on));
>  }
> @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> +{
> +	int ret;
> +
> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	if (ret) {
> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (ctrl->pixel_clks_on) {
> +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> +	} else {
> +		ret = clk_prepare_enable(ctrl->pixel_clk);
> +		if (ret) {
> +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +			return ret;
> +		}
> +		ctrl->pixel_clks_on = true;
> +	}
> +
> +	return ret;
> +}
> +
> +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (ctrl->pixel_clks_on) {
> +		clk_disable_unprepare(ctrl->pixel_clk);
> +		ctrl->pixel_clks_on = false;
> +	}
> +}
> +
>  static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>  						struct msm_dp_panel *msm_dp_panel)
>  {
> @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	}
>  
>  	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> -	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		return ret;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			return ret;
> -		}
> -		ctrl->stream_clks_on = true;
> -	}
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  
>  	msm_dp_ctrl_send_phy_test_pattern(ctrl);
>  
> @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  		   ctrl->link->link_params.num_lanes);
>  
>  	drm_dbg_dp(ctrl->drm_dev,
> -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
>  
>  	if (!ctrl->link_clks_on) { /* link clk is off */
>  		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
>  
> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>  	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> -		goto end;
> -	}
> -
> -	if (ctrl->stream_clks_on) {
> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> -	} else {
> -		ret = clk_prepare_enable(ctrl->pixel_clk);
> -		if (ret) {
> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> -			goto end;
> -		}
> -		ctrl->stream_clks_on = true;
> +		DRM_ERROR("failed to enable pixel clk\n");
> +		return ret;
>  	}
>  
>  	/*
> @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	drm_dbg_dp(ctrl->drm_dev,
>  		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>  
> -end:
>  	return ret;
>  }
>  
> @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_catalog_ctrl_reset(ctrl->catalog);
>  
> -	if (ctrl->stream_clks_on) {
> -		clk_disable_unprepare(ctrl->pixel_clk);
> -		ctrl->stream_clks_on = false;
> -	}
> +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
>  
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
