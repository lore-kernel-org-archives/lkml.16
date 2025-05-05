Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEBF1DEFD6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431604; cv=none; b=uwqXWlpkUo9Jb0QyCUMvPB+xz+7PcYA3uD7rFl3HdS/CWe5qKZn5B6mC2nKDxS0N4J05RRYd+m4oJe/gsGJ3ycBNBJdjmqEWc+RgOaArHr1NxI4F7He7dundeiwLRh/1McOhfc9tJFbJcS4ydAkg3mITiuCQPr70wpTgJ0Q/Dfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431604; c=relaxed/simple;
	bh=gRg7lfOlYz579m1iZS9cUWyB3XKHigP4oiy0csgp2/U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I0a+nvfRzLkHJdXTFdVfLvOojFWVyGkbugdjf9dSjK0fZlUUObn9JVvPMGdZjO3WvrX/S/Fs4q7IOQ6m06ek2P1k0Lk8hEb87czYS+TjJwA9WvLorjcovHYp0wrtgE0t4dUjtQFAsP1VcVAjShqfSDqzj26Fhhke8SxMZlQDtJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vq8YvsHi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vq8YvsHi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0618746bso26510735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746431601; x=1747036401; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKwL95uiFtUkueF3DdQ6WhU1f60LmPCrAu3GykUzsdk=;
        b=Vq8YvsHiwI/ugsNBN8XfxTBv7GWeA+2AnEolXF2yuXp0afrMgUkWg+e/LzY1rh0Nwh
         ZbeZjPYrg7ODHe/nqc3+AfvKkhlPHa2YqGEs/UJZvRVm9V+b68DA5SeQUye6GdNJpqH/
         X2oro3vfLiMbdjPn7EjgTvMKKDdthnlYT3vGrL+fHNKlkxsrYX1dYfw+7aae0mNyNq0o
         QKsFkbCV6ppQmw2AXR3HZkLKElnYISrvAZCTOsz2iqmY176tGbNE+oj4ULAwfYo4z+6d
         iM5ob/hSyDYI+tL1THINiGWCcq2z1WgYXW1+EaY0hYSaiOzW8Gg8jQB1BESt5aTXh//r
         OShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431601; x=1747036401;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KKwL95uiFtUkueF3DdQ6WhU1f60LmPCrAu3GykUzsdk=;
        b=R2jJRfYmoA3Po3BG58gKawM628pjyf7TiofEQGuqz6ziijwm8ef15riYOxgmK4Lwsr
         yEHzeGXafWCVz2phH1KU5iRi7uh6VIeJlnaZPqQ5es7orlBmWcrD7XgASuLR/dc6UwNl
         WvBoNuk+V5YL5hK4XnooY3u++eqx/59xHDweGTEQaLnLGa0KCNSN2PlNmJV8wcx01C78
         eyWuRdxOKSKBQutmd4567kaIBbKHhZugoYkLI3q7kydVeii67TJWFKLGdz6/sFGh1a2K
         FFlYP85wIYPyJsoz32+7lCw27+CCkelWy5T/IlnwFFSXjgBS5YS405fVjbEUZkELTP+u
         +5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWb8myZMJNLeXIrXWwYQ51hGJWlVTGdlsB5Pw67jZXSKmkPwfpakvKqk3TMvkk5mW6G/mdYa6jXhbnV1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfgu8WPLaTLzcBgZ4k7HRqf4+jkBp9M9KWSjSTif9X0z41W9Sa
	tJRAUqIAkAoeN6vws3JkEl+9hw9J3AIh36OBB9X6rurGSKyVM0v8dxYxgwrRKvs=
X-Gm-Gg: ASbGnct0DDYNaHsX03/Nzjae+RDFImQ5zVv/7+eNZPJuYIY0wxd09X1AYc4KTJtbFC7
	VUAp53PRMBZiXDgf7iW/IixRmQ8rhWcM+9ir3RTCEUMXMlhUyGPNBdjCmO88VQK8avoFmzMaFRA
	gx2j5BHiNsym6S58QUeWJPnOtb2YYF9sHgL+HEB3s80UK0fx95aFa1m7UQ96xgAZJj9EHAAinkw
	BvSnVuzDSamEF6BxxYKknLjpc49gyVaABnuU74uihtQ9zozLSvMzxs17SUayWTuFUHjxNK1TinB
	tR8LKa+CtnwZoEaFxRO6yHAlsxUBx44gFPGXABOPrxpb/f0faeayJ0wxhQ9kcOl2J9gtKNKktbC
	jRJQfqVRhMXluuAVpFw==
X-Google-Smtp-Source: AGHT+IHDMdih+hEnzP3vOjnU/Xs6E/jsrRii74HrFx4JP91bn/qL1NEIKUfcBUgSehWSzE/wSbcuZA==
X-Received: by 2002:a05:600d:3:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-441c5b51556mr31085155e9.8.1746431600756;
        Mon, 05 May 2025 00:53:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3344sm9405993f8f.23.2025.05.05.00.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:53:20 -0700 (PDT)
Message-ID: <dbd8e1bc-bc23-4240-b6b1-321ac6f5ed68@linaro.org>
Date: Mon, 5 May 2025 09:53:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: Update timings for AUO G101EVN010
To: Kevin Baker <kevinb@ventureresearch.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250428210726.3395279-1-kevinb@ventureresearch.com>
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
In-Reply-To: <20250428210726.3395279-1-kevinb@ventureresearch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/04/2025 23:07, Kevin Baker wrote:
> Switch to panel timings based on datasheet for the AUO G101EVN01.0
> LVDS panel. Default timings were tested on the panel.
> 
> Previous mode-based timings resulted in horizontal display shift.

Can you add a Fixes tag ?

Thanks,
Neil

> 
> Signed-off-by: Kevin Baker <kevinb@ventureresearch.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index fb8a57afe687..1a3d7ccb328a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -979,27 +979,28 @@ static const struct panel_desc auo_g070vvn01 = {
>   	},
>   };
>   
> -static const struct drm_display_mode auo_g101evn010_mode = {
> -	.clock = 68930,
> -	.hdisplay = 1280,
> -	.hsync_start = 1280 + 82,
> -	.hsync_end = 1280 + 82 + 2,
> -	.htotal = 1280 + 82 + 2 + 84,
> -	.vdisplay = 800,
> -	.vsync_start = 800 + 8,
> -	.vsync_end = 800 + 8 + 2,
> -	.vtotal = 800 + 8 + 2 + 6,
> +static const struct display_timing auo_g101evn010_timing = {
> +	.pixelclock = { 64000000, 68930000, 85000000 },
> +	.hactive = { 1280, 1280, 1280 },
> +	.hfront_porch = { 8, 64, 256 },
> +	.hback_porch = { 8, 64, 256 },
> +	.hsync_len = { 40, 168, 767 },
> +	.vactive = { 800, 800, 800 },
> +	.vfront_porch = { 4, 8, 100 },
> +	.vback_porch = { 4, 8, 100 },
> +	.vsync_len = { 8, 16, 223 },
>   };
>   
>   static const struct panel_desc auo_g101evn010 = {
> -	.modes = &auo_g101evn010_mode,
> -	.num_modes = 1,
> +	.timings = &auo_g101evn010_timing,
> +	.num_timings = 1,
>   	.bpc = 6,
>   	.size = {
>   		.width = 216,
>   		.height = 135,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   

