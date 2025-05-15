Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645A821B910
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329011; cv=none; b=uIIGVpF5YFEHzRG0HUvATKl4dwllXRqT7GAWemHc3N27vCqiCryBAtY6fQ+pIPWTNkWScoqTNlKYwDjrp/SrFSJvQKhfpoBO/pBkudXL7/FbfSrsBvdz3udWuL7W01wdGjBDmn4zVeC2DorCIel1jrKkJQzTGXuc0ith4TsTsAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329011; c=relaxed/simple;
	bh=7l959DDc7jBJh95vOkWz3tllgngyDo+k0XrFifMPGTE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeWaDQqHCDpEdZKAyJevsXJc+1ZH3JCltmDZMFZoEoHEBT7H8wDCjqRkIgzJzzA1iihYDuIv49fZe8C66pfjb45MwvRhDlbbFrfR1GT2Z0V79GATEA8NT88Vmf1jfjbaHcamStTL4+Lh+Vjx+E3UalnAyYPCbKrxZnXAbtQhMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=n/1g+h6+; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="n/1g+h6+"
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A6047497A9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747329008;
	bh=hc10wZlOZXdQSTbtiNrSV2vv5sB6wouwtdIbWrMrirQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=n/1g+h6+xEGwyMVYQHML0fkLRjN/999MtpfAj5h7byIauToL948Vp8WRUaTk6yI23
	 QQ2+oqrDJTyXvt1fzMXs68FC/CJFuLYhz7vy/Iyxmd/NiZ2n6qP1XrzwjHot/hHjhX
	 uXnJteiXFKh+rQK+TYcTM1v0Lb1UlNsTNhhVzfEAE2ZCwwvfrBYnJHfb3lbt6e+jPn
	 JgU0XiCpMK/OB0QfP/Xc5HkYk+2LuHNytF5C3DuKVgOI2MwUpvfi6CClCycjcFRMU4
	 U7dvyHXpH4QdxlJi1Ss2gQvtnRmCo0oXwQUI4xPcIXewA7mIwY9cuz/GRqe+2SIDM/
	 CInsACzHL6Kog==
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-606691c2afdso1545823eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329007; x=1747933807;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hc10wZlOZXdQSTbtiNrSV2vv5sB6wouwtdIbWrMrirQ=;
        b=Qmy2Kxgl/+Bbcs4stkovmhaVYtZAawntP45gOW42TyPpyFsfs8Cig84suyI1+hUVFM
         tZCgTxcXfbhAxJwl2mUX1vmybMlSTFTz1tq/351oFVMjVMNV8uM2kdbNhmzTDXNLmDbZ
         uyMgXtsQ95AUari2/+sCW5OijRV1H5FaGZ0MLNLvdxpYas1daaNjBHHu7gblXGdBRTvs
         u8Gn/fumtm6BBDeU8HqDBOWYN9ASkGavh+n3EHcK2565t5PuM3XjtHLaoUVu1yCt4Zmr
         TTgCjiEAm5LOulP66iE0+pzAIUfSLOrI8MI9TB8XITic8pHVD/2YMlm4cXT+nGdUXMyj
         nqdw==
X-Gm-Message-State: AOJu0YxmAwLqJhTHg3zdeE7JFhU5LcpOym05vUwYYASbTBZeLcYftQnW
	R/DF25GMd/s8uuySKBPZy/bVE+MZE7MroHM+GRl35tyG4CW4VnEG7ILm36Xea6Qd4dHwuYNRCni
	NVPCZLM4tUWtj9PKh9+oD1SKopsGzoEZcmoJ9BWfCtQRts9e69eeTJ7aMLkqCHcqFcwb10DJxmy
	2recvQJnmjGdVicPGwnlEpepBcgssonOH2DA2IROiG+dkqbAfbGuZsmJBE
X-Gm-Gg: ASbGncsGXU2b0eMoVNRJdgSSBW5xhxOweEy80fepXqPIxILhIafx7DOjgFN2Q12Ezl5
	TscCCKd10FyQth5/iVSZQ249K2EKo4lGcz9lu/1e+IIt5konN68UQ12SjZ2ifGL/ovdxNSw==
X-Received: by 2002:a05:6820:1841:b0:606:107a:ebd8 with SMTP id 006d021491bc7-609f374ddb4mr117617eaf.5.1747329007175;
        Thu, 15 May 2025 10:10:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzb9VcV3Lnf5ruIIC6ey76hxyhG8TiKGAlKsdKpz4KyWmg3ddQXbaDSEZE53clpDxkh1hdWXrmr5qJP7/70kY=
X-Received: by 2002:a05:6820:1841:b0:606:107a:ebd8 with SMTP id
 006d021491bc7-609f374ddb4mr117595eaf.5.1747329006841; Thu, 15 May 2025
 10:10:06 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:05 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:05 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-5-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de> <20250502103101.957016-5-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:10:05 -0700
X-Gm-Features: AX0GCFsnIcyqJ3U7xBWuljucy5NCfIr9h3FNHYe_s9G96TiWFSA6H61K7riL4Vc
Message-ID: <CAJM55Z8sqZ8g1zbphoKaqkZfFoh6GGCXF9dVPds5FydY3=46Gg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>   - i2c5_pins and i2c-pins subnode for connection to eeprom
>   - eeprom node
>   - qspi flash configuration subnode
>   - memory node
>   - mmc0 for eMMC
>   - mmc1 for SD Card
>   - uart0 for serial console
>
>   With this the U-Boot SPL secondary program loader may drop such overrides.
>
> Signed-off-by: E Shattow <e@freeshell.de>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index f1dc45b98e1d..d2cdb2f276c3 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -28,6 +28,7 @@ chosen {
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x1 0x0>;
> +		bootph-pre-ram;
>  	};
>
>  	gpio-restart {
> @@ -249,6 +250,7 @@ emmc_vdd: aldo4 {
>  	eeprom@50 {
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		pagesize = <16>;
>  	};
>  };
> @@ -268,6 +270,7 @@ &mmc0 {
>  	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
> +	bootph-pre-ram;
>  	cap-mmc-highspeed;
>  	mmc-ddr-1_8v;
>  	mmc-hs200-1_8v;
> @@ -285,6 +288,7 @@ &mmc1 {
>  	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
> +	bootph-pre-ram;
>  	no-sdio;
>  	no-mmc;
>  	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> @@ -323,6 +327,7 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		cdns,read-delay = <2>;
>  		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
> @@ -402,6 +407,8 @@ GPOEN_SYS_I2C2_DATA,
>  	};
>
>  	i2c5_pins: i2c5-0 {
> +		bootph-pre-ram;
> +
>  		i2c-pins {
>  			pinmux = <GPIOMUX(19, GPOUT_LOW,
>  					      GPOEN_SYS_I2C5_CLK,
> @@ -410,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>  					      GPOEN_SYS_I2C5_DATA,
>  					      GPI_SYS_I2C5_DATA)>;
>  			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
>  			input-enable;
>  			input-schmitt-enable;
>  		};
> @@ -638,6 +646,7 @@ GPOEN_DISABLE,
>  };
>
>  &uart0 {
> +	bootph-pre-ram;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
> --
> 2.49.0
>
