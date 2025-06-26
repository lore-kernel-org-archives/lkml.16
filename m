Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F012EACEA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947175; cv=none; b=nescwISJe2egsCrWo+7Z6PlZkZh4ktQwT0K70Y6OrUvoKZEJm34KJo83Vwazivyf441VNeszN3uRWS3YcH+led7K1db+gBBjGidR/EE8rJzok7zjjh3tkYqAyc9CEQuo66lhZJANvjkLNqw1LOzkLqVc2irSQ6dVXgLiG5On3wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947175; c=relaxed/simple;
	bh=Azki2qxWkto4m41ZbBw3IYV4NxcZjZlLTPXIZs02hBg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iSwrerA75CTl/Mr0Kz3xqBDCsnyoisG+29HD5k1BdlpeGe645ETrDkYGLty9X+LRV8zagFPjVULAf9KHeJ9kiikaK5nYsXdv/0/HpQFTzf0QBBnL4decTehj2qGN6MJtUIPLkoHFCmMLSvvs5F3VyiGifFWxayqPa4jaehLlouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsiStBz0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsiStBz0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso6986465e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750947172; x=1751551972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idh10+JsRz1ZHjVnaSYCjG9wWXpOOuIrbzWNYHckzT0=;
        b=PsiStBz0RPdu9ioruCu8/BwBH5P+m3/d1DGlAt77U/LkmIGRPaKCc50VqZYLyOBcw2
         OC6BmQOSiVc1u0nFNABDAtz+wxtFeEHxPHalOnKZswA6mME9AVNGQz++4bnVpGnqfI+K
         nMYCI/dTAxDC9uBR7UprvxEUyxmNd8UeGyiBslFikO8P4y/8OtJu2qtPy1zTMJ6gceKE
         /F3Rstpz6dH9dRr7zxBMWZiM0JH8eZmb8doapanpQDU0ube9yvuPJH+XfdtbJdzat1Bs
         Up8InrXO38T9Co2fYK9k2xzkvfwRl9VJukeLV8DJ+YPKIysRDVZxCxqxE/p7a/ZjcNts
         Mfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947172; x=1751551972;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=idh10+JsRz1ZHjVnaSYCjG9wWXpOOuIrbzWNYHckzT0=;
        b=mItK3O2yz8Wa7fY8Nj89Wgo10ZWZljv7cpWISfqJ7TlwUQU15HOSpcJtAlqGaAht+E
         3/V/OW9OPFYF5Vp8qaB0X4ykuF6wkhhkEs0oC3lVnuApHR6EZO/BEQBZX++f6ltcEiUE
         vHHv828+vlSrdPF9W+cnGvjcN1AZEDibYJxDub+7pJ22cK23uWZjevBxkpJpKNSjxvy+
         WxFKeddnLCo5VOiDTGxh/3wd5yV1earjXQ20BNy4mj1ZGTdr4n5qFhxgUe/G8Bgb75az
         gdW/rgSUlP5Cefi3HOMPutTqMF8BU0jOxatLkFy5EiBga4fRKtLni96GKyxXaHVmjYS0
         HvUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMN3XIYeX8IU104Xtu+780as3alt33hdvhNiyHIdFQKDeL7KutT1CQSThnwfxZvmqM6V1UGM8F6lddxH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0VxI/netAFrh/GljNVArW5YgHgeQXh7M9CzO5zdX7XwmHL7r
	ErCGpq1Sgd+zTAlPez+B8iIUDng2F9OGaJz+5Yr1KPE9VqAh+eqJPdPv5CkG4H1a7AY=
X-Gm-Gg: ASbGncu020wlgBnNKDSqhjc4p9zENTOhZ8JEvcdd/tIaiHfVTvaPvNB/ggzcWuYp5zl
	QrK1ZpKt1AdhaobKwNubn9EcS2lsNLe6Iz8YKImT+SIrtbdhBYeoz0rfU375veiHJ05i0jwUU2v
	4J+hb1MDW44oJgvi4E+ABUS07aOsvw/Bf2hG7F4QFCtQ2zVap1sF9nHO0rMRk3iF3ybw2zrqEsg
	/dypQQ6yJR1Rm8vAS99Ng0jkWpB1xOivvWtB7P9X/U27sdS8IMur0muRXSgustG7XK/H7pM9Lai
	D+1MZ+IqUEK1EDKqmqRHiPksUs9gesbjoGXb0K86EsxU8PONBhyXYIW7u2udlKAREsO1tdsjx0X
	KqoQKT1H183lYp8xeZcJ2tlynF+Tmzi33oUhEIM1Yw0W0WaD9Cw==
X-Google-Smtp-Source: AGHT+IE7Q7mlKruv8URp7hHM6crDlnNtpi1iYsCn32qtT+RUqOTHjkI20cptaGqB8cXtsnPMosNgUg==
X-Received: by 2002:a05:600c:630f:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-45388a14880mr43012765e9.15.1750947171441;
        Thu, 26 Jun 2025 07:12:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fa6f:b132:4858:18cc? ([2a01:e0a:3d9:2080:fa6f:b132:4858:18cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ba553sm50242095e9.31.2025.06.26.07.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:12:51 -0700 (PDT)
Message-ID: <60f437b3-2780-4bd3-95a4-d0453dcb83e7@linaro.org>
Date: Thu, 26 Jun 2025 16:12:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: khadas-mcu: add cooling-levels
 property
To: muhammed.efecetin.67@gmail.com, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, lee@kernel.org,
 rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
References: <cover.1746518265.git.efectn@protonmail.com>
 <f4d27c690b562cc72997c9ae00c6145b3722561a.1746518265.git.efectn@protonmail.com>
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
In-Reply-To: <f4d27c690b562cc72997c9ae00c6145b3722561a.1746518265.git.efectn@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 16:04, muhammed.efecetin.67@gmail.com wrote:
> From: Muhammed Efe Cetin <efectn@protonmail.com>
> 
> Add fan controlling step property which is used by Khadas Edge 2.
> 
> Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
> ---
>   Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> index 084960fd5..f69643aae 100644
> --- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> @@ -11,7 +11,7 @@ maintainers:
>   
>   description: |
>     Khadas embeds a microcontroller on their VIM and Edge boards adding some
> -  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
> +  system feature as PWM Fan control (for VIM2 rev14, VIM3, Edge2), User memory
>     storage, IR/Key resume control, system power LED control and more.
>   
>   properties:
> @@ -22,6 +22,13 @@ properties:
>     "#cooling-cells": # Only needed for boards having FAN control feature
>       const: 2
>   
> +  cooling-levels:
> +    description:
> +      Max speed of PWM fan, from 0 to 100. This property is necessary for Khadas Edge 2.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      maximum: 100

The cooling level can be detected dynamically by reading the MCU register, so
just set the max_level to 100 when edge2 is detected, and drop this property.

Neil

> +
>     reg:
>       maxItems: 1
>   

