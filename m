Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658AFBF6;
	Mon, 19 May 2025 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651085; cv=none; b=DkcJnAtnJDRSbhmcQiZjSMKcxxT05gWb2X7z9pXI8wxOZ8RGUhHCN/UcBJ/FEOm4/z7UiwbELaKVqExAt/EYi6xvUMsSQjdIC5iz1WC0mBmTkw+iPFCViGAqfbhDU5QMpe/cRxZv3SbmJZGpLtlv3MwrKump8Fm+YmsgC585EnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651085; c=relaxed/simple;
	bh=rZE8erx96JB97Sl1nprYcvzNzhyW/SJMOxi+lcu07TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSfqWLZ4VDRQfQE+FEfWILtajQglY4WQ3vIGXIKAA24CgNZxFcf4V9TTp0C94cDQXu6LkqRz4SuPIk6HqdLGZwfCwPDuQKSWRM2Gg4n6cm65aJdNM9WqRaRoSNZv+HH9dGoc2PhAhKhZVdQCfv0/EmyWRMSBNbgIVeO98BxeuyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmD04v18; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmD04v18"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C595BC4CEE4;
	Mon, 19 May 2025 10:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747651084;
	bh=rZE8erx96JB97Sl1nprYcvzNzhyW/SJMOxi+lcu07TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmD04v18oGsZgb4clnGSoDB21C7tK9SavpiieRyTKZivwF71U3jd/Q1Yc3m0nQru6
	 QDtFaywV8DqWmQMov4bwC+CFPblgYLgzuPZNItEWCPib9yk47cUMOx66eDljLndxoE
	 MbrPfFGoRg1OiXamZ429+xyL/pSnkN9i1mQD3nZM736A411FaxF0atDv1LoD84llF+
	 u7ru2xZihpFG+zz5U7I4gKdG+FrEknKBxDCmP4L5Cjpbb2ZtlBMeXTACC2mTu821fB
	 cYTdJnTanRC45TCoMGF3YpjKmjUc+VI+sqp2X9GVgEjmH1vB4SxgU6AT9AHhNT4aXL
	 iBbTJCeOpTZ+w==
Date: Mon, 19 May 2025 11:38:00 +0100
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 3/9] ASoC: apple: mca: Move clock shutdown to backend
 shutdown
Message-ID: <d590b26c-67b1-4fa9-8659-2665e73a6aae@sirena.org.uk>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
 <20250518-mca-fixes-v1-3-ee1015a695f6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sSemejpnJug2TKh"
Content-Disposition: inline
In-Reply-To: <20250518-mca-fixes-v1-3-ee1015a695f6@gmail.com>
X-Cookie: We have ears, earther...FOUR OF THEM!


--5sSemejpnJug2TKh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 08:50:48PM +1000, James Calligeros wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> Codecs are set to mute after hw_free, so yanking the clock out from
> under them in hw_free leads to breakage. Move the clock shutdown to the
> shutdown op, which is late enough.

The mute should be the first thing that happens, before we do the DAPM
stream stop event or hw_free() for precisely this reason?  See
soc_pcm_hw_clean().  The reason we do the mute is to cover any glitches
introduced into the stream during the teardown process.

--5sSemejpnJug2TKh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgrCgcACgkQJNaLcl1U
h9Aw7Af/W7WvCidzGoJbaNKUpzh2um4hlSwR8+3PyXRvqe6547f7R0prqIC1WGec
V2utIYikPJBxv6LRuSU5UCV819jDSgrGwj4UJ6f1d77C5VnIjqho/Vzif48iKMKo
VUtH8C3lMjsbTH7y5W5LMjWPCzcq5CGAKj+ICOzTrj4YBoXzSuWxMYPb6Twpk/6s
uFMHwcvrBn1fOgtNT0lQXQtdv0oc2BkyitO616hBDHeXLIdBglm0VhWtMEiszb3g
cocyu8OoUE5PIENQLxzY1/iVnUA3KbNhBKy+qohg52p3A2jF7uXTEpUhT/O7hdz0
XB06g/9kPz/uAdt1Nzi2ZGExS/HgOw==
=46aR
-----END PGP SIGNATURE-----

--5sSemejpnJug2TKh--
