Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D122AE71
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566595; cv=none; b=cZhT+JbB0cM4OPp8VM/aMrJ8i8b5jY6vVwCXAuAz9tGOgcqDVcHrbxzYsDY+mI2E+M3sBteC04C1g2Y/tVshBg3OiGGcSTxNVTjuuW3adfrzR3K5uNTfHALHOKNrz2czp2KUPEBXS3LxlvVZ07yGV3z5j11u6yT5Rg1jODP8kC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566595; c=relaxed/simple;
	bh=pzB+ULPjZJoXWNCIbG47lG7lxSlV7q022ronMCkd2Co=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IXa5OTeso5pBG67oBjJwqwPp3wbUK274Mo/PMtmp/4fPAlIePRI8N98zbuRSyHE3woOJO+lAhTleCCXuLSnZRbC621eLJb8S/kv9Cz4Oy3ho6wNKSl8auNZabB1vppiXbM5X76fmJDapjdWqfO6FSsfTmUp720zf6TLbJNq4h84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=HG0avtgt; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="HG0avtgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1745566590; x=1745825790;
	bh=pzB+ULPjZJoXWNCIbG47lG7lxSlV7q022ronMCkd2Co=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=HG0avtgtjX1JJplmZ2W+xPmQcxNkKBLhOg5j0EHiybAfRtWMWBmgyWc7J+sACxz0L
	 R9lHs89Py8lV2OveRBpvGfGmn1ttoBTbngs99N0ue/vD1CIvGJkuRZiIzoijQWelRa
	 rDwXt1bv3YIzoUcegnBYrd/pYq9y9p2t1yyo4bGMPp1yp3QT/W4uUwdprHofNPAHpk
	 LWRtYy2cZfFCmffg2nHgSL4+ihoF4XeEBpPij3zWLHNSlH4hw8CNjpkff1U8P8oFQG
	 Moewtq6Rp9sB6j63t+9HQU0VZr8Q101D7BO0QEPsDJ++uSbQtdCkMhuBIzow/xHe13
	 UBPlHVw22Vu3w==
Date: Fri, 25 Apr 2025 07:36:23 +0000
To: intel-xe@lists.freedesktop.org
From: Harry Austen <hpausten@protonmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Harry Austen <hpausten@protonmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2] drm/xe: Allow building as kernel built-in
Message-ID: <20250425073534.101976-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: d1dccf1a1237e941559f5aa11cd9a2ed1b6e14c6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Fix Kconfig symbol dependency on KUNIT, which isn't actually required
for XE to be built-in. However, if KUNIT is enabled, it must be built-in
too.

Also, allow DRM_XE_DISPLAY to be built-in. But only as long as DRM_I915
isn't, since that results in duplicate symbol errors.

Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in

 drivers/gpu/drm/xe/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 9bce047901b22..bc63c396d7fef 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 =09tristate "Intel Xe Graphics"
-=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
+=09depends on DRM && PCI && MMU && (m || (y && KUNIT!=3Dm))
 =09select INTERVAL_TREE
 =09# we need shmfs for the swappable backing store, and in particular
 =09# the shmem_readpage() which depends upon tmpfs
@@ -51,7 +51,7 @@ config DRM_XE
=20
 config DRM_XE_DISPLAY
 =09bool "Enable display support"
-=09depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
+=09depends on DRM_XE && (DRM_XE=3Dm || DRM_I915!=3Dy) && HAS_IOPORT
 =09select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 =09select I2C
 =09select I2C_ALGOBIT
--=20
2.49.0


