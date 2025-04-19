Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1BC29D0E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745087220; cv=none; b=XhA2UkatTx2jGlYE01BHExizl869rEG63i24K5Czbd0ejejg0dUPYDfoY3LpDwzT3aHojkLwzCGh2LjuZeafHlJN25M7cuNn2f7j5shyahloM9uaWW+Mli3AYfTCfrzHbwbmw1lhCYQPJPyVYs3LMvmABrFdZaFTaCCYA7WSoPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745087220; c=relaxed/simple;
	bh=qKgGq/TyqrDBqM4hBzCIRjp793J9RexgoB+12wpSNOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X7d9wiA6V9KC2gKAzvpqEPz80aXOS3kGB/K3/jMd33kZ7ERUb7Xcdo836X4oaPRNaQ4c2hvNOqiFNkwGLgMIcWI0Qy5rl9BfxBgSqYRx9Lttobf3TIlxtvIKdCAFd+fohd8592HrA7inAumKVe5ueLdl43oCCRQT9LsxBFasLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F187CC4CEE7;
	Sat, 19 Apr 2025 18:26:58 +0000 (UTC)
Date: Sat, 19 Apr 2025 14:28:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Menglong
 Dong <menglong8.dong@gmail.com>
Subject: [GIT PULL] tracing: Fixes for v6.15
Message-ID: <20250419142842.676b6bc6@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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

- Initialize hash variables in ftrace subops logic

  The fix that simplified the ftrace subops logic opened a path where some
  variables could be used without being initialized, and done subtly where
  the compiler did not catch it. Initialize those variables to the
  EMPTY_HASH, which is the default hash.

- Reinitialize the hash pointers after they are freed

  Some of the hash pointers in the subop logic were freed but may still be
  referenced later. To prevent use-after-free bugs, initialize them back to
  the EMPTY_HASH.

- Free the ftrace hashes when they are replaced

  The fix that simplified the subops logic updated some hash pointers, but
  left the original hash that they were pointing to where they are no longer
  used. This caused a memory leak. Free the hashes that are pointed to by
  the pointers when they are replaced.

- Fix size initialization of ftrace direct function hash

  The ftrace direct function hash used by BPF initialized the hash size
  incorrectly. It checked the size of items to a hard coded 32, which made
  the hash bit size of 5. The hash size is supposed to be limited by the bit
  size of the hash, as the bitmask is allowed to be greater than 5. Rework
  the size check to first pass the number of elements to fls() and then
  compare that to FTRACE_HASH_MAX_BITS before allocating the hash.

- Fix format output of ftrace_graph_ent_entry event

  The field depth of the ftrace_graph_ent_entry event is of size 4 but the
  output showed it as unsigned long and use "%lu". Change it to unsigned int
  and use "%u" in the print format that is displayed to user space.

- Fix the trace event filter on strings

  Events can be filtered on numbers or string values. The return value
  checked from strncpy_from_kernel_nofault() and strncpy_from_user_nofault()
  was used to determine if reading the strings would fault or not. It would
  return fault if the value was non zero, which basically meant that it
  was always considering the read as a fault.

- Add selftest to test trace event string filtering

  In order to catch the breakage of the string filtering, add a self test to
  make sure that it continues to work.


Please pull the latest trace-v6.15-rc2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.15-rc2

Tag SHA1: d35e39873a50c9cae63eddfa79ab3e5d545de69a
Head SHA1: d481ee35247d2a01764667a25f6f512c292ba42d


Ilya Leoshkevich (1):
      ftrace: Fix type of ftrace_graph_ent_entry.depth

Menglong Dong (1):
      ftrace: fix incorrect hash size in register_ftrace_direct()

Steven Rostedt (5):
      ftrace: Initialize variables for ftrace_startup/shutdown_subops()
      ftrace: Reinitialize hash to EMPTY_HASH after freeing
      ftrace: Free ftrace hashes after they are replaced in the subops code
      tracing: Fix filter string testing
      tracing: selftests: Add testing a user string to filters

----
 kernel/trace/ftrace.c                              | 27 +++++++++++++++-------
 kernel/trace/trace_entries.h                       |  4 ++--
 kernel/trace/trace_events_filter.c                 |  4 ++--
 .../ftrace/test.d/filter/event-filter-function.tc  | 20 ++++++++++++++++
 4 files changed, 43 insertions(+), 12 deletions(-)
---------------------------
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index a8a02868b435..61130bb34d6c 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1297,6 +1297,8 @@ void ftrace_free_filter(struct ftrace_ops *ops)
 		return;
 	free_ftrace_hash(ops->func_hash->filter_hash);
 	free_ftrace_hash(ops->func_hash->notrace_hash);
+	ops->func_hash->filter_hash = EMPTY_HASH;
+	ops->func_hash->notrace_hash = EMPTY_HASH;
 }
 EXPORT_SYMBOL_GPL(ftrace_free_filter);
 
@@ -3443,6 +3445,7 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
 				  size_bits);
 		if (ret < 0) {
 			free_ftrace_hash(*filter_hash);
+			*filter_hash = EMPTY_HASH;
 			return ret;
 		}
 	}
@@ -3472,6 +3475,7 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
 				     subops_hash->notrace_hash);
 		if (ret < 0) {
 			free_ftrace_hash(*notrace_hash);
+			*notrace_hash = EMPTY_HASH;
 			return ret;
 		}
 	}
