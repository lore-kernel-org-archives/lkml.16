Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EA51B0437;
	Wed, 26 Mar 2025 22:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743027159; cv=none; b=q4I62Lfa5ZtFfofWqso2Ebno3WsI8EzGnpwTHoqljQdooXqqrhhBPPPj7rrpnI1q5WIlhQtDgTCewVY+UZJNCDVP/Bnjs5fyxcz/J9Zo7a3Lai9PraO8cBp7u2K/cNarqRJ+lGu3ucnsLg2jZ9q0Bi3n5eZhikqrl6pc5V5vW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743027159; c=relaxed/simple;
	bh=LfyS4VLnu+JGzH9HSvzhfHnBQ9VR4T7Ztw/HSi2SQ9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNJokIkuX+peMdQufs2GX+lhNzP48onb5vWu6D+8Ph2HVYeuusyTSYJknI5D/kezUmvTQsWS0W0Kycz6iE5iePO+CvJcXJy13j+PZYCqOSftcLA4tl3dFQrw0NHwVINiK4VS6G2N3ZDUkyeC5U+AiX3Blre1B9mFmc+nAUjo8XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEf7PpSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEf7PpSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD746C4CEE2;
	Wed, 26 Mar 2025 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743027158;
	bh=LfyS4VLnu+JGzH9HSvzhfHnBQ9VR4T7Ztw/HSi2SQ9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEf7PpSX2uM6SQ4kyk8jjMO9JBmsVGED/BB61YG6uZxYvDX1NYqXK0mJ46lny1iCl
	 Yv9cu6ERsqUmJ5t9mprYjpqH6sq8pphFvSwb0955tUTKL8kCz2O6SNVeC5N6Zo5S6T
	 qEZQZuk+LNN9Aq4LpOPT9TNtSX6339SOzIgAMh//UrZE71YiEWScofjyQnBTfKifyQ
	 2gSvIrhe5T5IJvxGXNntWJluhboaxTdv8qCn51BgRQ7y/xUgZpNxvmFhFHSCnyIPyU
	 QCjw+ioG8V2XQeapvXCUsYBg2OV2Mga4oWQrFaxFqxibqgLE3D/st3IraJlPUFoRnb
	 A4FC6IcXHmDRA==
Date: Wed, 26 Mar 2025 22:12:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Michal Simek <michal.simek@amd.com>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: trivial-devices: Document SPI
 measurement on LWE boards
Message-ID: <20250326-contort-spoof-2069177e12dd@spud>
References: <20250326140930.2587775-1-lukma@denx.de>
 <20250326-unluckily-consuming-948176031b08@spud>
 <20250326184240.77e2bdc9@wsk>
 <20250326-bulge-outdated-9787da68e2d3@spud>
 <20250326222702.436f115b@wsk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bZEBMoXS74aT7VAs"
Content-Disposition: inline
In-Reply-To: <20250326222702.436f115b@wsk>


--bZEBMoXS74aT7VAs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 10:27:02PM +0100, Lukasz Majewski wrote:
> Hi Conor,
>=20
> > On Wed, Mar 26, 2025 at 06:42:40PM +0100, Lukasz Majewski wrote:
> > > Hi Conor,
> > >  =20
> > > > On Wed, Mar 26, 2025 at 03:09:30PM +0100, Lukasz Majewski wrote: =
=20
> > > > > The measurement device on Liebherr's (LWE) boards is used to
> > > > > monitor the overall state of the device. It does have SPI
> > > > > interface to communicate with Linux host via spidev driver.
> > > > > Document the SPI DT binding as trivial SPI device.
> > > > >=20
> > > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > > ---   =20
> > > >=20
> > > > You should not do a resend with no explanation as to why.
> > > > Additionally, I would like to know why my review on the original
> > > > patch was ignored:
> > > > https://lore.kernel.org/all/20250225-despair-rural-dc10216005f4@spu=
d/#t
> > > >  =20
> > >=20
> > > I've made a mistake, as I've used the lwe prefix, which is the
> > > different branch office for Liebherr.
> > >=20
> > > As we discussed last time - it would be better to use the already
> > > present 'lwn' vendor prefix as several other boards from this
> > > company use it (display5, bk4, xea, btt3).
> > >=20
> > > And this was apparent, after I've resent the patches. My mistake.
> > >=20
> > > Regarding the comment - on xea, btt the binding would be used, as
> > > those two boards (based on imx287) are using it.
> > >=20
> > > Hence, single "trivial device" would be OK.
> > >=20
> > > The v2 of this patch has the proper 'lwn,btt' binding. =20
> >=20
> > I'm sorry, I don't understand how this excuses using the same binding
> > for different devices.
>=20
> Ok, so maybe I will just explain how things are on those devices and we
> can find some solution.
>=20
> So we do have two devices - based on imx287: XEA (rev 1,2) and BTT (rev
> 0,1,2).
>=20
> We do have a measurement device connected to SPI (on both above
> devices). This device has a protocol, which is fully served in user
> space (just the /dev/spidevX.Y is required for it).
>=20
> Hence the 'lwn,btt' can be used for all those measurement devices.

You mentioned in the previous version of this that the devices used a
"similar approach", not the same approach. Now you're saying that it is
the same. Which is it?
If a kernel driver was handling this, rather than userspace via spidev,
would it have to differentiate between xea and btt devices?

--bZEBMoXS74aT7VAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+R70gAKCRB4tDGHoIJi
0o6JAQCskXi0KV3sTHvhavdHHkQyGiAwwY5AHgIvJpGItf8hFgD8DXGJEpe5IwLK
A/jCqgphrNnsiY2U0wjOjbYFoytmjQU=
=yiP2
-----END PGP SIGNATURE-----

--bZEBMoXS74aT7VAs--
