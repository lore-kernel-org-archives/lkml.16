Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E53FD4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750708445; cv=none; b=SBvUGMsQKcWkGSZ6wlmhFeskQSwRIFf2zEoFZG1bsEws6whiIM3LajAtdBxXTh2XLxrbVtLPd/XuzLEUuenV2+3HTIeMoL3sYzcF1/x0YBrjyg6jHTfOdId0yeczuL+Zn5+orX6TZl+vqpDbKi5YTquRHaRBAzmwRbN3KxcbGN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750708445; c=relaxed/simple;
	bh=cH7KnOxBUZBuXKRnPPy6pTRvR1h8NRqONwt2Cqt9QcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9D9i/Ydc+CYA4GWcySntUFpWeZJ2+AAryWJo2YyO0ylw8C/JOVl8PkAHhQDksGVmqNOgJD4hK8BvCdBnwJkPizYschf/qOJC+cP5sSNZMBU5JYMYFcNqVNwPKON0Ql4xTnjseemVjuYW6jiqbEpaM/aHLBZ8Hb/VPFTrQggnwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hnBYidR3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hnBYidR3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cH7K
	nOxBUZBuXKRnPPy6pTRvR1h8NRqONwt2Cqt9QcU=; b=hnBYidR3z8bVpw3W3ITm
	iRoMGrhyxIAoMbVAKhZENg7BWH4XHMh3WLGRX5erN29zvegArWhW9uJVGd1z/+eb
	XnltWc4IDAmhZHymuP+5nFu8qJd1mvw0h8GAWUqlT9sWDedHFyiAKFt0DCGh1RDj
	Wd3jQxsCr4aSA3zJVSxBNFoZg6NXrvl6PHXd/j5C5VC41EfUe4V2tyWHafsp4ZZy
	rUZeC8V5aIT51KrkEnTETO8yHHho0ZYBAOGbUGNM5t8JVycrOBSPuDvx61QtK55e
	pg9KScMY/y/RtZN4s3OCkV/pyETt9V3nBqzq43GclmSSLd1s2NkHU39Wop4Vdz3E
	zg==
Received: (qmail 3961359 invoked from network); 23 Jun 2025 21:53:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2025 21:53:50 +0200
X-UD-Smtp-Session: l3s3148p1@O6QRkkI4iIlb5ybD
Date: Mon, 23 Jun 2025 21:53:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFmwyJ4W30PM_sCM@shikoro>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FBNJcydYAuSpbMsr"
Content-Disposition: inline
In-Reply-To: <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>


--FBNJcydYAuSpbMsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:18:58AM +0200, Jorge Marques wrote:
> The i3c abstraction excepts u8 buffers, but some controllers have a bus
> width of 32-bits and don't support flagging valid bytes, so it is
> required to read/write long words and to use memcpy on the remainder of
> the number of bytes by 32-bits to not write/read outside the buffer
> bounds.
>=20
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Despite Frank's valid comments, I tested this code with the Renesas
driver and it worked so far. Thanks!

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--FBNJcydYAuSpbMsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhZsMQACgkQFA3kzBSg
KbbQfQ//WpaA79hddaYGwP6aWouZRwirdT5xvdHalNjViR7/uStFd350FW21CnQ8
PGotjCka2Wq7tQWJZQfwjktRdv0xdx0Yz2T9menTE40WKOL5hEHZnjc9jXPfjxQy
fBLZsPAV8MmUuxzykRX2YxQlW7n0G1ZYySPSAH0Qa7oC/7ToJqnzVUjcz/RGQasA
ef6J1GUVAXTT5y4Xmrt87PS4bmn9bDW30uC6UKUV0x8UydANSsQRKvZOSPlOGrL3
PW57AhpQqSb6SI0j+hpyx/MaaMHkLFpnBFcHjzl/ZlrmdUWC9XN0lnZNuo6gtLSQ
WF3/5bchlG9AydeeCeiwuvTLXOygvs/+EO7hRFhUUnC80FvTTV2CzQL/PPXJbgAr
n+MMKEYmFT7QCKe42P52G/laIJV15BBzi1qcmNQEcYf8kiH92OSrPOORaBpldsWS
99Fyrh37I1o//NOquOYsHf9WtSS6332y1zYg14ExVLipwSC+cyf5oc7LQRmd/419
7EbGXDjb1vvlTBCnFkc9rXTmo6DkJxPQ0cZaBotuN0eWwzZVcI0F57baQp6tFtYw
vp+NYgvaxOFp8Nn21VoyGK1oh4Z6hPON/A+gHDjkLjAJixcCYPGhXTz/6jiQ2Zkf
/i1BqKtynKSaYvOqA3f/dFuFWVGm1rHXefU90VDKZA3Sww4Ak8E=
=x+Sz
-----END PGP SIGNATURE-----

--FBNJcydYAuSpbMsr--
