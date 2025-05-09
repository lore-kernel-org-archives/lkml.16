Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E6218587;
	Fri,  9 May 2025 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800251; cv=pass; b=CeEn/FXx8M8H6HklxnWPRpsIzLQ0RLalbnR47WTNpPLYvg4gbuPulZ0PzYAptpkQBjDGxcG9NNWcOPKZjqyv0Um1RGvL2ChKVdlE6QQqeD02O+umahAWPUFOdF59WB2II0ftcJR7/oh78wyL6vvD0dpwsQ4Z/h8KnSDp9XfygdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800251; c=relaxed/simple;
	bh=9mszAhkmf32nTHA+pGFm0JZ79CLcsG5P8f/79b/3uEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJD/IK2d7u/pj2b3hi5vg9I5Klop6mX2HO1rTviFlMNajGJQ1oQ3Mb6Ep0msBKf+7MER2fE8WJXqQGFYFFAFSerU6Zi0b+EMIvzFml/dqR5WBqPvvWChIMr/uK/nBi/y3CbEDCjOkpwhGGxI73R9nnJjaiUtZG5sZvB8nMhi0qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=eUO+yLBO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="eUO+yLBO"
ARC-Seal: i=1; a=rsa-sha256; t=1746800233; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZbPZlullO6zvVpAmY704V5SFXRE6z8lqSovsV6OFm4qWsssBz7TQyZCiV+VSzMNYxlRajSO81cyifurFqQ71GRs2DjRGA3s5JsizsPFwTSGbMQv9Xmd6Tp2Pgw22+lM4xyPPaLqGOHFdr2gCt2DZNTj2Dg+H2vDGaiVt1ko+gg4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746800233; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=obPneM+Qwj55GVa1Th5WPUedVCFUOpOjen96FElUMvo=; 
	b=SOaXw9wxK4MkoK4b0MGoCy7315MFS6l5ihGLtXIqL0QGP0SGsBg0Cis/0PmJJhX0y65q2Rmlo1vlZ8ani9qvaN0GluCT1JESFl6g811MOGy9MtPmmK+Mj9pc1e5iwpUU22L9hnXCefhrw7gZZZitDIuLaO1hFSvrO7+kmGhJkEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746800233;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=obPneM+Qwj55GVa1Th5WPUedVCFUOpOjen96FElUMvo=;
	b=eUO+yLBOXm+8+0Geu/2zMEBPioszMeUyKxqzw9mIPBTfgV5i/435Fs92QJ25bXwm
	lXPkioJWBf7D4M/QyAUTQl6aQcx+txbb8P4tK2uAXU448aDw+7vtX29V/rwpHEboRZi
	0kWZy7eSnm2F0tQtO6Jw6fLZbazOFdETKCAjthiU=
Received: by mx.zohomail.com with SMTPS id 1746800231664336.94550182032515;
	Fri, 9 May 2025 07:17:11 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id CE58618072E; Fri, 09 May 2025 16:17:07 +0200 (CEST)
Date: Fri, 9 May 2025 16:17:07 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: add USB-C support for ROCK
 5B+
Message-ID: <yzmnjzndvqod6gdjlafvt23i3q7fq6dtzvevhhgs55eznl2uh7@tf6d2sxpp6gu>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-5-677033cc1ac2@kernel.org>
 <D9RNQUO6IKFU.9BYJLSAQV9WT@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wsv46qpm4wlb2vg5"
Content-Disposition: inline
In-Reply-To: <D9RNQUO6IKFU.9BYJLSAQV9WT@cknow.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/244.214.33
X-ZohoMailClient: External


--wsv46qpm4wlb2vg5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: add USB-C support for ROCK
 5B+
MIME-Version: 1.0

Hi,

