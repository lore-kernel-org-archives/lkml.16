Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE91C8631
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388631; cv=none; b=Nh6zXG3WUbXjJXLON5PT9wxKtz6/ZggfnGYETcOBCRbBG9uUgdjXfng3uy1PfIT7CE+ZpGwDVq0JekMNLuwmHcYPAJVBMG0UeWzx2NsASz2amqfvRpZA+UZyjdOcpROj3+uAWP3Syza7w0zI25orQfLsDO7Urx1qbgKgnERqvcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388631; c=relaxed/simple;
	bh=isXZ/lkET0kyWpPYMw7QPMNo8CKs/Thhj2dCa8XAJ+8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HqIqazJV9BgIOg1sKFYIsddSxUPPYXOSHJOkcYZGmk2yEgrwIe5imoOIBqPNl4+JvA5eh/3hYXGFREdqtxMY2aXtnntx+QTj7gwsigoMYKrwX/CaJhK2SdHxnkDlg95ITL+coIwvQLySjesJ9kjuJzSHwE2C1qWPEWDOSg8TIoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3T8dsdxC; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3T8dsdxC"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b06b29fee16so6162500a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745388629; x=1745993429; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1efO1jpxBkR5cfyumCuhwJzAxqy4mFoXfnTTvHZB6UQ=;
        b=3T8dsdxCps8kacKGPeFgxWt+DM773D4GapPk2zIEusXGMwWIt+3QmBLRHMPpBg/oOm
         3wJcHStQzRR1uBQvj6AN9AC1EMtuUr28kQDkC2g1XViUGHqqMSfKUiUKPrM+2OKME6cp
         y4d4EhXJkum9IE8rTJeOkqu1A2ttyGFMt2xUcSZ0DAiLht8jm8XHLdgOZj1Lt5a79XAy
         gE2YZ9gWGYq39PFRFXtICh0qpmsgDOnj/kHkE5ZDFeDkEB8lMdgTegrdV58UaeklTSfR
         la4uo0gTBLh7nK6M6itnEUXtBtqZ7Z4h8nYnGZlksf9jwKCP7RFy6KKJWn67zWwbBw8Z
         zDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388629; x=1745993429;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1efO1jpxBkR5cfyumCuhwJzAxqy4mFoXfnTTvHZB6UQ=;
        b=qSouy/OptaQ6ePjaco7aEiAhTLcOltLLMWgqg8vt6nq70JAq1/XIJ147E2Nqq8vQy5
         /t0Ruc1LqPmyfYFXFpwoEUbLfZZkHuKJjPN8NHWcc/M4dTXxsQwjV5VSw3Ejkkb63Uyh
         K2Ohne4j5Wv3pgn/JRolZponMQV6MH/KIRldxdQZEgMA1dd9xRmssv/Om0utRPXSqxY7
         tBvACIxWvWoeYj3vnTvnM3qvw0ipR31PHEvCJ5c9hveniSxQNOShVclsIplzSzfFQBuD
         xzm7bskRlIufqqklcOw6R5eDfy7IxCGsKEMw68np+2W7rB4IppGGfgwlchiZHwePGuVP
         MDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuVfLCCl/ZdrQjRLIHpSpZ5RN44RCz1ZUjfSQcjjyQP4KBS3ynBRxIMI6UvQtXxgbazTjzmP2w4nd0T78=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBFQx/PHHw/4kMxjWVQTLEJoKJoG4G/oozMfvGggyMnBrUsoDD
	SzZvBR10oCva291bECxjopRzgEdf+OfHucf8y3EULrerTO8VVMQhVKBHL7w7CNlRdWXL1685G8t
	Si24l3A==
X-Google-Smtp-Source: AGHT+IEzKaRCFUgt9qizCVhIYTkdVYONdfcIk3A5M/eXiNVkCRLgzBfUAzVE+CS+TyKYi3EZjV/34Sq+4T6u
X-Received: from pgbdn8.prod.google.com ([2002:a05:6a02:e08:b0:b0b:2032:ef98])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f03:b0:1f5:80a3:b008
 with SMTP id adf61e73a8af0-203cbcd6e19mr32803263637.32.1745388628715; Tue, 22
 Apr 2025 23:10:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 23:10:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423061023.131354-1-dhavale@google.com>
Subject: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU hotplug hooks
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
v3: https://lore.kernel.org/linux-erofs/20250422234546.2932092-1-dhavale@google.com/
Changes since v3:
- fold z_erofs_init_pcpu_workers() in the caller and rename the caller

 fs/erofs/zdata.c | 61 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..647a8340c9a1 100644
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
@@ -336,9 +339,40 @@ static int erofs_init_percpu_workers(void)
 	}
 	return 0;
 }
+
+static int z_erofs_init_pcpu_workers(void)
+{
+	int err;
+
+	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
+		return 0;
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
+static inline int z_erofs_init_pcpu_workers(void) { return 0; }
+static inline void z_erofs_destroy_pcpu_workers(void) {}
 #endif
 
 #if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_EROFS_FS_PCPU_KTHREAD)
@@ -405,8 +439,7 @@ static inline void erofs_cpu_hotplug_destroy(void) {}
 
 void z_erofs_exit_subsystem(void)
 {
-	erofs_cpu_hotplug_destroy();
-	erofs_destroy_percpu_workers();
+	z_erofs_destroy_pcpu_workers();
 	destroy_workqueue(z_erofs_workqueue);
 	z_erofs_destroy_pcluster_pool();
 	z_erofs_exit_decompressor();
@@ -430,19 +463,8 @@ int __init z_erofs_init_subsystem(void)
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
@@ -644,10 +666,17 @@ static const struct address_space_operations z_erofs_cache_aops = {
 
 int z_erofs_init_super(struct super_block *sb)
 {
-	struct inode *const inode = new_inode(sb);
+	struct inode *inode;
+	int err;
 
+	err = z_erofs_init_pcpu_workers();
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

