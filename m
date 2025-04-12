Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCC14386D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744492518; cv=none; b=lD2JgZdAXn0a1LZN211j+PWGfT3hjhDZOHgEIN/hc5bLuOtTTHG7XuYJsl6k+Usmfd93emzkT2ZWvqjia9BAEKs3Ufog14+hh/NSJL4XvghFEzzEnt9MA2V79VT3DA41uHhYuQxt7DsKab17ZTrMTerkPH7D/e6w2XXaolCmeps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744492518; c=relaxed/simple;
	bh=GJIx7X90iKtl5ZtGTq7JnLtt31Bjlalp7lFjoLw58So=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EEbOjJdo87bZrFgmXvB1nfLtKxZtQ7BpPZ/FQug7dSmS1mYCjKf3mqLoCEzarvnEDVO2sIK7PDofamVVKIBxA4/N1Xyd9IcNV9P9aH1ZyR4p65gY5Sd5TNOCHUQY9f9Z8cuZY1GpNMQ7gvtB9gadZ4eDtOUq8tFVnnRptVQmxSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36018C4CEE3;
	Sat, 12 Apr 2025 21:15:16 +0000 (UTC)
Date: Sat, 12 Apr 2025 17:15:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Andy Chiu <andybnac@gmail.com>, Nam Cao
 <namcao@linutronix.de>
Subject: [GIT PULL] tracing: Fixes for v6.15
Message-ID: <20250412171514.5da58a6f@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Linus,

tracing fixes for v6.15

- Hide get_vm_area() from MMUless builds

  The function get_vm_area() is not defined when CONFIG_MMU is not defined.
  Hide that function within #ifdef CONFIG_MMU.

- Fix output of synthetic events when they have dynamic strings

  The print fmt of the synthetic event's format file use to have "%.*s" for
  dynamic size strings even though the user space exported arguments had
  only __get_str() macro that provided just a nul terminated string. This
  was fixed so that user space could parse this properly. But the reason
  that it had "%.*s" was because internally it provided the maximum size of
  the string as one of the arguments. The fix that replaced "%.*s" with "%s"
  caused the trace output (when the kernel reads the event) to write
  "(efault)" as it would now read the length of the string as "%s".

  As the string provided is always nul terminated, there's no reason for the
  internal code to use "%.*s" anyway. Just remove the length argument to
  match the "%s" that is now in the format.

- Fix the ftrace subops hash logic of the manager ops hash

  The function_graph uses the ftrace subops code. The subops code is a way
  to have a single ftrace_ops registered with ftrace to determine what
  functions will call the ftrace_ops callback. More than one user of
  function graph can register a ftrace_ops with it. The function graph
  infrastructure will then add this ftrace_ops as a subops with the main
  ftrace_ops it registers with ftrace. This is because the functions will
  always call the function graph callback which in turn calls the subops
  ftrace_ops callbacks.

  The main ftrace_ops must add a callback to all the functions that the
  subops want a callback from. When a subops is registered, it will update
  the main ftrace_ops hash to include the functions it wants. This is the
  logic that was broken.

  The ftrace_ops hash has a "filter_hash" and a "notrace_hash" were all the
  functions in the filter_hash but not in the notrace_hash are attached by
  ftrace. The original logic would have the main ftrace_ops filter_hash be a
  union of all the subops filter_hashes and the main notrace_hash would be a
  intersect of all the subops filter hashes. But this was incorrect because
  the notrace hash depends on the filter_hash it is associated to and not
  the union of all filter_hashes.

  Instead, when a subops is added, just include all the functions of the
  subops hash that are in its filter_hash but not in its notrace_hash. The
  main subops hash should not use its notrace hash, unless all of its subops
  hashes have an empty filter_hash (which means to attach to all functions),
  and then, and only then, the main ftrace_ops notrace hash can be the
  intersect of all the subops hashes.

  This not only fixes the bug, but also simplifies the code.

