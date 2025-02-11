Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968A24FC1F;
	Tue, 11 Feb 2025 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298633; cv=none; b=OiczAETMbh3Hjiow/TCntUAWg4DncSDDMJQlb4U3qF04ZxrKDeUSP+Fa2HE/tsl5UtGCEW/9mJMe507mnvkGe2TaRwXiI63vjMdr9x+8YaO9co6NSCntjoSIUqqdgHhq4sKmURRSWgCZUuXADdiPUsjJwcQMYpbu3se1Xh0tpN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298633; c=relaxed/simple;
	bh=MXkpdxUrKwlNGyhfGqjpT3gM++JqSC+ekFB+wz6S6C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhuEypG5rfa1V9d9+QXKuHngUdMQoS2kq3lE9MoiVNJfQGx53QrU/Er81f8aKJQDVlfk7zDkuGDczcUL6Sz9OAyNjHb+w9C0A5m8i+6UEaBrSwDzt9hNcFmklHFfYg10nh5CvD/DWBAucrWMKd1EuGP+EI6rSUxfNjsc48OQ/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCyHpRRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCyHpRRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F90C4CEDD;
	Tue, 11 Feb 2025 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298632;
	bh=MXkpdxUrKwlNGyhfGqjpT3gM++JqSC+ekFB+wz6S6C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCyHpRREJtOY2Tvjhmv03vG4+reEXqTnt+Z16GX1SfqS0MjxOwCo1EkI7LsyZe667
	 yI9on/ejRJGqty+zjK9W38REK0RkwwpIRuQCIMMu6VGuc7I6Sxdor9CL8VJA9sQSfP
	 hfqIGAk+U6UY8++83IseOi+KOi6orwI9zC5TEWJ4IV/KxoyZtizGTzuofkrl2/UHl+
	 9EzKiewIdemBesCWREr8SU6FJWyoQgcHnhUIsC3VfdrS9uL/ckmRjak7S4HIkz0wIN
	 kToARy9Bzz1GXAlbUO7Ubvq1yuhDW3JxiOMRQ5HoRrVzJomx/qY8WCJS2yFDlKE22U
	 L8GFUoMbB1QzA==
Date: Tue, 11 Feb 2025 18:30:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: phy: mediatek,xsphy: add
 property to set disconnect threshold
Message-ID: <20250211-destiny-crablike-ab17a2814b7a@spud>
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
 <20250113-aerobics-tall-e570d8bbcf2c@spud>
 <e61b61574bd58c1bbc0648257fb4ab23ed582de0.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EJv8ebh2m2tBBLDa"
Content-Disposition: inline
In-Reply-To: <e61b61574bd58c1bbc0648257fb4ab23ed582de0.camel@mediatek.com>


--EJv8ebh2m2tBBLDa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2025 at 03:34:12AM +0000, Chunfeng Yun (=E4=BA=91=E6=98=A5=
=E5=B3=B0) wrote:
> On Mon, 2025-01-13 at 18:30 +0000, Conor Dooley wrote:
> > On Sat, Jan 11, 2025 at 10:15:41PM +0800, Chunfeng Yun wrote:
> > > Add a property to tune usb2 phy's disconnect threshold.
> > > And add a compatible for mt8196.
> > >=20
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > > based on kernel 6.13-rc1
> > >=20
> > > this property is porting from t-phy driver, due to the u2 phy are
> > > similar.
> > > ---
> > >  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8
> > > ++++++++
> > >  1 file changed, 8 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > index a9e3139fd421..2e012d5e1da1 100644
> > > --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> > > @@ -49,6 +49,7 @@ properties:
> > >        - enum:
> > >            - mediatek,mt3611-xsphy
> > >            - mediatek,mt3612-xsphy
> > > +          - mediatek,mt8196-xsphy
> > >        - const: mediatek,xsphy
> > > =20
> > >    reg:
> > > @@ -129,6 +130,13 @@ patternProperties:
> > >          minimum: 1
> > >          maximum: 7
> > > =20
> > > +      mediatek,discth:

Just make it "disconnect-threshold" please.

> > > +        description:
> > > +          The selection of disconnect threshold (U2 phy)
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 1
> > > +        maximum: 15
> >=20
> > What unit is this? Unitless? How are the values determined?
> No unit, it's a level, may be treat it as an index to select different
> threshold.

So this is a register value of some sort? What is the actual threshold
measured in?

--EJv8ebh2m2tBBLDa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uXRAAKCRB4tDGHoIJi
0tleAQCvurEiAzM1BdOVDJ9+251emEMUXx+UXepVHn6w3KdPIgD+I1IyvZElSdMC
2wI8UZTiXnHTsxxuyayinbiJi5M2LwM=
=2LgZ
-----END PGP SIGNATURE-----

--EJv8ebh2m2tBBLDa--
