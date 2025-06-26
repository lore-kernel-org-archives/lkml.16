Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A8192B90
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923121; cv=none; b=G7AGYykLpBPqA+KDCvc2p4CqtOPE5Nz6XYZEQlYo7VAg1GORnU6HanPEhbE5j64SDUaitRadMtGVgLGEJyZceqXivjalFiPkZ1whVRvkG9awXh5zULXgQa+FWCVvXsgOSVGLVZIN9iiFo3eFOlka8KuD9Q+CXm3YTA4PvQC87Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923121; c=relaxed/simple;
	bh=4mq/AW+NWprO+KWsQMevgw/qKhu4/nbJVGPe3WtMT3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cnk+mUeO1wMpeYFGTiTQ7E4IwYc0CnnlnnNF6dCpQFurDmlP7TJ7vLABnQlAr0FTw4mvm2f5k0Za+4kpoYtb+yDYRoqFLOWKQNtih5BmIIKw2BNHSL4MpheihTXvXnJqoAxu6m0hmTQtOXwcWyImIVkqPVHO0kQFjX2tuBLB+us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=r91jb+7Q; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="r91jb+7Q"
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
	by forward200a.mail.yandex.net (Yandex) with ESMTPS id 22B2863817
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:31:51 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0d:4d14:0:640:55f0:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 4CF7D60E74;
	Thu, 26 Jun 2025 10:31:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id fVPJVTiLeeA0-PZAqQe7h;
	Thu, 26 Jun 2025 10:31:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1750923102; bh=hlEXEk772mZodmWKubrfE46Ij9OeF7m8Xp4EhPlITjQ=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=r91jb+7QCxvUjx46+Kj81NVMY78BMqanzHM1oFrAIZsDNEccHg2T7/TBWrG4++TPy
	 atjPe00FtPXUOamrGEGR+kGHbSnusXYEaqetAQqKVrAFhxCytIjlg8CBG45rVel0jX
	 NlaaefSLxPXD7JgNW1qzBJ3O6yvESZ+q1wrVvSoU=
Authentication-Results: mail-nwsmtp-smtp-production-main-67.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Carlos Llamas <cmllamas@google.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	"Tiffany Y . Yang" <ynaffit@google.com>,
	linux-kernel@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 2/2] binder: use guards for plain mutex- and spinlock-protected sections
