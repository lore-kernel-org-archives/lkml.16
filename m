Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362C207A08;
	Fri, 20 Jun 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410763; cv=none; b=gyAMEZe5Q8aazQ+NtWvVMgcaoQwm2+Zi+Wl8AiO67EX8ib+Nb8pogK5SHa/dEABxCGKg0hyzl0feMzJI4MhLn/zX7VT0S4FKuojNkmm7q6/kzsFdjusXU/Yvy7tiAJtiorTE04ViFmKpNxSlUSECMh4BJP3VPex3jbsQZ4yvHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410763; c=relaxed/simple;
	bh=r872EI1TVMcD9PYgG5ikEb647F3E7MD3WHZnPBLJ+qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wlt3rb0t7pFmyJbi5gz2BTyNjM3jN5yGTFvPBjp3nX4bw1jGC3/PA1shCG3aDwDWK7B2QoVEqA46WTRhvajwjYfoRudkTwRqpqTfkya3GQ+BbeKKYslzhzaRHnCHbv3wMk+Ty5S9ORrQnmgYSxu3xOKGFTEQ4dkoemTQ9lQE0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pMjv3keH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pMjv3keH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+77mLNRKP7S3a1EeDVlp4Z40e4a+H2yITmtvU3k1wSo=; b=pMjv3keHGRwyvE7kWF7p/mXjzW
	JLeyfMK7GJJvLwDxXLm5Si6mdN0/M9RoKoW7y6er0Wnli5GymY1sGpesPmVaz29O3PfK6UJkAhA9J
	ElEuWdlbwBto0BRnWao1uRmBP/OKGeg5e4gR91ayq7n4bR4kpH0o76AZ+VRXaubvgRSNQttyhqJJA
	S7mVWqaBggV9Y0O0egMXAjI8hSrFsWeToX8SNfocUFdISuhSJ5Pr4QQvO8skYL2hx/KmKEa3oewbm
	bs2woefRQcUsCwIODVuhC4OwAWkJs9ucxpVRwVFCbud6yH/Rz92aq5/qSl58HjCdVdNWkiHfVFmC+
	gwZlUe9A==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSXnS-00088r-9A; Fri, 20 Jun 2025 11:12:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: John Clark <inindev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Clark <inindev@gmail.com>
Subject:
 Re: [PATCH v1 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support
Date: Fri, 20 Jun 2025 11:12:29 +0200
Message-ID: <2432603.PIDvDuAF1L@phil>
In-Reply-To: <20250616212214.139585-3-inindev@gmail.com>
References:
 <20250616212214.139585-1-inindev@gmail.com>
 <20250616212214.139585-3-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 16. Juni 2025, 23:22:14 Mitteleurop=C3=A4ische Sommerzeit schrie=
b John Clark:
> Add device tree for FriendlyElec NanoPi M5 with Rockchip RK3576 SoC
> (4x Cortex-A72, 4x Cortex-A53, Mali-G52 MC3 GPU, 6 TOPS NPU). Enables
> basic booting and connectivity.
>=20
> Supported features:
> - RK3576 SoC
> - 4GB/8GB/16GB LPDDR4X/LPDDR5 RAM
> - 16MB SPI Nor Flash
> - 2x 1Gbps Ethernet
> - 2x USB 3.2 Gen 1 Type-A ports
> - microSD UHS-I
> - M.2 M-Key PCIe 2.1 x1 NVMe support
> - HDMI 1.4/2.0 (up to 4096x2304@60Hz)
> - 30-pin GPIO (2x SPI, 4x UART, 3x I2C, 5x PWM, 20x GPIO)
> - Debug UART
> - RTC with HYM8563TS
> - Power via USB-C (PD, 6V~20V)
>=20
> Signed-off-by: John Clark <inindev@gmail.com>
> ---

apart from the schema problems, Rob's bot found, I saw some additional
nitpicks below.


[...]

> +	sound {
[...]
> +	};
> +
> +	vcc_12v_dcin: regulator-vcc-12v-dcin {

nodes without addresses should get sorted by nodename
aka regulator-* before sound.

Phandles count into the sorting only below in the
&phandle {}; parts


> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		regulator-name =3D "vcc_12v_dcin";

blank lines between properties and subnodes please.
same for other regulators below and also the pmic.

> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};
> +	};
> +

> +&fspi1m1_pins {
> +	rockchip,pins =3D
> +		/* clk, d0~4 */

comment could state a tiny bit more what is changed compared to
the "original" pin settings

> +		<1 RK_PD5 3 &pcfg_pull_none>,
> +		<1 RK_PC4 3 &pcfg_pull_none>,
> +		<1 RK_PC5 3 &pcfg_pull_none>,
> +		<1 RK_PC6 3 &pcfg_pull_none>,
> +		<1 RK_PC7 3 &pcfg_pull_none>;
> +};




> +&saradc {
> +	status =3D "okay";
> +	vref-supply =3D <&vcca_1v8_s0>;

status is the last property

> +};




