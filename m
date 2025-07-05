Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B421482E8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731178; cv=none; b=BBgztbQYiHSZqsvWvWV03hciWXQHqiSP1146sUG9D675m3fYsm6kCwwY368VZnFSRrCwhupcRz6XzWoQZ8UC3GvenFJO6/Z5sysP382sy4Xti+/Me7HcrrvJa8SK+o1IAHBxHy7LBMvf33hHZ9vYo8hc3eOR5DkiIqH0ZtLUo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731178; c=relaxed/simple;
	bh=x6FJrcHFHfJWN+sjMClj8RiYPSCEZ4KsOoNxQMdsP/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vr+/IO4E/t9tC5vsysO0Td7Fos11mHNq2QWV1ZKhyeLvrPuqx5DH2apsfRcP0BZgv1pNuTAWR8g50Sj9HbDjo2kk4w6JwZ2Iz2rg12REno4IZA/s3eK0fCzQWoKpCt2SRPElzC1R3sNDM9aEyynEV1rtAlyoF/sjc69LZNUb7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oa758ZAF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oa758ZAF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74ce477af25so976651b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751731176; x=1752335976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xxe3hUK0FcWLFBwawbJlsURwRJfsz9aIAfjmQMU/LHU=;
        b=Oa758ZAFPYQFyKQTpRTWWdP9PRpe+PhzdX2YKOLhQSGUf3VvU4VYBzn0IZ4+2R3V1w
         I+pEKR2QIjr0U59L7i+u2DgYsBC7xlgEYUJe9ujtHHUS9yoTEORL5mE2XokC/fL4uajv
         XAvYSQRWHIP0tJE0HY2ihQeTDOkpgcX53cZAwMhqo6IZPcO1O3HIerN+3T5eseYA31hj
         2unvKSfg0uFARjNqQSjX7evJoP20togdflMpMuJmsZXL10jyEWHnndWViQQ0/Hz7+F0+
         9lNKVuMHdWhIp9m9z7hTmJYwWAJ2qtERAg5CFgQTcWqfifvQ/SbgUy6eX4IzTfORHmrf
         Bq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731176; x=1752335976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xxe3hUK0FcWLFBwawbJlsURwRJfsz9aIAfjmQMU/LHU=;
        b=GaYtUNP+HFuoKcdKWivQRTlOUIKQz9oWnw6TFG9n0T52YAVo7Y0jgS2Q/fH9efEjeb
         SNon2JKkQz0QFdf4DjrdBM/Faejp5RF/kQjCE3+cH1TkL0yrvUCsrynttcr+Rl4Kdq/E
         P6Ic31KDmHIDbIDJqbo3vAPURK2AaanwSfNH2e+o0U5uTQ6Z23E/l7g58DZjS+Xq9Xtw
         59OJhdMcswADQ9xzNlP4xYjb4iCvtcJOc5imL1h4/3hFnfU6Waov1FRw+r6pYjAfDLZU
         nSQ/38girUoVujEbxV06M2Uyf+kMhljARsn0Ln6HMomLx2OKeRonusFC//BEe9w6XjXV
         LE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIJVexcU9As0USQkuRwS9qge4+QF0cs7qFs2k0NieprCwlRbRpAb+OwEXJzNl/uf6pjJXrzjOXQrBblLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgmh0VMlNRXmK8DvAv5oSnaLYoshvmQgydNKF9+PTwP7yJPn3
	TWsg+gWwtTO5vOvadtspZv6rti5AULCz+ZNTE8OHqMF3rVrR1B5bCKynxLeUxm9u
X-Gm-Gg: ASbGncv+roYas+EdsbbEYHPKCvdzNEfk7JiURU1amY9bi2T6kWukX9emhzxg+8bj02u
	B9fKLKtSzQabTzfgDhJ/TjaS8u2MK9f9LY7hPujuTPpdrTlD2wboZdUjUGApT9cxfP7nYDkCGc/
	AYfrwinew49qBUnc0wiC1hXH1UVoGdpczonlNZJyY4BBlSdauUscjHxstzf+NDQdIQ+DoqvZz+2
	DI7znslnxo8ZwojhIWGuEEToHltUTnr7eLYZhSsnK1apBWpO/QBbfYa9QK6CC4J38xX6at2lzwS
	rOIyv2Dm+A6IxFBHDjoiSlbypOqCh9KiNT5wdgeDYLmIez5ojUi0Dh7kb6dqFzMvIWJVqJJhELr
	gwEmr5XOzgSugDkQ=
