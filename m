Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8F54654
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820859; cv=none; b=pzMgfjG5cdKz1y1wzHHoSaVe0B60VkX8IkEam5gI1LNTwqzXbdyc+eaxp2FSkRgczE3P4AzMJ1BKhQLkkPiaC5JsZTRyMmRNP50iLBsyetw/DjLWVXyUKzGEy+6EQqXoiCGDgc+HjLUYnn3BspWuBBxfeU+zbSgekKDnaTo4Jwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820859; c=relaxed/simple;
	bh=cprFsDhlPvg9I3voB75Z5llSh0d1SD1azopoEw6opfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIrop0qLEQo2iccQK68Y4ciIvtnZtNWNaEUiFDyuU3ynzTgcRz9OVLHf466uxJ7LogCM68ULajxyHP4VcTjFwFH+/Mro2KwZkJxnU6izNbjANG4eiXM27FKwjTrUK0BXREeHAjS8G+MdOwxXiYJ+VuK7NlH1HVRZ1zIIzLFhB20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zd3K4x4+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zd3K4x4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749820857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tfsl7na8vBkAH1D5HNAgOxCb5PMcLNTUrB21akYCqLA=;
	b=Zd3K4x4+ND3Mk8TMIZ4o+V4AANftjgeEXqDlYfIiboVu7PW8UE6clI+w5mFD1HCqo7Qtyn
	VLqfZCXBfKkiV+ugodI22BffEgA8ZWcPUHvHkyk79XKzSoOQ90tm0Nyiqrm3ni4gW4YLsP
	N324P3eY9l5YjnXmG+Ru5ysdM+MDIdI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-AgGsIj9gPV6oe9E0AXSYeA-1; Fri, 13 Jun 2025 09:20:55 -0400
X-MC-Unique: AgGsIj9gPV6oe9E0AXSYeA-1
X-Mimecast-MFC-AGG-ID: AgGsIj9gPV6oe9E0AXSYeA_1749820855
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2f02cd1daeso1519618a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749820855; x=1750425655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfsl7na8vBkAH1D5HNAgOxCb5PMcLNTUrB21akYCqLA=;
        b=q/o96yztMHQqVJf2tZaS4PvrItLrBcn2m/JqCbgemvL/MFrqNm90jBLZ7TiXFYfz4h
         NeW1bWmsZ1urE1//qNqB5vJDjDkPZ2nnlgHMYAJrQWtCdL0ndMma7x32AUlHpzf2Hbv/
         1FMhVcZehA90RiDbO9f6uVq6j1POUGFv4WHGctmnL9di7WzIR/pG4P+9HTzTW8JgO8QA
         Rs6A1hVtxZa5KiQIZTeu6KjseZ42Izc5XKW1gaKbtdl/REYfLtzbtEo3ke4AkalovVpJ
         cEjyAXC+WCJlavXNJA1p43OsXjBlFZJLztrqeuQfngnOhQRrm6yr9d+xW5TTZoQ8Psbr
         hPDA==
X-Forwarded-Encrypted: i=1; AJvYcCWVMY3osXiZHvIIm3lAFzo4e0HUKKM3IH+x+8VwrnXZ+KVB12Ofg1mSyg0VCUfoKkNaqUchewQz+hHHOLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHly54XGcvEhjTfZ307OjwT3RPwbZUJjmgIK5VASRG5hPZvz+
	iq+gMI/8pq2440DexJYeNY4hxHdG74PdTlRDfDcLYTf5JQaDsDHKQqA/3nP1yPmOXkDyKW5paMM
	vMrD5hqPJ6jl2jx8qNMo5Dwf0XY4+vNkXnkuJKIkqCm5eLzN9nvUl4vOIZZ//wm+row==
X-Gm-Gg: ASbGnctLMjtnlIEtFv/X4H9IS5bq4NJhx4iModoFMx9ReI0NHevIVz21blpVxaBx38A
	VNSTYf/Nzvt9h1oEgnLDh0zCiw2diTeoHTiWxjp3i+6n3+vsk87757WlN6YFbawqzNX8PlmypNb
	Rfgz7Cf3LLaawnMOVw5CRVQ1O3JpEZNhjw2fvyw9v6UzfG/ADGA5/F4O6hzNqfVwuO0teSzwUh9
	umrTJ/OJw/aZmEspzkWtx2+ne3F8fyBaQ7BMTrzKWYauZEaitf7/+sMz0/KNS4HanaB/N/QDs4r
	7WaqNCyEy8ASR8rKRfQ=
X-Received: by 2002:a05:6a20:e196:b0:21f:775d:107e with SMTP id adf61e73a8af0-21facb26c8dmr3968597637.17.1749820854757;
        Fri, 13 Jun 2025 06:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE223H+TJ8TXd6oDEioev4iMoI2/YxUX5Dfw+NXpEW25126CIcGpxhbG1+TbmG1LTliCo7ulA==
X-Received: by 2002:a05:6a20:e196:b0:21f:775d:107e with SMTP id adf61e73a8af0-21facb26c8dmr3968563637.17.1749820854422;
        Fri, 13 Jun 2025 06:20:54 -0700 (PDT)
Received: from zeus.. ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1643e9esm1651732a12.25.2025.06.13.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:20:53 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH drm-next] drm/bochs: Add support for drm_panic
Date: Fri, 13 Jun 2025 22:20:14 +0900
Message-ID: <20250613132023.106946-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add drm_panic moudle for bochs drm so that panic screen can be displayed
on panic.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fb..ed42ad5c4927 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -19,6 +19,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	bochs_hw_setformat(bochs, fb->format);
 }
 
+static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+							  struct drm_scanout_buffer *sb)
+{
+	struct bochs_device *bochs = to_bochs_device(plane->dev);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
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
 static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = bochs_primary_plane_helper_atomic_check,
 	.atomic_update = bochs_primary_plane_helper_atomic_update,
+	.get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
 };
 
 static const struct drm_plane_funcs bochs_primary_plane_funcs = {

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

