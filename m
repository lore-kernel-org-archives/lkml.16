Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADDA26560B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731429; cv=none; b=UW/kq2dqKjorvo2vjOlrzttY02Zabk3G/sVTGvGgQBpDTq8cj8yn7pOn9ySyJhGNnyeY9enZRd4OQFtVLb69PjXVUX6msKBnadh4EE+k/lXGKbjtsVCMUAS8YMO1e/Dnz2DuKmB07e//6w576wJGdYS4YcJWTc6Sr8gAaSfu2b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731429; c=relaxed/simple;
	bh=l6PIwrutBZrdt7t26jQgdIjZcatW0grgzxpxHVVpnhA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KLjC0QzseG6qL+U+Y8pGkb/KJWs9VwU2qQloc5VZ/C7uRm1IHJ/Rt57sSLojgOpAI8qA5wkKNkmLIEhgjPJ74E8QYXq02hz+Lql398JR3DgCP+YlIMMSkxKtFR+YCSgGwPtHXl0+vHhZ2LEU1+VAm+cp1w4T8tNfWifDt+MlQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtPR6pri; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtPR6pri"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-441ab63a415so59037405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747731426; x=1748336226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pA6QLGwRrJdjtu/QYKul6KHwTkpIcoSd75MMlyAB2zA=;
        b=JtPR6prispqbI++nh5qbE5ajsgKR25Jatszu6MMiV+W6LYv6e6ufcHXprLkhPa15xr
         9KgaNG/SJfMwfdfILQqldu3VVT+JWYWJSmdNRu6t1NkHCwfUUBhCT4X0AZR7TmuG7daI
         tT+AvU7+4vNZfTRJhNTsg0fQW0agsew8lcmm9fGxq3+soht/ZtasikMbWP/TpZuSaxto
         pZNviTnhQ4gNF3CyBEDS1NESZXtCLmsvVkQKUHFF8SVV1ENHqHBVcotJU3YXMkobNp0K
         3LIQEYAV50zpqCb8kzj4NY4QOneLPaQ4dCSoqm1/rgi764AYGAtcnCblcpp5ecSByxCu
         o59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731426; x=1748336226;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pA6QLGwRrJdjtu/QYKul6KHwTkpIcoSd75MMlyAB2zA=;
        b=xCfK7rMNyAf0qa0YALr8UYGUnFG7AXO5gmlR0UXEdUhT5MDzUa/EJ+GkvE22fYsUfb
         nnJg0+xZAVUdoukuP6DXsDbTMIZI5NT6X0EA5Bwji9w82e+/UW/PggV06n3rWbtJCng9
         8iQXHUMWiI54Cw/FxJaLsWldppUess+upyH4slQQBvaGTRnywF8mK2YM8piv3jNJCZwG
         I2pwIV2Bb1mREwL+GZ8KDXyli9Te8n31eqrCLG1IfAel7kqU5cyOgFnSR7jHAI/W42vo
         mdOn0lAC5PC/4GcdjDV1j4K2Ze0V72pOxg7u8t7Rh9bSPKAwb8nfuV0qaXOZZAAYztA4
         nJiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKpFePMyBs6jC6Nts+8SzvjLGwN/A+fCwr5BvwO58jNbIgGOdAE8an5qNGIrDm/EdyFX5oe0BUMisO+w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxacV859jfEIM8X9lMZN5m7O8cqLeXRoMu9FLElzFUXtTR42pkU
	TCsRtAIHX5U4lwWy6NVhMTJ9O7WWzpmCNXMzFWpG0H+sVBL1Ib/PFKcjy30X+sbfUKw=
