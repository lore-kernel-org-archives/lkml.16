Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678AD221DB4;
	Thu, 22 May 2025 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902770; cv=none; b=QZ7WhISQ5tZ6w/idUd0GKjAGuJL89AimR38JP2EeLCu+Pxf7RIkg3HXy85dzPwixYnSFvIF9ADmc+O3UW+0bINT32H4Gvb/NNNxNCDcK9AAnuqRzKAaW1B7U6Srw5BPenaeU3qI/IBOiyvJw0Mu4Z1RvRJGGTd5Nk/Pb4gCX2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902770; c=relaxed/simple;
	bh=X2s9zB3vrc6f1K8NE3e9/CuFnSq5Bh+SMebUKzLhdZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxtcrlIyRbPsVYYAYIO5trqWzMHaYTZK4cqAEUOR3IiZDYqh88z6etgMhWSklTLALuI/QRdl6HaNRiWUZn/K6OEXa0Iex7nP3acq7DBOkypAuXCIdAF6s7PTHrPHy6aMaYRjwxmXW5NuncLPkh9IETNs3RT4HLWffsDQV+Xi1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=cxed8hOH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="cxed8hOH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WuJth4b7mSGrp3rbiwhR274TXr1yLV08nwiXwf4KD8c=; b=cxed8hOHQAkc9ggZiVrM4KL4Fq
	Ohi3DyZ6gcYYOOCui+NtxigZS7eDiz3YSDAs7ws6Gs8/tIHOKIfDqqoO3v3VR+906Y8o9eZN8DeeU
	11U7Gbsjq0SYEqtR10yLiwPJu++N8vHDfx8tf8MdTRTrl5TK5z/WRCEeiZosv9Z5UZCQWZFyA2bzn
	QIh/sGh0lhzvlcBVzc8Gu7sqR+SjY2LiXm+B+jOd6lxSBiREDgLKxWkWI214+umu2a6F0X/an6o7s
	x1Yt2CBiyG9gHCwjK5ZbMDYwpIbM0wiP5Q/b3DgZ4gf49oZeNWUIE7a+wOt1kRJl3UQxf7MYqIawo
	HexnBV7A==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uI1Lu-0005jc-D5; Thu, 22 May 2025 10:32:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH 1/2] arm64: dts: rockchip: add ethernet1 alias to RK3588 Jaguar
Date: Thu, 22 May 2025 10:32:33 +0200
Message-ID: <2901570.AiC22s8V5E@diego>
In-Reply-To: <20250521-jaguar-mezz-eth-switch-v1-1-9b5c48ebb867@cherry.de>
References:
 <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-1-9b5c48ebb867@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 21. Mai 2025, 17:44:19 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> The RK3588 Jaguar exposes pins that can be muxed for GMAC1 functions to
> the Mezzanine proprietary connector, so let's add the alias to prepare
> for adapters using those signals in that function.

In light of the discussion about unused aliases in [0], always adding an
ethernet1 alias for something that may never be used is probably not
the way to go.


Heiko

[0] https://lore.kernel.org/linux-rockchip/df6003e3-7fc3-4e50-a702-f0aa8d66=
3dff@app.fastmail.com/

> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/=
boot/dts/rockchip/rk3588-jaguar.dts
> index 9fceea6c1398e92114dcb735cf2babb7d05d67a5..70a2569478f6165f067befb6c=
dfb4f58f00dd17d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> @@ -33,6 +33,7 @@ button-bios-disable {
> =20
>  	aliases {
>  		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
>  		i2c10 =3D &i2c10;
>  		mmc0 =3D &sdhci;
>  		mmc1 =3D &sdmmc;
>=20
>=20




