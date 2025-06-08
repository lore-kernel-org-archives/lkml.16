Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4473FC2
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404701; cv=none; b=KwzAblDImmaUTDmW1Ubm5OlvK+YO+W9+Df/nSrDocLvn1GzsShXgHzSzkx6vBAsbjTiorFsq6VnO//+tTTozMLnzvfSoJo918iMvmoY/c0UOuDgpeL2ZNQ5IA+7WCry6eWSmRxuU7pojeadNxJC6Cr/LQlS5rVzEMDa6Nh5xhDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404701; c=relaxed/simple;
	bh=zHxGndja7EUCcLwLivRSfUJ0okaIG1Hr0LrIxVs+M/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgBZNIMRHqhBR/74Y/U6hZY+XzG9xOBFUBVdfTv1rp7fMgXazfkmlUra+7y0DG0yWk/34GncIl4l1i90TzXq79jMaTe0Hxxi5GRKM26NUr3/D3DYiYxdgbqwLfmSJE9LmSbJvbDKBjp5FPovOHnVbBTk4POFL8beDIXlBAPr9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WwQUSQqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WwQUSQqH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558BNxIS011732
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 17:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lwumj0nKYwT/9NMESOlLb3e4
	yFC8WfoyMbLUXrUE/AE=; b=WwQUSQqH3QjtOGESXsw+QzYjTIKW6Zkuhak2F7TI
	g31KEioGn1HDOqLoZoEgeQU9K6fr1UbSr0YLOnfxYYp2WSgJ42NOHXAyNg+A20ZG
	jEj4A5exnBt6ni9aYAQxKlWwzz2ppzn6wZB7YX/26+MbMgdQF7/oB5msP1P9bwrt
	ZeWhgdgHxkIjLxdYnUIuVtgiYPxHql59Vo8cpAv8lcovxkMEHo1bPOKsniChk+1+
	cNYa5DtNB4w/hm/t+9RV7CQ+U4gdgINoqeYWRTwyIDx6et+0jzFfWvueFdbWHOWt
	hwvoP/pafvjbMMpLoIuXfrRYSSuWXqLXQiq5/2hEEQQUSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jbbcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 17:44:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so581626985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 10:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749404697; x=1750009497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwumj0nKYwT/9NMESOlLb3e4yFC8WfoyMbLUXrUE/AE=;
        b=cx6JRXzLOGWm3rDWKF6eOLf9aQXqliPIIes10IVwO/9peu5icZY5d7drl3FGVyAsn4
         YEFvmU66pT9z3U755iRigiMUVz5RWeUZM4Wlke9Ve6NF5t0/dyZZokXk5zihAifDu1mL
         Xsv1AI3SOHArgRVsaXHwIYw4Gl2da8mR0xqt71IO3VGVgBE/+8rdHcMLpMW4v0IW6kRW
         NMZN42PfGzb20LKSihj+9nrAv3ATWCrLnUSHzeGSAksRhH3ZHyLQBn0G4UNiOv1CZmR6
         PvtECkHIz2Y/qQp+Vv6Qdaafe1i7e2wBsuEawEvu04cHdMJRzNwFqiTs63cOAf9yk7+p
         wdLg==
X-Forwarded-Encrypted: i=1; AJvYcCVWPOGHxHtLz24FLfuIC3paS67vYyfoYs3YM6Xg8038Fi0Z4+CwV9HiMsDWUWDcB1EixUj2DPz635yt/7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLsG+E1M5u6mfD1Dwa0NudSSh1S+e6r+snDxk4zr697bpQX7z
	vEalNPRxvWzhcuG4HkSnLuJn/eS6QCS3VhjI5ArdcXvxjrlGp+F90raZ1zW4zDR+aSb272Bpipp
	pBnBY6zzUz2nxtxT6oIpshh2x1jI5CGqFWpcHAnndvLbqAKcyuoo873S0hPJVhuOMrro=
X-Gm-Gg: ASbGnct5evt2/MvQVm/eqXEBofbRF9KgYsPMfMONP+W7dFeIJJIIHchoWDVEdv7qGZX
	VaZKnyUmaE5uIkj6UwBJetca+YW8PGNlo3mJ724DBjc4Oiu0gQl8MVlSgWy9OdLqpm4+2JMyLCf
	h14mYGyBfgQk1kL9isMbccrgQHmrZdnLu6Mb1IETLdEVKjL/VDCnQaMCjj0e81a+x7BZ4y4JWg0
	ZRZhjcD+Zn5kZxq42AmLnpCW0wkSEnNcwMS5VFivB5fwFoZE4bfRlK/R5BNAETEc8liSOwZl6pV
	2vbvzqlq1WH+w9fuRoS5l/bAMOmZAnoStroGI1Elk23lkDb9bEl3fbZBjx128nP+bOBc2GnLlNI
	=
