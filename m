Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8A28FFFD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652227; cv=none; b=fLu8rS/0IYa2ac/FKlERaJr4MCiElCjuQWtbzXjQqaPS1h5/Bs991hityv9IguaXjPmjHNcjEpqEaT8O9Z4WfGQ0PkWW7wGaVQVgK4h1gfS5RDcbVV4NHwaFxdSTzyjdISqk24rmGi7aFKfP6mIlNN6ShqN3sCmFSIefmURv42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652227; c=relaxed/simple;
	bh=mudg1S08WtbXpt3bBhQd16BpjFM5MzfMdIXtOllRjmg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dmCZptU/8bIwQiUdE2193J5vzUyJHXB583XN32D7rwaiZ35x+UCHg3pkhoc71D/BOtDOz6F+JE+loNrKOreyF4H5s1iVZSDlL3RuxH80FXHULdCvvydCVxvvcxaD1408pBwljX3ViRnANzgi4ct9vllySFq3p1zR5pCGJ7VW3oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HmUNGwYc; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HmUNGwYc"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e7343c777so2616785ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746652225; x=1747257025; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8kVWY/Nymcc5Mi21meIhjAtxrGO1+LJjfuVy5Y4z4RY=;
        b=HmUNGwYcbjy0Zet2XVqWE7E3mKCehisk8S2QvBwRQWRgYatakA6dAwoCgDaFlI7ZLM
         eyf9l1qLnLHeA0b9VjR9R0OU717sKh+sBKfv9galAhzfo2QRvRsNfKEsZFQIal1z873Y
         83sjCQCjEqSYo7eZdv89/l9FY+Y8jAUl9SbGC8SW3fubbVxRP0KVX6IU/K3VdA/sdhF+
         JkTrLYsSSg1rlDGwrKSQt41aFn7ZJiRBgknQLBulRYT8u4xnPrGBz++jWXJRWe+jzfG3
         kQw6FcVhC7BXsGgkJVx9INoa0rY+LpBN9vO/348w76jV7iq8opecY2x0GuOPfyWys4P/
         ShGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746652225; x=1747257025;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kVWY/Nymcc5Mi21meIhjAtxrGO1+LJjfuVy5Y4z4RY=;
        b=SFcdd4iyXoWXSjvm39C9cGT+fgsWUY1GR3dxQLLtDA1vFVj8dx5//u7lIs9s4qkMmE
         y1KaRpmIiGtrSyXHR9DbOYec9Aj3cvTYnJor+yNKUCuD97kGHuRDCNgms5dApSoY9KST
         HSEnIu9v1xndwUsc/siSxu8I8M3tO6Dt9a/c8U7/YK8LrTCjMvbAwkU9T4yo+yqSh+Qd
         EwKJyeSPyDi3sWB4uQ1Pohr5w9Y5t4TFT/EF8BxwhD7Maut0GUDeADzB86emyDkzGCE8
         Ajbp3TQu5vmI+AhJwckLtBONXNEF5zGK5QRKJmNDFUU93Q1L+l/GEBOrZx4P5uzAT46v
         0N5g==
X-Gm-Message-State: AOJu0YykUCHB+mQTlxwSiKRZlKylRDEWBCNCc9FMuUpEhJ6/QD+zN2D3
	cKvkkkzho8wVZpxM0IaEXIZZEbFhbvoxi2Qu2CMUABoD4Opf3SmKqcc2cUdkCgVWwVVzowm4XLD
	5IyrRBQ==
X-Google-Smtp-Source: AGHT+IE6i+G7XeAWyyrmAhumr4SLznZ8NngvskzIvptC6BQRErvKAzQZFi3uaUTvwh5bjbQ7DNVFXJwxoQaU
X-Received: from plbkz11.prod.google.com ([2002:a17:902:f9cb:b0:22d:e49c:3cb])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50b:b0:225:abd2:5e39
 with SMTP id d9443c01a7336-22e5ea75caamr65137815ad.30.1746652224731; Wed, 07
 May 2025 14:10:24 -0700 (PDT)
Date: Wed,  7 May 2025 21:10:06 +0000
In-Reply-To: <20250507211005.449435-3-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507211005.449435-3-ynaffit@google.com>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507211005.449435-4-ynaffit@google.com>
Subject: [PATCH v3 2/2] binder: Create safe versions of binder log files
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

Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
---
---
V2->V3: Cast binder_uintptr_t to long before casting to ptr
V1->V2: Update commit message

 drivers/android/binder.c | 106 +++++++++++++++++++++++++++++----------
 1 file changed, 79 insertions(+), 27 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 960d055c27d5..5578e72f435b 100644
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
 
