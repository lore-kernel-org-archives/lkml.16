Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD82222D7
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124210; cv=none; b=A+tmMimQsZ8S4of4w9c27lg0mCDwDcYpWzzwXLvp1H2fGafK//3MZmakpMBijFXoh3ecdLMeLXyH1SJM31wyndxDURI8CRT9ZhJ7Rrg9G01kTa/xjNAvWCKAXdxCzlo1blQ8ejqZC8/ed0pRSdaUBbnBb/HQ+ZUuArSRJ7D2ApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124210; c=relaxed/simple;
	bh=UtMsfvLY7fCorLEqj2D4FQ6y4sC+QdKXAWq13UtWR6A=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Vp2i7CdXB6x5waNhiU7UbOO3BXQF0PXATAy9lYSwIS2wM7D89gE3fQqSmafwNvXj/3e274OgfFHP1dRr2KdyUZuN8adwP5vqs1bvf7hajG1hqqjE8niox2UFlIT44SfpIuWk+DYAlqoplK27YS4F1tOWpRkxpOaQBLjpjCbVqm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GUEdgHd4; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GUEdgHd4"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-229170fbe74so13855305ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746124208; x=1746729008; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3rG8w2g5pnqsJKJGWGYS1RxgDYNaSDTgSGnqF5xlTZ8=;
        b=GUEdgHd4/+VOuXe9/c1dn5x4tT4G1nEIHyzVHEds2Z0uHyaEMnMaZ9dZDXH0H7DCI7
         AK/kF0EVL/qKMU3wbgYcx/Fz5C0QEoxV4Q4y7jomqzWncXMyuYDAzONgYdB1steAP5nR
         CU/MnsHJ2fdMkgLq9SdSUWQVJuddD4dak2LOck4d6bPKdQQ5kW5B+6AbhJ5IEPv3poE5
         5oSClZe5A8rPQFJSBXM0Y7ne/SFAhQ6iudWzH9AeDaIoEjGU0C1Q9mIrdc9bYirYDc/N
         vy/Tqk4sKqrRfuo7A3h2NdcxOR+ZV1U5DReQv5IjYLuFLHOZyDvqF1v9e43/BReDYHTg
         W4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124208; x=1746729008;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rG8w2g5pnqsJKJGWGYS1RxgDYNaSDTgSGnqF5xlTZ8=;
        b=vSLICULcg2T0ctxEdQZ9b3VFjwcA0Frxf915X2FsuieSufiv44lvWjmuM5X2slW9zM
         3rQwP+vuWRtMV/6ydcuu7pLQUMxcb7bLIYAAKECyNRXW6EgYSPgz0EWJppFhrMcLuGSb
         3qoKCsTrJhDX1zjYTRjMDlrHAORMAWxfwBs9kFx49N5dsgO8ITa/CLFJK4PXAFUR7kDU
         EAh5M7lJ+0zgqdcDYP/3kiQgwg4P4AGUJlgUdIrZ6nqTaMrhRJpGmw0rToU1kYUIuva9
         9vxSzZyDuWMS3ZdPfp0MIL6dO+QYHm5kCXJxvaoiytZFHyB41oD7hQPARzmdR5iNvJUb
         insQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKQRkuzkAHXJPh+FxyRBCcegETwTTVn73i8+J1atXOjtlNIU/zAEgM4HwzqnA0+yM16mmDHCTWyKFS8wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjtMZbjIWjvjamVSXOK7zLb4GTfbs6E1hl3x8UxaxvYlofGppl
	zglywvhYwR7qAkAhb0cE+Bq2DBjjA1bjsYjB4cUdPamTy+/+K3IdUUFiSF+c2EKiVyihYEEuMjt
	HZc9kXA==
X-Google-Smtp-Source: AGHT+IFCy3Tkgv0lUGNjpXI1njfh0c72fTF/eesLs+bEJmYiPDIlmtCy5LdBflB4Lquh+wEYnVrZKxdwPGHp
X-Received: from plll1.prod.google.com ([2002:a17:902:d041:b0:223:5416:c809])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:234b:b0:227:e74a:a066
 with SMTP id d9443c01a7336-22e1035e3f0mr1126485ad.28.1746124207650; Thu, 01
 May 2025 11:30:07 -0700 (PDT)
Date: Thu,  1 May 2025 11:30:02 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250501183003.1125531-1-dhavale@google.com>
Subject: [PATCH v5] erofs: lazily initialize per-CPU workers and CPU hotplug hooks
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
v4: https://lore.kernel.org/linux-erofs/20250423061023.131354-1-dhavale@google.com/
Changes since v4:
- remove redundant blank line as suggested by Gao
- add a log for failure path as suggested by Chao
- also add success log which will help in case there was a failure
  before, else stale failure log could cause unnecessary concern

 fs/erofs/zdata.c | 65 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 16 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..a5d3aef319b2 100644
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
@@ -336,9 +339,45 @@ static int erofs_init_percpu_workers(void)
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
+	if (err) {
+		erofs_err(NULL, "per-cpu workers: failed to allocate.");
+		goto err_init_percpu_workers;
+	}
+
+	err = erofs_cpu_hotplug_init();
+	if (err < 0) {
+		erofs_err(NULL, "per-cpu workers: failed CPU hotplug init.");
+		goto err_cpuhp_init;
+	}
+	erofs_info(NULL, "initialized per-cpu workers successfully.");
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
@@ -405,8 +444,7 @@ static inline void erofs_cpu_hotplug_destroy(void) {}
 
 void z_erofs_exit_subsystem(void)
 {
-	erofs_cpu_hotplug_destroy();
-	erofs_destroy_percpu_workers();
+	z_erofs_destroy_pcpu_workers();
 	destroy_workqueue(z_erofs_workqueue);
 	z_erofs_destroy_pcluster_pool();
 	z_erofs_exit_decompressor();
@@ -430,19 +468,8 @@ int __init z_erofs_init_subsystem(void)
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
@@ -644,8 +671,14 @@ static const struct address_space_operations z_erofs_cache_aops = {
 
 int z_erofs_init_super(struct super_block *sb)
 {
-	struct inode *const inode = new_inode(sb);
+	struct inode *inode;
+	int err;
+
+	err = z_erofs_init_pcpu_workers();
+	if (err)
+		return err;
 
+	inode = new_inode(sb);
 	if (!inode)
 		return -ENOMEM;
 	set_nlink(inode, 1);
-- 
2.49.0.967.g6a0df3ecc3-goog

