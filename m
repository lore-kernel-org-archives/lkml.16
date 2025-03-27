Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B828D2F3B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743112973; cv=none; b=SGTF9B6BZajA0/S4GhWmLh0K2ly2c7rD1DpfFj3CeIGfy7h8fzkfk2D5mqm01UYHZYLhLEtsrCmo+2gP0KCWzIY9iopf6IkNSHQT3+6gM4xb2bXRMpXLP7nbIjN+/5Q6M6xK55v/czm+UvezgPi0IAqyGaeX+wE5mUQ+ozhbcGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743112973; c=relaxed/simple;
	bh=XP8d3jitAaIxfszybMznmHGaA9ZV9mq6DvHKos+9DK4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kknWvWabK9fjwv3AIPsIaOa4ApJyP8+uwSbBtUMXkb2IpMxmQP/wucdhX4FqEGEntfsdkw6iue/OtQv7HFbkN5QDlVxBpqhtmdV1Tqpj13gp2WDgQgxpRgWI3fyVPDWDmHF6Vy0XcHLzjJ+jKivBkwI341UtqUuD0J1xBzpyFOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKIiD1QP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKIiD1QP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so2568628a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743112971; x=1743717771; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mamr4iYxmEo+4fGmBLp8TdURIY1JiN8KSVSPQ6CQm3o=;
        b=oKIiD1QPvw2C1iyqpbFRpjlDz4aIaup6mumvB71eEsc+7OTH05buCs4t5n4qG7n6A6
         La+89PmTKvMzyoq9qFbrLte6jP4svRcMfjJDS64JUfWHap0vAbHEKfoZTHG213pw7F+F
         kUeigj2+57WvVaj2vmG2H1DJqfN13YMVkYLuHUrZB9AwRH3iBFm0pjCuA9a7+3ZJ0jVz
         HnRTzDPOgFJ4ukk/7Eg0HC+qBqC347O4QSAgPAEZa11aU7K/2XcZcAnnyGPWFeJnLw/Z
         vodbqQPYJMZZOLKdqK3SOZUQNVdO9Cxn06c5lOvKxMD94pNTgpEoXiUOeGswGZke8P03
         QGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743112971; x=1743717771;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mamr4iYxmEo+4fGmBLp8TdURIY1JiN8KSVSPQ6CQm3o=;
        b=klgS9kIPscNpHxpGSBIdbt2YD3BJ2Aasy1zJ6eQzki3Bo0Wvhj+42C/9EvruncTq7o
         Wx5rVlpSOzW8QHwindxzlwj5roFJOtPnpoImShhsyt0hL/SYszwFpP9ZgOds74duYfXv
         dLuSHZAqJYhVwoJjqX3BVIVHlyMIRAt8GSzQMvFZg0c1SYVtgMud33yiXffnAOCn2u0k
         A40epUufWvAWWtuHUX7pRNFFu8b8WLUj06ze23XgY6GIIb3CuYYYjtOCdsv0eufhJOXV
         /u/hUVM5OesmkCE17RpRXJvj4Xu12by2gLWCexCIe4+xVX4Fl7jpHWxjbggSboju00mV
         brZw==
X-Gm-Message-State: AOJu0YwbZPskp+9QHoLLJ7tIp65ZoEfIxho0ypkqPtGC4/LfZCuSpO6D
	Tn2ZgEeOkJTOVNXeKoCXi+6F9n/iO8jwMDNH2kGMjt7bteIurTylWkmI0vj0yR45FKAhbBLOyzr
	ff0XMBQ==
X-Google-Smtp-Source: AGHT+IHeu59LQHJnx/XBNnvlxg/OOrrWbsWpv12kOOaM4YNrFsKr/NoTxx4nVLbi03PYxKgw3znWDtTruXlA
X-Received: from pjg16.prod.google.com ([2002:a17:90b:3f50:b0:2fc:2f33:e07d])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:544f:b0:2ff:692b:b15
 with SMTP id 98e67ed59e1d1-303a8e7a64amr8905331a91.33.1743112970952; Thu, 27
 Mar 2025 15:02:50 -0700 (PDT)
Date: Thu, 27 Mar 2025 22:02:25 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250327220225.3180998-3-ynaffit@google.com>
Subject: [PATCH 1/2] binder: Refactor binder_node print synchronization
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

Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
---
 drivers/android/binder.c | 114 +++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 51 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 76052006bd87..d963a7860aa3 100644
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
@@ -6505,8 +6505,50 @@ static void print_binder_ref_olocked(struct seq_file *m,
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
+ * binder_dead_nodes_lock.
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
@@ -6519,31 +6561,17 @@ static void print_binder_proc(struct seq_file *m,
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
@@ -6551,12 +6579,10 @@ static void print_binder_proc(struct seq_file *m,
 
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
@@ -6696,7 +6722,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	count = 0;
 	ready_threads = 0;
 	binder_inner_proc_lock(proc);
-	for (n = rb_first(&proc->threads); n != NULL; n = rb_next(n))
+	for (n = rb_first(&proc->threads); n; n = rb_next(n))
 		count++;
 
 	list_for_each_entry(thread, &proc->waiting_threads, waiting_thread_node)
@@ -6710,7 +6736,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 			ready_threads,
 			free_async_space);
 	count = 0;
-	for (n = rb_first(&proc->nodes); n != NULL; n = rb_next(n))
+	for (n = rb_first(&proc->nodes); n; n = rb_next(n))
 		count++;
 	binder_inner_proc_unlock(proc);
 	seq_printf(m, "  nodes: %d\n", count);
@@ -6718,7 +6744,7 @@ static void print_binder_proc_stats(struct seq_file *m,
 	strong = 0;
 	weak = 0;
 	binder_proc_lock(proc);
-	for (n = rb_first(&proc->refs_by_desc); n != NULL; n = rb_next(n)) {
+	for (n = rb_first(&proc->refs_by_desc); n; n = rb_next(n)) {
 		struct binder_ref *ref = rb_entry(n, struct binder_ref,
 						  rb_node_desc);
 		count++;
@@ -6756,29 +6782,15 @@ static int state_show(struct seq_file *m, void *unused)
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
@@ -6807,7 +6819,7 @@ static int transactions_show(struct seq_file *m, void *unused)
 	seq_puts(m, "binder transactions:\n");
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(proc, &binder_procs, proc_node)
-		print_binder_proc(m, proc, 0);
+		print_binder_proc(m, proc, false);
 	mutex_unlock(&binder_procs_lock);
 
 	return 0;
@@ -6822,7 +6834,7 @@ static int proc_show(struct seq_file *m, void *unused)
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
 		if (itr->pid == pid) {
 			seq_puts(m, "binder proc state:\n");
-			print_binder_proc(m, itr, 1);
+			print_binder_proc(m, itr, true);
 		}
 	}
 	mutex_unlock(&binder_procs_lock);
-- 
2.49.0.395.g12beb8f557-goog

