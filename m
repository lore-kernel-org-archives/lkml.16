Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28422045A8;
	Tue,  4 Feb 2025 19:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698411; cv=none; b=KIQcTUWZChOZzsN5l6KVYSZzlkhRVSTHzKXnzDz7EODrhj8FisypJuLL3TrbUEbuQnEjws66dDC8ivUbjzUtU+flMvUHP2oLFMmhe1rK6bUlxV3Xc52iGbqqz3B8MAI+PwEnq19UCga5FnLLSG6ZhxyRqsSW8v5u9Pvi4E2YogA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698411; c=relaxed/simple;
	bh=sXid/J3qZBjcfg0RqWr6jcSgu94Ix6LoKEM0fp/erdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+5Pp9QRsV6RHK9UaYqXOTDnNKRINm9/qR/wwUIs8Yy9MYNsJoM0o9Ya3Eey0g++oGLg55N2+fP296xO9nOj7M8/GPo1Axq8KM8tCCiuZMiWYdBPHY0dLr5Mo+AhP7flK+lzSIUEXk9Cr4pRQrVwP7R9FLaaUcX6IvGUrjS6GVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tsyMArj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tsyMArj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E93C4CEDF;
	Tue,  4 Feb 2025 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738698410;
	bh=sXid/J3qZBjcfg0RqWr6jcSgu94Ix6LoKEM0fp/erdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsyMArj6/mMtWVOZ+WTeXl/rPdQ5XfqnLAOcXNWyq/x9qInfLVkp5d/KXb6m9Mtga
	 orTf8cnsncBRRgvqWgMnR0KNbaHhwtekirlq8yzlgHMI/ZP24zeZr2y4jNtOORn+GO
	 MyHRxjwF5mONk7whytUs5wWMTEcKI/iigg51Ba5qymaQfZgrlLGfkuOJB4WjXXBOGu
	 Q0v+D06LKTebZO0WojTuUD4H/XgLcms8/7id0kHFy4cnvdFZd/yyTz4avadyCmg0jR
	 1QTnWzLsdHN8dHbPNkmkR7e3d8oLwEwWopPpyqePdZyPYZlgtNN9Mpe5D1FKq9LJ4k
	 IW9alerFZ4yIw==
Date: Tue, 4 Feb 2025 19:46:46 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] marvell: DT root compatible fixes
Message-ID: <20250204-headfirst-evergreen-ec92900ee782@spud>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x5UnwaTJWdRGDlJX"
Content-Disposition: inline
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>


--x5UnwaTJWdRGDlJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 03:08:24PM -0600, Rob Herring (Arm) wrote:
> This series adds some missing root node compatibles and fixes some=20
> errors in dts files for the root node compatibles.
>=20
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x5UnwaTJWdRGDlJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JupgAKCRB4tDGHoIJi
0s1SAP983MbztBx9JW7mBOtkH1RQR6fb//Ogubt4WA6KjWQuJgD+PsBZmZQOqJHm
IKTDZ/R+p+gKllClHDwNHhRp81SUBgA=
=tCWb
-----END PGP SIGNATURE-----

--x5UnwaTJWdRGDlJX--
