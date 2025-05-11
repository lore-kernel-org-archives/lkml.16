Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455D0143748;
	Sun, 11 May 2025 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746958496; cv=none; b=DAh19NnnR8bY8NkiWsH798TFkt1bhjC1VDI5R5BdmnhqpXx/mwYbY9lbm9/3RpxeKjGGCzTeeCYHR+G4J0h+dFJe5pPw0yTS0GwK8P3u7ai4E30EcQeLiZ3L+hcHWQ8cpqNTG9C/lECgHQi8gjfS2cis+nnyNG5UvuQ5DTnPANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746958496; c=relaxed/simple;
	bh=PwKzrtF3Vmm1dOSo6/yvcGc3xKcGYa20xv1KJfK7Uhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tufaX/uXzw7oicppcmqiaVnemBbzlF7jztRx85XRAbaDFmnkb4ylWL1fQLPiKF0EWBjWrgz1Wbzvzq8QgSanKmX95z0UPZdGOL3mKR123uWeSiGbsbehtBOMX0pmvlnw3a/t0FddWTx0ylJl88EpCmfciF96ENh6sjsnIVOuSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=I6znUy3g; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="I6znUy3g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=5a3a7V+XtBUb1Y2DCtBO9bFgMKOod7QDQZbBrVd+0qg=; b=I6znUy3gTyckQuu0SDQ90zmn//
	MfHHUDDdn7yySDUuZqxcXtoyiJU02Y6TrTYMNjlo0na2og0PZ7ucuhKLyCu8eJ/t8H13Y4sFiaix8
	VBZHuowl2RXJIYFshxy3cIhm50NS8Q+NCCWxKKJKK/L5oNL8Hf/uTEFYWnKDgOuSfa9MCjQ85MtPd
	62Oc+zBe/5yNYyfGsajEGbQRJ4A4e4cEIztLGapSLFu+KpDLewF+p396mbYzVaw75FTne2tEmKN8N
	i+V0Nt9faMGex0wZ8yOBYlEVHy4aYMErOLl8gH0qPWnhv6+yzf5tBzncR0qj64MmxwFNcibzCxuf7
	3Dkbp4jg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uE3hT-0002ls-VM; Sun, 11 May 2025 12:14:28 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: ziyao@disroot.org, Chukun Pan <amadeus@jmu.edu.cn>
Cc: andyshrk@163.com, conor+dt@kernel.org, damon.ding@rock-chips.com,
 devicetree@vger.kernel.org, didi.debian@cknow.org, dsimic@manjaro.org,
 jbx6244@gmail.com, jing@jing.rocks, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com,
 Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 12:14:27 +0200
Message-ID: <13758471.dW097sEU6C@diego>
In-Reply-To: <20250511100022.31465-1-amadeus@jmu.edu.cn>
References:
 <20250310140916.14384-2-ziyao@disroot.org>
 <20250511100022.31465-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Sonntag, 11. Mai 2025, 12:00:22 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Chukun Pan:
> > <snip>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3562.dtsi
> > @@ -0,0 +1,1187 @@
> > <snip>
> > +#include <dt-bindings/phy/phy.h>
> > +#include <dt-bindings/power/rockchip,rk3562-power.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
>=20
> Does this need to be sorted alphabetically?

the rk3562-power header is gone temporarily anyway (in another tree),
so I moved things to numbers temporarily and created
	https://lore.kernel.org/r/20250510161531.2086706-1-heiko@sntech.de
to be applied after the merge-window.

