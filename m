Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5781F1931;
	Wed, 14 May 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239741; cv=none; b=jHFWM/irtlWsSsADMjChLRv6AkKnvzcvS0Z+7KZi1r5FH0PoLDLxchFXy5HJeK1pwTomCVY4lQGRrBHLiLXvRGj/e6/5U9I3fpY91lShUC2L+50lPwLl17g9oFkDLv6YZWBr0bNYIkAGdjD4quWuuf+SJEn5Z16H6FaCQMLcv1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239741; c=relaxed/simple;
	bh=mkPxsxNPjzzx9i9GVPi5vlxhW8vk9V43kD1RHRJzCCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNpGmlGOZzKpud6lHBeC2Z25rIrlYCYxX+6fSrMRQxQ/l89ASxoPoVPkzriYvCezsQFqlu5YvadTcDTClH5WgP+pBcXOMV/PrlsNj28Uxn3o1/BgZ1bgNFPh09OkFLlbz4SpVWM0yLBt3MkfAMNy7jAMQ9DQGQ2jCe+gByqS5bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irMGuZYD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irMGuZYD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073E5C4CEE3;
	Wed, 14 May 2025 16:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239741;
	bh=mkPxsxNPjzzx9i9GVPi5vlxhW8vk9V43kD1RHRJzCCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irMGuZYDd8bvJ1e00U0sTewWC269gAOA7L2o/hmAuJ+vrDvYHWVas34bxJ93/Qexb
	 WTaZMwgP/DXON86Ph1hM8ylwVtdWksG/93craHsfcjfM0mmJjfZKGjEfVJIuYyPlZs
	 Ea3T4IavXBAv7gHBeUKuuRFepZE5pocjw8tXKJFNkWGZ6j97k/mNkHYbiUn1SI5UC2
	 BbmUJ96O06jMYw7plE9yXNpO9xTtI963QRy1qVKKfmJbscYsO9BC3vjX9Uq0uioBlC
	 Bl2s6blzkfGXlLkj+k5+GE1kMoskdPAtAF2wLtR/QFOh92Zq/Rk69najYeIArse+1g
	 qSoSE7zGYCn5Q==
Date: Wed, 14 May 2025 17:22:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X
 bindings
Message-ID: <20250514-showplace-yahoo-e3c306355288@spud>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7UDxVnWJGD0g3CFl"
Content-Disposition: inline
In-Reply-To: <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>


--7UDxVnWJGD0g3CFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:08:59PM +0800, Han Gao wrote:
> Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].

1.x? Is the v1.0 something people can get their hands on, or just the
v1.1?
What differences do the boards have that are minimal enough that
specific compatibles would not be required?

>=20
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042=
-x8-EVB [1]
>=20
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Docume=
ntation/devicetree/bindings/riscv/sophgo.yaml
> index a14cb10ff3f0..6c82f89b56ca 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -34,6 +34,7 @@ properties:
>        - items:
>            - enum:
>                - milkv,pioneer
> +              - sophgo,sg2042-evb-v1
>            - const: sophgo,sg2042
> =20
>  additionalProperties: true
> --=20
> 2.47.2
>=20

--7UDxVnWJGD0g3CFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCTDNwAKCRB4tDGHoIJi
0vXPAP9Ud347xUYL9mWkLJDvlSeTXN7R4fK2+cr+R2ZRLEzdBgEA5r5sTsY1liH7
8/Xr/3/P985Z4HyLF3wA7ywP/WYoiAY=
=scVY
-----END PGP SIGNATURE-----

--7UDxVnWJGD0g3CFl--
