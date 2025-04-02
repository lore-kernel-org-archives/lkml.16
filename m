Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1D07082F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625654; cv=none; b=Z8nJisPFMZvHSEI8pdj7B9BwANQfmHGm6bZAL965CXxZJ3l+sms8lUxpt/flrpjcZ/pc7U2OV5WUXn4N3IjmbpMpEW9BPO5l6RvpQaeHzODzKbh8tWzQIFmsaz2hUFZdPbRRbb/0kKABB2posiku9wqxyghmX1tEKJch0cGCdRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625654; c=relaxed/simple;
	bh=5lVSSzhAmoiGer64JvW0rWKUsk/YBHpTw2zb2A3FIok=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TWD3rTzEJGJUAmBWNZ7yh2v1R7aEDr7QKybUNk49xtkjikHLZENoqBGxxyZ1Ie4pcjVHtKbJRbGK4E2xbdo18qHcO0B5fG/wimX9OdLBjwVqsQxAJf8YY5i9wm1PhVf3Tt3QTdpm4hfPEaEAqyc9ltVT8rCx5xYMOxj2MQ6K5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Up16+LbN; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Up16+LbN"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af248209ba4so152091a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743625652; x=1744230452; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AgkA3Y29OmmQYCAZrMmGPHeXSG+tG3DycR1OgdCrTAE=;
        b=Up16+LbNm6CtDrRtU5UQ5S9cKwwK3zTk51HKQci6tHNv3DeNfBzvgK+JmKcmakj1p/
         dH5gBZax7rVi83U1DhBzP/MCMfcgRcxxk2Fyff6EDG6vx6M+THbPR8lCVbLyqY3LQVS2
         WRpWyEHQm0uLYnfGeMBiK4RnILojPuYFbeKo0UgAzfCgs3nyGTj59mn800HQeCH68cBv
         pRDnf885T+JH+z5vtHM21USmI+m9opckU5vDw/qNwAjduQyKpNSNfUBN6TFdxT/XB1/l
         Julvx6Sr/ydqaFguO294C5LKK/xNHqNthK2QIjZkfARtrpv9KsLDlzp73MW2ClG/JH88
         fXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743625652; x=1744230452;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgkA3Y29OmmQYCAZrMmGPHeXSG+tG3DycR1OgdCrTAE=;
        b=HNfWDMklMS1/VjK9BBU9PXmq/DYr3i6FDefUN604jXG0qMJEU140IIJAdAVph3iX9V
         PqtAaKqtsAEvXVgRbfG7pK2S/EciUkdBp+ifGIZXNY+ENVnaf9QXEfwmmcQYHSEKEM77
         xVR6EQdB0xpnG9TWgsiui4Mk2zGwdXu+hmxufsL6hsmSHcarERtBHdHm5ZYuMqdayAcy
         +zf1mA4nlkvHafYOnEu4xl/4ANLAmgQXi6P8B9C7h4ErCzFPosaTN845aIurFA9S5d1h
         aNbz8uA7H7K/0Om/cJpmkRZkkGNMwnZNb8J7OBjJCppLhe/6bo6zfUfP7poSOZhMugQl
         va5g==
X-Forwarded-Encrypted: i=1; AJvYcCVTlT+Iy6CBakkqFFiY9N30eh1+27BPSgNtCC5Ht5TtXV8PbLKtdly/7qhvaTHifwkiuB1FSS7ngguXb0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywak+GB2xxmZ8xDzYgHgjJjGPZi9OmDgcoqifYQHKCZpcNlpY72
	dzoGWFCdOU6O05zgwrz9VBQ/uxy+LpsY3b5DU7Ea0p3bJKt+ZxCv6AM7SFWUfDgHwRMMyOJusZ2
	r/lM9iQ==
