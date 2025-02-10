Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4E61ACED2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214903; cv=none; b=SdgQ06USG8C+z8gCZ3nJxU9f2mJ7Kkb+dJ6/InYc4l/L3Czt4DjH8SGGeSSXDPw9dXuX1Bux6iMccCaAoR/UCrpJucmXEbLybaRr0vWOOM/u/+ILNd9TAxSsxnG6KRTkQc6RaI5nI8WFDhg6JDeISkhs/YH4s5iZ0fMQ0nMDhwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214903; c=relaxed/simple;
	bh=6DCRnBCL901/XVVau507X6b9q7VHuRUUYVnPkWTt7S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUPc5RWI1rtdCm2lvSi1ACSwfblf/Xq5f6gqs/n+Bi5tMj4alGbOLFZB0HchqMg5O5Ah4kOWzI4avg8TiITXuSKAAbsW44J94R7/uKmi/gLAeR8wOtK5kV/8qS6QjiE5KgR0pq80atxdepFKhx8lThSrzuV3J/6mFDViHpiuf3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZuQEoJDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZuQEoJDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61490C4CED1;
	Mon, 10 Feb 2025 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739214902;
	bh=6DCRnBCL901/XVVau507X6b9q7VHuRUUYVnPkWTt7S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuQEoJDCP5K0u0T2iPP5IpLhJEf7d6hpcn3ToGfFguQfQIoObJLphMqhllsTwpO/4
	 nupvcCk0IcPBkgRBkP/HlYHnLWNGfUQJlb+f8kDT8Efv4lW0qHBW0SYvEpsTQrks2V
	 Z1FF+bFCdHTDzI/aE6wUsMhdR5Uvex6BL1dfQZ8Co7CbqILl0Y8whtEqdFxOi0UQ5n
	 M30k/VMealufxYF6+zvPP+qSqZRzJyhJiJ+rkegOd8jj3rSOaAlfJO7d8nsxjU1muI
	 J7JPMwbUgu91CTlNPH2Oq85dug0PyJziAsW1nGCRKxso/gJL9h7G3Tjteo8WfsXVfZ
	 XFuTjpblJd61w==
Date: Mon, 10 Feb 2025 19:14:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2+LFPLCGeXCcrnFn"
Content-Disposition: inline
In-Reply-To: <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
X-Cookie: A beer delayed is a beer denied.


--2+LFPLCGeXCcrnFn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 05:49:33PM +0000, Mark Brown wrote:
> > Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> > userspace") added definitions for HWCAP_F8MM8 and HWCAP_F8MM4 but did
> > not include the crucial registration in arm64_elf_hwcaps.  Add it.

> Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?

Indeed.  I'll add that separately.

> I did a quick check for suspects in that commit with:

> | [mark@lakrids:~/src/linux]% git show 819935464cb2 | grep '^+\s' | grep -o 'KERNEL_HWCAP_[A-Z0-9_]\+' | sort | uniq -c | sort -n

> Checking against a tree based on v6.14-rc1, it superficially looks like
> we're not missing any other KERNEL_HWCAP_* bits per a coarse search,
> which shows three missing entries in cpufeature.c:

> | [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/kernel/cpuinfo.c | sort | uniq | wc -l
> | 112
> | [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/kernel/cpufeature.c | sort | uniq | wc -l
> | 109

> ... but maybe that misses something, and I haven't checked
> COMPAT_HWCAP(*) or COMPAT_HWCAP2(*).

> Could you please go check if there's anything else missing more generally?

The other two (on top of FPRCVT) are CPUID and EVTSTRM.  Both of these
are set using cpu_set_named_feature() which doesn't use match your grep
for KERNEL_HWCAP_ in cpufeature.c but instead generates the constant
name via token pasting.

--2+LFPLCGeXCcrnFn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqUDEACgkQJNaLcl1U
h9D1vAf/fgog2XudEHzm95uGgRT8Er/xgKvo2K85ZGRXpZE1ZTqaecc27E9f2+O2
wKdO9h/Ba+DMfOKUhHQHlyV8FHtw+LVgd8Wq2jrKcjxkd6k3xjt1K7udeDeX5x+0
xzP35gU31I4idBTDXM7KAjx/HCv9vuksAzfXH0QdPy5G9t/d7OUGP15sxIzAn8tG
vZrHj8O1IDlKcZtbwU1aOpK98KM/OOTVyCgRDzxzGtMgf/2kW3UP+ZgSo5oKJI5Y
yERJjKW6Mx0GL07aupnyCmCZoqAbuEGtmeSgX/4cuv6Xz45JblEBWv+Q+ZvBxYT4
BbzPGHs1p+ozWol+S6o8XrB5SOSldQ==
=LIhr
-----END PGP SIGNATURE-----

--2+LFPLCGeXCcrnFn--
