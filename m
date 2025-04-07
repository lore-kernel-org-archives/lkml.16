Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6518DB03
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033779; cv=none; b=EchkP9xVPfYKKqszWK0Uw5z2+uZ6APQRQEnGu96Kauv6Rn8Nf2mpiluXQu0U5psABPYYLg8EHHnT8Rl8lTh2z7odjHT9Khp5vXZvGa8v0/PEDAGC5N0/gPnJwnuUE3Sj38AbBZ4TrgRXJ5YIc3i2XtOI4vcG/4OGRX6ayYzUJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033779; c=relaxed/simple;
	bh=WhV9u4IQQhmqgaWXSsNMfBXHEeR56D8mrLfD4YSL1jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xgz2jcxtPSP/aqXBYfYjWZqUE/xYUG9ZdPfXn3bSndZTIWgzmdzoQW7TjtwPvikcbb07tv+ev59ozAky2+JZHDNQdNcsxtWbVkC1oPp5MjFNUA7+vSEgVzddoI2gvzftAW0+Z9oWW9jZ0CKEUHlMqRay1UXOf0P5zivvzWyfbeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CHn2fjav; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CHn2fjav"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4003b22c2f4so2891680b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744033776; x=1744638576; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=CHn2fjavnRMMXFPMdiM8wCQdSQq7m3B5MrbyCeMlb+nwZ7atw1lcO8mtNCgnwTD+lK
         EJMF4/55xR5QufM9zMHLTwFrR1zJiM+F5khHEBC8wnqlC+nPw3ZBJ9gUWE3MArMF3AP3
         8jVCvfIIpyMCrvawBaJmK9sph1y89rNNgUwhC3eLAeM38KTLYPfhJxumz938I7Qv9IGz
         54XjksTUoNgbKTzxfHF5KmXwvEz29dQ3O3ytQW7zpVLM39m8KHGhALbfDcIasgDaJ5gJ
         zMgVrQ0a2L+UrkuHf5RA44p4IJEPmaiCA7K+KP0SAtI8dKbebAYyBNtOPADaR87TnBz9
         az8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033776; x=1744638576;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIXA1CtYmOM8PewjK/ZzArTuI36AiEw8n/KPp8qCjcQ=;
        b=FEziik+BTKobpo4Q1Z7GnEFyah0l/h6+BNcy/byjQj1QFlW1Tj/4D1NrGtkXP2crdD
         hexy9Qnu5vFwAZl1WDt1bv3T8f7X26NI0GQ7/8n+fXPFm+S8rZqCPM7U/qPA2v9oC2ed
         /WO7hZGXsJL1RXxMoIXuZMmxEdrkUFwXf6N2U3YbUptqbz3uVL72UXJdOyTZ5ha95pl8
         ZDqnWpjPF2dRPd8rCWoy8J2M7xVtk07OWeIJRla/0qNKEOKkIOhlGCwcDeuMTLNkZNET
         8aROv56jMENQJUXDoI6hjWs4Ngz30DIYKjB0Dqew3z70nzGy48rMzUxsfPNL9VAmqO/s
         AaPg==
X-Forwarded-Encrypted: i=1; AJvYcCUlgDTX1hKmcotQ+Pyo91IDvIS1sYgjnRLZ5rFvJZ6eKeBKG1wmi8WN7eCDOEaJC7oEsUnFjtDyKc2QdSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkHRxj3A3qkbwgvvGw5FnVVnFQ6yEMB6h1ZuM2jhW38mlEARHw
	aC72cAbCwoanVCkJdG8XohKO3VdMeFh9exNRsHqHnhPS6XKeZBeANSkHe71xclE=
X-Gm-Gg: ASbGncvqEEujlEFTzBlZqhY1djdjM4yoB+JkULyychRPmliGzcOf2Gou5He6PGMZMAU
	qFHagGmDgVphsEa9GfZMi01GQFnxqjFrRO/0TfzS9HlxQQ7PXTdPdh9ryPdxxob8WktB7icGTCS
	9S/IxQlpvF5EoVfL/pWPlr3Bx8j3fttgBEM7Wke12cFhDTX9K80tNPVF/qYTxIP6Cvhq5NmySFP
	JAhZi8S0eXP3x5nJYFaaHzMoOmIbyYhyKCU/WNnkD5N0x5GQtYxDKS+D7GvJDBEOo634NJDaFAz
	spsW56DfSKkL5b8DbQCyEqvRpykOzpazPdH7WlIuXITHDQTJ7M4Vla/Zm8r4OUWKXEEjqUMVj19
	37U9AEQIEOQ==
X-Google-Smtp-Source: AGHT+IG/WeJOsYTJug2WwIegYoFPtqQ1kYLmD+mN7tixYlfHeBiAMs6zs8YlU4OTlrzTKkroXpuE/Q==
X-Received: by 2002:a05:6808:229e:b0:3fb:57ca:1ea7 with SMTP id 5614622812f47-4004668c4a6mr7559744b6e.36.1744033776048;
        Mon, 07 Apr 2025 06:49:36 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40040099665sm1725950b6e.43.2025.04.07.06.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:49:35 -0700 (PDT)
Message-ID: <184ecf87-823a-42ef-9903-a21c787e0c5d@riscstar.com>
Date: Mon, 7 Apr 2025 08:49:34 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: use new GPIO line value setter
 callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 2:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Here is the commit that enabled these:
   98ce1eb1fd87e gpiolib: introduce gpio_chip setters that return values

This looks good.  Thank you.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/staging/greybus/gpio.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 16bcf7fc8158..f81c34160f72 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
>   	return 0;
>   }
>   
> -static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> -					u8 which, bool value_high)
> +static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
> +				       u8 which, bool value_high)
>   {
>   	struct device *dev = &ggc->gbphy_dev->dev;
>   	struct gb_gpio_set_value_request request;
> @@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   	if (ggc->lines[which].direction == 1) {
>   		dev_warn(dev, "refusing to set value of input gpio %u\n",
>   			 which);
> -		return;
> +		return -EPERM;
>   	}
>   
>   	request.which = which;
> @@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
>   				&request, sizeof(request), NULL, 0);
>   	if (ret) {
>   		dev_err(dev, "failed to set value of gpio %u\n", which);
> -		return;
> +		return ret;
>   	}
>   
>   	ggc->lines[which].value = request.value;
> +
> +	return 0;
>   }
>   
>   static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
> @@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
>   	return ggc->lines[which].value;
>   }
>   
> -static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>   {
>   	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
>   
> -	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
> +	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
>   }
>   
>   static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
> @@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
>   	gpio->direction_input = gb_gpio_direction_input;
>   	gpio->direction_output = gb_gpio_direction_output;
>   	gpio->get = gb_gpio_get;
> -	gpio->set = gb_gpio_set;
> +	gpio->set_rv = gb_gpio_set;
>   	gpio->set_config = gb_gpio_set_config;
>   	gpio->base = -1;		/* Allocate base dynamically */
>   	gpio->ngpio = ggc->line_max + 1;
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186
> 
> Best regards,

