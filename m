Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDBA28C854
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297936; cv=none; b=M3d/Ms+TIHKn5kSWoYhMLQANYHlepHCpq4BvseGiI00TNs1wUoYJad72JgI2j0+TNFHjyYsoxhRTvNdOynevs+tqJo8pewLSxsuGpfrSkd+0x+A6A7W6B1TAX9VrBAWAv2KOrCm5VDOzcMyojOJtyfPFsb4jw2CC1b5PIkac8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297936; c=relaxed/simple;
	bh=46juRB4cnPCgID5qX0cQvtLiWAQsJL0WXMKxQEoap5s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TsofiLDh57IMlaObgpvB7wb6HW2sr7MJVDBeT7nhtFjpbWkbZ790xZpTM3TgBWdd8Cr9olbJreAQghRi05PmFHF6TYC9B6D6RzfQPzgCuoXBbm/PkK2LViAaw7MRjT8Mkf09qgylWwZ2yQX8wqRr/j0thQjwVlUjMqANBpVwVmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qAW9Yv2M; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qAW9Yv2M"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3380850f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297933; x=1751902733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCjZELzPSxS9QYqPKLbec2iBxlI/QaXykzgWpjGlKU4=;
        b=qAW9Yv2MBlYWPkSDcqlKx1IrOzHMXNmutEle8LfvCAGpbcb5h54GUBjiIt2exYszZA
         r3gDomaVTnFeHKmA+3Y3K8S7PghZ3kTzPDtRVglsmXEgReLOzrxaYlMFXETNtqmEjQfA
         wWkfoUQmZtA7rl2wkiJnK3i87MMw1XHpsslvOLn8ItCcKpAvqVnVmhOqKAGPHYbGBL0Z
         gtwwBR0blFstt0XhvXBuiyorL0R72zaf5HXUPzHIedCTHgWpWXjAwvknFKnWdWj2BPLF
         uNHeWPI0IyqYxQbiHwi7BMkLIXlQ7ruuAs1+giqtPZnG1W+bAUMgXGlwRVnCYyQJ2fxD
         aLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297933; x=1751902733;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PCjZELzPSxS9QYqPKLbec2iBxlI/QaXykzgWpjGlKU4=;
        b=vg1pDVcslzdNPCclNSc5+zhIPO7H0CploBqdxZKna8fNQdtEbkqYlzmuADJ18f7kc4
         BSksgDQOAhTa03jz7dSpgsIMdoB8DUCYBZcpqpohS0B2VjtSq0oEpl7Z3yHoTASwO4X0
         DxSZzf0MU1WUjvDeyJYia7jCIw09/poK0t9uL463HADDo/s6okZbZdIwhZ4N5wgAmuRP
         JdVNgzKy/L0JemqbqCyUXsAL27hwNgT71ah7IJKVyXwTNJ/KcOkbE52h44AyGZ2cRK1u
         zfBq0q8Key/IyGrtZk6aDLbqU8QHq7E7/B0gPPTQuS5R/sQrv7fgpVkm6rX/2PW4myzk
         wziA==
X-Forwarded-Encrypted: i=1; AJvYcCUR0xcIh7ONen9A7K94k0IWUIIR48dffUMPYBhtrvjNdOwPqMLC684xrx2QpllZU46dxMnTL04sdfytgNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygYW1sGUewr72/nNGi++YqNfxztNcnSHgwxIUDfSUmGhtT7Vd+
	/Apyva1tPQTweHCofImiOo8htGIfuErtuu6uktSOn79bXrcYrG97PwS3RxMPamlG46M=
X-Gm-Gg: ASbGncsL3v7Du8+/xBa3Qe3IlpwbJbA7AeayqqOG2tyAdJWAaku+kG5NZZBEpKpJK4v
	UZsLy5MN67R/xW2ikpVsStoqTu1XA8fqPd/eJvjBQYlj7ucyYZ1U7MKp8mEAgQ7y422hZ7J6gG2
	7v1AXV+pbXffeD8nXuoXlUUxxfHjMVMZix29G+uaRU7TqjkL8yb/t5xAVrvM4bra+XrejJ+9u4C
	SJvkml9zdFyXRarBch72NSPq1s3QB0NZZx1WxooTfKtzPwaUcn4zekvY/VOlPEzNBMnwlc9bbdh
	CovpLMM8IuZENW/kapG5uJqJzk35/R2RXT8be3Euxqz2oVNrYdswtNq4y0QM+1peyklGyBH8S0d
	Myj8JeP3/1MKW2ouLqWRgXcvo3wSRTP3ZUHNBTXM=
X-Google-Smtp-Source: AGHT+IFqHhtP4Y3HxrFKlrCGwcR9+plw1U5mclKPp/UnXXU0dZLGQ5Cy0Ec0Lil6vNNQxT0a+WTX3w==
X-Received: by 2002:a5d:6409:0:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3a90d69ccd2mr9641294f8f.17.1751297933367;
        Mon, 30 Jun 2025 08:38:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb? ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm139822205e9.20.2025.06.30.08.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 08:38:53 -0700 (PDT)
Message-ID: <d105602f-6884-4a02-bc08-4ecd33781c56@linaro.org>
Date: Mon, 30 Jun 2025 17:38:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/panel: samsung-s6e8aa0: Drop
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
 <20250627-dsi-vsync-flush-v2-3-4066899a5608@pengutronix.de>
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
In-Reply-To: <20250627-dsi-vsync-flush-v2-3-4066899a5608@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 13:45, Philipp Zabel wrote:
> Drop the MIPI_DSI_MODE_VSYNC_FLUSH flag from DSI mode_flags.
> It has no effect anymore.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> index 897df195f2f3437224d1fe9f42d0bfc761541ab2..1b5c500d4f4eb7d43dff4b452a0f1b1bc06f5a2c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -992,7 +992,7 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
> -		| MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
> +		| MIPI_DSI_MODE_VIDEO_AUTO_VERT;
>   
>   	ret = s6e8aa0_parse_dt(ctx);
>   	if (ret < 0)
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

All patches can go with patch 1.

Neil
