Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B939881E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649569; cv=none; b=tW05pfgUuxbxhCJIOaHndNKjN0yFx0InnSwyRnMF0id1SIe3MNh8ndfCot15XUJNFaLLoe7KS7aLA/puTEsbq8rPNlJKo9fT+Jn2hKo792txfzVkkPaLXm5F2Rm6yaL5Rukc6zdmUxHmwYoDuN0rs+G6griC3S4mQTBWr4Y/Wa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649569; c=relaxed/simple;
	bh=lRW51PxRDt4POMK3MmQOCewzQF6lAIkyvOIS1e/ukE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSfvLRwjkzhxvZVtIXUa/vnRUMW5YgzgSq45ww6akTfbhfL4lxXWKEuKtaHp5KnxqUdTqfzn+qcwsazJ/nsxjQHLeybDfBzVtWroi9nJy2gFgiW4JP+8rF63+Y7M51idna/00etv2UVKm85mtcNih+1/6mE+MdqJ8SFiicVGe5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3FCb0xH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3FCb0xH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36390C4CEE4;
	Mon, 19 May 2025 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747649568;
	bh=lRW51PxRDt4POMK3MmQOCewzQF6lAIkyvOIS1e/ukE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k3FCb0xH+u35CUhOGXpo6a6M8UcY3qzVEi93m6jwui01+/HPdZTbUtEVOUcf48eBo
	 lnOLFxfUo+e4dc+6D8gpqb9OcRE4RAtkDWhBnc/lELqiOTxCmp9KdmH0sgjwYM98ly
	 E74y0M62u2xxxbkW3+DaruD7xut6sQ6e+bUwQDg2r7TmftRQ8nOGp2HXdYw1rGpKD5
	 19caxE8prCeGGXlwiXWuip46h/4qqFMKQ9EStNbk4rEJTj8kWRe+amNwTYtKK8uTUp
	 ZUD1j6kH4HMoTtV1IZ8ZkUUTn+6XIY6YlLJ0Lp2Nr0rksLrcZ5M9hqaTTpU8HZ6iXj
	 c0oLZhyO0nB7Q==
Date: Mon, 19 May 2025 11:12:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] regmap: Move selecting for REGMAP_MDIO and REGMAP_IRQ
Message-ID: <5340db48-f7cb-4c81-ae2b-2fdd31694416@sirena.org.uk>
References: <20250516141722.13772-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="37aLQjy7+/fVUBfC"
Content-Disposition: inline
In-Reply-To: <20250516141722.13772-1-afd@ti.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--37aLQjy7+/fVUBfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 09:17:22AM -0500, Andrew Davis wrote:
> If either REGMAP_IRQ or REGMAP_MDIO are set then REGMAP is also set.
> This then enables the selecting of IRQ_DOMAIN or MDIO_BUS from REGMAP
> based on the above two symbols respectively. This makes it very easy
> to end up with "circular dependencies".
>=20
> Instead select the IRQ_DOMAIN or MDIO_BUS from the symbols that make
> use of them. This is almost equivalent to before but makes it less
> likely to end up with false circular dependency detections.

None of these selects should actually do anything since the symbols are
themselves selected?

--37aLQjy7+/fVUBfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrBBkACgkQJNaLcl1U
h9Dplwf/T76cvn6B7x9MZB+nlxh9BvMip0sCZzOMlrMKyYl0tFonslOik/4EMCsg
Vhdry4kll8aFgM2I4Sa3wKHNsdcw1xvGtlyI0MUVsefPefgC2AX7FaQzGzh36h71
JY21M/C4SJos6iWSAuueVuv0HcJ2ohAJgspgD3sID4Sgd2cD9UXj9/gNeDRnj7Sn
Wz7LxmHvF+mEf3SUYuyOpw84BigNIFJjdVU1kwBR2ieEfz+oZc7vXdTS74LPudrg
R82KgHDjLFb0ZyKwJwJ2ENHwS3x3Np2hraYtoaNQqUUz8KeVnLYp1NWm0+gNyAOs
AzJQXjSVl8kkpfSPVXB+b4rnphj/Jg==
=I5sr
-----END PGP SIGNATURE-----

--37aLQjy7+/fVUBfC--
