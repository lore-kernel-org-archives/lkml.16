Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D3517BA6
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748349355; cv=none; b=Y/7zb6Tjq2X7HGf4Wz7ILCvHHOtDpfaE2Eai41q8xJ/NhZ72LO2S5sK+Wwy9LCRyQxqUy/VnlRAsZzbOPG7kvQRZa1gyM4xQEdYVxp67FScJl9V9/c7nFRBuMh3bXA6+SO1H42aWicqPxG0ex4egMHFGcY9hyU//307tRQe9j6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748349355; c=relaxed/simple;
	bh=sI1zwwcV5DA1+y9UgfPynqctj5j2Si6+vL8Lt3+yBj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poNZycPorEyD0/wK7qGqQBPG/wVcVj9pGfLks8Ifbs1nt6lPS6stIzBXgoX17Zk5Um2TFOo5jwGQul4OOL77q58FNqYaKUvCE9vEX/rMLaM+tmbbRirooJWnDcQN9WCpZvzBY6LtQj89aXHgfqaNUIxliRQvi3x5Betb4M5irtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbBOUlaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbBOUlaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BB0C4CEEB;
	Tue, 27 May 2025 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748349355;
	bh=sI1zwwcV5DA1+y9UgfPynqctj5j2Si6+vL8Lt3+yBj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbBOUlaJtix/68Ou+sCvJugxRmSG3DMCOsTQEHvUye13auLdpfB5fiIBOvko8XNSR
	 Wc/5LnXtJq/5jiAZMz5o10ijmLWahhUWwHpRywVVJGh6/2QM1jHMthCsPvzAdiQ6bZ
	 VW01x66OfYe5hKSbn3Z5AKxW6WiKIWscetiS+7n3H1WVAP1Sw5j5gwtk6QQkH4aQko
	 6iHhQhMroIi/49L1cB+4oN/jflqgDtla620zw8KMYvC1HrybLsCpHxP5pZDew+9SrV
	 rvQGf+wzlbd2GiQCvO4Pw06zB/PnxxwiiOdF0vCCHo5psvrdaT9yHLz2RQsKzbloJi
	 oymW4aTkPyfUg==
Date: Tue, 27 May 2025 13:35:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Message-ID: <231a9862-58ea-4a6d-8893-862776d9deca@sirena.org.uk>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <31869a69-063f-44a3-a079-ba71b2506cce@sirena.org.uk>
 <20250527122332.M0ucxhwh@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MvA0N8ies3IHhEgs"
Content-Disposition: inline
In-Reply-To: <20250527122332.M0ucxhwh@linutronix.de>
X-Cookie: New customers only.


--MvA0N8ies3IHhEgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 02:23:32PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-05-27 12:28:00 [+0100], Mark Brown wrote:

> > This newly added test is not running successfully on arm64, it looks
> > like it's just a straightforward integration issue:

> > # Usage: futex_priv_hash
> > #   -c    Use color
> > #   -g    Test global hash instead intead local immutable=20
> > #   -h    Display this help message
> > #   -v L  Verbosity level: 0=3DQUIET 1=3DCRITICAL 2=3DINFO

> That is odd. If I run ./run.sh then it passes. I tried it with forcing
> COLOR=3D-c and without it. This is the only option that is passed. That i=
s on
> x86 however but I doubt arm64 is doing anything special here.

> A bit puzzled here.

Yeah, I was a bit confused as well.  This is running with an installed
copy of the selftests and IIRC the build is out of tree so it's possible
something is different with that path compared to what you're doing?
It's a common source of problems?

--MvA0N8ies3IHhEgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg1saUACgkQJNaLcl1U
h9BIBgf/RoRo4yOQ7/gVvffzk1axJr3TNIgCMowZE7iSbHObbwQPPAwdVZcku+gp
sL3Gf/UuFbC5VvhfuICR6u8ILY48N5KC/FEhHP80p90tzuwfmcy5JjdttKJwhtal
RDDDKnKu6RrkCz47xilxaks4gfFRnMUt6m5Q5HzugAjt1QaNvw9rRkOM5CjoGuJy
qcd8cYehz4fKtWhPosBo8RNj6hxCgoU9pG0CXbVMLjvg85FrPuCamNZJduqbVA+L
8n9qBc2sJHmanPT4qNROc/GKv0djx7+zUp5De7F/0iVhJrolzfPGr3MfBxD2ayK1
QbaYioMO++fitQ/cwHgYWlrAz68k5Q==
=a/Q5
-----END PGP SIGNATURE-----

--MvA0N8ies3IHhEgs--
