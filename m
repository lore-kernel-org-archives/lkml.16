Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A0D28466B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731427; cv=none; b=aSfHET3xJsjuf0ZtPnfcWWDc6PQQqObVLm5XQEQ0GX19F4fngwZq1hQ7LiyAdL61XWk+tER4yCXbcIwlAI+0D8rZD1r1hhLPzKjaTk52BUEe6UctMuoVed0pfacUY1sji5TmhGUa8us3zTi8E6IpiNejHW5X1zLB1X+23EEWN8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731427; c=relaxed/simple;
	bh=Z0VDKI+lyzxqbYKLqxgloNLEeCjMa2vB+GmQsxeG0i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3kbUtD6pvm6WNUEP3u9siGe7U6BamW7QrFTlqzww/DobtxDKdY3YROqZRtE8CraHPeGYOAYifM0/WrtzrGasU5s1WSVo14kKL9oqiteXXJGuUVpvbCip0GrSAtNvrEnudx1uD3FBE5vrvSp8Tl0PkEnGAnR8whOLE4bLZFXPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBdAsaLh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBdAsaLh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22435603572so54723535ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731425; x=1745336225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYqxO4DprOCfNzQ/7WnXe1FCwCF9stbfd3UHJM/ZoxE=;
        b=BBdAsaLh2SCYPA1hyF9X2cHF7DNCDBUxSYrzCD9aAPyauvssEJuaabY2VApk8vZlkj
         RNH4cKn6C+oAfmvKcHJlCOgxvxPFbIMIRpxKTb3/PSPqdCb7b/tVt5s287MwB34oV0KM
         czWBCUcC8LoAkSlW4IWWAmx+xs54sHUD427K+G004MqyGWjWg4i+6vF0VASLYTdxgmA0
         8CGiGk4K6+dnm/LFgAtufPFInmFnKo60JCAL/5UVxjitBM4lHV6wZB0hLbJwHj5ktQ1w
         3UMk79ztmw1mDOOVvR8qWU21PXrJHyTX7kt13P0YFFJpzxKoRphTeAU2XXiglWZ1JG0Z
         0H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731425; x=1745336225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYqxO4DprOCfNzQ/7WnXe1FCwCF9stbfd3UHJM/ZoxE=;
        b=SNWen9rwytQyHQJOkFGNJk+WZuC7U7xIuJAXtR9HnOnsors+IbZjIF7NO79GSLNa5V
         o2HZIMeojwjmRpOZrpM+U0r6z8Rfd/hAtG10xnpOWeJlM82iEPXbCMIcAzKMH+ul77W0
         Ktttq1lBOclFbZmmHtNh4MrXs/PmjHOjBF21UZkOrKtuVVmfu8nY1qo6swDzfTdeOs7S
         VYAHBa/9OYVnJ2fq7EYV+DW/RUCVndpH7wniQ2E1yg5H9nFVcz9czgDUIuhb2TAGaRH8
         UMfp+bmCd5oZXDIXNnG40k/ZVIwVRUFhD16fTzYxaq3HyGPjbjX5AiK0ndUT89YdAShq
         hfSg==
X-Gm-Message-State: AOJu0YwDsnj8S9HDSPyGTG0d4QUTzGUII74WtrKqKFjs/D9J/YxCQFeE
	kUVMNv4iscCgt8OyGaSpWQMX3UCgYoBMlPBvl+UxIrWm3JOVCwC7
X-Gm-Gg: ASbGncudGLm0cptObcAZ2RDlZRwtDbJOA83gMXKkkIQRKESFMu09ToeRtWWZ4H6+URP
	upZ7mmj6eZNlC/RMZmFh1L/xXPSNFeGBFZbAtaCDsrp8zKO2JGQO3ZUbiWY352T3lSbAyslLhSi
	kpv3etHHCnIkXIfIx2toyjnMKZFy3zfyGlZsWuHqeX/lHVtsj+N2skTZX3EnNRGnDFlfcWqf61T
	mSg6dazz2BtqltIaWTlG6rh96VVxJHICIxu7HiQRBzgjJuTKJgmfxTG+HsgozrO5FStgzyniEMG
	EIJ9AbGE3t6dRGeZUQzKh6sEcdJpnUv0CE7VMmRsLjKG3PsQvYk=
