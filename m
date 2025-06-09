Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF551D6187
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749490451; cv=none; b=NP+pHmkfbf5qHACshFQqJNx7NMQksL4O1E57fIYRxW7AHoabDNgXLFtZr0sAAah+2l7qKdUXnAnyS1uBylew/tLq1dbuvYSlVJk5aQgY0ehU0xyBCc83ADcZTr2NoKHIkRNKpSptxo+r7uTzwZK7d3KTOL9XCTQuJVIZSNNwac0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749490451; c=relaxed/simple;
	bh=Zc9BIv4HZ4iH9qRz6+HLgYKYYaKdTSCD8P9Xw3x4OfQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lh95oAH6EDkoFdSRD2bpo+63qbaLxJfWtBVgI+w5As9HOu5EmFF7xSBR4OUW31SeXG1G7u5nHoQGCV938tBa/lQjUXAChgcOaBmRcTWvn0drOOpzNIL9ytHyupTxr2wlK/yIcJZIzGrwksOBCiW/ISXwmf+RT9QO5jp41vP6emA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JUhpOQSW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUhpOQSW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so55948825e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749490448; x=1750095248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=;
        b=JUhpOQSWIYm1P3VI+Qobo4FmfEOeHyL2SLWzeIVdgymfBXEGUYJJFALRbWxNEL6MPf
         wDJYTJ2U/ALxqefTyn7nn5hSNLyz78ZXoeMrBmmQ8GMQAPzM4LwM22SJ8Q0Ryv8n6lTI
         OqPsIFruC3wBZ3vjsxR0J4qPHlDfmKsDmhwyTxHy/LPha22/1XIT95fhzHpSb2DxQnzL
         3hClFydGhHneBhbA5IfyBYz6wIjlbKVnxOS6eOkPCj88dXTs6Cfk9viA4v3A1kdzLCFy
         zidudDYhGofwOTD+rAEknmWK6865d8lVVwt7RQ/eWxloh494PFGv/C/4SvSsG/eRfVn2
         CP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490448; x=1750095248;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=;
        b=diumyaJ8yt4z1+7XCu9oUrt3cppp2F+yrqVLdL+6kbkkEcETM2CNaSOubeosUbywJP
         V5A6G1bvBD+fh8Q104JICYFH2RdW6wbOoZHbCug6juDQrqZSaCzBYlr7ah+DcGo2crJ8
         QK2+41K9Hk8LIh6AFG5tyC0EUgquL61AkHaf1/eHrIUkQgUzIvx8gekGgnEn0PIA0HPW
         HXjg3AMsLKrN/K6q2WpA9wsu/dLYyj4eVk98m0hnIRN0sedMr8D9Sqap943hJirrNgl2
         ZLf6c7dn8zKT1fSzl7LsZZTEvSoJ9PgRIeaFs3z2BHuiiPGq6pBOM/6VQHDxjJmXNjqw
         eVZw==
X-Forwarded-Encrypted: i=1; AJvYcCX/aLquB3drXVqfYkaoJfhziL8RTs8c1Fd5/eIvp/eptN5ANAYwAJIoxhZAjJZReHHuVq6xjE6ZlCpHCmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnxwMVqY5v5Nj06PqBVXq+ch5YuKC0ajRplZpEB0WMWmDurBm6
	yBk0tJUrcDHtou4wC9zqlSJ61O0b7Lpg9/QWtKh8sOqIgZRlKyeHQxGfYq6Ol99C1RA=
X-Gm-Gg: ASbGncud2JbYbd6kiCA17rDr8sjJ4FTQ8UR0HzdNVvpaaHgWr21Jeiqbn+3o5bxE92v
	/GvJIdfvgjQVY0FvlZez1NnVIAd9++uwLmX6BGqgrKB0yyK6PN++6dGhbfZA44KoXsxHPbAhWzs
	ThVpbaxSuOQjuhN3blhUlmSJjZNSs7rLNqwBDzBoPhw0TGCQ511qIsii2VP09GjZGChv4M9icmR
	9LbnFJ9L4RSv7ukFU3fsOS4CObu1qPVnjTWgsMMaN+GeLGNquyfekK5Pauo7DhM66T7boxxI0Hl
	nzmiO9QOKfY/Ma15AGXg+5tk8m8LXgm1tJqFpP7hGWtKaAT9e2O5LEDc6Q9C1kzQmrzobRnkeZ6
	qyGG58xFE0YFfWYuxT0fu6VJykqwN
X-Google-Smtp-Source: AGHT+IHjGXyFvXdDAggENskwqk5z1F3qFDATDXWh/Gh5Xbnntn1Cd+D5lXKZIFiINl589SC7CggLdw==
X-Received: by 2002:a05:600c:8b23:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-452013898d8mr137331575e9.13.1749490447982;
        Mon, 09 Jun 2025 10:34:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d049:de0c:efef:b94d? ([2a01:e0a:3d9:2080:d049:de0c:efef:b94d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d162asm113789415e9.39.2025.06.09.10.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 10:34:07 -0700 (PDT)
Message-ID: <6400f504-eef7-489d-bf06-4a0a13cd5ee5@linaro.org>
Date: Mon, 9 Jun 2025 19:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the HDMI
 clocks
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2025 22:37, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 47136bbbe8c6..ab08d690d882 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -109,7 +109,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   		venc_freq /= 2;
>   
>   	dev_dbg(priv->dev,
> -		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
> +		"phy:%lluHz vclk=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
>   		phy_freq, vclk_freq, venc_freq, hdmi_freq,
>   		priv->venc.hdmi_use_enci);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
