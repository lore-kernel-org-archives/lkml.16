Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0922ACD6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751753; cv=none; b=nCMVAiatNI5qpxFYIauseWaSi65m0PXiku3zEfrcL0p3N4P+q5w8piqnjzFMIRTbNooDV4F/kMcY0wgxRzbOEKUqOp4eoPPVy0LMQ5uIY/xWuuQSC/2kyk/6rPYa8C8puSRoUBqvQPj4J/U4DIPvLm1E8arM7fg+v7bU+MkS/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751753; c=relaxed/simple;
	bh=If5NYv49CJleYu6U1SFTC0glm8Qe56wbokRLBDQt7Dk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVEueqbI/IGLbbtV3/QPdXa+vnNdW5XmRiu6jfMgg2Z6KanSr1SPPYf/CjIGyvZM+/JvrEEJPrSgaij+Zvkd6oOFnqZFu41g0ikpHndZdr8vgGu77AK12Td8hzF5RA2wKn1It6ZKm1FAH0/65Y0R5Ky7hUBu1BehhxVn5zFgTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=o8r6l/gh; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="o8r6l/gh"
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 971A53F592
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738751744;
	bh=YsKw1TEBNMtqD2nTeVDQmEu2xielTkirvVyE9cb9euk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=o8r6l/ghcgz9+NI3TRgYcf14BLF2B/8gXXTKn68tarU0+8bT351hieK4LY2LlWb4I
	 PHjBvghISp+o5WqYGOMeMWKlb6qASow/rxcvAIbt/L3b339WFO2e9zoM3w2vXCk9WX
	 Hhnl2Mmr4J+Q++v+EbTOISXrQasmbGWeRJUV8JgaYp5XxagSuXnTpM58G9FtoZ0+e/
	 5GrGBdAUEn96eSLV3jjzDkxoGtr97JVEKPGVCgTy12NeOVfFlX09vwoBVOokRg+GrD
	 XRgxGr1ox9pEkdkXHV0D6RZhq6xOr7uPAfACI7qzcRmiMy4n1/a5ZKNLIiUO6ckStv
	 5srgSmR1fqo9Q==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2b7f0f5af21so496938fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751743; x=1739356543;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsKw1TEBNMtqD2nTeVDQmEu2xielTkirvVyE9cb9euk=;
        b=ojjuoGRX7YRtwxLfoD6ZOjwvC7r4B8v/QvIrCb5ln05fE2f+NGEWq96xmkrzR/mH94
         XJsbsr2vMe/GYWl/uS07xHTPdistZg0muki7QpPatuwcXuLoE/jRA8KgQuu8zf/xJMhr
         Y9GjoWKHX6AmtrywdB5eDdZleK5y1NidJFQf0OyiDess4m2I60580U/krBM8Ujk7DG94
         PPSE5QgaXhiNDtZ1ypLDAcXWuIxtjcYBKCspk9oWhC6TsDbBwU+9L+788Awg3Zx5oS2U
         11FEvKF92il0hO++Ykmof0jvbvUfgHbEFWeVUUKaVPy3z7FqPFnhTNUmqigAK5HewcmA
         KD5g==
X-Gm-Message-State: AOJu0YyfYYrrFHLZdndPuFiDMIMzs2x04yTvU7fbrGte1TC8CoHPRcze
	39kdFCRmN+IZeU2ILC6wONxUKApDs8gWZ11kbRbmeqv8oxyhaOZ3uea5BUEwHS5UxhLu5TPdGFw
	lt7Y+3mMcMrJKRTFhtPNraQszY0MnIAsVLxFWf7/K0p+vzxMD8jW+vLXM5eRNneta2G2KP53jLt
	ffhtT5zFhMU9BSkWmpzw+cQgUcxykd49+WnDt8H6QDYOLHjR+S6ZAx
X-Gm-Gg: ASbGnctVIm5SzYFg4UgzVjO6EStrvfXMyDrwje5gmPS6aD+oTYimTi0oaZdgUFTF4G+
	ObAa/RQd9UqmgxNiwnD0SmtjkkWaLDgcZPSwfyyJsY3+DNmgG5rF1D9d5P/BB7nBeJurkOim/1B
	9LXJ6zFCyhz7mAyD8=
X-Received: by 2002:a05:6871:4607:b0:2b7:f2dc:a4c2 with SMTP id 586e51a60fabf-2b804fa3926mr1450881fac.18.1738751743197;
        Wed, 05 Feb 2025 02:35:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgHRkYQfxZijOHZSWLsYQXFYonztRK0/8FyzsAHEDsc0C9B0GJ+PU4ngVF93zt76VSrCDa1Lbmf3cJU/GplFU=
X-Received: by 2002:a05:6871:4607:b0:2b7:f2dc:a4c2 with SMTP id
 586e51a60fabf-2b804fa3926mr1450870fac.18.1738751742931; Wed, 05 Feb 2025
 02:35:42 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:35:42 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:35:42 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-6-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-6-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:35:42 -0800
X-Gm-Features: AWEUYZlC49Ns_mcDAKYs7EnS5g_lujF3CtHenhbVzwWucgE36pERYwwD4QIAsgw
Message-ID: <CAJM55Z8oWonQBbUHPbMrVmN2HG9Dwjyr6o7L7spJQFhQfj+7Pw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: jh7110-common:
 bootph-pre-ram hinting needed by boot loader
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> Add bootph-pre-ram hinting to jh7110-common.dtsi:
>   - i2c5_pins and i2c-pins subnode for connection to eeprom
>   - eeprom node
>   - qspi flash configuration subnode
>   - memory node
>   - uart0 for serial console
>
>   With this the U-Boot SPL secondary program loader may drop such
>   overrides when using dt-rebasing with JH7110 OF_UPSTREAM board targets.
>
> Signed-off-by: E Shattow <e@freeshell.de>

I can't find the booph-pre-ram property in any of the schemas in
Documentation/devicetree/bindings. Does make ARCH=riscv <..> dtbs_check not
complain about this?

/Emil

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 30c5f3487c8b..c9e7ae59ee7c 100644
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
> @@ -247,6 +248,7 @@ emmc_vdd: aldo4 {
>  	};
>
>  	eeprom@50 {
> +		bootph-pre-ram;
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
>  		pagesize = <16>;
> @@ -323,6 +325,7 @@ &qspi {
>  	nor_flash: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		cdns,read-delay = <2>;
>  		spi-max-frequency = <100000000>;
>  		cdns,tshsl-ns = <1>;
> @@ -405,6 +408,7 @@ GPOEN_SYS_I2C2_DATA,
>  	};
>
>  	i2c5_pins: i2c5-0 {
> +		bootph-pre-ram;
>  		i2c-pins {
>  			pinmux = <GPIOMUX(19, GPOUT_LOW,
>  					      GPOEN_SYS_I2C5_CLK,
> @@ -413,6 +417,7 @@ GPI_SYS_I2C5_CLK)>,
>  					      GPOEN_SYS_I2C5_DATA,
>  					      GPI_SYS_I2C5_DATA)>;
>  			bias-disable; /* external pull-up */
> +			bootph-pre-ram;
>  			input-enable;
>  			input-schmitt-enable;
>  		};
> @@ -641,6 +646,7 @@ GPOEN_DISABLE,
>  };
>
>  &uart0 {
> +	bootph-pre-ram;
>  	clock-frequency = <24000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins>;
> --
> 2.47.2
>
