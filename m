Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18CC297A6B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731429; cv=none; b=VWQLzzFpGp9j2RLMbyaLUT0JpsxAbw4nk0Lj+Y19qA5Iog5nfY1tQMfOlGVFZI8jS5I3JmX+vT0+xJ5X64TmP1R/pWzGfXDK28sG0rJbFfnFaPhohURu9mwMJga32B5O+s9BrAnhE6vTRwveVFMYhMjp1arhjB07cbwBKPDxbO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731429; c=relaxed/simple;
	bh=BE6iCfEvSpQeaecQahBr12PQ583xoY+peR0LKYWTfeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALXuGQJTb+BKWjqsysW5kV3+AAQ4+4mShxhw5JJEoMMfqA31EG7CYrl31aG23e7EQQwOW66w/jD08jefFaH2JQ8JrnJqbPys7PuWaztCtY65p0seK/Gt8x5IAgfo22iiyE7kfGwBOt3qh0DmNz65YYfKqG28Xd67vaMEXL+KoWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtSvAtV5; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtSvAtV5"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5276511a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731427; x=1745336227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wjKFHFGgl+ccUq19hljlXknKY9MIrLWp5vcuR4YkYY=;
        b=gtSvAtV5Tkna6QyXly6XnPI9R+lhl5FzX6c1PsVaHAk8mZtuR0ZdHgtXkJAcnx1+xl
         D68c2V0SuVV8vWZg5SE0u23WPbp9W3ntENW4YKbt/9qUuAQ6bLRvPyVdbO0UQ5YhYVko
         vqP4RGlfk4mPewAwyHqB/6MBjXltwO6HI+IvNiYAvVmMIxcrZtIdlqkqiY9xlCDoz2RQ
         GPiCcSZ7PeW0BJLgMAHoqrUS4X36tIFIdOCwtu/qtaTFjqFwZ3X/WJm8xAdcJXNMFbRO
         eBq/LDt+hlaD1fD1o43KlQ+0zywyILcC5LolJT/xA+5BTFRyu0CzG3ftPpB6l/0WVB3/
         +eEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731427; x=1745336227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wjKFHFGgl+ccUq19hljlXknKY9MIrLWp5vcuR4YkYY=;
        b=S9eT1L4G4pbSjGEkwMAM4yP3xEuINJhzwx+jdLqQN99ZU2m5P9XYKNf10ZiP3IK66T
         QqpyMkzxa4UMJN0r0VlyKT9gRwV8DZqSL7NLze2uQJuOF1K6A4Nw3RNqeBgMXFdZhNZQ
         wtAt22v4z/3OAMNAtS61511Cw6aUH2qK02BKYTRjKLExvJGgjJIsVvpjl3P0Rfe9RA3w
         hRtZSYEMF/MchPxVZ0vwZ6813gSqnzPZzs7uDujrdy3VQ5AvlGZbJa/UFvuU+llU4JgH
         4aBO+Oj0fzBTlPL737vtLllPyKaVqnsuYDbrUq4rFBk38SeiljuRozkclOlEM9xRpHMg
         Nf5g==
X-Gm-Message-State: AOJu0YwkcLoI7k2uY77e0vnoGMo++8Jn5/Qz2D77PpvBIx8yE7MkkcaL
	u1k0h0jbiIszqsMfioJSqKwLZdXPsLp6ZpsTAQA+K8WHZ5TZi2RZvhwyXNbX
X-Gm-Gg: ASbGncsIrdTFBcM+lthdDjlAJ+2rPqOShieHq1AiaYcm/pUYSGh0xZewGdehL1ztni9
	Gfpqo0YqamR1PNvXy5mp+I7xTje/dVqBrjdqrGrhfRHv4kbK+hHiIzzAbVd7kryMOpU63XaMzxl
	F6KmS0VlJ8kd5tA+/MQxdcMsEe6hdWtfTqvSbofxUckDbBqvkOI5IjNICwSpXZe0PB4QMd2beJq
	ovjKqMaQq0z5N564r3KZDYowBkN8IZ4FmO5+IpI/hIcoSIOp43/7mEHWIDg1ajvA/I0TEonesV5
	jGpG7hzQAwMbqBvaT8dxS6jnva30y1Ea6hWe6xQWil6T85VBKaI=
X-Google-Smtp-Source: AGHT+IFwf6Q5iuXr+ewJJ9cHDVmT2feV8opagy2M4ZP7xuc88bPyM/k9Jy/tADoVDPK0uZnPfCZvBw==
X-Received: by 2002:a17:90b:35c5:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-308236343efmr27443251a91.11.1744731426832;
        Tue, 15 Apr 2025 08:37:06 -0700 (PDT)
Received: from VM-16-38-fedora.. ([43.135.149.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca66sm119207245ad.252.2025.04.15.08.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:37:06 -0700 (PDT)
From: alexjlzheng@gmail.com
X-Google-Original-From: alexjlzheng@tencent.com
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinliang Zheng <alexjlzheng@tencent.com>
Subject: [PATCH v2 2/2] kernfs: switch global kernfs_rename_lock to per-fs lock
Date: Tue, 15 Apr 2025 23:36:59 +0800
Message-ID: <20250415153659.14950-3-alexjlzheng@tencent.com>
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
2.49.0

