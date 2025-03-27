Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0691DE883
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743112988; cv=none; b=L5xZ99vezpRUPpwzW5J5lD2Mn0/Ji9CQQx1y1Nygszq5Hb44Ab6c839Ytq5ysX95KuPyFLsb90JJeocYlKd25PYLKMqo9lDGRyVbOUIQtmTMQ5emQ7RLWPgH9Qd6Gaxxu/w6IJWKdGgs09kxuSNaUsBku3O3Ioednq8A/e3efvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743112988; c=relaxed/simple;
	bh=7NdSChUBt6JLNhn+1jqoPv22V3UB1j3ZYs4AyfW8BW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=je72brXKgy4Z9ajvR2YAunB1bKTbEehnXjlIQB3K9xLJBBXwmkbUZvVsYRU8Tp+zEOPoO9YqYdvuJlXlZSqrvpezIqjvBfQQJyYA9WVyXXR8kCcThJ6TDYvIY5jMUWP7aOsRbgF8u/VlFuekHd2K5QhcNcy7WQnhk9+V1uZpsVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RhicTBmE; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RhicTBmE"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ade807fso46526785ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743112986; x=1743717786; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvJeJXM/jt4eBfUb/mskzz0FovkIRZRurkOqLDgP9tU=;
        b=RhicTBmELvNqkfa3rucYXpn/NzvSTKshj5d+GMLZ1M/dWO4RmYnZxnBtfPXZjme2hi
         +S/Mzx/04o133JPs7CmA3pKruKHwGnNO940kFcBTHxapp4yJnWpAIjgN+gpPqfyacnRN
         PcUY3QDo4csFAMu2juz6v0CCfzb4evFIhzabf40nZO7tiChsYH30UqNnud28t2vedyz5
         4RT0Hp1Sxp1bEpeXh8M2mB9CkCrV4H/IV6YUozmCepVmsn3xj2D1TrD4rZGQWlTfgWKs
         ygGl8V+D4f5VpwNYCOvu99lNvE+K4rvC28F2wVDjwcQG3xjryMCTbvlQX/DMtIrIcc1l
         T6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743112986; x=1743717786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvJeJXM/jt4eBfUb/mskzz0FovkIRZRurkOqLDgP9tU=;
        b=fgoFcL9NJ9OrvMoG2p2+u4mvQU5l9mh2aBenog8K/UuCscJRwwPa1CRFlsOrJ8AmFG
         4S537HpnjEr/6uhs7jDAlMN9IShiqcGDsU+BpZEVacFYu47NDHjIoaYK1/71MjbvDMQp
         aiyJx66X81xGklEDbRqKlKQDSDODXCUerBW9fpel0EZSQRqi5B/1jmbjC6KRleOC9upT
         BXwt4p2UtExa65u4ZyU9p7r+p8nRRGp/Uct3kHon/Z2NsnfiBDvpfSwNu0ZlGiB4rDyq
         jT1naWZTw3298/nuG+2KrHXO90C/B9cK/CLUmlRqO902SPFidmn2xtvr+YodwZzlweEt
         +RQA==
X-Gm-Message-State: AOJu0YwiYXJDMhpHtrHwB8uptBcCFUz+XChJ/ASi4bqVguqTe5JKhFf7
	WpNCvSBhuNZoUQXnhasZKwxc2RAl+aDEVfmLuacKmFc5ZhA6VljRQwVMirOXczgUPjpEJGbjOWj
	jEDroyQ==
X-Google-Smtp-Source: AGHT+IEbteaxepAGdUZunWjMXDF7DTMFinpnucJtx3COoLoz7agV8ylbHv8HnAXcDCFuFrfroPqGN5nm0oaF
X-Received: from plhu17.prod.google.com ([2002:a17:903:1251:b0:223:58e2:570d])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c6:b0:223:52fc:a15a
 with SMTP id d9443c01a7336-228048c655fmr59134705ad.33.1743112985842; Thu, 27
 Mar 2025 15:03:05 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:02:26 +0000
