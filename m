Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4CC1F130A
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 01:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746840980; cv=none; b=oOxZ74b8wsm3nuoTnUF91ZJQ39scHWFRGlxOX0FNXhA7CMs2JUuxhbEUvfnKJbuGwDxlNimhNWn6gJLmICknueXv5ixmC4y6sz87FOeRJTdnuv975IDfPPLqGuZsYwMyC9/V5L261bi7TQzdXcEJ/W4bF+fKFC0RBlIspM11cOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746840980; c=relaxed/simple;
	bh=MvHhOYzuPXE+ZAiylgjvQQRw1fFDajZqjqZFHpCyDJg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=caKb4l9/HhclsvgoFUJ4SnC2jl//hHBMozgB184GJtOHQCsZkqQOJvS7JRuodAjZi29E4NRTR0IRvO2kESyxrEMIMTxGsYfVZonV2vxAuQqBtPJznLv+p0SUIh5Ke3goJSMPag9B11hX+lykhzDdZZRl/U6OnkzqYPHa3jDOnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RkvWTFy/; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RkvWTFy/"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e45821fd7so25070325ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 18:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746840978; x=1747445778; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0owO96VxXnEIdL3Ktl+9Izc5OSRQuzJp2JR2ysvq8MA=;
        b=RkvWTFy/ylPJW+3teZZAw5/8RHAd3bH2zNGZ1BaU9dlFlJQtubcizdKgOlrcjcaKDL
         N2ZdjjmTjdp4Q6YMV8hMOQ5MwGm5GgQZ19z5CFy9I0jzj/ewYfEumva6KMD8lxm4yiUW
         hYX/25DV1EKoIkcZN0EbYh8zqE0Vw5rKFwU4GwxEXQFeVQL9M6aecKmcvI4vqvoHghHJ
         kGTKkQBmkNgyHiGPYvzfARDA2KmMhtR6rcHPkn0QtoRxzyhtb3j1c2rQ4jLBl0VUTFIh
         aN71Hd5S1NDySIlF14fZY3hN8oGvxCEg+rKiNXapJaBkY3y8BbvGe8os7/iwhNXqXVxb
         tpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746840978; x=1747445778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0owO96VxXnEIdL3Ktl+9Izc5OSRQuzJp2JR2ysvq8MA=;
        b=UO5AXKt342SiWWnqYgU8aMZYo8f/AYJzacu9aJmpL5qQbfGGuMKfBYfrRKYYLAqRQd
         qZcwJUUfxwtvY2KDHfHe7cyQtoR/Hhz/PNpne5iAnReoUPrpnesv+dbMQXJORr+yZeuu
         FZ+7iwB972O8UTt67cyX4esWZrJ6UApLMZaDpkYG5shQAMC5UWzBGpyEHYROTLTtLQxK
         hHp135g6O0WTok16ShTZuCmdNtpaHMkpdS+WnM+CYMcj5OavHNrwXdTIcPzZ6x5TQ5qX
         7zQ7+aUj8P8s47LvYizw0rVeJ7ZquihJLndsIUGek4XSdb19BXuxmhO/VkDofHmG6Vnz
         wTxw==
X-Gm-Message-State: AOJu0YxlkxRVGZmErFS+8ka0gMLO/aUzrbXf/m3iaLHptUOkFdf9mHeq
	30tn5w3HjG7h9zpGNIM+RECSm0vM0Cp9oRncIorw2DfzGaJZdDuGGYke+HkfJJzwbFFkS65nxMH
	msiWmfg==
X-Google-Smtp-Source: AGHT+IFmqClNvE3KxKNn8qSTh1J4f/zKXn6Hrece7vxaye/d2GcDpOzKmPLlxA2ffl8xLhqvA0I8kcWWo0mu
X-Received: from pllb9.prod.google.com ([2002:a17:902:e949:b0:22d:a5a9:8117])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:990:b0:22e:485a:b45
 with SMTP id d9443c01a7336-22fc918d07emr81853875ad.46.1746840977979; Fri, 09
 May 2025 18:36:17 -0700 (PDT)
