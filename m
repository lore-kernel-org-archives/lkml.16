Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFAD266B75
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396289; cv=none; b=ggKMFL8//vf2YUTn2ARw3GEA0InOukw6VKdI194dB41VbmL6mebM3KVdJoT8euNJ/s/XcoLg2tHKpWGbnvMJkYe43mIlkjlM8OR+VN5wiupEeTaB3yEuqmVEbVglbD1uc1w4FHPzkBLBVMdRM/316LCqfmGSpmeI2wXH3kazdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396289; c=relaxed/simple;
	bh=VGA/wTW21CpkRa7qBwWnyEviULB87UW6YI+tRU2IAtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cy0sLPsWW3PqwWui4i7mAaeqQHJ2om4JCf5aaSURahwisA6//UMWGPT5BHz2XY+1qoJoYv/DfFDMFS2+JSRpDBoyuEcz3P8UkCV/RRF7lZbAgUBdxIbe5d4ewOVafePZMbBZjstjoSaZZN9dtTxdSyHhPjzroGIOCgk7SnSCISk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLoR70vw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLoR70vw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227914acd20so28667525ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744396287; x=1745001087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pM14jnQzLfenTA2VQf8LACWxIBUDZfqO9aE4N45FzZU=;
        b=XLoR70vw9gCqJsq1VS0a9GUaDZ6m36BsFRd6F3vLxjJtnRoz9y2NU52OzNUBy2qvMq
         MgznG6Evuub7uOaaymz6MXkhAag5UphK5jd9ft1B6v6uBrtFllE2nWCiUDHgdx1uwkgj
         nT6esq9WvenGHSQEoXS8WNFcK+2HjuW4/dSpuQs5na/azF7gFd35DYN25wXDranIKrr9
         voO0i+VDUkPjPUG3hpXEUHUtFbx3RlWRQxVoQdc8ZjhDv1M+8q6z0XfGFVEbnFAhYhJz
         5Y4x7X8DqVpbmKpsWyntfZxwp75cBdDelgKKuBLPmeACdO4oA5Wi/6V5TAGPbFr0hgOv
         hkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396287; x=1745001087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM14jnQzLfenTA2VQf8LACWxIBUDZfqO9aE4N45FzZU=;
        b=oOaUmAAvSVFdSLZTVaVSFz4JfB7mzk7XXlm0cq6gWcEpZl0ZPocpIZVg7easE7DMbX
         oCz+cHMEwW4g9tPFrcZLq4DSrlRoKNcohRIpErxz2GyDYkyH5bK1S8D16wH/En8EUTCE
         YlkpzmOQjp67dL6B3V26vHcJT1AcBGw4JfW7TNvYU8E9uHjSofbksWK+x3B7LnkwpzjN
         KqQ6OoOH2kSIDs8KElRMtR/b1h0EjPwy6Mzn17ybkae4VxOeZqkfrwFST57jcvkVkB1/
         3OpdV6xrxMxZIkEn5TNjT0GVqx4dl/rgzwYINlSL88K5fTQIn+hcFAdI1xCve6zMk/my
         //3w==
X-Forwarded-Encrypted: i=1; AJvYcCXpRs6XXunr8l6eqNSaUlMlqAUKKTOwGobzaownMUPglOMAbQR5HZQ+SLwl+WSyyG0bKFVnXpYGJoUWuYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNEvXoa2SQY/3xf1RCK5oFt9RPl9GgwSJ81anBD+yCWepKCxE
	0I4BtrKg1F/BLiYUD9QmynawrGrfra7cACZgny2fFjz73YM/20VEUUea3ewawa4=