In-Reply-To: <20250327220225.3180998-3-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250327220225.3180998-3-ynaffit@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250327220225.3180998-4-ynaffit@google.com>
Subject: [PATCH 2/2] binder: Create safe versions of binder log files
From: "Tiffany Y. Yang" <ynaffit@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	"Tiffany Y. Yang" <ynaffit@google.com>
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

Use the kernel's raw pointer obfuscation to hash these values before
they are output to the existing binder seq_files. Additionally, create
a new binder log file, 'ptr_translations', to allow privileged users
to access the map between the original values and their hashes.

Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
---
 drivers/android/binder.c | 103 +++++++++++++++++++++++++++++----------
 1 file changed, 77 insertions(+), 26 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index d963a7860aa3..a9e433ad12a7 100644
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
@@ -6403,9 +6403,14 @@ static void print_binder_work_ilocked(struct seq_file *m,
 		break;
 	case BINDER_WORK_NODE:
 		node = container_of(w, struct binder_node, work);
-		seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
+		if (hash_ptrs)
+			seq_printf(m, "%snode work %d: u%p c%p\n",
 			   prefix, node->debug_id,
-			   (u64)node->ptr, (u64)node->cookie);
+			   (void *)node->ptr, (void *)node->cookie);
+		else
+			seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
+				   prefix, node->debug_id,
+				   (u64)node->ptr, (u64)node->cookie);
 		break;
 	case BINDER_WORK_DEAD_BINDER:
 		seq_printf(m, "%shas dead binder\n", prefix);
