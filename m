Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F78D35962
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745673409; cv=none; b=itJzbzsCDw5PBEQjMseKdQ68utRKxFIHP1j5uV+J1UsoU5/97mFyfaOczq48dQXo1uHNF5LQaBA320l6mnGgd9Ep0nF7G1yAt2iKbVlRiOYbLn+aVD2dnnaa8Y2NALYFQW5+w8dhNE65YeYlkWij0tWJZn1lS7vOslLrKnNIvBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745673409; c=relaxed/simple;
	bh=A2QesqpKFd5HugAJmo85A8ZYC0ForBZg6/ap+WMdLRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGtRnv02Sf3KspkS3fL6PhPrlRTXKSqa3G+ozSUjiPK35hHhgOUaQlDEHIRwn4cZ9Uh2w5gtlVeBr8J/9dtZikY3UJ7pRCwhBwdIN3YXZM0ABP28NufJGGVm0tYSFIc/bks46IS2zkr3/kpL8zgeMw431DgX8AZxlQeIxPwsMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j7abyu2H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j7abyu2H"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso37201725e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745673404; x=1746278204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=;
        b=j7abyu2HrxbXpboRgy0NBBnlSfFX84wfbkU0qgv/XAs4UxiZ2YdxYex6i2VgG9vN3C
         bAJc5fbkiaRNzDtThI7WVtEUbCYkcpklADzwsmu2bJUzpdy5c10EnnXlRq5+UnS44yuO
         LTYQRTmsmEQcfl1mZIzXCcPAjXBw5hvKh+0DD6Bl5i53VWCawmFCOHzwy3oVHC9G16+m
         Hw6p9XNbQFvUcWVA4ZBjb8cR8pfpE/Lkxfki0AhGNe5dyk29JsVR2abs8KZmSkmaKdD0
         t5m/C2STAWpJVJM+eFISjOkq2GcYcaVQB+xwKMI4lFfm6UNYc3VCD1Baa6iL99Mx8/np
         9w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745673404; x=1746278204;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J407mJFXHjtMTMAmHlJN1cKIkBEdqNJvnzIbzWuD3a0=;
        b=Zt41wjKp2vtrEtD0JVTGatMh5R7EvIroDsP7hmTCgnLDW7NwVfeXsHSi+Y+1j5uy+8
         jlFTXUtiX8WaYpnv+Syp/jZDYigGvIDMWzMUpMMMbGnpsCUEbqWxdcUeevivvfjH3D4m
         18qZy0sKnuXAH08hZIcg8W+TQVVR+0qZXDIOvdncr6C5oB5eM1XYl8BGv2r0tOLfu8T6
         sO4k4pJbb/KsExuoy4ExX9MskBhdG7qFwzBAfAjNVKcurELEiDohFELGGZSZRgDOrL0k
         Y5UnjQ9xYHcQCcEtc4NHANXA15CAyBBeZjzpzfC9JSU72FDK40LPbLigKfTkWylHua6D
         p8aw==
X-Forwarded-Encrypted: i=1; AJvYcCV8ni6a6vyRqLhsAQN9/aRVbKx2yAwc6jwidBeIbBEVu8iMeokub0HBnHKLHp2shj+I/aL2W/QuxvCIlE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/4yRJ7AJkXAINCqaiP+7tmiKCJv53APJ3whYseaP3pJ70SAuw
	AjidMmZ7/zeh+UR0RamL+JIBfmdHYh4EzWsCrmI75vfevX4WzxRHbXYQ9bEg098=
X-Gm-Gg: ASbGnctRHTPsN15qa6uDnIiV4G4FWJMIYHMjTEmHXKybvPsbDm5nzOjl4Fanbtt2DhC
	Sj45Eg3zKun5EQzEBUCjJ4U/hNeMsPtII4jXUz1xVe5m7JOKYIJnIyqDeUgsajLlyqZqeRK6Sjz
	/PZNcex4Ht6Dj9BUzjVbO72QkXApZHn4I51KdjXkDcphDBIVW8m0adOpZcATayVrYel5I3cYkUB
	XrPxKWWb3GopKDs6krUmLZCRbp5rrD7nT/iWKK1Qd6+CosMti5G2mpxQNcMtVY2nepg1wz6jvwx
	vgbtlsYdhMLL+cBX5MnjNP77DYlwb77VbGgmy32/pDqVTLvFXw==
X-Google-Smtp-Source: AGHT+IFEdPhvnEPF2IPYYIjIlVAxjiyxZPBsePtMycDc8OXoHjZ80eyhmbO/+g2anWdvGqYyjM32vw==
X-Received: by 2002:a05:600c:3548:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-440a65fe6ebmr57418595e9.16.1745673404131;
        Sat, 26 Apr 2025 06:16:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm5649133f8f.98.2025.04.26.06.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:16:43 -0700 (PDT)
Message-ID: <79d1211f-6d4b-4f1f-8d94-3bb717025f05@tuxon.dev>
Date: Sat, 26 Apr 2025 16:16:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] ARM: dts: microchip: sama7d65: Add RTT and GPBR
 Support for sama7d65 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lee@kernel.org, sre@kernel.org,
 p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
 <e8868ef06102241b47883ba10edaed751831be6d.1744666011.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e8868ef06102241b47883ba10edaed751831be6d.1744666011.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 15.04.2025 00:41, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
> to store the RTT time data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 8439c6a9e9f2..bec70164a75c 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -132,6 +132,13 @@ shdwc: poweroff@e001d200 {
>  			status = "disabled";
>  		};
>  
> +		rtt: rtc@e001d300 {
> +			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
> +			reg = <0xe001d300 0x30>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk32k 0>;
> +		};
> +
>  		clk32k: clock-controller@e001d500 {
>  			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
>  			reg = <0xe001d500 0x4>;
> @@ -146,6 +153,11 @@ rtc: rtc@e001d800 {
>  			clocks = <&clk32k 1>;
>  		};
>  
> +		gpbr: syscon@e001d700 {
> +			compatible = "microchip,sama7d65-gpbr", "syscon";
> +			reg = <0xe001d700 0x48>;
> +		};
> +

This should go before rtc node to keep the nodes sorted by their address.
I'll adjust while applying.

Thank you,
Claudiu
