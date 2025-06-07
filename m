Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE361DED4C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749324886; cv=none; b=NAv1MAVhGO73k8cD8IdGnt7FNqLYhiAvXqIlByX5UTTbtCp60ivkf4u4kGoua8IYgam3/hUvJB5GjgdY6vfJQv7/VUzn5IUbGjVXSMEdtx68lqWD5eqOAGl6ZEscCMaNu4T0NnWigCa/3j38dYgwceHRADeI6kouqgMZR7p0i6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749324886; c=relaxed/simple;
	bh=uOt2MOk0dr45O3s56iw1ssSoSNrUsVzLCLq4/NDIx0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hJxgsdRLv3AIz4gCMexCEmS4WRKo+6NwDYL8CQQQil1Zq19xOOFdI6GRgMxS1tYBBipuMC+/p7bf+bMQM58b5J0NNX0opaaNdy6rkIBV6+up4agiJp20yajygngk5fmwQAYU/ODuUyIMzpPwB1Ldp6xvPaRhiY9AtnnJO8z+Irk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 6E19DC270C;
	Sat,  7 Jun 2025 19:34:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id B2E2120011;
	Sat,  7 Jun 2025 19:34:40 +0000 (UTC)
Date: Sat, 7 Jun 2025 15:36:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dmitry Antipov <dmantipov@yandex.ru>
Subject: [GIT PULL] tracing: More fixes for v6.16
Message-ID: <20250607153604.3c67f93c@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B2E2120011
X-Stat-Signature: yspanjf67p4gdkem63w9a9qm8ztq51tn
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+ixGR5wHwIJRkpdxQMIleYRDYPZcxF7Ps=
X-HE-Tag: 1749324880-717542
X-HE-Meta: U2FsdGVkX187A25M/TER5KPnqfTdw/Toe84qg5HAC0ptN13mk4v8KbAqLePFfoxez6JUTxXye7U1nSBd47hSNPJOnSlb01r79UksYIIKe8JYsFEj4XpoeC8kC0Cs7JH16ZdKy6mFlLzXFHQH5hTj/UMIan1ds+tgGl/YloZRPsdsJr/9UguKgnEnA9DGApQAZDPZs2VLUkuZj4RMJdncVrKfIW1wUL2SjdJGWeGvO5N4SnD5ACZvl+h4bcST+F2RDcX28vCsRAVQ/uugLkXXJTC3o2jh/OOcr1ui0ZI/NCytGcokWk/3Cuktpkxz2J4cNkIHyW5569g7+rI732CGMIA0Gu7Mly/9


Linus,

tracing fixes:

- Fix regression of waiting a long time on updating trace event filters

  When the faultable trace points were added, it needed task trace RCU
  synchronization. This was added to the tracepoint_synchronize_unregister()
  function. The filter logic always called this function whenever it
  updated the trace event filters before freeing the old filters.
  This increased the time of "trace-cmd record" from taking 13 seconds
  to running over 2 minutes to complete.

  Move the freeing of the filters to call_rcu*() logic, which brings the
  time back down to 13 seconds.

- Fix ring_buffer_subbuf_order_set() error path lock protection

  The error path of the ring_buffer_subbuf_order_set() released the
  mutex too early and allowed subsequent accesses to setting the
  subbuffer size to corrupt the data and cause a bug.

  By moving the mutex locking to the end of the error path, it prevents
  the reentrant access to the critical data and also allows the function
  to convert the taking of the mutex over to the guard() logic.

- Remove unused power management clock events

  The clock events were added in 2010 for power management. In 2011
  arm used them. In 2013 the code they were used in was removed.
  These events have been wasting memory since then.

- Fix sparse warnings

  There was a few places that sparse warned about trace_events_filter.c
  where file->filter was referenced directly, but it is annotated with
  an __rcu tag. Use the helper functions and fix them up to use
  rcu_dereference() properly.


Please pull the latest trace-v6.16-3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.16-3

Tag SHA1: 0493bdcf4e91f26b0ab80135740f5e2117ad8323
Head SHA1: 549e914c96ae67760f36b9714b424dc992a0a69b


