Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615AA22F74D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747392160; cv=none; b=U7yK6SKXeJsRmW/9JjfcGvJOwdUx2FB0OsjYVfXM0mjlzrc2FMlsX+9RxtOeOi2UtQ4MVENHinPH2tivftt4d/+yt23ZyNV4R7IjjD+r/VJUf0JKNrukDpuFDDBTnea/XDp6bklh43L0y2z73hP7Dx4916QpCtt9gp9zAQHcm1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747392160; c=relaxed/simple;
	bh=5S5LCJKk0So/T0veEYnMbllxlYVebk+O5gwQW07D7hc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mQhbJwH3T8DuEgkjPfdjlgkQEiXOltsJJLyK4pgRknOGcf8q8XYC2Lt149PKgU3QPl1P/HWxpk5h25DXXwBZFkfygZo/gkKEF+HZ4bb9PYzzfwRkzMpMu6mgTtajNpXFLr+vW9I7X1dWut6uGWi3e4i0SXBGuZYIteOAnvAjaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=sjZmGPmQ; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sjZmGPmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1747392150; x=1747651350;
	bh=5S5LCJKk0So/T0veEYnMbllxlYVebk+O5gwQW07D7hc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=sjZmGPmQO2BeCpJF94hzv0d67SMY1MYH/IZ0yOjwTy09QXaNbth7Lfw1+P0JOfIYJ
	 RPc57CIk+uuWMs1ZaMAFjOmYI74MGd49m+5ErywHCtzgLrKHnx9EulkUaANqGJUYBd
	 vyrfk2wMtNE9A+NflZ6hKKIE22uAabcAb7ztTBLaU/gAIn8TXSPpvDmHx8fZRcYe1v
	 u824yQRfjmnOSYXVrM/YJRdPLTGu/jbeeV8mXk42qQieg59PWueVEUECA+Zpc9xlIN
	 L2RWTNe5hq6fnOIO+Vj7EuWk2OplsKgGYK2x00wuO5D9wAug6G+J03AZT/1eFmFSw4
	 SMf63wKPw6U1A==
Date: Fri, 16 May 2025 10:42:25 +0000
To: intel-xe@lists.freedesktop.org
From: Harry Austen <hpausten@protonmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Harry Austen <hpausten@protonmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4] drm/xe: Allow building as kernel built-in
Message-ID: <20250516104210.17969-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 09e2a1a12e00f3a2b0e22c797cd769bce3479781
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
v4: Add Jani Nikula's Acked-by tag
v3: Simplify KUNIT dependency, as suggested by Jani Nikula
v2: Ensure DRM_XE_DISPLAY and DRM_I915 can't both be built-in

 drivers/gpu/drm/xe/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 9bce047901b22..214f40264fa12 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 =09tristate "Intel Xe Graphics"
-=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
+=09depends on DRM && PCI && MMU
+=09depends on KUNIT || KUNIT=3Dn
 =09select INTERVAL_TREE
 =09# we need shmfs for the swappable backing store, and in particular
 =09# the shmem_readpage() which depends upon tmpfs
@@ -51,7 +52,7 @@ config DRM_XE
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


