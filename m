Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1DA204879
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615788; cv=none; b=RWZ2oeeODDgLyddzi4/DLDS/Fdho4NlEuqmC7Tx3XiMzOj8TKSdKmWvdcan8rEVRET2o+D1B3i6Y8tabYLatRM8KIl2jCXazSxaVAX2tEJDJVI381h0RbFPk1EgNB1DdhgbgoW/zyXHuAMJXL9b8BsQoxkHoo9lvBMXQp4/XJK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615788; c=relaxed/simple;
	bh=ysvtgpv8Lzoof+7How0DiBM+y+vEotUTIOC5+Z4md5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=avpDpsvS7n7Kt54xykmGpXhtQt7TglDd/F5YufOTp+KgyBlhE0TX0wcQCSrROtZcEmxa+2LUjRuPp+EZY0+E5ahspwayQYPz1dhPLDuy+o0wG0GdrBCQaj1v8ixdtWU9LOxh7JTb3XIe/nnGtenID8IaW3NHODEGcy8nR/xkBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SK0KPq/8; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SK0KPq/8"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso699239f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615786; x=1744220586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmamZMwYgFpi0j7+3VuOLzPrfkXXmhZ2avEG64/SS20=;
        b=SK0KPq/8lzN1xP4A0eGHF6g6jBQed9be97AJmLpXKjDrbURr468AYGHvplfsfqLBSm
         9hfFEQfbtKObA/AM7XikXWkinuxHhjjEYvTS6lFI2tbwZfTkLadULXLQD04ObKwSuGS6
         pYPQ3ppfyWgtji+dFtdUyvGgj/rQxC30Un1U5/atffPa/bhFZuytAaXaNagJ3q8pflw8
         Edq0KVo0fbjzFAKNd4jeJbv5mmh+MWVRtEBdClXN6v4x6WNdwd6TJlACbpU0p9AXsdCQ
         duhY2wYqqKq6RAg2Z/Znbh0hresPImiJkpvwWal1o1RX7624WkLG59keIOqpSIVxGKt4
         vQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615786; x=1744220586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmamZMwYgFpi0j7+3VuOLzPrfkXXmhZ2avEG64/SS20=;
        b=R49vjGzzFBDPZKoTtYmMFvqd/txt9uZPVWvtjMbz39OCfiZCdnW3KB6LemYW/Ko5YV
         oyTmuYq6bCXH0vhfIxPNsDBZMJ+md4CmU/QcRoe6MB3UNv+jj3sSVW6SYFMbovbHCTv1
         ZlTdyKUMuS+hh0ugLQAuWtXnDBDQNWK+dpPac+KGFijFTMFaOl88NeJuJmYmFAQlks0u
         XesSQkZ+ni3YrL9wsT9xfyumzUWBrE83pRQ1yH7/lJBXCnOMv95OQK8s+dEtVZiqtVRq
         C5hf8axLOjYZ7SaptCbO0BREai3m/XE6y5UObtG5JfeOpdfm832Svihq7qiKfwP9+k2r
         9cZg==
X-Forwarded-Encrypted: i=1; AJvYcCUAJn6t7Rm0uUrgheU0Sm83QsdAj3drSArGboPBskHA02VijblcNsnOS7wNck91vKHg6Z6gqLjXWqLYUb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyro+TtFzWc0d88Yaju/Z3ARuOGHjaFvIMpG4WuAJnUulkhUW4+
	TAtvW3PStvToORvYbemCvI5ZUc3Y74GkXI0sUoD5IXtupHSonUSu
X-Gm-Gg: ASbGnctxHRFVl3PJEHzJGFZbTdfRioGbgWtHVAU93GgdThhQQ1AzMV2klnxXJ8JyHAP
	ynqH1xG54zB+Ud04lRAZ3TcB87+EMns/skp+Fm3wF3LuOph21z2/l92Pt1oHFsXU8SE7Dz8DjUF
	LngWRkGvWdInqQM0iQMC8b3gSLdN5hODqPh+LiSiWmgLmN8ubRaF5sSOg+72hmcD+QCOCSqrNYR
	PIEURWM7tJixn0haNMz2/GISij3/u4Dw1vLFtO5vKIMtvE6xbTZqxdtVc5wPiPIRYYfhqqo4KDs
	/O34ckOgMcLcadyfCQtbBadNqgvUPyuykVjb1FcW3bewEQTYKMLWsJ0iShjg1AIS6UGWtDNv892
	XCw==
