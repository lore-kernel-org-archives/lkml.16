Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F715D5B6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361760; cv=none; b=eaXfF4kRjcbXCFeQJ4tlaxbKa+QhaPxqR/9LbYgY29cqo7+JaeqNu1MfNxwc8L4XEi+eracJgHQIi5a6wcrUtcJ9KnERizbJ3h0Y3nQj1APNWsycg7i5APxHe2VCUpM6YTxYM4ZsGU6D5dn25j3/CPuCzvt0nYiRK+1T9PCt96A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361760; c=relaxed/simple;
	bh=2tgMt1sse1LvM8GVxklg0FPJWv5iZuw3NO90IPBMi+M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GNLfwJIVz2vwWW0v1dw6/1FqNJwtmSPV91JEupyrFCrSBnIT+yQB0Q7xirQ/3iLngqgRiyK3MnvgQkB/tpeGghYvUouM6g0eHzozEoas/qe7SgBLFjVcebd3r+/yuLWUhy7C0Vfd8zJoObceAFkuaGTsS1pGyWdj9+Iotvzpkb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IgSHOxYs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IgSHOxYs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so19594635e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744361756; x=1744966556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgQKbWLox9NVg1QwDNLTEsGI9L1B5W9chUOopG1dkzI=;
        b=IgSHOxYsUqdTK6XKVa7rvhgTTnaSYnBCVCYH/ziuEyQdPa9GuVFCP46hgg1F1dwkh4
         L+7RROcF/VIj4GeUXV+q9l0CnmUSWf9doCBP6ATDj+s11xUz/+auIoNi7yxEWczCHMU5
         S0bsDeZtgf8sGxEnZ9wOMY1QTbAxZtKImDGhVmfDCGuhNOnczk+hyy/Ur+S25ALgHa8b
         QCNNp3GXMw2Ex6HvRqFj+Bpmq1CoNp/NtjggLwVQeRKfQIFH1Y6q61skUs7fvhrljZMQ
         PoWsKZIpcB2UIWETCl6ZsporfvCibd+18QseARn7vPOTQS2z0d7l/dCaOKf5qCxMJ21q
         Xvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361756; x=1744966556;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgQKbWLox9NVg1QwDNLTEsGI9L1B5W9chUOopG1dkzI=;
        b=YDvD3uznd8jaPoI+KOCpGjdijck4KCaOnJKdGTHxR7rYaBFuQz8PMv4TnEvGCNyLKh
         4aU8AlvNWO0UjyiNKxkU3STTI+fR7nQkjAlKCsi4K8SDCwTM2ogZynU9n2qVV3EFr43B
         fLnNYuCOG5BNGmpoo0lQSEL0e82CK5qgQmYw9t6MQVtMZv7jnbMo2CDXPHxUUK+2Dj4I
         cHLOn63Np8Leo2Jb4pHHti61CQt3mM2GdmmWnWhchplFvzx/dLp//H85g6G/+uaWMt/N
         VHI2mAg+P83MzKrw46WHzPPSro0SdgnFt8FwboEQwZC80KbcgRq32NZcgrlXpsynMNz1
         fsYw==
X-Forwarded-Encrypted: i=1; AJvYcCXDaN81WcIA8Zc3pmkpeB2kfdGPZMeR1rWzkkQaFwkS8rvEzDQQJ4dxVlAxVGfgeUorjBy+18kMrwuZnRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4Y3IVXBjIKY+XUfTCXeARm0WWn6Cbeqw9rL7CZXybl32bPhu
	fcng3vHp+HtYgAFqY4WgE/d9x7E3qFkrNqBXQZeuDySIGZHbkXWQPDMp+8QvcrM=
X-Gm-Gg: ASbGncuuFLdG/ZXYU3Tqhww+Ru8RLMb1WKPSgWiQDRHm9Z2zZvpoi/QODaJs29/3rpg
	UP3ZsAK1vawuwzrh11SplSZBygapUEU0wL/U0gixErXOIvza7jxR9YdZZq74rm02YatPLzRoq7n
	7bKeSk8LzYheAW1jWOnA1oXx4mpevFfBmSZXLv/teL90SOlePyyfKIAVtm40DBpEOgatopZ0f7P
	/+66IbmeCJXc1R3Hek1HmW9Y4phB21I22IS6RCDxz+BYK6QWRzznoeQZGvKAQ6FqPydAc/MTwE8
	bpDzbcNfTt4qAs6O0UHoc0EQ3Gk6vjCQN1Qyx4Ad/JgeCm8ROR699R9s/fZ1JVDrlXN1VWd43ip
	4g1LqUiyyGVzIVkzIBg==
