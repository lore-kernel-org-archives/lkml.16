Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53FC2F271F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843417; cv=none; b=SBk6s715WiPMt2RYqoQYCeDSl+y4UfDVj090pUCQ3qEcSQfsELDSZ6XdADeA7DA5J+o3eGB/tXNJ30cIRNMO3C21nk43JoaSgV9UPAETggR1du9xia9wuxdffBqZ9nVZD+78AtO9gvGKpe0Xfi5PFaf1gHA6O+E81Fxnh46EMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843417; c=relaxed/simple;
	bh=g+LaGvL64iYAo0KoHc4Bet/BvZRakWsZV8+qruq5TVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JskEELPWI5QE9i8SnltpGdNhiWs4odsAvaN0OwMJOkhWQSiqYWQj6vtZemAku71PqCel6IUzsmNmtx8x7eISuBKxI1mv+wS+5uqWBQMyNvHdILpI1pF8JMt/A6UTA5Xgp7zny0iVaK97wY3lyQL7+BaCO9gC/DVJb3yy9SKj9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=smjRfaD7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="smjRfaD7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453426170b6so4101115e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750843406; x=1751448206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=;
        b=smjRfaD7NR7deQrdCpQ64iWett6ydeLfDtvA3/bTVbdlv4EpMTqm0oZU0CNaK0n23G
         GVmn2UO7TVNy2nyWukrG5T+X+w2+VUnk5qlv2rZWBTc+YoiWhSkr7BX1/XudyPXXmcZS
         eK/xXFZLs3m/1kDzFhTeH9FAraz48pAwgf7cAqKiHFfmhBE3LkWJ7jA3SRo5zOHpSCrD
         3qqtzXguaKF4q6r8bNFSI7AHPKyPz/ReI8uDt8BxuuyChcKEDbrhffsjvaRfLAQ/tPoO
         GEbYl2p4IgFO36BiGOWw5aJqCpBhj+4g+y/DnFda67NvkMfsCCQ4YZC5TON66VsOoKGi
         cF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843406; x=1751448206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWH9vvPYvKOZ6jTKsIAS1U0P9BTez35YILzqoZrwOZk=;
        b=Y1PapwTlnJvF1eoGjueiOh/62T2Aiyap7BWHX9FPnpzEKlYDYkVl8nCP3NG69E7hyW
         6mI4aHlcxCfH0MH5W/5Z/ZEPAO/nhSH5v6lA2D4LVnbBEPjblRP0aDtAW93C2jZwzRoj
         IQo+3SZ8N8sjI5QhfnzjvTxGgZZpVk1TP1pJv7g8+Q2rfszLvzuCQ3o7MIQeIIhDouIF
         WKLjgmr0goJaaXSDvld9sSfXuknc4bVx4xOIh7RcwFxTVddUhx+Xq6q65JVV766CL8YU
         fawuLHRwuY/XiYbz3rhaZxfBNMa5xTEWzjNshDZGJPmEO3MNQ+fTp67nG1sH/hrFDfYT
         St9A==
X-Forwarded-Encrypted: i=1; AJvYcCVLHhot1SvBCS2tmrvRw5KfOG3afJ4lwg60pPyCvBJcMPHrqkfHMiKHVUS1m6wjSJUbd7+vrj+HmPBYUg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMLVkjY2+xo5tWz3Lbw/SkVx4jHO0JDQoezlFzA7jqNtzB5il
	dDjTnhnLUfSYVcI2ht5FkuytPv8AQz7lHLjzqHLrUq+DTJWCY8euHS/cSoBhX9BIg1Y=
X-Gm-Gg: ASbGncvEiUFQwBxzS/HRXGN7MdT6Ne97uYCT9NiJW1i0KzI855J2cyG2c+Cu/KLBPDK
	9jJ6ShCultlRfPIeGzR4aSxkcVsNSqh+aEZTvi+F/1FSlkwwFnBYCzTCPeJxri9jcsvMdnynJR3
	4Z3ywWadGJEZ7pUEmxoAF6ZEb69UFUoF8HfzGUrBX99NWzo+5vbsi3ej5/Qxu/dF13NbQ5bSs9f
	qBUbxXWubiiCHbyrNkUaxpDz0wZhqTRCuiwo2S5xKIyt6pF8u2JwhVT889z0udXVs1v4y2pBAae
	LvCyDbA3naEzXcIiIcXi/jikSja0hqimyfbcjww5nGZuB9YsxS+b8xWHwu8TOQZbI2BfccBXliQ
	Po67Ykiat7Ddzw6Y9H+WulTSyqg==