X-Gm-Gg: ASbGncsXzIc/WRtNVD/dsoEVFzssqbTs2q76zA+yTulYWd0YqyOit9HhI6wW2kK0UZ5
	3iRzxqtAm3OWRSIQepp0MMNtY1tZgwAHhBjQRzrb87EtDnm5P52E1oQVJZNLb4pDBGsw4nT+MPJ
	XRV71POUFO9Tb1ry94jgeedDt4vgqVRL0Qg1lzelDYQ9tWEc58LsYmKwuCmgHbubZma959hkh5L
	gkz1C0vNdgtIfEf8gIw0+Dkk+Ysj35volUl9/hc2UxTJAcG8ARiDxGHTQPvHl1GgNSGWfCqFF20
	6S7lvt6J/dsd6+b2oT30li2B3jB9XmjwFurFETWkIUwZYAMARxgnIfRhSnxUl3rfe7IJqdRO7Fw
	l1YLoJuDNur6KTmawFXYznNh47vti
X-Google-Smtp-Source: AGHT+IFbtVVMSZ+fpznQMGHkKUKbSTe4C1qJjVDbXUGkHv0z1uMwtIjTYIadxx/YhwGJBwF3TwZwOw==
X-Received: by 2002:a05:600c:8288:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-442fd6102cdmr142540875e9.14.1747731426327;
        Tue, 20 May 2025 01:57:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd6fe86sm184664845e9.0.2025.05.20.01.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:57:06 -0700 (PDT)
Message-ID: <405accea-0b4c-4891-9022-425ddc886902@linaro.org>
Date: Tue, 20 May 2025 10:57:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel-simple: add AUO P238HAN01 panel entry
To: Michael Walle <mwalle@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250520074439.655749-1-mwalle@kernel.org>
 <20250520074439.655749-2-mwalle@kernel.org>
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
In-Reply-To: <20250520074439.655749-2-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:44, Michael Walle wrote:
> Timings taken from the datasheet and the display is working in DE mode,
> thus the datasheet only specifies the blanking period. sync, back porch
> and front porch are arbitrarily chosen.
> 
> The datasheet can be found at [1] but for reference these are the
> relevant timings:
> 
>   sym  |              | min  | typ  | max  | unit |
> ------|--------------+------+------+------+------+
>     Tv | V period     | 1094 | 1130 | 1836 | Th   |
>        | V active     | 1080 | 1080 | 1080 | Th   |
>        | V blanking   |   14 |   50 |  756 | Th   |
>     Fv | V frequency  |   49 |   60 |   76 | Hz   |
>     Th | H period     | 1000 | 1050 | 1678 | Tclk |
>        | H active     |  960 |  960 |  960 | Tclk |
>        | H blanking   |   40 |   90 |  718 | Tclk |
>     Fh | H frequency  | 53.7 | 67.8 | 90.0 | kHz  |
>   Tclk | LVDS clock   | 53.7 | 71.2 | 90.0 | MHz  |
> 
> Keep in mind that this is a dual link LVDS panel and the horizontal
> timings are only for one half of the panel.
> 
> [1] https://www.fortec-integrated.de/fileadmin/pdf/produkte/TFT-Displays/AUO/P238HAN01.0_Datasheet.pdf
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0a3b26bb4d73..47222d2d8129 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1268,6 +1268,30 @@ static const struct panel_desc auo_g190ean01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing auo_p238han01_timings = {
> +	.pixelclock = { 107400000, 142400000, 180000000 },
> +	.hactive = { 1920, 1920, 1920 },
> +	.hfront_porch = { 30, 70, 650 },
> +	.hback_porch = { 30, 70, 650 },
> +	.hsync_len = { 20, 40, 136 },
> +	.vactive = { 1080, 1080, 1080 },
> +	.vfront_porch = { 5, 19, 318 },
> +	.vback_porch = { 5, 19, 318 },
> +	.vsync_len = { 4, 12, 120 },
> +};
> +
> +static const struct panel_desc auo_p238han01 = {
> +	.timings = &auo_p238han01_timings,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 527,
> +		.height = 296,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing auo_p320hvn03_timings = {
>   	.pixelclock = { 106000000, 148500000, 164000000 },
>   	.hactive = { 1920, 1920, 1920 },
> @@ -4938,6 +4962,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "auo,g190ean01",
>   		.data = &auo_g190ean01,
> +	}, {
> +		.compatible = "auo,p238han01",
> +		.data = &auo_p238han01,
>   	}, {
>   		.compatible = "auo,p320hvn03",
>   		.data = &auo_p320hvn03,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
