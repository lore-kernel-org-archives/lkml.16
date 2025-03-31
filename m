Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F122905
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743387634; cv=none; b=JSxVFDPet3Dwm2fxhpuUic8rDpRHvAUu3Cb4hPhbG/3iRLneiRJandd5cCZwlfLeG/rF/M7TutQw2ueuBX8WZJtIRLkO7AtatYURxvMvuru14xBxniNKAKmzLSuEC8hajKLnhCIThikVXC0CvdWsbYz5ZM2BSY7ssos2nqPr1Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743387634; c=relaxed/simple;
	bh=uVve+fHW9CyfNbfNoh2Mn4yQ/akcLSviXkI4i3E/AWg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bfy98ylrt6C4PBncnQVP/W8zS0Nrvg2gpxrFSsYFYcN5EYiQCdLJ2MhO1UEnhE9+k2W0D/IBL4SdIAkGgnMdhrn2P//HLGQxk3H/sdPFAWhdVySTPjQYjDkjXxtbAWdT78RBO7LwPwOjl9jOkWbwDsF137A78BNDlAcMkX3nWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhhQ8W6A; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhhQ8W6A"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso7336092a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743387631; x=1743992431; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWo5igrEPXFMOZGYJoDbqOqkIE246nBzf9T+In+irrM=;
        b=uhhQ8W6AXLMptw96aqf12cuXRg5qZSF+QRM6lH4i2nsQKCuS4fS1bjIg7KBkolg8gT
         GAG33VTnz5PVDHilONzWDhsrFJ64bez2LGc+Gbg/jyGuaSeBcQ3UrAQMCcd4EzTG4tGz
         mVhFIFgT4yN/GnztjdxPVHVQPS4+EVH/EQQNb8Hp2XJbUBFxyPlJ6fIDBv8pfozFLOne
         eehGujY4Rt2lz7m1mV8501jNe60ZOSqdr0SNET0t1kLp1o2EnibPDt5bKMDokAGcQq8K
         0Y80gKTXwTpG72S+Mb1Nd9K9dAdJCWFB7wDsf4pq80uT6OX2pU627DchLhe7RuOWkSkR
         SmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743387631; x=1743992431;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWo5igrEPXFMOZGYJoDbqOqkIE246nBzf9T+In+irrM=;
        b=eOP/owJQHahlmFM0Vigv4CWf7BjnFmGzGGUJk1Qz95751Zhmj3tOSHKFq8ayRItzTB
         ry3JYBBqPB1KLIzWknAsn8Sa9t+y9FSD2of37uf1jARuNzMC6noAoGmGmMTRixtpMyFS
         vlghzbhaUs89o4JK8Ah8EJp+Cou5wrA+JXxDPXMxt3o4zbh0YJ50pB+s+sPyQu1vXjYw
         rtWXHTFNjIwKpdZLwYTO8y+anYI++7r3pIN1FtDDn3PGmSVjMBxQ7TyXXSR4kq0L8P9l
         +x88k22XFfM1RZCctGeuJyvKzyCf0W0l+ZYzqhC3WTs46R52wa/Ymre0g2sAUpoL/Ue6
         N3JA==
X-Forwarded-Encrypted: i=1; AJvYcCUfxgl3Q9mAEQY8D2Zgw9oA2cr1O2HI+hk2Wmi0pHg7LqlL8DvM0bci+wwEP6MgeaezOAZOsjYij69I02M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAbECAZHULl8bH7AB68pcHwqyCdMK5uzPZKq+GWeCeEeR3R74X
	8eh6tBnQh70vct8aNmzobVCzSRBzQ1KWYg5EX22K+ZwiNZ6JdueOV049FAw3EelJCVZoM8CLVfx
	LQk9j5g==
X-Google-Smtp-Source: AGHT+IFEPXf/Mt+Lxupw8oElteSR68csVTfxhv8Ao5MIFQc5+2vOisI5ACmq74jcfR3FVUwMpkznpQSdMVBE
X-Received: from pgh12.prod.google.com ([2002:a05:6a02:4e0c:b0:af2:448e:a04d])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9202:b0:1f5:6e00:14db
 with SMTP id adf61e73a8af0-2009f5fd679mr12747317637.14.1743387630666; Sun, 30
 Mar 2025 19:20:30 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:20:08 -0700
In-Reply-To: <20250331022011.645533-1-dhavale@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331022011.645533-1-dhavale@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331022011.645533-2-dhavale@google.com>
Subject: [PATCH v1 1/1] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
From: Sandeep Dhavale <dhavale@google.com>
To: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>
Cc: hsiangkao@linux.alibaba.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Defer initialization of per-CPU workers and registration for CPU hotplug
events until the first mount. Similarly, unregister from hotplug events
and destroy per-CPU workers when the last mount is unmounted.

