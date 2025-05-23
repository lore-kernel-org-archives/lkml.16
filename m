Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1031DED77
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748038654; cv=none; b=tuznSMjp9UqL2sGdbpX7u51g1iwUAvQAF4XvRXUjAM1fH46GsKxOL53q/Ck9O79jHryYVZFrV4nV6SqMKM5Yqzovv3/Qr3e6RiL142DK4xOY+qE2RRIFGOII+EZuGqMa3RwU5NRT59S2FhWtLxz6R3+Xs11w1rAvgQocmfP9VTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748038654; c=relaxed/simple;
	bh=fF8Kql1t9IPWnDqZ+WeQRLoLYhr4KY8xC2JaRWwT+bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZ6DcgyqVkxk5nUOZy0Z88yfiVPTegW0aMY5moUKXeAZvjwjsvypiL4QndyW+4wMddmMGxORUgMELc+rOC9y1uuep26q7JrQDyb9XRc8/hUkEF3A2VSXxHv8VoEdkkZDbYoPmAEt0zdKo15z7kllsr3LRH/suAjBgMfEjjNJTuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcbfcW7t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcbfcW7t"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFJgrr002645
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WYoA/T0pbrAIwzVvOvAoPA0a
	sWwy3PVbJjqY9vzmT/4=; b=bcbfcW7tckSFh/cPJ1kGGCW9UWU1SJw4zPdM+iFr
	0yupfyhdi/19PNH4p45V/NKfGa/QZMgeRotCD9+AI9GZnVIDKZt3kNm7VkZqaQkZ
	mVYrBbxumEW0IKGuWSwb4YAqKlQoFsuF5Ew6P1X+woA8ssSMOI9msjim+mNTBxaS
	lu0XxT8elXJU0+Gl8qSxIHnQ3YuzDSqrGw04RUyIQNBzLmzP4bt5v9Fot/jY+bmo
	gCqNfSpagU7THCU9eYA1Pd89LP0DsQ4WOc062W9GiW/WYZttXtrFke7nVtCSa/yd
	PRspn2gqT8A0Hz6tsXgHLsB1dPOy6Crm+hFZLxY0YfdS3Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tsmsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:17:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b2f0ab27so4304786d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748038650; x=1748643450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYoA/T0pbrAIwzVvOvAoPA0asWwy3PVbJjqY9vzmT/4=;
        b=oTlE7kAzYuiiPLYtxDexhv9jYd/pdp8xMJhYn1SC9m2NuWyQyjPQba+er46IQOQSYX
         t39uowZdtlQeXfplSvET1RvmewX9j1KW98++iud2VIHKRcHF8ysfQiKKlqq1iW2Rsamq
         zKYo6jDMS2fnbI5Uqj8u8zE8wFG2SXh2oXcxLM5Q7vgkH49YOokzksy37QpGBZFDL9Ix
         2ratsWLKNyNGilLNWtB/hdjC8HvodfzOE6dbsR7xfmi1KMx0BengwDbILSGTj9mXaZI/
         ny7ieKjagxuQbynA+ZS3OoBVFZwYUu4XPhljAT1RYz2sgFXb54zrrXbhChP6SIXH8ipS
         ooGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6bJiYZZPpHh8Hr2H9Z7WrC1LYlERvOkHYYuXB85jl5Imy+oH2+F3AsKvhP/v4pVmpulGirIMCKWhc48o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPEAk93nNDjX+iCZNirmxxjba2nuCIpAfA8bmnygwi/3wKShhE
	W/vu1njaTxR0M0h9ySaht0+anzF/WihKO0MHP4h6iPZ1yl11bbfovS8YrMWUqB97Pyp1wyn2lo5
	kOcPN4jxZcjthCzHFP0D2SrcNM7sk+G6ElTsf8r1mU1bd8TNvcYYWnB8xJ+gE2hENodc=
X-Gm-Gg: ASbGncuDiittutGgxERmY5sFVU6CQWVPMs/UCLFxY1l5OYuZlI6xGaXlGBtixIrPN9h
	rvi46Uk4PpFgeUlmolWf/TqQgHTC+hLlWZ/wQAQCP0ztJVf/IS9fjXoPvdryjE4iijQ1qMEfpW0
	37KO1G4+WBk/T33EIN5y2uYlIh7JZXl3L/SC2gXxwcEXjxJj3yJSSlSvjPLCY8lrCycoZSOhW4A
	WTpSkQAZeMTklyt1wbXikvbCjRMRumzJT6wYOKcHNIb5oc5cOMt6ZxVtlMsXcGNbMc2biXYpS5N
	jOj8iNnlJPu+QUNMwXnWjplTiof7JD959651y8XjwSdrCyz6tHjBQqoZM/bVYudJ/xFMdsb9W9g
	=
