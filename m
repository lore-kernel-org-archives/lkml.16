Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66610E3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749473307; cv=none; b=uc3iRTIxpdfa0AAgL8DOtPsPyJ3qs187IFUJbG5buo2MjzSQnVyeyCVZ2iCmOOwl3X5ovvX7SBWTD88TYNibuSoYURj63yXXMa25QWrUkRFCYdESifiJo4Ytwd5DAF1tsrD8Fh/yk79JHFdI1pfQjwZfa8VAMvnpYLZldNzdz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749473307; c=relaxed/simple;
	bh=aacK6avPEmppWf0KrdU8v4CPVZ1owJ3o9wIfWYbfXoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvJEblAT4NcILdPJhJcluZfgPYRmmidfQNN7dEuVOMgJ4hGi9ObN52tg/2MqbnQdnJw9raDRIZ/wX4KWgkxKOW3giC3ikhBDqoJkQC5LF7vBGyEoIfe89JFV8K6EPghoefx6qA8Q2VZWYmE3aFuhXkqabeBcF42F7Dt5eNLbx9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppOgmj1U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppOgmj1U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599nK3q005324
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 12:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cyXFr9Y7VCghsyBDYdoliPS4
	dImMk/Plhfn+EfNGrh8=; b=ppOgmj1UytR9V80yaQB3qZgPIFTj4AMrsnGFWyHP
	556ZFaJ1ECNjt/F2UBKpHd0rKAfqkWFhxkWnG5BTJuwJvU1cisPUiyXCFls8k4uH
	ffiApl5ovhv7z4r8u5VY8kg6FPGjeX2PDrS3zVesCxvB1vaRx5Ur3SVfSe43RLfg
	9TM0OHQA4WIbf9xsvdvQwoszPJQKwloPbp6OP5eAV3Okw18dsrua4JX4oDJErXwa
	UM3ZX0ETmXsHvD49XvZdndBoLOd+2VgZBq11/zDu9tXRNd5NpuDKs7eEoC+2Qi5D
	DIkJumhx2GVAzMAMU7zdkaCnGQ2ybpUIw638pfz/XFyrxQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpns1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:48:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399070cecso85214285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 05:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749473303; x=1750078103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyXFr9Y7VCghsyBDYdoliPS4dImMk/Plhfn+EfNGrh8=;
        b=ECz2Z4v/i/IYSRvf6zkotGtgLL+4h6AOKspNzanpAw6iH3ZG5C7yLXNUaeDAoWq0FV
         31RES8IuCu5gaN+rRl+4mglQv6vnAWmxvtMm5Yo/om27cC2pwWxZde5TCd9kmYmKjMNP
         2siOk2f9v76X+LrBw4NNe2U5I7nebaYAdgZgWMbNr/b0lUUaEUIrqdCNau5ZnVO0tBI9
         uvxlv4T25nFIws8XsueCJ+MMmAqdqrZ4QQEwoAPqXq+jxS3PwQGFzcIzKp54QQ1dQSy1
         /mTlgN216cPLXCi0xEQKdyD9od+2LZHfgFETEux1EKVeRNUaZyQFQmluLrqv2Ig3NiF3
         kvUw==
X-Forwarded-Encrypted: i=1; AJvYcCVK7PREEZ3CWt6t9dBahnbjXs4itPo8G9+8bYPgYOrgKC2embRNbqkY0AsRrABkHHDgpHt+sh/6AZmNNwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNjUrACNz4csPmSAS9Z/P4N8YjAXqV1u/Fbt9Jo1evcu0mxp9W
	9nQmtg1NPNFJnm9tmpbS8wL1uBJ3uKkD0iAyPEDhDm4Ivt9JofFxB6rSv1Rj2xaOXKr5iV0Bb9V
	vp5CxIwkgqjUM+nuywHvEVL5vi4Lz4p60+v1LM/b9QgW2J/PeDeR7jN89V8PTUL6WKu0=
X-Gm-Gg: ASbGncv4wWi9E/H6XSsJj29ajhLBAEumefaoDCwYq76JEZPqLDZ56YZ2fV/CxehGE92
	rRY5ytmEMvyyXShtlUAJW+GU0TB12wbIUPCO2vB1Lhk4rEznpEJ6uQHL5TM8o+9GbAIyckg7wh9
	AB0lUvbE3QT6Qy7c9TIHOW4FbXFuLzKZebMDfom4GMYsxfGi4SxF6+UJAp4hOz/IG7lhHN9aPTK
	CXpStCBhrvKGrFnyhOZDWLIzr7KSNqBXtsjVzD51sqOoCkGNkQu/kmJ+xtxRzhIGIfhnc93Y+ut
	B49vbgMBbylxwPJKv2NKoU0vEFZTNLrqUusq4Qngi4xrJ/G0xDq0lDmBA083a8hltuCA2ZRg2ao
	=
X-Received: by 2002:a05:620a:31a3:b0:7d2:2a6:2dec with SMTP id af79cd13be357-7d22987e5a8mr2018509785a.30.1749473303327;
        Mon, 09 Jun 2025 05:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKm0NMJWSaZh2z/7vc6FgW1171qs+SXoa6vIis6CtV0cigHkuKg7hRjWnXTpnl2/Cl7Qaj4A==
