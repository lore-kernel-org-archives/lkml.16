Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF8228751C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648006; cv=none; b=s8dNOvmNEoDZjWc1OiT4uKQGuLS8DTVQfs0qhai0E2Elbn7sTugfLZrKsZ7yeR8ZmHe5lYuNvO29AIUGGM6iKpBKxqEpZ3KdS4nEbkrsLQdWFJ2/fg5KmHiNrmXzMtwFUzqfOPMS2ykI4KxDAYqDoEln6X+rM8yCAvZV8GE6bt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648006; c=relaxed/simple;
	bh=UzJeNJW3RMDMtfEx3QPDFOmM9L8mS8UXAa35yr675nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYEzU9p5JttOO6Cs862rqwKmDVZssgocD7eTWMQ8W8W+ScqPxE9bu8Nid4XvwaRWrH1cxUv5uMn2+z4e4EnTChXMadafQ8WWIuuuOp121AGh9gsjDby4N5A7o8JKIHNAFws6hpD67h6umQ7i5mS7qSZIqSgqq2AORqz5IJ8JpPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWAs19wN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWAs19wN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9644C4CEEE;
	Wed, 11 Jun 2025 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648005;
	bh=UzJeNJW3RMDMtfEx3QPDFOmM9L8mS8UXAa35yr675nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWAs19wN6rphWarV0Tu4IiG2hpeYtuqQPID+BN4Q+yxvw215nxL3B//Rw4we/J+Qt
	 kB/jcQhTiDtdss47vSFmPR8RfX8rsmjk69eHpSZkJUxqDE4Evb55GqZfx+NuT2id69
	 GnJso48gs3GYq3rlnanjsLhMEORFva9HlsaMNwkxb4laTyOJUmRjs1TesWhxjr6J0R
	 qgdr76hmSuWoquQkQ0W6OEdC1Mp2d8oqTRLzNKCoJ9kvNp1HXR1MwgtQ3X869SgeVY
	 SIt4A3XthDtOBQy024bNS6KaMa51B+ytovl6psDsw+pqhJm/Z0GD9AaP4d5eV2PW6M
	 /7hrC0cUUBYCg==
Date: Wed, 11 Jun 2025 14:19:59 +0100
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
Subject: Re: [PATCH v5 3/7] arm64/kernel: support store-only mte tag check
Message-ID: <3a0ed679-dfb0-4b10-a081-db56583bffbe@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-4-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vUy5kMIj7urwy+MA"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-4-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!


--vUy5kMIj7urwy+MA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:47:58AM +0100, Yeoreum Yun wrote:

> Introduce new flag -- MTE_CTRL_STORE_ONLY used to set store-only tag check.
> This flag isn't overridden by prefered tcf flag setting but set together
> with prefered setting of way to report tag check fault.

There was a concern when adding asymmetric support that when adding new
prctl() bits might cause issues when libraries linked into a program
don't know about the new bits and miss enabling/disabling them.  That
doesn't seem such an issue here since unlike with asymmetric mode store
only mode doesn't turn MTE on or off entirely, it's more an
optimisation.  There's some possibility that something could rely on
only stores faulting but I'm struggling to think of a real use case.
Assuming that's OK:

Reviewed-by: Mark Brown <broonie@kernel.org>

--vUy5kMIj7urwy+MA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJgn4ACgkQJNaLcl1U
h9DFKQf/UVQXyYeS0IFPcj1QrNsvziBeCEJJzwQDnkBmFFHJ/XPZo6wn7iQFHdL4
zhZl4dz2MtmfyONRUsSfxxu15zotZI/oR7jkYXeqLoxflPYnT6iekVPaLESeg6af
duXG5FnmCC9XLQRllCNzTiax8+WY6sHIvopvERPXijaVEsMwQo5lKs9SovoFz0I0
LjerAQARmBHNChjcfzSD2pO1DriKYxG3QqGwCuDuYOmfGru8tqeDC3OaxqRPj0ND
nvVJoUrzhnhamYVA9Y3XK/5oVlmF3niseb2vY6n7H1DORkJnRkxUrna/spVk16kP
hSI5F/qT4iaPVE+W/dCTN4Q0ficqwQ==
=UECi
-----END PGP SIGNATURE-----

--vUy5kMIj7urwy+MA--
