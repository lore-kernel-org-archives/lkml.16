Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2061E51FB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772825; cv=none; b=peeHCOPbGfgwVlDCQ1IZ5/+zoygNL5+a1nzVo07LoqiYsxGeyqn98NibD7MHwfTvvE89jtXHT0DZBtmdVDfPFRG52nWhV87WkCMpZoSQV+FcAYh7StSPrnAqPKrACWNobdkvyZisfCRkNgG7Mx08iAnRYCoKsrfZJOs2FHdSAfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772825; c=relaxed/simple;
	bh=93a7crTZlqKDMjN5KTloXonEd2PPWUNDkKzR+C+Mo+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awWFxy0WxsJSfaePgRo2knVxms4c7zYBv6iS9DD8dyYK+Oe4dBLuQW0oMjvfsyBDMWiVVGjGm4P6+Msm7sn2uQQE3WpsafT6/pzS++Q/9ROkYmv3PwbTsFUH6ps+xfvcTHD8v4nfO/AyLOm8iT5lHgoi5QT7+n4Ps2m5/YLC+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tu8qJbap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tu8qJbap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F113EC4CEDD;
	Fri,  4 Apr 2025 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772825;
	bh=93a7crTZlqKDMjN5KTloXonEd2PPWUNDkKzR+C+Mo+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tu8qJbap36HFmnfA6jGTd3EKeBOK83E1Dd1e20nwXEllxvBtxHT+u01vjhBVIxUBX
	 tNDCTJ/Rp8yrpF5M5/67bcE/FXvVMIrDnnw+yie1MbkAve5bPucHm/vNecSt3CQDxF
	 CNcq+R6GFWmlb416GJ176e08p0OwgNz+9MnWvvJAzO2eBYAAV+DnJPLSNhOC/bCdP2
	 rSk/I9dzlFPCuHiO/CR8P7JRoxBi+egZ2fBd+yzs5NpHcJcM0LfvUS7pG76KeBfFjO
	 /qOl2T79FGLXqcCYNLQowZGBD7Ou9zh0WRhVHTZ0O7FoDauyGHlAMoPP0dmzssKc0K
	 F4K2gRIjg6OtA==
Date: Fri, 4 Apr 2025 14:20:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Message-ID: <0cf47dd3-f02f-4872-8a44-14b6a968b3b8@sirena.org.uk>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
 <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
 <20250404130316.GB29089@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h+RcjSQLM2x9OHrW"
Content-Disposition: inline
In-Reply-To: <20250404130316.GB29089@willie-the-truck>
X-Cookie: You will soon forget this.


--h+RcjSQLM2x9OHrW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 02:03:17PM +0100, Will Deacon wrote:

> I think you made the same mistake on the 6.1 backports too:

> https://lore.kernel.org/r/20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org

Thanks for spotting that.

--h+RcjSQLM2x9OHrW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfv3JIACgkQJNaLcl1U
h9B1BAf/XmJVthgKmdYLjKgCmCQpUDyevnL8xAXWkeVo7/ANogep7E39NQu3uzLb
JaEtpLxYJe55nLgqYwD6Ggud9+q+Dcyh/LlVkpPueFGoGUTVDcxbDZtCUJANEfjW
TuI6h9oG2ZLlsNWFoWYVyqLPIoOFhm5wvjIvJBcWckyJHv52tAaeOEyHwmHDK4zV
Fh7Da1aR/5l3x/O7VtvnJ0O5nDiZL/BQtpi0VIJCZmPc/z0CMYCAXRqUcjnUAAFN
2yONNBwkYnwqdMZ0s+88JEQDKe7eq6NZjAdj7yFojZxoce57NcvxnpK9vOxBqivu
49Cb8+JPWvyIn1IhNiLK2PyTr+vT5Q==
=uED7
-----END PGP SIGNATURE-----

--h+RcjSQLM2x9OHrW--
