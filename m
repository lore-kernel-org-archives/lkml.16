Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E728FFC6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652221; cv=none; b=WSfRh2XFxqNrS1gWvsks3AJEOcxT1BLlflHzkpBajZk52b/7po05IdF2K3A8NcGRlfrjPAWC4mCaM8VwTZutZEUGH18FNATaXz5/HiFZMNb4OxhKjScB1HQb4ONfDojpTLgSxeDQeelnieLd1eZCR9D0Wgn+6ZvU94yfVpKkCGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652221; c=relaxed/simple;
	bh=YpqZBuxotqRmwq/xwZHJndFVFLAcXx5xhR3dDnslUew=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mkPAOzITGw3F5A4MMy7ClH5idz6/rLmbI9K6NiaKbEWYZUSfXTbCnNxynhpvNcd/MWGAuIcZ0PuT8+Y1vpKYQjftJ70S1U+jUhOBGC5j8ndYAr0/oVKvfLSCqOXPEdR3gw2wfobD4JwbZ5lEr8SjhNynjFO2bKpgJGYSFUm+/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RGBDmm0Q; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RGBDmm0Q"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7370e73f690so364341b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746652217; x=1747257017; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aC/2X9RaEtkGCzTm0FRPAMB/1IEsqIHeB9oS2frhfj0=;
        b=RGBDmm0QpDFWDawRE1i4pXLgksbTbbm4qKUWGPpFscKimBRxqbokTTA6bY2Sy0tTgr
         UsTEBqbVnlprqNN1vH7Y23b/4UJACflPYxeJ74kg3pM08Tm0/Aj8v/yuaB7CCR9MM8BV
         CQKoEBbfWQe+wxUC7En8g0brWfIpsMI4u4uT9SPaMX51vhR+vIw5wlpdseS7SGqNgI7X
         9QSNIT9QZQ4vTOTUYKBiwO6m6ZmkZRJObHLyLy6t+sqClrhUCPMejEU4ZS/SbHHmM4oZ
         1rqHRdIHazxi0xUnRMBVjyvBARV2APMuY9CJrwPz7/CpXEKj0FLapuaWcIMS7HF7yfg9
         d81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746652217; x=1747257017;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aC/2X9RaEtkGCzTm0FRPAMB/1IEsqIHeB9oS2frhfj0=;
        b=twcrx/NDyNnboPa+8GuUitAf02OjZPAd3r8gLZIhinyEqxc2pGJIS+Eh2qt4vVEHLw
         iv531RuuEO3BAupOi3bodcedKuu6QsYo5gSgZVu+ffQS25rdcW4dunQ3VLUk/tg8Cgqu
         eSUTPxVBWR14yUbz/fzxf4bG6uY+IeLpwrNGAW81BvslSC9cHqYxZXlV4d9pA8m/rL1a
         h4Gzzbhtcp/5yqSSoySXEde5MEB80txh6EMi4t5Wi07aVNelm1RVDwDxKMeaErAekltd
         9PQN7BLWd0jG83aYDOyG9s7BL7uUU/X8U286XW7D3zCJY7sBWeSR3fdi3BNMtLGU1vW9
         mi2A==
X-Gm-Message-State: AOJu0Yx+q5vhpfpo0d1W7hkSxVpyLKLCAUf3eLBLifZaxkTjfOXIXIVm
	3PDnL5JtkNw48gwf7FEflht/FeH1jrf8c4sPtlMZosfiekQWJa+5/t8V8AqEf+94iCLWeiraXvp
	3W4AKQA==
X-Google-Smtp-Source: AGHT+IExWWuPayQ17NyFvrfZqXlH2Ff4iSSV97r8YrkumQrw3sifyEMUkakmN7WXgLNxpFrnPo8ZpKMQ3och
X-Received: from pfwz12.prod.google.com ([2002:a05:6a00:1d8c:b0:730:880d:7ed5])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab0d:b0:73b:ef0a:f9dc
 with SMTP id d2e1a72fcca58-7409cedc7d8mr7230502b3a.4.1746652217662; Wed, 07
 May 2025 14:10:17 -0700 (PDT)
Date: Wed,  7 May 2025 21:10:05 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507211005.449435-3-ynaffit@google.com>
Subject: [PATCH v3 1/2] binder: Refactor binder_node print synchronization
From: "Tiffany Y. Yang" <ynaffit@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	"Tiffany Y. Yang" <ynaffit@google.com>
Content-Type: text/plain; charset="UTF-8"