X-Google-Smtp-Source: AGHT+IHk23Xg0bkFNAcL5lltLUZmK04teJ4c6wBeaaL+Yj5dOcGvpscJT2psIOxUgWE4zgoj9kDBzw==
X-Received: by 2002:a17:903:1447:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22bea4bd57fmr280275475ad.28.1744731424875;
        Tue, 15 Apr 2025 08:37:04 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca66sm119207245ad.252.2025.04.15.08.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:37:04 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinliang Zheng <alexjlzheng@tencent.com>
Subject: [PATCH v2 1/2] kernfs: switch global kernfs_idr_lock to per-fs lock
Date: Tue, 15 Apr 2025 23:36:58 +0800
Message-ID: <20250415153659.14950-2-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153659.14950-1-alexjlzheng@tencent.com>
References: <20250415153659.14950-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinliang Zheng <alexjlzheng@tencent.com>

The kernfs implementation has big lock granularity(kernfs_idr_lock) so
every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.

This patch switches the global kernfs_idr_lock to per-fs lock, which
put the spinlock into kernfs_root.

Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
---
 fs/kernfs/dir.c             | 14 +++++++-------
 fs/kernfs/kernfs-internal.h |  1 +
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index fc70d72c3fe8..355d943ffe27 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -27,7 +27,6 @@ DEFINE_RWLOCK(kernfs_rename_lock);	/* kn->parent and ->name */
  */
 static DEFINE_SPINLOCK(kernfs_pr_cont_lock);
 static char kernfs_pr_cont_buf[PATH_MAX];	/* protected by pr_cont_lock */
-static DEFINE_SPINLOCK(kernfs_idr_lock);	/* root->ino_idr */
 
 #define rb_to_kn(X) rb_entry((X), struct kernfs_node, rb)
 
@@ -584,9 +583,9 @@ void kernfs_put(struct kernfs_node *kn)
 	if (kernfs_type(kn) == KERNFS_LINK)
 		kernfs_put(kn->symlink.target_kn);
 
-	spin_lock(&kernfs_idr_lock);
+	spin_lock(&root->kernfs_idr_lock);
 	idr_remove(&root->ino_idr, (u32)kernfs_ino(kn));
-	spin_unlock(&kernfs_idr_lock);
+	spin_unlock(&root->kernfs_idr_lock);
 
 	call_rcu(&kn->rcu, kernfs_free_rcu);
 
@@ -639,13 +638,13 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 		goto err_out1;
 
 	idr_preload(GFP_KERNEL);
-	spin_lock(&kernfs_idr_lock);
+	spin_lock(&root->kernfs_idr_lock);
 	ret = idr_alloc_cyclic(&root->ino_idr, kn, 1, 0, GFP_ATOMIC);
 	if (ret >= 0 && ret < root->last_id_lowbits)
 		root->id_highbits++;
 	id_highbits = root->id_highbits;
 	root->last_id_lowbits = ret;
-	spin_unlock(&kernfs_idr_lock);
+	spin_unlock(&root->kernfs_idr_lock);
 	idr_preload_end();
 	if (ret < 0)
 		goto err_out2;
@@ -681,9 +680,9 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 	return kn;
 
  err_out3:
-	spin_lock(&kernfs_idr_lock);
+	spin_lock(&root->kernfs_idr_lock);
 	idr_remove(&root->ino_idr, (u32)kernfs_ino(kn));
-	spin_unlock(&kernfs_idr_lock);
+	spin_unlock(&root->kernfs_idr_lock);
  err_out2:
 	kmem_cache_free(kernfs_node_cache, kn);
  err_out1:
@@ -989,6 +988,7 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 		return ERR_PTR(-ENOMEM);
 
 	idr_init(&root->ino_idr);
+	spin_lock_init(&root->kernfs_idr_lock);
 	init_rwsem(&root->kernfs_rwsem);
 	init_rwsem(&root->kernfs_iattr_rwsem);
 	init_rwsem(&root->kernfs_supers_rwsem);
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 40a2a9cd819d..24e9514565ac 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -40,6 +40,7 @@ struct kernfs_root {
 
 	/* private fields, do not use outside kernfs proper */
 	struct idr		ino_idr;
+	spinlock_t		kernfs_idr_lock;	/* root->ino_idr */
 	u32			last_id_lowbits;
 	u32			id_highbits;
 	struct kernfs_syscall_ops *syscall_ops;
-- 
2.49.0

