Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F372222B8;
	Wed, 30 Apr 2025 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055112; cv=none; b=NLYaye0qxsBFwQHJrvxEQVuwRDjtsNPlvguK45PriPsS9S7zn5vmhd7W0r7YAuAtzrkiSDvf1n7ADy3WgezLp/C6MvF+ed05a73u6diF9gdYDttaj+Le6LZRxqgOesCrlAwfsUbfbn5h25WpPt+uH/LPk4fqW/LfuIxuVAmZdHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055112; c=relaxed/simple;
	bh=jai+05BP4PYbbUpkVBMdJRzYy9GRG1tw/UfTsXqDnqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZOAIkxrsg3tFarBrQzKkCKJX5PrZWILtG0rdJqJFFTFa5Apsrk0uF5a++r+CDOfluGbtErIjOIwcE4cPLSXw+HlUFcWL4SDiOWZG+3qY+pvKfWbILOFM+fhrJormhdZh/9EVH6rWgegvAiV7mlZlB4WyRBPbn1MtMZPii7qK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVJ16W9H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVJ16W9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FC9C4CEE7;
	Wed, 30 Apr 2025 23:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746055111;
	bh=jai+05BP4PYbbUpkVBMdJRzYy9GRG1tw/UfTsXqDnqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVJ16W9HisgZNJ+KL759MSIhXrv306B6JekecnMI+odRuk2CIEfLajWNkRgCGMPkA
	 fsZgLyfNU/E8rnApLM9simfXzohYx/tASqtB43Ddg/bw1ZVqDeHAMw441Zr0Yv/P0z
	 UIm3tkpDnkwhiafiAQYmC3J0D2uVzEyCs84uOitEr7vZq/wCl1LduyX34NnG2BOXbg
	 Fumfd8t0jU99mYLFyt4tIlGynEaliVMn/HAury/qBBJ1S2KTyzFBn/1BpGUfXHgTPq
	 4cxAfpeEE8A0IbudQqpVrNLW1uNmWAhjLydRTEa0I56/06Jqck/cUBsyXr8TXsPWjQ
	 NDlzMoazP8UeQ==
Date: Thu, 1 May 2025 08:18:27 +0900
From: Mark Brown <broonie@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: lgirdwood@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Regulator deadcode cleanups
Message-ID: <aBKvw3KEikfdQbn7@finisterre.sirena.org.uk>
References: <20250426175143.128086-1-linux@treblig.org>
 <aA5Ad6bXfH5jPiss@finisterre.sirena.org.uk>
 <aA5F-_kJO0jFgKpQ@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JQcwiPjO6V0+qoNA"
Content-Disposition: inline
In-Reply-To: <aA5F-_kJO0jFgKpQ@gallifrey>
X-Cookie: Well begun is half done.


--JQcwiPjO6V0+qoNA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 27, 2025 at 02:58:03PM +0000, Dr. David Alan Gilbert wrote:
> * Mark Brown (broonie@kernel.org) wrote:

> > Please do some analysis as to why the functions are there, don't just
> > blindly delete things.

> I'd appreciate some more idea of what you're after;  each patch
> shows where and when the function was added or last used.  Some have

Something that indicates that this is a patch written by a human rather
than some automated noise, that considers things like API usability and
coherence, or what people might do if the API is not available when they
need it, rather than just mechanically churning something out.  None of
your commit logs consider what the code you're deleting does at all.

> comments saying things like the devm_ version is being used (so it
> seemed reasonable to me to delete the plain version if no one uses it).

Deleting the plain version of something where a devm version exists is
an obvious example of making the API less coherent and hard to use,
managed resources aren't universally appropriate and so you should
generally be able to do the same thing with manual resource management.

--JQcwiPjO6V0+qoNA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgSr74ACgkQJNaLcl1U
h9CKRQf+IxyOcYOZZEVNKf1ejElUu5O/iSUv9jTea2VN2X3zO01ywMLXKqm68lN4
LCjIFO3b1kHwLnmY6fObyc232D7I7PC89FYGdT9vDvYihfhWoflxUi/jsDmUcPuG
FRQhTw8fbef74yhDRR9T0DEfKl/7wUctIcnShxmKmDon9OcSa6DEOzJ/FdjoUb/M
uPhg33bD52NH20iCekk5NKXtUsD6niYiC1NpMvJGDJXmFEUwKyzUwganHT03R28g
9eE20N4ZaJgVmOEso5+X+Mdudunk2Vq7Zd6FtwPVl5BeTL4eSkHBXmpLaebtfZ8x
HHEIQsGPGtP1AHE1qtMXSkU+w234sQ==
=ej+7
-----END PGP SIGNATURE-----

--JQcwiPjO6V0+qoNA--
