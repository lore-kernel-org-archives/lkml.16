Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9171D47C7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182763; cv=none; b=DFGRIHa+aFl1jiVwTo6T3oiP/6mCL6XrW4hjVqyhazIfdn7mIcgXg/ZdhUEL9Z5o5G+xaetHTzmNh2t3d5+AovakFQX5tbFCHxNXr30hSOtNGBX11bjzQ0/uRB3f8HTl6zOf6/LbBncvQvO+Orbkh4FugoXMWE+EZvEWkfYISE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182763; c=relaxed/simple;
	bh=gUTFPgHZuA2fRJX5swJwlY1v4En9eJXjCr5xI6uiKOs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gM7KkN28FhOU4uzuLCkuQONyhTFBNgPPVsv7/S3NNV0UPeSCcU84eC6zT+VwgwWe/OjIAyhmofrYwqu5pFkIUhUfnbZsHMVtXux+ddweQmpZWcsCqASMZdBlBk3mG6locKapQIIUSNYoVIBHDQboeI0QBlOnJ/7Uo/M1xXcxYy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7AKH5IF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7AKH5IF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361815b96cso27388395e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739182760; x=1739787560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lygczXscBdds42kuOhfdK3HCmBHDiuJxGTpAWzujpgg=;
        b=g7AKH5IFttZnUcPDH84FeieRDN/6ikhG9zdOEymvgdWcQupCEB0wxwzqLVrHF5dtnR
         u+KTtTbNnQFIU5mm4cf/1RTXfs136aP08ySG6JJSsBxsnN48PuomfoLVvExYNzlqDHJI
         tZ6ywKif6h+CTd6aDPBEJMrYFMTdIn328Wk4RIp4qzrv/EvhuKHP/udnsU2ALd8d1D4L
         WW5bNaRPh+95pdASePsIpL+WtHIk8RyOlcaBcSwd4v6iTYFYRYGpSlV/5kvzdPKXZfwA
         wNNPZGwM5Xb5lHRD/17+akAT4G5cEQaQD1g1gON5gytYX96F6UilFfcWw6u5/mr2byHv
         9SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182760; x=1739787560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lygczXscBdds42kuOhfdK3HCmBHDiuJxGTpAWzujpgg=;
        b=cpTpgOewHP0NGci2/ff4BAiZG3phgLw7UgxF7HH959/JU1s6RfmyPgyC4PHtAuvCl8
         7zr+niGCKPM+ZDTmPwv1neUZ/+SO4mTEadinYC2wVcB05YupfYdDwJCTZkv1g1iS2055
         ukvvVtHjAzeBqNPhrBnTKdpjB/auXF9a9Z5kUpq9DHy0MHKyIAOLRa3niN0M80KcXRZk
         uOe/PBJAjXYPbHZsfEFYfXhX7a7CQCEci9nTyGPlVsujPWWLdeEkzBeD2tz0AUzWq0nt
         r4iyhd3hnlGmggb8QDNLSXYWmQ19dgkJMwfmlIAijjLa+TvknlFTPOySu/seUwLlQnwc
         /2kw==
X-Forwarded-Encrypted: i=1; AJvYcCWTRgqU9wUeIzb3iDHyeyuoqaa50mZw8MVuZuFiTRxvQ3IXreTnU2AZ20MaVaxZS6bnoZZ446M22uAkye4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAAhXFUkp8w6t4zn0Zr9RkNXCfu2Rckyc00QKULspGV8qY9Ps
	WH3WOKOfsIo1GfWpueyBjSSCvXyLnX6UQ8IbBPbZGUdLAmZnev62lkbPy23AJNQ=
X-Gm-Gg: ASbGncsAhRAoIWL4bqZRg6XT2u0xg28xoExc3oAWZ0z1m1efQnfPm+gaTlnJkVCbRGt
	+fQ7ufmj/nziQ+LATV7yukmfsQHOr2U9x2bmsaxESznvi0TSOZCyBP0qm0Z2NaC1kE8CA7c7Fzq
	yoLszTPZEXNfa7QZp4g9jFP7TijkxN+SWzGAgA1RL5UJ5YU76Ua75H61MtHPGL4s6snLenhxkNm
	MOuwKrTkc/26QPpWr1Uvtr39Y+b7tS8U5p3lBkFg/lXEch+11cSjtB7grdVPeGLbAkqH88eBZDg
	rGXd0iD77aa+sCdeB/Hipj9kfSoppYz86JVdybJsDXdSWpPjgUxjkJ+ctcF1oHQvcYBA
X-Google-Smtp-Source: AGHT+IEnVpgRQ2LjHlyiujStrpj1rxjCcw3y2pd31XsyUAtYtKo1EF3DT0hhoHct5fksdXd4XHBb6w==
X-Received: by 2002:a5d:64a1:0:b0:38d:e092:3ced with SMTP id ffacd0b85a97d-38de0923ea3mr1498901f8f.7.1739182760083;
        Mon, 10 Feb 2025 02:19:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcb55b7a5sm9112015f8f.14.2025.02.10.02.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 02:19:19 -0800 (PST)
Message-ID: <e3402108-54a5-4dd5-970b-e3b416f87979@linaro.org>
Date: Mon, 10 Feb 2025 11:19:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Sync comment block with actual
 bus formats order
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250204-dw-hdmi-bus-fmt-order-v2-1-d0aaeb7a697a@collabora.com>
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
In-Reply-To: <20250204-dw-hdmi-bus-fmt-order-v2-1-d0aaeb7a697a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2025 18:44, Cristian Ciocaltea wrote:
> Commit d3d6b1bf85ae ("drm: bridge: dw_hdmi: fix preference of RGB modes
> over YUV420") changed the order of the output bus formats, but missed to
> update accordingly the "Possible output formats" comment section above
> dw_hdmi_bridge_atomic_get_output_bus_fmts().
> 
> Fix the misleading comment block and a context related typo.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Reverted the changes related to "Default 8bit RGB fallback" (Neil)
> - Updated slightly the commit subject and description
> - Link to v1: https://lore.kernel.org/r/20241130-dw-hdmi-bus-fmt-order-v1-1-510b5fb6b990@collabora.com
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 996733ed2c004c83a989cb8da54d8b630d9f2c02..d1256c82de96a43211af64ad70848cd18d5044e5 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2621,6 +2621,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>    * - MEDIA_BUS_FMT_UYYVYY12_0_5X36,
>    * - MEDIA_BUS_FMT_UYYVYY10_0_5X30,
>    * - MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> + * - MEDIA_BUS_FMT_RGB888_1X24,
>    * - MEDIA_BUS_FMT_YUV16_1X48,
>    * - MEDIA_BUS_FMT_RGB161616_1X48,
>    * - MEDIA_BUS_FMT_UYVY12_1X24,
> @@ -2631,7 +2632,6 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>    * - MEDIA_BUS_FMT_RGB101010_1X30,
>    * - MEDIA_BUS_FMT_UYVY8_1X16,
>    * - MEDIA_BUS_FMT_YUV8_1X24,
> - * - MEDIA_BUS_FMT_RGB888_1X24,
>    */
>   
>   /* Can return a maximum of 11 possible output formats for a mode/connector */
> @@ -2669,7 +2669,7 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   	}
>   
>   	/*
> -	 * If the current mode enforces 4:2:0, force the output but format
> +	 * If the current mode enforces 4:2:0, force the output bus format
>   	 * to 4:2:0 and do not add the YUV422/444/RGB formats
>   	 */
>   	if (conn->ycbcr_420_allowed &&
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241130-dw-hdmi-bus-fmt-order-7f6db5db2f0a
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
