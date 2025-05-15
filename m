Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A888253F1E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747328980; cv=none; b=PA4qMxHM9j7PoupWvjEnHXH4poqNAtUsuFi2jvd3B8RgcrDzCQt23gVW1zNI0Itfx7GLIORiDYG9rMOW1IVy4zEv8UlnEA7vFAlXpVNQucvM8VZdX3ENi8VLVIytRJyOeqOzQ96cLmZX/7Miluywu3lAzvePKWhhN3DeM7KWHYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747328980; c=relaxed/simple;
	bh=TJ6zr0f5oCOxxHarsKCrGAUL8GqdgcCiFPdWFb4Wpw4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFF3BvKM+f/FurQntB7qjGQ/XrFRwLVSvsSExS4zETYVkd7Hh/JNGRgXws7EDEkYKHzSqP+AyXrfTPakmORPH+qDcvOhq+P8zgdCM24y/nwICfjZPwIuMcI4QNJ9Zd9PxquSiz4YkIZesLQy3SpjE7C0uR84IHYmE2lLAUfihUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=PrSxcuOV; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="PrSxcuOV"
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E489497A1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747328976;
	bh=UaIbzEI3BxG1QqMP2g2eV2vg414lhcb+S7oh2OMWjZQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PrSxcuOVKB2xfAwg5FSRejVJbyQpm2AdAo1DU3Kpt82ki+ZHz9aX7d5BGZPIib/rb
	 pP9Csyc0YdzViQp4sYM/DTLWPKR0hcYXlOuIyT3GTyb9YkAQlw3iYj3QHAFnc816jL
	 f3gWgFHsRlADBE26o7yzWJcv8j7C/XfrBgoWTDUsLCutNPX4bxggWXbT9op0Mbqlzq
	 E0iGtn0d8KBXjwBMX/LwAWz66Dd+7XLUafAjSjw4kXWhvEP4C6HSMPTHiV5KjrYuMf
	 rfiVZH84ffMCjhWBBrqtm2VDsYFz5he2V4pJOO2ENcDG9tn4x4FrQV/V7WQpOAm/KG
	 nyYjZqM9gt3OQ==
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-60214b7cdbcso1375652eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747328975; x=1747933775;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaIbzEI3BxG1QqMP2g2eV2vg414lhcb+S7oh2OMWjZQ=;
        b=M8bNR/7i73JVDvy9UN+yBJ3heHrj05GYHEk6+69zh0kiXO0Fx2YXws0x+icL+FgAEb
         4XNIgkyA7FOIrYrSrc0oTekPAw0VD2x1PvKWeA8zLNDHqOAPcsekD9q5Mye8LkqxKeXn
         +2PR+a8XN0nWw1JthSGSwGNViYOpfwuD0xhPnaX3+J+Ube6z5fT6buzBaks8xh86a18D
         C8MYCPY4+/H4PpKFj8YK9tBMVBFchbUoEb50jO1vHvphFyRIpcgwFK+zzo1rGHGRQH4g
         L29qufo7sgscOp3RsAekritthqWXEOtB+hqSRv5pHHvzrFTsuEznShbukvdxbVr39m7l
         Zf2g==
X-Gm-Message-State: AOJu0YzSjykLT2zGaLEkbCeF0svQDaDmbGRpG7mrcV+YNFPP10gq7Hr7
	ZJJDoSqLwnv//GRF8Hzu6TmACPK0TybCePlJlWKBYjUPIttfHebOQgbHLCxA/20T9v5/7zxoOjq
	VLJtiKs6RhObYmjK9mn8V5QgEkRScXP30EJQx/esXvJno/vEWJ0JRUCIvXvNWzc8U9frvSppuW8
	WxYEy/FczxfOlzBjACtDkln2Xz0D0Jix4IF//O5KOcjYpBltO4UpJcLw+p
X-Gm-Gg: ASbGnctEVEbBVg8gj+vdscs0ey7JiUoY6AJ//DiB0CuUkLYVLu0XIpEXJWV+4m/lchk
	XOz65U/ATSbEAFnc65SLDKq9EjMcIZTx2eIqKLLyHBp7DseD565AxQj5ZfjdSJf/Ahgykdw==
X-Received: by 2002:a05:6820:988:b0:600:5673:69ef with SMTP id 006d021491bc7-609f37cd90cmr76672eaf.1.1747328975217;
        Thu, 15 May 2025 10:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLutELQZn16DHflkUI5wwt/XutX3gwxVSCFyJcK6PHHXgJubotxdGaczJ6DOqIwaSUHGtaxo4SC0sf9J0GSBY=
X-Received: by 2002:a05:6820:988:b0:600:5673:69ef with SMTP id
 006d021491bc7-609f37cd90cmr76650eaf.1.1747328974888; Thu, 15 May 2025
 10:09:34 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:34 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:09:34 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-3-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de> <20250502103101.957016-3-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:09:34 -0700
X-Gm-Features: AX0GCFtbB_vNvAHLPwksxwineqOYhEEn3iOraJm-aHuirOkyFfVbsN4SakWjbrc
Message-ID: <CAJM55Z-TMEn2oukQ_5XvyoQ4U-BVjt5dekVv2T3=vsQWL4CCuA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] riscv: dts: starfive: jh7110-common: qspi flash
 setting read-delay 2 cycles max 100MHz
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Use qspi flash read-delay and spi-max-frequency settings compatible with
> U-Boot bootloader.
>
> Observations from testing on Pine64 Star64 hardware within U-Boot bootloader
> and read-delay=2 are spi-max-frequency less than 49.8MHz fails to write,
> corrupt data writes at 25MHz to 49.799999MHz, and valid data writes at
> 49.8MHz to 100MHz (not tested above 100MHz). No valid spi-max-frequency
> was found for 1<read-delay<=3 and corrupt data with read-delay=3.
>
> Looking around the Linux codebase it is common to see read-delay 2 cycles
> with spi-max-frequency 100MHz and testing confirms this to work in both
> U-Boot and Linux.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Thanks!

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index f1489e9bb83e..5c525686c043 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -317,8 +317,8 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		cdns,read-delay = <5>;
> -		spi-max-frequency = <12000000>;
> +		cdns,read-delay = <2>;
> +		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
>  		cdns,tsd2d-ns = <1>;
>  		cdns,tchsh-ns = <1>;
> --
> 2.49.0
>
