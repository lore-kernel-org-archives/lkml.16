Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B658196
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745289081; cv=none; b=l8hfXamjsaoXZKsVlVv6ZCSVYgpSL5CtGx6py2g5QA+UI4tQwD/aa6PJ0RcTQQhMKavtTAs2DL/vZ2ya2PytBKo6y3Ynvy0Dk6PPqu3AwX3OD7f0p4dypG1uORNGnKF1B5+TIW0Gvu0imMMzO9vUJdK/aXL/1+YXlDQ91w/qky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745289081; c=relaxed/simple;
	bh=H+0htWuNIIx+zznLpZyBE4j0vF7Y35Xn+8WkoVnrfMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lYSbW8s96i0r3x06rlP8p9+wRP/vZVsfrcz22bKXeN+SvVmckOpzeO5ErwobDkMmWtJoww0Yjx7QGrdmyIrtETgcpctWVP4R8QQWEfQC9xkp78R308oBBOq9hqlwBHV7o/oSdaZBI8MiqWIgckgPJ3yudOnu3JBdyxikbAlsWXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 21 Apr 2025 22:31:13 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/addnote: Fix overflow on 32-bit builds
Message-ID: <2025042122-mustard-wrasse-694572@boujee-and-buff>
Mail-Followup-To: linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7zvi5okcyrtudtse"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--7zvi5okcyrtudtse
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] powerpc/addnote: Fix overflow on 32-bit builds
MIME-Version: 1.0

The PUT_64[LB]E() macros need to cast the value to unsigned long long
like the GET_64[LB]E() macros. Caused lots of warnings when compiled
on 32-bit, and clobbered addresses (36-bit P4080).

Signed-off-by: Ben Collins <bcollins@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/boot/addnote.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/addnote.c b/arch/powerpc/boot/addnote.c
index 53b3b2621457d..78704927453aa 100644
--- a/arch/powerpc/boot/addnote.c
+++ b/arch/powerpc/boot/addnote.c
@@ -68,8 +68,8 @@ static int e_class =3D ELFCLASS32;
 #define PUT_16BE(off, v)(buf[off] =3D ((v) >> 8) & 0xff, \
 			 buf[(off) + 1] =3D (v) & 0xff)
 #define PUT_32BE(off, v)(PUT_16BE((off), (v) >> 16L), PUT_16BE((off) + 2, =
(v)))
-#define PUT_64BE(off, v)((PUT_32BE((off), (v) >> 32L), \
-			  PUT_32BE((off) + 4, (v))))
+#define PUT_64BE(off, v)((PUT_32BE((off), (unsigned long long)(v) >> 32L),=
 \
+			  PUT_32BE((off) + 4, (unsigned long long)(v))))
=20
 #define GET_16LE(off)	((buf[off]) + (buf[(off)+1] << 8))
 #define GET_32LE(off)	(GET_16LE(off) + (GET_16LE((off)+2U) << 16U))
@@ -78,7 +78,8 @@ static int e_class =3D ELFCLASS32;
 #define PUT_16LE(off, v) (buf[off] =3D (v) & 0xff, \
 			  buf[(off) + 1] =3D ((v) >> 8) & 0xff)
 #define PUT_32LE(off, v) (PUT_16LE((off), (v)), PUT_16LE((off) + 2, (v) >>=
 16L))
-#define PUT_64LE(off, v) (PUT_32LE((off), (v)), PUT_32LE((off) + 4, (v) >>=
 32L))
+#define PUT_64LE(off, v) (PUT_32LE((off), (unsigned long long)(v)), \
+			  PUT_32LE((off) + 4, (unsigned long long)(v) >> 32L))
=20
 #define GET_16(off)	(e_data =3D=3D ELFDATA2MSB ? GET_16BE(off) : GET_16LE(=
off))
 #define GET_32(off)	(e_data =3D=3D ELFDATA2MSB ? GET_32BE(off) : GET_32LE(=
off))
--=20
2.49.0


--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--7zvi5okcyrtudtse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgG/3EACgkQXVpXxyQr
Is/yBQ/+OH7WmDD0UgLyzSDN8gylSgSZxSBsTU1JQOVVCXY68ULJiqoJgAtpzboC
wREgv6f8N6AzyklLxwlGDNfUSOespy9c76Z1/Hr0uoUwnUy1VA1ODKSQJIpgIDPZ
40mj9Fa1nhMnFJ6bS+ljYzSn6MRzEs2HOv9vxsDUWoZW5mdLAzcVHVZ167e81l8M
/31tWQOymIrS0Ink+HpXyYvsv6Pr40iRCCD5bWnsBHqrbF/dCJ/L7VAmPSJeB6F6
FDAggldX4gvLDjApYkXV/CLX8zbCnXTQV6D68FSeMPuK6OnNsU2FVkTIsbb5g7lZ
282OQYwc36fYizRxW/LXvMYCknE3BfXAzjwFS4DUzOXyauPgn+IXGZCkyOeCoLaA
lqvKNZsPNQP98clLGkI9Bh0yoQbL8tLCd6/icdIoJuCCPX+58UeCcJcaEUMKzK8q
SAkfB14xtiKgBG5xfinUBx4fKxrEefX2Cn+WJy1/gMvf4JpqBJeaMmccxh8QuWPP
o0HdNi7uI+/+VbGkGbevcHsetrjIaf0cmxippf8l656OHAcAg2wfbts/M3ta+AgV
UF5JlunaoEO3n9Ju56NlsQSllnch46F+oaUADF6rvhQtXkOPboECXEVOjVLBgBW2
br+5nhZoYlGhc08lQ3zJ1+Jlyy53DUofCOO00BqRBtjdfACrljs=
=Q31h
-----END PGP SIGNATURE-----

--7zvi5okcyrtudtse--