X-Received: by 2002:a05:620a:44c8:b0:7c9:13a0:b014 with SMTP id af79cd13be357-7d2298af969mr1302425085a.14.1749404697161;
        Sun, 08 Jun 2025 10:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhbbGYZ48nsDcqh8rxKoOlht9ZnLBV8irI0y94sxQzXpJjq/HdPFd/ksEWxm6lOz8fQf60Qg==
X-Received: by 2002:a05:620a:44c8:b0:7c9:13a0:b014 with SMTP id af79cd13be357-7d2298af969mr1302421385a.14.1749404696681;
        Sun, 08 Jun 2025 10:44:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm842768e87.186.2025.06.08.10.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 10:44:54 -0700 (PDT)
Date: Sun, 8 Jun 2025 20:44:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        l.stach@pengutronix.de, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <cvbmmyryay65aqusf5z23cgary4gpoimuav73la4r5hc4jtndg@grvdn2rvhir4>
References: <20250526120742.3195812-1-damon.ding@rock-chips.com>
 <20250526120742.3195812-4-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526120742.3195812-4-damon.ding@rock-chips.com>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6845cc1a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s8YR1HE3AAAA:8 a=mjBGZgKfsVH4ayGyPNkA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: 69ySEtkjWHVIYbw3xlx7-zUW2fJPoJpZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE0MyBTYWx0ZWRfX78UiooKvPx7C
 dUi/u+RsrVTkm4WzfwMR4Ux1I0ONBuulzBJrbVgcIQBbF9FxB3tJXxiVcTrrk7UoW0mI1gwNKyh
 GOi9MlZr0F4EmMD8XQ3T8o95y7V5CYjbdI4JECJBiCO3UXOqgpN1pplIsabawevZRcmgU4NJva9
 bc7sSDxO1i3dIUH9NTCxVWFtbYkt+Mm62WqviOa93qHtCuC4GZ9g2+5JALCYoviPgYG9pxRIEC1
 ztOZI5xnrBgFzzS0zyEu2SGVkI1cJ43qjdzFqoZCqwiPVFTaixyPc3gYoQuZNk7Eyx9p9Eim+AQ
 KhUrOSVyO3S7hC3w+Geha19BMTKA15+6F/oyQIMW+nydVwVn26VFul3Kh1Wa1MDQb8GGl4gCKDe
 QMVa2SCs/Gzb/QrxqEOOdIablZF0FdGjWuiSZgzxRcaU7Z1QVLeXOjdJyPSUT37gJOa0ZKSF
X-Proofpoint-GUID: 69ySEtkjWHVIYbw3xlx7-zUW2fJPoJpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080143

On Mon, May 26, 2025 at 08:07:42PM +0800, Damon Ding wrote:
> Apply drm_bridge_connector helper for Analogix DP driver.
> 
> The following changes have been made:
> - Remove &analogix_dp_device.connector and change
>   &analogix_dp_device.bridge from a pointer to an instance.
> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>   and &drm_connector_helper_funcs.
> - Remove &analogix_dp_plat_data.skip_connector.

You've missed the exynos_dp.c which uses it.

I think there is slightly more to be handled here. For example, I'd
suggest moving panel / bridge parsing and attachment to the core driver
too. Exynos handles several backwards-compatibility cases, e.g. using
the "panel" property or just passing video timings in the DT node. You
might need to implement instantiating a panel from videomode specially
for exynos_dp.c

This would allow you to cleanup plat_data interface as a preparation for
this patch.

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 157 ++++++++----------
>  .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
>  include/drm/bridge/analogix_dp.h              |   1 -
>  3 files changed, 72 insertions(+), 90 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 2c51d3193120..d67afd63d999 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -22,6 +22,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
> @@ -946,9 +947,10 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>  	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>  }
>  
> -static int analogix_dp_get_modes(struct drm_connector *connector)
> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge,
> +					struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	const struct drm_edid *drm_edid;
>  	int num_modes = 0;
>  
> @@ -957,10 +959,10 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>  	} else {
>  		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>  
> -		drm_edid_connector_update(&dp->connector, drm_edid);
> +		drm_edid_connector_update(connector, drm_edid);
>  
>  		if (drm_edid) {
> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
> +			num_modes += drm_edid_connector_add_modes(connector);
>  			drm_edid_free(drm_edid);
>  		}
>  	}

