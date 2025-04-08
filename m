Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16601D61B9
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122464; cv=none; b=kW9S0lxwtu+D93S6q08IWuxDLgkIYzapNhXk5QhQbzR2MFX6YsjXz+9LrRC91EA3lC9fhkn6pH41i02136lEs/CQQG/ehdCiOW4TWM48MxxVNzUov5gFkjuHBply6L0yA1/77/DrGLCr5VSqXRk5PyUsu7tIfWAWCRACnyjLzk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122464; c=relaxed/simple;
	bh=10wMnNq1UMaI2kkF37VxVvO8kQpxHh8UtPnpBkuHgjU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GsqquURnVjxoq3M8yN9drsCETdw1F2JpoafzYhKP2CG8r1cD/K41HQ1YC107usUuO8wjUgjNM3do2NK09bG4gtFyyzn8Tr1iap0emm4+KdqZ3INTdpjXcxVH3vzr4p9avyE6CXjVd2tx5LRobqtf4UqKL+q8aeoBEq8FttFLsFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MtqwjISX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MtqwjISX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so61202815e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122460; x=1744727260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=MtqwjISXJsZR6Vxh1yfj4S3ZXkTu1q8974FaO7Ymnoj/+HuhtCx8Ul4ItOT5F+pZJW
         ReHSX0oi8KmbLivAcrWIuNEQTLscvNNXoeMjRonXUNlCcdmxCYYPWuCv1K8s8klW7G22
         IrWF8486pTaKwUaW7hVJTMzxEvwIT7jr0CJaTmqJHngDF08ZmREyDK3oTiA6jeC/fQ+f
         5G1LJ+k1tn8YwwcpqBZmmWdRYprRtp8hXS8+S2MOa9es6zpeD80vNjAv+UepQ0IbmqgK
         xcPzYfE8TYvrZGrIkJvxhPLkP/9D0DT9H748Q+gOFhoETTUcESwM8vHFJ6r22oN1/swy
         IwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122460; x=1744727260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F6HfW0vkjtlkAm7uksKgsKqVu9qIf8mOl8bnZ7ef7cg=;
        b=Z5YMELnGgMalOWP2WZbQ1k7XBlwKidf6hTFcQs/mDvMZzTH5uYG5hA5ksO5iRlsNcj
         ZxYj3ucO6iFd8Epahd3lEYZwPt8rAC2x07vy6jvM5/Zs+Ar9uQ8vL1ecPBweondY4OO0
         /bO744mfWme7TLaPG69CLMEsxRL/GDP8E4/SkTwgAvsPm4Lm5mI2pcc+KryXQKvcUjzI
         TJLbfJ8lPvi5swF9YfH/fYMWpUmfJo7ZLCixgIPDxtfnFh/DN2ALPFpuglPaBk+ULjMp
         sKolJ6o2BFnSueUFcaUuIItwbctnxAW6g0g8YXI1+VUhA6dAQyyYe9z7vnhhxfDhOHRI
         FFIw==
X-Forwarded-Encrypted: i=1; AJvYcCUUNzlw3CkVs6oq9I3XDBqcSo+xJQBMvMEBqsb8kKEoTIqzeKr8kqy/9hyWYFC2hUZ48MeBJUAxgg1RlN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVfzWmTScdnly4TSXkTIuqBkfm5wFatWR5822nSge6VL5B+YH
	yOshSNtKeX79ZS+TlpoA4zzP6hjjouNbpCBvrWbcrHg9AkQZrRJoU1E/2wde3W4=
X-Gm-Gg: ASbGncsuXvi5GqpTHMVcsk4NnXweAeNyTt/HCf1DrynGErRAYXBsNzPN1UqpQ1b5rao
	C8PEcHgosf9SZBSbnLYb+OvE0EVxmX/MnVeCpsZ8BWCn7CVloCPpYbwsAckUk5lEJXSmI2l5EqL
	GkDFgop21MRQbAH23QpzZuvBbAtEfLZnfiYbkimUGR26KpnMst9pnWxm17lIWrkga1BDlhC3ZeJ
	VbFzzl7E6cAA6hdo60N4qQrwA8SlLyVcBnwYtEnYVax5QF3QVOmmqSmh31x/XDhMVObQw8hZZOu
	ctM26pkDn6+IDvYbf31pEkCX6pH3tlqyYWYH4SxIaiXIKzdJSGuE/r2KmHmwmizH5sDuvt4mjUJ
	WMbD0D186Ry6zmLniHqbXQQ==
X-Google-Smtp-Source: AGHT+IEFzSlrXkuwJ4BeZNVJDc79m98CBMUnaDEEBTa0PE1ADYZ4JU0DGBnfFovWynU4GuvtS6T8sQ==
X-Received: by 2002:a05:600c:5346:b0:43c:f597:d582 with SMTP id 5b1f17b1804b1-43eda5d8460mr90477265e9.1.1744122460377;
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3429f67sm169744825e9.7.2025.04.08.07.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:40 -0700 (PDT)
Message-ID: <ba7e31ff-5744-4409-921f-e2014f23151b@linaro.org>
Date: Tue, 8 Apr 2025 16:27:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 08/10] pinctrl: sx150x: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-8-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-sx150x.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 98262b8ce43a..d3a12c1c0de2 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -432,24 +432,25 @@ static int sx150x_gpio_oscio_set(struct sx150x_pinctrl *pctl,
>   			    (value ? 0x1f : 0x10));
>   }
>   
> -static void sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> -			    int value)
> +static int sx150x_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			   int value)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
>   	if (sx150x_pin_is_oscio(pctl, offset))
> -		sx150x_gpio_oscio_set(pctl, value);
> -	else
> -		__sx150x_gpio_set(pctl, offset, value);
> +		return sx150x_gpio_oscio_set(pctl, value);
> +
> +	return __sx150x_gpio_set(pctl, offset, value);
>   }
>   
> -static void sx150x_gpio_set_multiple(struct gpio_chip *chip,
> -				     unsigned long *mask,
> -				     unsigned long *bits)
> +static int sx150x_gpio_set_multiple(struct gpio_chip *chip,
> +				    unsigned long *mask,
> +				    unsigned long *bits)
>   {
>   	struct sx150x_pinctrl *pctl = gpiochip_get_data(chip);
>   
> -	regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask, *bits);
> +	return regmap_write_bits(pctl->regmap, pctl->data->reg_data, *mask,
> +				 *bits);
>   }
>   
>   static int sx150x_gpio_direction_input(struct gpio_chip *chip,
> @@ -1175,7 +1176,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	pctl->gpio.direction_input = sx150x_gpio_direction_input;
>   	pctl->gpio.direction_output = sx150x_gpio_direction_output;
>   	pctl->gpio.get = sx150x_gpio_get;
> -	pctl->gpio.set = sx150x_gpio_set;
> +	pctl->gpio.set_rv = sx150x_gpio_set;
>   	pctl->gpio.set_config = gpiochip_generic_config;
>   	pctl->gpio.parent = dev;
>   	pctl->gpio.can_sleep = true;
> @@ -1190,7 +1191,7 @@ static int sx150x_probe(struct i2c_client *client)
>   	 * would require locking that is not in place at this time.
>   	 */
>   	if (pctl->data->model != SX150X_789)
> -		pctl->gpio.set_multiple = sx150x_gpio_set_multiple;
> +		pctl->gpio.set_multiple_rv = sx150x_gpio_set_multiple;
>   
>   	/* Add Interrupt support if an irq is specified */
>   	if (client->irq > 0) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