X-Google-Smtp-Source: AGHT+IEVq2vyPSDk3mZeBJ2nFdHQf/8MPDkyfLJnef1pf5xR+tKiYrLMkUUN01oPGLJiHTMgAUdnsw==
X-Received: by 2002:a05:6000:4022:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-39d8f2676a3mr4601535f8f.6.1744361756583;
        Fri, 11 Apr 2025 01:55:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm1354424f8f.25.2025.04.11.01.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:55:56 -0700 (PDT)
Message-ID: <3d0cff04-07f3-49cb-83cc-afd4f052e8d5@linaro.org>
Date: Fri, 11 Apr 2025 10:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 7/7] drm/panel: make prepare/enable and disable/unprepare
 calls return void
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
 <20250401-panel-return-void-v1-7-93e1be33dc8d@oss.qualcomm.com>
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
In-Reply-To: <20250401-panel-return-void-v1-7-93e1be33dc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> Now there are no users of the return value of the drm_panel_prepare(),
> drm_panel_unprepare(), drm_panel_enable() and drm_panel_disable() calls.
> Usually these calls are performed from the atomic callbacks, where it is
> impossible to return an error. Stop returning error codes and return
> void instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/drm_panel.c                     | 54 +++++++++----------------
>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c |  9 +----
>   include/drm/drm_panel.h                         |  8 ++--
>   3 files changed, 26 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index c627e42a7ce70459f50eb5095fffc806ca45dabf..faa7a76b63b53b3a45b3400d8bf3b58a027a340e 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -105,21 +105,21 @@ EXPORT_SYMBOL(drm_panel_remove);
>    *
>    * Calling this function will enable power and deassert any reset signals to
>    * the panel. After this has completed it is possible to communicate with any
> - * integrated circuitry via a command bus.
> - *
> - * Return: 0 on success or a negative error code on failure.
> + * integrated circuitry via a command bus. This function cannot fail (as it is
> + * called from the pre_enable call chain). There will always be a call to
> + * drm_panel_disable() afterwards.
>    */
> -int drm_panel_prepare(struct drm_panel *panel)
> +void drm_panel_prepare(struct drm_panel *panel)
>   {
>   	struct drm_panel_follower *follower;
>   	int ret;
>   
>   	if (!panel)
> -		return -EINVAL;
> +		return;
>   
>   	if (panel->prepared) {
>   		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
> -		return 0;
> +		return;
>   	}
>   
>   	mutex_lock(&panel->follower_lock);
> @@ -138,11 +138,8 @@ int drm_panel_prepare(struct drm_panel *panel)
>   				 follower->funcs->panel_prepared, ret);
>   	}
>   
> -	ret = 0;
>   exit:
>   	mutex_unlock(&panel->follower_lock);
> -
> -	return ret;
>   }
>   EXPORT_SYMBOL(drm_panel_prepare);
>   
> @@ -154,16 +151,14 @@ EXPORT_SYMBOL(drm_panel_prepare);
>    * reset, turn off power supplies, ...). After this function has completed, it
>    * is usually no longer possible to communicate with the panel until another
>    * call to drm_panel_prepare().
> - *
> - * Return: 0 on success or a negative error code on failure.
>    */
> -int drm_panel_unprepare(struct drm_panel *panel)
> +void drm_panel_unprepare(struct drm_panel *panel)
>   {
>   	struct drm_panel_follower *follower;
>   	int ret;
>   
>   	if (!panel)
> -		return -EINVAL;
> +		return;
>   
>   	/*
>   	 * If you are seeing the warning below it likely means one of two things:
> @@ -176,7 +171,7 @@ int drm_panel_unprepare(struct drm_panel *panel)
>   	 */
>   	if (!panel->prepared) {
>   		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
> -		return 0;
> +		return;
>   	}
>   
>   	mutex_lock(&panel->follower_lock);
> @@ -195,11 +190,8 @@ int drm_panel_unprepare(struct drm_panel *panel)
>   	}
>   	panel->prepared = false;
>   
> -	ret = 0;
>   exit:
>   	mutex_unlock(&panel->follower_lock);
> -
> -	return ret;
>   }
>   EXPORT_SYMBOL(drm_panel_unprepare);
>   
> @@ -209,26 +201,26 @@ EXPORT_SYMBOL(drm_panel_unprepare);
>    *
>    * Calling this function will cause the panel display drivers to be turned on
>    * and the backlight to be enabled. Content will be visible on screen after
> - * this call completes.
> - *
> - * Return: 0 on success or a negative error code on failure.
> + * this call completes. This function cannot fail (as it is called from the
> + * enable call chain). There will always be a call to drm_panel_disable()
> + * afterwards.
>    */
> -int drm_panel_enable(struct drm_panel *panel)
> +void drm_panel_enable(struct drm_panel *panel)
>   {
>   	int ret;
>   
>   	if (!panel)
> -		return -EINVAL;
> +		return;
>   
>   	if (panel->enabled) {
>   		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
> -		return 0;
> +		return;
>   	}
>   
>   	if (panel->funcs && panel->funcs->enable) {
>   		ret = panel->funcs->enable(panel);
>   		if (ret < 0)
> -			return ret;
> +			return;
>   	}
>   	panel->enabled = true;
>   
> @@ -236,8 +228,6 @@ int drm_panel_enable(struct drm_panel *panel)
>   	if (ret < 0)
>   		DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\n",
>   			     ret);
> -
> -	return 0;
>   }
>   EXPORT_SYMBOL(drm_panel_enable);
>   
> @@ -248,15 +238,13 @@ EXPORT_SYMBOL(drm_panel_enable);
>    * This will typically turn off the panel's backlight or disable the display
>    * drivers. For smart panels it should still be possible to communicate with
>    * the integrated circuitry via any command bus after this call.
> - *
> - * Return: 0 on success or a negative error code on failure.
>    */
> -int drm_panel_disable(struct drm_panel *panel)
> +void drm_panel_disable(struct drm_panel *panel)
>   {
>   	int ret;
>   
>   	if (!panel)
> -		return -EINVAL;
> +		return;
>   
>   	/*
>   	 * If you are seeing the warning below it likely means one of two things:
> @@ -269,7 +257,7 @@ int drm_panel_disable(struct drm_panel *panel)
>   	 */
>   	if (!panel->enabled) {
>   		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
> -		return 0;
> +		return;
>   	}
>   
>   	ret = backlight_disable(panel->backlight);
> @@ -280,11 +268,9 @@ int drm_panel_disable(struct drm_panel *panel)
>   	if (panel->funcs && panel->funcs->disable) {
>   		ret = panel->funcs->disable(panel);
>   		if (ret < 0)
> -			return ret;
> +			return;
>   	}
>   	panel->enabled = false;
> -
> -	return 0;
>   }
>   EXPORT_SYMBOL(drm_panel_disable);
>   
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> index 5d115ecd5dd44c8e5e7d1fb8afe573324e987f59..b6429795e8f518646443dd8179f3ec28cef4dc0f 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
> @@ -413,15 +413,10 @@ static int panel_nv3051d_probe(struct mipi_dsi_device *dsi)
>   static void panel_nv3051d_shutdown(struct mipi_dsi_device *dsi)
>   {
>   	struct panel_nv3051d *ctx = mipi_dsi_get_drvdata(dsi);
> -	int ret;
>   
> -	ret = drm_panel_unprepare(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
> +	drm_panel_unprepare(&ctx->panel);
>   
> -	ret = drm_panel_disable(&ctx->panel);
> -	if (ret < 0)
> -		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
> +	drm_panel_disable(&ctx->panel);
>   }
>   
>   static void panel_nv3051d_remove(struct mipi_dsi_device *dsi)
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index a9c042c8dea1a82ef979c7a68204e0b55483fc28..18bf338c8b96254dc3f2880106b944e71ea4c9a7 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -275,11 +275,11 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
>   void drm_panel_add(struct drm_panel *panel);
>   void drm_panel_remove(struct drm_panel *panel);
>   
> -int drm_panel_prepare(struct drm_panel *panel);
> -int drm_panel_unprepare(struct drm_panel *panel);
> +void drm_panel_prepare(struct drm_panel *panel);
> +void drm_panel_unprepare(struct drm_panel *panel);
>   
> -int drm_panel_enable(struct drm_panel *panel);
> -int drm_panel_disable(struct drm_panel *panel);
> +void drm_panel_enable(struct drm_panel *panel);
> +void drm_panel_disable(struct drm_panel *panel);
>   
>   int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
>   
> 

LGTM

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