This should be split into get_modes() and edid_read(). Use
DRM_BRIDGE_OP_ flags to control which implementation is actually being
used.


> @@ -971,51 +973,25 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>  	return num_modes;
>  }
>  
> -static struct drm_encoder *
> -analogix_dp_best_encoder(struct drm_connector *connector)
> +static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *bridge_state,
> +					   struct drm_crtc_state *crtc_state,
> +					   struct drm_connector_state *conn_state)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> -
> -	return dp->encoder;
> -}
> -
> -
> -static int analogix_dp_atomic_check(struct drm_connector *connector,
> -				    struct drm_atomic_state *state)
> -{
> -	struct analogix_dp_device *dp = to_dp(connector);
> -	struct drm_connector_state *conn_state;
> -	struct drm_crtc_state *crtc_state;
> -
> -	conn_state = drm_atomic_get_new_connector_state(state, connector);
> -	if (WARN_ON(!conn_state))
> -		return -ENODEV;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  
>  	conn_state->self_refresh_aware = true;
>  
> -	if (!conn_state->crtc)
> -		return 0;
> -
> -	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> -	if (!crtc_state)
> -		return 0;
> -
>  	if (crtc_state->self_refresh_active && !dp->psr_supported)
>  		return -EINVAL;
>  
>  	return 0;
>  }
>  
> -static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
> -	.get_modes = analogix_dp_get_modes,
> -	.best_encoder = analogix_dp_best_encoder,
> -	.atomic_check = analogix_dp_atomic_check,
> -};
> -
>  static enum drm_connector_status
> -analogix_dp_detect(struct drm_connector *connector, bool force)
> +analogix_dp_bridge_detect(struct drm_bridge *bridge)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
>  	if (dp->plat_data->panel)
> @@ -1027,20 +1003,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>  	return status;
>  }
>  
> -static const struct drm_connector_funcs analogix_dp_connector_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.detect = analogix_dp_detect,
> -	.destroy = drm_connector_cleanup,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
>  static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  				     struct drm_encoder *encoder,
>  				     enum drm_bridge_attach_flags flags)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	struct drm_connector *connector = NULL;
>  	int ret = 0;
>  
> @@ -1049,23 +1016,15 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (!dp->plat_data->skip_connector) {
> -		connector = &dp->connector;
> -		connector->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -		ret = drm_connector_init(dp->drm_dev, connector,
> -					 &analogix_dp_connector_funcs,
> -					 DRM_MODE_CONNECTOR_eDP);
> -		if (ret) {
> -			DRM_ERROR("Failed to initialize connector with drm\n");
> -			return ret;
> -		}
> -
> -		drm_connector_helper_add(connector,
> -					 &analogix_dp_connector_helper_funcs);
> -		drm_connector_attach_encoder(connector, encoder);
> +	connector = drm_bridge_connector_init(dp->drm_dev, encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "Failed to initialize connector with drm\n");
> +		return ret;
>  	}
>  
> +	drm_connector_attach_encoder(connector, encoder);
> +
>  	/*
>  	 * NOTE: the connector registration is implemented in analogix
>  	 * platform driver, that to say connector would be exist after
> @@ -1124,7 +1083,7 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
>  static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>  						 struct drm_atomic_state *old_state)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state;
>  
> @@ -1177,14 +1136,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
>  }
>  
>  static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
> +					struct drm_atomic_state *state,
>  					const struct drm_display_mode *mode)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> -	struct drm_display_info *display_info = &dp->connector.display_info;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	struct video_info *video = &dp->video_info;
>  	struct device_node *dp_node = dp->dev->of_node;
> +	struct drm_connector *connector;
> +	struct drm_display_info *display_info;
>  	int vic;
>  
> +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (!connector)
> +		return;
> +	display_info = &connector->display_info;
> +
>  	/* Input video interlaces & hsync pol & vsync pol */
>  	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
>  	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
> @@ -1255,7 +1221,7 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
>  static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  					     struct drm_atomic_state *old_state)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	int timeout_loop = 0;
> @@ -1268,7 +1234,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
>  	if (!new_crtc_state)
>  		return;
> -	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
> +	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
>  
>  	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
>  	/* Not a full enable, just disable PSR and continue */
> @@ -1297,7 +1263,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>  
>  static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  
>  	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>  		return;
> @@ -1320,7 +1286,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>  static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>  					      struct drm_atomic_state *old_state)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	struct drm_crtc *old_crtc, *new_crtc;
>  	struct drm_crtc_state *old_crtc_state = NULL;
>  	struct drm_crtc_state *new_crtc_state = NULL;
> @@ -1358,7 +1324,7 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>  static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  						   struct drm_atomic_state *old_state)
>  {
> -	struct analogix_dp_device *dp = bridge->driver_private;
> +	struct analogix_dp_device *dp = to_dp(bridge);
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *new_crtc_state;
>  	int ret;
> @@ -1384,24 +1350,27 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
>  	.atomic_enable = analogix_dp_bridge_atomic_enable,
>  	.atomic_disable = analogix_dp_bridge_atomic_disable,
>  	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
> +	.atomic_check = analogix_dp_bridge_atomic_check,
>  	.attach = analogix_dp_bridge_attach,
> +	.get_modes = analogix_dp_bridge_get_modes,
> +	.detect = analogix_dp_bridge_detect,
>  };
>  
>  static int analogix_dp_create_bridge(struct drm_device *drm_dev,
>  				     struct analogix_dp_device *dp)
>  {
> -	struct drm_bridge *bridge;
> -
> -	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
> -	if (!bridge) {
> -		DRM_ERROR("failed to allocate for drm bridge\n");
> -		return -ENOMEM;
> -	}
> +	struct drm_bridge *bridge = &dp->bridge;
> +	int ret;
>  
> -	dp->bridge = bridge;
> +	bridge->ops = DRM_BRIDGE_OP_DETECT |
> +		      DRM_BRIDGE_OP_HPD |
> +		      DRM_BRIDGE_OP_MODES;
> +	bridge->of_node = dp->dev->of_node;
> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
>  
> -	bridge->driver_private = dp;
> -	bridge->funcs = &analogix_dp_bridge_funcs;
> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> +	if (ret)
> +		return ret;
>  
>  	return drm_bridge_attach(dp->encoder, bridge, NULL, 0);
>  }
> @@ -1493,9 +1462,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
> -	if (!dp)
> -		return ERR_PTR(-ENOMEM);
> +	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
> +				   &analogix_dp_bridge_funcs);
> +	if (IS_ERR(dp))
> +		return ERR_CAST(dp);
>  
>  	dp->dev = &pdev->dev;
>  	dp->dpms_mode = DRM_MODE_DPMS_OFF;
> @@ -1670,8 +1640,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
>  
>  void analogix_dp_unbind(struct analogix_dp_device *dp)
>  {
> -	analogix_dp_bridge_disable(dp->bridge);
> -	dp->connector.funcs->destroy(&dp->connector);
> +	analogix_dp_bridge_disable(&dp->bridge);
>  
>  	drm_panel_unprepare(dp->plat_data->panel);
>  
> @@ -1681,7 +1650,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>  
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
>  
>  	if (!connector->state->crtc) {
>  		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
> @@ -1689,13 +1659,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
>  		return -EINVAL;
>  	}
>  
> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;

This requires that Analogix is the first bridge in the chain. It might
be better to loop through all bridges, checking for one with matching
ops.

I'll check, maybe we have other bridges which can generate CRC data. If
so, we can add DRM_BRIDGE_OP_CRC interface and loop that through
drm_bridge_connector.

> +
> +	dp = to_dp(bridge);
> +
>  	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>  }
>  EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>  
>  int analogix_dp_stop_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp = to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
> +
> +	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp = to_dp(bridge);
>  
>  	return drm_dp_stop_crc(&dp->aux);
>  }
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 9f9e492da80f..22f28384b4ec 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -10,6 +10,7 @@
>  #define _ANALOGIX_DP_CORE_H
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  
>  #define DP_TIMEOUT_LOOP_COUNT 100
> @@ -153,8 +154,7 @@ struct analogix_dp_device {
>  	struct drm_encoder	*encoder;
>  	struct device		*dev;
>  	struct drm_device	*drm_dev;
> -	struct drm_connector	connector;
> -	struct drm_bridge	*bridge;
> +	struct drm_bridge	bridge;
>  	struct drm_dp_aux	aux;
>  	struct clk		*clock;
>  	unsigned int		irq;
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> index cf17646c1310..cb9663ff61fb 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -29,7 +29,6 @@ struct analogix_dp_plat_data {
>  	struct drm_panel *panel;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
> -	bool skip_connector;
>  
>  	int (*power_on)(struct analogix_dp_plat_data *);
>  	int (*power_off)(struct analogix_dp_plat_data *);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