Dmitry Antipov (1):
      ring-buffer: Fix buffer locking in ring_buffer_subbuf_order_set()

Steven Rostedt (3):
      tracing: Fix regression of filter waiting a long time on RCU synchronization
      tracing: PM: Remove unused clock events
      tracing: Add rcu annotation around file->filter accesses

----
 include/trace/events/power.h       |  47 ---------
 kernel/trace/ring_buffer.c         |   4 +-
 kernel/trace/trace_events_filter.c | 192 +++++++++++++++++++++++++++----------
 3 files changed, 143 insertions(+), 100 deletions(-)
---------------------------
diff --git a/include/trace/events/power.h b/include/trace/events/power.h
index 9253e83b9bb4..6c631eec23e3 100644
--- a/include/trace/events/power.h
+++ b/include/trace/events/power.h
@@ -337,53 +337,6 @@ DEFINE_EVENT(wakeup_source, wakeup_source_deactivate,
 	TP_ARGS(name, state)
 );
 
-/*
- * The clock events are used for clock enable/disable and for
- *  clock rate change
- */
-DECLARE_EVENT_CLASS(clock,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id),
-
-	TP_STRUCT__entry(
-		__string(       name,           name            )
-		__field(        u64,            state           )
-		__field(        u64,            cpu_id          )
-	),
-
-	TP_fast_assign(
-		__assign_str(name);
-		__entry->state = state;
-		__entry->cpu_id = cpu_id;
-	),
-
-	TP_printk("%s state=%lu cpu_id=%lu", __get_str(name),
-		(unsigned long)__entry->state, (unsigned long)__entry->cpu_id)
-);
-
-DEFINE_EVENT(clock, clock_enable,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id)
-);
-
-DEFINE_EVENT(clock, clock_disable,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id)
-);
-
-DEFINE_EVENT(clock, clock_set_rate,
-
-	TP_PROTO(const char *name, unsigned int state, unsigned int cpu_id),
-
-	TP_ARGS(name, state, cpu_id)
-);
-
 /*
  * The power domain events are used for power domains transitions
  */
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index e24509bd0af5..00fc38d70e86 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6795,7 +6795,7 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	old_size = buffer->subbuf_size;
 
 	/* prevent another thread from changing buffer sizes */
-	mutex_lock(&buffer->mutex);
+	guard(mutex)(&buffer->mutex);
 	atomic_inc(&buffer->record_disabled);
 
 	/* Make sure all commits have finished */
@@ -6900,7 +6900,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	}
 
 	atomic_dec(&buffer->record_disabled);
-	mutex_unlock(&buffer->mutex);
 
 	return 0;
 
@@ -6909,7 +6908,6 @@ int ring_buffer_subbuf_order_set(struct trace_buffer *buffer, int order)
 	buffer->subbuf_size = old_size;
 
 	atomic_dec(&buffer->record_disabled);
