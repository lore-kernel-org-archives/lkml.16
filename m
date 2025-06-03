Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5971DF268
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748980676; cv=none; b=XOyz0Zkwov9Jzeoa1Ai9cgUnxkfjlqse074v8Mzhuu6cQKl8EgeDOUFh+94SAreI/TlgG2GdhDFWQK3uPeMHu+uh9MyPboH0yjI4qgYclXOV0ma+BJKIjKD3sfBti7T0FY1JarZkHYHtD8/JIfiSrqUrfZa+L8nNBM/DaxoliJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748980676; c=relaxed/simple;
	bh=WDoKC5wbl70DpzVUigQq/lvRqCmgs+iYE7zqUZB+kl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p/UJNhxoQU5jkIGznLy4TYuhRT31nIc6oC7HnScKy89C9DmD6EmlEndjP4crFExH27/G5N7g8gNJ23qNzS5ea7aqEWToHWuzvbhmin85IggXPYDBjpIlPEKJlds5bDK2tVXzGe/i+OfT9tUoZzoeTrzCt9Ggh9/AZXErybt3c00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8385DC4CEED;
	Tue,  3 Jun 2025 19:57:54 +0000 (UTC)
Date: Tue, 3 Jun 2025 15:59:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Ye Bin <yebin10@huawei.com>, Jesper
 Dangaard Brouer <hawk@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alison Schofield
 <alison.schofield@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [GIT PULL] tracing: Fixes for v6.16
Message-ID: <20250603155909.2564d008@gandalf.local.home>
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

tracing fixes:

- Fix UAF in module unload in ftrace when there's a bug in the module

  If a module is buggy and triggers ftrace_disable which is set when
  an anomaly is detected, when it gets unloaded it doesn't free
  the hooks into kallsyms, and when a kallsyms lookup is performed
  it may access the mod->modname field and crash via UAF.

  Fix this by still freeing the mod_maps that are attached to kallsyms
  on module unload regardless if ftrace_disable is set or not.

- Do not bother allocating mod_maps for kallsyms if ftrace_disable is set

- Remove unused trace events

  When a trace event or tracepoint is created but not used, it still
  creates the code and data structures needed for that trace event.
  This just wastes memory.

  A patch is being worked on to warn when a trace event is created but
  not used: https://lore.kernel.org/linux-trace-kernel/20250529130138.544ffec4@gandalf.local.home/

  Remove the trace events that are created but not used. This does not
  remove trace events that are created but are not used due to configs
  not being set. That will be handled later. This only removes events
  that have no user under any config.


Please pull the latest trace-v6.16-2 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v6.16-2

Tag SHA1: 5742e05e28abea97c94cb020c894fee830d34f1d
Head SHA1: a4a45a9a72f3a9eaa17ec502d6e97c8eaa901825


Steven Rostedt (3):
      xdp: Remove unused mem_return_failed event
      genirq/matrix: Remove unused irq_matrix_alloc_reserved tracepoint
      fsdax: Remove unused trace events for dax insert mapping

Ye Bin (2):
      ftrace: Fix UAF when lookup kallsym after ftrace disabled
      ftrace: Don't allocate ftrace module map if ftrace is disabled

----
 include/trace/events/fs_dax.h     | 78 ---------------------------------------
 include/trace/events/irq_matrix.h |  8 ----
 include/trace/events/xdp.h        | 26 -------------
 kernel/trace/ftrace.c             | 13 +++++--
 4 files changed, 10 insertions(+), 115 deletions(-)
