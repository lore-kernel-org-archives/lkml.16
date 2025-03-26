Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2D04642D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029112; cv=none; b=EaJXE2NdtaIq7RTTx7CsCVrLdLxYmbim6v1MH/LPfA0Bl0QT4f3ob8vd1sUCe4mrYzNE28KvwXss2p4ZIJYw6NXlNBgD2WyBV+ZtCEqeTqzxUH2pEkD6ZqsaLJaGHAzeFbcqWDYn5qUKBCuzBDPgdQ5iFKc2Zwt9U0AViBFdk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029112; c=relaxed/simple;
	bh=80bJNYItYmA9eRll2ejcc3f8OAcHtthhcCCMr+8Acww=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qB3ZCWEByYL8nTK5qzCrl9RakSGrHQTt6f5zw9mOYu0DLf6fXe2jamEXTgRCSPQ66uYB9AjBoulYjZ7QqNrMhV3NpSv/3TeU74JT2rHJmGlkX0hU9YYs5scO+cbyOk2yvMK88FtHUjCUE+oUsE90+ZMaxjUeWxsA+19pRwoMm+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NqYOkDVf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NqYOkDVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743029105;
	bh=0JXlYSci0PBdC2H0zJnDExHP8ogwtP2mDptfTEHu4Zc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NqYOkDVfqmMxRxGKkcTgNXTqRTTB8q0/IkvENLocSL+jQOiMOuxuFokvs6Mikd4W/
	 UA3a0dBGg1KCRXPpse2eqhrecDBc3idkKI+xo7PFcnHPpwKNSHAyeFwQMQ2ub2Qv1c
	 m6G0zxEJXVeq0YfE9gOogkxATqxC0R+2zPsIGz3IM94eK6Ar9SvYzEZo2UD6gYlsZt
	 3rpxlHxEofHxTwTgquTqM9svUDw0Ct/VUQq+lbtM+At1Qn69rKjjzGbfcvPS4tAcYY
	 cpwdu0lu6rXU2xy2KrAPozHyK8ZM71QobQMBd3U6pmzvIKH9gtNxPpdIGaly3/dYsp
	 iwhx5B2esGrdg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNMLS0770z4wbx;
	Thu, 27 Mar 2025 09:45:03 +1100 (AEDT)
Date: Thu, 27 Mar 2025 09:45:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Steven Rostedt
 <rostedt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250327094502.6ae56227@canb.auug.org.au>
In-Reply-To: <CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
	<20250326124025.1966bf8a@gandalf.local.home>
	<CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
	<20250326131200.1c86c657@gandalf.local.home>
	<CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I/36lLAiTRXRUsoZiXLI4d=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I/36lLAiTRXRUsoZiXLI4d=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Wed, 26 Mar 2025 10:25:22 -0700 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> On Wed, 26 Mar 2025 at 10:11, Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > So it definitely goes through kernel.org.
> >
> > But it has no DKIM headers. =20
>=20
> Funky.
>=20
> There's definitely something strange going on, because your *previous*
> email to me did have the DKIM signature:
>=20
>   Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF624C4CEE2...
>   DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/simple; d=3Dkernel.o=
rg;[..]
>   [...]
>   Date: Wed, 26 Mar 2025 12:40:25 -0400
>   Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
>   Message-ID: <20250326124025.1966bf8a@gandalf.local.home>
>=20
> and gmail was explicitly happy with it:
>=20
>   ARC-Authentication-Results: i=3D1; mx.google.com;
>        dkim=3Dpass [...]
>=20
> but then this later one didn't:
>=20
>   Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDA5C4CEE2...
>   [...]
>   Date: Wed, 26 Mar 2025 13:12:00 -0400
>   Message-ID: <20250326131200.1c86c657@gandalf.local.home>
>=20
> and for some reason gmail also didn't actually react to the lack of
> DKIM on that second one and only talks about how spf was fine.
>=20
> Konstantin? Can you tell what's going on?

My understanding is this:

for normal SPF checks (i.e. not DMARC's SPF checks) the test is done on
the envelope sender and in Steve's case, goodmis.org DNS SPF record
says that anything from goodmis.org can come from the kernel.org
servers.  DMARC applies the SPF check to the From: header address.

for DKIM checks, the test is against the From: header address.  The
kernel.org servers can only sign emails that have a From header using a
kernel.org email address (or any other domain they have access to the
private DKIM keys for).  So they cannot sign emails that have a From:
header using a goodmis.org email address (presumably).

Presumably the SPF check passing is sufficient for the GMail servers.

DMARC requires that its SPF check or its DKIM check to pass.  (But
goodmis.org has no DMARC DNS record, while kernel.org does)
--=20
Cheers,
Stephen Rothwell

--Sig_/I/36lLAiTRXRUsoZiXLI4d=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkg24ACgkQAVBC80lX
0GwmmAf/VYJKpukOi/5sN/6Sycd2bzfHpS+AiWJld30LN9ZdTOQva6vhAtO79tHw
+U4f/xMgKjvOlnP1t+900xg2yt4YckB7uZllB61eP10cj1ORSShtowN6loKErkWa
pL5XlgPH2Sk3BZvepM7A2YVDNNEgmWix0oZ4xC8IZ0K5xYlrVaw4yEhaMUTC6/XQ
CeFIzVcNzrEipaBgv3szSbHCYn4fz+SN4SGYJ0UClh5amP2FlUs/svtuUnumhIIO
12DkqB3Auv8QVwD+aqY6TJ8/a441IxvFvuO2EwrhtRxsch2CUqke1CvKcVfu412x
feCSlum+x2a40XC7YRpi59StWyjrPg==
=ow6i
-----END PGP SIGNATURE-----

--Sig_/I/36lLAiTRXRUsoZiXLI4d=--
