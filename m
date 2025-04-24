Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC86020A5D8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745482828; cv=none; b=uYyTYZjxWMwVtukOczoMzyMDc3zQtfMLft9PuvQRla/nxACt5NI6gTZWoQ9qQ3CxtlaZzcxhK9B2FJu7kVPMqgNoJ2HeeCGatbvyspyBHZEJ2kFRk6gO0AaAX43ehoyIbYXWCHTv8qUwGu2Qnv3IrfDFVz3Z/QrGPcdS9K3lcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745482828; c=relaxed/simple;
	bh=ed3wjflqMWesIm8Hum9FyZ9V48ykbZJEJ70Ynh21MWY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PhkdAHdvfMSjMjejpb6mrgDPooqSmz+spzIbEKRuMKvLZLpwN2B+vAriv/UGIxrCGfQwpwGmDiqVfim5Gu7WErtiX36u86u7Pkc81AJkqhfEFoiWFHdDt/m0oILTHjrIdHdEUCMjg+gM4d8UTZ6FoWrf/5a6u9KhrzZzsdct0k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GDcf4X97; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GDcf4X97"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac9aea656so882774f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745482825; x=1746087625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UIjTEcS5ZEUnsgAPWbRBZciAfnbC9hHPHaZHT5HHdY=;
        b=GDcf4X97qZ+KruRb/9vDzxhp8Rd7vFePxF0YnsR0i4I671CsMhQs+6gtQ4VgTqZMPV
         w/aaQB0ekJZncNjOi40fHfGBQ8M49h4/ns66wT4xaASIcXuuecDGW30WVd5zQ659LiVB
         apTLyayAJ2alQDSd7AN6+GRdO0+TA+BGD61T+a/5Xq1gKtQ2CFd2575eAsLAWWZrRy8d
         bfpOdDJqYJcljzKI12s6/1JVbDIdRtwq2DyB6jdmUn37uchqdKQTqRQU7NjVcX9QmerT
         vwOJyFqjdwhp33d0/WNk8/hgIMbYZCrhAQ0tAw7qmFH1GrSTjtjQMubs2bsa37I+sUFv
         rfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745482825; x=1746087625;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2UIjTEcS5ZEUnsgAPWbRBZciAfnbC9hHPHaZHT5HHdY=;
        b=QlYXZW2d7aiKaCo5HVarCefm4nF2bnQP2g8VXvrBM+0o797E0m77LBtt8a3DfQ0Nf7
         +lP7R8jaUHJD6yjGg43JNMqEhiMjHq0B64sIYa/zTE0IpGvLiQrTdujwrJtMOvGFilD+
         TVRgjXoyymUH8wmJsE5T/NQy2VPDtiYIszw0KF1HEgGI53mDu1Ldtb255sWqtW1H+vc6
         PP8+ErhP21HtXP03jynptilQZgc8gdA9hNQQa+uWmlx24xtBNYXAf+cNS6uHp3BxIZnJ
         9DhZyKuizzCL4W/rBzvVg6vrvXHEA44M2gBgvhMRGGEs3AM+uKQ/x754yL5QeRrZMQDM
         R+FA==
X-Forwarded-Encrypted: i=1; AJvYcCVIpWFMlluYhgnIOzgzH7u5bcpWEdg/t7Q/Un25kvtZaBrJO8wUy7VBYis5yVbAzEfleGpqy3C1t7UVl1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPSe7nPy7W+C+rOr/3PEipdxm+v3Hy4swxdIrufEnxnDkqZnom
	d5mV/g5MNbMmRD0UW8PSCKVPsBTRVtqk5oo7+m5pjuhAv6zh1+HnUg30lzTHiNc=
X-Gm-Gg: ASbGncvsWtfGo6uxVlonlo9veBiem6bXrt1fF8QDkC/aKzk6cWOKtL8jMlMmhFwosfU
	FoxLLSmUngfeROkz5WnpIZPWvcNNBcVwD1rH4bunyJKYKnRYpbymELkuL46FiX9dn6ouj5/hgIq
	uDH1xZTAYWZKvmXANWgOzGmuQAWtV3bQ7fwvK1itxqsu2/mAuIVyIKe51DGYFawNfu9b/WJ+B2s
	hr9M88hC8iQBt38KjeE+VechpvLjSTHK/4s/psQr1EaG5omp1oJSmChNcOyvCORcNhw55qLWPpM
	bIkSjiN5j/NeCjBT6R1t7qfwKFrP4Wc8GLbZSqyPICIi4/Bh1fawxrEqGJjwn9b/hynzMChuG+C
	jCeGZAmW0bK5SDJK5zA==
X-Google-Smtp-Source: AGHT+IHBK3pVJPc3YB+cI3CSl9tsM64w5vNMKCGAdlXyTj8g17Moufdmpj+OGx6bKPoP5csXDzubIg==
X-Received: by 2002:a5d:588f:0:b0:39a:e71d:ee34 with SMTP id ffacd0b85a97d-3a06cfa8d1bmr1117330f8f.37.1745482824838;
        Thu, 24 Apr 2025 01:20:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d532ac1sm1244633f8f.72.2025.04.24.01.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 01:20:24 -0700 (PDT)
Message-ID: <edabbb76-ab0d-489c-b034-fdc6dda59102@linaro.org>
Date: Thu, 24 Apr 2025 10:20:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized
 variable
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250423163214.2276114-1-arnd@kernel.org>
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
In-Reply-To: <20250423163214.2276114-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/04/2025 18:32, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> goa_even_valid is only initialized in one branch but not the other:
> 
> drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>    838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>    842 |         if (goa_odd_valid != goa_even_valid)
>        |                              ^~~~~~~~~~~~~~
> 
> Change the initialization to set it to the value of the condition instead.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index b48b350b62da..4f548430654a 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -835,8 +835,7 @@ static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   			num_zero++;
>   	}
>   
> -	if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
> -		goa_even_valid = false;
> +	goa_even_valid = (num_zero != ARRAY_SIZE(desc->goa_even_timing));
>   
>   	/* Programming one without the other would make no sense! */
>   	if (goa_odd_valid != goa_even_valid)

Thanks, Applying https://lore.kernel.org/all/20250423-panel-himax-hx8279-fix-sometimes-uninitialized-v2-1-fc501c6558d9@kernel.org/
instead since more complete.

Neil
