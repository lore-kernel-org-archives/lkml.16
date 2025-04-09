Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B7F2144DB;
	Wed,  9 Apr 2025 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234081; cv=none; b=j74gQ7lcmzvrL9aA264B7lYeSlGocecGarb0LEifuTDOXgjyfee7lOYHwtYR8mzSgy3EUrq6P8oEJxth7s1yHzKnHGnPCmQJLbODh0RPjrLU8pw9OWWqQiJwTSIHd/SzWwpSyLHeUnfIoMT5rzC/kQKGagqNqxFgU9/PcWXh5aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234081; c=relaxed/simple;
	bh=HUTQnj8ze1LT1u9H7w0DR7fWczDhTekCkEVOqJ0i1/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6vlghwKknZVLAhb9qJ7S5mvNi+vxwt+6xGuZi5Ebo3DmCtYrkNM33T1YOgvOdbQX/cSCq2P6prN45JQF0Gqi+ZiJZF9Z7IyrFNXI9u+nPpOWBJCxTicRl3Xu9uyW++P8ldyFh01Sdi3fM5F+umP+qnoGhFL8WIRDBl10kjibmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADwuJth9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADwuJth9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22201C4CEE2;
	Wed,  9 Apr 2025 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744234080;
	bh=HUTQnj8ze1LT1u9H7w0DR7fWczDhTekCkEVOqJ0i1/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADwuJth9M0hdHJZG+35SnORU9RYiqTVDynMPbdNtlLsNOag3ucrglPu79fZryBqwp
	 9cyunJIQNhhWCP5jFCABOwEktUVGkU8SRcv/YFzCRzCffPnVEcUxztr88pwv4mgkcO
	 TLoP73hMAMQLHxXe/8UfX11zcUSr+0i9/kiCT2QvirANdYIZAj/iEbNXyVMjh/dn7m
	 neDBA6kFMRRFI1IUFHZj7n4N174CNHbP+WBCjPefDyt4zMZoEjoYEbrGjMsDa0jPRG
	 wG7+n/gRll5Mf8iSy7FZFmD5cIP2ll1lO9bN/38fZpsy4K0uRgSUE2hNTnTPcnRLnj
	 n4Kmcm5pP/LzQ==
Date: Wed, 9 Apr 2025 22:27:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: =?utf-8?Q?=C5=81ukasz?= Czechowski <lukasz.czechowski@thaumatec.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Klaus Goger <klaus.goger@theobroma-systems.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: usb: cypress,hx3: Add support for all
 variants
Message-ID: <20250409-glorified-crouch-837870b4d443@spud>
References: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
 <20250326-onboard_usb_dev-v1-2-a4b0a5d1b32c@thaumatec.com>
 <20250326-fanatic-onion-5f6bf8ec97e3@spud>
 <CABd623tEGh=qtpF0h7PkRBBrR7V9EaxUv9HregqbPcLU_2Exbg@mail.gmail.com>
 <20250409-commend-brewing-7c541aec26a9@spud>
 <cc49276b-f64f-42a8-b4b4-61bde17b61e3@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="siX/JzAbfY5Bb/0r"
Content-Disposition: inline
In-Reply-To: <cc49276b-f64f-42a8-b4b4-61bde17b61e3@cherry.de>


