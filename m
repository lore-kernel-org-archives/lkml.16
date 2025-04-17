Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F1823FC7D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892794; cv=none; b=ByQlEGtElDnaaB/i+VoAIFxJf22apUv8YLPHYulg896/jUqVWANxz3bGhXEtlvqby6jtO/b2QN1HnBGZMvhynYu2t/Mt9GOqiQKFoPHbE3bR5Dg0QRfP4jMfpxVNMSdc+T47U5WAiSBZ5mFkhTP1H2rqzYWelY05U4RpvYGQcvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892794; c=relaxed/simple;
	bh=lz3o+oEn9wieKcZUu7IDOFxkvLTQmW2Gg8dareie/DI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQ1B71vhmTd1zKkLbmpNd/PWe6adgjy4Hoivg6zGCmASYlxZsOADquy+U9OD5ub+jrqK6Zal6fTJ4VLQF3a6b/5/GZt7l/F+VuOn9qqYFdKvezHUcYtpgFUNncSK16itDEAwaedcMfhLRzS+Um4fVwk4cRzl3V/7Qx8ZEByCah0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NTHucLyi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NTHucLyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744892787;
	bh=kRxBgMG2LpqYjbVTje+9WNfR7ZeDUoJk1ySneyQlkPQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NTHucLyiW4iNqVJ8JqmXKPoqdFnaX9JBWFojVg9O5R+GY4Y+qeZ6aCGz/y3fhMJOv
	 viTDZUBFMGsN5bhPlUF0USib8ENwikYaUMMLrUiSU2Smum+GzsNjb+4pXSWbroHgkA
	 BYJ7eOlKSkHJ9Lz4E4tFGKpWFj4aXxn4kPtAbHej13WykNUj1L0Gk4kldk9uC22ct6
	 RtGuDX5ubbVzAtJVNfawhS4yJ6EYQS8PAdLK+m5/LLLMZ7C4urzIAf6Qzmms93hCTj
	 o/+iY70+GQD/4+DW9DtMu1k8Y5imzQS5OrI+U6WnrRnsGUPpq37yTn6Vunt7slV8K5
	 BqgkcgWLgGl4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdcZV656Vz4x8b;
	Thu, 17 Apr 2025 22:26:26 +1000 (AEST)
Date: Thu, 17 Apr 2025 22:26:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maddy@linux.ibm.com, linux-kernel@vger.kernel.org, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: do not build ppc_save_regs.o always
Message-ID: <20250417222625.50a6684e@canb.auug.org.au>
In-Reply-To: <20250417105305.397128-1-jirislaby@kernel.org>
References: <20250417105305.397128-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AdrgyeNqwXgUiyco/PGm_Mo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AdrgyeNqwXgUiyco/PGm_Mo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Thu, 17 Apr 2025 12:53:05 +0200 "Jiri Slaby (SUSE)" <jirislaby@kernel.or=
g> wrote:
>
> The Fixes commit below tried to add CONFIG_PPC_BOOK3S to one of the
> conditions to enable the build of ppc_save_regs.o. But it failed to do
> so, in fact. The commit omitted to add a dollar sign.
>=20
> Therefore, ppc_save_regs.o is built always these days (as
> "(CONFIG_PPC_BOOK3S)" is never an empty string).
>=20
> Fix this by adding the missing dollar sign.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: fc2a5a6161a2 ("powerpc/64s: ppc_save_regs is now needed for all 64=
s builds")
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org

Thanks for that.

Only 7.5 years later :-)  This shows why I should not have been fixing
problems in linux-next, I should have only ever complained about them,
like I do now :-)

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/AdrgyeNqwXgUiyco/PGm_Mo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgA83EACgkQAVBC80lX
0GywEwf/WKqVgTtucvJR5XWjZC/k5Z9n+/rd2S1x/h5tDfYGPaQFOOdyooaQm7Dj
z0T8C1FvnuIDUNH9TZUKUu4vdf2y09nCtpTVerfRTZ0qgCbFdop8sUylxbkHvJ3E
J9truj4d7HyB4ZFFStPypbzO+WNULp3a+S0xAYBzsDYKDESJ9bHuRfzCbXuN/i7g
9QpXZdLg851zPi0AFnlBNkoLOCPyKmt5Fp0tpxtTBSNVgYOFqPLGxbWCONY1IGwx
f6QKRrSL1/0QMXhWqhQi+ExI+SOecVsEzeRTuK0wY3msPBb3rNIn/+lrWKZ9i8My
HrggBVKCZAiZHYhh+Xrt7QGyPvURhg==
=nL1d
-----END PGP SIGNATURE-----

--Sig_/AdrgyeNqwXgUiyco/PGm_Mo--
