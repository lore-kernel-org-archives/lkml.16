Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD6F221FCB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471189; cv=none; b=KO2LSOphb7GxNA8bpr5q7uhsWc/as7F5qg3i4Z+w834qeBFIQYtM+ttna92UFiCSJK3eBZUIa6ORlQLnqqAJBY7x5ztiP/2z7XyPirVZdkDycBh87kijD0y7DQqpiVtL5kuiZEJS9od0nTTwgWCv/TBmGZoMyCK2A8e7Br56k/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471189; c=relaxed/simple;
	bh=O1T2O4HG5n58pUQSlG0OhTuw77grtk6t+3T3Uh0MIXI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=h/OAUZ0KbcTE7AjXFzv2zmy9IeUATxLxUpWz2djNsG9UwEKlZXFaq7/KRQukWj0Dy1yCTCMjrEvbf3fXAp5QZprY6nS9lvrI4AnCmnv1q6of1wV2T8r7wI1cYW9yjxqf6fyj0/AXb+wpl0CTuc8WzfQ/FMA3sGus4/pGBs50/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DF3C4CEF6;
	Wed, 28 May 2025 22:26:28 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFB-0000000Aoz0-3lyz;
	Wed, 28 May 2025 18:27:29 -0400
Message-ID: <20250528222729.752085135@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Vincent Donnefort <vdonnefort@google.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>,
 Jann Horn <jannh@google.com>
Subject: [for-next][PATCH 03/10] ring-buffer: Allow reserve_mem persistent ring buffers to be mmapped
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

When the persistent ring buffer is created from the memory returned by
reserve_mem there is nothing prohibiting it to be memory mapped to user
space. The memory is the same as the pages allocated by alloc_page().

The way the memory is managed by the ring buffer code is slightly
different though and needs to be addressed.

The persistent memory uses the page->id for its own purpose where as the
user mmap buffer currently uses that for the subbuf array mapped to user
space. If the buffer is a persistent buffer, use the page index into that
buffer as the identifier instead of the page->id.

That is, the page->id for a persistent buffer, represents the order of the
buffer is in the link list. ->id == 0 means it is the reader page.
When a reader page is swapped, the new reader page's ->id gets zero, and
the old reader page gets the ->id of the page that it swapped with.

The user space mapping has the ->id is the index of where it was mapped in
user space and does not change while it is mapped.

Since the persistent buffer is fixed in its location, the index of where
a page is in the memory range can be used as the "id" to put in the meta
page array, and it can be mapped in the same order to user space as it is
in the persistent memory.

A new rb_page_id() helper function is used to get and set the id depending
on if the page is a normal memory allocated buffer or a physical memory
mapped buffer.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vincent Donnefort <vdonnefort@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Jann Horn <jannh@google.com>
Link: https://lore.kernel.org/20250401203332.246646011@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 49 ++++++++++++++++++++++++++++++++++----
 kernel/trace/trace.c       |  4 ----
 2 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 683aa57870fe..e40f5c6d7908 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6003,6 +6003,39 @@ static void rb_clear_buffer_page(struct buffer_page *page)
 	page->read = 0;
 }
 
+/*
+ * When the buffer is memory mapped to user space, each sub buffer
+ * has a unique id that is used by the meta data to tell the user
+ * where the current reader page is.
+ *
+ * For a normal allocated ring buffer, the id is saved in the buffer page
+ * id field, and updated via this function.
+ *
+ * But for a fixed memory mapped buffer, the id is already assigned for
+ * fixed memory ording in the memory layout and can not be used. Instead
+ * the index of where the page lies in the memory layout is used.
+ *
+ * For the normal pages, set the buffer page id with the passed in @id
+ * value and return that.
+ *
+ * For fixed memory mapped pages, get the page index in the memory layout
+ * and return that as the id.
+ */
+static int rb_page_id(struct ring_buffer_per_cpu *cpu_buffer,
+		      struct buffer_page *bpage, int id)
+{
+	/*
+	 * For boot buffers, the id is the index,
+	 * otherwise, set the buffer page with this id
+	 */
+	if (cpu_buffer->ring_meta)
+		id = rb_meta_subbuf_idx(cpu_buffer->ring_meta, bpage->page);
+	else
+		bpage->id = id;
+
+	return id;
+}
+
 static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
@@ -6011,7 +6044,9 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 		return;
 
 	meta->reader.read = cpu_buffer->reader_page->read;
-	meta->reader.id = cpu_buffer->reader_page->id;
+	meta->reader.id = rb_page_id(cpu_buffer, cpu_buffer->reader_page,
+				     cpu_buffer->reader_page->id);
+
 	meta->reader.lost_events = cpu_buffer->lost_events;
 
 	meta->entries = local_read(&cpu_buffer->entries);
@@ -6927,23 +6962,29 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
 	struct buffer_page *first_subbuf, *subbuf;
+	int cnt = 0;
 	int id = 0;
 
-	subbuf_ids[id] = (unsigned long)cpu_buffer->reader_page->page;
-	cpu_buffer->reader_page->id = id++;
+	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
+	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
 	do {
+		id = rb_page_id(cpu_buffer, subbuf, id);
+
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
 		subbuf_ids[id] = (unsigned long)subbuf->page;
-		subbuf->id = id;
 
 		rb_inc_page(&subbuf);
 		id++;
+		cnt++;
 	} while (subbuf != first_subbuf);
 
+	WARN_ON(cnt != nr_subbufs);
+
 	/* install subbuf ID to kern VA translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 5b8db27fb6ef..73d75cdb7e5b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8508,10 +8508,6 @@ static int tracing_buffers_mmap(struct file *filp, struct vm_area_struct *vma)
 	if (iter->tr->flags & TRACE_ARRAY_FL_MEMMAP)
 		return -ENODEV;
 
-	/* Currently the boot mapped buffer is not supported for mmap */
-	if (iter->tr->flags & TRACE_ARRAY_FL_BOOT)
-		return -ENODEV;
-
 	ret = get_snapshot_map(iter->tr);
 	if (ret)
 		return ret;
-- 
2.47.2


