Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81901280A20
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538490; cv=none; b=kpXvVPnUXrCmCv3SIlPLmIpmpQKlVSiIbZLH22TA3ndxCfSidFsoWaswVtcH72tdOfSkjlbXOMXF25J/RIZRCqGWSrb1ULdBW2EuoCI+Wb2R/gwd+MgtnEJOw90qY70X/4kI+RrZtnzG3Poh13f19D85izgIIOUAOUTYDr+85Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538490; c=relaxed/simple;
	bh=8TSz1OWm0B5U3QCt1Nt1q8Hqzz1qhQA6Q1C1IkoBljI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LigPCElaCfxoMItQUrn0D83gLKBeYFjc8kGsHRvGcI8tkuGtFMsoZR66uCzly8OiFcrtCbZQbH+DWuP7Jp4zWFNfl9XMFzT344vUZbY8HblQANxDsVyyo9Sslmcc0g0/9p8JH3NAeciUU2OhxmNfZEJXnRUq/gp5quaY/gqOC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHYlge8t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHYlge8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998EBC4CEF0;
	Tue,  6 May 2025 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746538490;
	bh=8TSz1OWm0B5U3QCt1Nt1q8Hqzz1qhQA6Q1C1IkoBljI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHYlge8tiqB+KlH2m3iRRIlcW7oOd/GawTHhbnZ+dk0CxjR3mJWg0RE6AV/67UzCo
	 /YZnGumJzlndLhFE2rAYRGtmADQWML+p9FRXUERZAcfAJVuZoRe9cpjYWZZgOw2891
	 ksLpNZ2Gv5QKZrNGK+ICKHjHIK/AWW4b0OVruveyOiEo+wUYz3MLrdGaNifobskq6p
	 QTm7dCkHVd2CRO7tjJTmWEoTeqspOcvpZlQyaZBdsF40U2FoVEz6HNQySfvfTrZvSj
	 ORTvxKVIYdyTiYt8bf1gdM+2y5W55ahX8Df/Te4i91ZlgARJ+YB8ibDtYg5uC3CoIu
	 J1qxGaOU3VQJA==
Date: Tue, 6 May 2025 22:34:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, thiago.bauermann@linaro.org,
	jackmanb@google.com
Subject: Re: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
Message-ID: <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
References: <20250506095224.176085-1-revest@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfNXS5zD4YMjIjfy"
Content-Disposition: inline
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
X-Cookie: Well begun is half done.


--WfNXS5zD4YMjIjfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 11:52:20AM +0200, Florent Revest wrote:

> While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR and
> VM_SHADOW_STACK share the same bit on arm64. I think I gained enough confidence
> now to call it a bug.

Yes, it's a bug - it'll be an add/add conflict with those coming in via
different trees.

--WfNXS5zD4YMjIjfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgaD/MACgkQJNaLcl1U
h9C7Dgf9FVH1H/mNg1egXWX9AKNdUe4P0CABXFDY7Ba+WHdeijmIWGjt+SIVmg86
oECww6n5j8RUABEu5Rjt6gR9sV57kB54ytlT30XDu/WgjAXEk/qVSsKurhzcv2og
9o50N5VpiOxRQEH2SundwnJLdoe/B+4+/ONS+T3XZIxo0UGvIrf2ltoNiV3b5K9X
86d9rBpZoJyftPCJcskFBzzYSIgw+CTMnaINAxBE70V6Cn2vOsqdDsSiecHRV/jj
V6HuFUh7oCGvxNf64s+CgWCKQYbuCcQVGtYU8s9D3KSIKsQ0ghtOpoGJxoGKq3Rc
+ic+5Ul1ak/mfMfZvoBSp4FAjZeddg==
=YB//
-----END PGP SIGNATURE-----

--WfNXS5zD4YMjIjfy--
