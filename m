Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3C1C84CE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749657073; cv=none; b=XmDvl2GVxGXL3NtEvnuH7vd6VyPzbWJt4c7ro6s09CBZ1ahEXg5EZ3WmP56OngLsuOKxa0nQOVGG9O7tBLxt7ScU3kpG+C6z4Uj49aM5Y3m5dqXHxLphBlr8s4DkStZWT7nyYjidD+tEZxYuDKgaDh0Bu1OR7LyyanCjwa7Me2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749657073; c=relaxed/simple;
	bh=ChSNUVxFtx+wYinAqz6EG6K36rN3iauMcmFkc5ToAHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CDdEGkRuYrvM4uL1hD9JPKx0ZtBcbAzYfTkykP3WY1KQUojSOYurQJkw8AGxVnOaMOV1Rls1B3Ue18aNsQoNay1J9TzJdYPuRzXyHYtCNboKUgowukSDl7RG3xckFl0HHQN0TCSLy5rjGB03d2t5/N/d9eNtxUr6D6KhyITgzIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R3bJdu6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R3bJdu6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9CBC4CEE3;
	Wed, 11 Jun 2025 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749657072;
	bh=ChSNUVxFtx+wYinAqz6EG6K36rN3iauMcmFkc5ToAHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3bJdu6AdPM4A7YDrlYN5JyWQIMAhVg7y5ZO28UKkatL2fukCeREnf12+AgIr0jHQ
	 RX5SLdxuy2Z1xjnOjUEKREayHeXTp87hVneG2MunraowOH5wjHFmbOu0gGnadi++OO
	 rYRkwgQeX/OXfIDetDT6GZyB/IzN/HTlLCJGuWKc0+m3d1SSxf/YE4dHLssAm4+fcT
	 mnXYt5NcUtCGnDWS+vdwoQcRigOa2mz9lt3hSiWKXSkUoHtBTNB/6VSz88jy2ZL46Q
	 sRF0VgyaGsyi/ALe9RG7hORY0/G788mBJqy5mzSdPyE98LpAuPo9bfqIi4XW0c4HPa
	 GEwM2R50ki0wQ==
Date: Wed, 11 Jun 2025 16:51:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 7/7] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
Message-ID: <49b4a106-2ddb-469d-b556-f8f63577a167@sirena.org.uk>
References: <20250611150417.44850-1-yeoreum.yun@arm.com>
 <20250611150417.44850-8-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3aAzPfVUTizjUcAZ"
Content-Disposition: inline
In-Reply-To: <20250611150417.44850-8-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--3aAzPfVUTizjUcAZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 04:04:17PM +0100, Yeoreum Yun wrote:
> Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> check fault on store operation only.

Reviewed-by: Mark Brown <broonie@kernel.org>

--3aAzPfVUTizjUcAZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJpecACgkQJNaLcl1U
h9B2QQf/d+mWZ97O/areQImQSq75oC0pir5NqGhE3ks+INAvV4Fij8ENpSl0kxDy
rag8fm1VD6d1qzB5GjVwTWwEe1CWNC5TD/KUuGsGXwQkb8sBwJEy47CrfpS1Wedw
9WTqAQ7LOxzRcndgAo4vhETFB30Mw3Utq0MxC4TuQ4sxvy9RLI/nsXjAg9Y7q6ra
GH1KHDCW09fkKT91PbNZHzcWNDeIuMp0o05iEw5+RsO1Mc9muJDmwSEGHjL4M+IK
N55Z5doe8q8I3JoVt3bEhiPTgi5UUDlv+pwkwGxZxhLfg01Gqb1tJJGgg69yNeqt
PauxFqN+E5yeoR0WnatVADkwG7Coqw==
=y/aH
-----END PGP SIGNATURE-----

--3aAzPfVUTizjUcAZ--
