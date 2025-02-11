Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0F261564;
	Tue, 11 Feb 2025 17:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739296585; cv=none; b=hSPJcrSKE3/W1eXFydfZ8C7JVgFP7rfDuJtuB2gC5WWCz95jMvX4o83f/mSgg3c+fXDlgLJqNvO9EvZy0or6jWAxVMSnboOK6xS7EuanosH93R4kAFFztpSkESINarGQ6MBvjdv4qVHTINVyMOjrUHyZkoV8VuXC4mFhOPzDAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739296585; c=relaxed/simple;
	bh=N9OiVq4lA3y1Ju2JdD3nDT1kWhrKFhscMSwrUVrrf7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1PQDnR2p8q0nwk+jSPf4V5QbitaUEsk+Zv2PVJY6v2gZozP0gDiMetyCsqR+CpAosIItyZfFEU8njqdki069ceYM9kjUkYGQrBuvGSauFW0d+mSP/9IrCT5796INRJp8PsXRFdJdCrzs0nixHvaow82GDdVugC8gNoorME+aZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwdj3RK2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwdj3RK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5928DC4CEDD;
	Tue, 11 Feb 2025 17:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739296584;
	bh=N9OiVq4lA3y1Ju2JdD3nDT1kWhrKFhscMSwrUVrrf7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hwdj3RK2bdWxTm2v9oFP02HODkeYrya7V5OzHTSLUNab2QJiADsQxpSkj8DLZfdeT
	 Lyn7Wqgqu+84u4FO44yZysLQhrNO+Duk12k+9prs2N4ZGb5MMJpKqyY9eGHIuQpiW5
	 TK4v2VR3CN38WVQzxjX6H3aPV+pTwAyNC2EqnxyX3BQa1eX3KU1WhE8f7IodQaGaDc
	 hueuv0Bezgbe1jOAwOcEoZwmE2k4kk3IpgSIHMOj8SEuIIAw9oie200aKIzsKdnJxK
	 xO8QtW8xJsfBcASUxu9f9emGW5I7NUemIkwwY+sHq5Tgkil748cOC6ZBMqxmNFDTMp
	 b/jLO9dx9WoOw==
Date: Tue, 11 Feb 2025 17:56:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RESEND v2 3/6] dt-bindings: nvmem: rockchip,otp: add
 missing limits for clock-names
Message-ID: <20250211-brownnose-pancake-ec8010226e71@spud>
References: <20250210224510.1194963-1-heiko@sntech.de>
 <20250210224510.1194963-4-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5lHI6jXJr/khkXOI"
Content-Disposition: inline
In-Reply-To: <20250210224510.1194963-4-heiko@sntech.de>


--5lHI6jXJr/khkXOI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:45:07PM +0100, Heiko Stuebner wrote:
> The clocks property correctly declares minItems and maxItems for its
> variants, but clock-names does not. Both properties are always used
> together, so should declare the same limits.
>=20
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5lHI6jXJr/khkXOI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uPRAAKCRB4tDGHoIJi
0n4bAQCGaE+a3c4Ovuh/Je2FzH7HyaSdzuOzAQjfzUqy896TMQD/aS3ACMxHzh+R
1ApLMMa2YdgCgtVGxmRBzbOAD76khgs=
=T9CO
-----END PGP SIGNATURE-----

--5lHI6jXJr/khkXOI--
