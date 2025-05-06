Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C92206A6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572271; cv=none; b=l/bJQd2VYLfRnzlNwGZ0WFjIKr1e15yUQ0bet8DQ5CiCfpwXIZeaS5XyIrja33QhIo7IwQADcTjg8MM4iXmeVSx4WEt28W0egJyMC/kFyx2cl5xrw9roFZAgngHJBz5sTDVzav1M5AfMQ7UWiDcj0jcFatGUX/8RuIpNhAfTp84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572271; c=relaxed/simple;
	bh=8jcNpIGPrZDoqsvc1YJaJ9UcWqfSIDomQu2xeMdtmMc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HuVUwmcsp9ukB06B7z+Q/1O1NEskqeCX1O/UNb9uJGjOjCfUx+UKXRR7TgDIDGz1WXZV/avpA5fUuaHAGoGPcS05GZQyiiO1jBt79xqGGPnSt8JWtP+cFwLT1+ZY7wgFDTGzuRw1EC5hPuDERbWRPtd6SEFJHCSui5ZSZGqu6tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O+PAWPsT; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O+PAWPsT"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254e0b4b85so3225095ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746572269; x=1747177069; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6eDff5j1BSe64nzccDcAn4Qo86/NWyx+D0Je4IAcyac=;
        b=O+PAWPsTQlygU0D14D7OmpLa/6JbjSuKu+Tprmwwyuz7p+9Un1ZLg7kj8EWSGLcmN9
         bry4cMXT8SyVdX+zlwUEqhVQljdbSK3VW/dnB6eim1gFezcJgdy1TtW/VraLaCUot2z6
         X8BwViY8SD6tm8j6XdRNqBKXsXPzgWoOunF4JSsZVWIQvun7jyyiMq3oZg8GUdNt/38G
         kSkzU+w+I1E452OGCBQS1G0qjJYJgOR4GtvT4YpX+4z+e1r4okeXwBuzmqBStuNfo7Nc
         8OAbLVxfDdx+DJB+PpM0iW/dxuTiLDGwnt+0lqt01+RrVjjYkEN46pU+e4B/KusDEisp
         7gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572269; x=1747177069;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6eDff5j1BSe64nzccDcAn4Qo86/NWyx+D0Je4IAcyac=;
        b=RizRPE1QCiXJT7F+9hd5R3SIO4dnZlRGrK44xrMU/x4KZ4yMJRswD2+si53pwwDDe4
         XAvzbZImF8gBD0KWDAubFqNH8jivEOVsx90GXs+wcp20GZnewxd736ZHREAecn4nQ4v6
         kxIF9lxuTzTfm4q86IHfszsEOlSDT+gf8kQXGSlxuDNGttzKj5O0ahPRPrKJmG2mIVXJ
         LhAEm89UxmF0ZUz5p7N1XL6bmLGnBBFUgV574xEm4F+sP5/UF8XUqdOet8ijvRNPwoSk
         ATy2ovWZKaijUz0f1w5jp9m5M3FeQyIzcxEGee1I20dR15K35L6YFxkaobiDM/t3YRHE
         1uWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSjesBOqzdn+JO0OrjPtKGmM1jfjyozNcXYbZnrhcCoc8xAe7UFcGeGhNL/GJNVy4bddAMXENx2oczcuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQnTZY5WQFUxLMiMUQCsYv6FEqJq+euDHRozKRdz5hPTlWoEG
	QTrw2zWgtALTsx3Pjwfwj9SYqbQM86xOcqHbidQrht31dWSs553yDxbtjKJrZdvDuI5fAmpmGi+
	l0PROMg==
X-Google-Smtp-Source: AGHT+IE1PDhDMNYoRtAJX1/3t5lH5zhttLLAu5JIa3TnRr7p4kKvsPCcHCn5sIfILdSU9kfOSkh2gGL3Frja
X-Received: from pgvt21.prod.google.com ([2002:a65:64d5:0:b0:b0d:bc6d:106])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e78c:b0:223:3eed:f680
 with SMTP id d9443c01a7336-22e5d9d6114mr22067365ad.18.1746572268748; Tue, 06
 May 2025 15:57:48 -0700 (PDT)
