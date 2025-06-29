Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BCF2A8C1
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751201483; cv=none; b=E89fI4LReGD9qnju0LPjvVTzTC2K5LJobaM2fnF72pqO0k+jZRhVhUHEPTQJ9S/77HDY/mYhTlbJgZ8CoGVpygZzPwCfswjVdRsB2RQPInQ+aYPbB2vpapLdPlwRgUg4Mz+j5U8pHrBDK9tklTPVzWprGgWjTjPB1+2j5YreD2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751201483; c=relaxed/simple;
	bh=f3DfRpajsxmQgEZaY45qg/eKJcM6af3XcopfHWNDkc8=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=p9AakpQmWgDofi8DDJjYOnNQ+hDU+QkXGqpnI2lpWfyiXWnNZ381EZcDRmSwhDsOqGFuGqiGfO7/NNupwoyh5hD155vf9fyUGNAdZF7+P7nrAzyf2VjRLrEKP8zrdOtpHZHemM0oAWBsTqclHNPhPM0r9vyl76SqUz70AO4+E8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=EUmwRiM3; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="EUmwRiM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751201473; x=1751460673;
	bh=f3DfRpajsxmQgEZaY45qg/eKJcM6af3XcopfHWNDkc8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=EUmwRiM3MRZ/09/Pg8NzAmZSKxa+z4r2+iqdh146zDizwTShXL+MzvXFqpSUDhSpU
	 A0+qgQ/7kxYGDv/ycuAh5bQkUjp0WjYdW+A6p6XMT0fPDbKLxTaCjQa9cEVm5cifbF
	 54X5ilndFWMGO6R1pTyUF+JKKIBe7iZPJQtdp/dgbl/ewPUxgKbSolsvQPfOc8ZGV9
	 mRZ/p2TXYhUAiVbB9CmELtglWpApA15MZWK0jJuSBvmCRCbbSzMVS5nAHGSDGGWc6B
	 CYs2IV66uQ+WuaLCfMaCJqE6rH7305R+2RUvOmjCZ8wN+6cyG+MufiYXDxq2UyZ/EF
	 Da8wsFl0V5ecA==
Date: Sun, 29 Jun 2025 12:51:11 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: andreasx0 <andreasx0@protonmail.com>
Subject: [PATCH] x86/dmi: Fix misaligned dmi_alloc use on dmi_scan.c by using struct alignment  On x86, dmi_alloc() uses extend_brk() with only 4-byte alignment, which can cause UBSAN warnings when accessing struct dmi_device, whose members require 8-byte alignment.  Fix this by aligning allocations to the maximum of sizeof(int) and __alignof__(struct dmi_device).
Message-ID: <c4L1q6uye90TLiBKe-p6Y7JDbmIdFz5c11Ys5bC8q81J03L-pkXax2Mm43NuMML2WA4eXhOUFeA48YKF7mLg_TfEccxt5hEoKTxmRrg7Zas=@protonmail.com>
Feedback-ID: 4793980:user:proton
X-Pm-Message-ID: 6c02c2d58161d1e8a1861508dc8729646f986897
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------56b8ea581a7f8fab71fc77fff0529130f98ee500912bd48c7e098d27b2d01904"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------56b8ea581a7f8fab71fc77fff0529130f98ee500912bd48c7e098d27b2d01904
Content-Type: multipart/mixed;boundary=---------------------461f1a34e71016e35790b7dab6389d11

-----------------------461f1a34e71016e35790b7dab6389d11
Content-Type: multipart/alternative;boundary=---------------------3abedff8d7a7ed8f977cab41c5abd159

-----------------------3abedff8d7a7ed8f977cab41c5abd159
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

From b31d085855f6ff0db5f465ed936cbce1b69d366c Mon Sep 17 00:00:00 2001From=
: Andrew <andreasx0@protonmail.com>
Date: Sun, 29 Jun 2025 15:33:26 +0300
Subject: [PATCH] x86/dmi: Fix misaligned dmi_alloc use on dmi_scan.c by us=
ing struct alignment

On x86, dmi_alloc() uses extend_brk() with only 4-byte alignment,
which can cause UBSAN warnings when accessing struct dmi_device,
whose members require 8-byte alignment.

Fix this by aligning allocations to the maximum of sizeof(int) and
__alignof__(struct dmi_device).