- Add a selftest to better test the subops filtering

  Add a selftest that would catch the bug fixed by the above change.

- Fix extra newline printed in function tracing with retval

  The function parameter code changed the output logic slightly and called
  print_graph_retval() and also printed a newline. The print_graph_retval()
  also prints a newline which caused blank lines to be printed in the
  function graph tracer when retval was added. This caused one of the
  selftests to fail if retvals were enabled. Instead remove the new line
  output from print_graph_retval() and have the callers always print the
  new line so that it doesn't have to do special logic if it calls
  print_graph_retval() or not.

- Fix out-of-bound memory access in the runtime verifier

  When rv_is_container_monitor() is called on the last entry on the link
  list it references the next entry, which is the list head and causes an
  out-of-bound memory access.


Please pull the latest trace-v6.15-rc1 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.15-rc1

Tag SHA1: bf44b733f8b5f9bcbe9c61acc958df8f3c7ad944
Head SHA1: 8d7861ac507d23024c7d74b6cb59a9cca248bcb7


Andy Chiu (1):
      ftrace: Properly merge notrace hashes

Nam Cao (1):
      rv: Fix out-of-bound memory access in rv_is_container_monitor()

Steven Rostedt (5):
      tracing: Hide get_vm_area() from MMUless builds
      tracing: Do not add length to print format in synthetic events
      ftrace: Fix accounting of subop hashes
      tracing/selftest: Add test to better test subops filtering of function graph
      ftrace: Do not have print_graph_retval() add a newline

----
 kernel/trace/ftrace.c                              | 314 ++++++++++++---------
 kernel/trace/rv/rv.c                               |   7 +-
 kernel/trace/trace.c                               |   7 +
 kernel/trace/trace_events_synth.c                  |   1 -
 kernel/trace/trace_functions_graph.c               |  11 +-
 .../ftrace/test.d/ftrace/fgraph-multi-filter.tc    | 177 ++++++++++++
 6 files changed, 372 insertions(+), 145 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi-filter.tc
---------------------------
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 1a48aedb5255..a8a02868b435 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3255,6 +3255,31 @@ static int append_hash(struct ftrace_hash **hash, struct ftrace_hash *new_hash,
 	return 0;
 }
 
