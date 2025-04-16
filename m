Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB2D21A42F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828699; cv=none; b=e/4iNQd5XtXHdoZmkDR3uJdWNd0HmoVfsptgN00Ez/ljqbNDmGzn0TMY6rqfvFiPvg2AtIjPWAvVMX7anQiFEaTiDZ3It+uTUGstjl7V0Rb3HhTUh8z/ICMVgT2jrLi9SeuxWhxTwK1hEcDnwMpxI5DGlBMawq4r9vjL78C1FeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828699; c=relaxed/simple;
	bh=h2gb2aaLNETxBykAcxNCX0wPL5kV5DokaxdYgDODkII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Te+yGP1s0p23InKj33s9LvkznzaBesroULbHO0XY+JxNFuSrqIQ8AUOwVgTgHi/vKfN1tJSyetmZ+j11xZD/iWWZEL9nvxPZJYiS3BKqCY0sbfukjZK4zU/z/uzyZZ+iLmiPasznG+qq6jMhSWeZEqtBzak5/Qfx/IVqHCcfIvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KG8NPEKT; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KG8NPEKT"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feb3f54339so5552657b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744828696; x=1745433496; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9sY/HN/LGdgvtFdsZcaEiPxjht+cFZcMXATw7Z4WEk=;
        b=KG8NPEKT75Ib1TSyhnQhvNUfg3caH1X3Lh05MNjAacI8PH4sjAnWy2ANhKxagQdDyV
         8N/XbTOncRMSe0FPcx5A7XAP4Y51NTg0uJ0GR6u2MHLAnRIM5ZgXr464Mxm37gA+wrM+
         wZ0AP0QzSlo53bbSbPhsxbaaAwUSym8GJJnxMTep3YK1EZXA1Mp1Tt96EWoBfvxuV2HJ
         N4CDQ12suFHm32pKkndO31P+6t/7f9NyH7o0avZjCJwxux49AdV39Nj3cXfj9+3B7seV
         MzrkU1KxyZ0nVb9zhBuc2SyVF80j4G7dw9Xjz96H6x050h7ITCTEeNy6UUnOPn3/oeB3
         abIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828696; x=1745433496;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9sY/HN/LGdgvtFdsZcaEiPxjht+cFZcMXATw7Z4WEk=;
        b=oSfiL2Ht7NNqWwExCer6D0r17JG3R6+Lxt5/cOyOawNnkjynBpzbD5pPr5Mwkezvl9
         C/47biC0f/flHIeyo3mot1Taucgw/AVSkYrAnO5ww4jAaC0aOvvncaLja+0KsxYnDEHc
         /SsDnsTBE4RF3Qi7DbFIXjKBgpcfsWmwdUacPg/vVAVhYlhdINZfkq34HapyBIA/GKIQ
         YK6AqahdXVywXPB6SpC83BIrdzkHg+OrRMPvMujBW+xXrthn9kqfcUL4tCP9UdctITqK
         7F82IN4q768Qy/OqqWS5IS5/L0xlB0c0wvHcI6506DHKY59/1qWfEryTcPH6Ne6O+Jqb
         MVeg==
X-Forwarded-Encrypted: i=1; AJvYcCXB//lF4/AD42WsrA4GQRhbRU/yV86nCZIVxyjYE0JtyVpg3mtxCGJ/oSiK4z3iRdK5tVSCCeGsh7Q0wEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89tyQ+4BxSoY1RTKui5rCnwq3Cjhsbu2jInl0rpyZ9BKhQIaX
	Mp2tEcD8kovLhRtkheA2MLslTzTQAnDNWNfLnc9Zt0jzSigRAqGO/zpTumecKEs=
