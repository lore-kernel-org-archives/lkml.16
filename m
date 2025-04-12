Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669C190468
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 13:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744464066; cv=none; b=RYB+CspZd6OTJuJZaGL5OUgaZ0XDTQdR6UKND4i5yJ1050HBP0GoOytvbje5+/hVDgqyjmVB8yrudA5UCzjj8I97PpFi6nN/ivTc+VCEQkMg8GaIaC+Tq99iUBFZQosH7EagQL9L+xI3bR2+DkM5g2Fg/b9/GyvvibAtTbxIiDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744464066; c=relaxed/simple;
	bh=3TPNIoSPNI0MehJrLCyOai0X0fQvy/BYAPhC/wsGsaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEDXEOVhn68DAgsNuRrEfBNSdAAOB7t4/7G0IeMptRfgjvBvVARtsgVMC5k5IfX/8qWlNXdmtUecpJcTQIxv0mPJfD01YPzyY/jFe/W2pfJUpHjc/qh0S9dCysgADHELkpCMpowbyYCEYCSbFiCXrRlkTyk3N9aoSCeKqOt4hUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AM3L9UW8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AM3L9UW8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744464061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cK1rC0XjXhIHTt9tiNECT2Vn+CAc7jag5l0SYJ2eGBk=;
	b=AM3L9UW8KG/7w8YCBqfRh0JxPLxR4ymDjXC/IqqF65qK9rjnlKrhG3PZ433CA0XxoeVp2C
	RQIdYyhh1D59ZX0LljwslEYD1lDVmEmsWTAojLv7L3L6hK3P9KOFs9mSaT710h3a60YpUb
	BTxbw6CPKQ8dLyN4aNqs+HtxivtoaTQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-Yg8kqh2vPSuWE6k0M6syqw-1; Sat, 12 Apr 2025 09:21:00 -0400
X-MC-Unique: Yg8kqh2vPSuWE6k0M6syqw-1
X-Mimecast-MFC-AGG-ID: Yg8kqh2vPSuWE6k0M6syqw_1744464060
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410053005so46148215ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744464059; x=1745068859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cK1rC0XjXhIHTt9tiNECT2Vn+CAc7jag5l0SYJ2eGBk=;
        b=Qc9aOiX+75Wug4e4CuEh79XOZxSrnY1Fu7G1lziFkdXUq7NquccQeicdhaxOxtsZ4d
         QnwlUxQEtNNv/AEPHguHrnfgq14iIYW6ZxLsE0lAlwqUasWy7pVm5YvuPsaB28b52O4G
         26wO4s8BglNE8UJEIhhiqzjl/vbVKEGwM2fiR6tfMDfbfYrbi0BSOgw5vDbjyadkJ3kK
         xntc/xzJXJgW8iWbVkOmH5ibcWDYawNOIAZ6lseEevAbp+sRp+I+vd6n8B3zdbZC+n0v
         77pAXrzJOrzrPFLX6CjnUGcriqZLchBSSnvS1ShWgMevUao9emDHcwVJ3RazSRlmHRHy
         uu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZJkADvbRLxFMTQh69TXocrfyY8NyP+CQ1TuZwJs+P/CKwkz9LfHr+FRBYStEJKujrVxVJmgcr0q1B9bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4BfJ6zCfNV4xCiKRSEkkM6Xo//exSzLzWcOZmC7LxeSOcoG5G
	dVYri47peXnV4+fNRM9F/A+W6Hk4+NWxTRf9SOfvKiRiXIzGIITvjGzOAjqdhuRF6T56PzslsRG
	P4Ui3qb/FezrsRfl0UXbvpNQfBhUmk9MZ52FCMH1AI/ewvzsjx7slUL3aq+Rr1A==
X-Gm-Gg: ASbGncsOpBBH9+d5sW4NM9PoOOyUYnyb4olxArsm+R0Y7CNWrk36DoUsndyzbXIrPXO
	BnnbP6cifwsdHzo1XKW/m+MXNKqj/6rVZTcrlhimf43/DFhrwkVWb6Pw4CitLtDIqobMjlNbhj9
	TPqBRAnwUtscPsF/F7O8rgjMeL7AuE1Fh17yZGAXhpYCgWQJYrAmcqYn720PU/cVRIVspqQBHxx
	d1UqOQTva14BKI3Em0vYU4pCgMX759qBLFjpZcXcueSxJus6WTQ51tJJD4dArT38X2+haDVv7G6
	IXdOgzJfhp8V
X-Received: by 2002:a17:902:eb8a:b0:21f:6bda:e492 with SMTP id d9443c01a7336-22bea4f1acamr104191815ad.35.1744464059530;
        Sat, 12 Apr 2025 06:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEThxesy3Exij/NdLn+H03RMD7vSClcGR8SiZ0slO7o59/AF4Noe0XODfKIUFyC5GjjM9GJKw==
X-Received: by 2002:a17:902:eb8a:b0:21f:6bda:e492 with SMTP id d9443c01a7336-22bea4f1acamr104191255ad.35.1744464059038;
        Sat, 12 Apr 2025 06:20:59 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0818248sm6466199a12.9.2025.04.12.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 06:20:58 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: airlied@redhat.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	gurchetansingh@chromium.org,
	olvaffe@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Support drm_panic with non-vmapped shmem BO
Date: Sat, 12 Apr 2025 22:20:11 +0900
Message-ID: <20250412132012.291837-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass array of pages of the scanout buffer [1] to shmem BO, allowing
drm_panic to work even if the BO is not vmapped.

[1] https://lore.kernel.org/all/20250407140138.162383-3-jfalempe@redhat.com/

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a6f5a78f436a..2ff57d559c86 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -500,11 +500,19 @@ static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
 
 	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
 
-	/* Only support mapped shmem bo */
-	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach || !bo->base.vaddr)
+	if (virtio_gpu_is_vram(bo) || bo->base.base.import_attach)
 		return -ENODEV;
 
-	iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	if (bo->base.vaddr)
+		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
+	else {
+		struct drm_gem_shmem_object *shmem = &bo->base;
+
+		if (!shmem->pages)
+			return -ENODEV;
+		/* map scanout buffer later */
+		sb->pages = shmem->pages;
+	}
 
 	sb->format = plane->state->fb->format;
 	sb->height = plane->state->fb->height;

base-commit: e7bb7d44c3b97aea1f0e354c6499900154ac67f2
-- 
2.49.0