+/*
+ * Remove functions from @hash that are in @notrace_hash
+ */
+static void remove_hash(struct ftrace_hash *hash, struct ftrace_hash *notrace_hash)
+{
+	struct ftrace_func_entry *entry;
+	struct hlist_node *tmp;
+	int size;
+	int i;
+
+	/* If the notrace hash is empty, there's nothing to do */
+	if (ftrace_hash_empty(notrace_hash))
+		return;
+
+	size = 1 << hash->size_bits;
+	for (i = 0; i < size; i++) {
+		hlist_for_each_entry_safe(entry, tmp, &hash->buckets[i], hlist) {
+			if (!__ftrace_lookup_ip(notrace_hash, entry->ip))
+				continue;
+			remove_hash_entry(hash, entry);
+			kfree(entry);
+		}
+	}
+}
+
 /*
  * Add to @hash only those that are in both @new_hash1 and @new_hash2
  *
@@ -3295,67 +3320,6 @@ static int intersect_hash(struct ftrace_hash **hash, struct ftrace_hash *new_has
 	return 0;
 }
 
-/* Return a new hash that has a union of all @ops->filter_hash entries */
-static struct ftrace_hash *append_hashes(struct ftrace_ops *ops)
-{
-	struct ftrace_hash *new_hash = NULL;
-	struct ftrace_ops *subops;
-	int size_bits;
-	int ret;
-
-	if (ops->func_hash->filter_hash)
-		size_bits = ops->func_hash->filter_hash->size_bits;
-	else
-		size_bits = FTRACE_HASH_DEFAULT_BITS;
-
-	list_for_each_entry(subops, &ops->subop_list, list) {
-		ret = append_hash(&new_hash, subops->func_hash->filter_hash, size_bits);
-		if (ret < 0) {
-			free_ftrace_hash(new_hash);
-			return NULL;
-		}
-		/* Nothing more to do if new_hash is empty */
-		if (ftrace_hash_empty(new_hash))
-			break;
-	}
-	/* Can't return NULL as that means this failed */
-	return new_hash ? : EMPTY_HASH;
-}
-
-/* Make @ops trace evenything except what all its subops do not trace */
-static struct ftrace_hash *intersect_hashes(struct ftrace_ops *ops)
-{
-	struct ftrace_hash *new_hash = NULL;
-	struct ftrace_ops *subops;
-	int size_bits;
-	int ret;
-
-	list_for_each_entry(subops, &ops->subop_list, list) {
-		struct ftrace_hash *next_hash;
-
-		if (!new_hash) {
-			size_bits = subops->func_hash->notrace_hash->size_bits;
-			new_hash = alloc_and_copy_ftrace_hash(size_bits, ops->func_hash->notrace_hash);
-			if (!new_hash)
-				return NULL;
-			continue;
-		}
-		size_bits = new_hash->size_bits;
-		next_hash = new_hash;
-		new_hash = alloc_ftrace_hash(size_bits);
-		ret = intersect_hash(&new_hash, next_hash, subops->func_hash->notrace_hash);
-		free_ftrace_hash(next_hash);
-		if (ret < 0) {
-			free_ftrace_hash(new_hash);
-			return NULL;
-		}
-		/* Nothing more to do if new_hash is empty */
-		if (ftrace_hash_empty(new_hash))
-			break;
-	}
-	return new_hash;
-}
-
 static bool ops_equal(struct ftrace_hash *A, struct ftrace_hash *B)
 {
 	struct ftrace_func_entry *entry;
@@ -3427,6 +3391,93 @@ static int ftrace_update_ops(struct ftrace_ops *ops, struct ftrace_hash *filter_
 	return 0;
 }
 
+static int add_first_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **notrace_hash,
+			  struct ftrace_ops_hash *func_hash)
+{
+	/* If the filter hash is not empty, simply remove the nohash from it */
+	if (!ftrace_hash_empty(func_hash->filter_hash)) {
+		*filter_hash = copy_hash(func_hash->filter_hash);
+		if (!*filter_hash)
+			return -ENOMEM;
+		remove_hash(*filter_hash, func_hash->notrace_hash);
+		*notrace_hash = EMPTY_HASH;
+
+	} else {
+		*notrace_hash = copy_hash(func_hash->notrace_hash);
+		if (!*notrace_hash)
+			return -ENOMEM;
+		*filter_hash = EMPTY_HASH;
+	}
+	return 0;
+}
+
+static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **notrace_hash,
+			 struct ftrace_ops_hash *ops_hash, struct ftrace_ops_hash *subops_hash)
+{
+	int size_bits;
+	int ret;
+
+	/* If the subops trace all functions so must the main ops */
+	if (ftrace_hash_empty(ops_hash->filter_hash) ||
+	    ftrace_hash_empty(subops_hash->filter_hash)) {
+		*filter_hash = EMPTY_HASH;
+	} else {
+		/*
+		 * The main ops filter hash is not empty, so its
+		 * notrace_hash had better be, as the notrace hash
+		 * is only used for empty main filter hashes.
+		 */
+		WARN_ON_ONCE(!ftrace_hash_empty(ops_hash->notrace_hash));
+
+		size_bits = max(ops_hash->filter_hash->size_bits,
+				subops_hash->filter_hash->size_bits);
+
+		/* Copy the subops hash */
+		*filter_hash = alloc_and_copy_ftrace_hash(size_bits, subops_hash->filter_hash);
+		if (!filter_hash)
+			return -ENOMEM;
+		/* Remove any notrace functions from the copy */
+		remove_hash(*filter_hash, subops_hash->notrace_hash);
+
+		ret = append_hash(filter_hash, ops_hash->filter_hash,
+				  size_bits);
+		if (ret < 0) {
+			free_ftrace_hash(*filter_hash);
+			return ret;
+		}
+	}
+
+	/*
+	 * Only process notrace hashes if the main filter hash is empty
+	 * (tracing all functions), otherwise the filter hash will just
+	 * remove the notrace hash functions, and the notrace hash is
+	 * not needed.
+	 */
+	if (ftrace_hash_empty(*filter_hash)) {
+		/*
+		 * Intersect the notrace functions. That is, if two
+		 * subops are not tracing a set of functions, the
+		 * main ops will only not trace the functions that are
+		 * in both subops, but has to trace the functions that
+		 * are only notrace in one of the subops, for the other
+		 * subops to be able to trace them.
+		 */
+		size_bits = max(ops_hash->notrace_hash->size_bits,
+				subops_hash->notrace_hash->size_bits);
+		*notrace_hash = alloc_ftrace_hash(size_bits);
+		if (!*notrace_hash)
+			return -ENOMEM;
+
+		ret = intersect_hash(notrace_hash, ops_hash->notrace_hash,
+				     subops_hash->notrace_hash);
+		if (ret < 0) {
+			free_ftrace_hash(*notrace_hash);
+			return ret;
+		}
+	}
+	return 0;
+}
+
 /**
  * ftrace_startup_subops - enable tracing for subops of an ops
  * @ops: Manager ops (used to pick all the functions of its subops)
@@ -3443,7 +3494,6 @@ int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int
 	struct ftrace_hash *notrace_hash;
 	struct ftrace_hash *save_filter_hash;
 	struct ftrace_hash *save_notrace_hash;
-	int size_bits;
 	int ret;
 
 	if (unlikely(ftrace_disabled))
@@ -3467,14 +3517,14 @@ int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int
 
 	/* For the first subops to ops just enable it normally */
 	if (list_empty(&ops->subop_list)) {
-		/* Just use the subops hashes */
-		filter_hash = copy_hash(subops->func_hash->filter_hash);
-		notrace_hash = copy_hash(subops->func_hash->notrace_hash);
-		if (!filter_hash || !notrace_hash) {
-			free_ftrace_hash(filter_hash);
-			free_ftrace_hash(notrace_hash);
-			return -ENOMEM;
-		}
+
+		/* The ops was empty, should have empty hashes */
+		WARN_ON_ONCE(!ftrace_hash_empty(ops->func_hash->filter_hash));
+		WARN_ON_ONCE(!ftrace_hash_empty(ops->func_hash->notrace_hash));
+
+		ret = add_first_hash(&filter_hash, &notrace_hash, subops->func_hash);
+		if (ret < 0)
+			return ret;
 
 		save_filter_hash = ops->func_hash->filter_hash;
 		save_notrace_hash = ops->func_hash->notrace_hash;
@@ -3500,48 +3550,16 @@ int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int
 
 	/*
 	 * Here there's already something attached. Here are the rules:
-	 *   o If either filter_hash is empty then the final stays empty
-	 *      o Otherwise, the final is a superset of both hashes
-	 *   o If either notrace_hash is empty then the final stays empty
-	 *      o Otherwise, the final is an intersection between the hashes
+	 *   If the new subops and main ops filter hashes are not empty:
+	 *     o Make a copy of the subops filter hash
+	 *     o Remove all functions in the nohash from it.
+	 *     o Add in the main hash filter functions
+	 *     o Remove any of these functions from the main notrace hash
 	 */
-	if (ftrace_hash_empty(ops->func_hash->filter_hash) ||
-	    ftrace_hash_empty(subops->func_hash->filter_hash)) {
-		filter_hash = EMPTY_HASH;
-	} else {
-		size_bits = max(ops->func_hash->filter_hash->size_bits,
-				subops->func_hash->filter_hash->size_bits);
-		filter_hash = alloc_and_copy_ftrace_hash(size_bits, ops->func_hash->filter_hash);
-		if (!filter_hash)
-			return -ENOMEM;
-		ret = append_hash(&filter_hash, subops->func_hash->filter_hash,
-				  size_bits);
-		if (ret < 0) {
-			free_ftrace_hash(filter_hash);
-			return ret;
-		}
-	}
-
-	if (ftrace_hash_empty(ops->func_hash->notrace_hash) ||
-	    ftrace_hash_empty(subops->func_hash->notrace_hash)) {
-		notrace_hash = EMPTY_HASH;
-	} else {
-		size_bits = max(ops->func_hash->filter_hash->size_bits,
-				subops->func_hash->filter_hash->size_bits);
-		notrace_hash = alloc_ftrace_hash(size_bits);
-		if (!notrace_hash) {
-			free_ftrace_hash(filter_hash);
-			return -ENOMEM;
-		}
 
-		ret = intersect_hash(&notrace_hash, ops->func_hash->filter_hash,
-				     subops->func_hash->filter_hash);
-		if (ret < 0) {
-			free_ftrace_hash(filter_hash);
-			free_ftrace_hash(notrace_hash);
-			return ret;
-		}
-	}
+	ret = add_next_hash(&filter_hash, &notrace_hash, ops->func_hash, subops->func_hash);
+	if (ret < 0)
+		return ret;
 
 	list_add(&subops->list, &ops->subop_list);
 
@@ -3557,6 +3575,42 @@ int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int
 	return ret;
 }
 
