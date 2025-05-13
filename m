Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E5E2BE0E4
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148510; cv=none; b=YIFEpnocIXkvwycpdJRv3+5KuJYyn5B4S2ipUWA5PCLmznkoEVpUeywfY+K8L4m+xExHVtwpJdUPGNWykLs2QCy1vlfI7j4ryHaYaGJxwk3rzi/+flj4jSOrRPnJZy4CHPvPEAuQEHwMXB7tYU4eYfg4go4VTXnhEfnrPxOUTTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148510; c=relaxed/simple;
	bh=kONZAvhGEi6uOdZ2/TxfDSiBOipY2gXAae9qyRRqPTM=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=O/9/k57FZgVIQQ5oOlh+H+0/0vF8A/rm/h8Opr7+v4tRN8UugFcjXQdcs5z/E9luONP/tO8D6P/KhXEzDdLDA+IbaodR3PTbq9nH9WlnVYgEOVY0/D/YDetvk2ZL+UJmrMUsKnhjRpa+xjlPeo0lkgvOskfBkVcnIDgLGeLzZaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zg/L+jzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zg/L+jzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244F2C4AF0B;
	Tue, 13 May 2025 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747148509;
	bh=kONZAvhGEi6uOdZ2/TxfDSiBOipY2gXAae9qyRRqPTM=;
	h=Date:From:To:Cc:Subject:From;
	b=Zg/L+jzKgUM/oOT/RZa3Cgwj/3zvagKOOtWHER+efb8V7bPPBK8ZWfQJ5eSy1JNnZ
	 zQqnJ895qHvdzhAzQnT4Opo572hglDGNorbWKSMlL3Z179QEwa40ZMzsJjlet2E8G2
	 8MgJfPqx2DCX4IXL+EwFu5l5A6zWpZDGyivwvnoOwjWCfTw35xVJz2Br5qR7Ip2M46
	 q5JZXVeHSAcW1xaNK79zbsf/glye+iVYRwCHQaSjknyDHbG44aYyN8w1tyWxQ8BHQL
	 803WyegJkKyOGNYt0Qm6t3glyVweoF2zwCBooghz0lYGniXUw6d+xQl6UxkO8s4AVw
	 gmMF8IhTYhKxg==
Date: Wed, 14 May 2025 00:01:44 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Masami Hiramatsu (Google)
 <mhiramat@kernel.org>, Paul Cacheux <paulcacheux@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] probes: Fixes for v6.15-rc6
Message-Id: <20250514000144.f10ca2b6b996e10c6ff177d6@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Probes fixes for v6.15-rc6:

- fprobe: Fix RCU warning message in list traversal
  fprobe_module_callback() using hlist_for_each_entry_rcu() traverse
  the fprobe list but it locks fprobe_mutex() instead of rcu lock
  because it is enough. So add lockdep_is_held() to avoid warning.

- tracing: eprobe: Add missing trace_probe_log_clear for eprobe
  __trace_eprobe_create() uses trace_probe_log but forgot to clear
  it at exit. Add trace_probe_log_clear() calls.

- tracing: probes: Fix possible race in trace_probe_log APIs
  trace_probe_log APIs are used in probe event (dynamic_events,
  kprobe_events and uprobe_events) creation. Only dynamic_events uses
  the dyn_event_ops_mutex mutex to serialize it. This makes kprobe and
  uprobe events to lock the same mutex to serialize its creation to
  avoid race in trace_probe_log APIs.


Please pull the latest probes-fixes-v6.15-rc6 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
probes-fixes-v6.15-rc6

Tag SHA1: f89fdfff7ff5f4b38c783b466e4f78032ce9cea5
Head SHA1: fd837de3c9cb1a162c69bc1fb1f438467fe7f2f5


Breno Leitao (1):
      tracing: fprobe: Fix RCU warning message in list traversal

Masami Hiramatsu (Google) (1):
      tracing: probes: Fix a possible race in trace_probe_log APIs

Paul Cacheux (1):
      tracing: add missing trace_probe_log_clear for eprobes

----
 kernel/trace/fprobe.c         |  3 ++-
 kernel/trace/trace_dynevent.c | 16 +++++++++++++++-
 kernel/trace/trace_dynevent.h |  1 +
 kernel/trace/trace_eprobe.c   |  3 +++
 kernel/trace/trace_kprobe.c   |  2 +-
 kernel/trace/trace_probe.c    |  9 +++++++++
 kernel/trace/trace_uprobe.c   |  2 +-
 7 files changed, 32 insertions(+), 4 deletions(-)
