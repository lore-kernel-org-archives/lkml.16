Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E66239594;
	Thu,  6 Feb 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865384; cv=none; b=ienyA/Z3hF1cwG2426L15RGYCbAT82WtVfFwMsPzgw9W53sHPI0rvZP8mA8FkSzrW9RLg6x3cLjEJE2nIFFx+hJl82fpOCW9ZR7Ni0EETfgFAKlXks9ParLoocxIiD0z7Q8UyO8sESPPAzLqPvXpBVMqzoM5gxl5dP1a7fN7Kzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865384; c=relaxed/simple;
	bh=UmvH7MsbrGXDx3zl8w0lghW82W2hpUei6vNUIirGofk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/R/htbHKrg/VyRvCYo2AwECbHTEAUl9phD9282Q4mCKL5pwEs1bixilm5icIh8Llm/f3px5swbXq+St9io+tDoFnF4lc7OAEnVqtcIAwHxPzEVRhCJHGEYWZbhoioQgzuH4en9kqn59hae2NZ4FKq67Twl7u9om7cHFmrAiwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPEQ36f9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPEQ36f9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82138C4CEDD;
	Thu,  6 Feb 2025 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738865383;
	bh=UmvH7MsbrGXDx3zl8w0lghW82W2hpUei6vNUIirGofk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPEQ36f96lT7G0QNq/QiNbljgU/LkrqkqL6E9PElWI5SGosigRKxnvOqaK4ITPWM9
	 m1vXZsmR7740n5W6v6pp0QmMT1tRyIW+XaUbry11tZKh9QJH6DxrMPJc0gsCmwyT9w
	 oErgKxoIH/CvEqGrBYrNXQfJjN47M2GYo+f+X0GDu4PoS3O7zaWRgg/dtOFkVHJg0B
	 Nc42g25snLQaDBArleKy/ietsrtCDtAhjA55sE2eSazw+wv5BQFIqe8N2Z8NqenKUP
	 rIZncqHQ7kgtMQQmIMoqEuaoPbB7Rku2nQl2mh/c8oYcaho7/7utHBZiMi2BhfvfkE
	 O3u5FktdulrtA==
Date: Thu, 6 Feb 2025 18:09:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Guenter Roeck <linux@roeck-us.net>, broonie@kernel.org,
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt binding
Message-ID: <20250206-camera-mashed-48cf0cf1715f@spud>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
 <20250204-mulled-evaluate-8a690cdfbd4d@spud>
 <CABqG17jHKfwJEfZxto_YA4opS8=QwqTqfNdkku8kcEv2_iW+XA@mail.gmail.com>
 <20250205-purge-debating-21273d3b0f40@spud>
 <CABqG17j4tKXnMZ5=vcjBvfe6JwCLQ6NbkQmJC9ySK_bmGEv=iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B2XOfc6sa6ozXXE8"
Content-Disposition: inline
In-Reply-To: <CABqG17j4tKXnMZ5=vcjBvfe6JwCLQ6NbkQmJC9ySK_bmGEv=iQ@mail.gmail.com>


--B2XOfc6sa6ozXXE8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 09:23:03PM +0530, Naresh Solanki wrote:
> On Thu, 6 Feb 2025 at 01:43, Conor Dooley <conor@kernel.org> wrote:
> > On Wed, Feb 05, 2025 at 03:51:25PM +0530, Naresh Solanki wrote:
> > > On Wed, 5 Feb 2025 at 00:52, Conor Dooley <conor@kernel.org> wrote:
> > > > On Tue, Feb 04, 2025 at 11:33:03PM +0530, Naresh Solanki wrote:
> > > > > Move dt binding under hwmon/pmbus & align accordingly.
> > > > >
> > > > > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > > > > ---
> > > > >  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++=
++++++
> > > > >  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
> > > > >  2 files changed, 61 insertions(+), 45 deletions(-)
> > > > >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus=
/infineon,ir38060.yaml
> > > > >  delete mode 100644 Documentation/devicetree/bindings/regulator/i=
nfineon,ir38060.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infine=
on,ir38060.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir=
38060.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..e1f683846a54
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38=
060.yaml
> > > > > @@ -0,0 +1,61 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,ir38060.=
yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Infineon Buck Regulators with PMBUS interfaces
> > > > > +
> > > > > +maintainers:
> > > > > +  - Not Me.
> > > >
> > > > How the hell did this get merged!
> > > >
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - infineon,ir38060
> > > > > +      - infineon,ir38064
> > > > > +      - infineon,ir38164
> > > > > +      - infineon,ir38263
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  regulators:
> > > > > +    type: object
> > > > > +    description:
> > > > > +      list of regulators provided by this controller.
> > > >
> > > > Can you explain why this change is justified? Your commit message is
> > > > explaining what you're doing but not why it's okay to do.
> >
> > > This is based on other similar dt-bindings under hwmon/pmbus.
> >
> > Okay, but what I am looking for is an explanation of why it is okay to
> > change the node from
> >
> > | regulator@34 {
> > |   compatible =3D "infineon,ir38060";
> > |   reg =3D <0x34>;
> > |
> > |   regulator-min-microvolt =3D <437500>;
> > |   regulator-max-microvolt =3D <1387500>;
> > | };
> As I have understood the driver, this isn't supported.
> >
> > to
> >
> > | regulator@34 {
> > |     compatible =3D "infineon,ir38060";
> > |     reg =3D <0x34>;
> > |
> > |     regulators {
> > |         vout {
> > |             regulator-name =3D "p5v_aux";
> > |             regulator-min-microvolt =3D <437500>;
> > |             regulator-max-microvolt =3D <1387500>;
> > |         };
> > |     };
> Above is the typical approach in other pmbus dt bindings.
> Even pmbus driver expects this approach.
> >
> > ?
> >
> > Will the driver handle both of these identically? Is backwards
> > compatibility with the old format maintained? Was the original format
> > wrong and does not work? Why is a list of regulators needed when the
> > device only provides one?
> Driver doesn't support both.
> Based on the pmbus driver original format was wrong.
> pmbus driver looks for a regulator node to start with.
>=20
> Reference:
> https://github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/pmbus.h=
#L515

Then all of the in-tree users are all just broken? They're in aspeed
bmcs, so I would not be surprised at all if that were the case.
Can you send a new version with a fixes tag and an explanation that what
was there was wrong?

Cheers,
Conor.

--B2XOfc6sa6ozXXE8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6T64wAKCRB4tDGHoIJi
0rJaAP4oeMVCozOU9yWl3mW/v2h3GQ24kGtSPQMQen6WVgYb/QEA03ZxSVF7AL0a
DkykGutWh2LaVuiffvXFmBZ5610RbQg=
=wnYb
-----END PGP SIGNATURE-----

--B2XOfc6sa6ozXXE8--