-	mutex_unlock(&buffer->mutex);
 
 	for_each_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 2048560264bb..ea8b364b6818 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1250,7 +1250,9 @@ static void append_filter_err(struct trace_array *tr,
 
 static inline struct event_filter *event_filter(struct trace_event_file *file)
 {
-	return file->filter;
+	return rcu_dereference_protected(file->filter,
+					 lockdep_is_held(&event_mutex));
+
 }
 
 /* caller must hold event_mutex */
@@ -1320,7 +1322,7 @@ void free_event_filter(struct event_filter *filter)
 static inline void __remove_filter(struct trace_event_file *file)
 {
 	filter_disable(file);
-	remove_filter_string(file->filter);
+	remove_filter_string(event_filter(file));
 }
 
 static void filter_free_subsystem_preds(struct trace_subsystem_dir *dir,
@@ -1335,22 +1337,139 @@ static void filter_free_subsystem_preds(struct trace_subsystem_dir *dir,
 	}
 }
 
+struct filter_list {
+	struct list_head	list;
+	struct event_filter	*filter;
+};
+
+struct filter_head {
+	struct list_head	list;
+	struct rcu_head		rcu;
+};
+
+
+static void free_filter_list(struct rcu_head *rhp)
+{
+	struct filter_head *filter_list = container_of(rhp, struct filter_head, rcu);
+	struct filter_list *filter_item, *tmp;
+
+	list_for_each_entry_safe(filter_item, tmp, &filter_list->list, list) {
+		__free_filter(filter_item->filter);
+		list_del(&filter_item->list);
+		kfree(filter_item);
+	}
+	kfree(filter_list);
+}
+
+static void free_filter_list_tasks(struct rcu_head *rhp)
+{
+	call_rcu(rhp, free_filter_list);
+}
+
+/*
+ * The tracepoint_synchronize_unregister() is a double rcu call.
+ * It calls synchronize_rcu_tasks_trace() followed by synchronize_rcu().
+ * Instead of waiting for it, simply call these via the call_rcu*()
+ * variants.
+ */
+static void delay_free_filter(struct filter_head *head)
+{
+	call_rcu_tasks_trace(&head->rcu, free_filter_list_tasks);
+}
+
+static void try_delay_free_filter(struct event_filter *filter)
+{
+	struct filter_head *head;
+	struct filter_list *item;
+
+	head = kmalloc(sizeof(*head), GFP_KERNEL);
+	if (!head)
+		goto free_now;
+
+	INIT_LIST_HEAD(&head->list);
+
+	item = kmalloc(sizeof(*item), GFP_KERNEL);
+	if (!item) {
+		kfree(head);
+		goto free_now;
+	}
+
+	item->filter = filter;
+	list_add_tail(&item->list, &head->list);
+	delay_free_filter(head);
+	return;
+
+ free_now:
+	/* Make sure the filter is not being used */
+	tracepoint_synchronize_unregister();
+	__free_filter(filter);
+}
+
 static inline void __free_subsystem_filter(struct trace_event_file *file)
 {
-	__free_filter(file->filter);
+	__free_filter(event_filter(file));
 	file->filter = NULL;
 }
 
+static inline void event_set_filter(struct trace_event_file *file,
+				    struct event_filter *filter)
+{
+	rcu_assign_pointer(file->filter, filter);
+}
+
+static inline void event_clear_filter(struct trace_event_file *file)
+{
+	RCU_INIT_POINTER(file->filter, NULL);
+}
+
 static void filter_free_subsystem_filters(struct trace_subsystem_dir *dir,
-					  struct trace_array *tr)
+					  struct trace_array *tr,
+					  struct event_filter *filter)
 {
 	struct trace_event_file *file;
+	struct filter_head *head;
+	struct filter_list *item;
+
+	head = kmalloc(sizeof(*head), GFP_KERNEL);
+	if (!head)
+		goto free_now;
+
+	INIT_LIST_HEAD(&head->list);
+
+	item = kmalloc(sizeof(*item), GFP_KERNEL);
+	if (!item) {
+		kfree(head);
+		goto free_now;
+	}
+
+	item->filter = filter;
+	list_add_tail(&item->list, &head->list);
 
 	list_for_each_entry(file, &tr->events, list) {
 		if (file->system != dir)
 			continue;
+		item = kmalloc(sizeof(*item), GFP_KERNEL);
+		if (!item)
+			goto free_now;
+		item->filter = event_filter(file);
+		list_add_tail(&item->list, &head->list);
+		event_clear_filter(file);
+	}
+
+	delay_free_filter(head);
+	return;
+ free_now:
+	tracepoint_synchronize_unregister();
+
+	if (head)
+		free_filter_list(&head->rcu);
+
+	list_for_each_entry(file, &tr->events, list) {
+		if (file->system != dir || !file->filter)
+			continue;
 		__free_subsystem_filter(file);
 	}
+	__free_filter(filter);
 }
 
 int filter_assign_type(const char *type)
@@ -2120,22 +2239,6 @@ static inline void event_set_filtered_flag(struct trace_event_file *file)
 		trace_buffered_event_enable();
 }
 
