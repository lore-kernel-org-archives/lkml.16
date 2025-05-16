Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A38A1E50E;
	Fri, 16 May 2025 12:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398677; cv=none; b=i6+Ci3iinIKSi9TLY2BLBDiFrem2GqZSdM1wQ4qdnMN5zEKmcyb3C1SJlF4fXvOQ8Z3d5ozLUGlja5uw7nG7IhyK/Zd9K0SlfNQ4Sbgswyn8/KNgLf0z07K7nxwcG+P9jaNIcxokrmbTaKXcINTa91AUe0jVizgmoLIOhl0XrcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398677; c=relaxed/simple;
	bh=P6XGWGJuATalMapJ3ehd2QZWwZCyzu5iLtSo/UIb75o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVoZGwh/2s8iyo7tCM5BaXLPCOvkNQipctonGd3TEkKfDfVIpSX5wqA41Ihoto+BjLOZs9ac+j0zR38UaehKtOk7KLuQOdtNXCA6weEq79yM8pflla8Cd0xQc1wic5WuPam+I04N8c1Z4wFJ28XDoWDKr0jZNxzJjSk1nsCDq/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOFO6vsW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOFO6vsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4B3C4CEE4;
	Fri, 16 May 2025 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398677;
	bh=P6XGWGJuATalMapJ3ehd2QZWwZCyzu5iLtSo/UIb75o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOFO6vsWjIVTN016AUqDm7zPSIHzt9FFUIw/H8Ec/lBLBGIHZ2WWpO0nHjPzfbuAQ
	 hE/JDMXKgQhJtvg5V5KGovTQAF8b+3gbKZse1BEXQObJVrmz/RvLaYiS6OcMgvaZBp
	 7nbwCKz9246cDnTHBPQQBwgZ/NdHAqHeLJHMDiBG1aNk3FCTuFpeShNc/Y+C1RG7D1
	 tqaTVjqXe9jnNC8L+ZOf6+TAmNNeYqXUm8EVzeq/TaUAt0ZiSufqlUggvc5mvq0jYf
	 hNJ82SZLbRn8pLrgVjDpnxK2m+kmH9Uu2ZLZLyp72oWm6sRPxjrioc6Qdn4BUBMmFC
	 bCvowjiID++uA==
Date: Fri, 16 May 2025 14:31:14 +0200
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
Subject: Re: [PATCH v9 7/8] regulator: bcm590xx: Rename BCM59056-specific
 data as such
Message-ID: <aCcwEtpjpEv_FiKB@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-7-14ba0ea2ea5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efwBYL81B3k1M8EO"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-7-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.


--efwBYL81B3k1M8EO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:34PM +0200, Artur Weber wrote:
> Previously, the driver used the BCM590XX prefix for register data
> specific to the BCM59056. As we will be introducing other regulators
> to this driver as well, make the BCM59056-specific values use the
> BCM59056 prefix.

Reviewed-by: Mark Brown <broonie@kernel.org>

--efwBYL81B3k1M8EO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnMBEACgkQJNaLcl1U
h9DqmAf/bQ7IrBsLoIk0QlWpx9mGGsEhrT5JyqKADi/mNCt74Xk0lh/8GM2pOGGJ
T51tAPDKyrEkGIhBBKSv2vKvYR03KUuudSdkHgcBiLBkRCQAvwo20KTv5xSPaTwf
rORiRsSiyQlGQtVrRSHDlAAaQsfiQ7gFOf7vrCuKp5MIDfLsLWSng1L0MNkXDWho
cpz76EMmeBdvGk74HwU7aYw5GRPUrG6PR+cRVOBjK+50kHMljTI06Jh6zN3/FJLb
4oe2JC2uYjCroAc61SW8rmjle/9KWF1/BjuLpSN3GzeHo0C91OZnS1gVeVhGm6X2
tzeu8Zwe3YMPfwu3SEJf62XAkB4Vzw==
=6NbA
-----END PGP SIGNATURE-----

--efwBYL81B3k1M8EO--
