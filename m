Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAC5223DCA
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748471190; cv=none; b=GN/siQks7svC0o67qNjxzuieeq+xwwiUfZEg6MpNaqk9MrFsCeJSo6XU1GtZ83JZ5qCjWF8jyWh+3wmwIXlNL74iGzOjz2NuyMobrw/msoEKLyF1W5jjD82CPFmbY0xd9Z+KCEaK2P0+noux9G5CwINwSWqdYIGThmbeW6slxn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748471190; c=relaxed/simple;
	bh=tovVXRNGmaZitbxOlBpwwroDUTh0AYrw0lRujVdBC50=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=lubRuJsBEoyRHjxgiLEce40ZTbJ8Q4hYFJXlPs1zkyjF7w+RX+KyS1fUv4HLX1fsIRKt+ZFJk9zBXLPJayQqrSStN5SHV0iPwUD4im9E9jZwcgeggg0vC0YKkpJUftKABrjUEGR7ekVruWuQtVsvkXNKN72YvoITOQlQJkATpAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7031C4CEF7;
	Wed, 28 May 2025 22:26:29 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uKPFD-0000000Ap2g-0L6s;
	Wed, 28 May 2025 18:27:31 -0400
Message-ID: <20250528222730.930164377@goodmis.org>
User-Agent: quilt/0.68
Date: Wed, 28 May 2025 18:27:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 10/10] ring-buffer: Simplify functions with __free(kfree) to free
 allocations
References: <20250528222704.623477429@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

The function rb_allocate_pages() allocates cpu_buffer and on error needs
to free it. It has a single return. Use __free(kfree) and return directly
on errors and have the return use return_ptr(cpu_buffer).

The function alloc_buffer() allocates buffer and on error needs to free
it. It has a single return. Use __free(kfree) and return directly on
errors and have the return use return_ptr(buffer).

The function __rb_map_vma() allocates a temporary array "pages". Have it
use __free() and not worry about freeing it when returning.

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Link: https://lore.kernel.org/20250527143144.6edc4625@gandalf.local.home
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 kernel/trace/ring_buffer.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index ef1cca8125df..295b6fbfa81a 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -2226,7 +2226,7 @@ static int rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
 static struct ring_buffer_per_cpu *
 rb_allocate_cpu_buffer(struct trace_buffer *buffer, long nr_pages, int cpu)
 {
-	struct ring_buffer_per_cpu *cpu_buffer;
+	struct ring_buffer_per_cpu *cpu_buffer __free(kfree) = NULL;
 	struct ring_buffer_cpu_meta *meta;
 	struct buffer_page *bpage;
 	struct page *page;
@@ -2252,7 +2252,7 @@ rb_allocate_cpu_buffer(struct trace_buffer *buffer, long nr_pages, int cpu)
 	bpage = kzalloc_node(ALIGN(sizeof(*bpage), cache_line_size()),
 			    GFP_KERNEL, cpu_to_node(cpu));
 	if (!bpage)
-		goto fail_free_buffer;
+		return NULL;
 
 	rb_check_bpage(cpu_buffer, bpage);
 
@@ -2318,13 +2318,11 @@ rb_allocate_cpu_buffer(struct trace_buffer *buffer, long nr_pages, int cpu)
 		rb_head_page_activate(cpu_buffer);
 	}
 
-	return cpu_buffer;
+	return_ptr(cpu_buffer);
 
  fail_free_reader:
 	free_buffer_page(cpu_buffer->reader_page);
 
- fail_free_buffer:
-	kfree(cpu_buffer);
 	return NULL;
 }
 
@@ -2359,7 +2357,7 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 					 unsigned long scratch_size,
 					 struct lock_class_key *key)
 {
-	struct trace_buffer *buffer;
+	struct trace_buffer *buffer __free(kfree) = NULL;
 	long nr_pages;
 	int subbuf_size;
 	int bsize;
@@ -2373,7 +2371,7 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 		return NULL;
 
 	if (!zalloc_cpumask_var(&buffer->cpumask, GFP_KERNEL))
-		goto fail_free_buffer;
+		return NULL;
 
 	buffer->subbuf_order = order;
 	subbuf_size = (PAGE_SIZE << order);
@@ -2472,7 +2470,7 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
 
 	mutex_init(&buffer->mutex);
 
-	return buffer;
+	return_ptr(buffer);
 
  fail_free_buffers:
 	for_each_buffer_cpu(buffer, cpu) {
@@ -2484,8 +2482,6 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
  fail_free_cpumask:
 	free_cpumask_var(buffer->cpumask);
 
- fail_free_buffer:
-	kfree(buffer);
 	return NULL;
 }
 
@@ -7057,7 +7053,7 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 {
 	unsigned long nr_subbufs, nr_pages, nr_vma_pages, pgoff = vma->vm_pgoff;
 	unsigned int subbuf_pages, subbuf_order;
-	struct page **pages;
+	struct page **pages __free(kfree) = NULL;
 	int p = 0, s = 0;
 	int err;
 
@@ -7125,10 +7121,8 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 		struct page *page;
 		int off = 0;
 
-		if (WARN_ON_ONCE(s >= nr_subbufs)) {
-			err = -EINVAL;
-			goto out;
-		}
+		if (WARN_ON_ONCE(s >= nr_subbufs))
+			return -EINVAL;
 
 		page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
 
@@ -7143,9 +7137,6 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 
 	err = vm_insert_pages(vma, vma->vm_start, pages, &nr_pages);
 
-out:
-	kfree(pages);
-
 	return err;
 }
 #else
-- 
2.47.2


