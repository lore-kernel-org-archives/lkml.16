Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457077DA6D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307391; cv=none; b=k5VptTdmQnWA7cjmeBRGRCe58gePgGy5iycReLJOLDFrOL3NMI1iLYMSTCxlq6rkjw2lyLu1XcrCU6R3hRj471NJDH/pd2LFeJCwGkNzgWe2ZJLz5mJNNqauC9QNL9G4Vl7yOJ3eCa27jyMKyx4MSnnZHVmeRCsCA06GTO33vY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307391; c=relaxed/simple;
	bh=N7wOK8BDklVxjiMrgCSGhShbr36LFuZyh+DF513FDnM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h0ewr8pHLqwAQdEsMWdubKXG6OVxmi4ic72QLKrz2OH8B6qNOL/jMjPU+NvjIjbdYIhMMeC4QdL1ALO9VLew7LqGLGFghPqm4YeFRqP4m+Lnp7O7XzUdQ3JQMfqpQ8O3cNxoqu+fLlu1QGOW9gpfdnSb0sgnOvLhdEr+/8Ylflo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hoYjA2w5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hoYjA2w5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a064a3e143so69056f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307387; x=1745912187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIWKsQ80F/yq5xwR2CPXUApKaQjUS7GC5G7PS4RGmt8=;
        b=hoYjA2w5Tt7UlUekY1W7BvXfNR1OnJMdzL7Aa0fQi5Gp8znfllOr6zSRn1R49OF+yK
         jVT1zaCvURolQY1lGF0d4VbfWwqfetKepwTJLnoLcA+6V4KY5YiJB9/i4CEoujpg0l/n
         S3boI7tgDKhR3lyICc9NEetI6n0klvJMSQOQ1gnnVd4LagW+HtMnqIDEr2YSpreNnVYM
         rRLaJVrz+s66Xnx0/gYuB3ublsdgOQP8gJzsatdn3wj1pxZoJWlwZG3SZpz9KCm2/VVu
         L32NPxURnXDvUEhQQEwZ9yvmAcVobk61eGk01z4ZQhryymKyjdcDL/t7pLP3hG0WSmVD
         6Fyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307387; x=1745912187;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BIWKsQ80F/yq5xwR2CPXUApKaQjUS7GC5G7PS4RGmt8=;
        b=pDzF09qLuRdZVteytnB8IqNPptf5innivWhCA96hTKU42t5IU1EnwiOlWgkWCS7N0y
         QOS7NG9lITrgnJ/Kg9uWtKkHuzu3r/iLkX1gq2x0DGl4foFhbMOoacBvh56G7RZmgerc
         /czoRqOax1lGFD+g64c2AxvTYrEe6Z6InwMi2311mZLlj+EHaT3QdEtWOmsFSeEDqayf
         bRMXbc91D5Ua5Oex5MncNlOAqLY6bv21EPL6OPWWzLT1yZBHPgi9cVlpXcKbbxcWapXK
         2L0jHzzeF48QdqFyu/0Qx+KsrhzR7sIrlAkFFXsPcEHb3hFj6hBLRSq9KaIoESgTt3Wx
         JqFg==
X-Forwarded-Encrypted: i=1; AJvYcCXfEIMsTzj0ysFsGzWpINTvCZLye5xzXG2n8rXi+bp7GCb2s9bOxmIize7jxbDugTNutoSvZOuwZJmCi40=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsx5icTXdXHIOWQ4/upUsuU2QtrxhG4DC6CXWhLovlOU9STwSc
	tNQmcnmDnpoOl2RFr/IVEiGEIY+S1gjh5Iw6khejtHkaglqvxQC1NU8k+8ed02kj8BZEalT7ggW
	Z
X-Gm-Gg: ASbGnct/T9X0scL4hJN3LyyoRo94LoPrtQ00+zF8wnLLyz2oByozhs0UTsPa5STVpp/
	oB2vHim+JXpY4XPnCxBzq0uofg6SwPJ9Ojx6yFV8gjC5FshUT6582G8CwoxOGLj0k1fKEHkY7rK
	etWKw++eg0KRrdvFWIW2pOQLSzSJo4c0sgfO6mFEtfjQmoWn+q6U6/qp772/QJ3YwlcT48IGpBR
	ajN3P55kMCuWaTHGr5ZvtihuKm/TmvdM6HGlwRPhky6pK1bwpWiUDQZd9t15unwhTG/NV1nNCq1
	ZDi0D+1KlSwWzSsInDefiTkmuB2Cl5mPQ8bt83T05OraCqq6DC1saOhgadT9bUYh0hKaeuf9KUn
	ZK1BkjjLaRaHET38w0Q==