X-Received: by 2002:a05:620a:31a3:b0:7d2:2a6:2dec with SMTP id af79cd13be357-7d22987e5a8mr2018503685a.30.1749473302861;
        Mon, 09 Jun 2025 05:48:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722172sm1154372e87.98.2025.06.09.05.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 05:48:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:48:19 +0300
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
Subject: Re: [PATCH v2 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
Message-ID: <kq6tb2wnte6v5z7uxgzc22kjwcevgvcdluzqbelvnbpbxlkotd@ltlv3u2guj4u>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846d818 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=LRmimyFsA7i-Op6yJAUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NSBTYWx0ZWRfX2Itf4IqYM108
 4qC2OOivmHu1D2GEt+oFwmhLeT4kzM8Mba9hzDHzQGnD5DhP+oDxDIP6qzu5cuOhwSCvclRJWxQ
 NwHWmzsXOZvdz397FgApCU12MSxtC/iOPnrUqs1HwOP/I++yWawmJ35KUabA7H/F19OLWiL83NN
 fcjYmUmatfd5ShfnEQhxA7A6l7Vwb0a5WQYBmtlcF6BAnfWn0g7qDsWFQdoCce/KOu1Gx7p6Zvs
 rYuNql1bZTbcisAVGCabInh5IflJNQYFkmo3PSWYKV9wvZzv19emacxXecZ5oFhwH26XtRobxmW
 3Q9ii7l1ykJsSzaMIqZX9xnEe+mvyehnjupoRdtsemj2vsEJQgJIMp8AHpzI+v71IPO1/MC7AnA
 YbgxPYxqNi0uillDgEaDI5yYzkCOZwlNPMJaANeLti4tscdV0btIuvJJw0v7x7c+Vi2MNkN7
X-Proofpoint-GUID: mpSLKY-28_CEQIaK2HbB4JUZmIlDx0um
X-Proofpoint-ORIG-GUID: mpSLKY-28_CEQIaK2HbB4JUZmIlDx0um
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090095

On Mon, Jun 09, 2025 at 08:21:21PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display caches the current display mode and then passes it onto
> the panel to be used for programming the panel params. Remove this
> two level passing and directly populated the panel's dp_display_mode
> instead.

- Why do we need to cache / copy it anyway? Can't we just pass the
  corresponding drm_atomic_state / drm_crtc_state / drm_display_mode ?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 76 ++++++++++++++-----------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4a9b65647cdef1ed6c3bb851f93df0db8be977af..9d2db9cbd2552470a36a63f70f517c35436f7280 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -92,7 +92,6 @@ struct msm_dp_display_private {
>  	struct msm_dp_panel   *panel;
>  	struct msm_dp_ctrl    *ctrl;
>  
> -	struct msm_dp_display_mode msm_dp_mode;
>  	struct msm_dp msm_dp_display;
>  
>  	/* wait for audio signaling */
> @@ -806,16 +805,29 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  }
>  
>  static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> -			       struct msm_dp_display_mode *mode)
> +				   const struct drm_display_mode *adjusted_mode,
> +				   struct msm_dp_panel *msm_dp_panel)
>  {
> -	struct msm_dp_display_private *dp;
> +	u32 bpp;
>  
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
> +
> +	if (msm_dp_display_check_video_test(msm_dp_display))
> +		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
> +	else
> +		bpp = msm_dp_panel->connector->display_info.bpc * 3;
> +
> +	msm_dp_panel->msm_dp_mode.bpp = bpp;
> +
> +	msm_dp_panel->msm_dp_mode.v_active_low =
> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
> +	msm_dp_panel->msm_dp_mode.h_active_low =
> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
> +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
> +		msm_dp_panel->vsc_sdp_supported;
>  
> -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
> -	dp->panel->msm_dp_mode.bpp = mode->bpp;
> -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> -	msm_dp_panel_init_panel_info(dp->panel);
> +	msm_dp_panel_init_panel_info(msm_dp_panel);
>  	return 0;
>  }
>  
> @@ -1431,10 +1443,13 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
>  bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
> +	dp_panel = dp->panel;
> +
> +	if (dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		return false;
>  
>  	return dp->wide_bus_supported;
> @@ -1496,10 +1511,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	bool force_link_train = false;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> -	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
> -		DRM_ERROR("invalid params\n");
> -		return;
> -	}
>  
>  	if (dp->is_edp)
>  		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> @@ -1517,15 +1528,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> -	if (rc) {
> -		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
> -	}

It should be done other way around: keep this call and drop
msm_dp_bridge_mode_set().

> -
> -	hpd_state =  msm_dp_display->hpd_state;
> -
>  	if (hpd_state == ST_CONNECTED && !dp->power_on) {
>  		msm_dp_display_host_phy_init(msm_dp_display);
>  		force_link_train = true;
> @@ -1604,33 +1606,13 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	msm_dp_panel = msm_dp_display->panel;
>  
> -	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> -
> -	if (msm_dp_display_check_video_test(dp))
> -		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> -	else /* Default num_components per pixel = 3 */
> -		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> -
> -	if (!msm_dp_display->msm_dp_mode.bpp)
> -		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
> -
> -	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
> -
> -	msm_dp_display->msm_dp_mode.v_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> -
> -	msm_dp_display->msm_dp_mode.h_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> -
> -	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> -		msm_dp_panel->vsc_sdp_supported;
> +	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
>  
>  	/* populate wide_bus_support to different layers */
> -	msm_dp_display->ctrl->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> -	msm_dp_display->catalog->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> +	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> +		false : msm_dp_display->wide_bus_supported;
> +	msm_dp_display->catalog->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> +		false : msm_dp_display->wide_bus_supported;
>  }
>  
>  void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
