Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFB026562C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396288; cv=none; b=N0N0I35cfVrnIfMnlaA59emBAoEtLpFaRgf1f3V/kk8c2hr3MMX2iIlDd2apGMNrDo96lpwKNugtuzCHsuxKu4nAH7l7Cv3ewWCQnSS66lk5IdCCG6HakHRshyIJ/V3eyyhR7x+OTD1fEkYGJPXlbyRMiKo5QdLT8ndC+uZaoS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396288; c=relaxed/simple;
	bh=nRJoE6GPpPEYF1ZSMzbifkzsjXmQmkdTAVt6VGbu/K8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAaobFjPNDuAcyn8Bb9FyDqBwatApyIGw3VKOlcg9/4NM2TOywMZaU/yFRhCxl6aeo1Wm9gg7MEKHoc18P8PiNwZdCraAuWHen7z+aaBUfgumK1QXcYUdxZNA3z+secrB1rkaM9U7L/y88KXC2V9b8FDnX7CHYt3sdSSugzBDw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNkmhTNd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNkmhTNd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227d6b530d8so24609895ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744396286; x=1745001086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRPOZVQkXRfwpOzWiufgGcFpts9ZagQT6/vUKl6a6JQ=;
        b=kNkmhTNdgzRH3IpIlTXrLDulu6IvnZOA6VFVm5L/w9nAX+S4uBt/Hc+5uz8aWy2y/+
         0Sc/fO6K4d19RuP3qXXbY+lRFII58/ZteSX1tmhRNA73sHE+w7t24d9/HnILPcqTnn5Z
         gWfifrB+m7slE8eOM4DfpmE8AXjsCtvKbX2tD4hnVAlGIkXCCrCCm7O201fxA4Y7j5UY
         RYJiZPnienybwkKlNwZoESVniuevXqocE42z7f9mbdum9yIQegoQEHWH5luvXAcMs4Jj
         1GbAIDjJ8OTC9GVQ8tin1ZMxDPGkJprwLSkGEbK2m+kMsODRWXOaURmr9eBL6tTOPton
         I00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396286; x=1745001086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRPOZVQkXRfwpOzWiufgGcFpts9ZagQT6/vUKl6a6JQ=;
        b=rOVT7T4E6gPDdwHNHJX6icrwCZf+z3RfYK6c5b6LW8ySnXNfA1bJmJAniVrpwxATDu
         RmzQ7uwgHtkGz9N6W8oGmymy3R4pN60ik2IN1BG0kcTSqqbNz6X3Dou0j8grtxZYCIa2
         fHYjdaKHTSrhclKpEnP0h3nvMZkm/F0wOYptQVesF3u9hI1bhK00dz59XwOOEutrEebZ
         dwsPHFM2S4Lqn3g6kyehM9rycv1czf8QPRHd97ZZEAnIONX9ITnJCj2aewMg4/APIm4M
         G1lknhcj7a9k+LS9aAYKdB2cIFtIpAwXQ0u5kwfZzQm3PtQp7jBvFudDRR1YxK/fJLX+
         zN/w==
X-Forwarded-Encrypted: i=1; AJvYcCXW9sdvCOlMRBomfMdzbMa2dqAQalsiEmZryMM5zWIcwPrJINaXyluNAA3NN8f49rO3yGVJUm/BpDJPy/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9RcLqgUUQ6YeOQmMFYGIZutC0kPFSrTDY0zWUq9x3dYmCw+Pm
	kyivu+tWxrdPwJmxh4M9zkSZEGL/bW0om+eeHyRnyFTUHr3vXHpN
X-Gm-Gg: ASbGncu7Y4EfvGfSd+oBV6oPFnc0hMmyJLKZLF5IboYF/FT9xeOOmbwdisLNbN4ytqB
	xYd8EgMoCqZp6nUdcDt1W6p11lH8h56Bc0UPFK9rtft3cFFQ6sVtG6/CjBG/93xFCBfICZibBCR
	XG/JKHj9IoNPuBq/QprQzXr1p0mDRm3TVP12KiydFgKzFZXIEiMlEIBcQxQ5bLcZgHmJXxSVUwz
	AWAghn+MWyBosOoa/d0E8+OPhZ83RoTJEem6pwHHcb2yMH5I6tK/LCaqsAnbKI/W5bgf8ZEEwd/
	ruywDJSSaYpI18wo/xMeVvIL/7Bk3Jd7hMsDaEoRLaf0j6qwl8RSWgYEvZfFHQ==
X-Google-Smtp-Source: AGHT+IEoSrwlrS+Sz3T5BanproigWZk053l8qmemLfFnl6ehs4v76G76glvJ2LAeLWGifi873TEcCg==
X-Received: by 2002:a17:903:3204:b0:223:5124:a16e with SMTP id d9443c01a7336-22bea49521dmr59481775ad.5.1744396285599;
        Fri, 11 Apr 2025 11:31:25 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cdcsm53279515ad.118.2025.04.11.11.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 11:31:25 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: alexjlzheng@tencent.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH kernfs 2/3] kernfs: switch global kernfs_rename_lock to per-fs lock
Date: Sat, 12 Apr 2025 02:31:08 +0800
Message-ID: <20250411183109.6334-3-alexjlzheng@tencent.com>
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

The kernfs implementation has big lock granularity(kernfs_rename_lock) so
every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.

