Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC89209F3F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841417; cv=none; b=fQpdlJB4+Gkksx11L9Wsik1aZIjMEOgmJjDZYR570l1Vy3y/Bds6N/d2CxYAG3FfrLf1I3sf3E0CdjEOzSU1B1tat2CAOzcg2/YTHnQw4o4E7b+9qg8TOIX+DYlFY/iJAYNzFMH7GAfoV97+cd7xTJ/AFQK1wvOxxgl7zIvAf/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841417; c=relaxed/simple;
	bh=WKkfTb4ABY013l9PqIJBcHOmDmRx+BBnw35XdS0s0D0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYSJu7JSGDAqoOQOiZM/obBeOLlScfPUOYGmIlT1VQlzaIVtIeKNOjNFKvHvxm/1kFGn3ca8Mh70BNe8/SPUCt3RfvwZHZcRlgwxAtxQteobaHN8OQx8rYApYeUe86SvpzMFl8Y2TZdFIEO8fED7IhzNtBKm/KZBz0CAZFF4y4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zr1jWUp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zr1jWUp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBC3C4CEDD;
	Thu,  6 Feb 2025 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738841417;
	bh=WKkfTb4ABY013l9PqIJBcHOmDmRx+BBnw35XdS0s0D0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zr1jWUp+E4nq89ae5OuGghtoHIz+xipT4DQCgNyEzw96NrEHg1n1FpdR0ydLbwltW
	 uOYPfaxcjvCe+ZbxD3cEN0lWAheVd3l6I0PaZWxuJPCFFzMSodTpnY/yBInuEWRfnz
	 Y+UNO1JFjE5koH8DETGE9DoEzDAHogSIyVihIhHxLJ+E64YLGUOLD17MgQKIW85E0C
	 RWHL0RBoZw1Ja92Q/1fFhWA8C3uxSe61hdFMLddNietr8fRsZPccjEnANUHP+FwXVm
	 oVS691KxlbmmV3OOoaqUgcclN4fBTyIlEgR45kkZdlkpoIkIKAoZwht8osVBjFW/z+
	 Scr05yXC59f9w==
Date: Thu, 6 Feb 2025 11:30:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: Guenter Roeck <linux@roeck-us.net>, michael.hennerich@analog.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] regulator: ad5398: change enable bit name to
 improve readibility
Message-ID: <ae56f8b2-1ca5-463c-8a4e-a384ab0189f6@sirena.org.uk>
References: <20250128173143.959600-1-isaac.scott@ideasonboard.com>
 <20250128173143.959600-2-isaac.scott@ideasonboard.com>
 <bf646a72-1695-4305-be7e-a64ce9d32523@roeck-us.net>
 <f66366da01ae84313f79b5990d9a906bf7a5eb1e.camel@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a5tcTbPdu0QLW/UH"
Content-Disposition: inline
In-Reply-To: <f66366da01ae84313f79b5990d9a906bf7a5eb1e.camel@ideasonboard.com>
X-Cookie: With your bare hands?!?


--a5tcTbPdu0QLW/UH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 09:59:13AM +0000, Isaac Scott wrote:
> On Wed, 2025-02-05 at 10:45 -0800, Guenter Roeck wrote:

> > 0x8000 is BIT(15).

> You're totally right! The reason this got through is because in my use
> case, I am powering the regulator on and off in multiple ways. This
> should definitely be BIT(15), so I will send a V3 shortly.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--a5tcTbPdu0QLW/UH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeknUQACgkQJNaLcl1U
h9CiIAf+KmuC4XxJoznAsUgf7gMUa2B6vSjT8Dc5BbU4x4KYzE5xRjudghzF2Tv8
msTx9N6ZCKu/nj0xVpz4yQrV91w+2GE+UiczJ+3xn1krrHohux0vHyXSd2hDUrBe
Ue4NlLaHfjMiRd2YN00J+ueadPcyllmcX8yTfe9pFr2elOrBgu5oYSdFgqPVMe++
PKvMXO/sqOAFQ6dRvOAY6Cr2nEsSW0Ye8YYn7HEoXPCZLMB1VIeQVQaSbnGyMxA+
z1TagqfxZTCMS23ekZDHWZXHGL9hoZkr/sxRRj4cEh14QrKsZvWl/1cPf11v7B00
NXE6OqEi8KwV8R06HNcvmK21Mlz0Jg==
=bZh7
-----END PGP SIGNATURE-----

--a5tcTbPdu0QLW/UH--
