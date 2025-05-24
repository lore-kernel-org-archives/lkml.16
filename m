Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1B1DE4E1;
	Sat, 24 May 2025 22:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748126295; cv=none; b=UAfaNfliYfgdREx7UWqzqQ/OiLX6a82f8GcxKD8q1/SSPw6hxk/tgh17lk2n0xpalWYRZ7pUViVY4n3Z7+v2h8N1UaZKaBBU7PacngyhrxYK+dpiOKEKOiypc+bdg86gzhwdXRJ44g2A8qvlV5A6pBHfePFDhUDiVCcjSqS2m+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748126295; c=relaxed/simple;
	bh=wiNISRlJOG80aJKsvyuGaUGYqxWYkyyJW/Xju/cgeag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7/sji/vL4NMs23EG8pt5JUzMJu9pXDnLXILULlgbQNX7DOLy2U7pj4os7sQQbu9jiIkJVyjLoakCM8asYFpbGBx0/Rn6pVDk+qYFX3J37zQCHq0oloAFMUSrDuoz5GkMJnHvpTO/Q7AU89IDWOAl0Q6xGfYc5e/Vg3oYlFpzdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZVPzLBsy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZVPzLBsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DF8C4CEE4;
	Sat, 24 May 2025 22:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748126294;
	bh=wiNISRlJOG80aJKsvyuGaUGYqxWYkyyJW/Xju/cgeag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZVPzLBsy69UQCWLd0hTmxlwFEe0NmZ4SK1Gejeh5J0n+j60rlYUMBZzArcW3OTTr+
	 B4x8Jb57nhdGcoyTit6esO/+1YOMG1Sdua8YijOGzU+G04aLqnC0QMN+l0tqL/MYHX
	 w4qhSHiOQGfvE/tiSWP+G9Dy7MUH7RFHk2jsnZwl6BFAcW+Bn8WO7kFaS6Ts9Y3q72
	 J/+z8nlakKwc+eZrNGGNTcBbbkGejrCnG+BheMpzSi2/EEDRMt5iqVzVf3wEIGNCWk
	 ztCNRgnj9w7ggwmBBPhHamB1D530uLVR0ph/stNOmkr4T2qMIrJr/sRtA6TpY1jBl/
	 tPwcmEeoqk/Xw==
Date: Sat, 24 May 2025 23:38:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-ID: <aDJKUl2l3l08LPDe@finisterre.sirena.org.uk>
References: <20250523131214.955970-1-martijn.de.gouw@prodrive-technologies.com>
 <174801730004.578098.7742808995079543725.b4-ty@kernel.org>
 <8ff817a3-c734-45de-afbd-5da9aecd4cbb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KNzx3qMrtTYzHp9B"
Content-Disposition: inline
In-Reply-To: <8ff817a3-c734-45de-afbd-5da9aecd4cbb@kernel.org>
X-Cookie: Well begun is half done.


--KNzx3qMrtTYzHp9B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 08:34:41AM +0200, Krzysztof Kozlowski wrote:
> On 23/05/2025 18:21, Mark Brown wrote:

> > [1/2] dt-bindings: regulator: add pca9450: Add regulator-allowed-modes
> >       commit: 0a4056a444c8d55beea470948c73befd6673aa6c
> > [2/2] regulator: pca9450: Add support for mode operations
> >       commit: 2616e5f4fe04eb25eb5cbabc0a3a2a374e14008e

> Rob reported binding has failure (which also means binding was not
> tested). Can you drop the patch?

That seemed to just be due to v1 splitting the header with the constants
=66rom the binding change (the issue was that the header wasn't there)
which should be fixed by this version?

--KNzx3qMrtTYzHp9B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgySlEACgkQJNaLcl1U
h9AoSwf+OdEUNEBe2LeHJXhe/tcKQGAl02dLbNs/usuj+m2nPvXCDq3H3wQYKItJ
5tWeTidprgvK8HXg55orvP/IzyTXeCSaBEzO63McWEJAhfTm812V28aw0+SAZmNj
DKEUkh9nSiYvJjzvbQhFmN9wjPCStzGtquWcmlRQk2aRaa0BRk7TKctdT7qrZaG7
LceHuFVS6awaxxrxzMQ7Gi4awszQZo4QnRo3uR6Hs2snRamvhP9lAFQkzMLggaMb
r89TKw/GVPr5wTtIQM+TslOhEQuGA6SM+qrkrGnQiSbkZUHaTs0zGKDk9uJn9fUU
0SefeZoT0mRbYwybQzNLk59lycWaOg==
=ikut
-----END PGP SIGNATURE-----

--KNzx3qMrtTYzHp9B--
