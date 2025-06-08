Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124A1DEFE8;
	Sun,  8 Jun 2025 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422001; cv=none; b=OZcDui2rikYPTVvFlpDLX5JwAzXmyN78kooIb4mD/Lx/8OGnEkdXKnnZniNoJVJZ1AgaO1ELyMk13+VKts9uiuZOppHq9lM0d7WzUmqCtoZjY7mxw+UQwYPiYuiNOB/8Bompza3xIM6X+5KtSMSdQwYPhH/M0GNuNWb2lVaFucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422001; c=relaxed/simple;
	bh=B2h1+W9i/ZhBWpBc0DbE7ILKJxEIopJX2/mIFpxQL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsqmivyOkoLpg5ra8qWlnn/D+DHhnjR130JV2cQoC0PDILkarv/zw9bXIvqzZtNg3YXSbpWBQbVBFSTz79rxltwhx8hwrSxkJs9S6s7CKr+50ELqun4nqptSEde4NrMsAREVAaxI4/2gxBOElMgpjjtPfzD7N3kjb3QJUYUMQHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6Pi0AP5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6Pi0AP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B084C4CEEE;
	Sun,  8 Jun 2025 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749421999;
	bh=B2h1+W9i/ZhBWpBc0DbE7ILKJxEIopJX2/mIFpxQL4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6Pi0AP5bCwL2JbyvY4kn4Uc/3NPLmMHGtAheuuY6XqBdeuaAbA8iojPvrWpXfPEF
	 +JqawQrvybtit7cBYVafHWNEUq9V3uuSByNbvmEasr22epuF+/Li1PvxQdqa0emd1d
	 1pDA1e5J3agyQdmCMIW5+3teqtioBZ2Q8sYdY1NgNZbS6B+JibS/bKw5qGBIhJXh0H
	 BcFbHxhQiWrIW4ILfG+QOswqqxz3+hHiCIfa8C8gRnJpO5OEDVj4R2YWe0U/UX/k+m
	 dTIvnZcV9uHdcEm3YIInRNccQhYIY7HTOimxDFaD8G/Bj22kn9K2986R4gHMLUNsKN
	 9OkxyAKJkIVUQ==
Date: Sun, 8 Jun 2025 23:33:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jens.glathe@oldschoolsolutions.biz, konrad.dybcio@oss.qualcomm.com
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
Message-ID: <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LdWWYvFZl8SdA2Xp"
Content-Disposition: inline
In-Reply-To: <20250607212654.126412-1-alex.vinarskis@gmail.com>
X-Cookie: The eyes of taxes are upon you.


--LdWWYvFZl8SdA2Xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 07, 2025 at 11:25:37PM +0200, Aleksandrs Vinarskis wrote:

> There are two main reasons for this driver:
> 1. Create a pseudo-consumer in place of real devices which are not or
>    cannot be described in the device-tree. Examples would be integrated
>    USB UVC camera (present on some arm64 laptops) or dedicated keyboard
>    backlight regulator (hypothetical). Instead of leaving regulator
>    without consumer and `regulator-always-on` property, one could bind
>    to dummy consumer to save some power during suspend.

Those examples both seem like physical things that exist and can have DT
bindings written for them, why not do that?

> 2. A great development tool.

That's what the userspace consumer is there for...

--LdWWYvFZl8SdA2Xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhGD6gACgkQJNaLcl1U
h9AafAf+O+PIcQ3RdxKO0vRisEqvNshn/SWiNixQQnY/m1zs/mqFpR9YlzCUoH1d
skICMQyQ8N6xyZP0HQSY2mXp65x9GQlvZksCu8r09gACMubpCdyxp4pdU2I+pGYn
4e6lNNU41Mi7ZgqcXi0Dsu7OsEaH0a+km/qbVZtBU5GCc86qzLNWLFjhr/d8NwWa
slH/bnX/qxrIij4bZbp4izEoTVmGwmgI69WiOJN50Vl8d9QZJFYD7ToduV5w0AR8
B3ANv0ZlP2GiqDAqYxDmiY4sJF4/nzpLWckcxIVZ+A5oFBM5IrmeykzN856heFh4
uYh8AiUDnqn1c2mRrtz3B5DPbBDWtg==
=Jl3w
-----END PGP SIGNATURE-----

--LdWWYvFZl8SdA2Xp--
