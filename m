Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177F27B51C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500259; cv=none; b=NGXHpHp+f2eUHR1t4PmYOxe9oO/lWPbcAXsKaaDn1Q5eLfm+BZwdssFMP3xPNaQbDwTiw3Z9lp5CRa/KND9Q/DfBmoBDd57iPci/B3t9+Soh+jp5vpl7Y9C+lMH7cGnVhol/W4jPf3H5O1IsaBOs3ZCj5unf53YsvDP2Hbd95is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500259; c=relaxed/simple;
	bh=vCmo/ncUFx3Q4A6rohFpnlMkKBne4AUJJq60e1MXpJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kY1jNZ6nOUkgPiLmA+e9tYFD/VNMSlfrjjt+i9uhkrzJDRO2sQ1Q6LQut/8nF1N2IiTSwvNcCR8qvEyHVQm9S9QmDl1/FZsMg4m/NSLgyUtBqCWa6D6tCxbUDJ5pjKuo7mUWZb/hGP0mW2kBHRN6/gTthznG5hCDW0eN04mFNfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BUANBtHk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BUANBtHk"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso688254f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745500256; x=1746105056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToOXcZCzkUmOmOHjlckeBC8JkRzjRqX1pToQblrwu6c=;
        b=BUANBtHks2E5U1SLXQWiyeUjuvN/YYh9GzAFaxmJUMFB7hYHa/59ae46Fsb4A0A/pn
         yXXMb6lqeH6AyQIqXyOz0s4cISx0vmyKWuJgqNpPAiRCDjwksbb0v4vx0rlbwx4azUU3
         iA1+RC57YPgjUlo0qLmue2h/Q2l2xrD+92JD5oNx0oK/Rg/x+Yh8cW0sphh+o14NDK3j
         JiTiUNTBg8xFcPgBbm3gs1pJwfatCwCan+13RA9T2OGgUmovMh6AEXWfvwiYOj2DxEmR
         X24tHrgUvxZtzAFmrgFHeGGmqlegY/lObivIqZfBJIPTtlb3hO+dvQbXxtX9qI0U+dub
         3xOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500256; x=1746105056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ToOXcZCzkUmOmOHjlckeBC8JkRzjRqX1pToQblrwu6c=;
        b=tuAPDmvMiAz2ETtq8IPNlZgSEohUEU/zL6Ubh7o5NCyFv7xRtmuq/CUoZ5XaIL3mOk
         m3Op1dfgYPR6pu12ELPk+OvRJ93iw0zc0H2BMu5oc1H5ZVrFUmnjXTkYk2GZ8LEwF+5g
         USaLg/WAjZf8p5qDBlpozcGuTcD+hJi4xJTg76eC1fhUgQCH4LyTViqiJtA7PRDX2uuQ
         3daO1G6SsFlGYSn3hxQHyrU1/+nqq/BVCGRTVTZHivxmxWTpzMuk2Wyz/zx7FNKXby7b
         qEvwo2zOdGDoQ5NYfz6Nw4MT8mekaELKes3slttrsGB42Ktpp3rXeoo8oa88FhegZH5d
         /e5A==
X-Gm-Message-State: AOJu0Yw+8NRiuv2xLbQCNc4aHARehtHXjlWpCxR9/I8lwVicYTz7rdZm
	hIpL09FQuWeZUwFJ4Xd+GY0RB/6/9VmatimYtmfESQFowcnsGbREbnHKz1uvEPg=
X-Gm-Gg: ASbGnctbBFYnRiV7yeGyRVZU9N2uUKin3AQtRb7DgozMrkr35NVwg6DWOockMBHfZbZ
	AHqbwDh5kG2u8IocNpvZjNYBhWC4HLCm5sD7Ax5yQlcYzT8zZ7WanL0k5dAz+/OyLlJ0SaRMjSq
	3cq/aOT7l7EU5GHZnKFG5zC0P9cWsEmVZO7vZk9R81NQYMQNPzNhYLllNx02rMpnO72CmCrFDd7
	7QQOndGKyBaTdjkQRT+dRCkJTqs+fNFhiztIJXEl4GppC8Cf/FtombEU17qrCzA9UEmozlo0kxo
	jdF6M8tCiz66lHtL7zLxXbngie1z0Eu3nHhi1UM0wa9IhVonPqVFx0K7Vuzdk90KHq2H1azvO6n
	UzsYX
X-Google-Smtp-Source: AGHT+IH0ALByF3zf32RDzm9OP9YpoQBOQE4RcKh5A0e2QxjL29sJpL4Zq1vlx+/BnwTUZW8Hiz1p8g==
X-Received: by 2002:a5d:6da6:0:b0:391:3207:2e68 with SMTP id ffacd0b85a97d-3a06d64c8a5mr2338891f8f.9.1745500256009;
        Thu, 24 Apr 2025 06:10:56 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a06d5323casm2076931f8f.75.2025.04.24.06.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:10:55 -0700 (PDT)
Message-ID: <669b6ef8-e0ce-42ce-8258-647ec2a77f19@linaro.org>
Date: Thu, 24 Apr 2025 15:10:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add the System Timer Module for the NXP S32
 architecture
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com,
 krzysztof.kozlowski@linaro.org, S32@nxp.com
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250417151623.121109-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/04/2025 17:16, Daniel Lezcano wrote:
> These couple of changes bring the System Timer Module - STM which is
> part of the NXP S32 architecture.
> 
> The timer module has one counter and four comparators, an interrupt
> line when one of the comparator matches the counter. That means the
> interrupt is shared across the comparator.
> 
> The number of STM is equal to the number of core available on the
> system. For the s32g2 variant, there are three Cortex-M3 and four
> Cortex-A53, consequently there are seven STM modules dedicated to
> those.
> 
> In addition, there is a STM variant which is read-only, so the counter
> can not be set because it is tied to another STM module dedicated to
> timestamp. These special STM modules are apart and will be handled
> differently as they can not be used as a clockevent. They are not part
> of these changes.
> 
> The choice is to have one STM instance, aka one STM description in the
> device tree, which initialize a clocksource and a clockevent per
> CPU. The latter is assigned to a CPU given the order of their
> description. First is CPU0, second is CPU1, etc ...
> 
> Changelog:
> 
>   - v5
>     - Fixed typos in the comments (Ghennadi Procopciuc)
>     - Added clocks bindings for the module and the register (Ghennadi Procopciuc)
>     - Fixed help in the Kconfig option (Ghennadi Procopciuc)
>     - Changed max_ticks to ULONG_MAX when registering the clockevent
>     - Removed Reviewed-by tag from Krzysztof Kozlowski as the binding changed

I do believe all comments were taken into account. I'll apply these changes.

Thanks

   -- Daniel


> Daniel Lezcano (2):
>    dt-bindings: timer: Add NXP System Timer Module
>    clocksource/drivers/nxp-timer: Add the System Timer Module for the
>      s32gx platforms
> 
>   .../bindings/timer/nxp,s32g2-stm.yaml         |  64 +++
>   drivers/clocksource/Kconfig                   |   8 +
>   drivers/clocksource/Makefile                  |   2 +
>   drivers/clocksource/timer-nxp-stm.c           | 495 ++++++++++++++++++
>   4 files changed, 569 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
>   create mode 100644 drivers/clocksource/timer-nxp-stm.c
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
