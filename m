Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DB4C79
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750463473; cv=none; b=OdbeMiYMlBbXH+GbuNH44tKCtSrxQiEtHbzpowvwfDL424jkA7cvjlFEalC/RLlRC78+GXn6aqn0AVquQX3cEQ3+kn9zMM0EAzcT6y/zIII3o7sm37yssMFHTlLcfhGBBKa0KQbMuZELDP+a4/GslG+Ww+ZxLuDyBfoWg7krHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750463473; c=relaxed/simple;
	bh=tezOgqUzj0tSXoXYQjHFEksrNNxWPEqwWsTkjEPBchw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0FOWleJ5QWsDTE4O98yCxx97ObokreaX73Jfd2pIqa7RH5HsKc9APMlZz6KAzZUotO1Ty62UPha5WxeecdQgi0A5O7sJi6t01qremZ0MZfbORNGtD/mkm7T8MTU7dU6HBUMkpxDBHabUWqy4iz20w1t8/XAVJl/gvxZCblHPkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJRKjd+v; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJRKjd+v"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23633a6ac50so33297925ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750463471; x=1751068271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/sf8SbFL98/l1BPYcZBxqcTMjZT2nYTK7eVnC4HqoA=;
        b=OJRKjd+vEtOIj/VTKrcKk3QRJQogP3WWpk4oCMo8rsxSvUVj5P16V+qfDgpWE1MQLR
         hGttKZgOwCMc/8MaC3rLAG5htTZToo3AfFNfkMkCToGO/z4Wa3Gu73+wXODwW86+haDA
         vWq/EdELWq4US+elH8SMpLkq7jIhqnK1UpB3Spb5JE/Vx0goPCWHAxDowwjUCeQxvdZD
         L0f9i8oPbB8NuwQAKgBSzx3dMkPuMXy1wXre+bfsU7pwlh2DXvYUB2MsUraxYDQBMmJO
         kIZ1KL3NlgK+qeFhdCcKTTIv1d83o8ODJNpZlfzOc7PVgPdMYgcNOXFz3dqUp6rQIfhu
         UT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750463471; x=1751068271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/sf8SbFL98/l1BPYcZBxqcTMjZT2nYTK7eVnC4HqoA=;
        b=DxcWnFdbeNN8mf5kBvMdv6xFLpQiQzMAWMNa+vEG30lwB6xZhP1p9KtIzzhHAn3Iab
         syauYAyGnVGCIdxWr7RRZflGZ5eNNfl/bnowvlxtpmXNU9CYd9b8LbhNoYXPjpojuRXr
         2VMVOmNLAZ1EkYy0JZVB8ZjbzVCHqFDWh8RN80HFVRtJIVFbMxY9wSv4pHMU6d+1HsuX
         F4qKMnmNomkWw5MrrMxbYV9qSjWxJTWwcjQqRc9615NyN6fl8kUA3GhtJtdxdkh7AeNv
         /KPwhZmTJq2tsoLBo3ACsvb8ofPBAcNuoAYGdizZ9dg+/iZfHKTiqfio1khE20kHAPr8
         f5rg==
X-Forwarded-Encrypted: i=1; AJvYcCWCZ7ho/cad2eGDa8dbSRmb3YwMILeJB1/eYSdi97g/WvwVHwebE5hEYFjGJPz8cdN5DBfriOIDqfKwAvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YysKl3Dx1bK3afFyrH2QJyZd3Hh8drDUcD1sSHyG0nVldGFTxkj
	yAzofBErmMV6x3QhDcSJ5aRs73z3pUJC6mTR6XLlxfoR53HKrPjzgvKE
X-Gm-Gg: ASbGncvI9yp8iWSf04/kfmbIr13SGGypoPLv5bui0Qpccyz4z0oCjIp8qnlHCOeagX6
	V8qSQsqO8lEUQvYG4Ky3/g76m2x+tyPKhGrCpxsUjD7o5hMe3QkDYnMr24vsiWsWlA4N4fKL1qA
	TYAkO1EwekLwNqV5UovljhDtm4YQ8NBzDumDEVclSxz843fGzobtRmrtDCeyRjowoYQxyH/ZylE
	700d5bPf0Q0OqXOZImcdKh6KzeWbZA6B7zyu5AeMDB/xhAYl+Iv2XD9nHKPR3GcoYFXWgJ9/qI5
	rjPlu0MrTQe/zGl7Mfdj9ej2QvNE8pMe1LHhKQx7YvvWbChzomhic6BtLU02abH1KmIC9hOeQiF
	Q8habozucwrUf4cloN1Df
