Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6A2512CA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694212; cv=none; b=gbFLXSZCSPkYplQ7ZgFJnKx4zDYZgR7vZT6pONx/yfGVnvj/2zeVY7HAiJyzAZWWu/L8VIGTcamWqcEkkihcx86ofNUD9mgIdchGj8QUTeKwLymDsOt1jSP5GEzDkP8SR6M1hsUQ4NCBo+WD5pExn73iM/hBDkYLmXfBsd1eV8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694212; c=relaxed/simple;
	bh=JPOt6kU58B39SenEpIrnm7A+2d6zyy8q5p6umnUzlTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PeVnaAtgWX9bheKD0YkGXl215z9Wzs6D4JpPXQIs8TUm3I+xirQEs1iMMVMu1fyM79dZ3Hy8EcrDcIZeFPCtak0u4mDGaWe29j/8AKGxz5RtLKXlKfOWtCSCkd9I99r+a3uOMAmx6e+wJwwwnp8gbQ3m68O6a2FikqtgIWjD5pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474ACC4CEE3;
	Thu,  3 Apr 2025 15:30:11 +0000 (UTC)
Date: Thu, 3 Apr 2025 11:31:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mike Rapoport <rppt@kernel.org>, Jann Horn <jannh@google.com>
Subject: [GIT PULL] tracing: Cleanup and simplify the persistent ring buffer
 for 6.15
Message-ID: <20250403113116.5760d1d8@gandalf.local.home>
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

Persistent buffer cleanups and simplifications for v6.15:

It was mistaken that the physical memory returned from "reserve_mem" had to
be vmap()'d to get to it from a virtual address. But reserve_mem already
maps the memory to the virtual address of the kernel so a simple
phys_to_virt() can be used to get to the virtual address from the physical
memory returned by "reserve_mem". With this new found knowledge, the
code can be cleaned up and simplified.

- Enforce that the persistent memory is page aligned

  As the buffers using the persistent memory are all going to be
  mapped via pages, make sure that the memory given to the tracing
  infrastructure is page aligned. If it is not, it will print a warning
  and fail to map the buffer.

- Use phys_to_virt() to get the virtual address from reserve_mem

  Instead of calling vmap() on the physical memory returned from
  "reserve_mem", use phys_to_virt() instead.

  As the memory returned by "memmap" or any other means where a physical
  address is given to the tracing infrastructure, it still needs to
  be vmap(). Since this memory can never be returned back to the buddy
  allocator nor should it ever be memmory mapped to user space, flag
  this buffer and up the ref count. The ref count will keep it from
  ever being freed, and the flag will prevent it from ever being memory
  mapped to user space.

- Use vmap_page_range() for memmap virtual address mapping

  For the memmap buffer, instead of allocating an array of struct pages,
  assigning them to the contiguous phsycial memory and then passing that to
  vmap(), use vmap_page_range() instead

- Replace flush_dcache_folio() with flush_kernel_vmap_range()

  Instead of calling virt_to_folio() and passing that to
  flush_dcache_folio(), just call flush_kernel_vmap_range() directly.
  This also fixes a bug where if a subbuffer was bigger than PAGE_SIZE
  only the PAGE_SIZE portion would be flushed.


Please pull the latest trace-ringbuffer-v6.15-3 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-ringbuffer-v6.15-3

Tag SHA1: 1d8e085f8031224ddb27fdc53a3928f89f6f3a99
Head SHA1: e4d4b8670c44cdd22212cab3c576e2d317efa67c


Steven Rostedt (4):
      tracing: Enforce the persistent ring buffer to be page aligned
      tracing: Have reserve_mem use phys_to_virt() and separate from memmap buffer
      tracing: Use vmap_page_range() to map memmap ring buffer
      ring-buffer: Use flush_kernel_vmap_range() over flush_dcache_folio()

----
 Documentation/admin-guide/kernel-parameters.txt |  2 +
 Documentation/trace/debugging.rst               |  2 +
 kernel/trace/ring_buffer.c                      |  5 +-
 kernel/trace/trace.c                            | 66 ++++++++++++++++---------
 kernel/trace/trace.h                            |  1 +
 5 files changed, 50 insertions(+), 26 deletions(-)
---------------------------
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index fb8752b42ec8..71861643ef14 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7241,6 +7241,8 @@
 			This is just one of many ways that can clear memory. Make sure your system
 			keeps the content of memory across reboots before relying on this option.
 
+			NB: Both the mapped address and size must be page aligned for the architecture.
+
 			See also Documentation/trace/debugging.rst
 
 
diff --git a/Documentation/trace/debugging.rst b/Documentation/trace/debugging.rst
index 54fb16239d70..d54bc500af80 100644
--- a/Documentation/trace/debugging.rst
+++ b/Documentation/trace/debugging.rst
@@ -136,6 +136,8 @@ kernel, so only the same kernel is guaranteed to work if the mapping is
 preserved. Switching to a different kernel version may find a different
 layout and mark the buffer as invalid.
 
+NB: Both the mapped address and size must be page aligned for the architecture.
+
 Using trace_printk() in the boot instance
 -----------------------------------------
 By default, the content of trace_printk() goes into the top level tracing
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index f25966b3a1fc..d4b0f7b55cce 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6016,7 +6016,7 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->read = cpu_buffer->read;
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
-	flush_dcache_folio(virt_to_folio(cpu_buffer->meta_page));
+	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
 }
 
 static void
@@ -7319,7 +7319,8 @@ int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
 
 out:
 	/* Some archs do not have data cache coherency between kernel and user-space */