Date: Sat, 10 May 2025 01:34:40 +0000
In-Reply-To: <20250510013435.1520671-5-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250510013435.1520671-5-ynaffit@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250510013435.1520671-7-ynaffit@google.com>
Subject: [PATCH v4 2/2] binder: Create safe versions of binder log files
From: "Tiffany Y. Yang" <ynaffit@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Binder defines several seq_files that can be accessed via debugfs or
binderfs. Some of these files (e.g., 'state' and 'transactions')
contain more granular information about binder's internal state that
is helpful for debugging, but they also leak userspace address data
through user-defined 'cookie' or 'ptr' values. Consequently, access
to these files must be heavily restricted.

Add two new files, 'state_hashed' and 'transactions_hashed', that
reproduce the information in the original files but use the kernel's
raw pointer obfuscation to hash any potential user addresses. This
approach allows systems to grant broader access to the new files
without having to change the security policy around the existing ones.

In practice, userspace populates these fields with user addresses, but
within the driver, these values only serve as unique identifiers for
their associated binder objects. Consequently, binder logs can
obfuscate these values and still retain meaning. While this strategy
prevents leaking information about the userspace memory layout in the
existing log files, it also decouples log messages about binder
objects from their user-defined identifiers.

Acked-by: Carlos Llamas <cmllamas@google.com>
Tested-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
---
v2:
* Update commit message
* Add acked-by tag
v3:
* Cast binder_uintptr_t to long before casting to ptr
v4:
* Add tested-by tag

---
 drivers/android/binder.c | 106 +++++++++++++++++++++++++++++----------
 1 file changed, 79 insertions(+), 27 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8e4912643749..c9c4193fad99 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6380,7 +6380,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
 				      struct binder_proc *proc,
 				      const char *prefix,
 				      const char *transaction_prefix,
-				      struct binder_work *w)
+				      struct binder_work *w, bool hash_ptrs)
 {
 	struct binder_node *node;
 	struct binder_transaction *t;
@@ -6403,9 +6403,15 @@ static void print_binder_work_ilocked(struct seq_file *m,
 		break;
 	case BINDER_WORK_NODE:
 		node = container_of(w, struct binder_node, work);
-		seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
-			   prefix, node->debug_id,
-			   (u64)node->ptr, (u64)node->cookie);
+		if (hash_ptrs)
+			seq_printf(m, "%snode work %d: u%p c%p\n",
+				   prefix, node->debug_id,
+				   (void *)(long)node->ptr,
+				   (void *)(long)node->cookie);
+		else
+			seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
+				   prefix, node->debug_id,
+				   (u64)node->ptr, (u64)node->cookie);
 		break;
 	case BINDER_WORK_DEAD_BINDER:
 		seq_printf(m, "%shas dead binder\n", prefix);
