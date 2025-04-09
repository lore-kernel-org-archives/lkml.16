Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CDA15687D;
	Wed,  9 Apr 2025 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744168245; cv=none; b=sbEEqkQfwDH4QcM8B7ESYASjKNtcUaE1TbrTFzeZML8R0HxIC+PC0U1badb+aPh/85CWxAWbubtIYJVT4vQesV0Gk74XhItOYi+W2CWDfqPJABRGwZyvQtTcJhWdYJIVNQTyxeDxHbym6ROTRwaMgKA6hJ/6/d1tSwTtbZzcDQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744168245; c=relaxed/simple;
	bh=6438aGoxGXJATnT9MV/I/sWH/1FgxLxrcSt13t7xQFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=paOkFz6Kf8egl20FRkBSJVqLIglktYexFZ2SjKeW5Su7qkymHINKamfYVUMp8Bju7wI5hyKNIpDTYhpLPmfGnZYftce74V2LrxKvBuhO4JkmhB0TxeQyTFgWIZUyrQGZU/GXdqYT6z5TuXvlKfNM53iiSMWgoNffpXiomRjUAiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ngCN69LG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ngCN69LG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744168236;
	bh=4ZxjVQ5V9m0xTRHJW0Tmj91mC6uCwQjjj/0UWGQ3k/E=;
	h=Date:From:To:Cc:Subject:From;
	b=ngCN69LGuGwoY7n8+nCNTVb7qr0nCnh/5+k4oh9lh7EZXkwD/meSQgbyJFzKDK7h1
	 gTePC/f8DBDE5gzdUlg4R8hqXBOHcJyu8v3xNSUfWO/LiQ66Kc9XkRUBytqLJk82cg
	 tnhjkxLXOfhFNE1sjktmyVx47TemvgAWE/ZBi6Bcu1yBJBiLY52oZ4yuQKM/W/tMYp
	 nuMk5rXVQi0U/r1Qg6MawWl9VxkFQaMmD4r4G4M3b4v7K0SEmjBZoXh9v9XOTaKjpC
	 bJrdEA0wdEmjrmdikkFurBT5JLEdDC+22b+tXDOFFGD1yhH7vqmOg6Tdp+S6wTjsrs
	 N3iDly2gFhTUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZXScr4P3nz4wbr;
	Wed,  9 Apr 2025 13:10:36 +1000 (AEST)
Date: Wed, 9 Apr 2025 13:10:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Dominik Kaszewski
 <dominik.kaszewski@amd.com>, Roman Li <roman.li@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250409131035.1df305e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p4TNbRWZBY3tL+EA/zo2Xyo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p4TNbRWZBY3tL+EA/zo2Xyo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:646: warning: Function pa=
rameter or struct member 'fused_io' not described in 'amdgpu_display_manage=
r'

Introduced by commit

  ce801e5d6c1b ("drm/amd/display: HDCP Locality check using DMUB Fused IO")

--=20
Cheers,
Stephen Rothwell

--Sig_/p4TNbRWZBY3tL+EA/zo2Xyo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf15SsACgkQAVBC80lX
0GxFMQgAkJ+DkiqZgWLQDS+twu6j8/7C+hM3DMmRrxIw4glRRNgEd1pYCJqt0GFJ
eoLY/iaSF8RSVakloGaZVtZsB4CkbqP7yqkjwrUSMsQigOa7gWg45rAEFdomAT6i
ns+8xaKdNciT1nBu3SIh5wNBX1MNJSNVeL0oMbj0GxYMsVx3zKtdXGcvMgn16Mdb
g6IZ6d0QGnDWODuHRlBdnJSRoMPbwYvRy4xsFqSZtpUyrmuva6hOts7zOF1QbaiW
vJQbzNRrIXvyzxLeKK6/eNxrkvjcUO/pBGpLczYp67bg3X0N+GpYS8GVyyGaE6Nf
YWTf9TTF3KRl9PcCEU7FLuxzz6M/og==
=aBHP
-----END PGP SIGNATURE-----

--Sig_/p4TNbRWZBY3tL+EA/zo2Xyo--
