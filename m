Received: from tarta.nabijaczleweli.xyz (tarta.nabijaczleweli.xyz [139.28.40.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2AC1F37D3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.28.40.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558757; cv=none; b=Ng+88umegOxTXHhr9xAlQnedBEpblW+dPMfovgCi2TaOXyzp0bAvnvWrNh2xLWZMTXperIRwC7K0DUmQYEKr/A0SD+kEXQ2b+lnVoqY/0FtgtbvMZJdStLjcP7+PKuzI+hYUcz0/ngmEQzclFdVELDSG9vqOYNeZoJytQziQUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558757; c=relaxed/simple;
	bh=siJYkGd4SXyOVGRizOomB/pQfJE70mADNoQBMltNr+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YQKjwvLJOQ9gbJNJNaggDu+U9ir3vKOusgfVcjh1pu+/3a6Aan2OcdT+yB7E/OuRVNlhvqg0WTukDkYIuTWMlcJlGEqdwB8o9XvzbB2A1394VZA9ylsN77/GGkLAPNKv3salpUOkIEF/KKwnc+wTgsYFpW5QP8j+nlrWoOcw5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz; spf=pass smtp.mailfrom=nabijaczleweli.xyz; dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b=Nv/oKvXx; arc=none smtp.client-ip=139.28.40.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b="Nv/oKvXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1746558600;
	bh=siJYkGd4SXyOVGRizOomB/pQfJE70mADNoQBMltNr+0=;
	h=Date:From:To:Subject:From;
	b=Nv/oKvXxVZw4CdNsAwwb4ojvqiLpZbVjmHL2MUvUqYIBHOR1qBRS9Gab70Gf2u8Fy
	 wWXgPSHH3gss/gzevcxhqof70z3vJGskDQe8neygo8Q1RMsC7BHkjO2Xn/NVnUEqjl
	 hUxyVGtXHDS6spMly8JHK/0AMPDlqaapH2Ykch9zPc5ABYN17kmPysA65E0jPjU0Df
	 gcC7LN1cJblyZsCQH5Y29lWHAZ7Tta2/anmVF6x5XLAuWhDY4EegkXgsrrp0q5H+hj
	 a4uR96EGRCUxY8xDAmbRAT2XJoCQV+39AwNgAo6RZTOAvR21qvfzK+DXfZOE0OMnLM
	 eVp/nPVx5lrPQ==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 6860610734;
	Tue,  6 May 2025 21:10:00 +0200 (CEST)
Date: Tue, 6 May 2025 21:10:00 +0200
From: 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] microblaze: optimalize -> optimize
Message-ID: <f6e465fee5a824a67be1ae7c3bc1b72adcf9471f.1746558529.git.nabijaczleweli@nabijaczleweli.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v4quvq7u7zugag4l"
Content-Disposition: inline
User-Agent: NeoMutt/20231221-2-4202cf-dirty


--v4quvq7u7zugag4l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
 arch/microblaze/Kconfig.platform | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.pla=
tform
index 7795f90dad86..2d18edde4823 100644
--- a/arch/microblaze/Kconfig.platform
+++ b/arch/microblaze/Kconfig.platform
@@ -11,7 +11,7 @@ config OPT_LIB_FUNCTION
 	bool "Optimalized lib function"
 	default y
 	help
-	  Allows turn on optimalized library function (memcpy and memmove).
+	  Allows turn on optimized library function (memcpy and memmove).
 	  They are optimized by using word alignment. This will work
 	  fine if both source and destination are aligned on the same
 	  boundary. However, if they are aligned on different boundaries
@@ -24,7 +24,7 @@ config OPT_LIB_ASM
 	depends on CPU_BIG_ENDIAN
 	default n
 	help
-	  Allows turn on optimalized library function (memcpy and memmove).
+	  Allows turn on optimized library function (memcpy and memmove).
 	  Function are written in asm code.
=20
 # Definitions for MICROBLAZE0
--=20
2.39.5

--v4quvq7u7zugag4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmgaXocACgkQvP0LAY0m
WPH52xAAnKhlvrA/nyf4skgUk5CosQFSF+q7QulQXkk6Bn9glSmwn2XFDORExUDM
MohBWIj/5dZ6osiMvlcEpF5KDhM3VO9Qj9mqtppYP/uSCnTrGCp5LNUDT2wyOjfE
ZZRAfU12llghMf/io5vFRwSuFCpkQ4PERk/Bi/nxoJ617il6J15Pvahb81EyHTt2
8l+cWrwB8R+peEQheWUYqFZBX+1oh4Zqxyn7K2onYAhTbFNGHjj167bsjRZa1I5L
l8F3cPuLlKz+8qHkjHsCFffNbJQOOivlbViFJyccJTGzIrhua8Wc8g8eXG4YgQvX
a9y7rl6y1g1fzxPhYmK4o2ut9c0ZW2WhNItQ59y6ZnntK6yzJdMrXhi9MQruXrtC
T+jXm1wyiIguTMDtLhRwkBmkNDWPXfjTcg539TFV3X4J0h9sbIkby2X6CsUKqEG1
DerLLiVzrjG806JIvXEqaLJSjfTG4hdtnF0L20DgJLg43sVC/F14I6wZ6OPKSrpa
l+dM+zXBSQGCC7NmudnkFFWrK/fU8CIYQcgSbo4fKR9ttR0BwTVWY1jdGlHmYLT6
nK507vjEHCotwMN2aXQVmqCc/ccB+YS7dhC8AWd+CjjDdMayXM/bthvuv5OLze82
lbV1UeWfBOzUjnZWYmYlBE3MoiMq1gE1ZevZ7Xw0AEYQkk44ico=
=o1n6
-----END PGP SIGNATURE-----

--v4quvq7u7zugag4l--
