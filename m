Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F417A2E6;
	Wed, 26 Mar 2025 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743024437; cv=none; b=NFdinG28UTVq+crYnq9D0WaMq9uf39FQRw+s8ZA53/YQEBpB8NJxZKkvu43JZW1wVnTprXgo78i/uOYPz2A9/9resm6xvrcx12GxW7+KwxQYbQ7YFzMKt3Iki+cKMxXV4XZoIf4XRW9fLZRo1Ersq3wVvrcVcSlAA7Zke1DnwQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743024437; c=relaxed/simple;
	bh=FGZ7ys+40W7ESYcVCxVQVeb6iDW6mrS2/OJOCHus2Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DdttIaIZYdBWsFWZMOYK1aSbFRK2kZ7T0mFSzeRXxBzPSLx/Of+4GuJQBK+RhOIB580vLn/5JqgWuogTyTjbpeglQCDEg4iqr5zLgPxM57OPFxzsTV1cmfE+y2vUry/2AYkq8wvQoYgIm0WP/YTWPYDhhzLvY+3XNHspkPz1Zok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=h/F2QKX2; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="h/F2QKX2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0356102EB802;
	Wed, 26 Mar 2025 22:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743024426; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=b6RKGXQH70hN/26lMgtvVKQRQMPme4MC9VIAU6oygE0=;
	b=h/F2QKX2TF17qdZE5CpxqRAAdG9oeiGJ+djfVnvV1KnMrvTSlPIWRA0vdQNWi3As0X+b9q
	JTbAXiGKWu2T5BMKUJstkJk1Ymy02h1SVWmnK7pJnhQ+7iP2UBkS9NLB5b7DmY+cT5TJZj
	emVS4W3zQCOTojswaALJYF1iORdksh/UuAHioGD39mxBd/R3JwcXW8NG0/zogdGqQR6JzC
	p0RNGIS6dFqZJaas0jehjsYONv5xn3KFjKb8szL6YSo/ZoIIhw3AWvhCZdo847UKOItivt
	k1cyf2XoQoDGXtByHroKqkw3oNWKmeIIIXezpkwCuTnzmLxYaMXEAovAm5A7Qw==
Date: Wed, 26 Mar 2025 22:27:02 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Noah Wang <noahwang.wang@outlook.com>, Michal Simek <michal.simek@amd.com>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: trivial-devices: Document SPI
 measurement on LWE boards
Message-ID: <20250326222702.436f115b@wsk>
In-Reply-To: <20250326-bulge-outdated-9787da68e2d3@spud>
References: <20250326140930.2587775-1-lukma@denx.de>
	<20250326-unluckily-consuming-948176031b08@spud>
	<20250326184240.77e2bdc9@wsk>
	<20250326-bulge-outdated-9787da68e2d3@spud>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JVzrlJU+vTy2I3H3ZW7lB1L";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/JVzrlJU+vTy2I3H3ZW7lB1L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Conor,

> On Wed, Mar 26, 2025 at 06:42:40PM +0100, Lukasz Majewski wrote:
> > Hi Conor,
> >  =20
> > > On Wed, Mar 26, 2025 at 03:09:30PM +0100, Lukasz Majewski wrote: =20
> > > > The measurement device on Liebherr's (LWE) boards is used to
> > > > monitor the overall state of the device. It does have SPI
> > > > interface to communicate with Linux host via spidev driver.
> > > > Document the SPI DT binding as trivial SPI device.
> > > >=20
> > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > ---   =20
> > >=20
> > > You should not do a resend with no explanation as to why.
> > > Additionally, I would like to know why my review on the original
> > > patch was ignored:
> > > https://lore.kernel.org/all/20250225-despair-rural-dc10216005f4@spud/=
#t
> > >  =20
> >=20
> > I've made a mistake, as I've used the lwe prefix, which is the
> > different branch office for Liebherr.
> >=20
> > As we discussed last time - it would be better to use the already
> > present 'lwn' vendor prefix as several other boards from this
> > company use it (display5, bk4, xea, btt3).
> >=20
> > And this was apparent, after I've resent the patches. My mistake.
> >=20
> > Regarding the comment - on xea, btt the binding would be used, as
> > those two boards (based on imx287) are using it.
> >=20
> > Hence, single "trivial device" would be OK.
> >=20
> > The v2 of this patch has the proper 'lwn,btt' binding. =20
>=20
> I'm sorry, I don't understand how this excuses using the same binding
> for different devices.

Ok, so maybe I will just explain how things are on those devices and we
can find some solution.

So we do have two devices - based on imx287: XEA (rev 1,2) and BTT (rev
0,1,2).

We do have a measurement device connected to SPI (on both above
devices). This device has a protocol, which is fully served in user
space (just the /dev/spidevX.Y is required for it).

Hence the 'lwn,btt' can be used for all those measurement devices.

As pointed out by Fabio, there is also 'lwn,bk4-spi' which is totally
different device, with different protocol used.


>=20
> >  =20
> > > Cheers,
> > > Conor.
> > >  =20
> > > >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > > b/Documentation/devicetree/bindings/trivial-devices.yaml index
> > > > fadbd3c041c8..5d736a9792c2 100644 ---
> > > > a/Documentation/devicetree/bindings/trivial-devices.yaml +++
> > > > b/Documentation/devicetree/bindings/trivial-devices.yaml @@
> > > > -161,6 +161,8 @@ properties:
> > > >            - jedec,spd5118
> > > >              # Linear Technology LTC2488
> > > >            - lineartechnology,ltc2488
> > > > +            # Liebherr on-board measurement SPI device
> > > > +          - lwe,btt
> > > >              # 5 Bit Programmable, Pulse-Width Modulator
> > > >            - maxim,ds1050
> > > >              # 10 kOhm digital potentiometer with I2C interface
> > > > --=20
> > > > 2.39.5
> > > >    =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/JVzrlJU+vTy2I3H3ZW7lB1L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfkcSYACgkQAR8vZIA0
zr0zUQf/QEYcbk8e/7WYLDh466wg0pzuEp8El+44ZV75SZeMnmSJ4HmwGT+dvMsk
pdgySz4drBFb/X1a0w2i0vxEUKiXa/XlQGHjP57WCYWTjjuM3iSlXS4/gCird5vh
nOClclALhJuRo5rcTCRHEMS685yXRSQWAnyD7lenUqgg7eWMKa/jkLTvgw9h8h9S
TnrZ1BM3D3I9Y9lcXZHAUEk9hQ4/jYYTk7OeQP6cLJDivEumw0y6t+sHt3WFgiy/
Q2PXN9+kDY1KrsWk2s5cMcFF/LQ2ad4dcOQpicuOtRJaK58lkVI8F5ePd1P9lD7O
vtxYEwvoRdVqPsrdWOlocyNTw3vqnA==
=CiAq
-----END PGP SIGNATURE-----

--Sig_/JVzrlJU+vTy2I3H3ZW7lB1L--