>=20
> > <snip>
> > +		idle-states {
> > +			entry-method =3D "psci";
>=20
> It would be better to leave a blank line here.

added

> > +			CPU_SLEEP: cpu-sleep {
>=20
> > <snip>
> > +		pwm0: pwm@ff230000 {
> > +			compatible =3D "rockchip,rk3562-pwm", "rockchip,rk3328-pwm";
> > +			reg =3D <0x0 0xff230000 0x0 0x10>;
> > +			#pwm-cells =3D <3>;
> > +			pinctrl-names =3D "active";
>=20
> It should be `pinctrl-names =3D "default";` for pwm, see also [1]

fixed the pinctrl


> > +			pinctrl-0 =3D <&pwm0m0_pins>;
> > +			clocks =3D <&cru CLK_PMU1_PWM0>, <&cru PCLK_PMU1_PWM0>;
> > +			clock-names =3D "pwm", "pclk";
> > +			status =3D "disabled";
> > +		};
>=20
> The pinctrl should be placed below the clock.

fixed ordering

>=20
> > <snip>
> > +			power: power-controller {
> > +				compatible =3D "rockchip,rk3562-power-controller";
> > +				#power-domain-cells =3D <1>;
> > +				#address-cells =3D <1>;
> > +				#size-cells =3D <0>;
> > +				status =3D "okay";
> > +
>=20
> `status =3D "okay"` is not needed here.
> Also remove extra blank lines.

dropped okay ... extra blank was already removing when applying

>=20
> > +
> > +				power-domain@RK3562_PD_GPU {
> > <snip>
> > +				power-domain@RK3562_PD_VI {
> > +					reg =3D <RK3562_PD_VI>;
> > +					#power-domain-cells =3D <1>;
> > +					#address-cells =3D <1>;
> > +					#size-cells =3D <0>;
> > +					pm_qos =3D <&qos_isp>,
> > +						 <&qos_vicap>;
> > +
> > +					power-domain@RK3562_PD_VEPU {
> > +						reg =3D <RK3562_PD_VEPU>;
> > +						pm_qos =3D <&qos_vepu>;
> > +					#power-domain-cells =3D <0>;
>=20
> This line is missing a tab, resulting in an indentation error.

fixed the indentation


> > +					};
> > +				};
> > <snip>
>=20
> > +		pcie2x1: pcie@ff500000 {
> > +			compatible =3D "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
> > +			#address-cells =3D <3>;
> > +			#size-cells =3D <2>;
>=20
> #address-cells/#size-cells should be placed above `status =3D "disabled";`
> I think other nodes also need to change this. (Some for #pwm-cells)

moved them (and the #pwm-cells above)


> > +			interrupt-names =3D "sys", "pmc", "msg", "legacy", "err", "msi";
>=20
> I noticed that the bsp 5.10 kernel said that pcie only has 8 MSI vectors,
> [2][3] but in the bsp 6.1 kernel it changed to 32 MSI vectors [4].
>=20
> The rockchip documentation also says there are only 8 MSI vectors:
>=20
> [5] Page37 8.8 "RK3528/RK3562/RK3576=E5=8F=AF=E5=88=86=E9=85=8D=E7=9A=84M=
SI=E6=88=96=E8=80=85MSI-X=E6=80=BB=E6=95=B0=E6=98=AF8=E4=B8=AA"
> Translate into English: "The total number of MSI or MSI-X that
> can be allocated by RK3528/RK3562/RK3576 is 8"
>=20
> We noticed this when supporting rk3528, so which one is correct?

I'll leave that for a fixup patch or further discussion ;-)


> > +			phys =3D <&combphy_pu PHY_TYPE_PCIE>;
>=20
> s/combphy_pu/combphy
>=20
> > <snip>
> +		combphy_pu: phy@ff750000 {
>=20
> Please change it to `combphy` like rk3568.

changed the naming.


> Heiko I know you just merged this, it's a bit offensive but I think
> it would be better to drop these patches and fix them further.
> Or kever would you like to send a fix patch? Although most of
> them are typo issues, it will take a few patches to fix it.

=46irst of all, thanks for noticing all the bits and pieces to improve.
I di think I have now fixed up all the "regular" pieces you mentioned
and amended the commit accordingly:

https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/co=
mmit/?id=3D1d2f65fa98ddcafdfd1ebcdb87105141861b584a


Heiko


