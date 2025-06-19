Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFC2259CAF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339436; cv=none; b=Pe/fAhXtt8X6fO8y7xcY6zKy3syWYmiD+vfGQV8Bvv9+BEatNNIEB/kWutYUepKeqcgDgrjTg4rD0gZv11Ozvce2i6OINPlSZjbn9cKm+HZUiFQpDL8GQSImVlBbqZu+xYzr4xYXAo3vbrphS2D2emMiewjlrXdd4dEh052TXLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339436; c=relaxed/simple;
	bh=yRrInhMCgBKy4u70p2vAMUnikJnhAHKwHd4sMoJNiLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey8g9KBc9kneCN2GXLyXSTdronICcMnEIL1krAQ0lpHh2OXzoNpfM4kwyJ/GGwoRHsNGf1fRPG2OaGxZt9MyghjFR6NEk22NiTdNU5Yx2KQugqIGzDMh0PiTYQM2rE77Wp8YfDyzvfb7EXdVXEWwnL9GAE7WvZwEc2VNhbW/GEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DqtdU1SR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DqtdU1SR"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-735a6faec9eso564242a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339433; x=1750944233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMgLZ/LtsoXII7nkbaS4tPTkpnKfRrfyc3zePK7XFH4=;
        b=DqtdU1SRnX4SlBvbciLYA+LuMMlnu1sOZ9ayVpUL8Ed0uHFBv52hpEKqOF3HQhlI/8
         BKQpG73U8NYPFRmyUB87ExhjLgGVnLdlGNfO4fmrdoLksie+Vrwp9iTVlZZYj9S0Tb4f
         mUPk9dqXfxwHkh75OSDVV5m2CxUzUWksiq3p92p9TxnQNhDLktYe4u8O2TZHL4vyA3EF
         qayrrroZ9ieeQAngg61UvAFg1ZzbjtLgtKGw5G5y/8MaXtgFcpz9CqOW+eC9dY4p2U0O
         Jyg7YduYvBSnK994Ju3PuCJVpKCnAfjXlcDfwiwIzuiFVjWdDveJaJDpk+TSg3n90y6v
         o2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339433; x=1750944233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMgLZ/LtsoXII7nkbaS4tPTkpnKfRrfyc3zePK7XFH4=;
        b=JnRVBCg9/JPyOcdrCKVBuwFR1U/+ThCRYWUhM9kQKKkuxz7OfWU1uLrUViP6bNGa16
         i5mPKZ+xdrso10E2wUC7z9cviRLMMpBSaTHNz5GBaUjzdbO6YhbNRdEyKQgxgHOoV9on
         Cd6dvTw1BKRczc+2FOculAJTKA6weE/Ak6n/zHhtsqLiWhnEfhV6s1Kt44T4xUAr5CQ/
         CJwRvYSCNo+nGB1+vPoHx1qTh61IBwPp15eH3hldanHwd4ALUhtECy8zLYShOO2HQEcX
         oxhmrg3rQMEdzHHekp8+aTHbhJAnbFwPqRxFUEd4Y1GnAOtyHM2YiI29u7tg5M8eut/3
         JdEw==
X-Forwarded-Encrypted: i=1; AJvYcCXTYTCAd55wbj/jK+VGhQXFhoMi1+CmkkoAuXVXgNlK44jEcZEQnVQ3coZJSzsP/A5J0zc3TKfXS6doNSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKZZ+fCgtxB9afAW9C6YWRXRNHau+dG6vca3jqvoy1sF1+7hO/
	zlMQx+zNf6Jn0C3Ydt+oYJH7nf5NiQWNMMCblFI9eW1uPT2C4+bYSq5fzfCVJBvia0I=
X-Gm-Gg: ASbGncvObCp6/W+iQQLv8vJPtAA8R0YQ8GYGVuNOU1aNk78Xl87zlkeriK+oAU73nTW
	DVxcrbzCMygBKE/z6sL5fSUI1KPEFtdrlZbBbIdNjs+/5ROuwXLKaQfKpz7GfS3pErrkcBIQn/M
	L1SZ0MjiD16mCYo8yhdmcGeRkymwUmuuKbs/2EFH9KOiB6DGOGfGQF2BZq9ubeBNIwGqDvCVrH7
	nL4JfLmjpb+gdROJ0YapKCbX34FgJ6JN915tVU5dMNPh4y7oGlnIZ1+EEwW9e3xT7iDQcRGSZO1
	qPXsUkKgTYctGDf6OHDuECvyRsXngF6hECyxoAdLV0V3KOd6g2Sil07QSEJdDzpBQEug2ISsAqb
	J84wH5UUkYQ4O2tbJDVnzvG8sTw==
X-Google-Smtp-Source: AGHT+IFv7xGd3UTr9p6P6RvePe4D/mQncFt71O03oqdU9wFu4hav14OEVRV5ZjR0JYA/8QQYzl/Uag==
X-Received: by 2002:a05:6830:8207:b0:736:8a4:6835 with SMTP id 46e09a7af769-73a36297f86mr11682241a34.2.1750339433423;
        Thu, 19 Jun 2025 06:23:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a6e73284fsm645977a34.64.2025.06.19.06.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:53 -0700 (PDT)
Message-ID: <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
 <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 1:15 AM, Vivian Wang wrote:
> On 6/14/25 05:01, Alex Elder wrote:
>> <snip>
>>
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 6d8988387da45..7bb7b8fad24f2 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1384,6 +1384,15 @@ config REGULATOR_SLG51000
>>   	  The SLG51000 is seven compact and customizable low dropout
>>   	  regulators.
>>   
>> +config REGULATOR_SPACEMIT_P1
>> +	tristate "SpacemiT P1 regulators"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for regulators implemented by the SpacemiT P1
>> +	  power controller.  The P1 implements 6 high-efficiency buck
>> +	  converters and 12 programmable LDO regulators.
> Needs module name in help text, as is the case with spacemit-pmic.

I will add this text.

>> +
>>   config REGULATOR_STM32_BOOSTER
>>   	tristate "STMicroelectronics STM32 BOOSTER"
>>   	depends on ARCH_STM32 || COMPILE_TEST
>>
>> <snip>
>>
>> +static struct platform_driver p1_regulator_driver = {
>> +	.probe = p1_regulator_probe,
>> +	.driver = {
>> +		.name = "spacemit-p1-regulator",
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_regulator_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
>> +MODULE_LICENSE("GPL");
> 
> If this driver is compiled as a module, it needs to be found by modalias
> so the driver auto-loads after spacemit-pmic registers the regulator
> device, so you need:
> 
> +MODULE_ALIAS("platform:spacemit-p1-regulator");
> 
> Also, consider extracting the name to a macro:
> 
> #define DRV_NAME "spacemit-p1-regulator"

I will implement both of these suggestions (and will do so in
the PMIC driver as well).

> Also, consider naming this consistently: "spacemit-p1", or
> "spacemit-p1-regulator"?

Let me see if I understand your comment, by explaining the
naming I used.

The PMIC driver could support a different PMIC.  Its OF
match table specifies a compatible string with matching
data, and the data describes attributes of the P1 PMIC.
So that driver uses MOD_NAME "spacemit-pmic".

This driver describes specifically the regulators found
in the P1 PMIC, so it uses "spacemit-p1-regulator" as
its MOD_NAME.

You might still be right; but does this change what you
are suggesting?

Thanks.

					-Alex

> 
> Regards,
> Vivian "dramforever" Wang
> 