X-Gm-Gg: ASbGncvwTGVxJkshxhktzGbKrXEZlLJRY6rAjAGNU3KEof/MS2ngRypLmcttd7DbP3f
	4oU9MaUkPnAiGDNttRoY+jr9rXLK6Re0c5pv1BgBMH+UY3qluM8VDpkhV7C8CBPKlgGiSqorPp0
	gNoxKZObXezH5rXRZubxO0CquQ7fLGnmFSOluw4usfTkeb4pGT4XswZJ6RGX9lc5DO8ZOSFIvQE
	Ilo9dpwklSPdnEpE8Ikms/B41EqELcMCzg5zQtQDIby0qLn7lpS01n5UVTK/8pg/3UMJWWt0Qa+
	/SObI0rhLB8gJ94XnmbuqUglfo2A4RfSk6eDlXTR12AUnhNZRK0=
X-Google-Smtp-Source: AGHT+IEtX4hz/mJy7qUcYoRPvFiC5yx3emxSTRwYk+VHRrVmB3bxq8sDXdJpR/l+w40hDNnE/Tp2cg==
X-Received: by 2002:a17:902:cec5:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22bea04195dmr46654325ad.7.1744396287499;
        Fri, 11 Apr 2025 11:31:27 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cdcsm53279515ad.118.2025.04.11.11.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:31:27 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH kernfs 3/3] kernfs: switch global kernfs_pr_cont_lock to per-fs lock
Date: Sat, 12 Apr 2025 02:31:09 +0800
Message-ID: <20250411183109.6334-4-alexjlzheng@tencent.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411183109.6334-1-alexjlzheng@tencent.com>
References: <20250411183109.6334-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinliang Zheng <alexjlzheng@tencent.com>

The kernfs implementation has big lock granularity(kernfs_pr_cont_lock) so
every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.

This patch switches the global kernfs_pr_cont_lock to per-fs lock, which
put the spinlock into kernfs_root. Of course, kernfs_pr_cont_buf also needs
to be moved to kernfs_root.

Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
---
 fs/kernfs/dir.c             | 46 +++++++++++++++++--------------------
 fs/kernfs/kernfs-internal.h | 11 +++++++++
 2 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index d63a96786c9b..29605d7f0ab0 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -17,16 +17,6 @@
 
 #include "kernfs-internal.h"
 
-/*
- * Don't use rename_lock to piggy back on pr_cont_buf. We don't want to
- * call pr_cont() while holding rename_lock. Because sometimes pr_cont()
- * will perform wakeups when releasing console_sem. Holding rename_lock
- * will introduce deadlock if the scheduler reads the kernfs_name in the
- * wakeup path.
- */
-static DEFINE_SPINLOCK(kernfs_pr_cont_lock);
-static char kernfs_pr_cont_buf[PATH_MAX];	/* protected by pr_cont_lock */
-
 #define rb_to_kn(X) rb_entry((X), struct kernfs_node, rb)
 
 static bool __kernfs_active(struct kernfs_node *kn)
