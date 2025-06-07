Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7521773D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296567; cv=none; b=lBced//wz9pqVCFcU9j/9kqrbbGKKVO9//wk1X5Zr5G3Lk8rR5JkgJL6LUyaE6L+uZBshAdWzw3tVhx6Pgil8oVWaJSk/TLxayauo4JogjscUMw4gBexZ1fdUn6pX/OCrj/oMLDiddq3eUuhd5uTNzO/Aiu1gHVMB81iu1v9vJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296567; c=relaxed/simple;
	bh=d8I8eKRlDb5f4zH5sidDXcjiayJ19dluoQhODaDQiKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucmwDDaUbkE9niDo+IS1oLgSe0i0PDS5MiMag7HjaSPolPZPuQFf1tK0ic5epuKzOcUSBvRo/hSpQ+J9PbSTsqYCzfFNqi0AQWnX57UlPoN2rL2AifzjC/CQDukbHraQ0wi54vV1Hw2S7kni/8p//go8J+wkusaJ4FVd7qyg9Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KYBgFCkg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KYBgFCkg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso5660667a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296564; x=1749901364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbBYREB7EZz7uh97XCG/R2ZuqTlW8SyAHh+pi6ZvUpg=;
        b=KYBgFCkga+XzwYosEm+EoT0Cc3Iv0dA9vPnaaOtM8t8qndpQ8mR4+EFOhABTfvM3IN
         p9T7IWtEK6TFZN7C7OhzReF6RueEgUv+j2iMpJBLVAzn+CW9tH3Gr/kkwYPovB24S4TQ
         lXq2705Z57ePtjzUmUJnnRMgpX3EC5GCHNutTjQorwUOnEQ90T4kZ3xsFxnDklctEs4h
         SiUuu+dSmz725+Q5HRwOrImBjE+pwfKJsjww2Zu6wMvENxelyeiewD6tMt3vtAXBKi0K
         /vV/JomfZrhi9n4M+LxiJevZijFIT+R+bn8Re9+H4goPiFi91CavUjzfW39+UFvczZeV
         naaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296564; x=1749901364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbBYREB7EZz7uh97XCG/R2ZuqTlW8SyAHh+pi6ZvUpg=;
        b=GBKPEIFKeFnfC3Gol/UbuECSul/Tee3kQl0u9BB81gFJjzk/ahJb9nPiIdTYCfg/d3
         KFOhxTwZOm7go2sI2avo8Vdh7EFUcAm+MNymdYnvmXkjs+N/p1Ej/sVTa4/YPmaGcExf
         kf5WS3j9Ans/XwSeaVWOQFaxIvI8QttCBmhKxRA5VcLPXPHk3c+0K+b9NfwNmrKX3M3E
         G+oNkoU8RZsnAzuzDyQUTPYRDVTv5tCkrSB1PwIUo/9n7dgstwSfoIdTkZdnHoWqBtqR
         wJK6SwuuM652b8cwm786ZPSxpep2wfoYU0B0VmeKMIpTtLNUZlwZQhtRDk6ihRgdsz5A
         vMRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfc6dN9jCFjOP1PEN5E7vFWgmUGUplJYzI9lIMIHB3ABkp6s1Gd5/nSnheAhOPYc6JPXaH9+uqG85wqIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+DJqLNIUF4BqLok4O6oS/G2qdUwmDyodQahtXgOGrHWzO6aK1
	z5Q0hkwdqyUPqp+OCjrU7I1SV9zDLPPFaWWHRM9M1Kem/5RWZilJvGtdlCP/B0DM2BlrNf+76lD
	sBJ/M
X-Gm-Gg: ASbGncuR4y1oUoHhgiW+yYYyBNkAxKTxenjbsWdPo8Z7d9gLP8rFImJ2jlGfQc18Kc5
	x/MF4IFEz6Zc0SgwwIUlk94LB51fXTjXDvgWei2LiJgOQO22VHipHZCZx+RnBXZI52Ua1WLzZSv
	Pr2maBT6kWIg83fglpCBgC2j5yZ3oi8p7sqYLieCgJX9wYPJMxNGDfIVrqRpOAy+e6BOQBhdB9C
	CLM87GSAanUK0+WF++SxVEngouwJlBnJYEYKg9ZAJX0r2/rTkoK5Je9i4Sc2bTwxEHQ9pcHy7vI
	j1Dbn+K6hFq7xeu+Jy0jpfLgXDVaFtT3UwcwQt95LKUhm9sWg5jQHn3AxxPc
X-Google-Smtp-Source: AGHT+IE/ghuMo8WxjRQEBBSzj3ZNMEtTZhSuX3aE1kpWDYjCFmKx98n9jZapdCOk71/aJ5kHwhIRQA==
X-Received: by 2002:a17:907:7282:b0:ad8:9c97:c2dc with SMTP id a640c23a62f3a-ade1a9fcf5fmr648393066b.15.1749296551642;
        Sat, 07 Jun 2025 04:42:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade35ce30casm151447866b.162.2025.06.07.04.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:42:31 -0700 (PDT)
Message-ID: <b355e01c-d9a7-47f0-bfe8-282d9152a814@tuxon.dev>
Date: Sat, 7 Jun 2025 14:42:30 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: microchip: sama7d65: Add PWM support
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <fae166010f94a672e4f1906f5fd4394f4236da53.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <fae166010f94a672e4f1906f5fd4394f4236da53.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for PWMs to the SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 90cbea576d91..796909fa2368 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -293,6 +293,15 @@ pit64b1: timer@e1804000 {
>  			clock-names = "pclk", "gclk";
>  		};
>  
> +		pwm: pwm@e1818000 {
> +			compatible = "microchip,sama7d65-pwm", "atmel,sama5d2-pwm";
> +			reg = <0xe1818000 0x500>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 72>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		flx0: flexcom@e1820000 {
>  			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>  			reg = <0xe1820000 0x200>;