---------------------------
diff --git a/include/trace/events/fs_dax.h b/include/trace/events/fs_dax.h
index 86fe6aecff1e..76b56f78abb0 100644
--- a/include/trace/events/fs_dax.h
+++ b/include/trace/events/fs_dax.h
@@ -102,54 +102,6 @@ DEFINE_EVENT(dax_pmd_load_hole_class, name, \
 DEFINE_PMD_LOAD_HOLE_EVENT(dax_pmd_load_hole);
 DEFINE_PMD_LOAD_HOLE_EVENT(dax_pmd_load_hole_fallback);
 
-DECLARE_EVENT_CLASS(dax_pmd_insert_mapping_class,
-	TP_PROTO(struct inode *inode, struct vm_fault *vmf,
-		long length, pfn_t pfn, void *radix_entry),
-	TP_ARGS(inode, vmf, length, pfn, radix_entry),
-	TP_STRUCT__entry(
-		__field(unsigned long, ino)
-		__field(unsigned long, vm_flags)
-		__field(unsigned long, address)
-		__field(long, length)
-		__field(u64, pfn_val)
-		__field(void *, radix_entry)
-		__field(dev_t, dev)
-		__field(int, write)
-	),
-	TP_fast_assign(
-		__entry->dev = inode->i_sb->s_dev;
-		__entry->ino = inode->i_ino;
-		__entry->vm_flags = vmf->vma->vm_flags;
-		__entry->address = vmf->address;
-		__entry->write = vmf->flags & FAULT_FLAG_WRITE;
-		__entry->length = length;
-		__entry->pfn_val = pfn.val;
-		__entry->radix_entry = radix_entry;
-	),
-	TP_printk("dev %d:%d ino %#lx %s %s address %#lx length %#lx "
-			"pfn %#llx %s radix_entry %#lx",
-		MAJOR(__entry->dev),
-		MINOR(__entry->dev),
-		__entry->ino,
-		__entry->vm_flags & VM_SHARED ? "shared" : "private",
-		__entry->write ? "write" : "read",
-		__entry->address,
-		__entry->length,
-		__entry->pfn_val & ~PFN_FLAGS_MASK,
-		__print_flags_u64(__entry->pfn_val & PFN_FLAGS_MASK, "|",
-			PFN_FLAGS_TRACE),
-		(unsigned long)__entry->radix_entry
-	)
-)
-
-#define DEFINE_PMD_INSERT_MAPPING_EVENT(name) \
-DEFINE_EVENT(dax_pmd_insert_mapping_class, name, \
-	TP_PROTO(struct inode *inode, struct vm_fault *vmf, \
-		long length, pfn_t pfn, void *radix_entry), \
-	TP_ARGS(inode, vmf, length, pfn, radix_entry))
-
-DEFINE_PMD_INSERT_MAPPING_EVENT(dax_pmd_insert_mapping);
-
 DECLARE_EVENT_CLASS(dax_pte_fault_class,
 	TP_PROTO(struct inode *inode, struct vm_fault *vmf, int result),
 	TP_ARGS(inode, vmf, result),
@@ -194,36 +146,6 @@ DEFINE_PTE_FAULT_EVENT(dax_load_hole);
 DEFINE_PTE_FAULT_EVENT(dax_insert_pfn_mkwrite_no_entry);
 DEFINE_PTE_FAULT_EVENT(dax_insert_pfn_mkwrite);
 
-TRACE_EVENT(dax_insert_mapping,
-	TP_PROTO(struct inode *inode, struct vm_fault *vmf, void *radix_entry),
-	TP_ARGS(inode, vmf, radix_entry),
-	TP_STRUCT__entry(
-		__field(unsigned long, ino)
-		__field(unsigned long, vm_flags)
-		__field(unsigned long, address)
-		__field(void *, radix_entry)
-		__field(dev_t, dev)
-		__field(int, write)
-	),
-	TP_fast_assign(
-		__entry->dev = inode->i_sb->s_dev;
-		__entry->ino = inode->i_ino;
-		__entry->vm_flags = vmf->vma->vm_flags;
-		__entry->address = vmf->address;
-		__entry->write = vmf->flags & FAULT_FLAG_WRITE;
-		__entry->radix_entry = radix_entry;
-	),
-	TP_printk("dev %d:%d ino %#lx %s %s address %#lx radix_entry %#lx",
-		MAJOR(__entry->dev),
-		MINOR(__entry->dev),
-		__entry->ino,
-		__entry->vm_flags & VM_SHARED ? "shared" : "private",
-		__entry->write ? "write" : "read",
-		__entry->address,
-		(unsigned long)__entry->radix_entry
-	)
-)
-
 DECLARE_EVENT_CLASS(dax_writeback_range_class,
 	TP_PROTO(struct inode *inode, pgoff_t start_index, pgoff_t end_index),
 	TP_ARGS(inode, start_index, end_index),
diff --git a/include/trace/events/irq_matrix.h b/include/trace/events/irq_matrix.h
index 267d4cbbf360..93244078b4e6 100644
--- a/include/trace/events/irq_matrix.h
+++ b/include/trace/events/irq_matrix.h
@@ -138,14 +138,6 @@ DEFINE_EVENT(irq_matrix_global_update, irq_matrix_assign_system,
 	TP_ARGS(bit, matrix)
 );
 
-DEFINE_EVENT(irq_matrix_cpu, irq_matrix_alloc_reserved,
-
-	TP_PROTO(int bit, unsigned int cpu,
-		 struct irq_matrix *matrix, struct cpumap *cmap),
-
-	TP_ARGS(bit, cpu, matrix, cmap)
-);
-
 DEFINE_EVENT(irq_matrix_cpu, irq_matrix_reserve_managed,
 
 	TP_PROTO(int bit, unsigned int cpu,
diff --git a/include/trace/events/xdp.h b/include/trace/events/xdp.h
index a7e5452b5d21..d3ef86c97ae3 100644
--- a/include/trace/events/xdp.h
+++ b/include/trace/events/xdp.h
@@ -379,32 +379,6 @@ TRACE_EVENT(mem_connect,
 	)
 );
 
-TRACE_EVENT(mem_return_failed,
-
-	TP_PROTO(const struct xdp_mem_info *mem,
-		 const struct page *page),
-
-	TP_ARGS(mem, page),
-
-	TP_STRUCT__entry(
-		__field(const struct page *,	page)
-		__field(u32,		mem_id)
-		__field(u32,		mem_type)
-	),
-
-	TP_fast_assign(
-		__entry->page		= page;
-		__entry->mem_id		= mem->id;
-		__entry->mem_type	= mem->type;
-	),
-
-	TP_printk("mem_id=%d mem_type=%s page=%p",
-		  __entry->mem_id,
-		  __print_symbolic(__entry->mem_type, __MEM_TYPE_SYM_TAB),
-		  __entry->page
-	)
-);
-
 TRACE_EVENT(bpf_xdp_link_attach_failed,
 
 	TP_PROTO(const char *msg),
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 1af952cba48d..a7291685902e 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -7438,9 +7438,10 @@ void ftrace_release_mod(struct module *mod)
 
 	mutex_lock(&ftrace_lock);
 
-	if (ftrace_disabled)
-		goto out_unlock;
-
+	/*
+	 * To avoid the UAF problem after the module is unloaded, the
+	 * 'mod_map' resource needs to be released unconditionally.
+	 */
 	list_for_each_entry_safe(mod_map, n, &ftrace_mod_maps, list) {
 		if (mod_map->mod == mod) {
 			list_del_rcu(&mod_map->list);
@@ -7449,6 +7450,9 @@ void ftrace_release_mod(struct module *mod)
 		}
 	}
 
+	if (ftrace_disabled)
+		goto out_unlock;
+
 	/*
 	 * Each module has its own ftrace_pages, remove
 	 * them from the list.
@@ -7627,6 +7631,9 @@ allocate_ftrace_mod_map(struct module *mod,
 {
 	struct ftrace_mod_map *mod_map;
 
+	if (ftrace_disabled)
+		return NULL;
+
 	mod_map = kmalloc(sizeof(*mod_map), GFP_KERNEL);
 	if (!mod_map)
 		return NULL;
