Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927031FCFDA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615772; cv=none; b=oxWar7HmRsiWXQyUtIwxXpIUIgZcSzsSzz/UQu53BnPl72IrL784jEzoIf3zQ4QkkuWNl9ZAl7oh9rI4KBgXRlB8VwyVLTAGc3huBJ78Fr22qh6fIWbYuNDoJz4moSbfZKmDkh5O0T3qZJWWBd60/XZwgziU+1SR9UH3UvX8XwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615772; c=relaxed/simple;
	bh=aKyMalRer1ldzt2wLGcKVF0D0GrZTYS4hXW1PO/f+rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xu7sSNRAiPZZlAy54PE2Rq8HijNfmXjV8ZJknQYMuEqkktMYlUB1YEj9rT9MN4IC00loB7oFo7K1Q5g8ZbDrMHfq6uLvXkFVkMlO9SwZuEUAKEx9T9OykGzKqb/vjMo9rZYyF1ebAx40CnOg8x6Ow60I8wedmPePwqqHCO2uM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyabwVR0; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyabwVR0"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d5eb0ec2bdso423555ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615770; x=1744220570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+xh63ngQpysf5TdioxYR9h/6SGMYGM5RCAWumi1pq0=;
        b=jyabwVR0x5RngAV4F49vLiXbw1ZgVLqV6yOxptQfZaAN4LQNrYElZLGi4MULwiO3wT
         3XDpv4DnFVIgJc2cMYP0GaTP0qV0eKXScYnX8cQbWhpFySIT7H6pbfmVRYzC8qGdixLj
         pd0PNBmKDf+pKoesYL32R9w8/ZiUmKmDeCM8HIRtKua+MzKUjEEnZCpVweKpGA9gpTKL
         /TdnnVTMgN++0C8T1DIiYVbmDMIi48BomUfdRS8GRX3LOdcNkeqk7f/rfKdRZYk8NIZY
         u8z1EPSNgymwlZspPPdD0LtCP3sUPk01CALEm1pPACV30nD2X7fW3zkjyr4x6uEqTqsm
         A9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615770; x=1744220570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+xh63ngQpysf5TdioxYR9h/6SGMYGM5RCAWumi1pq0=;
        b=HfWq5XTVwCHqr5ks9XBGqu0MOcrTDB40tiyim9d10iyXJfjxsmTsfp5jdVDJ54OlKJ
         wfN5KRBDvzWNHAAvSXKDTcZVlmSZwQz9bb0Z2zJGexiqkSIy/xRUGHLB/lieN59CsKIx
         A5VInzHpokhoIPkQykyE5Sn22z+hSb0e49lOjFBusuBa7NuOiYsdJBPE/VoMm4/0Cwzg
         lhjTwRb1LxmidgTd29yA5L8rOhRpIV9OSZtq9Z8I1hdb1Y4LNWQyIEr5vZ+mVSYDTlvx
         MKv2by4MebJiQ6X2OWdptn1pk71BNnF2UEmLRGfzhY11eG5Klu7kPgYFrreRkUyYRBQi
         svnw==
X-Forwarded-Encrypted: i=1; AJvYcCXhirBPsHLjsjEt2VZz82O1xVbEgo9T4BOtrC5l9WvokoL+0u94uiA+JpjHBu2KOEndCumjXmYCGnbZtgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSm4o5qb/M3DEB6ulvpYDyzYV4qySY3jv9RDmeM0NluR1O4jU
	x2DlEqGVjI3NVuA54yBzM8SM5lpvJmPaq6sAwsM/WkODXW03L6sT
X-Gm-Gg: ASbGncuQe9kBdZiYvFArEN/kLuQCAXN4HjTMnPb1pFxI2epbeF2GmgZ0f2HktJfQBe5
	hdKcLgb60cQ6Z8AcVHM1TqbWP+uStZsEdr+b5iNc64uiA1hWpwGLHaugBqXVoAVMMKtOeWcSnlQ
	IUBYXzV6Rr5kng6WibTCkIPm5jdQ5vghMX/0yY4fYNNN5JdsSpguZEhO4fKBZtYzEwCDn0zR/p2
	6qLx+2OZkOJCyywnsDj0HUmaCDJoRt9LD7bZj+1ytVtKq14jwe1gWC6ZfiKpkSpKfkTU8a0Xs6w
	NXkr30GHYbhucUINdykdnkjmQsh7M4o5IsE4+UmIhRCZJMwfmQtqfcYl2Ta7xaiP0SUdPP99Ov5
	Piw==
X-Google-Smtp-Source: AGHT+IHfVFrzVXMnd2YBb1/YfvvBl5qCe+8rGWdMzMU5nSjNPKKxFlNTX09jmDed7K6kxVwAkyqtVg==
X-Received: by 2002:a05:6e02:184e:b0:3d3:dcb8:1bf1 with SMTP id e9e14a558f8ab-3d5e08eb179mr230026675ab.3.1743615769662;
        Wed, 02 Apr 2025 10:42:49 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:49 -0700 (PDT)
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
Subject: [PATCH v3 36/54] drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
Date: Wed,  2 Apr 2025 11:41:38 -0600
Message-ID: <20250402174156.1246171-37-jim.cromie@gmail.com>
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
 drivers/gpu/drm/drm_crtc_helper.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 0955f1c385dd..1d08d759f238 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -50,17 +50,7 @@
 
 #include "drm_crtc_helper_internal.h"
 
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
 
 /**
  * DOC: overview
-- 
2.49.0