@@ -6510,6 +6524,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
  * @m:          struct seq_file for output via seq_printf()
  * @node:       struct binder_node to print fields of
  * @prev_node:	struct binder_node we hold a temporary reference to (if any)
+ * @hash_ptrs:  whether to hash @node's binder_uintptr_t fields
  *
  * Helper function to handle synchronization around printing a struct
  * binder_node while iterating through @node->proc->nodes or the dead nodes
@@ -6521,7 +6536,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
  */
 static struct binder_node *
 print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
-			       struct binder_node *prev_node)
+			       struct binder_node *prev_node, bool hash_ptrs)
 {
 	/*
 	 * Take a temporary reference on the node so that isn't removed from
@@ -6539,7 +6554,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
 	if (prev_node)
 		binder_put_node(prev_node);
 	binder_node_inner_lock(node);
-	print_binder_node_nilocked(m, node);
+	print_binder_node_nilocked(m, node, hash_ptrs);
 	binder_node_inner_unlock(node);
 	if (node->proc)
 		binder_inner_proc_lock(node->proc);
@@ -6549,7 +6564,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
 }
 
 static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
-			      bool print_all)
+			      bool print_all, bool hash_ptrs)
 {
 	struct binder_work *w;
 	struct rb_node *n;
@@ -6564,7 +6579,7 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 	binder_inner_proc_lock(proc);
 	for (n = rb_first(&proc->threads); n; n = rb_next(n))
 		print_binder_thread_ilocked(m, rb_entry(n, struct binder_thread,
-						rb_node), print_all);
+						rb_node), print_all, hash_ptrs);
 
 	for (n = rb_first(&proc->nodes); n; n = rb_next(n)) {
 		struct binder_node *node = rb_entry(n, struct binder_node,
@@ -6572,7 +6587,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 		if (!print_all && !node->has_async_transaction)
 			continue;
 
-		last_node = print_next_binder_node_ilocked(m, node, last_node);
+		last_node = print_next_binder_node_ilocked(m, node, last_node,
+							   hash_ptrs);
 	}
 	binder_inner_proc_unlock(proc);
 	if (last_node)
@@ -6590,7 +6606,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
 	binder_inner_proc_lock(proc);
 	list_for_each_entry(w, &proc->todo, entry)
 		print_binder_work_ilocked(m, proc, "  ",
-					  "  pending transaction", w);
+					  "  pending transaction", w,
+					  hash_ptrs);
 	list_for_each_entry(w, &proc->delivered_death, entry) {
 		seq_puts(m, "  has delivered dead binder\n");
 		break;
@@ -6772,7 +6789,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	print_binder_stats(m, "  ", &proc->stats);
 }
 
-static int state_show(struct seq_file *m, void *unused)
+static void print_binder_state(struct seq_file *m, bool hash_ptrs)
 {
 	struct binder_proc *proc;
 	struct binder_node *node;
@@ -6784,16 +6801,38 @@ static int state_show(struct seq_file *m, void *unused)
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
 
@@ -6815,14 +6854,13 @@ static int stats_show(struct seq_file *m, void *unused)
 
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
 
@@ -6835,7 +6873,7 @@ static int proc_show(struct seq_file *m, void *unused)
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
 		if (itr->pid == pid) {
 			seq_puts(m, "binder proc state:\n");
-			print_binder_proc(m, itr, true);
+			print_binder_proc(m, itr, true, false);
 		}
 	}
 	mutex_unlock(&binder_procs_lock);
@@ -6902,8 +6940,10 @@ const struct file_operations binder_fops = {
 };
 
 DEFINE_SHOW_ATTRIBUTE(state);
+DEFINE_SHOW_ATTRIBUTE(state_hashed);
 DEFINE_SHOW_ATTRIBUTE(stats);
 DEFINE_SHOW_ATTRIBUTE(transactions);
+DEFINE_SHOW_ATTRIBUTE(transactions_hashed);
 DEFINE_SHOW_ATTRIBUTE(transaction_log);
 
 const struct binder_debugfs_entry binder_debugfs_entries[] = {
@@ -6913,6 +6953,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
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
@@ -6925,6 +6971,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
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
2.49.0.987.g0cc8ee98dc-goog

