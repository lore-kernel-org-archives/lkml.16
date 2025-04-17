Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C9253B4E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904846; cv=none; b=cS0wDy8rN+AR0noZTCRqOVenAlE02DW/8wUAy8c+fJKKBhE2tvZdXiaYaAXmQR48282EJvgB7HWB7ivbQrwBaqokbH+5y90holkbuHNTNP1vYoL9QnpIJ6BdXCkLr+/9cRrTenEpOhQywe8uMfFLYplQ1N2E68vayA0/Kxxc+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904846; c=relaxed/simple;
	bh=RQC5oBFtJwOseAWdk1GuJHdD+C2I6pPN7GjBbRipV7Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pCxzHAETppw2tmvT3lRVDIvzr+Q2oFtFAO/6b/imXKeaExpXSShmRvmJjcUFWYPZfwzlUcK8NCrUEW6jj7M2lQSAYqPlb7gMUzeZk3fo47I9d7/vrAFHEATzqOEurlOjcyRuNE6HGgzI/JMtT7uz3ftYzP979Fynq+NsQz2vOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gpjoMBUD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gpjoMBUD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0782d787so7086875e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744904842; x=1745509642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4SOU60FSeZSZYOagcsyjJRw1ciUsZ3CgR0C+LUaKPQ=;
        b=gpjoMBUDdumd9d5YepmIjjbn1hadhmRJV8UufS2vkdiX1bXC7QryLWuSccgM/+VUWk
         69pl9R6fkcflbgC49YJAf+on9HfpzwErtIwik4kQwgjdibo4I9eMdM5PN0eVvqzreNTO
         NqLGuGMk0dfP96X1FDBfbHGsuVdrnRIi5dYy3S6t9vdp7IhIvf+RCZpX5O14dLolPEnS
         tSSH//G7+vOSb5mxteaJ+7GgEaqfAGYXAnSCcCUN7m9799k/IWRTaNNkqYaQADhE6l/A
         ke1SrL72a2eN27lRex1WROva7dTpGo5EmTdPCMjjX/FpDADivTaGrd0xDsV4Wv2876gI
         /Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904842; x=1745509642;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d4SOU60FSeZSZYOagcsyjJRw1ciUsZ3CgR0C+LUaKPQ=;
        b=nIKctv3T7FTwj4TkVL6MXJtS2VCq4yjUgi9y4o6fH3ofNnBbSTS8aVxCOKt5TotWoS
         dvA1RBzoki4KOk+17buzqaHuSz5pUYJviYGGS/iLguMQrjiCTA6Z2LuKuwMTNrAwRnts
         29MDJWrYbvm5NHUZyzF4NAatRt7FIjPitWqXcfsYY9scIH9rvl/OsGq7ApDuNrBVGtdD
         +9anp+xaWmtKFUyT/393UDTB0hU08T1ZiAiecxzLxvqipeFP7FSCN2LhbT2WiIZnnU3O
         Og7wcs8Fo/Lz7YIAMuUr3FaB98jc7ex+4i4o7sGvEZIri8DOoLlS/dYC9tzrmI4MFxsF
         jm7A==
X-Forwarded-Encrypted: i=1; AJvYcCVrsJRaj82pt8YA4L6HlQsfNYC9/TVRlEoUI/scRPPZg7ibHmDdQ+g1uNFqjXrTUJrf7rGY66YqAex+rU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVF7AI80+tNNMIMX0jxXsBzZJmBPv1JsRl1IQMMLD0ZADl49A
	6a+0PVAmfhjYGu0yAcN2jT+v+tmKutlXeLYN64xuN1ybtrKSIlx7/1QM3QfM640=
X-Gm-Gg: ASbGnctNw1XYXRUs6fGAQFjfjV02AFAIuTILYWDeNQCtFeEBDymocRgpMiOZdAxkdqh
	/nDWVmuMbuv9T+/zPUghCbKtO0SUHFRfjQgYCZRWFn1RUox7rfWJ16xwUnbwTizAUOaY/TIBNjx
	EFLg41RH1wEc/ebA8d9mEyKDSTAjq6Abrkj+eKMCS2k/4qR2wo+7O2a0Iv5Wa4qnP4WClZxScr5
	wWtCCwtl0tnubl1ZR7uLnmmz49UG6HAS5m4TV8qJUZ4wp4rb4ie6XgD+FxS5nybIT9IjOXTtsdc
	OQFus8nSAqFZpVIfOX8cjNz8kMbKsnaoszC34Y+reom1GOezG5tcihWDNG4bs7fXHHxwmek9PIS
	BtW+xuNvvAp/CoM1PmhvQk4j1xw==
X-Google-Smtp-Source: AGHT+IEfAJX3GUuUI0f4PcoPivpbAcRA5K17KArPC8M+hzAVEVPWPtZimQgcBVvsyQbJWnMClsv2EQ==
X-Received: by 2002:a05:600c:3d9b:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-4405d5fda13mr64206575e9.5.1744904842486;
        Thu, 17 Apr 2025 08:47:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a7f9:634b:42d:1546? ([2a01:e0a:3d9:2080:a7f9:634b:42d:1546])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b58d18csm58956285e9.26.2025.04.17.08.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 08:47:22 -0700 (PDT)
Message-ID: <3da72f3e-7ef3-48de-bd7c-faaf0f6ba64b@linaro.org>
Date: Thu, 17 Apr 2025 17:47:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/7] drm/bridge: analogic_dp: drop panel_lock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