--siX/JzAbfY5Bb/0r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 09, 2025 at 06:26:43PM +0200, Quentin Schulz wrote:
> Hi Conor,
>=20
> On 4/9/25 6:18 PM, Conor Dooley wrote:
> > On Tue, Apr 08, 2025 at 06:36:04PM +0200, =C5=81ukasz Czechowski wrote:
> > > Hello,
> > >=20
> > > =C5=9Br., 26 mar 2025 o 18:58 Conor Dooley <conor@kernel.org> napisa=
=C5=82(a):
> > > >=20
> > > > On Wed, Mar 26, 2025 at 05:22:57PM +0100, Lukasz Czechowski wrote:
> > > > > The Cypress HX3 hubs use different default PID value depending
> > > > > on the variant. Update compatibles list.
> > > > >=20
> > > > > Fixes: 1eca51f58a10 ("dt-bindings: usb: Add binding for Cypress H=
X3 USB 3.0 family")
> > > > > Cc: stable@vger.kernel.org # 6.6
> > > > > Cc: stable@vger.kernel.org # Backport of the patch in this series=
 fixing product ID in onboard_dev_id_table and onboard_dev_match in drivers=
/usb/misc/onboard_usb_dev.{c,h} driver
> > > > > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> > > > > ---
> > > > >   Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 6 ++++=
++
> > > > >   1 file changed, 6 insertions(+)
> > > > >=20
> > > > > diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.ya=
ml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > > > index 1033b7a4b8f9..f0b93002bd02 100644
> > > > > --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > > > +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > > > @@ -15,8 +15,14 @@ allOf:
> > > > >   properties:
> > > > >     compatible:
> > > > >       enum:
> > > > > +      - usb4b4,6500
> > > > > +      - usb4b4,6502
> > > > > +      - usb4b4,6503
> > > > >         - usb4b4,6504
> > > > >         - usb4b4,6506
> > > > > +      - usb4b4,6507
> > > > > +      - usb4b4,6508
> > > > > +      - usb4b4,650a
> > > >=20
> > > > All these devices seem to have the same match data, why is a fallba=
ck
> > > > not suitable?
> > > >=20
> > >=20
> > > Thank you for the suggestion. Indeed the fallback compatible appears
> > > to work fine in this case,
> > > and I am able to avoid additional entries in onboard_dev_match table
> > > as added in the first patch in this series.
> > >=20
> > > However, after I've updated the cypress,hx3.yaml schema file and
> > > rk3399-puma.dtsi file,
> > > I get the following warnings, when running "make dtbs_check":
> > >=20
> > > linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@1:
> > > compatible: ['usb4b4,6502', 'usb4b4,6506'] is too long
> > > =E2=80=83=E2=80=83from schema $id: http://devicetree.org/schemas/usb/=
cypress,hx3.yaml#
> > > linux/arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: hub@2:
> > > compatible: ['usb4b4,6500', 'usb4b4,6504'] is too long
> > > =E2=80=83=E2=80=83from schema $id: http://devicetree.org/schemas/usb/=
cypress,hx3.yaml#
> > >=20
> > > Below is the diff of my changes:
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > index f0b93002bd02..d6eac1213228 100644
> > > --- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
> > > @@ -14,15 +14,22 @@ allOf:
> > >=20
> > >   properties:
> > >     compatible:
> > > -    enum:
> > > -      - usb4b4,6500
> > > -      - usb4b4,6502
> > > -      - usb4b4,6503
> > > -      - usb4b4,6504
> > > -      - usb4b4,6506
> > > -      - usb4b4,6507
> > > -      - usb4b4,6508
> > > -      - usb4b4,650a
> > > +    oneOf:
> > > +      - enum:
> > > +          - usb4b4,6504
> > > +          - usb4b4,6506
> > > +      - items:
> > > +          - enum:
> > > +              - usb4b4,6500
> > > +              - usb4b4,6508
> > > +          - const: usb4b4,6504
> > > +      - items:
> > > +          - enum:
> > > +              - usb4b4,6502
> > > +              - usb4b4,6503
> > > +              - usb4b4,6507
> > > +              - usb4b4,650a
> > > +          - const: usb4b4,6506
> > >=20
> > >     reg: true
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > > b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > > index d0d867374b3f..7fac61f95fc6 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > > @@ -594,14 +594,14 @@ &usbdrd_dwc3_1 {
> > >          #size-cells =3D <0>;
> > >=20
> > >          hub_2_0: hub@1 {
> > > -               compatible =3D "usb4b4,6502";
> > > +               compatible =3D "usb4b4,6502", "usb4b4,6506";
> > >                  reg =3D <1>;
> > >                  peer-hub =3D <&hub_3_0>;
> > >                  reset-gpios =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
> > >          };
> > >=20
> > >          hub_3_0: hub@2 {
> > > -               compatible =3D "usb4b4,6500";
> > > +               compatible =3D "usb4b4,6500", "usb4b4,6504";
> > >                  reg =3D <2>;
> > >                  peer-hub =3D <&hub_2_0>;
> > >                  reset-gpios =3D <&gpio4 RK_PA3 GPIO_ACTIVE_HIGH>;
> > >=20
> > >=20
> > > Do you have any suggestions on how I can properly update the schema
> > > files to avoid the above warnings?
> >=20
> > The diffs you have here look okay, not really sure what you're asking
> > for.
>=20
> It fails dtbs_check:
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
> I'm not sure we're allowed to add new errors with dtbs_check (and would l=
ike
> to avoid it in any case).

Ah, the restriction I think comes from the usb-device binding. Maybe
just leave it as you had it?

--siX/JzAbfY5Bb/0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/bmWwAKCRB4tDGHoIJi
0t8XAQDCNdCD4zh7JrShscGp2cZzh9+XhRC1yUwBkP1mgikpJAD/UgJNyrT10N/J
5bTLDt8O/UvBlsOZQcNilW6mXhfNhgU=
=II5O
-----END PGP SIGNATURE-----

--siX/JzAbfY5Bb/0r--
