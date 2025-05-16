Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1006722A4D8;
	Fri, 16 May 2025 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398643; cv=none; b=MH72DTTympftfsqv2HNzEkOJTJ58oPcXHxXk8nOG31zIVVAPX22G0hD3swmPZ/wgPEqf39vLDs/OVUYOiBYpA3orzMXIcTRwP6LQq/KNKpkq/ou+vhaIHbROh75WELu/BlI1M+AEST0O3c0z+mXfhb4YoMAMZmXCzdBUQs+ucS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398643; c=relaxed/simple;
	bh=nAgXw+YQbxhRZFYnuc77tuWCxwF6uk296zESBMcf93o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCznsgNYP74ob+jW7IjwTmBcwXF6vmFJ/eu+Gh+Lns/+Nn9WaBLQOvFh0Aq7OLEmMKz9sJKXoiP9kL3QQ3ULnRKdcjeHiVgRnaY5kzqZaL3sW15bfIc0OrFu8pSWiuBQh6qaclGH65/pUCM2wFK3JCX5szpMOTILgBzBRWfeocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9cgtuN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9cgtuN4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0397C4CEE4;
	Fri, 16 May 2025 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398642;
	bh=nAgXw+YQbxhRZFYnuc77tuWCxwF6uk296zESBMcf93o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9cgtuN4dV9cv9KL0jsdldegpsqMVYRi6eZV3mOP1Jy5Hb2egXYlP7hSJLmrROswg
	 4999aw07AEPYFUIrGtJCLmuRNom6rrR6BY298OZPGmeR/b20AY+eptGf2kEV87UGuB
	 UyFJyt13QmLAGHzj533y4H1f+A11TZVoCgwwOwBADYKF7/mJINDok+yM80hWhlUujr
	 3wbsJvFvaAH6717VbShpNegIUb0hs4RpLs8oyrhx8G9UMOnSsNn5PcVIGTcRzvNV5n
	 z0oKkLLY2Qfzawa9Nkmb8Tm6+VaLhnvtWoRuK9M9YQctiubcFGCUXXvPs5X9lUKd+C
	 5P0et9augmfAA==
Date: Fri, 16 May 2025 14:30:39 +0200
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
Subject: Re: [PATCH v9 6/8] regulator: bcm590xx: Store regulator descriptions
 in table
Message-ID: <aCcv7zfhnN02qgNJ@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-6-14ba0ea2ea5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FmxIo2yjllB2LOAn"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-6-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.


--FmxIo2yjllB2LOAn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:33PM +0200, Artur Weber wrote:
> Instead of filling in the regulator description programatically,
> store the data in a struct. This will make it a bit nicer to
> introduce support for other BCM590xx chips besides the BCM59056.

Reviewed-by: Mark Brown <broonie@kernel.org>

--FmxIo2yjllB2LOAn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnL+4ACgkQJNaLcl1U
h9DALAf9Hf0JBvTfw7cBAVrQsNt7AOoYFV11noWtTB/xwe111Eh0jS+3Bfo+cKGY
f7WJQq//NR/JZxdINBfYT9JJGd79mD22CBnCjYc2qZBft12vFP3mQNAtg48t0f3S
yCkObJ0tJQSXI+T9oYzsb+C1TQUIIyeqtgCqLTe5dcs75XEFsrAdko23kz6U1H58
b2tMYg83p1JdTKqO1ZwJPYU56hIvMp6VCBv3lFbPeIfU41Sbg9HQDchMkd48K01j
h0srVdNW4tFdLHyXP+mz8vk6HxKv0Bhc1wYbte/SDLHNrAPZ9ubQY7254WKSNYZH
IvEadrR5HLJKJDgOu+72B8h2MG5W5A==
=juSo
-----END PGP SIGNATURE-----

--FmxIo2yjllB2LOAn--