+static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash **notrace_hash,
+			  struct ftrace_ops *ops)
+{
+	struct ftrace_ops_hash temp_hash;
+	struct ftrace_ops *subops;
+	bool first = true;
+	int ret;
+
+	temp_hash.filter_hash = EMPTY_HASH;
+	temp_hash.notrace_hash = EMPTY_HASH;
+
+	list_for_each_entry(subops, &ops->subop_list, list) {
+		*filter_hash = EMPTY_HASH;
+		*notrace_hash = EMPTY_HASH;
+
+		if (first) {
+			ret = add_first_hash(filter_hash, notrace_hash, subops->func_hash);
+			if (ret < 0)
+				return ret;
+			first = false;
+		} else {
+			ret = add_next_hash(filter_hash, notrace_hash,
+					    &temp_hash, subops->func_hash);
+			if (ret < 0) {
+				free_ftrace_hash(temp_hash.filter_hash);
+				free_ftrace_hash(temp_hash.notrace_hash);
+				return ret;
+			}
+		}
+
+		temp_hash.filter_hash = *filter_hash;
+		temp_hash.notrace_hash = *notrace_hash;
+	}
+	return 0;
+}
+
 /**
  * ftrace_shutdown_subops - Remove a subops from a manager ops
  * @ops: A manager ops to remove @subops from
@@ -3605,14 +3659,9 @@ int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, in
 	}
 
 	/* Rebuild the hashes without subops */
