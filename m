Received: from mail-m19731113.qiye.163.com (mail-m19731113.qiye.163.com [220.197.31.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB1188CB1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744596604; cv=none; b=PPmsZ14rYewhVC8GRJzqEs1/GtNa71NiiQoaINlRRzUQoQEEZLwsHmkS5JrUabPZWnP5UB7jN4WMJR7wM9sJdVDCkIsnPS/rxOkrshFo9OHSdI9KaHgZ8yN4udBB/hFwOF5Iif0/k+LXknKtrUtNucXmQvISptCsjBr93Hd/x3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744596604; c=relaxed/simple;
	bh=yyDCYP2eZKKMjOqeaVbEHO2AF0CcqqEKK+uSkzU3zSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=mMDDy+3/1w57ylYP84A0Cp3720uTPCgfdQvX8eTZrqCaj2nSu9Iwpj2ABoQcCLdfTtZ99v2P2djfoPFSzAEOMIRxkK8SyPn1V2VsiPgDN4TRaIxCyohDN3xOTJikrIb4DHZTUJtYEjrqmUPvQn8jQr5c0U5sqh+3quILUkxxHvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IgTGUOhq; arc=none smtp.client-ip=220.197.31.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IgTGUOhq"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11bb22db8;
	Mon, 14 Apr 2025 09:54:36 +0800 (GMT+08:00)
Message-ID: <61f0bdc4-1262-4d8e-a358-7f6da94d8a61@rock-chips.com>
Date: Mon, 14 Apr 2025 09:54:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/bridge: analogix_dp: inline
 analogix_dp_prepare_panel()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-5-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9JSFZMTx1JQkMeS01JHUtWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9632016ba503a3kunm11bb22db8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6SSo6DDJJPC4rHigXTz0T
	IyswCj9VSlVKTE9PTkJOTUxMTklIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPSk5PNwY+
DKIM-Signature:a=rsa-sha256;
	b=IgTGUOhqyj/JFnSgt6LJHfOOmO3iU3p8jhBisDLCXW9gBCVRRmJtjMfCB3b6dZ1/NZytO4hFh/gNi8K0RjRovQW6jujsFyaUTq3r5opa562HnZzzgCWFM35gLCNuN+5/Fqxt0RaBAimPUD87yuBUD2fheEIIy7cxDuL4X58XEo8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Pn2juoFybSlR3t4mOBSpwjTiKo1IYUX0ygf0WJGwj9k=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() is now only calling a corresponding
> drm_panel function. Inline it to simplify the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 43 +++++-----------------
>   1 file changed, 10 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978..f60068011008482f7b7b2edfcab5fb1b3e9e130f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -955,33 +955,6 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>   }
>   
> -/*
> - * This function is a bit of a catch-all for panel preparation, hopefully
> - * simplifying the logic of functions that need to prepare/unprepare the panel
> - * below.
> - *
> - * If @prepare is true, this function will prepare the panel. Conversely, if it
> - * is false, the panel will be unprepared.
> - *
> - * The function will disregard the current state
> - * of the panel and either prepare/unprepare the panel based on @prepare.
> - */
> -static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
> -				     bool prepare)
> -{
> -	int ret = 0;
> -
> -	if (!dp->plat_data->panel)
> -		return 0;
> -
> -	if (prepare)
> -		ret = drm_panel_prepare(dp->plat_data->panel);
> -	else
> -		ret = drm_panel_unprepare(dp->plat_data->panel);
> -
> -	return ret;
> -}
> -
>   static int analogix_dp_get_modes(struct drm_connector *connector)
>   {
>   	struct analogix_dp_device *dp = to_dp(connector);
> @@ -1174,9 +1147,11 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   	if (old_crtc_state && old_crtc_state->self_refresh_active)
>   		return;
>   
> -	ret = analogix_dp_prepare_panel(dp, true);
> -	if (ret)
> -		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
> +	if (dp->plat_data->panel) {
> +		ret = drm_panel_prepare(dp->plat_data->panel);
> +		if (ret)
> +			DRM_ERROR("failed to prepare the panel ret = %d\n", ret);
> +	}
>   }
>   
>   static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
> @@ -1274,9 +1249,11 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
>   
>   	pm_runtime_put_sync(dp->dev);
>   
> -	ret = analogix_dp_prepare_panel(dp, false);
> -	if (ret)
> -		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
> +	if (dp->plat_data->panel) {
> +		ret = drm_panel_unprepare(dp->plat_data->panel);
> +		if (ret)
> +			DRM_ERROR("failed to unprepare the panel ret = %d\n", ret);
> +	}
>   
>   	dp->fast_train_enable = false;
>   	dp->psr_supported = false;
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