X-Gm-Gg: ASbGnctJH33rHPjSzByLz+ynod0B/J5G29Vye3AihbMt+W62q9GpT47j66lHnZtO8y/
	1cpfKSQmliXRdHsd+/8uhWYXfuCpND5saARjgYgbd1oKVZrJnuAdAn9/IwEVNRd/UHlJ7cC+ALM
	eZCgB/F9SkYth/t9zfK+Y0N1GL49vGShaA5GDp8Xt5uzfiCA1Itzo2cptKN1jXoYKTPQ+7wg4ky
	0frmswT6ixESYDm0zsXrUokKV3zaCQhRLn3k+QTqxG11li78LiUoCK+foGXC61qPIHkAkQiEJTZ
	82/NU7oc97hPpbaXbTcjgwn8E6db7n/Y62fxj1q1kKqOvJPWRrUHvKj+hrYQxYr8sgwKxpoGpnd
	Y7l6QkvgM5VS5EeBXQw==
X-Google-Smtp-Source: AGHT+IEHpixfYLQ8d8XW9pFSR0q33vUhJbw2GwxLqv8IPvVSJvgfVlFlUazzgGh993Sed/nw/j0RfA==
X-Received: by 2002:a05:6808:1b06:b0:3f9:28b9:702a with SMTP id 5614622812f47-400b01c393dmr1926683b6e.8.1744828696461;
        Wed, 16 Apr 2025 11:38:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3? ([2600:8803:e7e4:1d00:58f0:670c:6b15:7fd3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4007639c638sm2866501b6e.35.2025.04.16.11.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 11:38:15 -0700 (PDT)
Message-ID: <96765a57-9e02-4f9e-837c-c0513e74ade4@baylibre.com>
Date: Wed, 16 Apr 2025 13:38:14 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/14] dt-bindings: trigger-source: add generic GPIO
 trigger source
To: Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Santos <Jonathan.Santos@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, lars@metafoo.de,
 Michael.Hennerich@analog.com, marcelo.schmitt@analog.com, jic23@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 marcelo.schmitt1@gmail.com, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com
References: <cover.1744325346.git.Jonathan.Santos@analog.com>
 <414f5b60b81f87f99b4e18b9a55eb51f29d2225a.1744325346.git.Jonathan.Santos@analog.com>
 <CACRpkdauyPb3bhgK4MTYN4Xq0cM80vwT8i_jcKoQcicpvMo7yg@mail.gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <CACRpkdauyPb3bhgK4MTYN4Xq0cM80vwT8i_jcKoQcicpvMo7yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/16/25 2:43 AM, Linus Walleij wrote:
> Hi Jonathan,
> 
> thanks for your patch!
> 
> On Fri, Apr 11, 2025 at 5:56 PM Jonathan Santos
> <Jonathan.Santos@analog.com> wrote:
> 
>> Inspired by pwn-trigger, create a new binding for using a GPIO
>> pin as a trigger source.
>>
>> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> 
> Is this actually documenting the trigger sources I implemented for LED
> here?
> https://lore.kernel.org/all/20230926-gpio-led-trigger-dt-v2-0-e06e458b788e@linaro.org/

No. This is something more like "pwm-clock" where it is converting a gpios
phandle to a trigger-sources phandle. Doing it this way comes from some
discussion on using trigger-sources for the SPI offload stuff I was working
on recently. [1]

As a result of that work, there are generic bindings for trigger-sources and
#trigger-source cells in dtschma now that can be used by any node. [2]

The way the leds subsystem does it where you can have trigger-sources = <&gpio 0>
or <&ohci_port1> directly has the issue where it isn't easy for the consumer
to know what type of node the provider is. Effectively, we have to have the
linux,default-trigger property to tell us what the provider node type is. By
adding this extra node in between we can get that type info more naturally than
the linux-specific property. And each subsystem won't have to have extra code
added for trigger-sources like you had to add for gpios.

[1]: https://lore.kernel.org/all/20241031-croon-boss-3b30ff9e9333@spud/
[2]: https://github.com/devicetree-org/dt-schema/commit/93ee8008959e362548168eaa7bdc20c115f3d586



