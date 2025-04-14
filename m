Received: from mail-m1973192.qiye.163.com (mail-m1973192.qiye.163.com [220.197.31.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA5149E17
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744595616; cv=none; b=RzNyc4R40MW6QQ0NVfo4j51Opiuwq76uuKT8H4xnVRTcNp9zeXNnL9dQH9gPKZY18dS2JE5Yicyiw7X60iLcXl33iqNLFE5cJCdcY5TiIlLDCFUBXJIpgfLK9pFPg1zOImoubBF9ZoXXI+rbZXBqaLB778RuSv4eo4emsZEzHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744595616; c=relaxed/simple;
	bh=46xBrH0s6hxVPRvZaZxwedQ6rUNyac0p3xR6dmbnSFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Mr206+7ov5MsEP8ePONQvdXWBKYckGlAhYn46dh1y5sby3CiB9CHCiijDexWaECXQRJoqYUfDI0dgpCj8ry3a7RFcl/UjaVNmeXJHQv9LMWv4W/NMlEK/Fu0u5LLnC9RGDm2Ab6uVIK60ixRphoowWtop7DxZOhj5A66PGuIHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NLuHcyiS; arc=none smtp.client-ip=220.197.31.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NLuHcyiS"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11ba6131e;
	Mon, 14 Apr 2025 09:38:14 +0800 (GMT+08:00)
Message-ID: <d4d6d1a2-cfec-4913-a30e-26cf63a17fa2@rock-chips.com>
Date: Mon, 14 Apr 2025 09:38:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/bridge: analogix_dp: drop unused argument to
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhkZTVZLSU9LT0kdHh9NGE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9631f271a503a3kunm11ba6131e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06SAw*PDIBAi4qGB0iUVE2
	KEowChFVSlVKTE9PTkJPTUJNS0pNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTk5KNwY+
DKIM-Signature:a=rsa-sha256;
	b=NLuHcyiS0LzSXIBeVNtImdCsnVHVuCQjmL1298JQEhGOfz4Gn5XFBqDeyHKnxQdPNopmLX3Gq8vVKFwh1SxeJXyLAiuLDZFcZrX5a4Xitp1sdu1NAYuRb8ksxkq3xwb9Tq9x5r3TBcgLg3mrI1YCmYswWj8jFzNkuL6wHTcUY34=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=iD49FTyk71nxxI/ueYiMlbSL/H5Lc+sm+Xe9U6vy+1Q=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> After previous cleanup all calling sites pass true as is_modeset_prepare
> argument to analogix_dp_prepare_panel(). Drop dead code depending on
> that argument being false.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index ab1cfc340aa95bbf13fe021bd33227b565a5458d..82dc4b01806f9728dc882b0128171838e81f21b0 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -963,13 +963,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>    * If @prepare is true, this function will prepare the panel. Conversely, if it
>    * is false, the panel will be unprepared.
>    *
> - * If @is_modeset_prepare is true, the function will disregard the current state
> + * The function will disregard the current state
>    * of the panel and either prepare/unprepare the panel based on @prepare. Once
>    * it finishes, it will update dp->panel_is_modeset to reflect the current state
>    * of the panel.
>    */
>   static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
> -				     bool prepare, bool is_modeset_prepare)
> +				     bool prepare)
>   {
>   	int ret = 0;
>   
> @@ -978,13 +978,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   
>   	mutex_lock(&dp->panel_lock);
>   
> -	/*
> -	 * Exit early if this is a temporary prepare/unprepare and we're already
> -	 * modeset (since we neither want to prepare twice or unprepare early).
> -	 */
> -	if (dp->panel_is_modeset && !is_modeset_prepare)
> -		goto out;
> -
>   	if (prepare)
>   		ret = drm_panel_prepare(dp->plat_data->panel);
>   	else
> @@ -993,8 +986,7 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	if (ret)
>   		goto out;
>   
> -	if (is_modeset_prepare)
> -		dp->panel_is_modeset = prepare;
> +	dp->panel_is_modeset = prepare;
>   
>   out:
>   	mutex_unlock(&dp->panel_lock);
> @@ -1072,7 +1064,6 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
>   	enum drm_connector_status status = connector_status_disconnected;
> -	int ret;
>   
>   	if (dp->plat_data->panel)
>   		return connector_status_connected;
> @@ -1194,7 +1185,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	ret = analogix_dp_prepare_panel(dp, true, true);
> +	ret = analogix_dp_prepare_panel(dp, true);
>   	if (ret)
>   		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>   }
> @@ -1294,7 +1285,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	ret = analogix_dp_prepare_panel(dp, false, true);
> +	ret = analogix_dp_prepare_panel(dp, false);
>   	if (ret)
>   		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
>   
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

