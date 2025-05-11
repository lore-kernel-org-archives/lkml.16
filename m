Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E592113F434;
	Sun, 11 May 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746977559; cv=none; b=k5piZmH5sXUqKHQg03cdxwzOTMXBgVwrHtGR0qEUCRTKolqY6nibgIaaPREuT9elFaIhanu9KpnvvKw3a+hc8y6zk/gmxjnKZIqWCottssLuGgY9I4YJBjOZUzKUmXgQCzRAoTgbf0gqssB0G6Oz4agAASP8SwGSLTYWUfBlAeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746977559; c=relaxed/simple;
	bh=wCTwfokvHjEpQQ1VOv/z864xcLS8sNTw1JEGMHTERw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INTNT2pVSK++cxtU75BNBUFl4W3R1zFzz1BwxGeitdtwjINQjcohYPuy/cinl+NmBgI6+wYSSGfO96JNnkLAK7SOfS3mcu+BzQ74Tn4xOUHjErQbrT3RxGQ7yXQb/61bci4fUiomNlWdDT49MpNWyT8dNYL9WTeES3w6Lz5++04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=KU5RE11T; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="KU5RE11T"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PRFRSL4n+C5Ljmoz7zXxqe6F+2Vxs8e68R7K0G+IUDg=; b=KU5RE11TXzjKXsnuOH57r+OCky
	p3sAUfWcD4yMEvwgOuA+lslZfvovBV3A5kdr+q5XFYa5gXd+Iz5QUnVKIeOkgRTWjWMniiugaHLf1
	egiVETrR7pGLWeSqTd+9FTT7MiXBSOQFSdFZkPdHU883hGfU14E0wSNkOBdqtjwtf7R5OMnpGpoNi
	Hg9bK8oysxMomikVSGmNrU0XGKIvbB8Q7Zhyx9n3XhR+edbVNyFSsTyf5NU1RSA2tj60bx5UXDzDw
	BZcVr3rW7ATFZ49aun9Nf0mZsB6KUTN5yi8UfQFdt35i4OKh3qRITLfhcY3wpWnt8xJYk2TeRtv0z
	li1qLw4g==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uE8fH-0000IX-8U; Sun, 11 May 2025 17:32:31 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, ziyao@disroot.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 17:32:30 +0200
Message-ID: <6747980.G0QQBjFxQf@diego>
In-Reply-To: <20250511150101.51273-1-amadeus@jmu.edu.cn>
References:
 <3317829.AJdgDx1Vlc@diego> <20250511150101.51273-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Sonntag, 11. Mai 2025, 17:01:01 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Chukun Pan:
> Hi,
>=20
> > I might be blind, but I don't see a tab missing here? #adress-cells and
> > #size-cells are in the same level of indentation as the other properties
> > of spi0? I did move the -cells down though now.
>=20
> Sorry I didn't make it clear. This refers to -cells.
>=20
> > hopefully caught all pwms now
>=20
> The pinctrl-names of pwm4 to pwm15 are still "active".
>=20
> > +		saradc0: adc@ff730000 {
> > +			compatible =3D "rockchip,rk3562-saradc";
> > +			reg =3D <0x0 0xff730000 0x0 0x100>;
> > +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			#io-channel-cells =3D <1>;
>=20
> > > `#io-channel-cells` should be put above `status =3D "disabled";`
> >
> > moved now :-)
>=20
> It looks like saradc0 forgot to change.

adapted the rk3562 dtsi again, with those last remants :-)