-static inline void event_set_filter(struct trace_event_file *file,
-				    struct event_filter *filter)
-{
-	rcu_assign_pointer(file->filter, filter);
-}
-
-static inline void event_clear_filter(struct trace_event_file *file)
-{
-	RCU_INIT_POINTER(file->filter, NULL);
-}
-
-struct filter_list {
-	struct list_head	list;
-	struct event_filter	*filter;
-};
-
 static int process_system_preds(struct trace_subsystem_dir *dir,
 				struct trace_array *tr,
 				struct filter_parse_error *pe,
@@ -2144,11 +2247,16 @@ static int process_system_preds(struct trace_subsystem_dir *dir,
 	struct trace_event_file *file;
 	struct filter_list *filter_item;
 	struct event_filter *filter = NULL;
-	struct filter_list *tmp;
-	LIST_HEAD(filter_list);
+	struct filter_head *filter_list;
 	bool fail = true;
 	int err;
 
+	filter_list = kmalloc(sizeof(*filter_list), GFP_KERNEL);
+	if (!filter_list)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&filter_list->list);
+
 	list_for_each_entry(file, &tr->events, list) {
 
 		if (file->system != dir)
@@ -2175,7 +2283,7 @@ static int process_system_preds(struct trace_subsystem_dir *dir,
 		if (!filter_item)
 			goto fail_mem;
 
-		list_add_tail(&filter_item->list, &filter_list);
+		list_add_tail(&filter_item->list, &filter_list->list);
 		/*
 		 * Regardless of if this returned an error, we still
 		 * replace the filter for the call.
@@ -2195,31 +2303,22 @@ static int process_system_preds(struct trace_subsystem_dir *dir,
 	 * Do a synchronize_rcu() and to ensure all calls are
 	 * done with them before we free them.
 	 */
-	tracepoint_synchronize_unregister();
-	list_for_each_entry_safe(filter_item, tmp, &filter_list, list) {
-		__free_filter(filter_item->filter);
-		list_del(&filter_item->list);
-		kfree(filter_item);
-	}
+	delay_free_filter(filter_list);
 	return 0;
  fail:
 	/* No call succeeded */
-	list_for_each_entry_safe(filter_item, tmp, &filter_list, list) {
-		list_del(&filter_item->list);
-		kfree(filter_item);
-	}
+	free_filter_list(&filter_list->rcu);
 	parse_error(pe, FILT_ERR_BAD_SUBSYS_FILTER, 0);
 	return -EINVAL;
  fail_mem:
 	__free_filter(filter);
+
 	/* If any call succeeded, we still need to sync */
 	if (!fail)
-		tracepoint_synchronize_unregister();
-	list_for_each_entry_safe(filter_item, tmp, &filter_list, list) {
-		__free_filter(filter_item->filter);
-		list_del(&filter_item->list);
-		kfree(filter_item);
-	}
+		delay_free_filter(filter_list);
+	else
+		free_filter_list(&filter_list->rcu);
+
 	return -ENOMEM;
 }
 
@@ -2361,9 +2460,7 @@ int apply_event_filter(struct trace_event_file *file, char *filter_string)
 
 		event_clear_filter(file);
 
-		/* Make sure the filter is not being used */
-		tracepoint_synchronize_unregister();
-		__free_filter(filter);
+		try_delay_free_filter(filter);
 
 		return 0;
 	}
@@ -2387,11 +2484,8 @@ int apply_event_filter(struct trace_event_file *file, char *filter_string)
 
 		event_set_filter(file, filter);
 
-		if (tmp) {
-			/* Make sure the call is done with the filter */
-			tracepoint_synchronize_unregister();
-			__free_filter(tmp);
-		}
+		if (tmp)
+			try_delay_free_filter(tmp);
 	}
 
 	return err;
@@ -2417,9 +2511,7 @@ int apply_subsystem_event_filter(struct trace_subsystem_dir *dir,
 		filter = system->filter;
 		system->filter = NULL;
 		/* Ensure all filters are no longer used */
-		tracepoint_synchronize_unregister();
-		filter_free_subsystem_filters(dir, tr);
-		__free_filter(filter);
+		filter_free_subsystem_filters(dir, tr, filter);
 		return 0;
 	}
 