X-Google-Smtp-Source: AGHT+IGBiyxnqdWPs1pY5Sy/l7SAAXjfl/ohXEpklrpNTS8wZjvpyWQ0uuM/Ya60jgfRbbTOVXdCRg==
X-Received: by 2002:a5d:64ae:0:b0:391:ba6:c066 with SMTP id ffacd0b85a97d-39efba5dba8mr12975977f8f.35.1745307387506;
        Tue, 22 Apr 2025 00:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f? ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6db131sm161836825e9.28.2025.04.22.00.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 00:36:27 -0700 (PDT)
Message-ID: <890eda99-89e6-400b-8a0f-345ea0e171fe@linaro.org>
Date: Tue, 22 Apr 2025 09:36:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: samsung-sofef00: Drop s6e3fc2x01 support
To: david@ixit.cz, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Casey Connolly <casey@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Casey Connolly <casey.connolly@linaro.org>
References: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
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
In-Reply-To: <20250419-drop-s6e3fc2x01-support-v1-1-05edfe0d27aa@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2025 18:31, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> We never properly supported this panel and always used the wrong init
> sequence. Drop support so we can move it to it's own proper driver.
> 
> Fixes: 5933baa36e26 ("drm/panel/samsung-sofef00: Add panel for OnePlus 6/T devices")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/gpu/drm/panel/panel-samsung-sofef00.c | 34 ++-------------------------
>   1 file changed, 2 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index 04ce925b3d9dbd91841f4b4e4a12320eac8e03af..49cfa84b34f0ca75394b74b5765a0931d9fefba0 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -22,7 +22,6 @@ struct sofef00_panel {
>   	struct mipi_dsi_device *dsi;
>   	struct regulator *supply;
>   	struct gpio_desc *reset_gpio;
> -	const struct drm_display_mode *mode;
>   };
>   
>   static inline
> @@ -159,26 +158,11 @@ static const struct drm_display_mode enchilada_panel_mode = {
>   	.height_mm = 145,
>   };
>   
> -static const struct drm_display_mode fajita_panel_mode = {
> -	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> -	.hdisplay = 1080,
> -	.hsync_start = 1080 + 72,
> -	.hsync_end = 1080 + 72 + 16,
> -	.htotal = 1080 + 72 + 16 + 36,
> -	.vdisplay = 2340,
> -	.vsync_start = 2340 + 32,
> -	.vsync_end = 2340 + 32 + 4,
> -	.vtotal = 2340 + 32 + 4 + 18,
> -	.width_mm = 68,
> -	.height_mm = 145,
> -};
> -
>   static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector)
>   {
>   	struct drm_display_mode *mode;
> -	struct sofef00_panel *ctx = to_sofef00_panel(panel);
>   
> -	mode = drm_mode_duplicate(connector->dev, ctx->mode);
> +	mode = drm_mode_duplicate(connector->dev, &enchilada_panel_mode);
>   	if (!mode)
>   		return -ENOMEM;
>   
> @@ -239,13 +223,6 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
>   	if (!ctx)
>   		return -ENOMEM;
>   
> -	ctx->mode = of_device_get_match_data(dev);
> -
> -	if (!ctx->mode) {
> -		dev_err(dev, "Missing device mode\n");
> -		return -ENODEV;
> -	}
> -
>   	ctx->supply = devm_regulator_get(dev, "vddio");
>   	if (IS_ERR(ctx->supply))
>   		return dev_err_probe(dev, PTR_ERR(ctx->supply),
> @@ -295,14 +272,7 @@ static void sofef00_panel_remove(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct of_device_id sofef00_panel_of_match[] = {
> -	{ // OnePlus 6 / enchilada
> -		.compatible = "samsung,sofef00",
> -		.data = &enchilada_panel_mode,
> -	},
> -	{ // OnePlus 6T / fajita
> -		.compatible = "samsung,s6e3fc2x01",
> -		.data = &fajita_panel_mode,
> -	},
> +	{ .compatible = "samsung,sofef00" },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, sofef00_panel_of_match);
> 
> ---
> base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
> change-id: 20250419-drop-s6e3fc2x01-support-d060a14a4791
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