-	filter_hash = append_hashes(ops);
-	notrace_hash = intersect_hashes(ops);
-	if (!filter_hash || !notrace_hash) {
-		free_ftrace_hash(filter_hash);
-		free_ftrace_hash(notrace_hash);
-		list_add(&subops->list, &ops->subop_list);
-		return -ENOMEM;
-	}
+	ret = rebuild_hashes(&filter_hash, &notrace_hash, ops);
+	if (ret < 0)
+		return ret;
 
 	ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
 	if (ret < 0) {
@@ -3628,11 +3677,11 @@ int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, in
 
 static int ftrace_hash_move_and_update_subops(struct ftrace_ops *subops,
 					      struct ftrace_hash **orig_subhash,
-					      struct ftrace_hash *hash,
-					      int enable)
+					      struct ftrace_hash *hash)
 {
 	struct ftrace_ops *ops = subops->managed;
-	struct ftrace_hash **orig_hash;
+	struct ftrace_hash *notrace_hash;
+	struct ftrace_hash *filter_hash;
 	struct ftrace_hash *save_hash;
 	struct ftrace_hash *new_hash;
 	int ret;
@@ -3649,24 +3698,15 @@ static int ftrace_hash_move_and_update_subops(struct ftrace_ops *subops,
 		return -ENOMEM;
 	}
 
-	/* Create a new_hash to hold the ops new functions */
-	if (enable) {
-		orig_hash = &ops->func_hash->filter_hash;
-		new_hash = append_hashes(ops);
-	} else {
-		orig_hash = &ops->func_hash->notrace_hash;
-		new_hash = intersect_hashes(ops);
-	}
-
-	/* Move the hash over to the new hash */
-	ret = __ftrace_hash_move_and_update_ops(ops, orig_hash, new_hash, enable);
-
-	free_ftrace_hash(new_hash);
+	ret = rebuild_hashes(&filter_hash, &notrace_hash, ops);
+	if (!ret)
+		ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
 
 	if (ret) {
 		/* Put back the original hash */
-		free_ftrace_hash_rcu(*orig_subhash);
+		new_hash = *orig_subhash;
 		*orig_subhash = save_hash;
+		free_ftrace_hash_rcu(new_hash);
 	} else {
 		free_ftrace_hash_rcu(save_hash);
 	}
@@ -4890,7 +4930,7 @@ static int ftrace_hash_move_and_update_ops(struct ftrace_ops *ops,
 					   int enable)
 {
 	if (ops->flags & FTRACE_OPS_FL_SUBOP)
-		return ftrace_hash_move_and_update_subops(ops, orig_hash, hash, enable);
+		return ftrace_hash_move_and_update_subops(ops, orig_hash, hash);
 
 	/*
 	 * If this ops is not enabled, it could be sharing its filters
@@ -4909,7 +4949,7 @@ static int ftrace_hash_move_and_update_ops(struct ftrace_ops *ops,
 			list_for_each_entry(subops, &op->subop_list, list) {
 				if ((subops->flags & FTRACE_OPS_FL_ENABLED) &&
 				     subops->func_hash == ops->func_hash) {
-					return ftrace_hash_move_and_update_subops(subops, orig_hash, hash, enable);
+					return ftrace_hash_move_and_update_subops(subops, orig_hash, hash);
 				}
 			}
 		} while_for_each_ftrace_op(op);
diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
index 968c5c3b0246..e4077500a91d 100644
--- a/kernel/trace/rv/rv.c
+++ b/kernel/trace/rv/rv.c
@@ -225,7 +225,12 @@ bool rv_is_nested_monitor(struct rv_monitor_def *mdef)
  */
 bool rv_is_container_monitor(struct rv_monitor_def *mdef)
 {
-	struct rv_monitor_def *next = list_next_entry(mdef, list);
+	struct rv_monitor_def *next;
+
+	if (list_is_last(&mdef->list, &rv_monitors_list))
+		return false;
+
+	next = list_next_entry(mdef, list);
 
 	return next->parent == mdef->monitor || !mdef->monitor->enable;
 }
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b581e388a9d9..8ddf6b17215c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9806,6 +9806,7 @@ static int instance_mkdir(const char *name)
 	return ret;
 }
 
+#ifdef CONFIG_MMU
 static u64 map_pages(unsigned long start, unsigned long size)
 {
 	unsigned long vmap_start, vmap_end;
@@ -9828,6 +9829,12 @@ static u64 map_pages(unsigned long start, unsigned long size)
 
 	return (u64)vmap_start;
 }
+#else
+static inline u64 map_pages(unsigned long start, unsigned long size)
+{
+	return 0;
+}
+#endif
 
 /**
  * trace_array_get_by_name - Create/Lookup a trace array, given its name.
diff --git a/kernel/trace/trace_events_synth.c b/kernel/trace/trace_events_synth.c
index 969f48742d72..33cfbd4ed76d 100644
--- a/kernel/trace/trace_events_synth.c
+++ b/kernel/trace/trace_events_synth.c
@@ -370,7 +370,6 @@ static enum print_line_t print_synth_event(struct trace_iterator *iter,
 				union trace_synth_field *data = &entry->fields[n_u64];
 
 				trace_seq_printf(s, print_fmt, se->fields[i]->name,
-						 STR_VAR_LEN_MAX,
 						 (char *)entry + data->as_dynamic.offset,
 						 i == se->n_fields - 1 ? "" : " ");
 				n_u64++;
diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 2f077d4158e5..0c357a89c58e 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -880,8 +880,6 @@ static void print_graph_retval(struct trace_seq *s, struct ftrace_graph_ent_entr
 
 		if (print_retval || print_retaddr)
 			trace_seq_puts(s, " /*");
-		else
-			trace_seq_putc(s, '\n');
 	} else {
 		print_retaddr = false;
 		trace_seq_printf(s, "} /* %ps", func);
@@ -899,7 +897,7 @@ static void print_graph_retval(struct trace_seq *s, struct ftrace_graph_ent_entr
 	}
 
 	if (!entry || print_retval || print_retaddr)
-		trace_seq_puts(s, " */\n");
+		trace_seq_puts(s, " */");
 }
 
 #else