Signed-off-by: Andrew <andreasx0@protonmail.com>
---
=C2=A0arch/x86/include/asm/dmi.h | 2 +-
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/dmi.h b/arch/x86/include/asm/dmi.h
index b825cb201251..2d6c3bea718c 100644
--- a/arch/x86/include/asm/dmi.h
+++ b/arch/x86/include/asm/dmi.h
@@ -10,7 +10,7 @@

=C2=A0static __always_inline __init void *dmi_alloc(unsigned len)
=C2=A0{
- return extend_brk(len, sizeof(int));
+ return extend_brk(len, max_t(size_t, sizeof(int), __alignof__(struct dmi=
_device)));
=C2=A0}

=C2=A0/* Use early IO mappings for DMI because it's initialized early */
--
2.50.0


/* SPDX-License-Identifier: GPL-2.0 */#ifndef _ASM_X86_DMI_H
#define _ASM_X86_DMI_H

#include <linux/compiler.h>
#include <linux/init.h>
#include <linux/io.h>

#include <asm/setup.h>

static __always_inline __init void *dmi_alloc(unsigned len)
{
return extend_brk(len, max_t(size_t, sizeof(int), __alignof__(struct dmi_d=
evice)));
}

/* Use early IO mappings for DMI because it's initialized early */
#define dmi_early_remap early_memremap
#define dmi_early_unmap early_memunmap
#define dmi_remap(_x, _l) memremap(_x, _l, MEMREMAP_WB)
#define dmi_unmap(_x) memunmap(_x)

#endif /* _ASM_X86_DMI_H */
-----------------------3abedff8d7a7ed8f977cab41c5abd159
Content-Type: multipart/related;boundary=---------------------c47e4aafd176f9b481c369c4899a3aec

-----------------------c47e4aafd176f9b481c369c4899a3aec
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: base64

