Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26D228F947
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297888; cv=none; b=r0/Z15/J3ZyVgXwkcux0k6lt637FUX7lOYo9Z5nWGooh4ad8riNVj/sS0uVWbMeLELmqzTJ5d1OhX8REbqgW/V6IzwSFPnI0gN9fewVeZ4EkONwNnGqJhqwZy4gyZshxzAqqFeBT39LFNsbhBuCRdd8s6DEXsInb/QPhnSVCXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297888; c=relaxed/simple;
	bh=yUCc0oQCFfctlpIZuVO282uvHkEb8rchdW+hTb/tAaU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KxnfV9+W0l+CY2Z7YBw3gabWCalt7cwYQeAJhht8vFWZnEtduFvzuw1e5k9AeS1LgA+Zt7Y75uc7Fb8hhFRXb2sKOOsBhm0LZRRzWQzLYdQwv6GkBlMufyzOnQ5ZrPC2Q9DYxTxWbR0H2mjgKltiQBa8pT9FosbtrnY7Vewy8us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqE43Byx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqE43Byx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2664143f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297885; x=1751902685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBYBhwpcRxY/Jd/+CDN7HzCgINH4+hZjztRmKZJOT7Q=;
        b=QqE43ByxxguWb/FKMCM4G6C9Mwihan1Xb1BrX3/gxUe3OpaC+SVgSY0s2Dgp6ATPYG
         dkcPhAR5/lWr0GocjBl7X0tGfNVJqM9PEwLhT/QJuOG0sEEJXlNMh0Ja6cXpR5jK1u+P
         ai0Fm3AsEwnfXuwRXdFUEug5L6GsOC0t7sfGw5ETAf2Pcu+5roLm9FAiVnlB6oiq2gBw
         3SDcB+OD7J5EWLzEPzx9iSDOqZUhd+USQ0l3KreRG/BusW9ZGh6wYYqrLzDYhh9PujFk
         w3sMB0y1Cq1RapYOG3RuCpKl4NE3gPJISJwHVi8h90Z1O68r9vLmvY0U+pqJrwZgYf5m
         lM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297885; x=1751902685;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kBYBhwpcRxY/Jd/+CDN7HzCgINH4+hZjztRmKZJOT7Q=;
        b=h8v3OdJI6J6T9tQhHxIBCzvqWcaV5FnZVjBuyJpWfz7RTjl5eCnfG0bq2ETNOy7B19
         eLZ2xWCttCLs/9PuBO9MUgVpYNTVbcgvxJYKfxPt8oZBL/cKa5EkpDXwD+p/5Cyds+HD
         B44l81r8WSazArEKi6lFpMe5YUYnEz4RGQg3L5WCmtDWpSaYWbAIpfeA2YgTonldGVr1
         PKVNdb3YvwQrGRqJ5PRpIStq2nAt9AAyKHNYDQRMgGwEi/4IIG8WjJTG3PfOu1LRoaMc
         dJ0xNRtxhQgdix188FfWcBeKqr1pZNmgLhRqzzDI79nXfFMAyzLH5DtSHsYdn5SYZ0iA
         OJ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhkLMM1nqI+W/RiLYSoNrfl291oHt2B37eJ3YLo0SewhBOj6hZUJvz3ltuNCao7MBmrG5gEZOvfTnKxco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbyj+HtAjCvtePKhcFXS8nV3CWJIsAfO3yuHwFB8kJzBk870+9
	DikIatQF6BpMMeSTQzCi/vHPbCjwQ6BNdafFsN+/SwCjDMZbzrCwRegXsw38VjnysjE=
X-Gm-Gg: ASbGncvvnndHWUW9SJzC/O3Vr46P1eM/nPRCdtKQghpkxj5nry0nz0w1FKmjYpagm3I
	a3MblvabWGAjkkxqnThyR0MBlAGh8UxMZSYHJbqphgbWqmM97v8t+nuG1n1FzDkdgXX+ogC/4p/
	1YVHFozb2/PoETodV1QI3dUO7OZYWgIdfu+gnZkHMRqCLEeMbjME5TPevNFrZHuCs7zwJSfoV0i
	+wAH1pmOjg6VdQrqWY6tOq55Aq4wUERZFRrqCg2bi4LTgi3rgAdxfZyWZbk3s+Ltq0+v+2Rdgko
	4z61oArRiB4J07cyelsOskQ3kEVABZRxn8h1LqBghWTRJSPxThDiUf8keo+aKhFh+dWdcqhDRof
	vAsEI+sgOOoudTPqRghIprsPKf2PRGl9CvOFzRj8=
X-Google-Smtp-Source: AGHT+IEUoU94cC1oSfUzyPImh52uwvVHhB7U9vQp9z63F5Ex8cmoa1pH/HClg421+oFMMIOZeEylog==
X-Received: by 2002:a05:6000:1789:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3a9001a1ab3mr12911355f8f.38.1751297885084;
        Mon, 30 Jun 2025 08:38:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013fesm10907124f8f.38.2025.06.30.08.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:38:04 -0700 (PDT)
Message-ID: <ad40d0c9-2bf1-476d-b3bb-0c6ee165a784@linaro.org>
Date: Mon, 30 Jun 2025 17:38:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm/panel: samsung-s6d7aa0: Drop
 MIPI_DSI_MODE_VSYNC_FLUSH flag
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
 <20250627-dsi-vsync-flush-v2-2-4066899a5608@pengutronix.de>
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
In-Reply-To: <20250627-dsi-vsync-flush-v2-2-4066899a5608@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 13:45, Philipp Zabel wrote:
> Drop the MIPI_DSI_MODE_VSYNC_FLUSH flag from DSI mode_flags.
> It has no effect anymore.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index b5b9e80690f66cc62acbd341865d8d47419e498b..692020081524ad9d1bc815464fa447b5a2d9241d 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -244,7 +244,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
>   	.init_func = s6d7aa0_lsl080al02_init,
>   	.off_func = s6d7aa0_lsl080al02_off,
>   	.drm_mode = &s6d7aa0_lsl080al02_mode,
> -	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO_NO_HFP,
>   	.bus_flags = 0,
>   
>   	.has_backlight = false,
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
