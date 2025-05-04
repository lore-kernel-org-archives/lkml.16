Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA538F91
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746376763; cv=none; b=JpEgBq2tfNJnfK+PrzIVKk5/4Nx3m8c2x9VWEsbRdu9mgslhiOifkf7VK3CCReVUFzIWl9TFal5DuZix0W8XauouwG/dwO3MEK4by9ISfh2JuQq1zo0qzg3Ex9VG0MdBGf5BkuXz4+pM2UCDDhtN6lA9e6Iim8ac1VHrB3llrXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746376763; c=relaxed/simple;
	bh=/Mx8EoOeS+Qn98L466S3AhSUqO0g6+4bMn7cT+lHINg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iA71Ht3E18fBoiMfJNBI2N+SVbVAcaVIfOvpQAlXMuSX9Tn+1N8ob5i5Ei807C1zn3+YME6OdF6cwYX+EQTK6bvDwrm70QTT3HjwHbvBqoYW2ut1vNhRpsr1X1ou5VrckRyrAv9tfNeGzLyUgQpwSqrzT5SvrWkK9eK3IeJva84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F866C4CEE7;
	Sun,  4 May 2025 16:39:22 +0000 (UTC)
Date: Sun, 4 May 2025 12:39:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Colin Ian King <colin.i.king@gmail.com>, Jeongjun Park
 <aha310510@gmail.com>
Subject: [GIT PULL] tracing: Fixes for v6.15
Message-ID: <20250504123921.641e2865@batman.local.home>
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

tracing updates for v6.15

- Fix read out of bounds bug in tracing_splice_read_pipe()

  The size of the sub page being read can now be greater than a page. But
  the buffer used in tracing_splice_read_pipe() only allocates a page size.
  The data copied to the buffer is the amount in sub buffer which can
  overflow the buffer. Use min((size_t)trace_seq_used(&iter->seq), PAGE_SIZE)
  to limit the amount copied to the buffer to a max of PAGE_SIZE.

- Fix the test for NULL from "!filter_hash" to "!*filter_hash"

  The add_next_hash() function checked for NULL at the wrong pointer level.

- Do not use the array in trace_adjust_address() if there are no elements

  The trace_adjust_address() finds the offset of a module that was stored in
  the persistent buffer when reading the previous boot buffer to see if the
  address belongs to a module that was loaded in the previous boot. An array
  is created that matches currently loaded modules with previously loaded
  modules. The trace_adjust_address() uses that array to find the new offset
  of the address that's in the previous buffer.  But if no module was
  loaded, it ends up reading the last element in an array that was never
  allocated. Check if nr_entries is zero and exit out early if it is.

- Remove nested lock of trace_event_sem in print_event_fields()

  The print_event_fields() function iterates over the ftrace_events list and
  requires the trace_event_sem semaphore held for read. But this function is
  always called with that semaphore held for read. Remove the taking of the
  semaphore and replace it with lockdep_assert_held_read(&trace_event_sem);


Please pull the latest trace-v6.15-rc4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.15-rc4

Tag SHA1: b2e4a898d100e7baf9a77ad9dbab05b7f63e4940
Head SHA1: 0a8f11f8569e7ed16cbcedeb28c4350f6378fea6


Colin Ian King (1):
      ftrace: Fix NULL memory allocation check

Jeongjun Park (1):
      tracing: Fix oob write in trace_seq_to_buffer()

Steven Rostedt (2):
      tracing: Fix trace_adjust_address() when there is no modules in scratch area
      tracing: Do not take trace_event_sem in print_event_fields()

----
 kernel/trace/ftrace.c       | 2 +-
 kernel/trace/trace.c        | 9 ++++++---
 kernel/trace/trace_output.c | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)
---------------------------
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 61130bb34d6c..6981830c3128 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3436,7 +3436,7 @@ static int add_next_hash(struct ftrace_hash **filter_hash, struct ftrace_hash **
 
 		/* Copy the subops hash */
 		*filter_hash = alloc_and_copy_ftrace_hash(size_bits, subops_hash->filter_hash);
-		if (!filter_hash)
+		if (!*filter_hash)
 			return -ENOMEM;
 		/* Remove any notrace functions from the copy */
 		remove_hash(*filter_hash, subops_hash->notrace_hash);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8ddf6b17215c..5b8db27fb6ef 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -6043,8 +6043,10 @@ unsigned long trace_adjust_address(struct trace_array *tr, unsigned long addr)
 	tscratch = tr->scratch;
 	/* if there is no tscrach, module_delta must be NULL. */
 	module_delta = READ_ONCE(tr->module_delta);
-	if (!module_delta || tscratch->entries[0].mod_addr > addr)
+	if (!module_delta || !tscratch->nr_entries ||
+	    tscratch->entries[0].mod_addr > addr) {
 		return addr + tr->text_delta;
+	}
 
 	/* Note that entries must be sorted. */
 	nr_entries = tscratch->nr_entries;
@@ -6821,13 +6823,14 @@ static ssize_t tracing_splice_read_pipe(struct file *filp,
 		/* Copy the data into the page, so we can start over. */
 		ret = trace_seq_to_buffer(&iter->seq,
 					  page_address(spd.pages[i]),
-					  trace_seq_used(&iter->seq));
+					  min((size_t)trace_seq_used(&iter->seq),
+						  PAGE_SIZE));
 		if (ret < 0) {
 			__free_page(spd.pages[i]);
 			break;
 		}
 		spd.partial[i].offset = 0;
-		spd.partial[i].len = trace_seq_used(&iter->seq);
+		spd.partial[i].len = ret;
 
 		trace_seq_init(&iter->seq);
 	}
diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
index fee40ffbd490..b9ab06c99543 100644
--- a/kernel/trace/trace_output.c
+++ b/kernel/trace/trace_output.c
@@ -1042,11 +1042,12 @@ enum print_line_t print_event_fields(struct trace_iterator *iter,
 	struct trace_event_call *call;
 	struct list_head *head;
 
+	lockdep_assert_held_read(&trace_event_sem);
+
 	/* ftrace defined events have separate call structures */
 	if (event->type <= __TRACE_LAST_TYPE) {
 		bool found = false;
 
-		down_read(&trace_event_sem);
 		list_for_each_entry(call, &ftrace_events, list) {
 			if (call->event.type == event->type) {
 				found = true;
@@ -1056,7 +1057,6 @@ enum print_line_t print_event_fields(struct trace_iterator *iter,
 			if (call->event.type > __TRACE_LAST_TYPE)
 				break;
 		}
-		up_read(&trace_event_sem);
 		if (!found) {
 			trace_seq_printf(&iter->seq, "UNKNOWN TYPE %d\n", event->type);
 			goto out;