X-Received: by 2002:ad4:4ea2:0:b0:6f9:51af:ddf0 with SMTP id 6a1803df08f44-6fa9ce36d60mr21454556d6.0.1748038649708;
        Fri, 23 May 2025 15:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkLUpkA/yijw4XmCnZmCYO0gydNMmduAz3RCCS/KZd9uIkmTONQSGNBocQk6eLPNbgKF0hbA==
X-Received: by 2002:ad4:4ea2:0:b0:6f9:51af:ddf0 with SMTP id 6a1803df08f44-6fa9ce36d60mr21454116d6.0.1748038649196;
        Fri, 23 May 2025 15:17:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8d24sm36847971fa.26.2025.05.23.15.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 15:17:28 -0700 (PDT)
Date: Sat, 24 May 2025 01:17:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v2] drm/rockchip: cdn-dp: Convert to drm bridge
Message-ID: <ht7irlxoixjca5a6ljekgzqy7ztcgu3mahi5v45v5qjrluny75@nzbqei6pgenn>
References: <20250523011310.120-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523011310.120-1-kernel@airkyi.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830f3fa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=ePr-TV-LAAAA:8 a=s8YR1HE3AAAA:8
 a=dJa1r4FWIukFBr4GutcA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=uGDpjx9DKq9E8W49yboe:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: B-mtzCskg-qTp9QB0p_TWO93nc9AYhkk
X-Proofpoint-GUID: B-mtzCskg-qTp9QB0p_TWO93nc9AYhkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDIwNCBTYWx0ZWRfXzkOZnV3eI42q
 PFKPGDq3LkRRoOi5DkuITuh5I8T6AhbpafZ8zmOm3L8YEuu/fawZXQiPoTIWLSMJEYV38RgTAWz
 0ITmvraAFI8A2BVRnVr4nXQvjmYpm+HtX3V3g7VPq5ghMhULEtGusjWkst3+yMAGVugqfm1sZPm
 Q7V552/w3vPzdihTuzPcX0VJW7owu8j8WhsT4J4Yl2YedMNOwAqiJ0Y2NcvWRIoTz8QP/K6AOL0
 ZNEAeJkMY0EedvuyF8n0vts6CIgbYj09LWvHq6sYd3uncHkMh/wkpst7kWmPVCF+O8dMKHvPQmy
 6NZXWyfFAd8+qXuCdMgUa6/4A9Euha2If341J7a3C/XAYHAZ+3Clag4xGTs+cSmE2gfdLY8sj2t
 1DCOKiJiH0uRwjTKSWjjQR2leaqAa1tn0jkjf4RAA+RgG9GkORnu7347SOFKNl77t+Pe6raq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230204

