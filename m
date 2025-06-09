Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8F36B;
	Mon,  9 Jun 2025 12:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471384; cv=none; b=WLjhYOFZmlZb4Jz+48G6eIHCwGQ6cVo5mS5qvEyrqcc8iVSkvx0UMqIZirbShOmcH1/ZCfku+kLTi43XWjeOjfNdWsYf6KQ6lM+xaZoMN537yU2j+JXPmKhct4ox9iMMG1wq3b91K6/1Jc1BSB5DgsrWGeJDwsBqu5/myMrTfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471384; c=relaxed/simple;
	bh=6Kag9Ku/q13qtFPk6HDqeKqGdosUpBqql0sD8SctYbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwcSTEn2wdvm4lV3Xjma4fba5GR8CAL8kIOG+mfVVhh1rcGrqMkEDJUbsOTsuIBFHuMhtu4RiJSbLGUz557HbrMP0DmKHFUC8GTatizEStEoKMYKPvbS4YKNhjJ4Kko9nkKk80fRuKEARMpxsmGDHkQRX/E3bZCjDNhXlgpLu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G57svMu4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G57svMu4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D2BC4CEEB;
	Mon,  9 Jun 2025 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749471384;
	bh=6Kag9Ku/q13qtFPk6HDqeKqGdosUpBqql0sD8SctYbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G57svMu4nbKd4CGPIIngocdVOTrkAUN2YwFX8F7ErGjGJ8ZHbdF6YLpEBbRafVySE
	 QJ28QcahJxmJViIkpS4bBaHTvuwzt4EQsONnjWd0J32GVZdWjf3ufqgYsb/Koy7qux
	 qPEAdlhB6Js9aUsZV/Du0Jjsgo4PpFKlL4nWoKB07pwH9gSMvED+M7UM9u/ekH9mvE
	 GjK326HVS2aWOc/Ar8Hp2dAU10K2/p6+5HoWQJcQ5FRrANjqh9By7gtenAkHKRXyLr
	 XVkI5BvlbINBDQncumjMjY7oRtv653X32dLdSeYBCHTAtmCtuf/oklydofgageUk/w
	 xRU+iG/mejHPQ==
Date: Mon, 9 Jun 2025 13:16:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	syed.sabakareem@amd.com, mario.limonciello@amd.com,
	yung-chuan.liao@linux.intel.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Fix pointer assignments for
 snd_soc_acpi_mach structures
Message-ID: <ea8fa344-0429-4dca-80a2-aa792128576d@sirena.org.uk>
References: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HYjgf6wuR0aqqtNh"
Content-Disposition: inline
In-Reply-To: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
X-Cookie: Restaurant package, not for resale.


--HYjgf6wuR0aqqtNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:42:32PM +0530, Venkata Prasad Potturu wrote:
> This patch modifies the assignment of machine structure pointers in the
> acp_pci_probe function. Previously, the machine pointers were assigned
> using the address-of operator (&), which caused incompatibility issues
> in type assignments.
>=20
> Additionally, the declarations of the machine arrays in amd.h have been
> updated to reflect that they are indeed arrays (`[]`). The code is
> further cleaned up by declaring the codec structures in
> amd-acpi-mach.c as static, reflecting their intended usage.
>=20
> error: symbol 'amp_rt1019' was not declared. Should it be static?
> error: symbol 'amp_max' was not declared. Should it be static?

It's fine this time but these staticisiations should have been a
separate commit since there's no overlap.

--HYjgf6wuR0aqqtNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhG0JIACgkQJNaLcl1U
h9Cbnwf+LTWqBSmB2IAuSm6C+Tsj8O1H9Sjadg20290UFCx8Xw5HsOaBhAcGHs4Y
78jk6uWG6cPTWhqcC2gKp6PZIEkxL7tgQfuuHpsCkuaMXvmRt5v/tCGBUGDb8nkH
o3+NGhmw/iZeRb7rsTKXez69JMd0sMjiVy/z63mV5YsSa5dWKkFGo6p8yIgkP8i/
8oHNww9aPdRjT95ytzs/4QZjUYdq0LV79UXoMBy+TmmNwwMM4516fAzLNI6DRaw8
oJAAwtcXdVUikL8NqtGBUruAov/QN7+IkrDNF//U8k1C4dRkCsb3+QsD0ppGRmjQ
catCRSaVvm5EUuEyIpcpCfYdCE5mGA==
=Ko9S
-----END PGP SIGNATURE-----

--HYjgf6wuR0aqqtNh--
