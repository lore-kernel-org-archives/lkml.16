Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300C91E871;
	Fri, 16 May 2025 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398756; cv=none; b=fGYgAv0apVam/Nk1hbOFg1NEb3TX9mu6c+4JyByE3lcExdjdwHHAxTJDEyzyRMB5PiEeKn/gpD1ib6Tq0daLByuuj73OnU/hPmqKKT421o9Sg6C29XW/LjbVD7WGfQ5rPgc8oWklcUTcxaDSBhciyx4GovrZjNknZKbJe7cwfHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398756; c=relaxed/simple;
	bh=LZPPcB2Se1xayB1f1+P9TFpe9Vt4mOCdBfx1Vac89o0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+uFuRMwIrh+a7gN30Yvxe+U5Rr1r4G3s+S4POfUvus20IQJMvmvZ9qoS/P2dvJ1H3UZTzblBvkIet3V4DJYCVtw8LVlV12rsMQ4eeT7lOgNzRwl/NbD2QOHNmKzfNKK+S8CjyPxeNz5qmyl5yovdaxuVTJuOQQUgmny16D/o7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP74h7WP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP74h7WP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9E6C4CEE4;
	Fri, 16 May 2025 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398756;
	bh=LZPPcB2Se1xayB1f1+P9TFpe9Vt4mOCdBfx1Vac89o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dP74h7WPGpcKPl4edo/YKKy6Ak52fVBy6wsOgoSgrlwvGykV6y7+9U3qKr+705fi9
	 nOIfJWrsOt5VjD09txTFFfMvJhoVXXKdaIgb2EctOMmS3LXB7DL5yg5AIs/p1xTH5Y
	 DAKYumrFJRW6GrNtVhwVOPy/sEIEOiu+H/aEtC9Hk1FT9+Hf2R8xNHxXCh5gczhuyY
	 btPEdM8HSBZycbRZl+gieZ59BTVR5UoQkSbV5LlZS/IyHclDbkcpNgt/DXQOAsPIo1
	 zacvCQhIuRQ/kBQcGPSrM0t+XfO9EiGbE1200BSCIkAwA0tJhXEzyf+TRGl6Netk2b
	 G+A8lFgE/ZLqg==
Date: Fri, 16 May 2025 14:32:33 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v9 8/8] regulator: bcm590xx: Add support for BCM59054
 regulators
Message-ID: <aCcwYc-P3wnVElVW@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-8-14ba0ea2ea5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rt7h2hlvi3JLefw0"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-8-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.


--rt7h2hlvi3JLefw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:35PM +0200, Artur Weber wrote:
> The BCM59056 and BCM59054 are very similar in terms of regulators. Add
> the register definitions for the BCM59054 and enable support for it in
> the driver.

Reviewed-by: Mark Brown <brooni@kernel.org>

--rt7h2hlvi3JLefw0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnMGAACgkQJNaLcl1U
h9Achwf9GfRM59JFB98JmDtCZm0VP87rX1U+t2r3UHaO2db9sYgezOwwkNwQ74YC
YVyyz/WDkhTzez4QPx/p9uDPzxq9sBuM6r6qgHFoz6AkKuzcR666OL/lz37Ugfx/
DFxcn9o/pRIUzbVPTnN1ZCjvLAOvyySSjXi8U+8eMJA13rE1P+gcQHNDfe8xpIvz
iSTTcPO39SY8gkNkUuLqqoItlccqf2SUhCVoQea0bGDsg0RJt/OaF5hKl/IHgVf1
mxILPt3JnkqKIofAoSOi4eAiCmahqn1ypDTOnwBcl0CUiPSozDoXNOpWxjsx9v2l
EE0vR1dvqKD2mRk3Mq0u3UCleLuXuw==
=Z/pP
-----END PGP SIGNATURE-----

--rt7h2hlvi3JLefw0--