On Fri, May 09, 2025 at 03:18:04PM +0200, Diederik de Haas wrote:
> On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
> > Add hardware description for the USB-C port in the Radxa ROCK 5 Model B+
> > This describes the OHCI, EHCI and XHCI USB parts, but not yet the Displ=
ayPort
> > AltMode, since the bindings for that are not yet upstream.
> >
> > Support for the ROCK 5B is prepared, but not exposed at the moment,
> > since it results in unreliable boot behavior due to hard resets killing
> > the supply voltage. Some further investigation and fixes in the kernel's
> > Type-C Port Manager (TCPM) state machine is needed before exposing the
> > port. The ROCK 5B+ has a dedicated port for powering the board and thus
> > is not affected.
> >
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  16 +++
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  23 ++++
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 137 +++++++++++++=
++++++++
> >  3 files changed, 176 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts b/arc=
h/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
> > index 74c7b6502e4dda4b774f43c704ebaee350703c0d..4096cd853f9a909e4233d2c=
61a1fe5ee83904c4c 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
> > @@ -99,12 +99,28 @@ pcie3x2_rst: pcie3x2-rst {
> >  	};
> > =20
> >  	usb {
> > +		usbc_sbu_dc: usbc-sbu-dc {
> > +			rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
> > +					<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +
> >  		vcc5v0_host_en: vcc5v0-host-en {
> >  			rockchip,pins =3D <1 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> >  		};
> >  	};
> >  };
> > =20
> > +&usbc0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&usbdp_phy0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&usbc_sbu_dc>;
> > +	sbu1-dc-gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > +	sbu2-dc-gpios =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
> > +};
> > +
> >  &vcc5v0_host {
> >  	enable-active-high;
> >  	gpio =3D <&gpio1 RK_PA1 GPIO_ACTIVE_HIGH>;
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm=
64/boot/dts/rockchip/rk3588-rock-5b.dts
> > index 9407a7c9910ada1f6c803d2e15785a9cbd9bd655..ab0c572ea9234f373af4a47=
db93fc1786f0e6fbf 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -36,8 +36,20 @@ &uart6 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&usbdp_phy0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&usbc_sbu_dc>;
> > +	sbu1-dc-gpios =3D <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
> > +	sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> > +};
> > +
> >  &pinctrl {
> >  	usb {
> > +		usbc_sbu_dc: usbc-sbu-dc {
> > +			rockchip,pins =3D <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,
> > +					<0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
> Shouldn't these be <4 RK_PA6 ...> and <4 RK_PA7 ...> ?
>=20
> In the rock5bp_v1.2 schematic they're (IIUC) GPIO0_C4 and _C5, but in
> rock_5b_v1450 schematic TYPEC0_SBU1_DC and TYPEC0_SBU2_DC are on
> GPIO4_A6 and GPIO4_A7.
>=20
> And in rock_5b_v1450 GPIO0_C4 and _C5 are connected to WIFI_REG_ON_H and
> BT_W AKE_HOST_H respectively.

Yes. I screwed that up when copying over the new pinctrl from the
5B+. FWIW I'm not very happy about the /delete-node/ hack anyways.
Let's postpone (drop) this patch adding USB-C support for now. Hopefully
I soon find a way to get the PD sink more stable.

Greetings,

-- Sebastian

--wsv46qpm4wlb2vg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgeDlwACgkQ2O7X88g7
+poj3w//TakIV+9yFNuiFVbErjDzjpOChiBickcfNhKJBE1SPDUlJi8cRFSdJX5M
fN560YIa3SMyi0hvN4fYU3zWX2BZnx3rqEsaJwt0rYJBndPQP80DLjm1gj63QIEZ
neKR5nN5FZZrXnFaco9xWTqtza/DhENtDTyVI8Ht+cI96v7300wXOrPuTTczYpZQ
VMtK5w/89JFctm4obPOWcH1d7dW2qz0kBzynum7+H8PVQxkfa6gg65Eg7Qr2pzA+
UMhENe0L0awTYWUAxcXNnByEl6t9nLG6YO40/hQRVvh/ZlYiNB1DjDn57eCl5QfL
ItySI/YjxLiWY9t2zBqIo0Q2ixpZ3cLufuoaJMcf0/nqR4n1wofi/VdE5ohZXTHm
4Wrm6w3sD2+MPosbeO6RP+YGSwUIgz8c5mwHEzveWOfHKbwQzjS4NpMRxreAWbSA
U3rjcKWT3nV1n7YgrDPqLs8gzjMdzJF9yFd5iDKs+6KBxlGvUHU/QeQN3+oC4OgA
yY+/rXBv2zbnsh+O9ouewDpZqp5m+zGD66bHib1dRfbON7G1wJwdQsG452DrYUae
PlkcS5OMG/4b4goQFLB/pW8VdnQTNc7ExpR1BZMU0u1n0KWBesmR43MMp8noyozW
5i7ipFYkltLHJ5V6HeaLWgukyKCaSn3aAo7e5sbDG3ILXw3ERo4=
=d/fb
-----END PGP SIGNATURE-----

--wsv46qpm4wlb2vg5--
