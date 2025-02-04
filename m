Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFE203710;
	Tue,  4 Feb 2025 21:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738702897; cv=none; b=uGWPfdX9ko+4oGuzaROiBLEOzOfBwdqGamr9X4hWSYhQT5bvUfSCjSzyT+xaetZtAd0a0uhG2C/2vClzOKhbGskEcot3PudvN1mfFkPcAN8sMRg523M7YwdtaDXKvFmwv1SOADwlaWyT9REYhc8V6wEdP6QWfKT5h5TmCfKieBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738702897; c=relaxed/simple;
	bh=hHzRQZBxDEC+6ooQSrTdN4F7UTOU0sfox+0ypiMrSSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nagd4IC5wFX6lFjkQ7cLIVWWkcCs76TATzhqTgZOcjr2aYa0SsS50HujtPp5eg89XMF1DxdW7sgir+b47aXl40QIkXxoOHO8HtovYZV1RpvLA9KfNBINVY9i1t/BzRsXIks4TwabpAWLOYvlFHBXsuzEKhBGvqoH7qCOdabjAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DT6Dj/DQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DT6Dj/DQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738702878;
	bh=MREgNFMJ2MRA9B64aw9EzGZiUWj8ZiOufqK43UbKaGU=;
	h=Date:From:To:Cc:Subject:From;
	b=DT6Dj/DQkzJ+yc8mmVWrao9867BGT7UnaosnjUcvFBZcI16QAg7iVsw19eLK70VjU
	 E34dffOTI7jD3V8y/0R0GyYy7jC6pdDZNXjQRgvSd2qYFt5AA6Ab1oQn0NON6efxmL
	 DwWxgc58OpuFz2xCy/vMFY/oQYseVe9kqh0QWlhytWampqV1hJ4QdMnASL+96t0GPo
	 iivUrwwWMoqbgTlKCBoR9EpudgsMUqB/9kgZg+Wm+s0SeEvfF8qcVHl2bwUmMkFiuZ
	 87g47M8NIzQ559Jiv9uS4QE9971KfPJBpExanXMy94tVR/AEhlnY78HIfeMvm6ocjw
	 fvrVCd4epEP0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YnbPm4gmSz4wbp;
	Wed,  5 Feb 2025 08:01:16 +1100 (AEDT)
Date: Wed, 5 Feb 2025 08:00:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Liao Chang <liaochang1@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250205080053.30dbe654@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sJw9LGHg/oT.NspNkRV7Nas";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sJw9LGHg/oT.NspNkRV7Nas
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a66396c911bd ("uprobes: Remove the spinlock within handle_singlestep()")

is missing a Signed-off-by from its author.

Looking at the original patch, it seems that some process has cut the
commit message off at the '----------' line ...  the divider is
traditionally '---' or '-- '.

--=20
Cheers,
Stephen Rothwell

--Sig_/sJw9LGHg/oT.NspNkRV7Nas
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeigAUACgkQAVBC80lX
0GyBpQf/dKog2FTYIDbGkxOntdYPbJpv68OfsWcadIVVnRyQzo8Xjs3EB6YbBiva
hJl5n0dd5OGyznQsnJXglvs3DUgYXbeVCyWORfLOawnFus8BCzB5XQxYB7X5K/AM
Lw8FHtEubMRooH2Z7MjpG5z0QblXwT1iJin4ibnLTw1cXf0M6tB+ZW+ehXbUM0Eu
I2dqSmcichUgfxJbOlJnGzwW1N0JrUui8NWoKtVcVJXiCY3kAqWAAplyUay/ByZL
dhmi+0H0seIc2r5anIPM15ZhbUrPCV/vfcy70sjhyPNeMF1VCB57qXXjDhoAa3t6
nf0VYmxPRjbWzniVEoyPtk8TTpvQdA==
=Ehhj
-----END PGP SIGNATURE-----

--Sig_/sJw9LGHg/oT.NspNkRV7Nas--
