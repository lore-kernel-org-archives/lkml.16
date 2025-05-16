Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14780227EBF;
	Fri, 16 May 2025 11:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747396605; cv=none; b=PJR3Yb5FZcnC/+cHwyiLjYTtA39uU9f7SCmcYgyqn6yOfxgc1ON1o2kChTwxuoqkmO+A1efQKQLJ211TZXyrbnSoZf92CILZ2uMe9aFzLicPF0Ttr1ulFmydg1WGjvHL+m2M7zalLI8yjKnLihtrWTQ+LIT7wS7vNtFhkTLtO9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747396605; c=relaxed/simple;
	bh=2AqmGqN5e9uC85s7uORYRVeMii5+2Yzv/IhwZ4KrwIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM3czLoDa0hSVS16g09T5f9TsLB+ktvmG7SPInva7oQKvyxhQPo8rIfAFnAfRyJ2uPYnz2lZnnOWu7SNLWWKaZRsX6R7Hj82G7fGjGFMUQIMUH6Coq9Tbw2XzHgF88d4RaXBnMeIDXpEVNMwpDOxPCQrhuGid0PGu2q3OWzWyFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmiZuIeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmiZuIeh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA2EC4CEE4;
	Fri, 16 May 2025 11:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747396604;
	bh=2AqmGqN5e9uC85s7uORYRVeMii5+2Yzv/IhwZ4KrwIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmiZuIehGhZXjIhOYRSZT6vMgdgMmBTy8kx1fGSxOvvtXIUteyeTc5zPjmb8vTl2A
	 84A/Rwuh22taieqtQ4NgToC6gs635fvRsRohHCEa09i0ouB8aA7p7r5iNzQM4WIzhl
	 BCGW7B0U0LVAJW1hXbnvRaenPTC3z+vanNuQ+AcBU5s5jl9Vl/MMI2+kBXpQeVciWl
	 qxSqXL0EIbIMizBIhzHmddZNE2ZvHmwkQMsekoVbeOYeZDVFBf9qBgNorPNWOfhvhK
	 0X0BXRgoBpH1Hk8RO3u5szvzNeN4hbLi1xJvPTH/90I21Xkq67a8RI7MC9pUdFqL/h
	 iE1StynY83otA==
Date: Fri, 16 May 2025 13:56:41 +0200
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
Subject: Re: [PATCH v9 5/8] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
Message-ID: <aCcn-aaY6TBGszSZ@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-5-14ba0ea2ea5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aOx5XsQqjeptAaq9"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-5-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.


--aOx5XsQqjeptAaq9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:32PM +0200, Artur Weber wrote:
> Instead of calling dev_err() and returning PTR_ERR(...) separately, use
> a single "return dev_err_probe" statement.

Reviewed-by: Mark Brown <broonie@kernel.org>

--aOx5XsQqjeptAaq9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnJ/gACgkQJNaLcl1U
h9BpQQf/VH7x+cuXZKUB2cbpP1PbxJTGJt+ciMTQ94KrX/8CMGvxkA8DivhPILpY
xKQJ8MTXtyLQSJSS+6rVvRFQgIvmo1d29OMiPRGzzCoAxlnktD4hRRxcThDNvCLX
OpIehzCFyyFlAERk8mIUs6MW3RuZ2+55uMmQ7c0FTMF8MwwI2wBYzrFkp4nvlDMx
sceTQ3OvR4qQYf60tx7UlqRM1xLpQHGwULjSwFPMsEjGRMyxbHYibZMqlN8hOtlK
Dt0j70x0QGtJI2WppmPqmCKIE3dAwcgItDoS511aE1/0WuIFHn9OfHlUNnjN4uCf
7MZv5A6k3QLDYcuEibOxYCb3N+VT5g==
=Hcs7
-----END PGP SIGNATURE-----

--aOx5XsQqjeptAaq9--
