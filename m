Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CCC293756;
	Tue, 29 Apr 2025 23:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970710; cv=none; b=cv5RLZqjGz8/5O69hKmp6O0c0nV+qNMeUcc+Qub+YqnAfxEqQNzXI+efcXCll8DTP/EPO6liefsqjQUjrQt8Sm2CfnMTUNBF14zjfuqVr8T78XlcufmXei634IkoxqWF2ct8PV1yttf6glyUkjsybk6lBeZoeWmeijpwyGkikFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970710; c=relaxed/simple;
	bh=RS8g4fCOU84ewI1QKezh8S53WcyEWPorAnyhMDAzFrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9mrb3B6iy+uMAtAFmdF3OyYtAzx030+XGBnl7IonhseCrDir4Ayks5xwvLGaHOT6btSEaSx9/FNw7DEuZ6TmCpaDrwla8+0fYr61eP6MvIqMhbI74Qb5cnWVgKhbyD1wj9S7eRX4VbS+EBc3xL8W/urjFYw8N6MAkpmaoKwB3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FeqPrpeB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FeqPrpeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1424C4CEE3;
	Tue, 29 Apr 2025 23:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970709;
	bh=RS8g4fCOU84ewI1QKezh8S53WcyEWPorAnyhMDAzFrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FeqPrpeBPTn8Dpwx0pbj7ghWcPm52PHhdbkzZVqrUZfrp4dP6H/tntsgRFVBYWXYi
	 TYmrs7N9PlwhtQBw2hP0ZWnlQ5br91HlcvpKqOrv2oALHFMwLJQpNht40B/uTZPZw5
	 31b4FkrtjR9LAOs8aZETmjvZ0IVJ2DZczw0RG2y+FPEilNUGpc2hbbDunph86J5x4i
	 xv7pcAlr9ZZDoyYrLnw86BqS9mL6eRRI3ZPkVJxiowJLkq4Obh4G6qpJlcoDqLViA3
	 AedH+/qaOghyrRals91yphMGXzhX1gzY79CoJWaDC2KVwo5chEF6LSmCpK0h5fX91z
	 g4WdL6jj154hw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.12 13/37] intel_th: avoid using deprecated page->mapping, index fields
Date: Tue, 29 Apr 2025 19:50:58 -0400
Message-Id: <20250429235122.537321-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
Content-Transfer-Encoding: 8bit

From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

[ Upstream commit 8e553520596bbd5ce832e26e9d721e6a0c797b8b ]

The struct page->mapping, index fields are deprecated and soon to be only
available as part of a folio.

It is likely the intel_th code which sets page->mapping, index is was
implemented out of concern that some aspect of the page fault logic may
encounter unexpected problems should they not.

However, the appropriate interface for inserting kernel-allocated memory is
vm_insert_page() in a VM_MIXEDMAP. By using the helper function
vmf_insert_mixed() we can do this with minimal churn in the existing fault
handler.

By doing so, we bypass the remainder of the faulting logic. The pages are
still pinned so there is no possibility of anything unexpected being done
with the pages once established.

It would also be reasonable to pre-map everything on fault, however to
minimise churn we retain the fault handler.

We also eliminate all code which clears page->mapping on teardown as this
has now become unnecessary.

The MSU code relies on faulting to function correctly, so is by definition
dependent on CONFIG_MMU. We avoid spurious reports about compilation
failure for unsupported platforms by making this requirement explicit in
Kconfig as part of this change too.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Link: https://lore.kernel.org/r/20250331125608.60300-1-lorenzo.stoakes@oracle.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwtracing/intel_th/Kconfig |  1 +
 drivers/hwtracing/intel_th/msu.c   | 31 +++++++-----------------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/intel_th/Kconfig b/drivers/hwtracing/intel_th/Kconfig
index 4b6359326ede9..4f7d2b6d79e29 100644
--- a/drivers/hwtracing/intel_th/Kconfig
+++ b/drivers/hwtracing/intel_th/Kconfig
@@ -60,6 +60,7 @@ config INTEL_TH_STH
 
 config INTEL_TH_MSU
 	tristate "Intel(R) Trace Hub Memory Storage Unit"
+	depends on MMU
 	help
 	  Memory Storage Unit (MSU) trace output device enables
 	  storing STP traces to system memory. It supports single
diff --git a/drivers/hwtracing/intel_th/msu.c b/drivers/hwtracing/intel_th/msu.c
index 66123d684ac9e..93b65a9731d72 100644
--- a/drivers/hwtracing/intel_th/msu.c
+++ b/drivers/hwtracing/intel_th/msu.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/workqueue.h>
 #include <linux/dma-mapping.h>
+#include <linux/pfn_t.h>
 
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
@@ -967,7 +968,6 @@ static void msc_buffer_contig_free(struct msc *msc)
 	for (off = 0; off < msc->nr_pages << PAGE_SHIFT; off += PAGE_SIZE) {
 		struct page *page = virt_to_page(msc->base + off);
 
-		page->mapping = NULL;
 		__free_page(page);
 	}
 
@@ -1149,9 +1149,6 @@ static void __msc_buffer_win_free(struct msc *msc, struct msc_window *win)
 	int i;
 
 	for_each_sg(win->sgt->sgl, sg, win->nr_segs, i) {
-		struct page *page = msc_sg_page(sg);
-
-		page->mapping = NULL;
 		dma_free_coherent(msc_dev(win->msc)->parent->parent, PAGE_SIZE,
 				  sg_virt(sg), sg_dma_address(sg));
 	}
@@ -1592,22 +1589,10 @@ static void msc_mmap_close(struct vm_area_struct *vma)
 {
 	struct msc_iter *iter = vma->vm_file->private_data;
 	struct msc *msc = iter->msc;
-	unsigned long pg;
 
 	if (!atomic_dec_and_mutex_lock(&msc->mmap_count, &msc->buf_mutex))
 		return;
 
-	/* drop page _refcounts */
-	for (pg = 0; pg < msc->nr_pages; pg++) {
-		struct page *page = msc_buffer_get_page(msc, pg);
-
-		if (WARN_ON_ONCE(!page))
-			continue;
-
-		if (page->mapping)
-			page->mapping = NULL;
-	}
-
 	/* last mapping -- drop user_count */
 	atomic_dec(&msc->user_count);
 	mutex_unlock(&msc->buf_mutex);
@@ -1617,16 +1602,14 @@ static vm_fault_t msc_mmap_fault(struct vm_fault *vmf)
 {
 	struct msc_iter *iter = vmf->vma->vm_file->private_data;
 	struct msc *msc = iter->msc;
+	struct page *page;
 
-	vmf->page = msc_buffer_get_page(msc, vmf->pgoff);
-	if (!vmf->page)
+	page = msc_buffer_get_page(msc, vmf->pgoff);
+	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	get_page(vmf->page);
-	vmf->page->mapping = vmf->vma->vm_file->f_mapping;
-	vmf->page->index = vmf->pgoff;
-
-	return 0;
+	get_page(page);
+	return vmf_insert_mixed(vmf->vma, vmf->address, page_to_pfn_t(page));
 }
 
 static const struct vm_operations_struct msc_mmap_ops = {
@@ -1667,7 +1650,7 @@ static int intel_th_msc_mmap(struct file *file, struct vm_area_struct *vma)
 		atomic_dec(&msc->user_count);
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTCOPY);
+	vm_flags_set(vma, VM_DONTEXPAND | VM_DONTCOPY | VM_MIXEDMAP);
 	vma->vm_ops = &msc_mmap_ops;
 	return ret;
 }
-- 
2.39.5