X-Google-Smtp-Source: AGHT+IHals0Ha6Jbgxu6ZrP/iyj69ILFezhPsXy3WvO7TTJBtm+wHjVRufglAOrxetkFLageXKmqeg==
X-Received: by 2002:a92:cda4:0:b0:3d3:fcff:edae with SMTP id e9e14a558f8ab-3d5e08eb18amr200191655ab.3.1743615785891;
        Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
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
Subject: [PATCH v3 54/54] drm: RFC - make drm_dyndbg_user.o for drm-*_helpers, drivers
Date: Wed,  2 Apr 2025 11:41:56 -0600
Message-ID: <20250402174156.1246171-55-jim.cromie@gmail.com>
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

Add new drm_dyndbg_user.c with a single call to
DYNDBG_CLASSMAP_USE(drm_debug_classes).  This creates a _class_user
record (and a linkage dependency).

If a driver adds this object to its Makefile target, it gets the
record, which authorizes dyndbg to enable the module's class'd
pr_debugs, such as DRMs <category>_dbg() macros.

So Id like to automatically inject this object into drivers.  I tried
subdir-objs-y, but thats not a thing.

In drm/Makefile:

Add object dependency to drm_*_helper-y targets:

  $targ-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o

Attempt a foreach:

  to add $driver-y += ../drm_dyndbg_user.o

this appears to be a train-wreck for impl reasons, but it describes a
want/need reasonably well.  It might not be a good maintainble idea.

Explicitly adding to radeon/Makefile worked:

  $radeon-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += ../drm_dyndbg_user.o

But doing this is just as per-module as just adding the _USE()
explicitly to the main .c file, which is less magical than make-fu.

Also, it appears to cause make && make rebuilds.

and try to link it to helpers and everything

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile          |  9 +++++++++
 drivers/gpu/drm/drm_dyndbg_user.c | 11 +++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dyndbg_user.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 704f94efc804..1adb5a262180 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -74,10 +74,12 @@ drm-y := \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
 	drm_writeback.o
+
 drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client.o \
 	drm_client_event.o \
 	drm_client_modeset.o
+
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
@@ -111,20 +113,25 @@ obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 drm_dma_helper-y := drm_gem_dma_helper.o
 drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
 drm_dma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
+drm_dma_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
 
 drm_shmem_helper-y := drm_gem_shmem_helper.o
 drm_shmem_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_shmem.o
+drm_shmem_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
 
 drm_suballoc_helper-y := drm_suballoc.o
+drm_suballoc_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
 
 drm_vram_helper-y := drm_gem_vram_helper.o
+drm_vram_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
 drm_ttm_helper-y := drm_gem_ttm_helper.o
 drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_ttm.o
+drm_ttm_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
 #
@@ -149,11 +156,13 @@ drm_kms_helper-y := \
 	drm_simple_kms_helper.o
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
+drm_kms_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 #
 # Drivers and the rest
 #
+subdir-obj-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
 
 obj-y			+= tests/
 
diff --git a/drivers/gpu/drm/drm_dyndbg_user.c b/drivers/gpu/drm/drm_dyndbg_user.c
new file mode 100644
index 000000000000..9e4aa87d4b58
--- /dev/null
+++ b/drivers/gpu/drm/drm_dyndbg_user.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include "drm/drm_print.h"
+/*
+ * if DRM_USE_DYNAMIC_DEBBUG:
+ *    DYNDBG_CLASSMAP_USE(drm_debug_classes);
+ *
+ * dyndbg classmaps are opt-in, so modules which call drm:_*_dbg must
+ * link this to authorize dyndbg to change the static-keys underneath.
+ */
+DRM_CLASSMAP_USE(drm_debug_classes);
-- 
2.49.0

