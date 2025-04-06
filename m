Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DD05695
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743965240; cv=none; b=aPLxQNTcgORXHNFF2zQ7KO0EiFdTs0DRLh7OeoQGayoEHJKjjShMguGvZHFtOiO9EXxtLqM6UJStHXTJv/1Ge2UFpE7TsGP78yWjwN22yARIMfibgdOn46ZFjJh4CTRrWOMJmMm3vRQ0Tnb42zgj5J7O8MZjOSM1JbL4QtPjVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743965240; c=relaxed/simple;
	bh=3SE6SWvcKLkq6FS1QcFUPgYFr/y2zDeedEUjnFn6kx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QL/9gWu44ha3PaDwVl5+BOhWb8EvxEP9WsR8zWwifCxs3zRLhihWsl4lopqdnXeXsfNrCTKpyJGs7P0fPUBcteECo8dbswwwSOiFex04mmrnqiY3QXl5p1tXQ4z4lrKucREpQ2Ghy0mUb0dQmH0SALru3s3PxGL13i07XfuJOeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KxdbX8Uy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxdbX8Uy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63559C4CEE3;
	Sun,  6 Apr 2025 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743965240;
	bh=3SE6SWvcKLkq6FS1QcFUPgYFr/y2zDeedEUjnFn6kx4=;
	h=Date:From:To:Cc:Subject:From;
	b=KxdbX8UycLWum2jDOKNBqtwJxveyX+Jtj/dUOzDMjmgAJ8mGY3Kb7wd8yonOL8tu3
	 CXP36R1HkDJI/DgrzXyewXBcSlDd6g5Y6iXARy358LowJPM8bq6I3aVY8bMDDaFJ+f
	 1iVS4odRYBhOkzv02fH1BkwGyX1i6ZUh9vtq36GKOimGYs/R1y40dxHM+qncgjvffk
	 fh9AgFCY4iyaIVIV0PbP3tlw5mjkmWWL1pKckyLahwY7wzOIO9kmOZBazXOpuFEQ1m
	 91Csao2ZFxGXTdTI9b+C2RWkc8P0wKQZjyMtAlc7XXdbZcDBOwJdFmkxAeqcFu2rbf
	 gLUXAurs2KQDg==
Date: Mon, 7 Apr 2025 00:17:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL]: SoundWire fixes for v6.15
Message-ID: <Z/LMMl6/SMB8Mm9q@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TY1dHV31jzGlHtKq"
Content-Disposition: inline


--TY1dHV31jzGlHtKq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull to receive a solitary one line fix for asoc driver to
missing config option. This is coming thru soundwire tree due to
dependency of patches pulled in last cycle.

The following changes since commit 08ae0d61c3d79bb5d52ae30ad4fc12442e966a23:

  soundwire: take in count the bandwidth of a prepared stream (2025-03-11 0=
1:51:58 +0530)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/so=
undwire-6.15-rc1-fixes

for you to fetch changes up to fcc0f16923621e670d5ccf486160e4a1b960b17f:

  ASoC: SOF: Intel: Let SND_SOF_SOF_HDA_SDW_BPT select SND_HDA_EXT_CORE (20=
25-03-31 12:27:26 +0530)

----------------------------------------------------------------
soundwire fix for 6.15-rc1

 - Fix to add missing config symbol CONFIG_SND_HDA_EXT_CORE required for
   asoc driver CONFIG_SND_SOF_SOF_HDA_SDW_BPT

----------------------------------------------------------------
Bard Liao (1):
      ASoC: SOF: Intel: Let SND_SOF_SOF_HDA_SDW_BPT select SND_HDA_EXT_CORE

 sound/soc/sof/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

Thanks
--=20
~Vinod

--TY1dHV31jzGlHtKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmfyzDIACgkQfBQHDyUj
g0cm4Q/8DYc4+J/TZqHEn8i76GosB4LcqggWnaU1HC/ihTB0qN8NBDLCJVSyOB/7
HI7O858KK9GjubXYyqhSbAzE8BJb4nOAjpLJTHehsE6JYmdwe68iPF3uE2c1yf5o
JuzLPjfVQD+wtrlero0u/VBnCEpmdF5U4m4M/RnvkKbLtjDo7qWihcvtMV9MxvCA
9DTvxbcCtLXlcUo25kN4TZvVSpsdDsQ5zU0c2my/T7S6Y7AHDca4lTr7gCdy8neP
P2BqIcCI5TOFnMBGaXPTArpBamRqRW5+OCHwODYGngCoYnFvK4PpqbMaJY6gLziS
3Qg1sNH+V7rCppA2mpGMWLQTQnKb2TjPnUAUvZ/8hp7DUhxwy/gwb3WLdpQ7/LwE
RUT3GtbGcUpgKZYR3P2j2FBIClg/L0Y3YHVvCpCY23j7QWf9SIjVQG6W2m8r3VvC
lgesohXL0sXeXhOK11GRcA/aL28vQZviZXXppT7NgG0Rby1phCDqthTJksCIdn+8
jaFtJHrdiUjrIgrMRbw51jj6n4xOGrVjvYbG4/z/DhTigJttGBvUP53PoiL3OWUA
PCu+JuRQzoKLYZrS+v+hBpbVuZOwcxApTV9j6PysvdpsjvB7e/t9vmg2sHOjCKnt
r9BPBBW+OBDj4PrddJnEv5pOWp5HtAVJynNPDlADR1Trcn1mwms=
=yh1M
-----END PGP SIGNATURE-----

--TY1dHV31jzGlHtKq--
