Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E562C2F2;
	Mon, 12 May 2025 03:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747019183; cv=none; b=fgEINf018ab3gpLNUwniJeEzP5SY1PuBf3h3j4M9eZjFy8Iku4gyy9LFirLq+li8W1oyr9JKBsAuBsiWmKY14k50SHTEIUqJDdiVyIa8uBXwhv1bgWwtnv9nvQhi+Ts8216HMBIY/W05PvNh4uRk8V7NfatC5smnn7oDnXhimkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747019183; c=relaxed/simple;
	bh=M9slfGVUYJ1l2Vc8RvSDeHXYHozLEduEsfY97oh4VdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=InaNL8PzMdN8vC1Qoxe3uLPxnvKrPAVlu/lOuzaERj/lDhySyeMwvWD3ZnMJHUpzphKcrAuHlW+XHjrP0hAA6skzARe7f7lymcI/hqJjoV7xTvyzGXomO5/hoLbLVTI5ayZmLaTtLhAujA48v68vcqNcwtGFfvykUfGLqlG2gpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U0UcdQrk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U0UcdQrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747019175;
	bh=+iXkGW4q9wgvheRHrmEPiihlkV5z7uc/pD0Crq6ttPM=;
	h=Date:From:To:Cc:Subject:From;
	b=U0UcdQrkE+26GQb5qcpfn22gSgdVRVQqRVWXBFw9/DlEiTuuzZ3l8MJdCh71dBkF4
	 trmwASnxkowSAIgBUio6Lu4FncpmCbuFQ83YbUnU2ThEVCjODQfxvW641+YVhxus+Z
	 p2RZ3qJeOxQyFNDeFojqegVkk25nAx/7iWS/8ABK5FcznAy3EvEBsg+j1ncGQmca1G
	 AcA/kxCs+fbsQEVnl//Lsh1mcnrpe4nM33pPGC+HF49lSHmf8I2XVynfSakS+MLs/p
	 FnymiHwsa7NVhi4ReFkuoFJur1JzyHbqHTDthQCloGROnEv1rS+HrG5lqYm3og9zlb
	 Vg1G0PCleQyIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZwkyZ2ND6z4wcr;
	Mon, 12 May 2025 13:06:14 +1000 (AEST)
Date: Mon, 12 May 2025 13:06:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mvebu tree
Message-ID: <20250512130613.02c970f4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xwSffPRrBqCZt8kFG2ZgpXV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xwSffPRrBqCZt8kFG2ZgpXV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc tree as a different commit
(but the same patch):

  a3a0b8b23108 ("ARM: dts: marvell: use correct ohci/ehci node names")

This is commit

  49683c02d8e1 ("ARM: dts: marvell: use correct ohci/ehci node names")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/xwSffPRrBqCZt8kFG2ZgpXV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmghZaUACgkQAVBC80lX
0GzB9Af+MZlxb0VnnS+XkHxn6QZsxTNFjxuPhM2RRoJqAsTJsAKPQ3+H83vnYZWS
82+vgXGzDUGMf0Nkdv6o07EJU3pWJkklEHRTnyWNsVH2x9Ofo7eTajvTgWSx+MGG
12rphY9J2gspKNsueN7+4Sy7SqyjIdnM2IYoSH7sgzaA3y4JmV1t3zwjfyc2zGFT
pn8RuOreA9O87c7doGYnBJnpxBvJUjT5hqH6obIyhZ7yVgaenRaqzwb74Nc0mM3b
H/VyVt1ye/Qv5qqo3HqMb7ANCQbwDiZPsH4z9v1XGXeu3E0YgnIjOnaOBkXkBkB4
GDyHXn2ekkHhk7jas21cTltVUjieeg==
=O08t
-----END PGP SIGNATURE-----

--Sig_/xwSffPRrBqCZt8kFG2ZgpXV--
