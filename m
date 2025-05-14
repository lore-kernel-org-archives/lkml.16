Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194202701C5;
	Wed, 14 May 2025 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238331; cv=none; b=ulBJZ+fKVE/kEm2czRHozhNg0buFQTvl4vIMPxKQ/cGtzR++p9vSRCi2SaqGCQeXf+v0+KIHOdEoxfCJ8XbemP1qetbtrVnkISwHmE+x+D1KCQji2D/c9VjGzif14vovFU9fI9cjTDsEp9Zc+Z6fzVZwDHcMZZ9WeIQX9hhaJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238331; c=relaxed/simple;
	bh=DSf6fgAJPEt/aB96YuwhOZof99etbHcJvpC8hw67anY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXOoatfZgZIdTVXuh3X2QeHWvEN+Zo1w30llMolF6vA8jp1o9fRvUacx8UiqprBSopZ5e2RmQcdwO1Jrne/tVkpLDoAW8JSuNgb6ZohR1WIRsgk88MAroAYz3OKNWulOCRH/UVUHEGi2Lz1+oYYhlnDdtu9L5+2tp36ZB9duuOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp4dsLU0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp4dsLU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CEEC4CEE3;
	Wed, 14 May 2025 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238330;
	bh=DSf6fgAJPEt/aB96YuwhOZof99etbHcJvpC8hw67anY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kp4dsLU0VanD4e33v8AkFmQGIz6asUN7iZP7tr8C0MFMSLPgm77AjW95C1REu6B+9
	 DnzOoxHmkwatWB2kifBGKdOcmo5mRg5Y0O8HZSW1MpRBHS0py5IiYy87Q076gIm577
	 fTEb48QTccoVWaAQ6FG4WZ1e/tLjMFy7rdcGUTz7+thmXLHqXd2ZE8EjiyzeCPqdqR
	 XsPIKV63EtBATSgTlm0EVCl6vR4KRZJ6nE4D6b5qeo6urTUnYNa+9XZ5mVHrcou+22
	 obKT7rBh4q8euVpMW8oPViRup8KJStzfLM8aL25oBrPwZ+eZ5dPnFLAtJEjmC9ACX0
	 lJxpKKpdKzlMw==
Date: Wed, 14 May 2025 16:58:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Hsun Lai <i@chainsx.cn>
Cc: Fred Bloggs <f.blogs@napier.co.nz>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Message-ID: <20250514-starship-hula-8bdf775ebe99@spud>
References: <20250513163515.177472-1-i@chainsx.cn>
 <20250513163515.177472-2-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D6jM8BuA+oADXsbS"
Content-Disposition: inline
In-Reply-To: <20250513163515.177472-2-i@chainsx.cn>


--D6jM8BuA+oADXsbS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 12:35:12AM +0800, Hsun Lai wrote:
> Add vendor prefix for SakuraPi.org, which produces

This website does not exist? Think you should mention that
https://docs.sakurapi.org/en/ is the site (in a Link: tag).

> development boards like the SakuraPi-RK3308B.
>=20
> Signed-off-by: Hsun Lai <i@chainsx.cn>
> ---
>=20
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 3e7450c3f..744d01a76 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1299,6 +1299,8 @@ patternProperties:
>    "^rve,.*":
>      description: Recharge V=E9hicule =C9lectrique (RVE) inc.

>    "^saef,.*":
> +    description: SakuraPi.org
> +  "^sakurapi,.*":
>      description: Saef Technology Limited

You've added your entry in the middle of the Saef one.

>    "^samsung,.*":
>      description: Samsung Semiconductor
> --=20
> 2.34.1
>=20

--D6jM8BuA+oADXsbS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCS9tgAKCRB4tDGHoIJi
0q8QAP9tNCMpApYlgZi+aeED8eLOGgKb5hjN/+SCXPB6O/y9FgD8CJmz2GXl+RKW
ppMsUotzTNA4d0ZHlowv8DqWDntvqAs=
=yovm
-----END PGP SIGNATURE-----

--D6jM8BuA+oADXsbS--
