Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D641FDA89
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615773; cv=none; b=qx1TzDAejd7vfwzHB0CfDaXrd7OSWiI2wBbNz92jxHM+bhOGnYb6p64phs/VPKi0dV6VcbgiKhjMKxWp6XcQ0X56gzwkbNzMfGQNDa06DBTOQa80ucwErtSbEH2uP0TYhHNrJDzyAlOy9FuoAF3bAOGI8alrpIU4fVmR7VfHHhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615773; c=relaxed/simple;
	bh=EYOCGZRsfaORcPeGdBLh7rR5Syjzpp11LjXTO0MrAog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4s86McJPO+XCyHt3nluOYUq8ad3XFk7j4aTcgApdukPDmKGqOHLsCXBieN1vaNOIxSsD4VYOtRsyvQRCHgya+WJe6ZAfZXPmiVaEQj+GgqiVrmlEb4MrVo4o05+8UpcyfXfK73Fn5ZgF//AKr1hvRplv2iIMtr2kMiR67raqgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYOLo40x; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYOLo40x"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso522365ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615770; x=1744220570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiOyM3S4jOaHGGlz5AF/FsMWLYpHRqSO4fLf+H68uvk=;
        b=fYOLo40x4G4sCAPFiUAWaYGCqbTu9RqpG9OnYDK0UPx9hT7Y5PQokURnIEoA6beWZx
         e86oZJMkmIyLpB9Z7r7vDJdKG3bQ5/cln3DInI515r8YfSH+aekq3x0FSsKv1yvLutw0
         CJDXQTEFmMMri71UFYYhdmD0XczF5bbu6N3kWtttn1Ba8aY5chr7Sq8qqXIYVFEVlabT
         Xzd7tFWX9rDx1rS/Gh76IWtxOSFuaqUi77+QcgyrDVTKY7AzDv78ajCtVS26xDKfEHYv
         zseaJr6EjhLuIUFxfN+kx1uJx6MFxFtFlmwWe3cvYndLlK3INoRqbssI0nrnML4effr9
         7llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615770; x=1744220570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiOyM3S4jOaHGGlz5AF/FsMWLYpHRqSO4fLf+H68uvk=;
        b=fLPSpI5AKrobzK0BCCEqnj+J0X00biy7id5JnPHMe8v8BY9SCYcRBQSMx/CgABo7ud
         F7w8fceordmTIaaO+16bcqbmVKWn3g3U4X0gNcLdqNULZJgCFsy0BMVQ0uKNtA9K+ssx
         xNm4zeFCv3iTeGMCjymMM0cj3CsZZD/uZI4qibKQXJm2Cb3CgfUdjnt4Kp+a7z0b+9jo
         ykO4733IrFjBQnOn16GKS8P/HB9EyVNnUISpSNy5t5L41p/zvpyCMKKM4ShZENhK0HW8
         OlzJqwSgczliuU5pOSV1qkxv8KLcvWc7FxpuyKzsV0VlYihJzNRQqIpgX92nqfZJGSHM
         U+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWF8jJxQQW7bl9LNZe0kp5N4bmrujR72F9JJSgh/0KFP+2ZT0p9Uk22VU4FJzTgbQrsPxroaO0ZWGNFjwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUDzNfmlf4rrgdpTsD4j3b+fx8C4OWLtcOTHaPJuR0vAVZDrHL
	Y5GHDOM/B82Ud6yUy/eOQQhEGFbF3p6N6KDvumG8LwwHSMiulJTy
X-Gm-Gg: ASbGncsOeHB8kvN48kaeRvKFYe3MZtcC3k8kow3+0BglqtZXqpBWtEGylUUMisU3siu
	m/hsfXy7bm0Ysx9PpIspNbSVOR1qbNC6b/1bXucFgkCiqFs8+5mOjmZN+MTXhbBGdPFS3shzxj0
	GEcFcyLCC1EihmWqXasJDQ1ZKOEZ/qjD2vTW5b+RWjuSWb5pycPjUJyZJI0+pmxlTZloz//0Uun
	wtUC+/8adCuLZswZ8GTgt6eIxLyAAbMZpnYobJksr05A6SbHIAsCtpD07QJyiSYSwEXcH+8+n+X
	dDf1re9w4TMCopM/cni0pfR3/yEJqU1xlT9kB67rv7d/V10HEPbmd51ZD5gmjLuTEWldbbpd67H
	7Kw==
X-Google-Smtp-Source: AGHT+IEmCAdxBmK0dq3RonyKvIJjIp5sHVor6eltDwW67xuLu5GGG8D2N9ixjYNq41QL7O0NfYR3PA==
X-Received: by 2002:a05:6e02:4401:20b0:3d6:cb9b:cbd6 with SMTP id e9e14a558f8ab-3d6cb9bcef2mr55037985ab.13.1743615770553;
        Wed, 02 Apr 2025 10:42:50 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 37/54] drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
Date: Wed,  2 Apr 2025 11:41:39 -0600
Message-ID: <20250402174156.1246171-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the dyndbg-api-fix, replace DECLARE_DYNDBG_CLASSMAP with
DRM_CLASSMAP_USE.  This refs the defined & exported classmap, rather
than re-declaring it redundantly, and error-prone-ly.

This resolves the appearance of "class:_UNKNOWN_" in the control file
for the driver's drm_dbg()s.

Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 61c7c2c588c6..68ba17eb2541 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -43,17 +43,7 @@
 
 #include "drm_dp_helper_internal.h"
 
-DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
-			"DRM_UT_CORE",
-			"DRM_UT_DRIVER",
-			"DRM_UT_KMS",
-			"DRM_UT_PRIME",
-			"DRM_UT_ATOMIC",
-			"DRM_UT_VBL",
-			"DRM_UT_STATE",
-			"DRM_UT_LEASE",
-			"DRM_UT_DP",
-			"DRM_UT_DRMRES");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 struct dp_aux_backlight {
 	struct backlight_device *base;
-- 
2.49.0

