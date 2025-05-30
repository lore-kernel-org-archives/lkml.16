Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AEAFBF0;
	Fri, 30 May 2025 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618616; cv=none; b=ClC6QX46feKlb9xqqafiMCnQbS7oOcmCf0WpcT7bxo52PHjib+7pBBk8OLIxKPo+0dcDTWUDqJukcX3YzwR6xx0DoYhwFmjLaV+kC5CX7CgC+I3d96GXsA9w9XSaVJfdNcMg7KS+icVmli+Ju70LGkzh4sNNfZvWF6yZUmLHjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618616; c=relaxed/simple;
	bh=LWFWoggGe46xQ5RQp18Vq6QjeHfIxauE+ObN41PB7bQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6vD47FfhsGpCOCXLTcYSgzo6kq+hebRkd4NtvM/dEQ/kaLgP+EN6P27rfU67Bjrsl1tX5kEAcGqofdcWyYEm1YhN/aAbTDoaKs4+b19HonRtfIM37l++skpOycnSsbFaJ6YPagp/8HabNITAer7t3dULS0NByD+kd9l0ELCeMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrfVTlxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrfVTlxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905DAC4CEE9;
	Fri, 30 May 2025 15:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748618615;
	bh=LWFWoggGe46xQ5RQp18Vq6QjeHfIxauE+ObN41PB7bQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrfVTlxCx05DUwfOjqI/Y+5oFEqvXplJaFVRb0USAmPukce0NtMccV3wPk95cxeDU
	 bC6SNp+9u2uDpjLj40UgXQ3mlgMKcthZWGBctAe5wBn/owpHTXBs6jQs+QVrB3PjE8
	 oIofx9Icjcm5lJTPLPCfxMctJGh2waqT554jPb/WyXPHZpwGuvKFtIlWS+75kbw1Kf
	 3Um/EaSao1rpeCl/teCkz7VPqIx1b/bzTwPNjpWbnKWnAZPObr8aQCyHZWHgXIbNl0
	 oBxoiaUMqvBevfH6vUUmFLasn5VTzso3O/hrfPWpBO/X5qix1fy24IS/GFFMArfVuo
	 It81f7ltRlxVQ==
Date: Fri, 30 May 2025 16:23:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: soc: add vf610 reset controller
Message-ID: <20250530-construct-library-64ec665a6fea@spud>
References: <20250522213951.506019-1-Frank.Li@nxp.com>
 <20250526-unpaid-mushy-d47196d04ad1@spud>
 <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ldWk4wJW7G7nxwGc"
Content-Disposition: inline
In-Reply-To: <aDcvP975apg/dhQz@lizhi-Precision-Tower-5810>


--ldWk4wJW7G7nxwGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:43:59AM -0400, Frank Li wrote:
> On Mon, May 26, 2025 at 04:54:30PM +0100, Conor Dooley wrote:
> > On Thu, May 22, 2025 at 05:39:50PM -0400, Frank Li wrote:
> > > Add vf610 reset controller, which used to reboot system to fix below
> > > CHECK_DTB warnings:
> > >
> > > arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e00=
0:
> > >     failed to match any schema with compatible: ['fsl,vf610-src', 'sy=
scon']
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 46 +++++++++++++++++=
++
> > >  1 file changed, 46 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf6=
10-src.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.=
yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > new file mode 100644
> > > index 0000000000000..4c92a5e4892bf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> > > @@ -0,0 +1,46 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas//soc/fsl/fsl,vf610-src.yaml#
> >
> > It's a reset controller then, shouldn't it be in /reset, not //soc?
>=20
> It is not reset controller since there are not #reset-cells property to
> reset other models. It just provides syscon to reboot the whole system.

| Add vf610 reset controller
| The System Reset Controller (SRC) generates the resets for the device.

Giving me mixed signal here chief. If you call something a reset
controller multiple times without any additional clarification that it
does not provide resets to peripherals, how is anyone reading the patch
not supposed to come to the same conclusion as me?

--ldWk4wJW7G7nxwGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnNcwAKCRB4tDGHoIJi
0k0fAP9xEMP3RDsq99tpKwUODFMvlZc/u4nYb9rlcX/IGT0BUgEA1fwhbAWRvv7y
JcFusmsVetdwlGO4zY35QGEzwv9h8Qc=
=ttAW
-----END PGP SIGNATURE-----

--ldWk4wJW7G7nxwGc--
