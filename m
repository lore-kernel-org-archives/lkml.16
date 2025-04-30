Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581B2DC782;
	Wed, 30 Apr 2025 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972623; cv=none; b=djFc870b43sbCdysJ76B1NPYb3WV2UxsCRu4EgDda+nFYHanpMyJ2TSmNeundfBU17NjN0JhaByPbv6Zf0QVpTGUTTmdzAYnoznz9SeXIPh/p604DB+O74MajT27hk2Lv99p+ka2p7oPDU8LeplXFpm6Rq9Kd/pTrP87ObVhCgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972623; c=relaxed/simple;
	bh=sg1NHwkHRmDhitLO88G1C58UvhrPJ9FIzp3DhLvKpFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cl8rTML6+50lYdnvTpXlKTRIb/kooRtc/l3y3W8OC+r3/BrBmAJe/MkKF1dbwRLs969cTHY7PN5YRpaYOvL+2KBWFB0jz2lREC1jr04+jjf6ryMvQx3nYn+I4GnqrqFtcAUf38THGgqPfhAFzXshO5he7ORLzWiAGyY8Ip/Qqs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tD4kaK7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tD4kaK7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87DC9C4CEE3;
	Wed, 30 Apr 2025 00:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745972622;
	bh=sg1NHwkHRmDhitLO88G1C58UvhrPJ9FIzp3DhLvKpFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tD4kaK7z0uT+t2w3wsRY8wvovK7r/3CopHREMIZJMM3hC3vhHTkg56d8eiuePY2Qk
	 5PgsXobyX0CftVJrFHPMvRC3nKulZ/77iDDlHCUJxT20mnneYLX4xvld9KSFwLBSEi
	 cpUtheN08hUpDQPcn9eaCBEu7g2mpDuG2YdEeM3mWVJOn5l7emMzCfyTg9VEO+7tDf
	 X1BSVcnxItxGi5MG7r8EZQpEUaMjC7/Ao2DHUhHOl3/Fj9C8iosSGcuVvXZmuAC9Re
	 jix45Zl+bqiMJqmP3mYlJGjUMozDCwXgVWgVUnXPzc4rkRpN/d2wIOyIfJhADIsi6z
	 qM7EiIYTGfZWw==
Date: Wed, 30 Apr 2025 09:23:39 +0900
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Julien Massot <julien.massot@collabora.com>,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	kernel@collabora.com, LKML <linux-kernel@vger.kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix null pointer derefence
Message-ID: <aBFti1ny1cEQsnAQ@finisterre.sirena.org.uk>
References: <20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com>
 <2583415c-6338-47ba-9688-eae9d5ae6736@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hUvYqmnhf3q40IR"
Content-Disposition: inline
In-Reply-To: <2583415c-6338-47ba-9688-eae9d5ae6736@web.de>
X-Cookie: Well begun is half done.


--6hUvYqmnhf3q40IR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 03:10:43PM +0200, Markus Elfring wrote:
> =E2=80=A6
> > check first for null machine.
>=20
> Would a summary phrase like =E2=80=9CPrevent null pointer dereference in =
snd_sof_load_topology()=E2=80=9D
> a bit nicer?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--6hUvYqmnhf3q40IR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgRbYoACgkQJNaLcl1U
h9BYhQf/ZBat4at7WqMry3udaSHwQNLZKVtD/bOhQ4lQIOatbLrRbN107AvZH0Rj
prWZRfTSf9radlkGrbN3foVEe/oZk9w/qY5NEa+RCH+W9WcJ2vYY68jQc3UB0w42
kzrwz6HlvJ8aEIbdi0hYAhAb1rku3Hqyw7NUsV4IQweyue+Nl2SAvEJBVDjf8Lkp
W3Do806HpxBE4TCcsy5HE/BRwLX57nk5FtZkxjmRjp7D+/YvSqo9CSDdoAzncLRf
h8ZdQA8Ih8+X26gG8URTYyY6W6HLyQU2MTW2/hp2FRmtEFh5+/K28skeGjosxt7t
yAuRs0YvuLkyCExJK9OpdiI1SAwoEw==
=QCIa
-----END PGP SIGNATURE-----

--6hUvYqmnhf3q40IR--
