Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9366F215793
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278694; cv=none; b=XlvcTD+kv7m/BRjGQ6zMXLtFLICYMvRqKawTc8EPDMwSWJSe+S3C6BSacAomalc/VKzDLYIJpxNSHZphl0ha5qh0pAk5n5eykKofNdswXLNV1FtQk6zSA5b5K/WMx3lbqE27U32fbJgpoYhn+ZQTmfhiYlp10qe92rgmuzFGwm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278694; c=relaxed/simple;
	bh=+towMT1nCuVs7DFgHgZTIfGgiiKqozkce+4klGi0s9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFXhS8oE0lYmVpgeLPP2U8HPDbMV/SRGQp9p9+P7MZe+6Xn5ibyqhXoBo6BpECVhoCm5U7xLGGDWnExSkejJ6g1u28hUmluGyeSxcktjNAp0V551dVfPCAiw+OGRs83kr4l0B/Z91qpi0l543H9erp/T2wGOb1DNGc2nFqCE+f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMUZ3WZj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMUZ3WZj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E10C4CEDD;
	Tue, 11 Feb 2025 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739278694;
	bh=+towMT1nCuVs7DFgHgZTIfGgiiKqozkce+4klGi0s9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DMUZ3WZj6egUmoREWZ/i5BecZ/SF//YWj68XqzGu1zV+XnFL5IV5tfvKBJR2h8fIG
	 kleJ/Oddvmj1TDVbAFCb/eUl7+QgprOX2NQsNDecwBHjUTJL7QG1LynoofzU4fWRcl
	 rhaqVrGBzAy3BA2tzGYOkabptSUcxl7qneA7RCbIwYZhyS47ZVh9ER25wHEZeB2gu3
	 mgnyKlv9XPn3btcLrlGNuy9ivTzXc5i+rrNqI4g4UJ22Cpuvtk7u3EA1OUWO26+Eg2
	 mxK9OT+OJxs0c3UKdgrfGSGahhZOIqFdTEOO8RHMG5f34YkBYGxxIr/IgmVFlTYFVD
	 ZlffazOPxk9Sw==
Date: Tue, 11 Feb 2025 12:58:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
 <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rD0p0luEF5BMl3yP"
Content-Disposition: inline
In-Reply-To: <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
X-Cookie: Printed on recycled paper.


--rD0p0luEF5BMl3yP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2025 at 11:37:44AM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 07:14:58PM +0000, Mark Brown wrote:
> > On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:

> > > Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?

> > Indeed.  I'll add that separately.

> Given that KERNEL_HWCAP_FPRCVT was also added by commit 819935464cb2,
> I assume you mean you'll send a v2 of this patch doing that.

Well, I was actually intending to send a separate patch given that
otherwise it ends up looking like two different changelogs in the same
patch and the diffs shouldn't overlap.

--rD0p0luEF5BMl3yP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmerSWEACgkQJNaLcl1U
h9BKtwf/XoPWbuG6MzQSQ1e31PolrljHwu4itDeKvhdyeP8GcDCDRi33tSf+K2ja
KauZo++0ZKaq1Ja+MFAToO/len+b3BgCOzm0rCuiFhhtTV0ClkFun8hZ1B0FbHbC
53X8vn00Agvf7SEmOPtsmTM/FJTOMn421x9FYgM7xunf1YKj9wGnt/V7/VrBZTAm
LEPUDKO6uPEQk4xl4m3LRBMHrqignAXy4ScZ9YgaIyT84cks0zI+m4UcLtIpnHsC
wZ2o6Zfx0wu/DMUvESijSvUjiLeIhbk5YINhitBmKUYHV9ECgkBOonZ5XDmrrZmc
c+8oJAemdZYCU0ngIvowVZ/ecC9EVg==
=/UnQ
-----END PGP SIGNATURE-----

--rD0p0luEF5BMl3yP--