@@ -975,7 +973,7 @@ print_graph_entry_leaf(struct trace_iterator *iter,
 		} else
 			trace_seq_puts(s, "();");
 	}
-	trace_seq_printf(s, "\n");
+	trace_seq_putc(s, '\n');
 
 	print_graph_irq(iter, graph_ret->func, TRACE_GRAPH_RET,
 			cpu, iter->ent->pid, flags);
@@ -1313,10 +1311,11 @@ print_graph_return(struct ftrace_graph_ret_entry *retentry, struct trace_seq *s,
 		 * that if the funcgraph-tail option is enabled.
 		 */
 		if (func_match && !(flags & TRACE_GRAPH_PRINT_TAIL))
-			trace_seq_puts(s, "}\n");
+			trace_seq_puts(s, "}");
 		else
-			trace_seq_printf(s, "} /* %ps */\n", (void *)func);
+			trace_seq_printf(s, "} /* %ps */", (void *)func);
 	}
+	trace_seq_putc(s, '\n');
 
 	/* Overrun */
 	if (flags & TRACE_GRAPH_PRINT_OVERRUN)
diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi-filter.tc b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi-filter.tc
new file mode 100644
index 000000000000..b6d6a312ead5
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/fgraph-multi-filter.tc
@@ -0,0 +1,177 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: ftrace - function graph filters
+# requires: set_ftrace_filter function_graph:tracer
+
+# Make sure that function graph filtering works
+
+INSTANCE1="instances/test1_$$"
+INSTANCE2="instances/test2_$$"
+
+WD=`pwd`
+
+do_reset() {
+    cd $WD
+    if [ -d $INSTANCE1 ]; then
+	echo nop > $INSTANCE1/current_tracer
+	rmdir $INSTANCE1
+    fi
+    if [ -d $INSTANCE2 ]; then
+	echo nop > $INSTANCE2/current_tracer
+	rmdir $INSTANCE2
+    fi
+}
+
+mkdir $INSTANCE1
+if ! grep -q function_graph $INSTANCE1/available_tracers; then
+    echo "function_graph not allowed with instances"
+    rmdir $INSTANCE1
+    exit_unsupported
+fi
+
+mkdir $INSTANCE2
+
+fail() { # msg
+    do_reset
+    echo $1
+    exit_fail
+}
+
+disable_tracing
+clear_trace
+
+function_count() {
+    search=$1
+    vsearch=$2
+
+    if [ -z "$search" ]; then
+	cat enabled_functions | wc -l
+    elif [ -z "$vsearch" ]; then
+	grep $search enabled_functions | wc -l
+    else
+	grep $search enabled_functions | grep $vsearch| wc -l
+    fi
+}
+
+set_fgraph() {
+    instance=$1
+    filter="$2"
+    notrace="$3"
+
+    echo "$filter" > $instance/set_ftrace_filter
+    echo "$notrace" > $instance/set_ftrace_notrace
+    echo function_graph > $instance/current_tracer
+}
+
+check_functions() {
+    orig_cnt=$1
+    test=$2
+
+    cnt=`function_count $test`
+    if [ $cnt -gt $orig_cnt ]; then
+	fail
+    fi
+}
+
+check_cnt() {
+    orig_cnt=$1
+    search=$2
+    vsearch=$3
+
+    cnt=`function_count $search $vsearch`
+    if [ $cnt -gt $orig_cnt ]; then
+	fail
+    fi
+}
+
+reset_graph() {
+    instance=$1
+    echo nop > $instance/current_tracer
+}
+
+# get any functions that were enabled before the test
+total_cnt=`function_count`
+sched_cnt=`function_count sched`
+lock_cnt=`function_count lock`
+time_cnt=`function_count time`
+clock_cnt=`function_count clock`
+locks_clock_cnt=`function_count locks clock`
+clock_locks_cnt=`function_count clock locks`
+
+# Trace functions with "sched" but not "time"
+set_fgraph $INSTANCE1 '*sched*' '*time*'
+
+# Make sure "time" isn't listed
+check_functions $time_cnt 'time'
+instance1_cnt=`function_count`
+
+# Trace functions with "lock" but not "clock"
+set_fgraph $INSTANCE2 '*lock*' '*clock*'
+instance1_2_cnt=`function_count`
+
+# Turn off the first instance
+reset_graph $INSTANCE1
+
+# The second instance doesn't trace "clock" functions
+check_functions $clock_cnt 'clock'
+instance2_cnt=`function_count`
+
+# Start from a clean slate
+reset_graph $INSTANCE2
+check_functions $total_cnt
+
+# Trace functions with "lock" but not "clock"
+set_fgraph $INSTANCE2 '*lock*' '*clock*'
+
+# This should match the last time instance 2 was by itself
+cnt=`function_count`
+if [ $instance2_cnt -ne $cnt ]; then
+    fail
+fi
+
+# And it should not be tracing "clock" functions
+check_functions $clock_cnt 'clock'
+
+# Trace functions with "sched" but not "time"
+set_fgraph $INSTANCE1 '*sched*' '*time*'
+
+# This should match the last time both instances were enabled
+cnt=`function_count`
+if [ $instance1_2_cnt -ne $cnt ]; then
+    fail
+fi
+
+# Turn off the second instance
+reset_graph $INSTANCE2
+
+# This should match the last time instance 1 was by itself
+cnt=`function_count`
+if [ $instance1_cnt -ne $cnt ]; then
+    fail
+fi
+
+# And it should not be tracing "time" functions
+check_functions $time_cnt 'time'
+
+# Start from a clean slate
+reset_graph $INSTANCE1
+check_functions $total_cnt
+
+# Enable all functions but those that have "locks"
+set_fgraph $INSTANCE1 '' '*locks*'
+
+# Enable all functions but those that have "clock"
+set_fgraph $INSTANCE2 '' '*clock*'
+
+# If a function has "locks" it should not have "clock"
+check_cnt $locks_clock_cnt locks clock
+
+# If a function has "clock" it should not have "locks"
+check_cnt $clock_locks_cnt clock locks
+
+reset_graph $INSTANCE1
+reset_graph $INSTANCE2
+
+do_reset
+
+exit 0
