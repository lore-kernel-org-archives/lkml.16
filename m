Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3C1E4A4
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280629; cv=none; b=TqACqUh98g05v/i5tI7Xma2tMTAwKDp1jBHX1PxjiQU2PeSJvs3iqNiuhfMAe9STN1wAxT8+e5LkHGLMRcWLy0R7PvQ4GA44Rgkbqztj4OJsR8KIPTMZe8o+IkKe63KYt8KWcJnz0WMAHEoqENPJrRIcJ5eosTD2FJMLBzVnzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280629; c=relaxed/simple;
	bh=eWp3/7u/YGZGIa4esPL/qdeKIFhCL8Y51K+5X7MdHlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdN6AgbomUv06mMaYORtUgc7R7wXtkGZWNlvX8xEcIvOazYNAAFn+VEriiiirzdboOlfYxoXMDa6MJ8rn1QxT2OxR9/9j4TWTmaeXPngL7SQqAyht6Az9d/NkbmPbzk9lHm0eIrQIv9zFuDD6VxKSH4wosdeqlbTpL36HHpBrww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9gqu24N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9gqu24N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB85C4CEDD;
	Tue, 11 Feb 2025 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280629;
	bh=eWp3/7u/YGZGIa4esPL/qdeKIFhCL8Y51K+5X7MdHlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9gqu24NHccx3CJwhPeIbz+oIvdMFCOC9QlPIZv22uUw4yW754WoHr3i6ZRQ7Pb6m
	 q50KRyWph+Zz2w6RHWGtNDzciBzuqtax11vFLj6waBLqD8yq4LVF2Zg8H3zoSuKj73
	 ao0nLUmWKSRMLXkHzCeA5skOaDs1bGgrR8JYmMbEv4kVAvfqnfJWhznOnIhRVmvXSp
	 1xzy0pFEEduTAyGLg6AJshCNI6viDs7iGFCqQMBziUTRAwlqe3Jsa2STefG4nl1Qor
	 NZJy94G1QGS0EdxV04rl8su7yf3Kv5hQfsw0OPsqdN2lJ4VFwuCltqr72HYz81pNDZ
	 HZXe21VwM2xzQ==
Date: Tue, 11 Feb 2025 13:30:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <1be1b5e9-9aa9-4f1c-9cdc-c4bf94f2dbc8@sirena.org.uk>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
 <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
 <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
 <Z6tNiIMIhN5fPSJM@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FpVZgrr+qSAHu3wx"
Content-Disposition: inline
In-Reply-To: <Z6tNiIMIhN5fPSJM@J2N7QTR9R3>
X-Cookie: Printed on recycled paper.


--FpVZgrr+qSAHu3wx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2025 at 01:15:52PM +0000, Mark Rutland wrote:
> On Tue, Feb 11, 2025 at 12:58:10PM +0000, Mark Brown wrote:

> > Well, I was actually intending to send a separate patch given that
> > otherwise it ends up looking like two different changelogs in the same
> > patch and the diffs shouldn't overlap.

> It would be simpler for others if you sent a single patch that handled
> the three hwcaps that we failed to wire up in commit 819935464cb2. That
> way they only have one thing to track.

> I don't understand what you mean by "two different changelogs"; surely the
> commit message is a trivial variation of the one for this v1 patch:

My first scan through had made it look like there was more stuff missing
for FPRCVT but now that I go to write the change that's not actually the
case, it's different handling of the different ID registers.

--FpVZgrr+qSAHu3wx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmerUPAACgkQJNaLcl1U
h9Canwf2PMWht5FD5jL70uPgRegmvsxuqGuFL+om4rJ29M7MvxSFKsMWR3t7DEAN
sCxfPXEz6vW4+pS1w2nadqCMnyfn6dINYQwDeolVIn6apD8lf2SlzeY+XrZT8YiH
tJxBHYnjOz3Rk0HG8vLtp9eeIDsQ+NlUXXzr2658POQ3FLR3qI6Ekp7jzd+KEpbi
OjgkUWf7zyvciwMwpzXmgN15fTedVixZRYNt/cwC5d286vVcBOi8M5PGzYR2Sh0i
CevmEdOi22rMmTlR3ObkXMlp7DEK3tZ1VunkBFPn6h94i+A4ZVwPRf2vbzQNGROJ
Q7NRWHwGCb4dDpkR2GBbcDULF8tm
=qyk9
-----END PGP SIGNATURE-----

--FpVZgrr+qSAHu3wx--
