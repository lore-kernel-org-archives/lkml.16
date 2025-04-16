Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F174381C4;
	Wed, 16 Apr 2025 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802347; cv=none; b=ZMQWkps80mG5MUt763jfHoZjgBpqGsUeYkSyeL6Lm7mS93RQSMqna2lLL8/9aBYv/O6c0NPzx5CE/JjU7zt/GUYVL0lBRQOOW4F9im7REv8PwDNMzZUIa385HAz5NNytMQrXHT8fdhxH4izcL3pP4n5zmPbE3FYm2u9oveahO9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802347; c=relaxed/simple;
	bh=mqFccduCxtvtWyTdmr2RFsOlGoFIhr4uIfpipPu3nBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrVHGX+atOyjd7nlN809J/5H5BZbGJ159AWJJhb/gUKp9RcYGq6BDfIwonmLKcvc2NOLibVU1QuJqV/w+ZDTdr+/cb3nPAott0RQqSdpwV0Dcu+s4MvYU36bN9bj2K4ntTCTcLF3HeTAwkgXlIC4fu00QPxkTBZuAoVhK0ws0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXhm+YTt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXhm+YTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674B0C4CEE2;
	Wed, 16 Apr 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744802347;
	bh=mqFccduCxtvtWyTdmr2RFsOlGoFIhr4uIfpipPu3nBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fXhm+YTtzQCzU0C4fdMuXb+7YIw09BaQ5l+AuYLLo/p1eh56F1vb1fjeYNQ4IQZE6
	 4A1M4mx9kj38OEmn3cEuzuHzWZfSUiptorGAQUA3djxftsw3hc1M6JKLrODcSpJsmF
	 HRLmmWpQ1h5m0B0lwc5y79NjVCdhhSI1MxnQGYCDmltvSQaROLU9Gv7Xb31PzrLtAb
	 NLGbNfU76l8AttdxcFC7CDXliYg+FUh7Hlei3sbeuVeNLs9oIVz82Sy9zl6Hee2Emw
	 Nuf1XiLK/xclLKe8EZHMKQ8ZBSMLUSIzbMRJnO4VcGZ75ORxDeIjClS0TI3McwzA5y
	 j3oF59IqvVFpg==
Date: Wed, 16 Apr 2025 12:19:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Chenyuan Yang <chenyuan0y@gmail.com>, linux-sound@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add NULL check in
 asoc_sdw_rt_dmic_rtd_init()
Message-ID: <37b3eff0-f868-4d18-95a2-bbf4d834f06f@sirena.org.uk>
References: <20250415194134.292830-1-chenyuan0y@gmail.com>
 <e1890bbe-183c-43ee-b866-936f9a7e4801@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Db8XMmy5BuppAR9h"
Content-Disposition: inline
In-Reply-To: <e1890bbe-183c-43ee-b866-936f9a7e4801@web.de>
X-Cookie: System going down in 5 minutes.


--Db8XMmy5BuppAR9h
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 09:19:12AM +0200, Markus Elfring wrote:
> > mic_name returned by devm_kasprintf() could be NULL.
> > Add a check for it.
>=20
> Was this patch also supported by the source code analysis tool =E2=80=9CK=
Nighter=E2=80=9D?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--Db8XMmy5BuppAR9h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf/kiEACgkQJNaLcl1U
h9Agngf/WO1WvbtW+y35wH2ZniNfsf3LvXva5Go1Aqf0wNGSN+1fKP22l1hvVQZZ
CfgOUBXewOqOgfUO/3zz/+J6o7wYpk22ajuBqGP5n7SMwGnEENa3XpDWJJwyTkU1
M2RM5y6jx91eqSJCPacBsaW8QZi4bKt2DLbgwoWqF3ZBB89Y+2VE6kYgEIN5+o/e
R5NvGIW8KM52zhAu877PaJn/EE/mzijWTLPgFHCC3NRsEC9WmaL67KmZo9waM7Eg
mZSH3X4PkOqAtZ8Fl3sdXsGVcrzjKVi2kK8NQ+V7FRv01RrrlSwseuPNSsq4bDgS
S20bVvr/FRJmrqTkIS5cVS8Rch/rCQ==
=8ptK
-----END PGP SIGNATURE-----

--Db8XMmy5BuppAR9h--
