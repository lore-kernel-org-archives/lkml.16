Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775AA3D76;
	Thu, 22 May 2025 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747927844; cv=none; b=b+dXfOJZyzjPPFG3pYFw0iQ+m898txEfFnxMJnMPBk/vouAJsP1ozuW+MnKhUQIjPa8vTd40WOO2K3t4GGs7ITyW4u19T1pxZf53lVNfWQ8f8eQ7X3RL9TzCf7byvJNWGRuMWx93nnCBo/llH0UzIjM5KjNCe2xfsL88JIODvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747927844; c=relaxed/simple;
	bh=LOAVBRlBe0fBBStxdybf7ax1f61x1iinwtb73PFIPOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmJXTEjjmyJBzUTtlevnE2yLLsw6eRM6CMcZIpBS/xXReMuSHk3ehCz2yCvyAWTprTDqCgq+yBBa9EiH8u4EqcPEt2wNeC+W8RgpnyhsH6EMomcxd0GLQRx5XXOcTHtdrEJoxg5l5effQHGRJD1509jfOCC5wZgxK27M0m74L7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyajOg5G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyajOg5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC34EC4CEE4;
	Thu, 22 May 2025 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747927843;
	bh=LOAVBRlBe0fBBStxdybf7ax1f61x1iinwtb73PFIPOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyajOg5GXbP0UyAWW0Y3ypF/uAd1WfA5JSb1T6TSD6h2bUXW/kTLRhFNP4Zp3K9eR
	 GK4Qg56JBWB8ukZgEGT412OYTKJ0zJlRnp44jx2ckqGGJtNe4bGJZaq4F8DNvGdtOd
	 nCjmKVCuhMB6eSkB4bbnfVPsIqwK34BtZZ+j+fBhplR3kEYLJ1dUTDqTeCsWChg/Ra
	 B0SlNAu2yRh1VkYlbpjQQ5uEXP1XEPLXb3MafoglaqgRw3lLaNmqiGWBujYPd4Eti8
	 Ua8Gjxp36AufZgvBKfWLKDmH4bQ1z6HfbMIeGRTp6Tz5/oYUhD/ErtyGxCPx9W6rJU
	 6zx3OGVP+/m9w==
Date: Thu, 22 May 2025 16:30:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Wig Cheng <onlywig@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, heiko@sntech.de,
	kever.yang@rock-chips.com, manivannan.sadhasivam@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: rename nutsboard to
 mayqueen
Message-ID: <20250522-difficult-yummy-84376495b270@spud>
References: <20250522152220.3408999-1-onlywig@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QOJZzJdGwobWCJ5T"
Content-Disposition: inline
In-Reply-To: <20250522152220.3408999-1-onlywig@gmail.com>


--QOJZzJdGwobWCJ5T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:22:20PM +0800, Wig Cheng wrote:
> The company behind "nutsboard" has been renamed to "mayqueen".
> Update the vendor prefix accordingly to reflect the new name.

Whatever about adding a new name, the old name should not be deleted
since it has users - maybe it can be marked deprecated.

>=20
> Website: https://www.mayqueentech.com
>=20
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5d2a7a8d3ac6..ee1dfb7aa64f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -916,6 +916,8 @@ patternProperties:
>      description: Maxim Integrated Products
>    "^maxlinear,.*":
>      description: MaxLinear Inc.
> +  "^mayqueen,.*":
> +    description: Mayqueen Technologies Ltd.
>    "^mbvl,.*":
>      description: Mobiveil Inc.
>    "^mcube,.*":
> @@ -1084,8 +1086,6 @@ patternProperties:
>    "^numonyx,.*":
>      description: Numonyx (deprecated, use micron)
>      deprecated: true
> -  "^nutsboard,.*":
> -    description: NutsBoard
>    "^nuvoton,.*":
>      description: Nuvoton Technology Corporation
>    "^nvd,.*":
> --=20
> 2.43.0
>=20

--QOJZzJdGwobWCJ5T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC9DHwAKCRB4tDGHoIJi
0nLRAQDMQJJe8zrV3GWFzNHOju1ZcwrEl3F9qBJT5xwqgPSwHQEA7LSO6v2nMT+G
JpTtg/AN7gBcVbuqjTMV4rmBWXPPEQU=
=OTEP
-----END PGP SIGNATURE-----

--QOJZzJdGwobWCJ5T--
