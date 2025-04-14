Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2496325394A;
	Mon, 14 Apr 2025 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641180; cv=none; b=JM4PvMXie/GFM2FuQW4NQAcNxgJDjFuGs+PyOS1g4yWeCck0iB/Gc3XakDM5cF/IwXRSG9uw4ezqH7y541NlSb4/EEu0EChdljRVZjy5k1K3YMqm/WkLcnAYBY0HR05AvWlh9rTWQS+u/EfeIExblCVnS+FmWAJEMPATLiG4deo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641180; c=relaxed/simple;
	bh=lA7zf9dbvRKst6shiF3aZKI3XbTyVvj41TkImy2Vz5M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r/eUNaqy784ZbUGJLRHOF1OgA0FdATuw5ol/Vtk+IXK/BNczTFMTnDGBtuxy9Ipswb8E+qVX425JRVrcTFj3gOVLg3Ogyl5xnquMIfxlWDs2Cv7B16yyU0xp1+u7nAUTO9dX8pveQkJIwFoB7zJL4zsEmS/NviRRd1AN17NN5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RIk4W9Lx; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RIk4W9Lx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0C3C42E7E;
	Mon, 14 Apr 2025 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744641176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mmeS8sIawvFkEyCe9XAgryQ4ImIg70CDZn/i+5o9wo0=;
	b=RIk4W9LxCYBAuZHjyklMCeibQOFt9Qsqy5UtK9fMdXaMA5h5snaQUoDMCfq6OHEDNadfZk
	kBN53B3n1XrDbNZWKbeeeh+l3f32ExahjdaGH+L4wMDn2xcKTagihl+cldN0yJ6WMCEP73
	bFcHtgigg/CvbgTZFen+NtoUK1YugTuKDdXIoPFiTqDNxbyviI1O1CyLgynAWn8KZxB5RF
	AGYNO4r4yJJtg2K89dtdz42oAjaREKB7MzKBitIBWlBvnCuA/CNUmwH6s8gIvfsKcZHCtH
	1xlm032Vj3IkOhkBqM/cHf52iS6fLIBgzaa307AQjUVCeQDFUyzvo/RsN/OczA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: Drop unused "pinctrl-names"
In-Reply-To: <20250409204936.1521405-1-robh@kernel.org>
References: <20250409204936.1521405-1-robh@kernel.org>
Date: Mon, 14 Apr 2025 16:32:55 +0200
Message-ID: <87jz7mhkyw.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddtkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemiegrlegsmeelhegvtdemheejrgefmeegugehugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemiegrlegsmeelhegvtdemheejrgefmeegugehugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesg
 hhmrghilhdrtghomhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Rob,

> "pinctrl-names" depends on "pinctrl-[0-9]" properties, but none are
> present for the pca9555 nodes.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/marvell/armada-7040-db.dts | 1 -
>  arch/arm64/boot/dts/marvell/armada-8040-db.dts | 2 --
>  arch/arm64/boot/dts/marvell/cn9130-db.dtsi     | 1 -
>  3 files changed, 4 deletions(-)


Applied on mvebu/dt64

Thanks,

Gregory


>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-7040-db.dts
> index 2b5e45d2c5a6..3add6506ff20 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
> @@ -124,7 +124,6 @@ &cp0_i2c0 {
>=20=20
>  	expander0: pca9555@21 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x21>;
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040-db.dts b/arch/arm64/=
boot/dts/marvell/armada-8040-db.dts
> index 9d45e881a97d..21ecb9c12505 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-8040-db.dts
> @@ -122,7 +122,6 @@ &cp0_i2c0 {
>  	/* U31 */
>  	expander0: pca9555@21 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x21>;
> @@ -131,7 +130,6 @@ expander0: pca9555@21 {
>  	/* U25 */
>  	expander1: pca9555@25 {
>  		compatible =3D "nxp,pca9555";
> -		pinctrl-names =3D "default";
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		reg =3D <0x25>;
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi b/arch/arm64/boot=
/dts/marvell/cn9130-db.dtsi
> index be56a2336265..50e9e0724828 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-db.dtsi
> @@ -209,7 +209,6 @@ i2c@1 {
>  			/* U12 */
>  			cp0_module_expander1: pca9555@21 {
>  				compatible =3D "nxp,pca9555";
> -				pinctrl-names =3D "default";
>  				gpio-controller;
>  				#gpio-cells =3D <2>;
>  				reg =3D <0x21>;
> --=20
> 2.47.2
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