Signed-off-by: Sandeep Dhavale <dhavale@google.com>
---
 fs/erofs/internal.h |  5 +++++
 fs/erofs/super.c    | 27 +++++++++++++++++++++++++++
 fs/erofs/zdata.c    | 35 +++++++++++++++++++++++------------
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 4ac188d5d894..c88cba4da3eb 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -450,6 +450,8 @@ int z_erofs_gbuf_growsize(unsigned int nrpages);
 int __init z_erofs_gbuf_init(void);
 void z_erofs_gbuf_exit(void);
 int z_erofs_parse_cfgs(struct super_block *sb, struct erofs_super_block *dsb);
+int z_erofs_init_workers(void);
+void z_erofs_destroy_workers(void);
 #else
 static inline void erofs_shrinker_register(struct super_block *sb) {}
 static inline void erofs_shrinker_unregister(struct super_block *sb) {}
@@ -458,6 +460,9 @@ static inline void erofs_exit_shrinker(void) {}
 static inline int z_erofs_init_subsystem(void) { return 0; }
 static inline void z_erofs_exit_subsystem(void) {}
 static inline int z_erofs_init_super(struct super_block *sb) { return 0; }
+static inline int z_erofs_init_workers(void) { return 0; };
+static inline  z_erofs_exit_workers(void);
+
 #endif	/* !CONFIG_EROFS_FS_ZIP */
 
 #ifdef CONFIG_EROFS_FS_BACKED_BY_FILE
diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index cadec6b1b554..8e8d3a7c8dba 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -17,6 +17,7 @@
 #include <trace/events/erofs.h>
 
 static struct kmem_cache *erofs_inode_cachep __read_mostly;
+static atomic_t erofs_mount_count = ATOMIC_INIT(0);
 
 void _erofs_printk(struct super_block *sb, const char *fmt, ...)
 {
@@ -777,9 +778,28 @@ static const struct fs_context_operations erofs_context_ops = {
 	.free		= erofs_fc_free,
 };
 
+static inline int erofs_init_zip_workers_if_needed(void)
+{
+	int ret;
+
+	if (atomic_inc_return(&erofs_mount_count) == 1) {
+		ret = z_erofs_init_workers();
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static inline void erofs_destroy_zip_workers_if_last(void)
+{
+	if (atomic_dec_and_test(&erofs_mount_count))
+		z_erofs_destroy_workers();
+}
+
 static int erofs_init_fs_context(struct fs_context *fc)
 {
 	struct erofs_sb_info *sbi;
+	int err;
 
 	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
@@ -790,6 +810,12 @@ static int erofs_init_fs_context(struct fs_context *fc)
 		kfree(sbi);
 		return -ENOMEM;
 	}
+	err = erofs_init_zip_workers_if_needed();
+	if (err) {
+		kfree(sbi->devs);
+		kfree(sbi);
+		return err;
+	}
 	fc->s_fs_info = sbi;
 
 	idr_init(&sbi->devs->tree);
@@ -823,6 +849,7 @@ static void erofs_kill_sb(struct super_block *sb)
 	erofs_fscache_unregister_fs(sb);
 	erofs_sb_free(sbi);
 	sb->s_fs_info = NULL;
+	erofs_destroy_zip_workers_if_last();
 }
 
 static void erofs_put_super(struct super_block *sb)
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 0671184d9cf1..4cd91b798716 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -403,10 +403,32 @@ static inline int erofs_cpu_hotplug_init(void) { return 0; }
 static inline void erofs_cpu_hotplug_destroy(void) {}
 #endif
 
-void z_erofs_exit_subsystem(void)
+int z_erofs_init_workers(void)
+{
+	int err;
+
+	err = erofs_init_percpu_workers();
+	if (err)
+		return err;
+
+	err = erofs_cpu_hotplug_init();
+	if (err < 0)
+		goto err_cpuhp_init;
+	return err;
+
+err_cpuhp_init:
+	erofs_destroy_percpu_workers();
+	return err;
+}
+
+void z_erofs_destroy_workers(void)
 {
 	erofs_cpu_hotplug_destroy();
 	erofs_destroy_percpu_workers();
+}
+
+void z_erofs_exit_subsystem(void)
+{
 	destroy_workqueue(z_erofs_workqueue);
 	z_erofs_destroy_pcluster_pool();
 	z_erofs_exit_decompressor();
@@ -430,19 +452,8 @@ int __init z_erofs_init_subsystem(void)
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
-- 
2.49.0.472.ge94155a9ec-goog