@@ -244,13 +234,15 @@ EXPORT_SYMBOL_GPL(kernfs_path_from_node);
 void pr_cont_kernfs_name(struct kernfs_node *kn)
 {
 	unsigned long flags;
+	struct kernfs_root *root = kernfs_root(kn);
 
-	spin_lock_irqsave(&kernfs_pr_cont_lock, flags);
+	spin_lock_irqsave(&root->kernfs_pr_cont_lock, flags);
 
-	kernfs_name(kn, kernfs_pr_cont_buf, sizeof(kernfs_pr_cont_buf));
-	pr_cont("%s", kernfs_pr_cont_buf);
+	kernfs_name(kn, root->kernfs_pr_cont_buf,
+			sizeof(root->kernfs_pr_cont_buf));
+	pr_cont("%s", root->kernfs_pr_cont_buf);
 
-	spin_unlock_irqrestore(&kernfs_pr_cont_lock, flags);
+	spin_unlock_irqrestore(&root->kernfs_pr_cont_lock, flags);
 }
 
 /**
@@ -263,11 +255,12 @@ void pr_cont_kernfs_path(struct kernfs_node *kn)
 {
 	unsigned long flags;
 	int sz;
+	struct kernfs_root *root = kernfs_root(kn);
 
-	spin_lock_irqsave(&kernfs_pr_cont_lock, flags);
+	spin_lock_irqsave(&root->kernfs_pr_cont_lock, flags);
 
-	sz = kernfs_path_from_node(kn, NULL, kernfs_pr_cont_buf,
-				   sizeof(kernfs_pr_cont_buf));
+	sz = kernfs_path_from_node(kn, NULL, root->kernfs_pr_cont_buf,
+				   sizeof(root->kernfs_pr_cont_buf));
 	if (sz < 0) {
 		if (sz == -E2BIG)
 			pr_cont("(name too long)");
@@ -276,10 +269,10 @@ void pr_cont_kernfs_path(struct kernfs_node *kn)
 		goto out;
 	}
 
-	pr_cont("%s", kernfs_pr_cont_buf);
+	pr_cont("%s", root->kernfs_pr_cont_buf);
 
 out:
-	spin_unlock_irqrestore(&kernfs_pr_cont_lock, flags);
+	spin_unlock_irqrestore(&root->kernfs_pr_cont_lock, flags);
 }
 
 /**
@@ -888,19 +881,21 @@ static struct kernfs_node *kernfs_walk_ns(struct kernfs_node *parent,
 {
 	ssize_t len;
 	char *p, *name;
+	struct kernfs_root *root = kernfs_root(parent);
 
-	lockdep_assert_held_read(&kernfs_root(parent)->kernfs_rwsem);
+	lockdep_assert_held_read(&root->kernfs_rwsem);
 
-	spin_lock_irq(&kernfs_pr_cont_lock);
+	spin_lock_irq(&root->kernfs_pr_cont_lock);
 
-	len = strscpy(kernfs_pr_cont_buf, path, sizeof(kernfs_pr_cont_buf));
+	len = strscpy(root->kernfs_pr_cont_buf, path,
+			sizeof(root->kernfs_pr_cont_buf));
 
 	if (len < 0) {
-		spin_unlock_irq(&kernfs_pr_cont_lock);
+		spin_unlock_irq(&root->kernfs_pr_cont_lock);
 		return NULL;
 	}
 
-	p = kernfs_pr_cont_buf;
+	p = root->kernfs_pr_cont_buf;
 
 	while ((name = strsep(&p, "/")) && parent) {
 		if (*name == '\0')
@@ -908,7 +903,7 @@ static struct kernfs_node *kernfs_walk_ns(struct kernfs_node *parent,
 		parent = kernfs_find_ns(parent, name, ns);
 	}
 
-	spin_unlock_irq(&kernfs_pr_cont_lock);
+	spin_unlock_irq(&root->kernfs_pr_cont_lock);
 
 	return parent;
 }
@@ -995,6 +990,7 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 	init_rwsem(&root->kernfs_supers_rwsem);
 	INIT_LIST_HEAD(&root->supers);
 	rwlock_init(&root->kernfs_rename_lock);
+	spin_lock_init(&root->kernfs_pr_cont_lock);
 
 	/*
 	 * On 64bit ino setups, id is ino.  On 32bit, low 32bits are ino.
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 6061b6f70d2a..c7fe50955e8c 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -55,6 +55,17 @@ struct kernfs_root {
 	rwlock_t		kernfs_rename_lock;
 
 	struct rcu_head		rcu;
+
+	/*
+	 * Don't use rename_lock to piggy back on pr_cont_buf. We don't want to
+	 * call pr_cont() while holding rename_lock. Because sometimes pr_cont()
+	 * will perform wakeups when releasing console_sem. Holding rename_lock
+	 * will introduce deadlock if the scheduler reads the kernfs_name in the
+	 * wakeup path.
+	 */
+	spinlock_t		kernfs_pr_cont_lock;
+	/* protected by pr_cont_lock */
+	char			kernfs_pr_cont_buf[PATH_MAX];
 };
 
 /* +1 to avoid triggering overflow warning when negating it */
-- 
2.48.1

