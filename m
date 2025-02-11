Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5D23C3C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287745; cv=none; b=fKqWnY5O5IIlnxNCx94+RRDJzpmgdcq6EQi9WF9UV4Glo4IUh/belsxyj1zdl077kHNzyzmb6M8+PT6E6Msal/PWTm9HRf3p6fQT/VEduHT4jSD8Nt1exdjqgb9lys1yNKpRDatAIL7ehaTrYVsb9FFe6pq4qZ7JfREs0W14IIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287745; c=relaxed/simple;
	bh=JxJOgeH5lrs9rqunMzcYFJ4r5nO2TqFV4iC06MZ2stY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6Q8dqVPNEmmKE5vezcEOY6UzXBj4g/X0om18iLpqRmKdfRkEiyLd3+vLH922uAVCEmWYWRlvGFAu+dv1ue3rX24bgTh2K/no/nO2Oz/yf8eBafDMhNNvJ5pihcI2J9JEcGO4nrh34Ubeq+sXCip6Ni1ukFA4kMS+nwAdxFRdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o6C6vDFY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o6C6vDFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739287742;
	bh=JxJOgeH5lrs9rqunMzcYFJ4r5nO2TqFV4iC06MZ2stY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o6C6vDFY3PZOcuO1rn3Vg25lfQ/9CbKUdCx6Z/2PE1Nly6WaiUeok09WjNRy7eA54
	 yu/MGaR6Wj2r6cv/0SZR2s4lSFkQrtctAkBKOLCYfTsDGxwU5Bhm/ejkBZdT53E88/
	 YFTEm27Lxhswz439kDzfaIMPq3C5OoOiuUuDxDapMhxm6HNOcNPYEYWwO5ZUOGeBgT
	 MkwHjqys/oSHIydrjRmp3tkqcNLiVV7DEvgBRHDZSPU3SasA/SB5EFym2mwctmAKZq
	 yqMONFAo/PTCl5njgk9UzI1GHPhjLSNDcBZFRHbdMy0G+JS+7WbsPpPLroXnsmWPpR
	 Xwi8VKRv6SDFQ==
Received: from localhost.localdomain (unknown [171.76.80.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90CFE17E014F;
	Tue, 11 Feb 2025 16:28:57 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	boqun.feng@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
Date: Tue, 11 Feb 2025 20:58:05 +0530
Message-ID: <20250211152812.54018-3-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211152812.54018-1-vignesh.raman@collabora.com>
References: <20250211152812.54018-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex
slowpath debugging.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - New patch in the series.

---
 drivers/gpu/drm/ci/build.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
index 274f118533a7..6c0dc10b547c 100644
--- a/drivers/gpu/drm/ci/build.yml
+++ b/drivers/gpu/drm/ci/build.yml
@@ -67,7 +67,7 @@ testing:arm32:
     #
     # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
     # becoming too big for their bootloaders.
-    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
+    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT DEBUG_WW_MUTEX_SLOWPATH"
     UPLOAD_TO_MINIO: 1
     MERGE_FRAGMENT: arm.config
 
@@ -79,7 +79,7 @@ testing:arm64:
     #
     # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
     # becoming too big for their bootloaders.
-    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
+    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT DEBUG_WW_MUTEX_SLOWPATH"
     UPLOAD_TO_MINIO: 1
     MERGE_FRAGMENT: arm64.config
 
@@ -91,7 +91,7 @@ testing:x86_64:
     #
     # db410c and db820c don't boot with KASAN_INLINE, probably due to the kernel
     # becoming too big for their bootloaders.
-    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT"
+    ENABLE_KCONFIGS: "PROVE_LOCKING DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT DEBUG_WW_MUTEX_SLOWPATH"
     UPLOAD_TO_MINIO: 1
     MERGE_FRAGMENT: x86_64.config
 
-- 
2.43.0

