Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B91F151C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749297482; cv=none; b=lmS6jGkukK2Q5sq4V8pE9FoJuwXTf/Ce1E22Cm5KhpRqN9HDhII+erzYfGFs/SdZdlIcOZ1AfbdTc69dwyjXqeVjIFB5V+OD7uIcpueZskj+aLuNWbzUaXvX4prsFkks6PefCy+5Th63YOroxp5c3/V0AgzXWi/aO9yXKKjuz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749297482; c=relaxed/simple;
	bh=HjORKnsvUUZkmeS4m9i6hlDxgW0zhF2sxcOgY+rNoeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWUWDiU7mRX8fZx+LkHtNsWDsr69kuq7EcAuzbkurVybUKBae5XFHBZSjgSSLVLaMkcgwKezz58oHTm3Q5L/bufIHn1VJx4UbdsVdQQKaqXjzX/YK//lzRwADHJKcZue04nf7S6mg+VULgAWCzcv3JdH7XJSgPwYmg5XGbOuDow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rQbpI33c; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rQbpI33c"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6077e0f2697so2946116a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749297479; x=1749902279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPCdCVNPh60CQIkFZngFhiCNDUpIdQrQuGF9ErPiZBI=;
        b=rQbpI33cfI/ipR6UKilhbtmd/ia1z9sbOOMcClWBp3iLYctL7appWyYYzkCYzAWyvF
         nttlO/K1EdffIf7TQ7pjLDOTV2pEqC/LelOL1iUdJIIsHkW8nIvw7v2+kbBwMxa2dJxh
         vSF5SphFjcg3T/Lc+X6gd/4Au/XUv7op3K2KqpPo3VzepX9GK1OC1OELvsuAE8LfTm66
         uvp9xXZoTBSpTnoqAC2DTpdsuPHIVKfVmC5OkgRgR0h3B713wBph1Y3x0vEt9EiW0G4f
         IAEMBCwhdny5BHsOKEFeaFgg+m9zr3QnDFoG998bOi0ecOsg6TO3kTYclcbNYx8bF7CI
         YDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749297479; x=1749902279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yPCdCVNPh60CQIkFZngFhiCNDUpIdQrQuGF9ErPiZBI=;
        b=lVnkvtF38c/0+e8+SB0wCaiCUDjYXGP/uoHLpC39C8SNYqWA2nA7k2Lrmyn9cnrkdT
         YK6WbEQS1TuMjoNXFRS/pf0okhPaVff0MU/TbS/qwHb+EKohwpWQUadY1+38XVS+0+wi
         L8yQsqgQQuyWy0KYcdq1twx1nhff0He5U2LWFwDLwFghv5Y2v3eV0cPMLGwbVaj0ABeW
         swC7vUeofbU+0KxCO6gqaw8EfswwkiPriZIEk5u3CIA3JMhbHt8HYMgCuE3zIXPl2Sz6
         uVLvJvjBunNFfd/kb18m5yovdGnYlZGqDlNsdW/gkrSQ0lc+gLBVARs88SxEi7exGHCQ
         1qpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhitGkv+4ru+YDLkQy5fCgXueXlzsrn4f4vDDpIRhYB6vI34RYIfboG7n0JRhUn49nuR4MtiEYmChrw6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLN8d50F8S1WNaS1mk/SKJpGrSxH+7pbSHryEZZHvKk7VVgR16
	AkaFbG7vOHKHr0gK3ogOUIFkdlNTOnqvByR865MZ6owL1Iy0vxG5Dm1iox02AGlqnaE=
X-Gm-Gg: ASbGncth4EnImKqJXKEtyIlfJNaZBYIJEGF7b3zYRc3xLevilAeGIvc9F4agWgOlnNE
	UeDe1WETKe05ts5TWN2ZFUKCW+SCl/ocEh3vAlSzoRARqrw6v/bSOS7dB8IhQTEx61n9/D43VHY
	Jcp/pe2ZJdGd/Qfv5OZAWTGsb0OeUoJw7U9rYUpi44y07+/z5yuLzClva1oPrJotvZJ0+Ch/6e0
	AGgDNLHm89Mjvztmuj7wxU5Vmao+PA2LfJJk7D6wnTpWMbc3DlOKWdTp6mDm8DTt78eULsdv/LO
	tuWqDFexMErzmMh2C11IU4DapI2au1z4JMRzhiluzH0h9z0rObrHnax+dmOFToJSW2NGZLo=
X-Google-Smtp-Source: AGHT+IERrOwE41W6Vc1R8qsjoPAiIrdHWQSf8w1zwFS94QITX4oTtjAckH9gOjzfGmcTrsxtMCJSgw==
X-Received: by 2002:a05:6402:27d2:b0:602:17a1:c672 with SMTP id 4fb4d7f45d1cf-60773ec86a5mr5416133a12.8.1749297478809;
        Sat, 07 Jun 2025 04:57:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077812571dsm2334797a12.0.2025.06.07.04.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:57:58 -0700 (PDT)
Message-ID: <dc0c2777-ed5b-4729-8ae3-6563d8996e2e@tuxon.dev>
Date: Sat, 7 Jun 2025 14:57:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ARM: dts: microchip: sama7d65: Add clock name
 property
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1748030737.git.Ryan.Wanner@microchip.com>
 <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <f6ae8a38a005e1a4e025b25ddb29113c5e65dead.1748030737.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 23.05.2025 23:24, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add clock-output-names to the xtal nodes, so the driver can correctly
> register the main and slow xtal.
> 
> This fixes the issue of the SoC clock driver not being able to find
> the main xtal and slow xtal correctly causing a bad clock tree.
> 
> Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")

Can you please prepare a similar fix for sam9x7. It is also affected by
this, right?

Thank you,
Claudiu

> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index b6710ccd4c36..7b1dd28a2cfa 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -38,11 +38,13 @@ cpu0: cpu@0 {
>  	clocks {
>  		main_xtal: clock-mainxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "main_xtal";
>  			#clock-cells = <0>;
>  		};
>  
>  		slow_xtal: clock-slowxtal {
>  			compatible = "fixed-clock";
> +			clock-output-names = "slow_xtal";
>  			#clock-cells = <0>;
>  		};
>  	};

