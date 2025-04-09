Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B49267722;
	Wed,  9 Apr 2025 16:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215538; cv=none; b=SXqAcPC8T7/RgQw0vPFNVTB2pUTWkf9MhV7FHrQ1FHVM65ifoBV1FT9kYhCKMAc8x4DHI2FkK+X2TNxAbX2yHQZJE+MAOGRc+nhXwTqucvXgcHppleiVpxLzOW8UcYXDAg+SZMWHzzbIoJrSUZ8dckMztHRkK9SKRYRe0Xh9qZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215538; c=relaxed/simple;
	bh=wWoauvV634omXVvTO1Ej24sCxgOZyiirFlXx4Z2Ipk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDLlGfWXDTAJwxfvr8kdtgAsCzEjO+41BXShTxX09kh6EF0e+0WDtlthXxDeYhJCtajR7C+RTqxvrjDfFBOHiyJyJf4EJoCohcRgDdYoh8bGOTPOWga50FJcd4gPawMZF4/eADrqo7XSCKmWqIUf7gHM8EsDTXnBlz+GHbwf3xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFeVn/Wk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFeVn/Wk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6C7C4CEE7;
	Wed,  9 Apr 2025 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744215536;
	bh=wWoauvV634omXVvTO1Ej24sCxgOZyiirFlXx4Z2Ipk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFeVn/Wkb1sbnJfDSzEGTuZnMRG1DiweCjLGfSLKjgWLuVPEZmqN2F0h2n3ZR/okW
	 CbXNw/Wragqiyls2y2/k1araxJNZJoh5vpU/lHQYkPz8SHwT1WPinbk1ujAEf+uscN
	 nGtNUseYHkvLvuBrLMvEIEKjYUJMwoPrPAgwbyjS7VIDhiYvzxaenx/H3HczTabFm1
	 jn6hDQIDfjSGKRQVLb95UDIAQ4Y2M2hqDk+ac6gDpEV4zSZKE+nxAYZ3PQAeVl9wKN
	 LfMOtTfhKMOvvnBI8eOw+F4AKkaflgYrD7fFl0/mYMzFBoG3Bse9GIAFMQMVRtytSD
	 KLUc20VvdkE4g==
Date: Wed, 9 Apr 2025 17:18:51 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Klaus Goger <klaus.goger@theobroma-systems.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
Message-ID: <20250409-commend-brewing-7c541aec26a9@spud>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
 <20250326-fanatic-onion-5f6bf8ec97e3@spud>
 <CABd623tEGh=qtpF0h7PkRBBrR7V9EaxUv9HregqbPcLU_2Exbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X2pwzW2tJYBQHmm7"
Content-Disposition: inline
In-Reply-To: <CABd623tEGh=qtpF0h7PkRBBrR7V9EaxUv9HregqbPcLU_2Exbg@mail.gmail.com>


--X2pwzW2tJYBQHmm7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 06:36:04PM +0200, =C5=81ukasz Czechowski wrote:
> Hello,
>=20
> =C5=9Br., 26 mar 2025 o 18:58 Conor Dooley <conor@kernel.org> napisa=C5=
=82(a):
> >
> > On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
> > > The Cypress HX3 hubs use different default PID value depending
> > > on the variant. Update compatibles list.
> > >
> > > Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress HX3 U=
SB 3.0 family")
> > > Cc: stable@vger.kernel.org # 6.6
> > > Cc: stable@vger.kernel.org # Backport of the patch in this series fix=
ing product ID in onboard_dev_id_table and onboard_dev_match in drivers/usb=
/misc/onboard_usb_dev.{c,h} driver
> > > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> > > ---
> > >  Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b=
/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > index 1033b7a4b8f9..f0b93002bd02 100644
> > > --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > @@ -15,8 +15,14 @@ allOf:
> > >  properties:
> > >    compatible:
> > >      enum:
> > > +      - usb4b4,6500
> > > +      - usb4b4,6502
> > > +      - usb4b4,6503
> > >        - usb4b4,6504
> > >        - usb4b4,6506
> > > +      - usb4b4,6507
> > > +      - usb4b4,6508
> > > +      - usb4b4,650a
> >
> > All these devices seem to have the same match data, why is a fallback
> > not suitable?
> >
>=20
> Thank you for the suggestion. Indeed the fallback compatible appears
> to work fine in this case,
> and I am able to avoid additional entries in onboard_dev_match table
> as added in the first patch in this series.
>=20
> However, after I've updated the cypress,hx3.yaml schema file and
> rk3399-puma.dtsi file,
> I get the following warnings, when running "make dtbs_check":
>=20
> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1:
> compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
> =E2=80=83=E2=80=83from schema $id: http://devicetree.org/schemas/usb/cypr=
ess,hx3.yaml#
> linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2:
> compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
> =E2=80=83=E2=80=83from schema $id: http://devicetree.org/schemas/usb/cypr=
ess,hx3.yaml#
>=20
> Below is the diff of my changes:
>=20
> diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> index f0b93002bd02..d6eac1213228 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> @@ -14,15 +14,22 @@ allOf:
>=20
>  properties:
>    compatible:
> -    enum:
> -      - usb4b4,6500
> -      - usb4b4,6502
> -      - usb4b4,6503
> -      - usb4b4,6504
> -      - usb4b4,6506
> -      - usb4b4,6507
> -      - usb4b4,6508
> -      - usb4b4,650a
> +    oneOf:
> +      - enum:
> +          - usb4b4,6504
> +          - usb4b4,6506
> +      - items:
> +          - enum:
> +              - usb4b4,6500
> +              - usb4b4,6508
> +          - const: usb4b4,6504
> +      - items:
> +          - enum:
> +              - usb4b4,6502
> +              - usb4b4,6503
> +              - usb4b4,6507
> +              - usb4b4,650a
> +          - const: usb4b4,6506
>=20
>    reg: true
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> index d0d867374b3f..7fac61f95fc6 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> @@ -594,14 +594,14 @@ &usbdrd_dwc3_1 {
>         #size-cells =3D <0>;
>=20
>         hub_2_0: hub@1 {
> -               compatible =3D "usb4b4,6502";
> +               compatible =3D "usb4b4,6502", "usb4b4,6506";
>                 reg =3D <1>;
>                 peer-hub =3D <&hub_3_0>;
>                 reset-gpios =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
>         };
>=20
>         hub_3_0: hub@2 {
> -               compatible =3D "usb4b4,6500";
> +               compatible =3D "usb4b4,6500", "usb4b4,6504";
>                 reg =3D <2>;
>                 peer-hub =3D <&hub_2_0>;
>                 reset-gpios =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
>=20
>=20
> Do you have any suggestions on how I can properly update the schema
> files to avoid the above warnings?

The diffs you have here look okay, not really sure what you're asking
for.

--X2pwzW2tJYBQHmm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/ad6wAKCRB4tDGHoIJi
0jrNAP4tzAb9G6tOUw4KN0R7QQ40SNApkGvNQB/Fxx52uf8a9wD+MLdRTeLTe7tm
0ktgPhNJ+lKYFUSGXf/Y8ONOODNY4w4=
=0FDn
-----END PGP SIGNATURE-----

--X2pwzW2tJYBQHmm7--
