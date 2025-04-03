Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF58190679
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694253; cv=none; b=uJGfoKerY3Kr/O9LMQpfGOfFSoKjANNU4bywVA5e5ZIOZ51T5vZ/QdGY7ypAnEiZG496lN1OTDhB3W7aXRoNANKCiASzi30uyDRYkXp6oJqZLn/ndWRwBqMC5SCjEk4IlwP8f+OFenyqrn6ABy4LLv/ld9Y153MSUTNfryEsOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694253; c=relaxed/simple;
	bh=e5OGCFcEpqzuif9wQ2tcu+09Dt7ICSXT7RREEhwMDQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKWEuDJQbt9mUbrAHfUGciG/kHPfwlA30mnFkoT3VwkGao1qZXlqrRmLMehQraljUy2gQv6Z82h129YrC+jm4yL1A8+PhhRJwQMLxjq6ZB7PB46OXgNhCDMFuX7gAKx1iYPETAg2eQcrrwq3fZe92Nu/tTLDKPMQBPT6OqfvdJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHniWGy0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHniWGy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8BBC4CEE3;
	Thu,  3 Apr 2025 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694253;
	bh=e5OGCFcEpqzuif9wQ2tcu+09Dt7ICSXT7RREEhwMDQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHniWGy08SM3VzkrCsjO5kDAwmb7zAd17SAv6Szzia9xKmbah9q5IELn2wvRBZZWc
	 c1ifwj8JGA4pV8RMGOUQ+p3SPepp10dBuEuHhP+lvq1w54izU7QhuR2/+Wk7IYKKmA
	 l1on8hmGdGBb2aRhXXyDFmtM2rLRb1Y6SCnsqvPLfSqBerpPBB2CVVyxf9ZW0FkP4s
	 CNrhuhkxYLDBEFms+eEioogMZ20WZUaYfPec+NshjgVWGp69NrCmMogVc9nohkBRLh
	 SrDEN0D52DULSU93RybqKojuLkUdugi4H7jk7IDrSTVSNVau8g6YoJHEclAySyZgx2
	 wn3P5zST5cAlg==
Date: Thu, 3 Apr 2025 16:30:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH 1/3] arm64/feature: add MTE_STORE_ONLY feature
Message-ID: <0a430cca-a473-472b-bb1f-fdf3ed99da47@sirena.org.uk>
References: <20250403142707.26397-1-yeoreum.yun@arm.com>
 <20250403142707.26397-2-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5U5vDY5w/KdPL0Jc"
Content-Disposition: inline
In-Reply-To: <20250403142707.26397-2-yeoreum.yun@arm.com>
X-Cookie: Logic is the chastity belt of the mind!


--5U5vDY5w/KdPL0Jc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 03:27:05PM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature and HWCAP.

Please add this to the hwcaps selftest, and to elf_hwcaps.rst.

--5U5vDY5w/KdPL0Jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfuqaQACgkQJNaLcl1U
h9B3kwf+OzHCE0Bl2Rnqj0KGk7Yv4hxlNu6svK81MlbHOecJtzdKFd9Lcu9osYV+
bR8w7wXTxUjMoKLIfl5R2SIQcDuzTuWWQf2kLP0qoeOB4gDMLpBG/GfuJZB/xeyr
1y/JllLinWHdu05f16QsC1s//i+fVrCB3MpoN4X40pcLtwSQrIYn3atD7xztLd2Z
awccwLvmyCx9B8p2Zne3YBpdInixrixwaXBUQRhH3ayCdgRY4dP2y4tjoQnbW3DA
mzmfEV7btEZLOlNU8fqYjDYdufRGMrJr3ffbqpXhFf2EJIYFCrbDkYlAfQxDAhMi
Mro3jXA1TpaSK9ACOE7mUg69RFBqjQ==
=XvZr
-----END PGP SIGNATURE-----

--5U5vDY5w/KdPL0Jc--
