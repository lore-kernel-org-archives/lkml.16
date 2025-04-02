Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E071FAC4D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615769; cv=none; b=a3jNPRMfQ56W++95yZRcATFMAJdSNDd7sTc/bFCdzjP0zRxGYYHmOPkHQva3EtOpUthzxGE03QHRwcM+keJtEHbTT1Oe95nf5Eh4diW9jAcJzHxd8QeKKnv/T8BYrnDsBtWBum+BenXqf2H8DXPrJ9RmxsdvE3MR1kbroM/KVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615769; c=relaxed/simple;
	bh=JdhZz9HZKZI37pIDrFTiOEKOZseErQXYMwHr4BOJ360=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0J7n5O/Awq057CGm/0B+qmtUKwFdz5Wr89/xbgbNq66vMPTnpNx3kI3kA5V08PUDiIeHXy2XgWpGtC3N4CbKZ92Pmo2d3uKRcEaO09h8d6zxIXeZNU+rj5xqRf6Y7ihtMPp+VZYyuV8T1/iENldkWDDEGUOWqsewZVv0vm4NXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyizNXjK; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyizNXjK"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85db3475637so36367739f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615766; x=1744220566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdzbEW9zH0UE5x9JfjsCyVhdiuYXlGo5WMhyJQ/maLs=;
        b=FyizNXjKPtp4FYuRkMk9HX0VI6MiNrePueewpbOZbHlqYh3VCMk3c1V59HAhSdS1Ns
         niuj0k46Zaq0xFsENuHP8OP8bfySE8aqS/0ISFPoMcsyDNdtcPanaNVAyT70ompCcaea
         9f2foTWuzQjnC6kAr5eIeCJ+emM6B5Q65NfY6D4WZoYfTeEGiqYyRXYH8xoUzKms/0m4
         yZAYi7Or6u+LhvCF1CY/ywCMxRsXBuw0f/stCJzGS3gGMLOuYSoRSwZt6+h7CnIIZSAW
         LEBZj0GXd1pHCX1m5eNLta5P+qzQI9qug0Nxns5v19Vfg9hoNG9ysLrAUnkBNkqMIze2
         v8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615766; x=1744220566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdzbEW9zH0UE5x9JfjsCyVhdiuYXlGo5WMhyJQ/maLs=;
        b=Pzj4haMlgEoRV/XfiVQ9dJy2f/3U78RoWvzqvv74g5TMg7wUJzTAPyZxBJ229P3xbq
         hYe8B7nMZHW4E1LMPjl7sq0qXFlht62azfe3uhbkysZKPJTQIEupJ7pWZf+xSknM3PzH
         P49eUz1Zj167phMhSsI2nXZ8+kOhMJ2r3iQF01yobpotmFfYE0f4bi21otmSTw2VVev+
         ZZwkkjEGgUWxn+2d7pGdU5yPx73ilxfrDgDW3Rb7xZfaLpvTNo8X+i95CZyj2X5iTCR2
         mPskhoZXV0Xu/TgNTt675NkjMUzboTWY48Sx48D+sGbU7W6s+pEvLcmDo1tfzDXbjuGn
         zgPg==
X-Forwarded-Encrypted: i=1; AJvYcCXyk2wUG4j8ECKiu6pqnPk0x9d9Kb7l7h+ObKoauhEMJKxq7C/n/R9qqO/VyXnFD73D9LI+TtzTr4zbcLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdGbZZEpZtm2V/PtDzufZSdCcRtHrvQex1oYBsaE0q7jan7zDQ
	UU+z1oJ6UAnr0U7pyQf8bErNyNkgIuUBD5NwHCOhdWMRh6gq/eLE
X-Gm-Gg: ASbGncsYsZ2nPtLx7OqA75ypN0bN4LBTRYiaW4y0AqVTI4A+N4BBSQm7sHxNEmPjb/F
	bUzyMM05Xv3NGgCxS6zVGsczW5f7NwBkWt/5UAZ7nSNx5mYz6NhTIrciT2Tg8rIjMm5D88puzfr
	LVwZ5g6te1jvnq5MUStvuRznngPYWdyHtpgjSHfm0SSwrMJCDgzcr0UcPAngFvRP1ZudiiekNI5
	7zCS3xj7fsm3NnhvF61EYWyvRDeyY3uIprc7P4eD6pB05jcPd8+3+fqDWuJMLcLBySled0cjh5r
	l4V4ZaZ9ujO/vgIrjYUYNdmU3IPZR8UVv+SBIkoce3TPok21IKNSzJeYOxmOKojKSIiM88yo4Os
	vlA==
X-Google-Smtp-Source: AGHT+IHM7tagESMun47M5HMS7lAKv6qUWexzrO14AcKjGRpEF7WGOj0nJoAxliwzZGovvAJef0zyEg==
X-Received: by 2002:a05:6e02:1749:b0:3d4:6ed4:e0a with SMTP id e9e14a558f8ab-3d6dcb5e15emr6148965ab.4.1743615766244;
        Wed, 02 Apr 2025 10:42:46 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:45 -0700 (PDT)
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
Subject: [PATCH v3 32/54] drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
Date: Wed,  2 Apr 2025 11:41:34 -0600
Message-ID: <20250402174156.1246171-33-jim.cromie@gmail.com>
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

Invoke DYNAMIC_DEBUG_CLASSMAP_PARAM to hook drm.debug (__drm_debug) to the
DRM_UT_* classmap, replacing the ad-hoc wiring previously doing it.

Add DRM_CLASSMAP_* adapter macros to selectively use
DYNAMIC_DEBUG_CLASSMAP_* when DRM_USE_DYNAMIC_DEBUG=y is configured.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_print.c | 8 ++------
 include/drm/drm_print.h     | 4 ++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index a3b70d104afa..46d53fe30204 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -69,12 +69,8 @@ DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
 		    "DRM_UT_DP",
 		    "DRM_UT_DRMRES");
 
-static struct ddebug_class_param drm_debug_bitmap = {
-	.bits = &__drm_debug,
-	.flags = "p",
-	.map = &drm_debug_classes,
-};
-module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
+DRM_CLASSMAP_PARAM_REF(debug, __drm_debug, drm_debug_classes, p);
+
 #endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index e86ebb716b4c..8758449491b8 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -144,9 +144,13 @@ enum drm_debug_category {
 #ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
 #define DRM_CLASSMAP_DEFINE(...)    DYNAMIC_DEBUG_CLASSMAP_DEFINE(__VA_ARGS__)
 #define DRM_CLASSMAP_USE(name)      DYNAMIC_DEBUG_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...) DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(__VA_ARGS__)
+#define DRM_CLASSMAP_PARAM(...)     DYNAMIC_DEBUG_CLASSMAP_PARAM(__VA_ARGS__)
 #else
 #define DRM_CLASSMAP_DEFINE(...)
 #define DRM_CLASSMAP_USE(name)
+#define DRM_CLASSMAP_PARAM_REF(...)
+#define DRM_CLASSMAP_PARAM(...)
 #endif
 
 static inline bool drm_debug_enabled_raw(enum drm_debug_category category)
-- 
2.49.0

