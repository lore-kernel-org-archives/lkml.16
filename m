Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD27256C92;
	Sun, 11 May 2025 13:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971344; cv=none; b=sxo1HsGTvODvnqutavrPgxmYsbwBIeaVeu66KbYTA9j9psldWF1mwL0IE35/LloyoxJw2jHRIk4bnaOI8y7li2JhwE7vRibjn7rI2je07eV1ogYybzpU20Su/Cu6FuPYka1NxgwyDWuueEn86SAVw2WuCWpB5SM6emGzpvBzeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971344; c=relaxed/simple;
	bh=iVDDATECt9gfhXNkrkHoCiPF6PoyhYBhPrjq8+PFV9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OATMc7NtPRW2DpWO/FybxEceIScWi/ajuIi4zd3L+qcv4brgH9TcRCgk2AI500/7MEozkkUMekdAGw8JpS24WHDQqOZxqsqN8oCEA9Tkcqt9ZeJ6r6nJEnJlJ1u9qvCxGYMClDRF64rbwaJUStza/3VsRHiLRc2chpfh2qV/qAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tMYYoGuq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tMYYoGuq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=55b2MXHN1ae6ZgEcDHzWaK1s3f7kfPOhMW8piFdTCOg=; b=tMYYoGuqY+aLskzruhSEzrfhYm
	3updh2wCSjrXhRH9dN+KBGTlti7qmJnNuWpzgDA730IaYf3gPQHCRbDaDHqY1qdG1sIgusibybcWC
	gkZDZC1T3MlB1L/6awN2g5mVWY96XAH4LPZ2UuIXear5YZPwpRwL0rOkvLRSMPAYUpXL3aVrxzRhw
	wYK1SwbwyWmnAYirxa32HA9ROzvYhGtoVBF/MlQC6mKUwdXqX0BL8X5fzZvAKod9YKe3IX1FrQOWy
	Un7Zz5plT/hyr5IMxk5kVq5KZ7ybIm6dzFn/ug48j/cFhCxTQ+3zW5t/6TOZhKiH3mZqnDZDXE6LS
	OyLjqY3A==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uE72j-0006vF-1j; Sun, 11 May 2025 15:48:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, andyshrk@163.com, conor+dt@kernel.org,
 damon.ding@rock-chips.com, devicetree@vger.kernel.org, didi.debian@cknow.org,
 dsimic@manjaro.org, jbx6244@gmail.com, jing@jing.rocks, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com,
 ziyao@disroot.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 15:48:35 +0200
Message-ID: <3317829.AJdgDx1Vlc@diego>
In-Reply-To: <20250511120009.37031-1-amadeus@jmu.edu.cn>
References:
 <13758471.dW097sEU6C@diego> <20250511120009.37031-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 11. Mai 2025, 14:00:09 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Chukun Pan:
> > First of all, thanks for noticing all the bits and pieces to improve.
> > I di think I have now fixed up all the "regular" pieces you mentioned
> > and amended the commit accordingly:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?id=3D1d2f65fa98ddcafdfd1ebcdb87105141861b584a
>=20
> Thanks a lot for the quick fix! It seems there is still a little problem:
>=20
> > <snip>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > <snip>
> +	gpu_opp_table: opp-table-gpu {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			opp-microvolt =3D <825000 825000 1000000>;
> +		};
> +		opp-400000000 {
> +		opp-hz =3D /bits/ 64 <400000000>;
>=20
> This line is missing a tab.

fixed :-) .

> +			opp-microvolt =3D <825000 825000 1000000>;
> +		};
> > <snip>
> +		spi0: spi@ff220000 {
> +			compatible =3D "rockchip,rk3562-spi", "rockchip,rk3066-spi";
> +			reg =3D <0x0 0xff220000 0x0 0x1000>;
> +			interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
>=20
> Also needed here.

I might be blind, but I don't see a tab missing here? #adress-cells and
#size-cells are in the same level of indentation as the other properties
of spi0? I did move the -cells down though now.


> > <snip>
> > +		pwm3: pwm@ff230030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff230030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
>=20
> Missed here.

adapted like the other pwm-nodes

> > <snip>
> > +				power-domain@12 {
> > +					reg =3D <12>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > ...
> > +				power-domain@13 {
> > +					reg =3D <13>;
> > +					#power-domain-cells =3D <1>;
>=20
> Does #power/#address/#size need to be put under pm_qos?

moved

> > <snip>
> > +		spi1: spi@ff640000 {
> > +			compatible =3D "rockchip,rk3066-spi";
> > +			reg =3D <0x0 0xff640000 0x0 0x1000>;
> > +			interrupts =3D <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > ...
> > +		spi2: spi@ff650000 {
> > +			compatible =3D "rockchip,rk3066-spi";
> > +			reg =3D <0x0 0xff650000 0x0 0x1000>;
> > +			interrupts =3D <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
>=20
> Same here.

moved

>=20
> > <snip>
> > +		pwm4: pwm@ff700000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm5: pwm@ff700010 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700010 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm6: pwm@ff700020 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700020 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm7: pwm@ff700030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff700030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm8: pwm@ff710000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm9: pwm@ff710010 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710010 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm10: pwm@ff710020 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710020 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm11: pwm@ff710030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff710030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm12: pwm@ff720000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm13: pwm@ff720010 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720010 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm14: pwm@ff720020 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720020 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
> > ...
> > +		pwm15: pwm@ff720030 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff720030 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
>=20
> pinctrl and #pwm-cells forgot to change.

hopefully caught all pwms now


> > <snip>
> > +		sdmmc0: mmc@ff880000 {
> > +			compatible =3D "rockchip,rk3562-dw-mshc",
> > +				     "rockchip,rk3288-dw-mshc";
> > +			reg =3D <0x0 0xff880000 0x0 0x10000>;
> > +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency =3D <200000000>;
> > ...
> > +		sdmmc1: mmc@ff890000 {
> > +			compatible =3D "rockchip,rk3562-dw-mshc",
> > +				     "rockchip,rk3288-dw-mshc";
> > +			reg =3D <0x0 0xff890000 0x0 0x10000>;
> > +			interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +			max-frequency =3D <200000000>;
>=20
> max-frequency should be placed below clock

moved and also moved fifo-depth upwards between clock-names
and max-frequency


> > <snip>
> > +		saradc0: adc@ff730000 {
> > +			compatible =3D "rockchip,rk3562-saradc";
> > +			reg =3D <0x0 0xff730000 0x0 0x100>;
> > +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			#io-channel-cells =3D <1>;
> > ...
> > +		saradc1: adc@ffaa0000 {
> > +			compatible =3D "rockchip,rk3562-saradc";
> > +			reg =3D <0x0 0xffaa0000 0x0 0x100>;
> > +			interrupts =3D <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> > +			#io-channel-cells =3D <1>;
>=20
> `#io-channel-cells` should be put above `status =3D "disabled";`

moved now :-)

Hopefully this now caught all the smallish issues.


Thanks a lot
Heiko