Date: Tue,  6 May 2025 15:57:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250506225743.308517-1-dhavale@google.com>
Subject: [PATCH v6] erofs: lazily initialize per-CPU workers and CPU hotplug hooks
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
v5: https://lore.kernel.org/linux-erofs/20250501183003.1125531-1-dhavale@google.com/
Changes since v5:
- Pass sb to z_erofs_init_pcpu_workers so we can log success/failure
  messages, so we know the context in which the event happened as
  suggested by Gao.
- Move the CONFIG_CPU_HOTPLUG code inside CONFIG_EROFS_FS_PCPU_KTHREAD
  so it is much more readable and also avoids forward declaration for
  some functions.
 fs/erofs/zdata.c | 70 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 50 insertions(+), 20 deletions(-)

diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..0afbdabe8d3e 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -291,6 +291,7 @@ static struct workqueue_struct *z_erofs_workqueue __read_mostly;
 
 #ifdef CONFIG_EROFS_FS_PCPU_KTHREAD
 static struct kthread_worker __rcu **z_erofs_pcpu_workers;
+static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
 
 static void erofs_destroy_percpu_workers(void)
 {
@@ -336,12 +337,8 @@ static int erofs_init_percpu_workers(void)
 	}
 	return 0;
 }
-#else
-static inline void erofs_destroy_percpu_workers(void) {}
-static inline int erofs_init_percpu_workers(void) { return 0; }
-#endif
 
-#if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_EROFS_FS_PCPU_KTHREAD)
+#ifdef CONFIG_HOTPLUG_CPU
 static DEFINE_SPINLOCK(z_erofs_pcpu_worker_lock);
 static enum cpuhp_state erofs_cpuhp_state;
 
@@ -398,15 +395,53 @@ static void erofs_cpu_hotplug_destroy(void)
 	if (erofs_cpuhp_state)
 		cpuhp_remove_state_nocalls(erofs_cpuhp_state);
 }
-#else /* !CONFIG_HOTPLUG_CPU || !CONFIG_EROFS_FS_PCPU_KTHREAD */
+#else /* !CONFIG_HOTPLUG_CPU  */
 static inline int erofs_cpu_hotplug_init(void) { return 0; }
 static inline void erofs_cpu_hotplug_destroy(void) {}
-#endif
+#endif/* CONFIG_HOTPLUG_CPU */
+static int z_erofs_init_pcpu_workers(struct super_block *sb)
+{
+	int err;
 
-void z_erofs_exit_subsystem(void)
+	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
+		return 0;
+
+	err = erofs_init_percpu_workers();
+	if (err) {
+		erofs_err(sb, "per-cpu workers: failed to allocate.");
+		goto err_init_percpu_workers;
+	}
+
+	err = erofs_cpu_hotplug_init();
+	if (err < 0) {
+		erofs_err(sb, "per-cpu workers: failed CPU hotplug init.");
+		goto err_cpuhp_init;
+	}
+	erofs_info(sb, "initialized per-cpu workers successfully.");
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
 {
+	if (!atomic_xchg(&erofs_percpu_workers_initialized, 0))
+		return;
 	erofs_cpu_hotplug_destroy();
 	erofs_destroy_percpu_workers();
+}
+#else /* !CONFIG_EROFS_FS_PCPU_KTHREAD */
+static inline int z_erofs_init_pcpu_workers(struct super_block *sb) { return 0; }
+static inline void z_erofs_destroy_pcpu_workers(void) {}
+#endif/* CONFIG_EROFS_FS_PCPU_KTHREAD */
+
+void z_erofs_exit_subsystem(void)
+{
+	z_erofs_destroy_pcpu_workers();
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
@@ -644,8 +668,14 @@ static const struct address_space_operations z_erofs_cache_aops = {
 
 int z_erofs_init_super(struct super_block *sb)
 {
-	struct inode *const inode = new_inode(sb);
+	struct inode *inode;
+	int err;
+
+	err = z_erofs_init_pcpu_workers(sb);
+	if (err)
+		return err;
 
+	inode = new_inode(sb);
 	if (!inode)
 		return -ENOMEM;
 	set_nlink(inode, 1);
-- 
2.49.0.987.g0cc8ee98dc-goog

