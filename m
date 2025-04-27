Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03A1474CC;
	Sun, 27 Apr 2025 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752520; cv=none; b=UYMuUoCphWGR8ZHhRxGjmge969ecAHglB3w+O9c5b6Br8GUYBKJQAVXO7n8J+NCslx5n7LLk3lbqaBVPVhpMa2X5VNNUvJZ6io28iwpWRLU8z61PDrBzvwukeDE/O0iGtr4q5mH3CJxkzkFw/tSSNh05xBN/Z0EFi33wCLr8qXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752520; c=relaxed/simple;
	bh=i4vulNmaxI46QD5NEW8baIS4md2fyWWDhpv/LKHgO0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVIcqAWwN9wMYjbYGqdRpVpZO6NPCJAw7GJo9PlSMJ3/ghTU1b8ZYHzdYfyGKTee10nBq/k+85bjTfMMSDNWfQzro7BL9hfv+KGHHiwpyo+ZP1zdSPa7T9sdm3Hez3fc+P0jpvsR4BnAiyU7eHy3jLwlx1NIR/X/mkGVRtzk2OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UI6khAWq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UI6khAWq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QkVkz6dk4cOLjXYYtXS5CCd0YLGWAVsLoyMR7Wnuhxc=; b=UI6khAWq+pM6v4WdeLYhnQsgp/
	lHTRCJ/dOLzPTbwx4z/4b9eMdtZKySKYeya+7mepfDy/Zvhpc7sbvJISaK0QEzpf0kly057pSuec+
	gsnhNjtGd/7LxC+lY4l49HoLN2vUriKIb/SSXh3pvQKm/ulbt+NO24DEmA7aM4Nx9A0Yvds14+AaY
	vMXyIMgmeWPKLPXCBnYl9BV8o7ykMuVYndjJwBVcIKiLBDIWgoO/+stCCcafW6tsCHe2ckvlCtIHb
	wjdeLvIiJKbXWRSgrn7aV0/9XBLLYjc12FXtcGtyYa0dApxjkF9C55819jao9BUU++s4HoXTBI5zx
	3jG2cdqg==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8zyN-0003VC-98; Sun, 27 Apr 2025 13:14:59 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Hao Zhang <hao.zhang@coolkit.cn>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, "hao.zhang" <hao.zhang@coolkit.cn>
Subject:
 Re: [PATCH 1/1] ARM: dts: rockchip: Wifi improvements for Sonoff iHost
Date: Sun, 27 Apr 2025 13:14:58 +0200
Message-ID: <1929240.tdWV9SEqCh@diego>
In-Reply-To: <20250427065013.99871-2-hao.zhang@coolkit.cn>
References:
 <20250427065013.99871-1-hao.zhang@coolkit.cn>
 <20250427065013.99871-2-hao.zhang@coolkit.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 27. April 2025, 08:50:13 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Hao Zhang:
> From: "hao.zhang" <hao.zhang@coolkit.cn>
>=20
> After some Sonoff-iHosts have been running for a long time,=20
> the WiFi module will run abnormally.
>=20
> Adjust the pmu_io_domains and sdio properties=20
> to solve the WiFi module operation abnormality.

"adjust the ... properties", really sounds like hacking around some issue.

> diff --git a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi b/arch/a=
rm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
> index 9a87dc0d5f66..3c0371103015 100644
> --- a/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
> +++ b/arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi
> @@ -323,15 +323,15 @@ wifi_enable_h: wifi-enable-h {
>  };
> =20
>  &pmu_io_domains {
> -	pmuio0-supply =3D <&vcc1v8_pmu>;
> +	pmuio0-supply =3D <&vcc3v3_sys>;
>  	pmuio1-supply =3D <&vcc3v3_sys>;
>  	vccio1-supply =3D <&vcc_1v8>;
>  	vccio2-supply =3D <&vccio_sd>;
> -	vccio3-supply =3D <&vcc3v3_sd>;
> -	vccio4-supply =3D <&vcc_dovdd>;
> -	vccio5-supply =3D <&vcc_1v8>;
> -	vccio6-supply =3D <&vcc_1v8>;
> -	vccio7-supply =3D <&vcc_dovdd>;
> +	vccio3-supply =3D <&vcc_3v3>;
> +	vccio4-supply =3D <&vcc_3v3>;
> +	vccio5-supply =3D <&vcc_3v3>;
> +	vccio6-supply =3D <&vcc_3v3>;
> +	vccio7-supply =3D <&vcc_1v8>;
>  	status =3D "okay";
>  };

=46irst of all, this would be two patches.  If the io-domains do not follow
the schematics, fixing this is one patch, but for such a big change
I do expect actual references to the devices' schematics for that.

This is even more important, as you're switching some supplies
between sources of different voltages


> @@ -342,18 +342,15 @@ &saradc {
> =20
>  &sdio {
>  	bus-width =3D <4>;
> -	cap-sd-highspeed;
>  	cap-sdio-irq;
>  	keep-power-in-suspend;
> -	max-frequency =3D <50000000>;
> +	max-frequency =3D <25000000>;
>  	mmc-pwrseq =3D <&sdio_pwrseq>;
> +	supports-sdio;
>  	non-removable;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
>  	rockchip,default-sample-phase =3D <90>;
> -	sd-uhs-sdr50;
> -	vmmc-supply =3D <&vcc3v3_sd>;
> -	vqmmc-supply =3D <&vcc_1v8>;
>  	status =3D "okay";
>  };

and here it looks like you're more or less randomly adding and removing
properties until it worked "for you".

Especially removing the supply-regulators does not really make sense.
If you see instabilities, the main contenders would be max-frequency and
sd-uhs-sdr50 as culprits.

Similarly, supports-sdio is not even a valid property, so neither the
devicetree spec does allow it, nor does the kernel handle it at all.


Heiko


