Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7041C3C1F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745365555; cv=none; b=abTEcssFmCsejm/2tDJDoQWYj1ucBaJrqoQFeoMscTkyaXYI/kKvB8xY+cmK0K+bHrfFVEB22nAMF4Oi7zOuDUqTWGIc+oGVLkQNusNIdINvTtxzeNjhVF59376sEjzwBrEnVLolU7MM2/RzvLlqLUHohCNEjqoyq/Wxocy/+pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745365555; c=relaxed/simple;
	bh=mMSGKi5J45AAiynFJ7QtHkyqEEMIOv5q75JY2Cb8jFE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GRJjN/rLZtSg5JPQhVWuKGbtPrntD4oUYYj8jt6P4h/iVI226DZOKhvrqerjUE6CjE0XD5/1kb5tCUkgQ+rkEXrQqhwVdaVKtqt/g1eIKUD8qDfjocz1vVRSzp5LtqJ8MtQUtosx+4dsJVqzXrRTWAERaF/dp5f1617aC0fT2WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PDMM5qdb; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PDMM5qdb"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-896c1845cb9so329761a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745365552; x=1745970352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9PvQfpQ8pnvLyCSJcqeNFDDW25RW7LzCs+kk0KAuRMI=;
        b=PDMM5qdbYcVO2csam1QHQvrTsoVzEkbGaYb7bW3E9rcDy8+nJOth+2UbtZl8/+jz6K
         z2tprep8oijQYPY/Mk46X/XsNt2NxZukL48ouv/N8ZN35GKLaJMRwawfhaOIBRGtZw6S
         mm1HpbX0JGLOdmR8AVc4m13Q+jYJdtuNKbA9eX3Hb366GOOA8gdYINmHv3XopxVB1Pp+
         3qUGE6rgCwUzay6DYvjgS2w2p2WNUXQabYguAwebh0/mpARcV+ZUwvdDJXiHHOtHoE3E
         Z9vUQ4rOSiM59MS6yOBxrA5xKHg3gqYOh9zm9J1oZaxCIDH6ZQMA8NxvuVC2AtbprenV
         Us7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745365552; x=1745970352;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9PvQfpQ8pnvLyCSJcqeNFDDW25RW7LzCs+kk0KAuRMI=;
        b=tQt1eQaVSu9BPDRGTK+VROnRV/bA5JPc7buoZntTRiPtw4RgefrGL+/DpWs+v+Ws+N
         NQUro0XW6LzDf76KUEpAStyB1JHMzzXitpaeXZKN4Q3562QPXByhKy30blPrHPjXa2WN
         22HANQynOcZ84uplMXzROnPY+IvS/ktZfUhzW6YUbImpoyS5TUZkcfa0g228F7998xLZ
         liudUuRGr/wreVwugyOjJLRaReRTbQGtG26NlpHwePq74IpQ2/6CPPa8+MKMt2RMWujQ
         LTPBnmylIROzrHj+SQfIPOcIcf14FpVfKOR9CLCxDIiMfSfEmg0DCZNqjKSRJAcjn3+G
         MGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuW+Mj9tAyfbhC35Oayzxcs9/6ur8MNPk3dPJwtzCFtY/0qFy1UBoOQty3SEk2zjINipXKO8s0EURQH8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjuR76QA4dN+JLQOcXGzRgGXoo2pLxAMIfn5jTr6UDH1Kz3kCF
	x7BCpVFQPWNA8skXZ0mpokItN1oycntzW10wEqBSgWKMTs6edhjckVG3jx+0oN2d0YBV83TOyp4
	sBjGEGw==
X-Google-Smtp-Source: AGHT+IGdDc6uxDvgdNGP8MLKpkib8gYXEO4AzgKzce0SH2VXvDWB3/IIqU044dM0qE2hgKmn+YZOBO4dGbHm
X-Received: from pgbbx34.prod.google.com ([2002:a05:6a02:522:b0:b05:23fb:ed46])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a4c4:b0:1ee:ab52:b8cc
 with SMTP id adf61e73a8af0-2042e9071d9mr1213858637.21.1745365552645; Tue, 22
 Apr 2025 16:45:52 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:45:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422234546.2932092-1-dhavale@google.com>
Subject: [PATCH v3] erofs: lazily initialize per-CPU workers and CPU hotplug hooks
From: Sandeep Dhavale <dhavale@google.com>
To: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>
Cc: hsiangkao@linux.alibaba.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently, when EROFS is built with per-CPU workers, the workers are
started and CPU hotplug hooks are registered during module initialization.
This leads to unnecessary worker start/stop cycles during CPU hotplug
events, particularly on Android devices that frequently suspend and resume.

