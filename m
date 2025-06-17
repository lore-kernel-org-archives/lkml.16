Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9602DFF22;
	Tue, 17 Jun 2025 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175283; cv=none; b=eAOt0bXH368OG4j+CDKfciyGV90sOJtRhH2a7dkF/1K5PJ98MIwk5DvKTYJpgl04GDNQ7lv25Cc/ZafAfOnTSJKhO67GUOTBH8UfmjWcnvg2gxm8Q61bBSAr1OGOfLt8/cnua7/yvA19pAFlYn2EORu7IW6nKJuPqlf/CDB7XhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175283; c=relaxed/simple;
	bh=7xDjTVRfFoRIYUS7gbPNIlQEN7XfsTQ0jalm9e5Wmbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0456Gr6j/Tk6jfNH9gncEaXo/fDUjry6KJpSnymPDRugXsk015aN13aTp44oq+DIzZcaiyCYKyTAr/A8H5KDKSf/ipjHg+mRPY/+jOb21UNxKMlhpV9ivKcTSWxjnA34uHhXk6HY6b7Tm7o6VVQ7w6cS3Saw12MrhLgRVPjsEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Un+wSOUy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Un+wSOUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AB1AC4CEE7;
	Tue, 17 Jun 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750175282;
	bh=7xDjTVRfFoRIYUS7gbPNIlQEN7XfsTQ0jalm9e5Wmbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Un+wSOUyk6kW9Yd+vPOAHx3aTj9Mfghr1mrU6K5pZnkrTq6UTBUi7Br8kAWyfYLfZ
	 5XkCAKNcShHGX34psNKZ2f2tFxcqyDa4DCaEzw7CvVasb3RHWYiCdBxzDw2pN2qz0V
	 UofTVZ1Jyg2G7AELKHFuEYEpm624Hc329n/qgha0/03WJEOtNbmTlG6Hq9QzGY+GG6
	 uf/ODFRXLEiL7RWwn+/nq8pbmbCs1gob3UXusktMsg5XsBHWsilBKRG8IcTepcXPH+
	 g9jfsM+V1UzsPidj3ZZfF+wAN5VFqMynyk55IwgdL6T/T0AFuZMYnFIZ4p115zElVV
	 Ojl0Pbgt+GiCQ==
Date: Tue, 17 Jun 2025 16:47:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Jorge Marques <gastmaier@gmail.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <20250617-pawing-octane-a983fbf7100d@spud>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-1-e68b9aad2630@analog.com>
 <20250606-sliver-freeing-d01268258c25@spud>
 <ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ccYjkAPbvZp+RJlR"
Content-Disposition: inline
In-Reply-To: <ildi2pup2zkyv4stuknkrjysex3yzsbrrsrwbgcc4xgvdhwrdd@7qh4y6mutgy2>


--ccYjkAPbvZp+RJlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 04:50:43PM +0200, Jorge Marques wrote:
> On Fri, Jun 06, 2025 at 05:08:45PM +0100, Conor Dooley wrote:
> > On Fri, Jun 06, 2025 at 03:21:02PM +0200, Jorge Marques wrote:
> > > Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable=
 IP
> > > core that implements the MIPI I3C Basic controller specification.
> > >=20
> > > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > > ---
> > >  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++=
++++++++++
> > >  MAINTAINERS                                        |  5 ++
> > >  2 files changed, 68 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e7fae394ad8fd4143eb1f=
ffb9591a30a2d6cc6ac
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> > > @@ -0,0 +1,63 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Analog Devices I3C Controller
> > > +
> > > +description: |
> > > +  The ADI I3C controller implements a subset of the I3C-basic specif=
ication to
> > > +  interface I3C and I2C peripherals [1].
> > > +
> > > +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> > > +
> > > +maintainers:
> > > +  - Jorge Marques <jorge.marques@analog.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: adi,i3c-master
> >=20
> Hi Conor,
> > Seeing this with no versioning info is pretty suspect.
> > The adi spi, pwm, axi-dmac etc all have versioning info, please try to
> > emulate that.
> >=20
> > Otherwise, I think this is okay.
> >=20
> > Cheers,
> > Conor.
> >=20
> The driver checks the IP version via register access, for the other adi
> ips, the -x.00.a suffix was never updated. For example, the axi-dmac
> current IP version is v4.5.64 while the compatible still is 1.00.a and
> there is a mention of v4.3.a in the binding. It is unclear whether
> suffixing it with "-1.00.a" would be useful, or if the time comes call
> the new "adi,i3c-master-2".
>=20
> Do you still think it is necessary?

I do, yes. In the other cases, if a new version comes out that has some
sort of meaningful difference a new compatible can be added. Until then,
using the -1.00.a one is okay.

--ccYjkAPbvZp+RJlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFGOLgAKCRB4tDGHoIJi
0iMzAQDPAR4PK0PcUd5lSc02GuSVxCnkgzmctV+hB+9EvRrrWwD/TozQwUHyg8XP
QHwTVjYIS0ELbPAh9ts0B1MhPgjw1Qw=
=CxyJ
-----END PGP SIGNATURE-----

--ccYjkAPbvZp+RJlR--
