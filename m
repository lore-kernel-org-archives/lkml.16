Received: from mail-m19731117.qiye.163.com (mail-m19731117.qiye.163.com [220.197.31.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D0E9461
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612479; cv=none; b=c/f9l+EPQpC4rcmpFwdb9CrVVHu6ezrYeBlMO5XBBD8LcTsz3BhR9PxO4qJBiN/lXTRE9E4nzYSsMx8DLfI3nNEAcg7V+kgXe/lIDedUJxqQK4JjxbucxQbQ6fMMtrfCYJ9/XeHBpiSllyfJuRC/swUXL8fVi7O7Sz8Ef4HErz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612479; c=relaxed/simple;
	bh=hgY59iTEk0ph2IpBWGoiBjT0zvupF7U23xETJggcIcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=ZKav3N5ON+uOFZKk7KnttLYm8tGYHkGUqCCeEdb+mcx/BtkFynOg5rR2bLJ57f0S/x8WZmAJvm79WtJifKtH9zeWrnJU6CtsC+UY6oTVWOX9pW/lwuVlOCRaz14qM/3BTWSlofW8q9V3yEdWUQfARX+zx89nCPBtffTBwi+bfI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=R3LNFO7P; arc=none smtp.client-ip=220.197.31.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="R3LNFO7P"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11bb3e4e9;
	Mon, 14 Apr 2025 09:58:28 +0800 (GMT+08:00)
Message-ID: <641cf50c-82d9-4690-bff7-36bc7f0f954c@rock-chips.com>
Date: Mon, 14 Apr 2025 09:58:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/bridge: analogix_dp: ignore return values of
 drm_panel_* calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-6-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktMQ1YfSEIYTk8ZGE1JSx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a963204f70a03a3kunm11bb3e4e9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mww6DBw*SzICPC4SHghJNU4a
	PzAaCz1VSlVKTE9PTkJOQktCTE1PVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOSUpCNwY+
DKIM-Signature:a=rsa-sha256;
	b=R3LNFO7PXe2yE11wxIkEsuLQ0mSFket7sQQu0kzw7k+gHKgX4+FMMoXpkhwF7IOuZdxbFsYhYn13Zfph2ACSHhb1v+K13QJbebkHMTNt60FXDRaem2AkCoZU9+LSLnBaWVM4HDFAAAMeNKqX/yEAmYp8RAbXFprvX4QEsm5yt7g=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=9j4J4fkgVTui3/AFzsLEhhQTB84aEZmksSJuscefb9o=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> Follow the example of other drivers and ignore return values of the
> drm_panel_prepare() / unprepare() / enable() / disable() calls. There is
> no possible error recovery, so the driver just logs a message.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 39 ++++------------------
>   1 file changed, 6 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index f60068011008482f7b7b2edfcab5fb1b3e9e130f..c7dffdae31877ae194fc6b0a5bf21be203f7dcc4 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -838,10 +838,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>   	int ret;
>   
>   	/* Keep the panel disabled while we configure video */
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_disable(dp->plat_data->panel))
> -			DRM_ERROR("failed to disable the panel\n");
> -	}
> +	drm_panel_disable(dp->plat_data->panel);
>   
>   	ret = analogix_dp_train_link(dp);
>   	if (ret) {
> @@ -863,13 +860,7 @@ static int analogix_dp_commit(struct analogix_dp_device *dp)
>   	}
>   
>   	/* Safe to enable the panel now */
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_enable(dp->plat_data->panel);
> -		if (ret) {
> -			DRM_ERROR("failed to enable the panel\n");
> -			return ret;
> -		}
> -	}
> +	drm_panel_enable(dp->plat_data->panel);
>   
>   	/* Check whether panel supports fast training */
>   	ret = analogix_dp_fast_link_train_detection(dp);
> @@ -1136,7 +1127,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	struct analogix_dp_device *dp = bridge->driver_private;
>   	struct drm_crtc *crtc;
>   	struct drm_crtc_state *old_crtc_state;
> -	int ret;
>   
>   	crtc = analogix_dp_get_new_crtc(dp, old_state);
>   	if (!crtc)
> @@ -1147,11 +1137,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_prepare(dp->plat_data->panel);
> -		if (ret)
> -			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
> -	}
> +	drm_panel_prepare(dp->plat_data->panel);
>   }
>   
>   static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
> @@ -1231,17 +1217,11 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   {
>   	struct analogix_dp_device *dp = bridge->driver_private;
> -	int ret;
>   
>   	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
>   		return;
>   
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_disable(dp->plat_data->panel)) {
> -			DRM_ERROR("failed to disable the panel\n");
> -			return;
> -		}
> -	}
> +	drm_panel_disable(dp->plat_data->panel);
>   
>   	disable_irq(dp->irq);
>   
> @@ -1249,11 +1229,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	if (dp->plat_data->panel) {
> -		ret = drm_panel_unprepare(dp->plat_data->panel);
> -		if (ret)
> -			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
> -	}
> +	drm_panel_unprepare(dp->plat_data->panel);
>   
>   	dp->fast_train_enable = false;
>   	dp->psr_supported = false;
> @@ -1678,10 +1654,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
>   	analogix_dp_bridge_disable(dp->bridge);
>   	dp->connector.funcs->destroy(&dp->connector);
>   
> -	if (dp->plat_data->panel) {
> -		if (drm_panel_unprepare(dp->plat_data->panel))
> -			DRM_ERROR("failed to turnoff the panel\n");
> -	}
> +	drm_panel_unprepare(dp->plat_data->panel);
>   
>   	drm_dp_aux_unregister(&dp->aux);
>   
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