@@ -6430,7 +6435,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
 
 static void print_binder_thread_ilocked(struct seq_file *m,
 					struct binder_thread *thread,
-					bool print_always)
+					bool print_always, bool hash_ptrs)
 {
 	struct binder_transaction *t;
 	struct binder_work *w;
@@ -6460,14 +6465,16 @@ static void print_binder_thread_ilocked(struct seq_file *m,
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
@@ -6475,8 +6482,13 @@ static void print_binder_node_nilocked(struct seq_file *m,
 
 	count = hlist_count_nodes(&node->refs);
 
-	seq_printf(m, "  node %d: u%016llx c%016llx hs %d hw %d ls %d lw %d is %d iw %d tr %d",
-		   node->debug_id, (u64)node->ptr, (u64)node->cookie,
+	if (hash_ptrs)
+		seq_printf(m, "  node %d: u%p c%p", node->debug_id,
+			   (void *)node->ptr, (void *)node->cookie);
+	else
+		seq_printf(m, "  node %d: u%016llx c%016llx", node->debug_id,
+			   (u64)node->ptr, (u64)node->cookie);
+	seq_printf(m, " hs %d hw %d ls %d lw %d is %d iw %d tr %d",
 		   node->has_strong_ref, node->has_weak_ref,
 		   node->local_strong_refs, node->local_weak_refs,
 		   node->internal_strong_refs, count, node->tmp_refs);
@@ -6489,7 +6501,8 @@ static void print_binder_node_nilocked(struct seq_file *m,
 	if (node->proc) {
 		list_for_each_entry(w, &node->async_todo, entry)
 			print_binder_work_ilocked(m, node->proc, "    ",
-					  "    pending async transaction", w);
+					  "    pending async transaction",
+					  w, hash_ptrs);
 	}
 }
 
@@ -6510,6 +6523,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
  * @m:          struct seq_file for output via seq_printf()
  * @node:       struct binder_node to print fields of
  * @prev_node:	struct binder_node we hold a temporary reference to (if any)
+ * @hash_ptrs:  whether to hash @node's binder_uintptr_t fields
  *
  * Helper function to handle synchronization around printing a struct
  * binder_node while iterating through @node->proc->nodes or the dead nodes
@@ -6520,7 +6534,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
  */
 static struct binder_node *
 print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
-			       struct binder_node *prev_node)
+			       struct binder_node *prev_node, bool hash_ptrs)
 {
 	/*
 	 * Take a temporary reference on the node so that isn't removed from
@@ -6538,7 +6552,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
 	if (prev_node)
 		binder_put_node(prev_node);
 	binder_node_inner_lock(node);
-	print_binder_node_nilocked(m, node);
+	print_binder_node_nilocked(m, node, hash_ptrs);
 	binder_node_inner_unlock(node);
 	if (node->proc)
 		binder_inner_proc_lock(node->proc);
@@ -6548,7 +6562,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
 }
 
 static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
-			      bool print_all)
+			      bool print_all, bool hash_ptrs)
 {
 	struct binder_work *w;
 	struct rb_node *n;
@@ -6563,7 +6577,7 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 	binder_inner_proc_lock(proc);
 	for (n = rb_first(&proc->threads); n; n = rb_next(n))
 		print_binder_thread_ilocked(m, rb_entry(n, struct binder_thread,
-						rb_node), print_all);
+						rb_node), print_all, hash_ptrs);
 
 	for (n = rb_first(&proc->nodes); n; n = rb_next(n)) {
 		struct binder_node *node = rb_entry(n, struct binder_node,
@@ -6571,7 +6585,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 		if (!print_all && !node->has_async_transaction)
 			continue;
 
-		last_node = print_next_binder_node_ilocked(m, node, last_node);
+		last_node = print_next_binder_node_ilocked(m, node, last_node,
+							   hash_ptrs);
 	}
 	binder_inner_proc_unlock(proc);
 	if (last_node)
@@ -6589,7 +6604,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 	binder_inner_proc_lock(proc);
 	list_for_each_entry(w, &proc->todo, entry)
 		print_binder_work_ilocked(m, proc, "  ",
-					  "  pending transaction", w);
+					  "  pending transaction", w,
+					  hash_ptrs);
 	list_for_each_entry(w, &proc->delivered_death, entry) {
 		seq_puts(m, "  has delivered dead binder\n");
 		break;
@@ -6771,7 +6787,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	print_binder_stats(m, "  ", &proc->stats);
 }
 
-static int state_show(struct seq_file *m, void *unused)
+static void print_binder_state(struct seq_file *m, bool hash_ptrs)
 {
 	struct binder_proc *proc;
 	struct binder_node *node;
@@ -6783,16 +6799,38 @@ static int state_show(struct seq_file *m, void *unused)
 	if (!hlist_empty(&binder_dead_nodes))
 		seq_puts(m, "dead nodes:\n");
 	hlist_for_each_entry(node, &binder_dead_nodes, dead_node)
-		last_node = print_next_binder_node_ilocked(m, node, last_node);
+		last_node = print_next_binder_node_ilocked(m, node, last_node,
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
 
@@ -6814,14 +6852,13 @@ static int stats_show(struct seq_file *m, void *unused)
 
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
 
@@ -6834,7 +6871,7 @@ static int proc_show(struct seq_file *m, void *unused)
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
 		if (itr->pid == pid) {
 			seq_puts(m, "binder proc state:\n");
-			print_binder_proc(m, itr, true);
+			print_binder_proc(m, itr, true, false);
 		}
 	}
 	mutex_unlock(&binder_procs_lock);
@@ -6901,8 +6938,10 @@ const struct file_operations binder_fops = {
 };
 
 DEFINE_SHOW_ATTRIBUTE(state);
+DEFINE_SHOW_ATTRIBUTE(state_hashed);
 DEFINE_SHOW_ATTRIBUTE(stats);
 DEFINE_SHOW_ATTRIBUTE(transactions);
+DEFINE_SHOW_ATTRIBUTE(transactions_hashed);
 DEFINE_SHOW_ATTRIBUTE(transaction_log);
 
 const struct binder_debugfs_entry binder_debugfs_entries[] = {
@@ -6912,6 +6951,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
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
@@ -6924,6 +6969,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
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
2.49.0.395.g12beb8f557-goog

