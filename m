Received: from mail-m3277.qiye.163.com (mail-m3277.qiye.163.com [220.197.32.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D50029D19
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744595762; cv=none; b=Lvp4Hysx5RpAz+v5P45mXzPbz9IwgGblWQK1WJBThrnFGT5+lOYD4lztdud77SDwm7im+36mj0VWaKYbmpfuS+qArWrHkR5vS6caPlkciUofs1rG+P0Xr+mWxHfwbbPmq0EyGOH+XxSrIshGDbvL6ObLlvMA9pbklG+wxD5HcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744595762; c=relaxed/simple;
	bh=Y93zM1czlETJPLIaWxqsBrFFRu69+0vHLA5Y90z1es4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=uLtnu05dwX4k759iAPbALCeuHwuv0mgny0PZG6FLHTdjZv39uYgttdL30HtvPStvGpOAh6/XbePbuuWfs1J12l9IocriNImHwLwSjZy6geV15OVegUrot9zpBA1wYtXYerPFeyB4+rOPnWjaOPzGCXJNmAe9pNU2awlXaE4C10s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hZM48Ykr; arc=none smtp.client-ip=220.197.32.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hZM48Ykr"
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11baf1e49;
	Mon, 14 Apr 2025 09:50:41 +0800 (GMT+08:00)
Message-ID: <a695d872-1d8a-435e-a98a-0b9d7c295ee9@rock-chips.com>
Date: Mon, 14 Apr 2025 09:50:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/bridge: analogic_dp: drop panel_lock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx4ZGFZCHR0fHUgYQxpOTRlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9631fdd92b03a3kunm11baf1e49
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MBQ6STo6HjJIDi4oTFYcTzk6
	L1YKCThVSlVKTE9PTkJOT09ISEtOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISE9INwY+
DKIM-Signature:a=rsa-sha256;
	b=hZM48YkrB8Ve5CrdVqBTLWt5RAEegNDeu6fH8ccHoUHqOrLZicoZTXf9ORTqdFOvGdyf+x2Sub0dATIZbNA6CAyjX8g3yaX0ZuImia/O7eN0tAitO5jS9U8KrEjx7Z+jd414Zd9nhvO+lg6XUpNzt97xDcYx3VfBRbynVGZ1osU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=fH14x6shYv7y9Vwa+DEpj3iHw+jF0WsahJviDDhfSns=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 2025/4/1 13:11, Dmitry Baryshkov wrote:
> The analogix_dp_prepare_panel() function is called from bridge's
> atomic_pre_enable() and atomic_post_disable() callbacks, which can not
> happen simultaneously. Drop the useless mutex.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 --
>   2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 704c6169116eb2601d2ad02dc7294455ceff5460..1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -974,14 +974,11 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
>   	if (!dp->plat_data->panel)
>   		return 0;
>   
> -	mutex_lock(&dp->panel_lock);
> -
>   	if (prepare)
>   		ret = drm_panel_prepare(dp->plat_data->panel);
>   	else
>   		ret = drm_panel_unprepare(dp->plat_data->panel);
>   
> -	mutex_unlock(&dp->panel_lock);
>   	return ret;
>   }
>   
> @@ -1523,8 +1520,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>   	dp->dev = &pdev->dev;
>   	dp->dpms_mode = DRM_MODE_DPMS_OFF;
>   
> -	mutex_init(&dp->panel_lock);
> -
>   	/*
>   	 * platform dp driver need containor_of the plat_data to get
>   	 * the driver private data, so we need to store the point of
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> index b679d5b71d276f458d905c936160f107225bc6c5..2b54120ba4a3ef55af518a0629a5c8469f275a0f 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -169,8 +169,6 @@ struct analogix_dp_device {
>   	bool			fast_train_enable;
>   	bool			psr_supported;
>   
> -	struct mutex		panel_lock;
> -
>   	struct analogix_dp_plat_data *plat_data;
>   };
>   
> 

The patch has been verified with the eDP panel "lg,lp079qx1-sp0v" in 
RK3588S EVB1 board.

Tested-by: Damon Ding <damon.ding@rock-chips.com>

Best regards,
Damon

