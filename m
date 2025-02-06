Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C0226160
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850807; cv=none; b=MfTGY4of1sCWeW+FjTIBTJDGei0LXTXgXfkYJJPIswWEV+AGxUb0ImqFvlAWB2ZYjmGGxhPDLjVVcj9tgYpZf3icYvZswNXa9+8wyjdK5B/m9kjtCKAzxnJCzKg+4YAKXRR8gyaNbwtO1lZVycGxVLKvH49bkup8nanQoMuwgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850807; c=relaxed/simple;
	bh=yiQpEUUwSTm4e6W3Qc3jdzTRP9AgBOi8N0L7b2wts3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ll+HE/cQky6KnW0kSLjbLptnje6OUsi3SRJSzU7TRFWmTT/AVDgXP1tp1AWulJgH0ICRWg7ObAjmJh0K074DwQALhbBUttcOoM9EZMqLncwND1/z3z3+VE5WmXQ6Edc8GpQWncCbxCKBec8OEGQlaAemhSpKXeKmiD8jF43dI88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6KK5E1b; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6KK5E1b"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436281c8a38so6508365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738850804; x=1739455604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
        b=G6KK5E1b6QXYa2Blx5mEcppZs921Wqbq8WfbsndKwcTV3lh3x2TUdjCBtJY7riIIGT
         D2HwJkDZWfgLRyOyfffaag9IzE7akH2Ctv2XCwuO0CiCoSDaVt8RHzXCvDUjzoKFD4Iv
         rAd+B067pQmlRsP4IC0tICasdYafw8StxY57+sMmm+Y+S6Igvo5RdM8Ud4mcbt9Ih0Ig
         1G7qKK01yMSrlE8PJn0/TfwmZBKIOzQrFvt2ejIZABNOGjuCbvjmqhvf3BOtSnxTegVF
         PQlLV0eyXIDQeo4wx+HH4wTrWnZDS0UKRhQ5cl0VoslthWpRNvrdoYAS9hKu7AKsXniR
         K4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738850804; x=1739455604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
        b=bNbAQDOrgRVT9EFHVVJoieA6qXLavUwZHtCXBoBoqXFcDtyqtfkPWw6BeYvnY1IZok
         AfjwnmKom0kSDJSZkTn0mQt1JCl+O62xrf1qzbapVCpZygDnslO8DksqXp0Rvg4bgDcP
         k1R4RatBjAEgAUuQxpNQJrZaRwbKLurkRq18/nDP//p2caQV4G5iOQXS2+2TwOPCeT0Q
         7ZHt0Da2z+T1hyNBNsrS9RRH9+0MoPNN1qy0B7AshgtrYMCkq8sUrDEUBqIq71/dDzrc
         cq6K1uisONGM4Su5JM4ce87Gz+de1ceLk+ClUz8KFUbkHAWb3/DnGQBa0BCgwL8yfGxu
         wE1w==
X-Forwarded-Encrypted: i=1; AJvYcCXU6T8PGWrQB4G46cGZvZRPTFMRraItcMldPP0Wfp2O1hzBmn0bEceHSX8hHcDwp7z/7sZiWHoVgNG7b5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoABjTyPwWuYvL2nJDvroHePj8h6LL8ysrOmNENL+HfVa/7+ZF
	a/T3/Bd+jeKwMRZy6Rj2I2j/pH+WR20WTFBH2q/+GuBBa/arzaIxYAYWrMqo6Jk=
X-Gm-Gg: ASbGncvWVNHTkdJhKMUiTiRFvilatnYKMP32JbpPBMilTFWbyV86GULkX1jgWXB90pF
	Ywr5GDdtOmYE6PmewwjLcGjFaOnuY1vTx7/rJYBeChSCuhHeWyt1aY1JeBSOfkeEwaxjHrJaPQV
	AArqa6IcE2gut3uBWAcjIGuFY6yt5vZOEm+lnHvzXxRlFBamFg+oXvgMBoxGiUra5EfoX1wwjci
	cnUk1VP+dKHXTfplHHhPXpjKuARQu5Qvk2TQLibsgMsjh05mGAydjwC8XABq/K8G7lIoEVUJpAv
	8WI1JzTJseMETmuNwP3b7qmeOQFFc3GxSkhZlV77s7POnDAHCbwEmOHDcK9Xgdi8CRl/
X-Google-Smtp-Source: AGHT+IHs1VOvbH74HBC3VcwOcN7MOCMT0bodbdljyOmjoFYNhPQCucKzp9v30TbevBnlEmQ683kP3g==
X-Received: by 2002:a05:600c:5254:b0:438:a913:a99 with SMTP id 5b1f17b1804b1-4390d5b2fa8mr64022775e9.31.1738850803080;
        Thu, 06 Feb 2025 06:06:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm1444844f8f.92.2025.02.06.06.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:06:42 -0800 (PST)
Message-ID: <cd9b99b0-0a63-4c6c-8064-e48f98fa7c02@linaro.org>
Date: Thu, 6 Feb 2025 15:06:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 5/5] MAINTAINERS: Add entries for touchbar display
 driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
 <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
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
In-Reply-To: <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2025 15:01, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   MAINTAINERS | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..895d682bcf4e351971b04c6515ebf685fd39b662 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7746,6 +7746,22 @@ F:	drivers/gpu/host1x/
>   F:	include/linux/host1x.h
>   F:	include/uapi/drm/tegra_drm.h
>   
> +DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
> +M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
> +R:	Janne Grunau <j@jannau.net>
> +L:	dri-devel@lists.freedesktop.org
> +L:	asahi@lists.linux.dev
> +S:	Maintained
> +W:	https://asahilinux.org
> +B:	https://github.com/AsahiLinux/linux/issues
> +C:	irc://irc.oftc.net/asahi-dev
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> +F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> +F:	drivers/gpu/drm/adp/
> +F:	drivers/gpu/drm/panel/panel-summit.c
> +
>   DRM DRIVERS FOR RENESAS R-CAR
>   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
