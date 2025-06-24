Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B12F273A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750797073; cv=none; b=Hgbcl3XsPppJ01bVCwlw9eR82kLCWmYCrt5kh5DFz6dxlhZ3FfcVAzo1CPsxsZf5UpFVHrWYbQ/LCAYeQCotX8UW40/jqu3vRyvsM0oOF2ngdXjMAdOz9DcmUoJ2JGezDM7O6d+dpXLwrmIcEcOSvM57qktN6shYdfyQ/4fn5ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750797073; c=relaxed/simple;
	bh=hIo/u1oEnMQHcpwU7BvRmYs0Iew0R4x8uR+33XIjnZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEWxhLP4ASeKNUDXb0lWIGKmoRN1thpIV7zKF7VKtdnRR3JIBGiVvYpJbW3WdkU9CanSOD/NHdhrtfp1pBpAMPIpWz+w0CjHjONZKnXxGXWX1HDBdsqRqy/PdTnuTty5aw0NJG0rUR6gMfoE2lWMeJMdg9FKqsV/qtriaDfN7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IHB1uNfM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IHB1uNfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fjZN
	GDyllQnn8tFdItYnh39YaQXB37rws0UPQyn/t58=; b=IHB1uNfMhk1Wkc0/yjhQ
	LKWipz5+aS4kBEvaw3C0/H63tYRUYzQk2+u+OjLtxMZfePOK88MBNF8We5sYgTOY
	oyP+crlw2wOwXYgK4M0Mivz4eOgPcj4UlEMyKA8WfWzW2TprbPOT4b64rz9lwyIh
	cu81oXzkBpoo3+ewb0luxdihkBpyFqpw6Euaeg9qTSkHJG592XglG+wB0XHROnTb
	wQmDSiCithRRuG0gQEjXnA38hdx3zq76yB9OamG7BrNnDgszMXj+MTnEnEPT559g
	2UXXHtY8BcqwPVf169q9ljA4DuO1xFWOZNYqsKpPCPmMytkC7sVRuieV+uki7UTE
	UA==
Received: (qmail 391406 invoked from network); 24 Jun 2025 22:30:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jun 2025 22:30:58 +0200
X-UD-Smtp-Session: l3s3148p1@8Ee7NFc4IK5b5ybD
Date: Tue, 24 Jun 2025 22:30:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFsK8sDj7WvIBZvW@shikoro>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
 <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
 <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+KvzQyFvaXi022NC"
Content-Disposition: inline
In-Reply-To: <aFrpra9j69OkkMbL@lizhi-Precision-Tower-5810>


--+KvzQyFvaXi022NC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 02:08:45PM -0400, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:06:04AM +0200, Jorge Marques wrote:
> > The I3C abstraction expects u8 buffers, but some controllers operate wi=
th
> > a 32-bit bus width FIFO and cannot flag valid bytes individually. To av=
oid
> > reading or writing outside the buffer bounds, use 32-bit accesses where
> > possible and apply memcpy for any remaining bytes
> >
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>=20
> > ---
> >  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++

Is there a reason we don't put this in 'include/linux/i3c/master.h'?
'internals.h' is used for the core only so far, and '#include
<../something.h>' also looks a bit like a layering violation.


--+KvzQyFvaXi022NC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhbCu4ACgkQFA3kzBSg
KbanHA/+KRBtGPAzjnCNvCQGL/q6OOpYG/fRRmtCzXRfY8dS5S+n2YubH0wQWJCs
poMvmKUQIdjfpb0TwS9dE/K3y/wfgWgxa8R64ljVif6mS5S40aC2BJIAa63PaPF/
dhzkGjpvhyeEhDF72eZlLWOUE6e4kGev+qvounSdNuuUQR0HQLjqxhVN1TYtT0vn
3gHgOgrl2PQz56N4IPrw+uql1Z91UBWVr6KSoofEs+m67n/nNg2bOzIzHTh0PQTv
+SNgzV1hN7Gm0rp8KvRreraKHEC4ljxJWsZpxzBSXV7PH9dTyBerwzylVVI+sLWH
Pr9/DxVMmNKJlC68hpedk8L5zTWtokSKx42GmSx1zwBCYHi+CWwhPf+BYzaw0D3i
Xv5wSDuluUaEMWsLWCaYZ5uc1T9XcyIEIPJ4BUAosbTWUpu6+0xIQuEhZsEZ0nqr
FxrzaS538u+sXUR3Lev/oJ8J08FpVeFO0pd0m4YiVuxFngVK0n3w5WyXBhppI5aE
lpcuXpEZZi1+yJhfMmo+LmmL4BeqA2SBMdQ5pGjAoukfxldSfhud/bjjin3uXm83
vnSZN3mFfKu/PufFxfrEgdpv5HRN8EDCn6mwF4sRf6G5ZSA0eSJDy7sX/1412pSB
9GG7ZUT/vX+D0r6PHxBXvOLTSy7Fnp7+Ucvz6dXraR6MjN6VPiM=
=ocWZ
-----END PGP SIGNATURE-----

--+KvzQyFvaXi022NC--