The binder driver outputs information about each dead binder node by
iterating over the dead nodes list, and it prints the state of each live
node in the system by traversing each binder_proc's proc->nodes tree.
Both cases require similar logic to maintain the global lock ordering
while accessing each node.

Create a helper function to synchronize around printing binder nodes in
a list. Opportunistically make minor cosmetic changes to binder print
functions.

Acked-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
---
V2->V3: No change (updated version for patch 2/2)
V1->V2: Updated function comment to note dropped locks

 drivers/android/binder.c | 115 ++++++++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 51 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 5fc2c8ee61b1..960d055c27d5 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6377,10 +6377,10 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
 }
 
 static void print_binder_work_ilocked(struct seq_file *m,
-				     struct binder_proc *proc,
-				     const char *prefix,
-				     const char *transaction_prefix,
-				     struct binder_work *w)
+				      struct binder_proc *proc,
+				      const char *prefix,
+				      const char *transaction_prefix,
+				      struct binder_work *w)
 {
 	struct binder_node *node;
 	struct binder_transaction *t;
@@ -6430,7 +6430,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
 
 static void print_binder_thread_ilocked(struct seq_file *m,
 					struct binder_thread *thread,
-					int print_always)
+					bool print_always)
 {
 	struct binder_transaction *t;
 	struct binder_work *w;
@@ -6505,8 +6505,51 @@ static void print_binder_ref_olocked(struct seq_file *m,
 	binder_node_unlock(ref->node);
 }
 
-static void print_binder_proc(struct seq_file *m,
-			      struct binder_proc *proc, int print_all)
+/**
+ * print_next_binder_node_ilocked() - Print binder_node from a locked list
+ * @m:          struct seq_file for output via seq_printf()
+ * @node:       struct binder_node to print fields of
+ * @prev_node:	struct binder_node we hold a temporary reference to (if any)
+ *
+ * Helper function to handle synchronization around printing a struct
+ * binder_node while iterating through @node->proc->nodes or the dead nodes
+ * list. Caller must hold either @node->proc->inner_lock (for live nodes) or
+ * binder_dead_nodes_lock. This lock will be released during the body of this
+ * function, but it will be reacquired before returning to the caller.
+ *
+ * Return:	pointer to the struct binder_node we hold a tmpref on
+ */
+static struct binder_node *
+print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
+			       struct binder_node *prev_node)
+{
+	/*
+	 * Take a temporary reference on the node so that isn't removed from
+	 * its proc's tree or the dead nodes list while we print it.
+	 */
+	binder_inc_node_tmpref_ilocked(node);
+	/*
+	 * Live nodes need to drop the inner proc lock and dead nodes need to
+	 * drop the binder_dead_nodes_lock before trying to take the node lock.
+	 */
+	if (node->proc)
+		binder_inner_proc_unlock(node->proc);
+	else
+		spin_unlock(&binder_dead_nodes_lock);
+	if (prev_node)
+		binder_put_node(prev_node);
+	binder_node_inner_lock(node);
+	print_binder_node_nilocked(m, node);
+	binder_node_inner_unlock(node);
+	if (node->proc)
+		binder_inner_proc_lock(node->proc);
+	else
+		spin_lock(&binder_dead_nodes_lock);
+	return node;
+}
+
+static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
+			      bool print_all)
 {
 	struct binder_work *w;
 	struct rb_node *n;
@@ -6519,31 +6562,17 @@ static void print_binder_proc(struct seq_file *m,
 	header_pos = m->count;
 
 	binder_inner_proc_lock(proc);
-	for (n = rb_first(&proc->threads); n != NULL; n = rb_next(n))
+	for (n = rb_first(&proc->threads); n; n = rb_next(n))
 		print_binder_thread_ilocked(m, rb_entry(n, struct binder_thread,
 						rb_node), print_all);
 
-	for (n = rb_first(&proc->nodes); n != NULL; n = rb_next(n)) {
+	for (n = rb_first(&proc->nodes); n; n = rb_next(n)) {
 		struct binder_node *node = rb_entry(n, struct binder_node,
 						    rb_node);
 		if (!print_all && !node->has_async_transaction)
 			continue;
 
-		/*
-		 * take a temporary reference on the node so it
-		 * survives and isn't removed from the tree
-		 * while we print it.
-		 */
-		binder_inc_node_tmpref_ilocked(node);
-		/* Need to drop inner lock to take node lock */
-		binder_inner_proc_unlock(proc);
-		if (last_node)
-			binder_put_node(last_node);
-		binder_node_inner_lock(node);
-		print_binder_node_nilocked(m, node);
-		binder_node_inner_unlock(node);
-		last_node = node;
-		binder_inner_proc_lock(proc);
+		last_node = print_next_binder_node_ilocked(m, node, last_node);
 	}
 	binder_inner_proc_unlock(proc);
 	if (last_node)
@@ -6551,12 +6580,10 @@ static void print_binder_proc(struct seq_file *m,
 
 	if (print_all) {
 		binder_proc_lock(proc);
-		for (n = rb_first(&proc->refs_by_desc);
-		     n != NULL;
-		     n = rb_next(n))
+		for (n = rb_first(&proc->refs_by_desc); n; n = rb_next(n))
 			print_binder_ref_olocked(m, rb_entry(n,
-							    struct binder_ref,
-							    rb_node_desc));
+							     struct binder_ref,
+							     rb_node_desc));
 		binder_proc_unlock(proc);
 	}
 	binder_alloc_print_allocated(m, &proc->alloc);
@@ -6696,7 +6723,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	count = 0;
 	ready_threads = 0;
 	binder_inner_proc_lock(proc);
-	for (n = rb_first(&proc->threads); n != NULL; n = rb_next(n))
+	for (n = rb_first(&proc->threads); n; n = rb_next(n))
 		count++;
 
 	list_for_each_entry(thread, &proc->waiting_threads, waiting_thread_node)
@@ -6710,7 +6737,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 			ready_threads,
 			free_async_space);
 	count = 0;
-	for (n = rb_first(&proc->nodes); n != NULL; n = rb_next(n))
+	for (n = rb_first(&proc->nodes); n; n = rb_next(n))
 		count++;
 	binder_inner_proc_unlock(proc);
 	seq_printf(m, "  nodes: %d\n", count);
@@ -6718,7 +6745,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	strong = 0;
 	weak = 0;
 	binder_proc_lock(proc);
-	for (n = rb_first(&proc->refs_by_desc); n != NULL; n = rb_next(n)) {
+	for (n = rb_first(&proc->refs_by_desc); n; n = rb_next(n)) {
 		struct binder_ref *ref = rb_entry(n, struct binder_ref,
 						  rb_node_desc);
 		count++;
@@ -6756,29 +6783,15 @@ static int state_show(struct seq_file *m, void *unused)
 	spin_lock(&binder_dead_nodes_lock);
 	if (!hlist_empty(&binder_dead_nodes))
 		seq_puts(m, "dead nodes:\n");
-	hlist_for_each_entry(node, &binder_dead_nodes, dead_node) {
-		/*
-		 * take a temporary reference on the node so it
-		 * survives and isn't removed from the list
-		 * while we print it.
-		 */
-		node->tmp_refs++;
-		spin_unlock(&binder_dead_nodes_lock);
-		if (last_node)
-			binder_put_node(last_node);
-		binder_node_lock(node);
-		print_binder_node_nilocked(m, node);
-		binder_node_unlock(node);
-		last_node = node;
-		spin_lock(&binder_dead_nodes_lock);
-	}
+	hlist_for_each_entry(node, &binder_dead_nodes, dead_node)
+		last_node = print_next_binder_node_ilocked(m, node, last_node);
 	spin_unlock(&binder_dead_nodes_lock);
 	if (last_node)
 		binder_put_node(last_node);
 
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(proc, &binder_procs, proc_node)
-		print_binder_proc(m, proc, 1);
+		print_binder_proc(m, proc, true);
 	mutex_unlock(&binder_procs_lock);
 
 	return 0;
@@ -6807,7 +6820,7 @@ static int transactions_show(struct seq_file *m, void *unused)
 	seq_puts(m, "binder transactions:\n");
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(proc, &binder_procs, proc_node)
-		print_binder_proc(m, proc, 0);
+		print_binder_proc(m, proc, false);
 	mutex_unlock(&binder_procs_lock);
 
 	return 0;
@@ -6822,7 +6835,7 @@ static int proc_show(struct seq_file *m, void *unused)
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
 		if (itr->pid == pid) {
 			seq_puts(m, "binder proc state:\n");
-			print_binder_proc(m, itr, 1);
+			print_binder_proc(m, itr, true);
 		}
 	}
 	mutex_unlock(&binder_procs_lock);
-- 
2.49.0.987.g0cc8ee98dc-goog

