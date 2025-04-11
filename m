Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A01F3FED;
	Fri, 11 Apr 2025 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744390633; cv=none; b=THynHfhSydEE6Db2AS+/T9+fHiLyB/SLX9ViEE1umENek1qq+t96ei/9s/7tIJ+K/ICWqYWXOjQmcCabe8wU/+/wSc2gLi5d2t1MXF6q8UDG6xegAhXxtnUQsFD6RBxwTEbdfEBZ/hoXCbklQTO7cfeiBNBU+egTLQMJ4pJtiHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744390633; c=relaxed/simple;
	bh=A4abooR3EttvPWvNNoeHrRtS+/XpdmmTJmkN6cvnmUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVwhFel/VMP0/9vViYdRneq+XNKWSlMChM6Z1Wxk+ZKsxyGWcHRXYKdYXC6nWYZG/fII6E+rIWrDwXhOK6QW6b+YPvWCJ6viwImmKCtT6JH1GH7Gs517p5f8zIOVU0Jq9Hhtn4CdA2y7h51TBm7pl5nu0ndFiUXN/CTUqmFbZEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsD7TZpN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsD7TZpN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FC5C4CEE2;
	Fri, 11 Apr 2025 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744390632;
	bh=A4abooR3EttvPWvNNoeHrRtS+/XpdmmTJmkN6cvnmUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsD7TZpN+T66Nr+NUDt36p9sL3GPQH7pe8QitqssVurTbUDo2ia7TZsUYG7NbYbDg
	 /Lh50TOxis6uJvnda3ECKCEXov5ECp6rh4wTwK3LM/hbd10yJnPRiNmYXSFTxR3Inu
	 q2xR53UZl3F7HjFvx0szmUNARClIpX520qrFyQyr1kIuDifpfzm83qEoMhFVaW3aXk
	 kTk1MMjEYJ1h0JEqc3hiZ1dwdhtRDJehpVUX3lYl1nkqy6P3ThJcZqOsDDcEc0tpnd
	 F3IGRr9EqXK3vjt02bxS/uzJRkRwDFLDIXu/oH9cYokv3JaH4S+A0BNjc6ZWkht6Wo
	 3ulJn4/XAe4BQ==
Date: Fri, 11 Apr 2025 17:57:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux@roeck-us.net, Conor Dooley <conor.dooley@microchip.com>,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] regulator: dt-bindings: promote infineon buck
 converters to their own binding
Message-ID: <20250411-underfed-lurk-2b6e082595b6@spud>
References: <20240223-moonrise-feminist-de59b9e1b3ba@spud>
 <20240223-blabber-obnoxious-353e519541a6@spud>
 <CAMuHMdXXWSfDrrQUTW54FFHN464efe+672jyCjqYw4jpSPosBA@mail.gmail.com>
 <20250411-stapling-unwed-21a303742ca0@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="epla1mZz+IrHa/xm"
Content-Disposition: inline
In-Reply-To: <20250411-stapling-unwed-21a303742ca0@spud>


--epla1mZz+IrHa/xm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Naresh

On Fri, Apr 11, 2025 at 05:46:38PM +0100, Conor Dooley wrote:
> On Thu, Apr 10, 2025 at 06:15:24PM +0200, Geert Uytterhoeven wrote:
> > Hi Conor,
> >=20
> > On Fri, 23 Feb 2024 at 17:23, Conor Dooley <conor@kernel.org> wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > These devices are regulators may need to make use of the common
> > > regulator properties, but these are not permitted while only document=
ed
> > > in trivial-devices.yaml
> > >
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Thanks for your patch, which is now commit bad582f9879812bc
> > ("regulator: dt-bindings: promote infineon buck converters
> > to their own binding") in v6.9-rc1.
> >=20
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/regulator/infineon,ir38060.ya=
ml
> > > @@ -0,0 +1,46 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Infineon Buck Regulators with PMBUS interfaces
> > > +
> > > +maintainers:
> > > +  - Not Me.
> >=20
> > make dt_binding_check:
> >=20
> >     Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml:
> > maintainers:0: 'Not Me.' does not match '@'
> >             from schema $id: http://devicetree.org/meta-schemas/base.ya=
ml#
>=20
> Yup, and it is still "Not Me.". Shouldn't have been merged in the first
> place (or sent tbh), but someone who understands and cares for it should
> be here (Not me!)

You want to put your name down for this one Naresh, you're the one
making changes to the binding etc so actually know how it works?



--epla1mZz+IrHa/xm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lJ4wAKCRB4tDGHoIJi
0uWmAQCtxw5Z23ZiYT0qrn0wwzr4t2UEQ6ryapu9VWoQ38eBvAD7Bdm5DAj/ROim
FY3SDV/9aJ5RLCCL6oItMWegBdNPpAY=
=zhyk
-----END PGP SIGNATURE-----

--epla1mZz+IrHa/xm--
