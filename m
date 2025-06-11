Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB52253F08;
	Wed, 11 Jun 2025 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749645441; cv=none; b=oQ36O0+KfZK4H4uEj2AOlwm/dD3eUbBEdSoh5XBMwSGNxUEiNsh6Q6dHCk+nAmftJLNwxQ+Q74xv9KfrAlumUYMLxjb02qO7u1SWvzaipshlPu2Zm02Oyqi25uRasBgAvy8h/IKFFGKjvztqsdEhrjC9MR7JEFEkcudSU8lb+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749645441; c=relaxed/simple;
	bh=pFzLi2GJiG2eSQGYZ/A84DHYRTuss7ATp9NGz/6F5aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PN0EV2AJ5C8hhSD2CIPFdfZmRJ1li6c8xY7SUbvHgc7Oxp/mwOM0DAbRoMKxXRFasc25DDrSmtyY8y9n6xvOCPAnufOJAWiN3IuH7f993KToCqiEqST5HC1tqB++LyBVTHMMmBqynCBQ9HBeeDaNNy/hIG5TeNik5qq85i/YZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXrkSJEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXrkSJEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D12C4CEF1;
	Wed, 11 Jun 2025 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749645438;
	bh=pFzLi2GJiG2eSQGYZ/A84DHYRTuss7ATp9NGz/6F5aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXrkSJEXnkAbML7FOF3UXngZlJeQzqon35d6caDl3yRuafAV0FOo2kVmCu8gVhaV0
	 1UCsMsvzBwYuqo++arlk2ZNCjK5CqykgXko2h+ei1PUI5sb/jz/KWFosNemWTDPdqx
	 yKhuf/T66jUSO5Aq426dDaVckdKWw4jgdVfUBblno1tdKipwgQs0YdDUaX+KyxKgMp
	 S0n0BklG8iAk6LjB7IcfVmEkYJTzjZOQXGIMomwy5ZC4Ql5iyLJOiCHYUshKIDaJwC
	 uqQBZWRxrBtYiMXjOexNLxWafm+ZXzwHAOzOPOzr3mi/abxgboXBDGD9TytnR6qJWR
	 z62IJkXHojaZw==
Date: Wed, 11 Jun 2025 13:37:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeo Reum Yun <YeoReum.Yun@arm.com>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>,
	"pcc@google.com" <pcc@google.com>,
	"will@kernel.org" <will@kernel.org>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Yury Khrustalev <Yury.Khrustalev@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"frederic@kernel.org" <frederic@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"surenb@google.com" <surenb@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related
 macro and function
Message-ID: <a2cf9241-12d2-484c-9066-de507c4717d8@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-7-yeoreum.yun@arm.com>
 <5e937cf0-3b71-4c17-838e-8b38595c153c@sirena.org.uk>
 <GV1PR08MB10521E68C886E8E6155AEE49EFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EjqLoC0faXEjduIq"
Content-Disposition: inline
In-Reply-To: <GV1PR08MB10521E68C886E8E6155AEE49EFB75A@GV1PR08MB10521.eurprd08.prod.outlook.com>
X-Cookie: No skis take rocks like rental skis!


--EjqLoC0faXEjduIq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 12:25:50PM +0000, Yeo Reum Yun wrote:

> You're right. but what I calling the every main() with srandom()
> seems weird for me.

> I think it would be better to call srandom() in mte_default_setup()
> which is called only one time in testcase...

That also works, just something that's called only once during setup
rather than repeatedly.

--EjqLoC0faXEjduIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJeHcACgkQJNaLcl1U
h9Cz3wf+OyhAzrPDMjSziXM2nkmPKhKanz+WaUWFiV+ituGYEEhjBrmyEDTgcBeq
s0FkQuWI1rJZGhRH6cXEAdGU/fiD7dAfmTkDgYQD8Fo4mXFylamRjmxW31zJkMMV
5jeSJttEi7jeyP0uWPhk0pmY0dg48S0mPvzB83W43hBRfPe9WqxRv//JSCIofWl+
V8THka6GZODD//kKKSqVuhht135YEAUWAW+KHKygEHjlxkg0v+PZT/dnxc9pi35l
MGEAFKcisp5/vaRWOIpZuT8d7tHvZWmHsSeXPTJ2BkjeNZvWq7hjAllCXsdhdzMh
lN1VzcMS28vByfUjgdHaXiS7WB4GBQ==
=QRq9
-----END PGP SIGNATURE-----

--EjqLoC0faXEjduIq--
