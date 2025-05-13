Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B291A2398
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157144; cv=none; b=Or1YJw63SJABRbGleF5y2m9Ubqxy9XITzzTd0KF/TIQ1RQ4h3TITRxEOR7gE8bS/Yv+CHMgAGPKxW6Of6fUPixXvWHxZrVUl758kvBbwD6J8sEuQR+hCKAU5TcDfe65elZGu8qq320EUo3lfH9+8VBq8brGNdKiNd4k2chmFayg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157144; c=relaxed/simple;
	bh=0IN2D/okqMHWE0nXrbprs09StzNcM6Okc89h9JohR94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O4wcziojQGCBn7BBiG8V84TMOge4wXrWysfOtDTmFGr8ngndznkcHfkNHie4nunQB6bjgZE508OiS7/3alOzmt9GPYF/FauYOO90RDIa2fO9RQuPO8e7/scoKYZqZp+LN9+AXUQtK3irCZV7PNmIEHNZofuHBvHTnSlw8TwjTO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=AfMfEUbI; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="AfMfEUbI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4H2DYdicH8cY2u0pkRgeIrS4yk2HqnARpS5QbRb4AGU=; b=AfMfEUbIftCZYx51MEWG76Jbxm
	86Gk4kUFZP6BYBhkGpWehh2aMMRwicmPjtYaWwYgvxQ3bTEBx4Tx2GfvHpj024OBaoofYFwNTZdcB
	zwUIIfeAhaINxePljmT0jzRoBC3WpeIFz4iNyG2kKv4Zuzt3+pdm5eKEeKZH9vmLdlL3tClL2SS6E
	HrxG2ScdVyaQbKdgMRfDDxn/X1FV8YzOI5X1CJtK9sG5ayg5OgGUErOUPfBPQ2Q8JTBfkCGNLXrBY
	i5V0meEORd+YrMN08fJ5rvUyetcz/eJMJHeEW0uOhpdlkGqHhOK2fbfezi9ah7+rM9pH52SnMII7F
	2o+OdJoA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEtNk-0002TU-Te; Tue, 13 May 2025 19:25:32 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
Date: Tue, 13 May 2025 19:25:31 +0200
Message-ID: <3704497.hdfAi7Kttb@diego>
In-Reply-To: <4a4c0295-d8f1-4d8a-92e4-34a69b42c728@kwiboo.se>
References:
 <20250510220106.2108414-1-heiko@sntech.de>
 <4a4c0295-d8f1-4d8a-92e4-34a69b42c728@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hey Jonas,

Am Sonntag, 11. Mai 2025, 13:05:08 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Jonas Karlman:
> On 2025-05-11 00:01, Heiko Stuebner wrote:
> > Even though they will be the same for all boards, i2c and uart aliases
> > are supposed to live in the individual board files, to not create
> > aliases for disabled nodes.
>=20
> This sounds like something tooling should be able to handle, e.g. U-Boot
> use fdtgrep to filter out nodes (and aliases) for the FDT used by early
> boot phases.
>=20
> Maybe DTC just need a feature to remove aliases to disabled nodes?

personally I don't see the issue with an i2c alias pointing to a disabled
i2c controller, but it does seem to violate some dt convention.

At least people got adamant this time about the aliases moving into the
board file [0].


> Also how should overlays handle aliases? Are all overlays suppose to add
> aliases for the add-on devices they may enable?
>=20
> And how should we handle boards with e.g. a 40-pin header where pins
> could be muxed to multiple functions. Is it the overlays responsibility
> to remove and replace aliases? E.g. if pins can mux between i2c1 and
> uart3, and i2c1 was enabled by default.

I guess we'll cross those bridge together with the bigger round of
dt-people when the first overlay appears ;-) .

Heiko


[0] https://lore.kernel.org/all/df6003e3-7fc3-4e50-a702-f0aa8d663dff@app.fa=
stmail.com/

>=20
> Regards,
> Jonas
>=20
> >=20
> > So move the newly added aliases for rk3528 over to the Radxa E20C board,
> > which is the only rk3528 board right now.
> >=20
> > Fixes: d3a05f490d04 ("arm64: dts: rockchip: Add I2C controllers for RK3=
528")
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  .../boot/dts/rockchip/rk3528-radxa-e20c.dts      |  2 ++
> >  arch/arm64/boot/dts/rockchip/rk3528.dtsi         | 16 ----------------
> >  2 files changed, 2 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/=
arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> > index 506d54337ece..9f6ccd9dd1f7 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> > @@ -18,8 +18,10 @@ / {
> > =20
> >  	aliases {
> >  		ethernet0 =3D &gmac1;
> > +		i2c1 =3D &i2c1;
> >  		mmc0 =3D &sdhci;
> >  		mmc1 =3D &sdmmc;
> > +		serial0 =3D &uart0;
> >  	};
> > =20
> >  	chosen {
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3528.dtsi
> > index cd8ef389ccf3..b2724c969a76 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > @@ -24,22 +24,6 @@ aliases {
> >  		gpio2 =3D &gpio2;
> >  		gpio3 =3D &gpio3;
> >  		gpio4 =3D &gpio4;
> > -		i2c0 =3D &i2c0;
> > -		i2c1 =3D &i2c1;
> > -		i2c2 =3D &i2c2;
> > -		i2c3 =3D &i2c3;
> > -		i2c4 =3D &i2c4;
> > -		i2c5 =3D &i2c5;
> > -		i2c6 =3D &i2c6;
> > -		i2c7 =3D &i2c7;
> > -		serial0 =3D &uart0;
> > -		serial1 =3D &uart1;
> > -		serial2 =3D &uart2;
> > -		serial3 =3D &uart3;
> > -		serial4 =3D &uart4;
> > -		serial5 =3D &uart5;
> > -		serial6 =3D &uart6;
> > -		serial7 =3D &uart7;
> >  	};
> > =20
> >  	cpus {
>=20
>=20




