Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D8151999;
	Wed,  5 Feb 2025 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758121; cv=none; b=sdMJrs+iln3a4sReyzsDejN7QapnQshLhgRHVol7BwjDo8/oHhfM6yjx68WDLuOeSg8UJNYADm7+QkkeTX4dcvzIcWvvzQC9RLWWIPM7JAAdS9V9yQNgPXQqBub7t8JkDHXtK9khijMRLkdesQzpFlzaTXa1twAbOuE9VTI6o9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758121; c=relaxed/simple;
	bh=MN7sWt5AGpvSOBdHd/5/D+lec48AtCPQA8Jrvhah8M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuPj3uOwsI0y1RhHCWX6pFGbrttK3YEa/NfGwfbSzUDA2CnuYj0fbudx7RN5KGLdt71M7zPHLloe+wbcXXrqDPRIn0ZbIW+RO2vZuMAb+rMMR4OAhH7M0fotuxUUnf6007S8FCO8J1AnjZNXLZT6cZ3giGDwaeqggYfeh9AK5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uU5doWHS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uU5doWHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0417FC4CED1;
	Wed,  5 Feb 2025 12:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738758121;
	bh=MN7sWt5AGpvSOBdHd/5/D+lec48AtCPQA8Jrvhah8M0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU5doWHSiDxmh53z3okDYpb6FzGNI/Xt9WX5cqd9m/k+2oH+IGmRqIpTvuJ2WCJtZ
	 eO03MA14NmtPsyqHMbl4b/42Adu0UCuYJuYiqFQ+3RFawpbH50gQJMV1vQ2JbTcg/u
	 ixWQe4uUP8xMcOasB9xsN98fbQhwCCjSteTbeSzWzdzcbeuyZv94zX8yIuxbpWFYS0
	 tx6tRDOfTpZHMsN23HkYw95ap+P0RBlGNltk0u3WeRHqaA23UVKIHcbzR0ZkyPXxiY
	 wrq7OUaqJOT9tPoMf63C0ajFKbuXUcsbnQTNZvn8jK0aPOga4kRIMwil/7d7cNpL4b
	 /BvSV3ZfCoAdg==
Date: Wed, 5 Feb 2025 12:21:57 +0000
From: Mark Brown <broonie@kernel.org>
To: linux@treblig.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: max98095: Remove unused max98095_jack_detect
Message-ID: <dc0bc826-6105-49f1-8a59-bb4881e9143e@sirena.org.uk>
References: <20250205014458.486207-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OYNyK4VerNcfAb9J"
Content-Disposition: inline
In-Reply-To: <20250205014458.486207-1-linux@treblig.org>
X-Cookie: Earth is a beta site.


--OYNyK4VerNcfAb9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 01:44:58AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> max98095_jack_detect() was added in 2012 as part of
> commit 9dd90c5db040 ("ASoC: max98095: add jack detection")
> but hasn't been used.
>=20
> Remove it.

> -	max98095_report_jack(client->irq, component);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(max98095_jack_detect);

No, this is exported for machine drivers which might not be in tree.

--OYNyK4VerNcfAb9J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmejV+QACgkQJNaLcl1U
h9BCRwf/bbuqYBPJKT4Eui7cAQlEP9qEYUJyycxL+M72ZHv/XWo3/ao+6gMo4QAx
H2cLlFUSZeKi79kbnDMJ8HTUalwMpoZHerglRmxqe5ttS5wx4VCVe0ShmJBN3gSW
t8DCovk3DB6BvOZYTRc/IUT5a7NWXTwSDNZJNVsBJkHvEkXJyb6ZPGMI0PJ3lYiX
+bUrGr1XdmwuwD8nfyb0rkJVIAdJS3BCK9Dgqc3gJC5vL195mUudVOvtYwdtPfu+
AL/O3ApFDfDy4hnyz15PeNd5KaKOwk9MglTaNY+U6PLTzCQ4x7ravp3mHTH8k+6n
l/fLa+0gVNQs5Lg9ZsSIFgu+olHSHA==
=Zs5n
-----END PGP SIGNATURE-----

--OYNyK4VerNcfAb9J--
