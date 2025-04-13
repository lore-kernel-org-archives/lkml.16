Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA15161310;
	Sun, 13 Apr 2025 22:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583395; cv=none; b=XTP1RGAMX9krDSAWndQ0/BGH8eI1w0ikGkuAVW/hQmvPeIGnLujKM7+yly8RWcZcjAo3PFUpo9Wic0/9tI31/2YNvpuubRqR7SzClFEqaRD9eKc075YM2TJo7MBC1h7ZkhTSutbasBCcMh1tAZ/Xc+h9YvtiYPsnA0hc8W1wIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583395; c=relaxed/simple;
	bh=UW7GLHA/OhLe/TGvPvOmkTw1S0ebDeYlNE5c1vCQcgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sxpEbGHh62Zt2GFyLjazJ5P6NtJ0yzqwcXpsrtcsUsf0ogDVufw1/05JNxBZXr3hw2hrtXBVJX4pCzfU+AagTeVc6VlW3lY+lNwhQkoWUeEQbddW4SBT9lbBGIlfobuI25uIW2i/kNd3Bxql5Vs3PQqsix4i0pC0Oqt8qagU0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=agTcQ3B4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="agTcQ3B4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744583389;
	bh=S8fm/kcGacVtR90EwNvMYMQG3ESJXNDj/tWzFKrGNtU=;
	h=Date:From:To:Cc:Subject:From;
	b=agTcQ3B4YIb00kGsCh0E9AcOZwvOVh8M+RzqY0afPjvTMrBu9wETKf0u3keK52GGY
	 iVDENooGDQ0+qurAlZOn0zGhJv82JeZK7mAUMdpMjJKHvgoY6V7YqqDfw7hGlcKb6d
	 5tHU77bcQxziUNZv6wKuWdNBvi+IbpAmxOyb6ZLsR6P/zO9xtrhkAbz+GCgPqapB7y
	 4zXSwR+0lrM9PTYrKCrBb32KLKc3TBQHxOPuNzPfF4yvkOgixPaN+Xz0SE+oE4nHEK
	 nRcAYYH9h6UgiBUI3i+yNfqtOUIT2FGVu4hFlg5t2mjgTLPi7HCCtghnPYfqCTwrLn
	 IDxtobC8W/opg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbQ8X687sz4wcd;
	Mon, 14 Apr 2025 08:29:48 +1000 (AEST)
Date: Mon, 14 Apr 2025 08:29:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Oscar Salvador <osalvador@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm-hotfixes
 tree
Message-ID: <20250414082947.0858c8a9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6x4J0.H_L=RrqEG3b6i2dr+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6x4J0.H_L=RrqEG3b6i2dr+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4bbce82f2e29 ("MAINTAINERS: update HUGETLB reviewers")

from the mm-hotfixes-stable branch is missing a Signed-off-by from
its author.

This is just a typo - Signed-of-by v Signed-off-by - and so may not be
worth fixing.

--=20
Cheers,
Stephen Rothwell

--Sig_/6x4J0.H_L=RrqEG3b6i2dr+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8OtwACgkQAVBC80lX
0GziwQf/RpnyF3/SNjVNFbL8Bn3XMHgl1/ctIM4DIQzQ09aBZtd+W62HLBtKB0/P
Bj/Acz5DjVWWkLlkHrqpZY9vL3F35ocTsCk3W4gQc/PDNbfeqIEPXgYPv0CT1Tab
5JY4pSepUqFGanEMW9xZk+mjdnW1UayxxqGrRNppwBrURNW6kYhNfkyF+7gyFcqc
qsLLPii0YnKCV6WXId9ExvcjoxsOPpxgRDIbxeYUzTdVU3aR3L/01EBoE2QEKQl/
HYAt7lu5iuCw1QPZm3+TC111Zdf0ar5cphRvpTweRAuQbHJ19W7zfw4KNNoOjYva
GZfVApMtmW5qNaPBB0ohATT26O2z/g==
=tsbr
-----END PGP SIGNATURE-----

--Sig_/6x4J0.H_L=RrqEG3b6i2dr+--