X-Google-Smtp-Source: AGHT+IFUCBZtSd1jZaMyOQlfeHsrVKzPZUbE0VX+8I/AuOG8PteyiNItlgbzNisHH17oq/SzIZQITbASOFLm
X-Received: from plbko16.prod.google.com ([2002:a17:903:7d0:b0:220:ca3c:96bc])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88f:b0:221:78a1:27fb
 with SMTP id d9443c01a7336-2295be31744mr117782815ad.11.1743625652512; Wed, 02
 Apr 2025 13:27:32 -0700 (PDT)
Date: Wed,  2 Apr 2025 13:27:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402202728.2157627-1-dhavale@google.com>
Subject: [PATCH v2] erofs: lazily initialize per-CPU workers and CPU hotplug hooks
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
v1: https://lore.kernel.org/linux-erofs/20250331022011.645533-2-dhavale@google.com/
Changes since v1:
- Get rid of erofs_mount_count based init and tear down of resources
- Initialize resource in z_erofs_init_super() as suggested by Gao
- Introduce z_erofs_init_workers_once() and track it using atomic bool
- Improve commit message

 fs/erofs/internal.h |  2 ++
 fs/erofs/zdata.c    | 57 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4ac188d5d894..bbc92ee41846 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -450,6 +450,7 @@ int z_erofs_gbuf_growsize(unsigned int nrpages);
 int __init z_erofs_gbuf_init(void);
 void z_erofs_gbuf_exit(void);
 int z_erofs_parse_cfgs(struct super_block *sb, struct erofs_super_block *dsb);
+int z_erofs_init_workers_once(void);
 #else
 static inline void erofs_shrinker_register(struct super_block *sb) {}
 static inline void erofs_shrinker_unregister(struct super_block *sb) {}
@@ -458,6 +459,7 @@ static inline void erofs_exit_shrinker(void) {}
 static inline int z_erofs_init_subsystem(void) { return 0; }
 static inline void z_erofs_exit_subsystem(void) {}
 static inline int z_erofs_init_super(struct super_block *sb) { return 0; }
+static inline int z_erofs_init_workers_once(void) { return 0; };
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
 #ifdef CONFIG_EROFS_FS_BACKED_BY_FILE
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..75f0adcff97b 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -11,6 +11,7 @@
 
 #define Z_EROFS_PCLUSTER_MAX_PAGES	(Z_EROFS_PCLUSTER_MAX_SIZE / PAGE_SIZE)
 #define Z_EROFS_INLINE_BVECS		2
+static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
 
 struct z_erofs_bvec {
 	struct page *page;
@@ -403,10 +404,44 @@ static inline int erofs_cpu_hotplug_init(void) { return 0; }
 static inline void erofs_cpu_hotplug_destroy(void) {}
 #endif
 
-void z_erofs_exit_subsystem(void)
+static int z_erofs_init_workers(void)
 {
-	erofs_cpu_hotplug_destroy();
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
 	erofs_destroy_percpu_workers();
+err_init_percpu_workers:
+	atomic_set(&erofs_percpu_workers_initialized, 0);
+	return err;
+}
+
+int z_erofs_init_workers_once(void)
+{
+	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
+		return 0;
+	return z_erofs_init_workers();
+}
+
+static void z_erofs_destroy_workers(void)
+{
+	if (atomic_xchg(&erofs_percpu_workers_initialized, 0)) {
+		erofs_cpu_hotplug_destroy();
+		erofs_destroy_percpu_workers();
+	}
+}
+
+void z_erofs_exit_subsystem(void)
+{
+	z_erofs_destroy_workers();
 	destroy_workqueue(z_erofs_workqueue);
 	z_erofs_destroy_pcluster_pool();
 	z_erofs_exit_decompressor();
@@ -430,19 +465,8 @@ int __init z_erofs_init_subsystem(void)
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
@@ -645,6 +669,13 @@ static const struct address_space_operations z_erofs_cache_aops = {
 int z_erofs_init_super(struct super_block *sb)
 {
 	struct inode *const inode = new_inode(sb);
+	int err;
+
+	err = z_erofs_init_workers_once();
+	if (err) {
+		iput(inode);
+		return err;
+	}
 
 	if (!inode)
 		return -ENOMEM;
-- 
2.49.0.472.ge94155a9ec-goog