X-Google-Smtp-Source: AGHT+IFk44C1BBZqTWRdY4hcFP7t75lLhumDHg3FOCEud/iYnem/WMPerbWTZalUliYOPa9RKBhJtw==
X-Received: by 2002:a05:6000:2081:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a6ecf52ab5mr1972437f8f.22.1750843405762;
        Wed, 25 Jun 2025 02:23:25 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a6e8113b00sm4163210f8f.96.2025.06.25.02.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:23:25 -0700 (PDT)
Message-ID: <fdf70587-5960-4420-b1a4-4fc2f467fd06@linaro.org>
Date: Wed, 25 Jun 2025 11:23:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] clocksource/drivers/exynos_mct: Add module support
To: William McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Donghoon Yu <hoony.yu@samsung.com>,
 Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250620181719.1399856-1-willmcvicker@google.com>
 <20250620181719.1399856-6-willmcvicker@google.com>
 <aFqsqr7i7cdR5-I0@mai.linaro.org> <aFs4--JdpE1W3Lh8@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aFs4--JdpE1W3Lh8@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Will,

sorry I missed to add you in Cc but the following proposal help in the 
module conversion:

https://lore.kernel.org/all/20250625085715.889837-1-daniel.lezcano@linaro.org/


On 25/06/2025 01:47, William McVicker wrote:
> On 06/24/2025, Daniel Lezcano wrote:
>> On Fri, Jun 20, 2025 at 11:17:08AM -0700, Will McVicker wrote:
>>> From: Donghoon Yu <hoony.yu@samsung.com>
>>>
>>> On Arm64 platforms the Exynos MCT driver can be built as a module. On
>>> boot (and even after boot) the arch_timer is used as the clocksource and
>>> tick timer. Once the MCT driver is loaded, it can be used as the wakeup
>>> source for the arch_timer.
>>>
>>> Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
>>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> [original commit from https://android.googlesource.com/kernel/gs/+/8a52a8288ec7d88ff78f0b37480dbb0e9c65bbfd]
>>> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
>>> Signed-off-by: Will McVicker <willmcvicker@google.com>
>>> ---
>>
>> ...
>>
>>> -static int __init mct_init_spi(struct device_node *np)
>>
>> __init_or_module
> 
> Thanks, I'll update in v5.
> 
>>
>>> +static int mct_init_spi(struct device_node *np)
>>>   {
>>>   	return mct_init_dt(np, MCT_INT_SPI);
>>>   }
>>>   
>>> -static int __init mct_init_ppi(struct device_node *np)
>>> +static int mct_init_ppi(struct device_node *np)
>>>   {
>>>   	return mct_init_dt(np, MCT_INT_PPI);
>>>   }
>>> -TIMER_OF_DECLARE(exynos4210, "samsung,exynos4210-mct", mct_init_spi);
>>> -TIMER_OF_DECLARE(exynos4412, "samsung,exynos4412-mct", mct_init_ppi);
>>
>> Are you sure this is not going to hurt the ARM platforms ? Here the
>> timer is enabled very early in the boot process while with this change
>> the timer will be available later.
> 
> I took a second look at the TIMER_OF_DECLARE() macro and FWICT the timer will
> only be enabled "very early" via timer_probe() if "MODULE" is not defined which
> is only defined when this specific driver is compiled as a module. Note, this
> "MODULE" define is not the same as the Kconfig option "CONFIG_MODULES".
> That is why in my v1 and v2 patch [1] I had:
> 
>   #ifdef MODULE
>     ...
>     module_platform_driver(exynos4_mct_driver);
>   #else
>     TIMER_OF_DECLARE(...)
>     TIMER_OF_DECLARE(...)
>   #endif
> 
> However, I dropped that since Saravana mentioned that we should not be using
> TIMER_OF_DECLARE() for drivers that can be modules. I don't have an ARM Exynos
> device to verify dropping TIMER_OF_DECLARE() is safe. So if you and Saravana
> agree, I can work on creating a patch to define TIMER_OF_DECLARE_MODULE() like
> you proposed in [2] to handle this for all the drivers that are used for both ARM and
> ARM64 SoCs.
> 
> Thanks,
> Will
> 
> [1] https://lore.kernel.org/all/6e6b0f5f-ac60-48bb-af6c-fa58658d2639@linaro.org/
> [2] https://lore.kernel.org/all/f2f914aa-c554-4135-afaa-f075537ed929@linaro.org/
> 
> <snip>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