This patch switches the global kernfs_rename_lock to per-fs lock, which
put the rwlock into kernfs_root.

Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
---
 fs/kernfs/dir.c             | 14 ++++++++------
 fs/kernfs/kernfs-internal.h | 15 +++++++++++----
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 355d943ffe27..d63a96786c9b 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -17,7 +17,6 @@
 
 #include "kernfs-internal.h"
 
-DEFINE_RWLOCK(kernfs_rename_lock);	/* kn->parent and ->name */
 /*
  * Don't use rename_lock to piggy back on pr_cont_buf. We don't want to
  * call pr_cont() while holding rename_lock. Because sometimes pr_cont()
@@ -228,7 +227,7 @@ int kernfs_path_from_node(struct kernfs_node *to, struct kernfs_node *from,
 	if (to) {
 		root = kernfs_root(to);
 		if (!(root->flags & KERNFS_ROOT_INVARIANT_PARENT)) {
-			guard(read_lock_irqsave)(&kernfs_rename_lock);
+			guard(read_lock_irqsave)(&root->kernfs_rename_lock);
 			return kernfs_path_from_node_locked(to, from, buf, buflen);
 		}
 	}
@@ -295,12 +294,14 @@ void pr_cont_kernfs_path(struct kernfs_node *kn)
 struct kernfs_node *kernfs_get_parent(struct kernfs_node *kn)
 {
 	struct kernfs_node *parent;
+	struct kernfs_root *root;
 	unsigned long flags;
 
-	read_lock_irqsave(&kernfs_rename_lock, flags);
+	root = kernfs_root(kn);
+	read_lock_irqsave(&root->kernfs_rename_lock, flags);
 	parent = kernfs_parent(kn);
 	kernfs_get(parent);
-	read_unlock_irqrestore(&kernfs_rename_lock, flags);
+	read_unlock_irqrestore(&root->kernfs_rename_lock, flags);
 
 	return parent;
 }
@@ -993,6 +994,7 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 	init_rwsem(&root->kernfs_iattr_rwsem);
 	init_rwsem(&root->kernfs_supers_rwsem);
 	INIT_LIST_HEAD(&root->supers);
+	rwlock_init(&root->kernfs_rename_lock);
 
 	/*
 	 * On 64bit ino setups, id is ino.  On 32bit, low 32bits are ino.
@@ -1789,7 +1791,7 @@ int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
 	/* rename_lock protects ->parent accessors */
 	if (old_parent != new_parent) {
 		kernfs_get(new_parent);
-		write_lock_irq(&kernfs_rename_lock);
+		write_lock_irq(&root->kernfs_rename_lock);
 
 		rcu_assign_pointer(kn->__parent, new_parent);
 
@@ -1797,7 +1799,7 @@ int kernfs_rename_ns(struct kernfs_node *kn, struct kernfs_node *new_parent,
 		if (new_name)
 			rcu_assign_pointer(kn->name, new_name);
 
-		write_unlock_irq(&kernfs_rename_lock);
+		write_unlock_irq(&root->kernfs_rename_lock);
 		kernfs_put(old_parent);
 	} else {
 		/* name assignment is RCU protected, parent is the same */
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 24e9514565ac..6061b6f70d2a 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -19,8 +19,6 @@
 #include <linux/kernfs.h>
 #include <linux/fs_context.h>
 
-extern rwlock_t kernfs_rename_lock;
-
 struct kernfs_iattrs {
 	kuid_t			ia_uid;
 	kgid_t			ia_gid;
@@ -53,6 +51,9 @@ struct kernfs_root {
 	struct rw_semaphore	kernfs_iattr_rwsem;
 	struct rw_semaphore	kernfs_supers_rwsem;
 
+	/* kn->parent and kn->name */
+	rwlock_t		kernfs_rename_lock;
+
 	struct rcu_head		rcu;
 };
 
@@ -108,6 +109,11 @@ static inline bool kernfs_root_is_locked(const struct kernfs_node *kn)
 	return lockdep_is_held(&kernfs_root(kn)->kernfs_rwsem);
 }
 
+static inline bool kernfs_rename_is_locked(const struct kernfs_node *kn)
+{
+	return lockdep_is_held(&kernfs_root(kn)->kernfs_rename_lock);
+}
+
 static inline const char *kernfs_rcu_name(const struct kernfs_node *kn)
 {
 	return rcu_dereference_check(kn->name, kernfs_root_is_locked(kn));
@@ -118,14 +124,15 @@ static inline struct kernfs_node *kernfs_parent(const struct kernfs_node *kn)
 	/*
 	 * The kernfs_node::__parent remains valid within a RCU section. The kn
 	 * can be reparented (and renamed) which changes the entry. This can be
-	 * avoided by locking kernfs_root::kernfs_rwsem or kernfs_rename_lock.
+	 * avoided by locking kernfs_root::kernfs_rwsem or
+	 * kernfs_root::kernfs_rename_lock.
 	 * Both locks can be used to obtain a reference on __parent. Once the
 	 * reference count reaches 0 then the node is about to be freed
 	 * and can not be renamed (or become a different parent) anymore.
 	 */
 	return rcu_dereference_check(kn->__parent,
 				     kernfs_root_is_locked(kn) ||
-				     lockdep_is_held(&kernfs_rename_lock) ||
+				     kernfs_rename_is_locked(kn) ||
 				     !atomic_read(&kn->count));
 }
 
-- 
2.48.1