@@ -6430,7 +6436,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
 
 static void print_binder_thread_ilocked(struct seq_file *m,
 					struct binder_thread *thread,
-					bool print_always)
+					bool print_always, bool hash_ptrs)
 {
 	struct binder_transaction *t;
 	struct binder_work *w;
@@ -6460,14 +6466,16 @@ static void print_binder_thread_ilocked(struct seq_file *m,
 	}
 	list_for_each_entry(w, &thread->todo, entry) {
 		print_binder_work_ilocked(m, thread->proc, "    ",
-					  "    pending transaction", w);
+					  "    pending transaction",
+					  w, hash_ptrs);
 	}
 	if (!print_always && m->count == header_pos)
 		m->count = start_pos;
 }
 
 static void print_binder_node_nilocked(struct seq_file *m,
-				       struct binder_node *node)
+				       struct binder_node *node,
+				       bool hash_ptrs)
 {
 	struct binder_ref *ref;
 	struct binder_work *w;
@@ -6475,8 +6483,13 @@ static void print_binder_node_nilocked(struct seq_file *m,
 
 	count = hlist_count_nodes(&node->refs);
 
-	seq_printf(m, "  node %d: u%016llx c%016llx hs %d hw %d ls %d lw %d is %d iw %d tr %d",
-		   node->debug_id, (u64)node->ptr, (u64)node->cookie,
+	if (hash_ptrs)
+		seq_printf(m, "  node %d: u%p c%p", node->debug_id,
+			   (void *)(long)node->ptr, (void *)(long)node->cookie);
+	else
+		seq_printf(m, "  node %d: u%016llx c%016llx", node->debug_id,
+			   (u64)node->ptr, (u64)node->cookie);
+	seq_printf(m, " hs %d hw %d ls %d lw %d is %d iw %d tr %d",
 		   node->has_strong_ref, node->has_weak_ref,
 		   node->local_strong_refs, node->local_weak_refs,
 		   node->internal_strong_refs, count, node->tmp_refs);
@@ -6489,7 +6502,8 @@ static void print_binder_node_nilocked(struct seq_file *m,
 	if (node->proc) {
 		list_for_each_entry(w, &node->async_todo, entry)
 			print_binder_work_ilocked(m, node->proc, "    ",
-					  "    pending async transaction", w);
+					  "    pending async transaction",
+					  w, hash_ptrs);
 	}
 }
 
@@ -6511,6 +6525,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
  * @proc:       struct binder_proc we hold the inner_proc_lock to (if any)
  * @node:       struct binder_node to print fields of
  * @prev_node:	struct binder_node we hold a temporary reference to (if any)
+ * @hash_ptrs:  whether to hash @node's binder_uintptr_t fields
  *
  * Helper function to handle synchronization around printing a struct
  * binder_node while iterating through @proc->nodes or the dead nodes list.
@@ -6523,7 +6538,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
 static struct binder_node *
 print_next_binder_node_ilocked(struct seq_file *m, struct binder_proc *proc,
 			       struct binder_node *node,
-			       struct binder_node *prev_node)
+			       struct binder_node *prev_node, bool hash_ptrs)
 {
 	/*
 	 * Take a temporary reference on the node so that isn't freed while
@@ -6541,7 +6556,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_proc *proc,
 	if (prev_node)
 		binder_put_node(prev_node);
 	binder_node_inner_lock(node);
-	print_binder_node_nilocked(m, node);
+	print_binder_node_nilocked(m, node, hash_ptrs);
 	binder_node_inner_unlock(node);
 	if (proc)
 		binder_inner_proc_lock(proc);
@@ -6551,7 +6566,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_proc *proc,
 }
 
 static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
-			      bool print_all)
+			      bool print_all, bool hash_ptrs)
 {
 	struct binder_work *w;
 	struct rb_node *n;
@@ -6566,7 +6581,7 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 	binder_inner_proc_lock(proc);
 	for (n = rb_first(&proc->threads); n; n = rb_next(n))
 		print_binder_thread_ilocked(m, rb_entry(n, struct binder_thread,
-						rb_node), print_all);
+						rb_node), print_all, hash_ptrs);
 
 	for (n = rb_first(&proc->nodes); n; n = rb_next(n)) {
 		struct binder_node *node = rb_entry(n, struct binder_node,
@@ -6575,7 +6590,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 			continue;
 
 		last_node = print_next_binder_node_ilocked(m, proc, node,
-							   last_node);
+							   last_node,
+							   hash_ptrs);
 	}
 	binder_inner_proc_unlock(proc);
 	if (last_node)
@@ -6593,7 +6609,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 	binder_inner_proc_lock(proc);
 	list_for_each_entry(w, &proc->todo, entry)
 		print_binder_work_ilocked(m, proc, "  ",
-					  "  pending transaction", w);
+					  "  pending transaction", w,
+					  hash_ptrs);
 	list_for_each_entry(w, &proc->delivered_death, entry) {
 		seq_puts(m, "  has delivered dead binder\n");
 		break;
@@ -6775,7 +6792,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	print_binder_stats(m, "  ", &proc->stats);
 }
 
-static int state_show(struct seq_file *m, void *unused)
+static void print_binder_state(struct seq_file *m, bool hash_ptrs)
 {
 	struct binder_proc *proc;
 	struct binder_node *node;
@@ -6788,16 +6805,38 @@ static int state_show(struct seq_file *m, void *unused)
 		seq_puts(m, "dead nodes:\n");
 	hlist_for_each_entry(node, &binder_dead_nodes, dead_node)
 		last_node = print_next_binder_node_ilocked(m, NULL, node,
-							   last_node);
+							   last_node,
+							   hash_ptrs);
 	spin_unlock(&binder_dead_nodes_lock);
 	if (last_node)
 		binder_put_node(last_node);
 
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(proc, &binder_procs, proc_node)
-		print_binder_proc(m, proc, true);
+		print_binder_proc(m, proc, true, hash_ptrs);
 	mutex_unlock(&binder_procs_lock);
+}
+
+static void print_binder_transactions(struct seq_file *m, bool hash_ptrs)
+{
+	struct binder_proc *proc;
+
+	seq_puts(m, "binder transactions:\n");
+	mutex_lock(&binder_procs_lock);
+	hlist_for_each_entry(proc, &binder_procs, proc_node)
+		print_binder_proc(m, proc, false, hash_ptrs);
+	mutex_unlock(&binder_procs_lock);
+}
+
+static int state_show(struct seq_file *m, void *unused)
+{
+	print_binder_state(m, false);
+	return 0;
+}
 
+static int state_hashed_show(struct seq_file *m, void *unused)
+{
+	print_binder_state(m, true);
 	return 0;
 }
 
@@ -6819,14 +6858,13 @@ static int stats_show(struct seq_file *m, void *unused)
 
 static int transactions_show(struct seq_file *m, void *unused)
 {
-	struct binder_proc *proc;
-
-	seq_puts(m, "binder transactions:\n");
-	mutex_lock(&binder_procs_lock);
-	hlist_for_each_entry(proc, &binder_procs, proc_node)
-		print_binder_proc(m, proc, false);
-	mutex_unlock(&binder_procs_lock);
+	print_binder_transactions(m, false);
+	return 0;
+}
 
+static int transactions_hashed_show(struct seq_file *m, void *unused)
+{
+	print_binder_transactions(m, true);
 	return 0;
 }
 
@@ -6839,7 +6877,7 @@ static int proc_show(struct seq_file *m, void *unused)
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
 		if (itr->pid == pid) {
 			seq_puts(m, "binder proc state:\n");
-			print_binder_proc(m, itr, true);
+			print_binder_proc(m, itr, true, false);
 		}
 	}
 	mutex_unlock(&binder_procs_lock);
@@ -6906,8 +6944,10 @@ const struct file_operations binder_fops = {
 };
 
 DEFINE_SHOW_ATTRIBUTE(state);
+DEFINE_SHOW_ATTRIBUTE(state_hashed);
 DEFINE_SHOW_ATTRIBUTE(stats);
 DEFINE_SHOW_ATTRIBUTE(transactions);
+DEFINE_SHOW_ATTRIBUTE(transactions_hashed);
 DEFINE_SHOW_ATTRIBUTE(transaction_log);
 
 const struct binder_debugfs_entry binder_debugfs_entries[] = {
@@ -6917,6 +6957,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
 		.fops = &state_fops,
 		.data = NULL,
 	},
+	{
+		.name = "state_hashed",
+		.mode = 0444,
+		.fops = &state_hashed_fops,
+		.data = NULL,
+	},
 	{
 		.name = "stats",
 		.mode = 0444,
@@ -6929,6 +6975,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
 		.fops = &transactions_fops,
 		.data = NULL,
 	},
+	{
+		.name = "transactions_hashed",
+		.mode = 0444,
+		.fops = &transactions_hashed_fops,
+		.data = NULL,
+	},
 	{
 		.name = "transaction_log",
 		.mode = 0444,
-- 
2.49.0.1045.g170613ef41-goog