PHNwYW4+RnJvbSBiMzFkMDg1ODU1ZjZmZjBkYjVmNDY1ZWQ5MzZjYmNlMWI2OWQzNjZjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMTwvc3Bhbj48ZGl2PjxzcGFuPkZyb206IEFuZHJldyAmbHQ7PGEg
dGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciBub2ZvbGxvdyBub29wZW5lciIgaHJlZj0i
bWFpbHRvOmFuZHJlYXN4MEBwcm90b25tYWlsLmNvbSI+YW5kcmVhc3gwQHByb3Rvbm1haWwuY29t
PC9hPiZndDs8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj5EYXRlOiBTdW4sIDI5IEp1biAyMDI1IDE1
OjMzOjI2ICswMzAwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+U3ViamVjdDogW1BBVENIXSB4ODYv
ZG1pOiBGaXggbWlzYWxpZ25lZCBkbWlfYWxsb2MgdXNlIG9uIGRtaV9zY2FuLmMgYnkgdXNpbmcg
c3RydWN0IGFsaWdubWVudDwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPk9u
IHg4NiwgZG1pX2FsbG9jKCkgdXNlcyBleHRlbmRfYnJrKCkgd2l0aCBvbmx5IDQtYnl0ZSBhbGln
bm1lbnQsPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+d2hpY2ggY2FuIGNhdXNlIFVCU0FOIHdhcm5p
bmdzIHdoZW4gYWNjZXNzaW5nIHN0cnVjdCBkbWlfZGV2aWNlLDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPndob3NlIG1lbWJlcnMgcmVxdWlyZSA4LWJ5dGUgYWxpZ25tZW50Ljwvc3Bhbj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuPkZpeCB0aGlzIGJ5IGFsaWduaW5nIGFsbG9jYXRpb25z
IHRvIHRoZSBtYXhpbXVtIG9mIHNpemVvZihpbnQpIGFuZDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFu
Pl9fYWxpZ25vZl9fKHN0cnVjdCBkbWlfZGV2aWNlKS48L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj48c3Bhbj5TaWduZWQtb2ZmLWJ5OiBBbmRyZXcgJmx0OzxhIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vcmVmZXJyZXIgbm9mb2xsb3cgbm9vcGVuZXIiIGhyZWY9Im1haWx0bzphbmRyZWFz
eDBAcHJvdG9ubWFpbC5jb20iIHRpdGxlPSJodHRwczovL21haWwucHJvdG9uLm1lbWFpbHRvOmFu
ZHJlYXN4MEBwcm90b25tYWlsLmNvbSIgbGlua3RpdGxlPSJodHRwczovL21haWwucHJvdG9uLm1l
bWFpbHRvOmFuZHJlYXN4MEBwcm90b25tYWlsLmNvbSIgbGluay1yZXZlYWxlci1leHRlbnNpb24t
cGFyc2VkLWZsYWc9IiIgc3RhdGU9InRoaXJkcGFydHkiPmFuZHJlYXN4MEBwcm90b25tYWlsLmNv
bTwvYT4mZ3Q7PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+LS0tPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+Jm5ic3A7YXJjaC94ODYvaW5jbHVkZS9hc20vZG1pLmggfCAyICstPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+ZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2RtaS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vZG1pLmg8L3Nw
YW4+PC9kaXY+PGRpdj48c3Bhbj5pbmRleCBiODI1Y2IyMDEyNTEuLjJkNmMzYmVhNzE4YyAxMDA2
NDQ8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4tLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9kbWku
aDwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2RtaS5o
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+QEAgLTEwLDcgKzEwLDcgQEA8L3NwYW4+PC9kaXY+PGRp
dj48c3Bhbj4mbmJzcDs8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDtzdGF0aWMgX19hbHdh
eXNfaW5saW5lIF9faW5pdCB2b2lkICpkbWlfYWxsb2ModW5zaWduZWQgbGVuKTwvc3Bhbj48L2Rp
dj48ZGl2PjxzcGFuPiZuYnNwO3s8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4tCXJldHVybiBleHRl
bmRfYnJrKGxlbiwgc2l6ZW9mKGludCkpOzwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPisJcmV0dXJu
IGV4dGVuZF9icmsobGVuLCBtYXhfdChzaXplX3QsIHNpemVvZihpbnQpLCBfX2FsaWdub2ZfXyhz
dHJ1Y3QgZG1pX2RldmljZSkpKTs8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4mbmJzcDt9PC9zcGFu
PjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+Jm5ic3A7Lyog
VXNlIGVhcmx5IElPIG1hcHBpbmdzIGZvciBETUkgYmVjYXVzZSBpdCdzIGluaXRpYWxpemVkIGVh
cmx5ICovPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+LS0gPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+
Mi41MC4wPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxNHB4OyBjb2xvcjogcmdiKDAsIDAsIDApOyBiYWNrZ3JvdW5kLWNv
bG9yOiByZ2IoMjU1LCAyNTUsIDI1NSk7Ij48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1p
bHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0cHg7IGNvbG9yOiByZ2IoMCwgMCwg
MCk7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNTUsIDI1NSwgMjU1KTsiPjxicj48L2Rpdj48ZGl2
IHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTRweDsg
Y29sb3I6IHJnYigwLCAwLCAwKTsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI1NSwgMjU1LCAyNTUp
OyI+PHNwYW4+PHNwYW4+LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi88L3Nw
YW4+PGRpdj48c3Bhbj4jaWZuZGVmIF9BU01fWDg2X0RNSV9IPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+I2RlZmluZSBfQVNNX1g4Nl9ETUlfSDwvc3Bhbj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PjxzcGFuPiNpbmNsdWRlICZsdDtsaW51eC9jb21waWxlci5oJmd0Ozwvc3Bhbj48L2Rpdj48ZGl2
PjxzcGFuPiNpbmNsdWRlICZsdDtsaW51eC9pbml0LmgmZ3Q7PC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+I2luY2x1ZGUgJmx0O2xpbnV4L2lvLmgmZ3Q7PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjxkaXY+PHNwYW4+I2luY2x1ZGUgJmx0O2FzbS9zZXR1cC5oJmd0Ozwvc3Bhbj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PjxzcGFuPnN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgX19pbml0IHZvaWQg
KmRtaV9hbGxvYyh1bnNpZ25lZCBsZW4pPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+ezwvc3Bhbj48
L2Rpdj48ZGl2PjxzcGFuPglyZXR1cm4gZXh0ZW5kX2JyayhsZW4sIG1heF90KHNpemVfdCwgc2l6
ZW9mKGludCksIF9fYWxpZ25vZl9fKHN0cnVjdCBkbWlfZGV2aWNlKSkpOzwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuPn08L3NwYW4+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj4vKiBVc2Ug
ZWFybHkgSU8gbWFwcGluZ3MgZm9yIERNSSBiZWNhdXNlIGl0J3MgaW5pdGlhbGl6ZWQgZWFybHkg
Ki88L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4jZGVmaW5lIGRtaV9lYXJseV9yZW1hcAkJZWFybHlf
bWVtcmVtYXA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4jZGVmaW5lIGRtaV9lYXJseV91bm1hcAkJ
ZWFybHlfbWVtdW5tYXA8L3NwYW4+PC9kaXY+PGRpdj48c3Bhbj4jZGVmaW5lIGRtaV9yZW1hcChf
eCwgX2wpCW1lbXJlbWFwKF94LCBfbCwgTUVNUkVNQVBfV0IpPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4+I2RlZmluZSBkbWlfdW5tYXAoX3gpCQltZW11bm1hcChfeCk8L3NwYW4+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PHNwYW4+I2VuZGlmIC8qIF9BU01fWDg2X0RNSV9IICovPC9zcGFuPjxicj48L3Nw
YW4+PC9kaXY+PHNwYW4+PC9zcGFuPg==
-----------------------c47e4aafd176f9b481c369c4899a3aec--
-----------------------3abedff8d7a7ed8f977cab41c5abd159--
-----------------------461f1a34e71016e35790b7dab6389d11
Content-Type: application/pgp-keys; filename="publickey - andreasx0@protonmail.com - 0xF61BB148.asc"; name="publickey - andreasx0@protonmail.com - 0xF61BB148.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - andreasx0@protonmail.com - 0xF61BB148.asc"; name="publickey - andreasx0@protonmail.com - 0xF61BB148.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWkk3bTN4WUpLd1lCQkFI
YVJ3OEJBUWRBN1NSTmw4bVlHN2lIZUY5QytpNWdzbXBZdUJpeXQzYjYKM0FlNGN4d1c3cUxOTTJG
dVpISmxZWE40TUVCd2NtOTBiMjV0WVdsc0xtTnZiU0E4WVc1a2NtVmhjM2d3ClFIQnliM1J2Ym0x
aGFXd3VZMjl0UHNLTUJCQVdDZ0ErQllKa2p1YmZCQXNKQndnSmtMWm8xSzhrbmExUQpBeFVJQ2dR
V0FBSUJBaGtCQXBzREFoNEJGaUVFOWh1eFNGUmFIWUNLNWdMOHRtalVyeVNkclZBQUFLOWsKQVFD
ODlZS20rT3YvdDl3OVo3WS95Z2x1anl2dFBPZkcrenpDVDNtcmpVTU52QUQvYTE0eENQZGVTSXFk
CnFRM1dhcktycXpnczVlSzBSNHVTU1h0MU42b0dUZy9PT0FSa2p1YmZFZ29yQmdFRUFaZFZBUVVC
QVFkQQpYUUE5aGdVcjRYazRXemU1TVhOTUIwOEMvcEtBR0lrcWNvd2w2MmpjV1cwREFRZ0h3bmdF
R0JZSUFDb0YKZ21TTzV0OEprTFpvMUs4a25hMVFBcHNNRmlFRTlodXhTRlJhSFlDSzVnTDh0bWpV
cnlTZHJWQUFBR2ZICkFRRDZkUmxnZmtKZWFyaHdLWHFtbWlHTVlmU1c0V3hhMVFvSm9JbHdzQXQz
YndEL1hTWmo4ZUFibStpMQpxaDRhbWh0eTFHYitTMGV3MVNicnRrSjREWmNNdUFRPQo9dGZYVQot
LS0tLUVORCBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCg==
-----------------------461f1a34e71016e35790b7dab6389d11--

--------56b8ea581a7f8fab71fc77fff0529130f98ee500912bd48c7e098d27b2d01904
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmhhNrcJkLZo1K8kna1QRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd+xbgGnNcKtqg+Bac2CmUM5mh2haPpR21XYmw3
MCyxuxYhBPYbsUhUWh2AiuYC/LZo1K8kna1QAABdvQD+LjwpOm87p/Q8RTaA
WPbu0MaCvVPTabrWOudPi2d5GEMA/35wgSJOvSwJSQLOgQnrW6ekVRBP9WEq
arPDNYrfngMP
=/Bia
-----END PGP SIGNATURE-----


--------56b8ea581a7f8fab71fc77fff0529130f98ee500912bd48c7e098d27b2d01904--