X-Google-Smtp-Source: AGHT+IFvpIeAyqoZmp4SoLpGagaWJW0y7zfMsAUf01waB/2UFM4r/d7TohfyBmPEFSr+3rivC9nOtw==
X-Received: by 2002:a17:902:d50a:b0:236:748f:541f with SMTP id d9443c01a7336-237d9891ca5mr74419055ad.33.1750463471427;
        Fri, 20 Jun 2025 16:51:11 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com. [34.125.18.212])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d86635e0sm27040475ad.157.2025.06.20.16.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:51:11 -0700 (PDT)
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
Subject: [PATCH 2/4] panthor: save panthor_file in panthor_group
Date: Fri, 20 Jun 2025 16:50:51 -0700
Message-ID: <20250620235053.164614-3-olvaffe@gmail.com>
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

We would like to access panthor_file from panthor_group on gpu errors.
Because panthour_group can outlive drm_file, add refcount to
panthor_file to ensure its lifetime.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 16 ++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 15 ++++++++++++++-
 drivers/gpu/drm/panthor/panthor_mmu.c    |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c  |  6 ++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4fc7cf2aeed57..75ae6fd3a5128 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -256,8 +256,24 @@ struct panthor_file {
 
 	/** @stats: cycle and timestamp measures for job execution. */
 	struct panthor_gpu_usage stats;
+
+	/** @refcount: ref count of this file */
+	struct kref refcount;
 };
 
+static inline struct panthor_file *panthor_file_get(struct panthor_file *pfile)
+{
+	kref_get(&pfile->refcount);
+	return pfile;
+}
+
+void panthor_file_release(struct kref *kref);
+
+static inline void panthor_file_put(struct panthor_file *pfile)
+{
+	kref_put(&pfile->refcount, panthor_file_release);
+}
+
 int panthor_device_init(struct panthor_device *ptdev);
 void panthor_device_unplug(struct panthor_device *ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 775a66c394544..aea9609684b77 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1393,6 +1393,16 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
 	return 0;
 }
 
+void panthor_file_release(struct kref *kref)
+{
+	struct panthor_file *pfile =
+		container_of(kref, struct panthor_file, refcount);
+
+	WARN_ON(pfile->vms || pfile->groups);
+
+	kfree(pfile);
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1426,6 +1436,8 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	if (ret)
 		goto err_destroy_vm_pool;
 
+	kref_init(&pfile->refcount);
+
 	file->driver_priv = pfile;
 	return 0;
 
@@ -1442,10 +1454,11 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 {
 	struct panthor_file *pfile = file->driver_priv;
 
+	/* destroy vm and group handles now to avoid circular references */
 	panthor_group_pool_destroy(pfile);
 	panthor_vm_pool_destroy(pfile);
 
-	kfree(pfile);
+	panthor_file_put(pfile);
 }
 
 static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b39ea6acc6a96..ccbcfe11420ac 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1604,6 +1604,7 @@ void panthor_vm_pool_destroy(struct panthor_file *pfile)
 
 	xa_destroy(&pfile->vms->xa);
 	kfree(pfile->vms);
+	pfile->vms = NULL;
 }
 
 /**
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a2248f692a030..485072904cd7d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -535,6 +535,9 @@ struct panthor_group {
 	/** @ptdev: Device. */
 	struct panthor_device *ptdev;
 
+	/** @pfile: File this group is created from. */
+	struct panthor_file *pfile;
+
 	/** @vm: VM bound to the group. */
 	struct panthor_vm *vm;
 
@@ -919,6 +922,7 @@ static void group_release_work(struct work_struct *work)
 	panthor_kernel_bo_destroy(group->syncobjs);
 
 	panthor_vm_put(group->vm);
+	panthor_file_put(group->pfile);
 	kfree(group);
 }
 
@@ -3467,6 +3471,8 @@ int panthor_group_create(struct panthor_file *pfile,
 	INIT_WORK(&group->tiler_oom_work, group_tiler_oom_work);
 	INIT_WORK(&group->release_work, group_release_work);
 
+	group->pfile = panthor_file_get(pfile);
+
 	group->vm = panthor_vm_pool_get_vm(pfile->vms, group_args->vm_id);
 	if (!group->vm) {
 		ret = -EINVAL;
-- 
2.50.0.714.g196bf9f422-goog