@@ -3490,8 +3494,8 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
  */
 int ftrace_startup_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
 {
-	struct ftrace_hash *filter_hash;
-	struct ftrace_hash *notrace_hash;
+	struct ftrace_hash *filter_hash = EMPTY_HASH;
+	struct ftrace_hash *notrace_hash = EMPTY_HASH;
 	struct ftrace_hash *save_filter_hash;
 	struct ftrace_hash *save_notrace_hash;
 	int ret;
@@ -3605,6 +3609,9 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
 			}
 		}
 
+		free_ftrace_hash(temp_hash.filter_hash);
+		free_ftrace_hash(temp_hash.notrace_hash);
+
 		temp_hash.filter_hash = *filter_hash;
 		temp_hash.notrace_hash = *notrace_hash;
 	}
@@ -3625,8 +3632,8 @@ static int rebuild_hashes(struct ftrace_hash **filter_hash, struct ftrace_hash *
  */
 int ftrace_shutdown_subops(struct ftrace_ops *ops, struct ftrace_ops *subops, int command)
 {
-	struct ftrace_hash *filter_hash;
-	struct ftrace_hash *notrace_hash;
+	struct ftrace_hash *filter_hash = EMPTY_HASH;
+	struct ftrace_hash *notrace_hash = EMPTY_HASH;
 	int ret;
 
 	if (unlikely(ftrace_disabled))
@@ -3699,8 +3706,11 @@ static int ftrace_hash_move_and_update_subops(struct ftrace_ops *subops,
 	}
 
 	ret = rebuild_hashes(&filter_hash, &notrace_hash, ops);
-	if (!ret)
+	if (!ret) {
 		ret = ftrace_update_ops(ops, filter_hash, notrace_hash);
+		free_ftrace_hash(filter_hash);
+		free_ftrace_hash(notrace_hash);
+	}
 
 	if (ret) {
 		/* Put back the original hash */
@@ -5954,9 +5964,10 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	/* Make a copy hash to place the new and the old entries in */
 	size = hash->count + direct_functions->count;
-	if (size > 32)
-		size = 32;
-	new_hash = alloc_ftrace_hash(fls(size));
+	size = fls(size);
+	if (size > FTRACE_HASH_MAX_BITS)
+		size = FTRACE_HASH_MAX_BITS;
+	new_hash = alloc_ftrace_hash(size);
 	if (!new_hash)
 		goto out_unlock;
 
diff --git a/kernel/trace/trace_entries.h b/kernel/trace/trace_entries.h
index ee40d4e6ad1c..4ef4df6623a8 100644
--- a/kernel/trace/trace_entries.h
+++ b/kernel/trace/trace_entries.h
@@ -80,11 +80,11 @@ FTRACE_ENTRY(funcgraph_entry, ftrace_graph_ent_entry,
 	F_STRUCT(
 		__field_struct(	struct ftrace_graph_ent,	graph_ent	)
 		__field_packed(	unsigned long,	graph_ent,	func		)
-		__field_packed(	unsigned long,	graph_ent,	depth		)
+		__field_packed(	unsigned int,	graph_ent,	depth		)
 		__dynamic_array(unsigned long,	args				)
 	),
 
-	F_printk("--> %ps (%lu)", (void *)__entry->func, __entry->depth)
+	F_printk("--> %ps (%u)", (void *)__entry->func, __entry->depth)
 );
 
 #ifdef CONFIG_FUNCTION_GRAPH_RETADDR
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 0993dfc1c5c1..2048560264bb 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -808,7 +808,7 @@ static __always_inline char *test_string(char *str)
 	kstr = ubuf->buffer;
 
 	/* For safety, do not trust the string pointer */
-	if (!strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE))
+	if (strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE) < 0)
 		return NULL;
 	return kstr;
 }
@@ -827,7 +827,7 @@ static __always_inline char *test_ustring(char *str)
 
 	/* user space address? */
 	ustr = (char __user *)str;
-	if (!strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE))
+	if (strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE) < 0)
 		return NULL;
 
 	return kstr;
diff --git a/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc b/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc
index 118247b8dd84..c62165fabd0c 100644
--- a/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc
+++ b/tools/testing/selftests/ftrace/test.d/filter/event-filter-function.tc
@@ -80,6 +80,26 @@ if [ $misscnt -gt 0 ]; then
 	exit_fail
 fi
 
+# Check strings too
+if [ -f events/syscalls/sys_enter_openat/filter ]; then
+	DIRNAME=`basename $TMPDIR`
+	echo "filename.ustring ~ \"*$DIRNAME*\"" > events/syscalls/sys_enter_openat/filter
+	echo 1 > events/syscalls/sys_enter_openat/enable
+	echo 1 > tracing_on
+	ls /bin/sh
+	nocnt=`grep openat trace | wc -l`
+	ls $TMPDIR
+	echo 0 > tracing_on
+	hitcnt=`grep openat trace | wc -l`;
+	echo 0 > events/syscalls/sys_enter_openat/enable
+	if [ $nocnt -gt 0 ]; then
+		exit_fail
+	fi
+	if [ $hitcnt -eq 0 ]; then
+		exit_fail
+	fi
+fi
+
 reset_events_filter
 
 exit 0
