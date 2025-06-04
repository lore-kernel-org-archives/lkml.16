Received: from tarta.nabijaczleweli.xyz (tarta.nabijaczleweli.xyz [139.28.40.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2F2C327E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.28.40.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039539; cv=none; b=O824y1M4NQ1+5ZxBGfGyZSY6pTfOITzb35zpkeWy+VxrQn67dK4ix9AvT3b7eGUfwfH+jHT/kJBmW/cwnchPWZxCaH7a7vGcWWL6FBV9FFz7iOV8uHQwvZX0c3Eo1mZE+ZwHu6BPy7sWU0G+FsEumI9dzVr198a65a6Zyn7k5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039539; c=relaxed/simple;
	bh=Sy31JKM7/PuGbGxr+JNLABhQ28VTKAgZaYvANIAsQbc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBwtqo77x5qh0sNrDWSCddk09nxWyBsiOgE7mLs09gHwm/2iEiN523BHzbTQvKu0JUMo/NRUBzYGiRYCeNAZr5BPovn58e9aeNO1Q69nJj8aMyZK0Qb9R7rXYZPNl8M0ENMFpvxXqQyeuDo/AftrL5/38IVOfDGsfCPcfs2zIZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz; spf=pass smtp.mailfrom=nabijaczleweli.xyz; dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b=jOz0/JQo; arc=none smtp.client-ip=139.28.40.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabijaczleweli.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabijaczleweli.xyz header.i=@nabijaczleweli.xyz header.b="jOz0/JQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nabijaczleweli.xyz;
	s=202505; t=1749039526;
	bh=Sy31JKM7/PuGbGxr+JNLABhQ28VTKAgZaYvANIAsQbc=;
	h=Date:From:To:Subject:From;
	b=jOz0/JQoLIBUK8liTs01m0dsoHA9nmCOzzd2YnCWxq7vJbka/KHFfMx0nTnOlB+u7
	 eic7ysSeK8YU+Sn7+w9TCzGs7qJBWcl/3Z8cY4wV9Zqj4odAro3p3I2HkSL6nrzK5i
	 uk4RC8KvbrAqFR7FwVidupRCyoBJazD0owbW6P0hTW85JiedWLe5jgU2P1FBpGhcHG
	 d5EEPo3JEwM7q8QrVVH44Ry7L3hH8NlIqea+/tKoSC2eyZ7afKy2kCirKZOFzV2Vr3
	 +wKykvImJYUwqsbfvYXFnPGqP5phLcXjoGYPPWnFAbuRrnw3nXLbOzH/yTHc6SiMiT
	 r8rdjjTOca4LA==
Received: from tarta.nabijaczleweli.xyz (unknown [192.168.1.250])
	by tarta.nabijaczleweli.xyz (Postfix) with ESMTPSA id 4C1C62C4A;
	Wed,  4 Jun 2025 14:18:46 +0200 (CEST)
Date: Wed, 4 Jun 2025 14:18:46 +0200
From: 
	Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
To: Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] microblaze: fix typos in Kconfig
Message-ID: <2pg4pexvl2guyww56tnjrt3hjsb6bqtccmpkzt42sqz3igcq56@tarta.nabijaczleweli.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jd3zt4wx6ib2ttjj"
Content-Disposition: inline
User-Agent: NeoMutt/20231221-2-4202cf-dirty


--jd3zt4wx6ib2ttjj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

optimalize -> optimize, these configs turn the functions on instead of
allowing them to be turned on, consistent pluralisation

Signed-off-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
---
v1: <f6e465fee5a824a67be1ae7c3bc1b72adcf9471f.1746558529.git.nabijaczleweli=
@nabijaczleweli.xyz>

 arch/microblaze/Kconfig.platform | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/microblaze/Kconfig.platform b/arch/microblaze/Kconfig.pla=
tform
index 7795f90dad86..9cf9007ed69a 100644
--- a/arch/microblaze/Kconfig.platform
+++ b/arch/microblaze/Kconfig.platform
@@ -8,10 +8,10 @@
 menu "Platform options"
=20
 config OPT_LIB_FUNCTION
-	bool "Optimalized lib function"
+	bool "Optimized lib function"
 	default y
 	help
-	  Allows turn on optimalized library function (memcpy and memmove).
+	  Turns on optimized library functions (memcpy and memmove).
 	  They are optimized by using word alignment. This will work
 	  fine if both source and destination are aligned on the same
 	  boundary. However, if they are aligned on different boundaries
@@ -19,13 +19,13 @@ config OPT_LIB_FUNCTION
 	  on MicroBlaze systems without a barrel shifter.
=20
 config OPT_LIB_ASM
-	bool "Optimalized lib function ASM"
+	bool "Optimized lib function ASM"
 	depends on OPT_LIB_FUNCTION && (XILINX_MICROBLAZE0_USE_BARREL =3D 1)
 	depends on CPU_BIG_ENDIAN
 	default n
 	help
-	  Allows turn on optimalized library function (memcpy and memmove).
-	  Function are written in asm code.
+	  Turns on optimized library functions (memcpy and memmove).
+	  They are written in assembly.
=20
 # Definitions for MICROBLAZE0
 comment "Definitions for MICROBLAZE0"
--=20
2.39.5

--jd3zt4wx6ib2ttjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEfWlHToQCjFzAxEFjvP0LAY0mWPEFAmhAOaUACgkQvP0LAY0m
WPEF+w/+IABKwNG/sgvDUZLq1GDAcfnfdvb73L37OkutIx9axla48J8NiGfgc0n9
xwapfclYkMjQiEDcY7SRvpGQFrLdFKACEA1Yd90oChuRJHBNtueLpbkEfod5uOXf
USWM0iztkjsdsGkVeY6FNHd6ZZXNymSWfaSD8qmkP33jFNK+pp0NZvqsWnFl8Jh8
oZLTWx3WOnneMsKRqjdx8KNrkqf+GHYXrdNi8fJUDam8kGnNbZgKH2pyzsZbP7zJ
5KxmolZY+FvLEhsFlikm4gA8VQq7KXZzeqRuus6FXwcnIHJpjr18yBoTRCGO+/Y3
pcEjAH3Sy0kkkNxbXGaHqBPGlnJIopsRfEEHFizZVgFf+f+oEK0NwZrPJUtBeVZw
t2kDfeYPcKhTs6YOUiC22vvSLJ0lhl5InimrVgxeW+AxUcFqLEO9CalEEjiX+1+m
vaj6Im2Odeq1Mv9rqTMzO73gYEm2sE2Ht/2Ka0uh4ZtTAwXrg3fBrWDGKrDpYa2h
N4D/w/eXTUcLKPZ43t9imqI02NCi9jXCDZHLcaqnH1SkkKdI+nZM+HnxAqgRuEU7
xSu45s4gHiik80q09/KJ5RUcCVLAAvEOIUXVe8GtO65blY2EFA8Bjg5Olx24bLfQ
QriAU3fy4O6P/PsH5ojzb8+jW7e8Q+vOSW3Ic+tbAxPbZyH/6fY=
=TYbJ
-----END PGP SIGNATURE-----

--jd3zt4wx6ib2ttjj--