On Fri, May 23, 2025 at 09:13:10AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Considering that some code depend on the connector, the following
> changes have been made:
> - Do not get edid in cdn_dp_get_sink_capability() when connector is
> not present.
> - Update bpc info in cdn_dp_bridge_atomic_enable() instead of
> cdn_dp_encoder_mode_set(). Actually, the bpc data will be used in
> cdn_dp_bridge_atomic_enable().
> 
> This patch also convert to use devm_drm_bridge_alloc() API.
> 
> Tested with RK3399 EVB IND board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Link to V1: https://lore.kernel.org/all/20250507035148.415-1-kernel@airkyi.com/
> - Use drm_atomic_get_new_connector_for_encoder() to get connector
> - Convert to use devm_drm_bridge_alloc() API
> - Fix typo: cdn_dp_connector_edid_read -> cdn_dp_bridge_edid_read
> 
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 204 +++++++++++++------------
>  drivers/gpu/drm/rockchip/cdn-dp-core.h |   5 +-
>  2 files changed, 112 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index 292c31de18f1..848f47d41111 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -25,9 +25,9 @@
>  #include "cdn-dp-core.h"
>  #include "cdn-dp-reg.h"
>  
> -static inline struct cdn_dp_device *connector_to_dp(struct drm_connector *connector)
> +static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
>  {
> -	return container_of(connector, struct cdn_dp_device, connector);
> +	return container_of(bridge, struct cdn_dp_device, bridge);
>  }
>  
>  static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
> @@ -231,9 +231,9 @@ static bool cdn_dp_check_sink_connection(struct cdn_dp_device *dp)
>  }
>  
>  static enum drm_connector_status
> -cdn_dp_connector_detect(struct drm_connector *connector, bool force)
> +cdn_dp_bridge_detect(struct drm_bridge *bridge)
>  {
> -	struct cdn_dp_device *dp = connector_to_dp(connector);
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>  	enum drm_connector_status status = connector_status_disconnected;
>  
>  	mutex_lock(&dp->lock);
> @@ -244,41 +244,25 @@ cdn_dp_connector_detect(struct drm_connector *connector, bool force)
>  	return status;
>  }
>  
> -static void cdn_dp_connector_destroy(struct drm_connector *connector)
> +static const struct drm_edid *
> +cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
>  {
> -	drm_connector_unregister(connector);
> -	drm_connector_cleanup(connector);
> -}
> -
> -static const struct drm_connector_funcs cdn_dp_atomic_connector_funcs = {
> -	.detect = cdn_dp_connector_detect,
> -	.destroy = cdn_dp_connector_destroy,
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -static int cdn_dp_connector_get_modes(struct drm_connector *connector)
> -{
> -	struct cdn_dp_device *dp = connector_to_dp(connector);
> -	int ret = 0;
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> +	const struct drm_edid *drm_edid;
>  
>  	mutex_lock(&dp->lock);
> -
> -	ret = drm_edid_connector_add_modes(connector);
> -
> +	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
>  	mutex_unlock(&dp->lock);

I know that the lock has been here. What does it protect here?

>  
> -	return ret;
> +	return drm_edid;
>  }
>  
>  static enum drm_mode_status
> -cdn_dp_connector_mode_valid(struct drm_connector *connector,
> -			    const struct drm_display_mode *mode)
> +cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
> +			 const struct drm_display_info *display_info,
> +			 const struct drm_display_mode *mode)
>  {
> -	struct cdn_dp_device *dp = connector_to_dp(connector);
> -	struct drm_display_info *display_info = &dp->connector.display_info;
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>  	u32 requested, actual, rate, sink_max, source_max = 0;
>  	u8 lanes, bpc;
>  
> @@ -323,11 +307,6 @@ cdn_dp_connector_mode_valid(struct drm_connector *connector,
>  	return MODE_OK;
>  }
>  
> -static struct drm_connector_helper_funcs cdn_dp_connector_helper_funcs = {
> -	.get_modes = cdn_dp_connector_get_modes,
> -	.mode_valid = cdn_dp_connector_mode_valid,
> -};
> -
>  static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
>  {
>  	int ret;
> @@ -360,7 +339,8 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
>  
>  static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
>  {
> -	const struct drm_display_info *info = &dp->connector.display_info;
> +	struct drm_connector *connector = dp->connector;
> +	const struct drm_display_info *info;
>  	int ret;
>  
>  	if (!cdn_dp_check_sink_connection(dp))
> @@ -373,10 +353,15 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
>  		return ret;
>  	}
>  
> +	if (!connector)
> +		return 0;

Just pass connector directly as an argument.

> +
> +	info = &connector->display_info;
> +
>  	drm_edid_free(dp->drm_edid);
> -	dp->drm_edid = drm_edid_read_custom(&dp->connector,
> +	dp->drm_edid = drm_edid_read_custom(dp->connector,
>  					    cdn_dp_get_edid_block, dp);
> -	drm_edid_connector_update(&dp->connector, dp->drm_edid);
> +	drm_edid_connector_update(dp->connector, dp->drm_edid);
>  
>  	dp->sink_has_audio = info->has_audio;
>  
> @@ -416,11 +401,11 @@ static int cdn_dp_enable_phy(struct cdn_dp_device *dp, struct cdn_dp_port *port)
>  		goto err_power_on;
>  	}
>  
> -	ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
> -				  EXTCON_PROP_USB_TYPEC_POLARITY, &property);
> -	if (ret) {
> -		DRM_DEV_ERROR(dp->dev, "get property failed\n");
> -		goto err_power_on;
> +		ret = extcon_get_property(port->extcon, EXTCON_DISP_DP,
> +					EXTCON_PROP_USB_TYPEC_POLARITY, &property);

The indentation here is strange. Could you please doubltcheck it?

> +		if (ret) {
> +			DRM_DEV_ERROR(dp->dev, "get property failed\n");
> +			goto err_power_on;
>  	}
>  
>  	port->lanes = cdn_dp_get_port_lanes(port);
> @@ -551,21 +536,8 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
>  				    struct drm_display_mode *adjusted)
>  {
>  	struct cdn_dp_device *dp = encoder_to_dp(encoder);
> -	struct drm_display_info *display_info = &dp->connector.display_info;
>  	struct video_info *video = &dp->video_info;
>  
> -	switch (display_info->bpc) {
> -	case 10:
> -		video->color_depth = 10;
> -		break;
> -	case 6:
> -		video->color_depth = 6;
> -		break;
> -	default:
> -		video->color_depth = 8;
> -		break;
> -	}
> -

I'd suggest to perform this part in additional step, especially if you
keep an always-assigned dp->connector for a few commits.

>  	video->color_fmt = PXL_RGB;
>  	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
>  	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
> @@ -599,12 +571,31 @@ static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
>  		dp->plugged_cb(dp->codec_dev, plugged);
>  }
>  
> -static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
> +static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
>  {
> -	struct cdn_dp_device *dp = encoder_to_dp(encoder);
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> +	struct video_info *video = &dp->video_info;
> +	struct drm_display_info *display_info;
>  	int ret, val;
>  
> -	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
> +	dp->connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> +	if (!dp->connector)
> +		return;
> +
> +	display_info = &dp->connector->display_info;
> +	switch (display_info->bpc) {
> +	case 10:
> +		video->color_depth = 10;
> +		break;
> +	case 6:
> +		video->color_depth = 6;
> +		break;
> +	default:
> +		video->color_depth = 8;
> +		break;
> +	}
> +
> +	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
>  		return;
> @@ -625,7 +616,7 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
>  
>  	ret = cdn_dp_enable(dp);
>  	if (ret) {
> -		DRM_DEV_ERROR(dp->dev, "Failed to enable encoder %d\n",
> +		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
>  			      ret);
>  		goto out;
>  	}
> @@ -661,9 +652,9 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
>  	mutex_unlock(&dp->lock);
>  }
>  
> -static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
> +static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
>  {
> -	struct cdn_dp_device *dp = encoder_to_dp(encoder);
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>  	int ret;
>  
>  	mutex_lock(&dp->lock);
> @@ -672,7 +663,7 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
>  	if (dp->active) {
>  		ret = cdn_dp_disable(dp);
>  		if (ret) {
> -			DRM_DEV_ERROR(dp->dev, "Failed to disable encoder %d\n",
> +			DRM_DEV_ERROR(dp->dev, "Failed to disable bridge %d\n",
>  				      ret);
>  		}
>  	}
> @@ -703,13 +694,31 @@ static int cdn_dp_encoder_atomic_check(struct drm_encoder *encoder,
>  	return 0;
>  }
>  
> +static void cdn_dp_hpd_notify(struct drm_bridge *bridge,
> +			   enum drm_connector_status status)
> +{
> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> +
> +	schedule_work(&dp->event_work);
> +}
> +
>  static const struct drm_encoder_helper_funcs cdn_dp_encoder_helper_funcs = {
>  	.mode_set = cdn_dp_encoder_mode_set,
> -	.enable = cdn_dp_encoder_enable,
> -	.disable = cdn_dp_encoder_disable,
>  	.atomic_check = cdn_dp_encoder_atomic_check,
>  };
>  
> +static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.detect = cdn_dp_bridge_detect,
> +	.edid_read = cdn_dp_bridge_edid_read,
> +	.atomic_enable = cdn_dp_bridge_atomic_enable,
> +	.atomic_disable = cdn_dp_bridge_atomic_disable,
> +	.mode_valid = cdn_dp_bridge_mode_valid,
> +	.hpd_notify = cdn_dp_hpd_notify,
> +};
> +
>  static int cdn_dp_parse_dt(struct cdn_dp_device *dp)
>  {
>  	struct device *dev = dp->dev;
> @@ -859,7 +868,7 @@ static int cdn_dp_audio_get_eld(struct device *dev, void *data,
>  {
>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>  
> -	memcpy(buf, dp->connector.eld, min(sizeof(dp->connector.eld), len));
> +	memcpy(buf, dp->connector->eld, min(sizeof(dp->connector->eld), len));

get_eld() might be called before .atomic_enable(). I'd suggest to switch
to DP_AUDIO helpers, which would remove a need to store dp->connector
here. You can do converstion graciously: store connector in the probe
path (as you create it anyway), switch to DRM_BRIDGE_OP_DP_AUDIO (should
be relatively easy), then drop dp->connector completely.

>  
>  	return 0;
>  }
> @@ -1006,7 +1015,6 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
>  
>  out:
>  	mutex_unlock(&dp->lock);
> -	drm_connector_helper_hpd_irq_event(&dp->connector);

Don't you need to call drm_bridge_hpd_notify() here?

>  }
>  
>  static int cdn_dp_pd_event(struct notifier_block *nb,
> @@ -1030,9 +1038,9 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder;
> -	struct drm_connector *connector;
>  	struct cdn_dp_port *port;
>  	struct drm_device *drm_dev = data;
> +	struct drm_connector *connector;

Kind of useless move. Please move it back.

>  	int ret, i;
>  
>  	ret = cdn_dp_parse_dt(dp);
> @@ -1053,6 +1061,15 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  							     dev->of_node);
>  	DRM_DEBUG_KMS("possible_crtcs = 0x%x\n", encoder->possible_crtcs);
>  
> +	/*
> +	 * If we failed to find the CRTC(s) which this encoder is
> +	 * supposed to be connected to, it's because the CRTC has
> +	 * not been registered yet. Defer probing, and hope that
> +	 * the required CRTC is added later.
> +	 */
> +	if (encoder->possible_crtcs == 0)
> +		return -EPROBE_DEFER;

I don't see this check beforehand. If this is a fix, please move it to a
separate commit.

> +
>  	ret = drm_simple_encoder_init(drm_dev, encoder,
>  				      DRM_MODE_ENCODER_TMDS);
>  	if (ret) {
> @@ -1062,26 +1079,29 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  
>  	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
>  
> -	connector = &dp->connector;
> -	connector->polled = DRM_CONNECTOR_POLL_HPD;
> -	connector->dpms = DRM_MODE_DPMS_OFF;
> +	dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
> +			   DRM_BRIDGE_OP_EDID |
> +			   DRM_BRIDGE_OP_HPD;
> +	dp->bridge.of_node = dp->dev->of_node;
> +	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>  
> -	ret = drm_connector_init(drm_dev, connector,
> -				 &cdn_dp_atomic_connector_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret) {
> -		DRM_ERROR("failed to initialize connector with drm\n");
> -		goto err_free_encoder;
> -	}
> +	ret = devm_drm_bridge_add(dev, &dp->bridge);
> +	if (ret)
> +		return ret;
>  
> -	drm_connector_helper_add(connector, &cdn_dp_connector_helper_funcs);
> +	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		return ret;
>  
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret) {
> -		DRM_ERROR("failed to attach connector and encoder\n");
> -		goto err_free_connector;
> +	connector = drm_bridge_connector_init(drm_dev, encoder);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		dev_err(dp->dev, "failed to init bridge connector: %d\n", ret);
> +		return ret;
>  	}
>  
> +	drm_connector_attach_encoder(connector, encoder);
> +
>  	for (i = 0; i < dp->ports; i++) {
>  		port = dp->port[i];
>  
> @@ -1092,7 +1112,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  		if (ret) {
>  			DRM_DEV_ERROR(dev,
>  				      "register EXTCON_DISP_DP notifier err\n");
> -			goto err_free_connector;
> +			return ret;
>  		}
>  	}
>  
> @@ -1101,24 +1121,15 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>  	schedule_work(&dp->event_work);
>  
>  	return 0;
> -
> -err_free_connector:
> -	drm_connector_cleanup(connector);
> -err_free_encoder:
> -	drm_encoder_cleanup(encoder);
> -	return ret;
>  }
>  
>  static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
>  {
>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>  	struct drm_encoder *encoder = &dp->encoder.encoder;
> -	struct drm_connector *connector = &dp->connector;
>  
>  	cancel_work_sync(&dp->event_work);
> -	cdn_dp_encoder_disable(encoder);
>  	encoder->funcs->destroy(encoder);

You've dropped drm_encoder_cleanup() from the bind path. Should it be
dropped here too? DRM subsystem will do it for you, if I'm not mistaken.

> -	connector->funcs->destroy(connector);
>  
>  	pm_runtime_disable(dev);
>  	if (dp->fw_loaded)
> @@ -1171,9 +1182,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
>  	int ret;
>  	int i;
>  
> -	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> -	if (!dp)
> -		return -ENOMEM;
> +	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
> +				   &cdn_dp_bridge_funcs);
> +	if (IS_ERR(dp))
> +		return PTR_ERR(dp);
>  	dp->dev = dev;
>  
>  	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> index 17498f576ce7..d2778f7a5b31 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
> @@ -8,6 +8,8 @@
>  #define _CDN_DP_CORE_H
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
>  #include <sound/hdmi-codec.h>
> @@ -65,7 +67,8 @@ struct cdn_dp_port {
>  struct cdn_dp_device {
>  	struct device *dev;
>  	struct drm_device *drm_dev;
> -	struct drm_connector connector;
> +	struct drm_bridge bridge;
> +	struct drm_connector *connector;
>  	struct rockchip_encoder encoder;
>  	struct drm_display_mode mode;
>  	struct platform_device *audio_pdev;
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
