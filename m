Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42525279337;
	Mon, 19 May 2025 13:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659967; cv=none; b=DBsOAqMgK3+QN69Ok8Z36Y4KV1PwKjXBSrn9wMa92QD6zx8eSd7D2cc6Lnp8Mk3awERQgExnfCmmtD6/ADtacr3w1xszompBMyWf6r5PZhRIFn6oDiiD+NTN2VjFmbMuo56r6UK9ZpKffadK5NnXVHjJe8N9uvaMEAkgYRY6nEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659967; c=relaxed/simple;
	bh=wzNLxFAtfoivfaQhqZMfWYEI7egJKHlqDDzbkGWkebI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxxhqO+PQ+WB0dA/94ZSUYrWBCR8VadzohoYTI6Xy4+zsrWs7tAj1TDeUEG9WmybciH/LpKKq7EviWAuyGR2E1zefEA8p248GrxuQMLeW7MCp29H62moOXSfNZD/rLdbT4a7IVUqGC3vPAU7Rdsez8OcEncljpz3NSe4Di58SLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pqgS5Ztf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pqgS5Ztf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1315C4CEE9;
	Mon, 19 May 2025 13:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747659966;
	bh=wzNLxFAtfoivfaQhqZMfWYEI7egJKHlqDDzbkGWkebI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqgS5ZtfGspDnqmRgpZoIQ/shaV1yLpWnKUWMkPWPqvSSfsYLATdrmFPFAIJYBI/m
	 n3UCeK60Nr6Cs5xUopVPPo2eS6uQwuyhBtnz8AFxqPnRaXZOZoUwRLuTj6CqV6P9av
	 Gt14gdb8ej8uVQe/oeaZ/K89gfrHUybOAzdic/zbGgEMjjHkj2a1kcuMz1GhgyChcD
	 oP15DUUAPJjiphFmtEYUu9Egv0kclVMSI1cJuEe8rifg490P7FgeRJiYymr6JxeG2C
	 2sLrrk7KqOppWaA09TOwZPCo6qfL1um4Qtaeew/ryx7+Fppssv31LRPE3xQcaTJylQ
	 Z8iAgt8lMllHw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uH0Bu-000000007AB-0W90;
	Mon, 19 May 2025 15:06:02 +0200
Date: Mon, 19 May 2025 15:06:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: alejandroe1@geotab.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
Message-ID: <aCssur0WxPbFs2HQ@hovoldconsulting.com>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
 <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
 <20250514-saggy-shifter-e4ac7152f823@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zFFlllyl2SavzaQL"
Content-Disposition: inline
In-Reply-To: <20250514-saggy-shifter-e4ac7152f823@spud>


--zFFlllyl2SavzaQL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 04:49:01PM +0100, Conor Dooley wrote:
> On Wed, May 14, 2025 at 01:55:54PM +0200, Alejandro Enrique via B4 Relay =
wrote:
> > From: Alejandro Enrique <alejandroe1@geotab.com>
> >=20
> > Add compatible for u-blox NEO-9M GPS module.

> > --- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > +++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
> > @@ -22,6 +22,7 @@ properties:
> >        - u-blox,neo-6m
> >        - u-blox,neo-8
> >        - u-blox,neo-m8
> > +      - u-blox,neo-m9
>=20
> No match data in the driver, why is a fallback not sufficient?

By the way, what happened with the Subject in your reply here, Conor?

Johan

--zFFlllyl2SavzaQL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaCsstQAKCRALxc3C7H1l
CE2sAQC9QQiHjYbDzQh9Yf/IRhy4qS7mukbJdWhVp2wS6UfS/wD/X8CDHP6BA62I
qbbjfrswR/eb6mSRjvSD2qU2qVWGvwo=
=SKih
-----END PGP SIGNATURE-----

--zFFlllyl2SavzaQL--
