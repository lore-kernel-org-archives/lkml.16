Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246D24397B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750463472; cv=none; b=UgCl2FNQ6SZ22eZw8Murt6hSc1paqkGANVCtfNuaGfNvuxCx+MlLhFVeKANt/dmE2FQ/IuxhPGyXJJpCp7zLdZo4nSH88U/uCx//aAVwEZfysESuoiOgcYagA4uVdCQJQ6gV6kkeocRCmvj0Ht7lH7dfwUlbJWg5qBBbTZoxTN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750463472; c=relaxed/simple;
	bh=AITQe8mrogs4HI2pTmaOHdcxZKDYfWIA+mzA0ZGiqxg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BtEOyQkQAMSFv+UwvDVMVnlNTfk4TmiJgzDu6E6neQUfRtU/lk2jEAZcm59BGSfK6vO2cpUM2FeAgGrQo9rg5VXULKaqI0MzWYR6+9wb7oo+kVvfx9gHGxemicM33bORyyGO8Z9d0HuT1zcozFsD4pCsra6iLbkYW0XUXIqDQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gilVzFRP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gilVzFRP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so1735760a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750463470; x=1751068270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIspX+R59/KkNw1d2FACMt9ogJpMnxhLRlBebcNNzSk=;
        b=gilVzFRPLD49l+cbPzK42I5jW3y+oBP7GDRl04xsNQL2zz+vUHStm99SKk8rn3aBFQ
         asrZqfyIc4WA8pmf0H3ekyFnzrgaysfxWF3GuWr2xStZU+gOyZ8+cwNkI59GdS8MRfT1
         Svva06U6JybS/akURWNtlDXA8l5VKnVetGATrQFuqZ6bcl7wCfJpNnsimfocu+pCGjfz
         JqQNWRm/nXZRbxJFXn1JIzMF9bNgPj/5CjRgKHWI7Ljh+d5DZqGkWHgH/OVDiAahppqu
         PMPn7aOJeL/ME+xerV4H2iZyv17H55PHyfXdNqDvLdL1GpZucpBOFIHjbI2KP/ErqGmB
         ImhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750463470; x=1751068270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIspX+R59/KkNw1d2FACMt9ogJpMnxhLRlBebcNNzSk=;
        b=e5Jvacox+LQOY7wkxO/W/2dxIuIG58jXoSdU6T3n02jAN6NzEHPwvSzSBqK1WB0ZCe
         94+gVfBHHblcmHrXHrCh5UUN33/qwXyFP4YPwXXUpj/TcWZtg1oU/XjPB6Lm9Y5uwuIf
         qmaK4U93mb82FMj3ooS2ECWmiUP84EWdbX9M0gRNurNYkzNU0tG8LZjOTwRoAJ0UxVFD
         p9hCa6QrpuK6qyMIfjM5XCI2xbF3HZuVCqyZ+youtrsHXzHtkuWRggtKfibZl9whjFDW
         gC0Hwshq90NbzRCDyY5+fgqSKq5fANqKrW58yqrzUwwYu010tFulIgHbOuInmAKnMRNA
         Ligw==
X-Forwarded-Encrypted: i=1; AJvYcCVmfimmCkeXz75IR3wLh9G3fYZOm4aQQ1gFzalAVIPesg5cNgtRVDKdDGSWXaUFpSDL+zKFDXWVSVaGCd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbkBiYN1Kbh2l1n+bWL8Y8A4eNj07nakCKpQL2octvBM7iu8w
	z12GAfOTcjw87k6Y7z8RJn+U4SFXX1ia/UHPXQWga3oUKi4DAM2feeL7
X-Gm-Gg: ASbGncsRzHgLAvf21uvPG2DfgLyAJwWuWy//37o1h2Z+NvQE9AESdAwqHPMs7LY5++I
	jNL+HKB8/eh14/5dbYvzAFck0Ce+QhvepYIlYz95ypYe50kAv+DIPvOG9TbVOVgdBxUNevScwwt
	1qbFiPWS1UQD9oS/9YmrcjzHApYCmKj/6Rx9tafRaLggokLZIANHxsi0wE+zdHTEvnHpITHZXZk
	DABhs63HW19jjFvUrIvwseaOeKDuKriTyQ9k4iN/02gZc5PdryAcPrX/jVnz2RSBVp5AStT6V0c
	3GaWaOid9R9zyodr1vLnoimlXM3TeoRnV4VPJy8bYNoUpn4V4U5RTA/jVdYemYier4V958zRqHy
	LRyRjPYgTcvc4PCQDe+0u
X-Google-Smtp-Source: AGHT+IE976pSbdd7FW0S5BytUdlkttRhJ9v8UMgbKLSGtDpmUrSef8Wbi/Q5nXAJVfP5KA7TureZtQ==
X-Received: by 2002:a17:90b:5625:b0:313:bdbf:36c0 with SMTP id 98e67ed59e1d1-3159d5779femr8909762a91.0.1750463470490;
        Fri, 20 Jun 2025 16:51:10 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com. [34.125.18.212])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d875a7b5sm26731135ad.256.2025.06.20.16.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:51:10 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] panthor: set owner field for driver fops
Date: Fri, 20 Jun 2025 16:50:50 -0700
Message-ID: <20250620235053.164614-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
In-Reply-To: <20250620235053.164614-1-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It allows us to get rid of manual try_module_get / module_put.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 1116f2d2826ee..775a66c394544 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1400,14 +1400,9 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	struct panthor_file *pfile;
 	int ret;
 
-	if (!try_module_get(THIS_MODULE))
-		return -EINVAL;
-
 	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
-	if (!pfile) {
-		ret = -ENOMEM;
-		goto err_put_mod;
-	}
+	if (!pfile)
+		return -ENOMEM;
 
 	pfile->ptdev = ptdev;
 	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
@@ -1439,9 +1434,6 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 
 err_free_file:
 	kfree(pfile);
-
-err_put_mod:
-	module_put(THIS_MODULE);
 	return ret;
 }
 
@@ -1454,7 +1446,6 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 	panthor_vm_pool_destroy(pfile);
 
 	kfree(pfile);
-	module_put(THIS_MODULE);
 }
 
 static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
@@ -1555,6 +1546,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 }
 
 static const struct file_operations panthor_drm_driver_fops = {
+	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release,
 	.unlocked_ioctl = drm_ioctl,
-- 
2.50.0.714.g196bf9f422-goog

