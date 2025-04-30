Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5864A219A93;
	Wed, 30 Apr 2025 23:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746054415; cv=none; b=BdHEllgcLaXMfhOd9WhHnEpMPvqLNVyqbNatjVZo5QNajv3jwT2E1/bzUDE4omABaiug+kTu9h2NKcFGL5fbdXbj8fh7R+8NJcEKc3zmqxSg1f2omqW/fV9efqKYii6g9OnXrXZk2M1euWAZ01SrpI4LLSPRvunWEV1nfPl7w/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746054415; c=relaxed/simple;
	bh=DVe4AB4EflgrauQLf6RgNDVBTkAUO5bOQliQvYixnW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pzw0a2hYwVbdUlLHtCs0v84qFm5BuAVdC9nHTuS1QCmqAMIJ9+274bQxF/GB38L/nyS/P9rarVbYHnwB1uW4THYR3rwx1QjnE3Rj/N+Ie8Q4c9/9RbcIzxR6+1Q/b6PvkZ5Ru29jQSCMlzVAw9FkVz5h9O7Zl8mkqVkWrQIvR2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6vCwD5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6vCwD5K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6411C4CEE7;
	Wed, 30 Apr 2025 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746054415;
	bh=DVe4AB4EflgrauQLf6RgNDVBTkAUO5bOQliQvYixnW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i6vCwD5Ku8V7NhwVQCWwREJPG9bpxTlnAjBWAPC7OHfxwEj5pw6WIXihyOM0y07Np
	 oGmUoxS7a2mBs6MUYDOWJANfPTAeQlHn9gqi2vcfINyLnEW81ZfPWC6QWthwuCtwxe
	 uoLvX5SGnjAG+PStaYDsa20ZdplK/V0lQK4PCJqUSbfhXhxpHZL6q0gCQafGRJ8FUK
	 hqDUKKJknEElV5O81sILkYadirfxvvyLluuq2YvGg858QohSN+Ed8uOWekovraA+6T
	 zR9PoOP6dKH91v49Su5iWlZzX6BSNRYJKxcj8ve7M8lRI8lYzvXNJ8d0sATFVxd9vn
	 HbtwgGZde6m2A==
Date: Thu, 1 May 2025 08:06:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: stm32: sai: skip useless iterations on kernel
 rate loop
Message-ID: <aBKtC6ltm4hyQ3yW@finisterre.sirena.org.uk>
References: <20250430165210.321273-1-olivier.moysan@foss.st.com>
 <20250430165210.321273-2-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bPEVIUKDWml5O3Hc"
Content-Disposition: inline
In-Reply-To: <20250430165210.321273-2-olivier.moysan@foss.st.com>
X-Cookie: Well begun is half done.


--bPEVIUKDWml5O3Hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 30, 2025 at 06:52:08PM +0200, Olivier Moysan wrote:

> Fixes: b1d2e4067dc6 ("ASoC: stm32: sai: add stm32mp25 support")

This commit isn't in mainline, I think you meant 2cfe1ff22555.

--bPEVIUKDWml5O3Hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgSrQoACgkQJNaLcl1U
h9Ce4Qf+Kx6UyqHkHSI1stvCklQt/+Z4iVfBjGo3/P0vWUe9GgKN+LB/DPfzc/Ww
FwQqXWsx0/xp/XQcgCpQFBEzci6nEGWjdJ240fLzpSphVX/TX/sFNiiuqXCWAffR
jqABT5SrIZx+Oy0KfdzcfNbpaNdd4yRbjDWYi3TMH0DgmxLprzu+iy/65u+sZRtb
mQQ++AZCcMQ+E/a70aYRbffxxRZtrdMpfzQIyl+EU9I3cjCCxMwt+Bt14NZd0VWO
3j2T8f9vxbKM1etsdlP5X9THWTYcSjFZdi1lRGCtM4idZxRaKhYfHlAn+zx4ESdk
OeJLoGUFNDp0qhHDbI93je5/cCKcHw==
=jH7g
-----END PGP SIGNATURE-----

--bPEVIUKDWml5O3Hc--
