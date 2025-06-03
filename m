Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8327B1DF268
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970674; cv=none; b=Wtit9j/MiJyRBUV2nPLi2Ki+N4X/TJpiTPaKz18OGp+aFuMy4XfyLjvq1IyWa9yy+ehjkyCa+souUxy8A/vph/EPi4ho92NnOBb3iog372+rUYGS+qqcUs28LSW/7Bw3xwxkWg1y4lFH6GFGxX6g1oF6123mbQAOYVABxVaMTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970674; c=relaxed/simple;
	bh=usGSICZBZcT+AQRM8OuiXrD2b9kfIFSK0gg2jjAzeIo=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=nc8eHq/wEz77ZJQoDKWBg74PZaZBRGmWq2RgV9LJqp1MyxM9F6XLJRIMd821I2TmMFbJ1GQAw77lj+YfDtQfL/9TBnEr6yutvF5Q1tiVcZMK4V51K5DX1A9doN1GGgb42cP+1H4DUGux11YDErPToKIHHGl1Sqdem/zCZpgvl74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DF9C4CEF6;
	Tue,  3 Jun 2025 17:11:14 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uMVBd-0000000E41W-15lR;
	Tue, 03 Jun 2025 13:12:29 -0400
Message-ID: <20250603171229.109414670@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 03 Jun 2025 13:11:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiyang Ruan <ruansy.fnst@fujitsu.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Ross Zwisler <zwisler@kernel.org>,
 Alison Schofield <alison.schofield@intel.com>
Subject: [for-linus][PATCH 5/5] fsdax: Remove unused trace events for dax insert mapping
References: <20250603171149.582996770@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

When the dax_fault_actor() helper was factored out, it removed the calls
to the dax_pmd_insert_mapping and dax_insert_mapping events but never
removed the events themselves. As each event created takes up memory
(roughly 5K each), this is a waste as it is never used.

Remove the unused dax_pmd_insert_mapping and dax_insert_mapping trace
events.

Link: https://lore.kernel.org/all/20250529130138.544ffec4@gandalf.local.home/

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>
Cc: Ross Zwisler <zwisler@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250529152211.688800c9@gandalf.local.home
Fixes: c2436190e492 ("fsdax: factor out a dax_fault_actor() helper")
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/trace/events/fs_dax.h | 78 -----------------------------------
 1 file changed, 78 deletions(-)

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
-- 
2.47.2


