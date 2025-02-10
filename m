Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5BB1BBBEA;
	Mon, 10 Feb 2025 18:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210688; cv=none; b=ofCl+cvs8QJ7jWVna2a8qiBop8nAb1CDqfJP/4vjegdmOEKWAbr/6+nDgDf/8unCZUHfvbW8YqEmtXbom/yKHLWY7qExSRatutS4Q12AwWQggBbaU4jIXVLTxCE5awAADe5P3U+o2xu92HwlUWIy+TCTaGljiMFNvK4xIP5bC+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210688; c=relaxed/simple;
	bh=KBxW8DsHcZ87unV3h7k+wL2Y32A/tCtJpwYI2YBwfmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyJGcAD7GbQHIMqcdRQa+2AN69IP0TPSWoU4nkMyyJqiTw1+9T9VplCasYKVTcG1Nb5oEZe9re7sfeM7R3t8LY8vjQAC9taFFcT/ezkBU4+JWRn3UBU5JnyrqqCmDPnKu8fhDHU94UdNI0VhCmjEYPfaWOhA2/X7KoGsdq+6pUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9sIvQqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9sIvQqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92305C4CED1;
	Mon, 10 Feb 2025 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739210687;
	bh=KBxW8DsHcZ87unV3h7k+wL2Y32A/tCtJpwYI2YBwfmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9sIvQqiKNR85NrtwtdLbUVamdboEBsD1afNju1mIgAROt6Ybx39weQrbuf/Yr6Gu
	 UK1qAQSkYyMyln+kAI3JA2w2yru4cUwZ2Ms/YXrO5iuYVzKJ4I9bvoA+DGFtHQbzg1
	 G2EQmep5PqBStYyaOKq16rPGzZtbvE/345L92+RkWQ3sylwBVoJKC7X5NhEkZb0JJg
	 eOo29uAcuW8z7D51IpS1dR3sy33XNoUDnO5yRxwvt+gzgn/I2ccY29ndAa64p544XI
	 nAcsSY58NNdbEj6/Gt1kLwM4fWODhkiuUnmvK4bOrsGZO6UYfveSRMJn4xP7hEK8Pm
	 A+GWGovFjpULQ==
Date: Mon, 10 Feb 2025 18:04:42 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm
 support
Message-ID: <d1d08149-3b4c-44ff-99f0-34cdf70eb67f@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
 <d16ce74f-3320-49ec-a195-a473e03a9fc4@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fHWqgVKdO1j5+E9+"
Content-Disposition: inline
In-Reply-To: <d16ce74f-3320-49ec-a195-a473e03a9fc4@amd.com>
X-Cookie: A beer delayed is a beer denied.


--fHWqgVKdO1j5+E9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2025 at 10:16:05PM +0530, Mukunda,Vijendar wrote:
> On 10/02/25 21:59, Mark Brown wrote:

> >> [...]

> This patch series should be dropped and V3 version should be picked.

All the "no commit info"s here:

> > [01/23] ASoC: amd: add register header file for ACP7.0 platform
> >         (no commit info)
> > [02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
> >         (no commit info)
> > [03/23] ASoC: amd: acp70: add acp init and de-init functions
> >         (no commit info)
> > [04/23] ASoC: amd: acp70: add logic for scanning acp child devices
> >         (no commit info)
> > [05/23] ASoC: amd: acp70: create platform devices for acp child nodes
> >         (no commit info)
> > [06/23] ASoC: amd: acp70: enable driver build for ACP7.0 platform
> >         (no commit info)
> > [07/23] ASoC: amd: acp70: add acp pdm platform driver
> >         (no commit info)
> > [08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
> >         (no commit info)
> > [09/23] ASoC: amd: acp70: add acp soundwire dma driver
> >         (no commit info)
> > [10/23] ASoC: amd: update ACP7.0 KConfig option description
> >         (no commit info)
> > [11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
> >         (no commit info)
> > [12/23] ASoC: amd: acp70: add acp ip interrupt handler
> >         (no commit info)
> > [13/23] ASoC: amd: acp70: add acp pdm driver pm ops
> >         (no commit info)
> > [14/23] ASoC: amd: acp70: add pm ops support for soundwire dma driver
> >         (no commit info)
> > [15/23] ASoC: amd: acp70: add acp driver pm ops support
> >         (no commit info)
> > [16/23] ASoC: amd: acp70: enable wake capability for acp pci driver
> >         (no commit info)
> > [17/23] ASoC: amd: acp70: add soundwire wake interrupt handling
> >         (no commit info)
> > [18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
> >         (no commit info)
> > [19/23] ASoC: amd: acp70: enable acp pme enable during acp init sequence
> >         (no commit info)
> > [20/23] ASoC: amd: acp70: create a device node for soundwire machine driver
> >         (no commit info)

mean that these patches weren't actually applied, it's only these ones:

> > [21/23] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
> >         commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
> > [22/23] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
> >         commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
> > [23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
> >         commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee

which were actually applied out of v3, they just didn't change much if
at all between the two versions and the tooling knew about v2 as well.

--fHWqgVKdO1j5+E9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqP7oACgkQJNaLcl1U
h9CedAf/ZsWCQs6/Mc2bvzKDmUHyv5gG0Cth/lHH1QMSF7IeUH/+2IMIVFQf52vY
TrVmfy28j3JArmW2dUdvJTyNd++0xYXJohvfzFqwmwVSg12L7ySc/V0DKfWJdA5Q
IBMVLjHPRsM95fLq/H7vZzM0YhbGOY1cELC3Q07NmjJY2wGpTe7jetGeY2UPtuJt
p1Jn+7jMICABm+yl/k+XRetRwm7AeE8IX08PlN8wHGDLmM9HGU7zRm7TNjpXR+l4
LOBDApBYtLucv6ayJoAm08K3hBbKsrnlKtMNQshYmmL0tH2+UBq122p8eV/jt3AE
2MFE9Yzk9Pqj1Fzz9a4b+AJsyh9aKg==
=ZnvR
-----END PGP SIGNATURE-----

--fHWqgVKdO1j5+E9+--
