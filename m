Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19D8139D0A;
	Tue, 27 May 2025 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748339921; cv=none; b=cKun9/phYCcxINTdsOhOvjlANVHGZpJAyvcHGIvrmkzy7jh+++D+Wtg5qzbfNWIllTIVl42dB9HPppURGL7Gf5ATZJWfO8CfYWg6FYY1w5qkonLzyBF6cfKzZxg+dSLVpXNm1jrnQ3+0IBtCSSvq9zP0/89ML60Tpask8R4vrdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748339921; c=relaxed/simple;
	bh=c7WSSyjdfKP/pCSd23kDXPF4A5xu8QHwMp2sNumHnaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3eUvnEkL2n9KG/XunI3B5xmy1Q/Ndlsg1SKKkpc2iGqnSuSMZv39enuhHd4c3yJO2OoUmsw2MjSC24CNaZweVNuYnb0eSEy2tC++wCvtPB3p/ExYWfBBO9xEGIMzyGAt0+hj5xhVkJ4mL6lsKiJHR/0aG1JhrEncY0noepv4yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=zdyPE/6F; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="zdyPE/6F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CkhC4UgjPuQVaDzWVls8hkO6XTDFrLoAmVdIcxrQuac=; b=zdyPE/6FYF0B9hHYOcyAJQSQVb
	v5p2PtNxurf+8p3BwNCAmbsiWZt75jOct2i6rviYg7cuSxRIJMtJLKN+NASU9Oo66Djpdjp4wjfEm
	m0IwHZ8ZVzTGe770tvvY2YWklQCYcQBuQw38CgwAkZpu0e3lAIH4gUiUICPcvh03Q666yjHPzeCNu
	e63o+lEPFgUfnMU19+gIuQSh+XsjmE3UK9ZYLFPVTC7Q4sj3pQzcYDP9Y/R3x5iT9hPP8Z6fVHuM+
	PdZyny0o+QjDlJp124lzkh06v5yuaeiXkjwMVh0o3Jn15L7JVjC/0BDKhqrsJq8PmNGgFGa2J466h
	gcnPF5dA==;
Received: from i53875bdb.versanet.de ([83.135.91.219] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uJr4i-0007Bf-FG; Tue, 27 May 2025 11:58:24 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter for
 RK3588 Jaguar
Date: Tue, 27 May 2025 11:58:23 +0200
Message-ID: <2600723.TLnPLrj5Ze@diego>
In-Reply-To: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 23. Mai 2025, 18:48:42 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> This adds support for the Ethernet Switch adapter connected through the
> mezzanine connector on RK3588 Jaguar.
>=20
> This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
> connectors, two user controllable LEDs, and an M12 12-pin connector
> which exposes the following signals:
>  - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
>  - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
>  - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
>    GPIO3_D1)
>  - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

> +&i2c1 {
> +	#address-cells =3D <1>;
> +	/* ADS1015 can handle high-speed (HS) mode (up to 3.4MHz) on I2C bus,
> +	   but SOC can handle only up to 400kHz. */

Multi-line comment style would be
	/*
	 * ADS1015 can handle high-speed (HS) mode (up to 3.4MHz) on I2C bus,
	 * but SOC can handle only up to 400kHz
	 */

> +	clock-frequency =3D <400000>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +

other than that, looks fine


Heiko


