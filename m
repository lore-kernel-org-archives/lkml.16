Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F55235C14
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581953; cv=none; b=Q5ptzBeWFzXIgt+lBCGTmH/4skmhx6QWgKE7AXF44W1iRGt8sJqxXgjLSiLCgiWXPm/v4XGSSpUFHropkHOkciYWlbPHSjSeSdONNOCMGp9wPT2DLvsEnhKgsVf9mtWitiYIFXnhiGtmlddr/OwPWqa7dhnRsVF0lH78vymR8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581953; c=relaxed/simple;
	bh=22DV/2WcFp8+Zb8dkstxxlNiVBTcBoaxKhkaohG3HVg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O9uTUecwMzAb9GO0G3cvGMGZMkmsHePEaX4SAIPcxTxK6o6FGmGsSQhs84e79Wf3MprtEvF8F9II6UbaNRykx1MSIN+D/Et9nPScxT+M7ns2rfGjbOn34io+TIR5O9X/zU5uBqHX+goyZ+m7j1c6x8LptAUePaD9dKZxJ5u9xqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=eGOPRP9E; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="eGOPRP9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1745581943; x=1745841143;
	bh=22DV/2WcFp8+Zb8dkstxxlNiVBTcBoaxKhkaohG3HVg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=eGOPRP9EyMXYovvxr/C9PVp9RN2HqQ4rvxs8lNAH7n2pa9i9DGBVV6xkQ5qQwxZqH
	 BM/UolStZ3Gq9XvEZr1TLutjmnqtAbKXCwi5Q2PwqH/z6/+cpuA1GFXTWs/4q0tWKP
	 Vgi66kHrPENveoAhA5DYkBli4XxEObhELUJyAxcz1aUAITMD44sYsU/vO49lDdopR4
	 wTdqZlbL1vhCTV5AaMQrRMku/sSfOLWsjVZs4E9mpb9MTwCL2qepZiAh79hpvQmVfu
	 9toD4//eYdgk2a9vWhF90m2lCqA1aFTlh6uvXotDWV/R63qYGvmjekqawHGBorptIs
	 zpZ6uyqfHF2XA==
Date: Fri, 25 Apr 2025 11:52:15 +0000
To: intel-xe@lists.freedesktop.org
From: Harry Austen <hpausten@protonmail.com>
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Harry Austen <hpausten@protonmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>, =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v3] drm/xe: Allow building as kernel built-in
Message-ID: <20250425115148.12815-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 8886096547096976ec602d0c33774f8f26c5f9a0
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