This change defers the initialization of per-CPU workers and the
registration of CPU hotplug hooks until the first EROFS mount. This
ensures that these resources are only allocated and managed when EROFS is
actually in use.

The tear down of per-CPU workers and unregistration of CPU hotplug hooks
still occurs during z_erofs_exit_subsystem(), but only if they were
initialized.

Signed-off-by: Sandeep Dhavale <dhavale@google.com>
---
v2: https://lore.kernel.org/linux-erofs/20250402202728.2157627-1-dhavale@google.com/
Changes since v2:
- Renamed functions to use pcpu so it is clear.
- Removed z_erofs_init_workers_once() declaration from internal.h as
  there is no need.
- Removed empty stubs for helpers erofs_init_percpu_workers() and
  erofs_destroy_percpu_workers().
- Moved erofs_percpu_workers_initialized under
  CONFIG_EROFS_FS_PCPU_KTHREAD as further cleanup.

 fs/erofs/zdata.c | 65 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..e12df8b914b6 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -291,6 +291,9 @@ static struct workqueue_struct *z_erofs_workqueue __read_mostly;
 
 #ifdef CONFIG_EROFS_FS_PCPU_KTHREAD
 static struct kthread_worker __rcu **z_erofs_pcpu_workers;
+static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
+static int erofs_cpu_hotplug_init(void);
+static void erofs_cpu_hotplug_destroy(void);
 
 static void erofs_destroy_percpu_workers(void)
 {
@@ -336,9 +339,44 @@ static int erofs_init_percpu_workers(void)
 	}
 	return 0;
 }
+
+static int z_erofs_init_pcpu_workers(void)
+{
+	int err;
+
+	err = erofs_init_percpu_workers();
+	if (err)
+		goto err_init_percpu_workers;
+
+	err = erofs_cpu_hotplug_init();
+	if (err < 0)
+		goto err_cpuhp_init;
+	return err;
+
+err_cpuhp_init:
+	erofs_destroy_percpu_workers();
+err_init_percpu_workers:
+	atomic_set(&erofs_percpu_workers_initialized, 0);
+	return err;
+}
+
+static int z_erofs_init_workers_once(void)
+{
+	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
+		return 0;
+	return z_erofs_init_pcpu_workers();
+}
+
+static void z_erofs_destroy_pcpu_workers(void)
+{
+	if (!atomic_xchg(&erofs_percpu_workers_initialized, 0))
+		return;
+	erofs_cpu_hotplug_destroy();
+	erofs_destroy_percpu_workers();
+}
 #else
-static inline void erofs_destroy_percpu_workers(void) {}
-static inline int erofs_init_percpu_workers(void) { return 0; }
+static inline int z_erofs_init_workers_once(void) { return 0; }
+static inline void z_erofs_destroy_pcpu_workers(void) {}
 #endif
 
 #if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_EROFS_FS_PCPU_KTHREAD)
@@ -405,8 +443,7 @@ static inline void erofs_cpu_hotplug_destroy(void) {}
 
 void z_erofs_exit_subsystem(void)
 {
-	erofs_cpu_hotplug_destroy();
-	erofs_destroy_percpu_workers();
+	z_erofs_destroy_pcpu_workers();
 	destroy_workqueue(z_erofs_workqueue);
 	z_erofs_destroy_pcluster_pool();
 	z_erofs_exit_decompressor();
@@ -430,19 +467,8 @@ int __init z_erofs_init_subsystem(void)
 		goto err_workqueue_init;
 	}
 
-	err = erofs_init_percpu_workers();
-	if (err)
-		goto err_pcpu_worker;
-
-	err = erofs_cpu_hotplug_init();
-	if (err < 0)
-		goto err_cpuhp_init;
 	return err;
 
-err_cpuhp_init:
-	erofs_destroy_percpu_workers();
-err_pcpu_worker:
-	destroy_workqueue(z_erofs_workqueue);
 err_workqueue_init:
 	z_erofs_destroy_pcluster_pool();
 err_pcluster_pool:
@@ -644,10 +670,17 @@ static const struct address_space_operations z_erofs_cache_aops = {
 
 int z_erofs_init_super(struct super_block *sb)
 {
-	struct inode *const inode = new_inode(sb);
+	struct inode *inode;
+	int err;
 
+	err = z_erofs_init_workers_once();
+	if (err)
+		return err;
+
+	inode = new_inode(sb);
 	if (!inode)
 		return -ENOMEM;
+
 	set_nlink(inode, 1);
 	inode->i_size = OFFSET_MAX;
 	inode->i_mapping->a_ops = &z_erofs_cache_aops;
-- 
2.49.0.805.g082f7c87e0-goog