---------------------------
diff --git a/kernel/trace/fprobe.c b/kernel/trace/fprobe.c
index 95c6e3473a76..ba7ff14f5339 100644
--- a/kernel/trace/fprobe.c
+++ b/kernel/trace/fprobe.c
@@ -454,7 +454,8 @@ static void fprobe_remove_node_in_module(struct module *mod, struct hlist_head *
 	struct fprobe_hlist_node *node;
 	int ret = 0;
 
-	hlist_for_each_entry_rcu(node, head, hlist) {
+	hlist_for_each_entry_rcu(node, head, hlist,
+				 lockdep_is_held(&fprobe_mutex)) {
 		if (!within_module(node->addr, mod))
 			continue;
 		if (delete_fprobe_node(node))
diff --git a/kernel/trace/trace_dynevent.c b/kernel/trace/trace_dynevent.c
index a322e4f249a5..5d64a18cacac 100644
--- a/kernel/trace/trace_dynevent.c
+++ b/kernel/trace/trace_dynevent.c
@@ -16,7 +16,7 @@
 #include "trace_output.h"	/* for trace_event_sem */
 #include "trace_dynevent.h"
 
-static DEFINE_MUTEX(dyn_event_ops_mutex);
+DEFINE_MUTEX(dyn_event_ops_mutex);
 static LIST_HEAD(dyn_event_ops_list);
 
 bool trace_event_dyn_try_get_ref(struct trace_event_call *dyn_call)
@@ -116,6 +116,20 @@ int dyn_event_release(const char *raw_command, struct dyn_event_operations *type
 	return ret;
 }
 
+/*
+ * Locked version of event creation. The event creation must be protected by
+ * dyn_event_ops_mutex because of protecting trace_probe_log.
+ */
+int dyn_event_create(const char *raw_command, struct dyn_event_operations *type)
+{
+	int ret;
+
+	mutex_lock(&dyn_event_ops_mutex);
+	ret = type->create(raw_command);
+	mutex_unlock(&dyn_event_ops_mutex);
+	return ret;
+}
+
 static int create_dyn_event(const char *raw_command)
 {
 	struct dyn_event_operations *ops;
diff --git a/kernel/trace/trace_dynevent.h b/kernel/trace/trace_dynevent.h
index 936477a111d3..beee3f8d7544 100644
--- a/kernel/trace/trace_dynevent.h
+++ b/kernel/trace/trace_dynevent.h
@@ -100,6 +100,7 @@ void *dyn_event_seq_next(struct seq_file *m, void *v, loff_t *pos);
 void dyn_event_seq_stop(struct seq_file *m, void *v);
 int dyn_events_release_all(struct dyn_event_operations *type);
 int dyn_event_release(const char *raw_command, struct dyn_event_operations *type);
+int dyn_event_create(const char *raw_command, struct dyn_event_operations *type);
 
 /*
  * for_each_dyn_event	-	iterate over the dyn_event list
diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
index c08355c3ef32..916555f0de81 100644
--- a/kernel/trace/trace_eprobe.c
+++ b/kernel/trace/trace_eprobe.c
@@ -969,10 +969,13 @@ static int __trace_eprobe_create(int argc, const char *argv[])
 			goto error;
 		}
 	}
+	trace_probe_log_clear();
 	return ret;
+
 parse_error:
 	ret = -EINVAL;
 error:
+	trace_probe_log_clear();
 	trace_event_probe_cleanup(ep);
 	return ret;
 }
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index 2703b96d8990..3e5c47b6d7b2 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -1089,7 +1089,7 @@ static int create_or_delete_trace_kprobe(const char *raw_command)
 	if (raw_command[0] == '-')
 		return dyn_event_release(raw_command, &trace_kprobe_ops);
 
-	ret = trace_kprobe_create(raw_command);
+	ret = dyn_event_create(raw_command, &trace_kprobe_ops);
 	return ret == -ECANCELED ? -EINVAL : ret;
 }
 
diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index 2eeecb6c95ee..424751cdf31f 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -154,9 +154,12 @@ static const struct fetch_type *find_fetch_type(const char *type, unsigned long
 }
 
 static struct trace_probe_log trace_probe_log;
+extern struct mutex dyn_event_ops_mutex;
 
 void trace_probe_log_init(const char *subsystem, int argc, const char **argv)
 {
+	lockdep_assert_held(&dyn_event_ops_mutex);
+
 	trace_probe_log.subsystem = subsystem;
 	trace_probe_log.argc = argc;
 	trace_probe_log.argv = argv;
@@ -165,11 +168,15 @@ void trace_probe_log_init(const char *subsystem, int argc, const char **argv)
 
 void trace_probe_log_clear(void)
 {
+	lockdep_assert_held(&dyn_event_ops_mutex);
+
 	memset(&trace_probe_log, 0, sizeof(trace_probe_log));
 }
 
 void trace_probe_log_set_index(int index)
 {
+	lockdep_assert_held(&dyn_event_ops_mutex);
+
 	trace_probe_log.index = index;
 }
 
@@ -178,6 +185,8 @@ void __trace_probe_log_err(int offset, int err_type)
 	char *command, *p;
 	int i, len = 0, pos = 0;
 
+	lockdep_assert_held(&dyn_event_ops_mutex);
+
 	if (!trace_probe_log.argv)
 		return;
 
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 3386439ec9f6..35cf76c75dd7 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -741,7 +741,7 @@ static int create_or_delete_trace_uprobe(const char *raw_command)
 	if (raw_command[0] == '-')
 		return dyn_event_release(raw_command, &trace_uprobe_ops);
 
-	ret = trace_uprobe_create(raw_command);
+	ret = dyn_event_create(raw_command, &trace_uprobe_ops);
 	return ret == -ECANCELED ? -EINVAL : ret;
 }
 
-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
