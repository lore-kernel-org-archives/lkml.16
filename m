Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA923F424;
	Tue, 13 May 2025 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135370; cv=none; b=ZiNnnOorM86TwRBpavQSCR6NkM48nZ6D5kzi4Czb+pVkr4sBKUgX5IOnF+svvl5goQTqtWynRc6njFk3fIw86U+05z9Sh78of3wxUYjIz5ksqHnZevET5edqSqF7pNLu/UAj9C3Hh7qLzxCZ+DBqa7dzjUO7CbaMVNOTPScFXDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135370; c=relaxed/simple;
	bh=/xnMIlbJSeWbkx1cuJk8Sf9Bdm4L8CrYI4mouVXUj7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N950jwWbJMRegE5i5Y19hqcVUwwAuJuouxppf5DTp9QmQ91WGWfkyYzENOf+dAKgxGfPbb0Nz6PZqgEWeRcKpGBWT8VNgyG+3O4AAjO26yrSB61Dr/UUSp9Z/DI/ASoCLw1ksKvO30CiPpfI8RitqOi02yvLZ9TS/ZOndBk2aJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SQnUG+W+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SQnUG+W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747135363;
	bh=TcbgyrHPq8mx4zJq7c/ZHxa5Twg1LDM4kMsdAt5ALzc=;
	h=Date:From:To:Cc:Subject:From;
	b=SQnUG+W+Xi1Fu8xxKMHQmn748MHIOVRBtBuv+4LdzQmzrOieWjJryKvg7PPOHPUS1
	 VIvePzDu+/UP+9lTsiQgdsMC7jvQ0Y3wxqSdsIEO7W1+wSdvaeDmdQ5yDNNK3QDPri
	 OdgN0EbuTWpEayac4Ej+Rayzknl6WcBM/lqc2H++XvhGqU0e8A2rKhzZ3RhATYk7hN
	 985PJmyOr4pdEoqJaVBreMcfCC9Yq92SQx9KgGLwOcIlWez5o/thSeBYuUFfK59CRK
	 Z21T1bc7eVkTGHGP+YhgWAytRudXDHFMR1pBXvHc8H62Ifa+HW6Z/fTjvMQ0N4SKu+
	 MbISoZ35gWHng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxYwz2pYCz4xQ0;
	Tue, 13 May 2025 21:22:43 +1000 (AEST)
Date: Tue, 13 May 2025 21:22:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: warning when fetching the sophgo tree
Message-ID: <20250513212242.2f951e70@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HpKgJ49TueYisE8Y9T_o1xd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HpKgJ49TueYisE8Y9T_o1xd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the sophgo tree produced this warning:

Commit

  e07daed2a157 ("riscv: dts: sophgo: Move all soc specific device into soc =
dtsi file")

added this unexpected file:

  arch/riscv/boot/dts/sophgo/cv18xx.dtsi.orig

--=20
Cheers,
Stephen Rothwell

--Sig_/HpKgJ49TueYisE8Y9T_o1xd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgjK4IACgkQAVBC80lX
0GxxXgf/Vcv/Xo2RsixD50c67W3wHloJW55gcxgOqydlEcvBZAQ+S1ApZ4Mv41EB
pZ9D7WMH7cZEwPjkeXwWKlTQuwaa3zzdOYItTTRBUjDICEOAJIkWfi4rB+fVKK/R
3wmFHKJ6IZRpmaDPdxaaVbADe67gtl3yFFoXcQQpPLf62nD0HrzWJvv/jJYkbiBm
nysQVqOjxA5L7LpT0q1OEJXfIcsxdgkOjYW2HgnD0liSWE0g6JO2nkNV6zehO8D+
6JmZRKBsP/pcEEgDnOEIEt+T49KK/ivgKd9UUzoDc3G1rclSM+EjS2VxCUdU8wTP
g0o37z8iuyBfbVYhSR3LgQ7h64LO0g==
=T0sr
-----END PGP SIGNATURE-----

--Sig_/HpKgJ49TueYisE8Y9T_o1xd--
