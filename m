Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB4C2C2FAA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073346; cv=none; b=nWqghPdgzK7TqIiMNnFLpLs0aD3GyslYLT0twzsF+PUZjIeHJK4pwzcfeJ6eYlSdIZ9fDqykx5AC1cJzHihsTdIwf0v8jwN5ZxBiwLVdiu8XUZYQYIYxEUme7/7BMqiOzApJw/gFHZU+Zrx+xynFU/8vOfWHWogU68t2RnRalB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073346; c=relaxed/simple;
	bh=FWvYOr8sG81qYIL6uLusAIWToSTzsXn/CUa6oVyIEvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=msdrMJLJVWpbLkdpSPtaQonI2wb8Pnkc8c7RLjwu44GtklrQj47SnR2Cuc2dGZKZKDkQ48LpWLYPxQXbfEaYnBvMdjb8FprJOuXNh4OGR4wmTv2wI5DLmfA0ozn6ajrjwgidd+1/NAoHF6B9rxK4ySdXt4BevRqEX352RetlDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4cS/Gdj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4cS/Gdj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so4559419f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747073342; x=1747678142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=;
        b=F4cS/Gdj5buJ0lrJVQCtyOXvL2wqk8fRkClDlZk/F3QgGqw7ls9VdXwqh9L9wzBOyC
         xlI6OxG0Cyn5Tnbsq+HvO+8p9qjNshggxRCq4JULacaCRysGfSlnUmjKxiYRqVX35y6q
         oGbOLSTJhpxZlaYu4H+8Ur1vsrsnbe6gSzAUf91ePbcpL/gp+ngpkgPtVTdTZER31ljQ
         RAmxdSJChsUb1BWeJlULEiXF+ZN1MATR0NiPhc44RgPvBjkcEhiaCXG9sYGwxweUxgl6
         rye4J5sYKn1h5mMdTyx9kryR/1ji+R0Ddo2vYdy3LR6boGBuCk9sBDbWq0DHHbYdngnH
         I4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073342; x=1747678142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=;
        b=Bz2YvY4DMGJTTnydgouWp6yAONh/vvHE7uNzRzmiy+aPbQ880hImx1s6VE2f0kj1g5
         3TReY+dM6EbzMtx5VJ9DZO3CBRgu56QgWmzre26C87//vFfVxcn60t42PWwOTKhbuE3T
         26++eQ2rasirSWcQ/k5Pwn8uiH9x9579IsjMk9n8fJNnSSrJNAawWho9CJhUe+i9Rmgf
         EQXNiz3HAMLRyGjgGQdt+ytvBwnT0p+vE6x+4O7VedQ4omBehq/pE7nSBeVyHNdxFLEk
         oWjev3Gx61mbZ3VXEDfMqWFeCeV3Ydefk5mTTUzwfkzQaSHzw2RWTFHVY24BZZweK+bv
         K5zw==
X-Forwarded-Encrypted: i=1; AJvYcCXgtJUSFWQBPsnT21qyr6zxS9KxsVS/uOxUlC8+Kca3w+Y3o6BFnZk8PUoiQQDyQZJLvN2aGNZCh+Hs9Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcpdWs9lqzTQUxhX1CkcAgUI8b85ngD7qiB5Gc217mey2okBo+
	Ttnncoej6b4mjAyvxPVGH8QlFMWsuzyxCf6B23jn8p9QFwp2IWd1
X-Gm-Gg: ASbGncsEMPrxpAr2NJ3NOCFeHlrE5ob0e+6BnulXYwS3zgSp608CJgHUG+GVjD5tsMt
	uXfNO/74Ke2zh/K34tVIUoq3x3rQGovkF0khvkrilCbbwBeI4w1EIv8qVlPrWhnNcA1CzPFgJwJ
	EFSM9ObuBwk5Fd/1sRjmTQsIh8XDZjoo1zKjOY7Mc2WubPcHvIT3pOQmrwiWHGaVHUg0E7BaIW4
	pR5G+7neiSV3e7vgyQ5x5GCMKVBCiDKWns1FBj8uFdHNLD7ARQ2cT8XOUtcQNemNYlETONVRMLe
	pftIzHdEfQYdi3A5x9XRM5/XClen6b2Y//WHtvyrdXl/MbvxQTKXJN7V75d3/RU=
X-Google-Smtp-Source: AGHT+IFw+AkbDnKjFZClxNbYQI+3I+tTSTGJnGpv7ufV8y5CAq7nGPHM3nF5qWIrKS5j7UeyFSkz5A==
X-Received: by 2002:adf:cf03:0:b0:3a1:f6fd:da50 with SMTP id ffacd0b85a97d-3a1f6fddab1mr8230689f8f.46.1747073342301;
        Mon, 12 May 2025 11:09:02 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde6bsm13417967f8f.13.2025.05.12.11.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:09:01 -0700 (PDT)
Message-ID: <fdab2ea2-824b-4b52-b880-0b097fd29086@gmail.com>
Date: Mon, 12 May 2025 20:09:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm: fix imx_* defconfig
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250510011806.13470-1-benato.denis96@gmail.com>
 <aCGPMvP6F6r-57KF@pengutronix.de>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <aCGPMvP6F6r-57KF@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 5/12/25 08:03, Sascha Hauer wrote:
> Hi Denis,
>
> On Sat, May 10, 2025 at 03:18:03AM +0200, Denis Benato wrote:
>> Compiling the kernel using affected imx defconfigs lead
>> to a hard CPU crash that reaches a state where each register,
>> including PC ends up in 0xDEADBEEF.
>>
>> That is because the SoC support depending on CONFIG_ARCH_MXC
>> gets disabled since CONFIG_ARCH_NXP is not defined while
>> said feature depends on it.
>>
>> The default arm defconfig is unaffected as it defines
>> CONFIG_ARCH_NXP=y correctly as excepted.
>>
>> These patches solve the crash causing my confusion:
>> https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com
> In this mail you say you want to start a ARMv8 i.MX8MM board. The
> configs you are changing are for old 32bit ARMv4-7 SoCs.
> arch/arm64/configs/defconfig is for you.

Hello and thanks for both of your answers.


Yes, I have made the mistake of using that defconfig for arm while building an arm64 kernel.


I am sorry and thank you both for correcting me.

Please, ignore these patches.

Denis B.

> Sascha
>
>> Denis Benato (3):
>>   ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
>>   ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
>>   ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
>>
>>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>>  arch/arm/configs/imxrt_defconfig     | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> -- 
>> 2.49.0
>>
>>
