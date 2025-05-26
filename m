Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEEE19F424
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250124; cv=none; b=oWWHpAgCasA1n+eRvE6kHOdMtWaMcty0uLqRCdpp4ViP4CBasgSoZ8gsx9AEvlVr3sgosnbvMHG5loabuJBczon/dG2FiN2ECHLIr4MuZtsIvaZYS5IUySwK7nx+lWRPh/bK84j5T1S0bbYY2zmWGgp1RCF7ZB1h4KsILKhasQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250124; c=relaxed/simple;
	bh=ZWoEjjeEptPnbRRuBqE27xtL0VYN5ov9J5JNbJVkCuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdBWuMuWbvBBGjwOgdnOu+p7m2QQFGk1zzV9VQu7qxZTl0ygPltM29rEzUFTQFDagd3ic+dhdtAFX0kkjIoBQSM8T6i1n7UX7U70MEju88IqyV871aMLbPpqyAE0VjVr4+TBbrHgbYrDRIRNmYHs3RHrTiQ0wHOI9q/Ea9v5rDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hEYajLq+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hEYajLq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748250119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+BhiDXyikhO1cftzHYfIEafnStrf4kEMf7dwcV0MPQY=;
	b=hEYajLq+pbAmx3riU+0v14cA1hVOeW5Bz3osggJVsYuaKhFVWzw70xe1SXZfLaZjwipIFt
	SRRdogdoUAvvV7mzjZeKarUKhH13dcTXZHWIPiDArWGpn0rKtgWvhgXxMtEu6gBSVr7NLC
	s5gC0n0r5ESCL6R9tr6s4jnLRfRMlSY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-KeQKQQpQNs2971WlloL1VQ-1; Mon, 26 May 2025 05:01:58 -0400
X-MC-Unique: KeQKQQpQNs2971WlloL1VQ-1
X-Mimecast-MFC-AGG-ID: KeQKQQpQNs2971WlloL1VQ_1748250117
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so2917940b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250117; x=1748854917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BhiDXyikhO1cftzHYfIEafnStrf4kEMf7dwcV0MPQY=;
        b=rbaQzmMozmp9GbuMQPaJoxGBQy+r6cTfCEmVbcziFl2ps7DfiuoltDeUap5QYt/9uU
         ANjAP4dKQyAC+hQxz4+k39RvnTotbJCgwP2mrYIRHwexDspwrlOeWHlfcP7QPL/JFYbE
         PwcsFcjxZk7ubFD2sFhS5KYBV5Sq8W5diAn1cG0aoK52tgwqhAnycGqypFCSUZyh08RA
         qReUnFFHkCkA9pwOJN3COItc9+cfQKcpcOcKDU08I8bRo30ZtBWC9aC0Gv6UNpSkMXuR
         bPtgueMJS3MtVuy56ilYS8LHf0aP6NtQxHGmzhGBcHW8Z2anLJ65Y9M5CKkfazVQ2Yyz
         IfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPw8CXho5OAhr1aBoPJbxqiSPoI5XF2cae6JyH+YPmuqhiiVxdrYVh6zcPvExCpjKYBfLB4Hu0XmxOvdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx90Y8avTcC7ntpPCCfb2eWcm+jgNII63uimjxZNHDo8Nn00l8B
	nZhxwaR8nb9MTjYZgwJpXrl4HkHTHyymMIS2HjLZXv5YSV7X27hT1vF7zl4GfbDmyJaoiRcV2uj
	teAxTTR/jUNkUJ9xjRTWZVLthPoYB3e8t3hQRu4IGvgrl1rpICt6fKyr+FMEKYs/FXQ==
X-Gm-Gg: ASbGnctqbtFwq+MT+35CGH2Oap4QRKf043JyZ5CC3yZ2OicVWod/KrAgHDqenCgKC05
	Trv5RiDO1RNzvLCLYzZP4l1Sa7ogg8gWw3CQK7Pi9u973d8DGnV3kEbgDnbVRZ9N+yGMqrhhoUr
	YoU+wlrTlKSSEcAEt/VVYWYgWMG2KrJEWx+8nw12j2nS85iGmhuoN8pEgsKktH7u1Hfr5u2+m8L
	HN2fNnWilqlGCYUeF5vfk/b14c9GJD8W+aFxRpgaPeJl+nfHO4bt4M6f7gTjdsYxhMNXLHFslem
	FLJPbNTeNcQV
X-Received: by 2002:a05:6a00:21c2:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-745fde9f3b7mr12076488b3a.10.1748250117055;
        Mon, 26 May 2025 02:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFODFO9ppwsV5E+FFuQuGGeBW483IYeVBee2OXT2Zb9+eI8FLSHDED6cuwUZJgQFPu/emkBcQ==
X-Received: by 2002:a05:6a00:21c2:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-745fde9f3b7mr12076460b3a.10.1748250116707;
        Mon, 26 May 2025 02:01:56 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9878b53sm16575092b3a.152.2025.05.26.02.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:01:56 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: drawat.floss@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC drm-misc-next v2 1/1] drm/hyperv: Add support for drm_panic
Date: Mon, 26 May 2025 18:01:05 +0900
Message-ID: <20250526090117.80593-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526090117.80593-1-ryasuoka@redhat.com>
References: <20250526090117.80593-1-ryasuoka@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add drm_panic module for hyperv drm so that panic screen can be
displayed on panic.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index f7d2e973f79e..945b9482bcb3 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
 
 #include "hyperv_drm.h"
@@ -181,10 +182,45 @@ static void hyperv_plane_atomic_update(struct drm_plane *plane,
 	}
 }
 
+static int hyperv_plane_get_scanout_buffer(struct drm_plane *plane,
+					   struct drm_scanout_buffer *sb)
+{
+	struct hyperv_drm_device *hv = to_hv(plane->dev);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(hv->vram);
+
+	if (plane->state && plane->state->fb) {
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch[0] = plane->state->fb->pitches[0];
+		sb->map[0] = map;
+		return 0;
+	}
+	return -ENODEV;
+}
+
+static void hyperv_plane_panic_flush(struct drm_plane *plane)
+{
+	struct hyperv_drm_device *hv = to_hv(plane->dev);
+	struct drm_rect rect;
+
+	if (!plane->state || !plane->state->fb)
+		return;
+
+	rect.x1 = 0;
+	rect.y1 = 0;
+	rect.x2 = plane->state->fb->width;
+	rect.y2 = plane->state->fb->height;
+
+	hyperv_update_dirt(hv->hdev, &rect);
+}
+
 static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = hyperv_plane_atomic_check,
 	.atomic_update = hyperv_plane_atomic_update,
+	.get_scanout_buffer = hyperv_plane_get_scanout_buffer,
+	.panic_flush = hyperv_plane_panic_flush,
 };
 
 static const struct drm_plane_funcs hyperv_plane_funcs = {
-- 
2.49.0