-	flush_dcache_folio(virt_to_folio(cpu_buffer->reader_page->page));
+	flush_kernel_vmap_range(cpu_buffer->reader_page->page,
+				buffer->subbuf_size + BUF_PAGE_HDR_SIZE);
 
 	rb_update_meta_page(cpu_buffer);
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 14c38fcd6f9e..f6531cd3176b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -50,6 +50,7 @@
 #include <linux/irq_work.h>
 #include <linux/workqueue.h>
 #include <linux/sort.h>
+#include <linux/io.h> /* vmap_page_range() */
 
 #include <asm/setup.h> /* COMMAND_LINE_SIZE */
 
@@ -8492,6 +8493,10 @@ static int tracing_buffers_mmap(struct file *filp, struct vm_area_struct *vma)
 	struct trace_iterator *iter = &info->iter;
 	int ret = 0;
 
+	/* A memmap'ed buffer is not supported for user space mmap */
+	if (iter->tr->flags & TRACE_ARRAY_FL_MEMMAP)
+		return -ENODEV;
+
 	/* Currently the boot mapped buffer is not supported for mmap */
 	if (iter->tr->flags & TRACE_ARRAY_FL_BOOT)
 		return -ENODEV;
@@ -9600,9 +9605,6 @@ static void free_trace_buffers(struct trace_array *tr)
 #ifdef CONFIG_TRACER_MAX_TRACE
 	free_trace_buffer(&tr->max_buffer);
 #endif
-
-	if (tr->range_addr_start)
-		vunmap((void *)tr->range_addr_start);
 }
 
 static void init_trace_flags_index(struct trace_array *tr)
@@ -9795,29 +9797,27 @@ static int instance_mkdir(const char *name)
 	return ret;
 }
 
-static u64 map_pages(u64 start, u64 size)
+static u64 map_pages(unsigned long start, unsigned long size)
 {
-	struct page **pages;
-	phys_addr_t page_start;
-	unsigned int page_count;
-	unsigned int i;
-	void *vaddr;
-
-	page_count = DIV_ROUND_UP(size, PAGE_SIZE);
+	unsigned long vmap_start, vmap_end;
+	struct vm_struct *area;
+	int ret;
 
-	page_start = start;
-	pages = kmalloc_array(page_count, sizeof(struct page *), GFP_KERNEL);
-	if (!pages)
+	area = get_vm_area(size, VM_IOREMAP);
+	if (!area)
 		return 0;
 
-	for (i = 0; i < page_count; i++) {
-		phys_addr_t addr = page_start + i * PAGE_SIZE;
-		pages[i] = pfn_to_page(addr >> PAGE_SHIFT);
+	vmap_start = (unsigned long) area->addr;
+	vmap_end = vmap_start + size;
+
+	ret = vmap_page_range(vmap_start, vmap_end,
+			      start, pgprot_nx(PAGE_KERNEL));
+	if (ret < 0) {
+		free_vm_area(area);
+		return 0;
 	}
-	vaddr = vmap(pages, page_count, VM_MAP, PAGE_KERNEL);
-	kfree(pages);
 
-	return (u64)(unsigned long)vaddr;
+	return (u64)vmap_start;
 }
 
 /**
@@ -10696,6 +10696,7 @@ static inline void do_allocate_snapshot(const char *name) { }
 __init static void enable_instances(void)
 {
 	struct trace_array *tr;
+	bool memmap_area = false;
 	char *curr_str;
 	char *name;
 	char *str;
@@ -10764,6 +10765,7 @@ __init static void enable_instances(void)
 					name);
 				continue;
 			}
+			memmap_area = true;
 		} else if (tok) {
 			if (!reserve_mem_find_by_name(tok, &start, &size)) {
 				start = 0;
@@ -10774,7 +10776,20 @@ __init static void enable_instances(void)
 		}
 
 		if (start) {
-			addr = map_pages(start, size);
+			/* Start and size must be page aligned */
+			if (start & ~PAGE_MASK) {
+				pr_warn("Tracing: mapping start addr %pa is not page aligned\n", &start);
+				continue;
+			}
+			if (size & ~PAGE_MASK) {
+				pr_warn("Tracing: mapping size %pa is not page aligned\n", &size);
+				continue;
+			}
+
+			if (memmap_area)
+				addr = map_pages(start, size);
+			else
+				addr = (unsigned long)phys_to_virt(start);
 			if (addr) {
 				pr_info("Tracing: mapped boot instance %s at physical memory %pa of size 0x%lx\n",
 					name, &start, (unsigned long)size);
@@ -10801,10 +10816,13 @@ __init static void enable_instances(void)
 			update_printk_trace(tr);
 
 		/*
-		 * If start is set, then this is a mapped buffer, and
-		 * cannot be deleted by user space, so keep the reference
-		 * to it.
+		 * memmap'd buffers can not be freed.
 		 */
+		if (memmap_area) {
+			tr->flags |= TRACE_ARRAY_FL_MEMMAP;
+			tr->ref++;
+		}
+
 		if (start) {
 			tr->flags |= TRACE_ARRAY_FL_BOOT | TRACE_ARRAY_FL_LAST_BOOT;
 			tr->range_name = no_free_ptr(rname);
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index ab7c7a1930cc..9d9dcfad6269 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -446,6 +446,7 @@ enum {
 	TRACE_ARRAY_FL_BOOT		= BIT(1),
 	TRACE_ARRAY_FL_LAST_BOOT	= BIT(2),
 	TRACE_ARRAY_FL_MOD_INIT		= BIT(3),
+	TRACE_ARRAY_FL_MEMMAP		= BIT(4),
 };
 
 #ifdef CONFIG_MODULES