X-Google-Smtp-Source: AGHT+IFjq06wwaJBBhZjTvlaIGp9QtkdQ8b7G5Dhd4VLbUDuY3LNRSFQdF8WPRHnHcJuL4ZpsupNFA==
X-Received: by 2002:a05:6a21:7a43:b0:223:76d2:5a7 with SMTP id adf61e73a8af0-225b948850fmr10729212637.24.1751731176590;
        Sat, 05 Jul 2025 08:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882f:293:70ba:30fe:2559:8217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee74cf48sm4539103a12.77.2025.07.05.08.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 08:59:36 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [PATCH RFC] drm/radeon: fix the warning for radeon_cs_ioctl()
Date: Sat,  5 Jul 2025 21:29:14 +0530
Message-ID: <20250705155914.806693-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following compiler warning about excessive stack usage:

 drivers/gpu/drm/radeon/radeon_cs.c:669:5: warning: stack frame size (1200) exceeds limit (1024) in 'radeon_cs_ioctl' [-Wframe-larger-than]

The warning is caused by a large objects like  `struct radeon_cs_parser`
 being allocated on the stack. This patch changes the parser to be 
 heap-allocated via `kzalloc()`, thus reducing stack pressure. 
 It uses the __free() attribute  to ensure automatic 
 cleanup on return.

This change should not affect functionality, as all usage of the
 `parser` remains intact and is now accessed via a pointer.


Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
the radeon_cs_ioctl() consumes around 1200 bytes on stack.
It was confirmed using -fstack-usage
....................................
divers/gpu/drm/radeon/radeon_cs.c:669:radeon_cs_ioctl  1200    static
drivers/gpu/drm/radeon/radeon_cs.c:416:radeon_cs_parser_fini    56      static
...............................................

After applying this patch the stack size effectivly reduces to 656 bytes
...............................................
drivers/gpu/drm/radeon/radeon_cs.c:669:radeon_cs_ioctl  656     static
drivers/gpu/drm/radeon/radeon_cs.c:416:radeon_cs_parser_fini    56      static
.....................................................

This will eliminate the build warning .But will this dynamic allocation with kzalloc()
affect performance as compared to stack allocation + memset . Or will this way we will
suffer greater penalty ?
 drivers/gpu/drm/radeon/radeon_cs.c | 34 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index b8e6202f1d5b..ca7fad842db7 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -669,9 +669,12 @@ static int radeon_cs_ib_fill(struct radeon_device *rdev, struct radeon_cs_parser
 int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_cs_parser parser;
+	struct radeon_cs_parser *parser __free(kfree) = NULL;
 	int r;
-
+
+	parser = kzalloc(sizeof(*parser), GFP_KERNEL);
+	if (!parser)
+		return -ENOMEM;
 	down_read(&rdev->exclusive_lock);
 	if (!rdev->accel_working) {
 		up_read(&rdev->exclusive_lock);
@@ -685,46 +688,45 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return r;
 	}
 	/* initialize parser */
-	memset(&parser, 0, sizeof(struct radeon_cs_parser));
-	parser.filp = filp;
-	parser.rdev = rdev;
-	parser.dev = rdev->dev;
-	parser.family = rdev->family;
-	r = radeon_cs_parser_init(&parser, data);
+	parser->filp = filp;
+	parser->rdev = rdev;
+	parser->dev = rdev->dev;
+	parser->family = rdev->family;
+	r = radeon_cs_parser_init(parser, data);
 	if (r) {
 		DRM_ERROR("Failed to initialize parser !\n");
-		radeon_cs_parser_fini(&parser, r);
+		radeon_cs_parser_fini(parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
 	}

-	r = radeon_cs_ib_fill(rdev, &parser);
+	r = radeon_cs_ib_fill(rdev, parser);
 	if (!r) {
-		r = radeon_cs_parser_relocs(&parser);
+		r = radeon_cs_parser_relocs(parser);
 		if (r && r != -ERESTARTSYS)
 			DRM_ERROR("Failed to parse relocation %d!\n", r);
 	}

 	if (r) {
-		radeon_cs_parser_fini(&parser, r);
+		radeon_cs_parser_fini(parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
 	}

-	trace_radeon_cs(&parser);
+	trace_radeon_cs(parser);

-	r = radeon_cs_ib_chunk(rdev, &parser);
+	r = radeon_cs_ib_chunk(rdev, parser);
 	if (r) {
 		goto out;
 	}
-	r = radeon_cs_ib_vm_chunk(rdev, &parser);
+	r = radeon_cs_ib_vm_chunk(rdev, parser);
 	if (r) {
 		goto out;
 	}
 out:
-	radeon_cs_parser_fini(&parser, r);
+	radeon_cs_parser_fini(parser, r);
 	up_read(&rdev->exclusive_lock);
 	r = radeon_cs_handle_lockup(rdev, r);
 	return r;
--q
2.43.0