Date: Thu, 26 Jun 2025 10:30:54 +0300
Message-ID: <20250626073054.7706-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626073054.7706-1-dmantipov@yandex.ru>
References: <20250626073054.7706-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'guard(mutex)' and 'guard(spinlock)' for plain (i.e. non-scoped)
mutex- and spinlock-protected sections, respectively, thus making
locking a bit simpler. Briefly tested with 'stress-ng --binderfs'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/android/binder.c       | 33 +++++++++++----------------------
 drivers/android/binder_alloc.c | 14 ++++----------
 drivers/android/binder_alloc.h |  8 ++------
 3 files changed, 17 insertions(+), 38 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index c463ca4a8fff..b8a6a513e9b5 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -1585,11 +1585,10 @@ static struct binder_thread *binder_get_txn_from(
 {
 	struct binder_thread *from;
 
-	spin_lock(&t->lock);
+	guard(spinlock)(&t->lock);
 	from = t->from;
 	if (from)
 		atomic_inc(&from->tmp_ref);
-	spin_unlock(&t->lock);
 	return from;
 }
 
@@ -5445,32 +5444,28 @@ static int binder_ioctl_set_ctx_mgr(struct file *filp,
 	struct binder_node *new_node;
 	kuid_t curr_euid = current_euid();
 
-	mutex_lock(&context->context_mgr_node_lock);
+	guard(mutex)(&context->context_mgr_node_lock);
 	if (context->binder_context_mgr_node) {
 		pr_err("BINDER_SET_CONTEXT_MGR already set\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 	ret = security_binder_set_context_mgr(proc->cred);
 	if (ret < 0)
-		goto out;
+		return ret;
 	if (uid_valid(context->binder_context_mgr_uid)) {
 		if (!uid_eq(context->binder_context_mgr_uid, curr_euid)) {
 			pr_err("BINDER_SET_CONTEXT_MGR bad uid %d != %d\n",
 			       from_kuid(&init_user_ns, curr_euid),
 			       from_kuid(&init_user_ns,
 					 context->binder_context_mgr_uid));
-			ret = -EPERM;
-			goto out;
+			return -EPERM;
 		}
 	} else {
 		context->binder_context_mgr_uid = curr_euid;
 	}
 	new_node = binder_new_node(proc, fbo);
-	if (!new_node) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!new_node)
+		return -ENOMEM;
 	binder_node_lock(new_node);
 	new_node->local_weak_refs++;
 	new_node->local_strong_refs++;
@@ -5479,8 +5474,6 @@ static int binder_ioctl_set_ctx_mgr(struct file *filp,
 	context->binder_context_mgr_node = new_node;
 	binder_node_unlock(new_node);
 	binder_put_node(new_node);
-out:
-	mutex_unlock(&context->context_mgr_node_lock);
 	return ret;
 }
 
@@ -6322,14 +6315,13 @@ static DECLARE_WORK(binder_deferred_work, binder_deferred_func);
 static void
 binder_defer_work(struct binder_proc *proc, enum binder_deferred_state defer)
 {
-	mutex_lock(&binder_deferred_lock);
+	guard(mutex)(&binder_deferred_lock);
 	proc->deferred_work |= defer;
 	if (hlist_unhashed(&proc->deferred_work_node)) {
 		hlist_add_head(&proc->deferred_work_node,
 				&binder_deferred_list);
 		schedule_work(&binder_deferred_work);
 	}
-	mutex_unlock(&binder_deferred_lock);
 }
 
 static void print_binder_transaction_ilocked(struct seq_file *m,
@@ -6871,14 +6863,13 @@ static int proc_show(struct seq_file *m, void *unused)
 	struct binder_proc *itr;
 	int pid = (unsigned long)m->private;
 
-	mutex_lock(&binder_procs_lock);
+	guard(mutex)(&binder_procs_lock);
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
 		if (itr->pid == pid) {
 			seq_puts(m, "binder proc state:\n");
 			print_binder_proc(m, itr, true, false);
 		}
 	}
-	mutex_unlock(&binder_procs_lock);
 
 	return 0;
 }
@@ -6996,16 +6987,14 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
 
 void binder_add_device(struct binder_device *device)
 {
-	spin_lock(&binder_devices_lock);
+	guard(spinlock)(&binder_devices_lock);
 	hlist_add_head(&device->hlist, &binder_devices);
-	spin_unlock(&binder_devices_lock);
 }
 
 void binder_remove_device(struct binder_device *device)
 {
-	spin_lock(&binder_devices_lock);
+	guard(spinlock)(&binder_devices_lock);
 	hlist_del_init(&device->hlist);
-	spin_unlock(&binder_devices_lock);
 }
 
 static int __init init_binder_device(const char *name)
diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index fcfaf1b899c8..a0a7cb58fc05 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -167,12 +167,8 @@ static struct binder_buffer *binder_alloc_prepare_to_free_locked(
 struct binder_buffer *binder_alloc_prepare_to_free(struct binder_alloc *alloc,
 						   unsigned long user_ptr)
 {
-	struct binder_buffer *buffer;
-
-	mutex_lock(&alloc->mutex);
-	buffer = binder_alloc_prepare_to_free_locked(alloc, user_ptr);
-	mutex_unlock(&alloc->mutex);
-	return buffer;
+	guard(mutex)(&alloc->mutex);
+	return binder_alloc_prepare_to_free_locked(alloc, user_ptr);
 }
 
 static inline void
@@ -1043,7 +1039,7 @@ void binder_alloc_print_allocated(struct seq_file *m,
 	struct binder_buffer *buffer;
 	struct rb_node *n;
 
-	mutex_lock(&alloc->mutex);
+	guard(mutex)(&alloc->mutex);
 	for (n = rb_first(&alloc->allocated_buffers); n; n = rb_next(n)) {
 		buffer = rb_entry(n, struct binder_buffer, rb_node);
 		seq_printf(m, "  buffer %d: %lx size %zd:%zd:%zd %s\n",
@@ -1053,7 +1049,6 @@ void binder_alloc_print_allocated(struct seq_file *m,
 			   buffer->extra_buffers_size,
 			   buffer->transaction ? "active" : "delivered");
 	}
-	mutex_unlock(&alloc->mutex);
 }
 
 /**
@@ -1102,10 +1097,9 @@ int binder_alloc_get_allocated_count(struct binder_alloc *alloc)
 	struct rb_node *n;
 	int count = 0;
 
-	mutex_lock(&alloc->mutex);
+	guard(mutex)(&alloc->mutex);
 	for (n = rb_first(&alloc->allocated_buffers); n != NULL; n = rb_next(n))
 		count++;
-	mutex_unlock(&alloc->mutex);
 	return count;
 }
 
diff --git a/drivers/android/binder_alloc.h b/drivers/android/binder_alloc.h
index feecd7414241..a9d5f3169e12 100644
--- a/drivers/android/binder_alloc.h
+++ b/drivers/android/binder_alloc.h
@@ -160,12 +160,8 @@ void binder_alloc_print_pages(struct seq_file *m,
 static inline size_t
 binder_alloc_get_free_async_space(struct binder_alloc *alloc)
 {
-	size_t free_async_space;
-
-	mutex_lock(&alloc->mutex);
-	free_async_space = alloc->free_async_space;
-	mutex_unlock(&alloc->mutex);
-	return free_async_space;
+	guard(mutex)(&alloc->mutex);
+	return alloc->free_async_space;
 }
 
 unsigned long
-- 
2.50.0

