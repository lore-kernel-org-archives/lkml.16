Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203C25D53F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090682; cv=none; b=kq3M1dfVZk/tqMYnVYGZFjfD9TSC8DP2HZ1bQF2bBJEubspPD37ZVrG9cgrgjGTS+BG4zgPS5kMGeacjX978e64nZeZKDpG29hoIpMvBan8dy6DQeHP2eM8gxt/oMluHvQpH5Fgr6jnbWyLmE+Uh1fTreiCKf8IeiGJX27p3G0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090682; c=relaxed/simple;
	bh=xDsamppNLG2r2TTwhNwg+efST2ix2Y6DasRDlfxsoEc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EaVnzRR++SOEkmbDti978YM/xKs4YK4Qjzvdwtsgmn0xEgqU7wpMba8ZiZ1F6mOOIrZ5nsVG5nvP6oGX6EV6wNAzkaCD82zkjNdhAFKnlOObc7nfLauT2+FZBZaqJ6XJAaiD/TaObkyITpBy2zRZ6ckPA9ihvg16cT3qVm953qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Vu9k25TC; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Vu9k25TC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1747090680; x=1778626680;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xF81otjobOInOhSdXoqYrbDRTXhmSwj/vhXbUO1h8W8=;
  b=Vu9k25TC9Vryuvnxk7CW2/Q752ZMNhSP4BooBVonIA3sn4k1uhvzBhHS
   90BPntx5cY1gIZY/XXA70niAIZUZOLF2XYNNZXIm8oYflvZfbBvPe9zD0
   W0etVn77euX9mzBGwwEBQkUXJpSSv56fnj6x9EZ5wA7Jk4mZmMoEg1PkQ
   Tb50yEAcKzOZTAECuJ+jXQ/xeJGuB0ueohltx9G8bgt6O1QW2pstOrPZM
   5Q6EbdoUtlhd+3I7GGtgEj06zqN7ZgbThY8cgIBCQe8maefgRXEfKEMfI
   eYSqucM22ysYE2huzz5gAGQDCycDSQG1eUEQrPYb8rzQf90+HIA3c7bni
   Q==;
X-IronPort-AV: E=Sophos;i="6.15,283,1739836800"; 
   d="scan'208";a="296950008"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:57:57 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.38.20:19210]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.28.26:2525] with esmtp (Farcaster)
 id 90511994-c75c-48bb-94f0-ca60c2fe56ca; Mon, 12 May 2025 22:57:56 +0000 (UTC)
X-Farcaster-Flow-ID: 90511994-c75c-48bb-94f0-ca60c2fe56ca
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 12 May 2025 22:57:55 +0000
Received: from dev-dsk-graf-1a-90d01eec.eu-west-1.amazon.com (172.19.99.218)
 by EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 12 May 2025 22:57:53 +0000
From: Alexander Graf <graf@amazon.com>
To: <kexec@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH] kexec: Enable CMA based contiguous allocation
Date: Mon, 12 May 2025 22:57:52 +0000
Message-ID: <20250512225752.11687-1-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D036UWC003.ant.amazon.com (10.13.139.214) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When booting a new kernel with kexec_file, the kernel picks a target
location that the kernel should live at, then allocates random pages,
checks whether any of those patches magically happens to coincide with
a target address range and if so, uses them for that range.

For every page allocated this way, it then creates a page list that the
relocation code - code that executes while all CPUs are off and we are
just about to jump into the new kernel - copies to their final memory
location. We can not put them there before, because chances are pretty
good that at least some page in the target range is already in use by
the currently running Linux environment.

All of this is inefficient.

Since kexec got introduced, Linux has gained the CMA framework which
can perform physically contiguous memory mappings, while keeping that
memory available for movable memory when it is not needed for contiguous
allocations. The default CMA allocator is for DMA allocations.

This patch adds logic to the kexec file loader to attempt to place the
target payload at a location allocated from CMA. If successful, it uses
that memory range directly instead of creating copy instructions during
the hot phase. To ensure that there is a safety net in case anything goes
wrong with the CMA allocation, it also adds a flag for user space to force
disable CMA allocations.

Using CMA allocations has two advantages:

  1) Faster. There is no more need to copy in the hot phase.
  2) More robust. Even if by accident some page is still in use for DMA,
     the new kernel image will be safe from that access because it resides
     in a memory region that is considered allocated in the old kernel and
     has a chance to reinitialize that component.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 include/linux/kexec.h      |  6 +++
 include/uapi/linux/kexec.h |  1 +
 kernel/kexec_core.c        | 82 ++++++++++++++++++++++++++++++++++++++
 kernel/kexec_file.c        | 55 +++++++++++++++++++++++--
 4 files changed, 140 insertions(+), 4 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index c8971861521a..421af2a303b6 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -91,6 +91,9 @@ struct kexec_segment {
 	size_t bufsz;
 	unsigned long mem;
 	size_t memsz;
+
+	/* Pointer to contiguous CMA allocation or NULL */
+	struct page *cma;
 };
 
 #ifdef CONFIG_COMPAT
@@ -169,6 +172,7 @@ int kexec_image_post_load_cleanup_default(struct kimage *image);
  * @buf_min:	The buffer can't be placed below this address.
  * @buf_max:	The buffer can't be placed above this address.
  * @top_down:	Allocate from top of memory.
+ * @cma:	CMA page if the buffer is backed by CMA.
  */
 struct kexec_buf {
 	struct kimage *image;
@@ -180,6 +184,7 @@ struct kexec_buf {
 	unsigned long buf_min;
 	unsigned long buf_max;
 	bool top_down;
+	struct page *cma;
 };
 
 int kexec_load_purgatory(struct kimage *image, struct kexec_buf *kbuf);
@@ -331,6 +336,7 @@ struct kimage {
 	 */
 	unsigned int hotplug_support:1;
 #endif
+	unsigned int no_cma : 1;
 
 #ifdef ARCH_HAS_KIMAGE_ARCH
 	struct kimage_arch arch;
diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index 5ae1741ea8ea..8958ebfcff94 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -27,6 +27,7 @@
 #define KEXEC_FILE_ON_CRASH	0x00000002
 #define KEXEC_FILE_NO_INITRAMFS	0x00000004
 #define KEXEC_FILE_DEBUG	0x00000008
+#define KEXEC_FILE_NO_CMA	0x00000010
 
 /* These values match the ELF architecture values.
  * Unless there is a good reason that should continue to be the case.
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 3e62b944c883..4c2b2ef7825d 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -40,6 +40,7 @@
 #include <linux/hugetlb.h>
 #include <linux/objtool.h>
 #include <linux/kmsg_dump.h>
+#include <linux/dma-map-ops.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -553,6 +554,24 @@ static void kimage_free_entry(kimage_entry_t entry)
 	kimage_free_pages(page);
 }
 
+static void kimage_free_cma(struct kimage *image)
+{
+	unsigned long i;
+
+	for (i = 0; i < image->nr_segments; i++) {
+		struct page *cma = image->segment[i].cma;
+		u32 pages = image->segment[i].memsz >> PAGE_SHIFT;
+
+		if (!cma)
+			continue;
+
+		arch_kexec_pre_free_pages(page_address(cma), pages);
+		dma_release_from_contiguous(NULL, cma, pages);
+		image->segment[i].cma = NULL;
+	}
+
+}
+
 void kimage_free(struct kimage *image)
 {
 	kimage_entry_t *ptr, entry;
@@ -591,6 +610,9 @@ void kimage_free(struct kimage *image)
 	/* Free the kexec control pages... */
 	kimage_free_page_list(&image->control_pages);
 
+	/* Free CMA allocations */
+	kimage_free_cma(image);
+
 	/*
 	 * Free up any temporary buffers allocated. This might hit if
 	 * error occurred much later after buffer allocation.
@@ -716,6 +738,63 @@ static struct page *kimage_alloc_page(struct kimage *image,
 	return page;
 }
 
+static int kimage_load_cma_segment(struct kimage *image, struct kexec_segment *segment)
+{
+	unsigned long maddr;
+	size_t ubytes, mbytes;
+	int result = 0;
+	unsigned char __user *buf = NULL;
+	unsigned char *kbuf = NULL;
+	char *ptr = page_address(segment->cma);
+
+	if (image->file_mode)
+		kbuf = segment->kbuf;
+	else
+		buf = segment->buf;
+	ubytes = segment->bufsz;
+	mbytes = segment->memsz;
+	maddr = segment->mem;
+
+	/* Initialize the buffer with zeros to allow for smaller input buffers */
+	memset(ptr, 0, mbytes);
+
+	/* Then copy from source buffer to the CMA one */
+	while (mbytes) {
+		size_t uchunk, mchunk;
+
+		ptr += maddr & ~PAGE_MASK;
+		mchunk = min_t(size_t, mbytes,
+				PAGE_SIZE - (maddr & ~PAGE_MASK));
+		uchunk = min(ubytes, mchunk);
+
+		if (uchunk) {
+			/* For file based kexec, source pages are in kernel memory */
+			if (image->file_mode)
+				memcpy(ptr, kbuf, uchunk);
+			else
+				result = copy_from_user(ptr, buf, uchunk);
+			ubytes -= uchunk;
+			if (image->file_mode)
+				kbuf += uchunk;
+			else
+				buf += uchunk;
+		}
+
+		if (result) {
+			result = -EFAULT;
+			goto out;
+		}
+
+		ptr    += mchunk;
+		maddr  += mchunk;
+		mbytes -= mchunk;
+
+		cond_resched();
+	}
+out:
+	return result;
+}
+
 static int kimage_load_normal_segment(struct kimage *image,
 					 struct kexec_segment *segment)
 {
@@ -733,6 +812,9 @@ static int kimage_load_normal_segment(struct kimage *image,
 	mbytes = segment->memsz;
 	maddr = segment->mem;
 
+	if (segment->cma)
+		return kimage_load_cma_segment(image, segment);
+
 	result = kimage_set_destination(image, maddr);
 	if (result < 0)
 		goto out;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index fba686487e3b..92bf4ab7b7be 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -27,6 +27,7 @@
 #include <linux/kernel_read_file.h>
 #include <linux/syscalls.h>
 #include <linux/vmalloc.h>
+#include <linux/dma-map-ops.h>
 #include "kexec_internal.h"
 
 #ifdef CONFIG_KEXEC_SIG
@@ -230,6 +231,8 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 		ret = 0;
 	}
 
+	image->no_cma = !!(flags & KEXEC_FILE_NO_CMA);
+
 	if (cmdline_len) {
 		image->cmdline_buf = memdup_user(cmdline_ptr, cmdline_len);
 		if (IS_ERR(image->cmdline_buf)) {
@@ -632,6 +635,38 @@ static int kexec_walk_resources(struct kexec_buf *kbuf,
 		return walk_system_ram_res(0, ULONG_MAX, kbuf, func);
 }
 
+static int kexec_alloc_contig(struct kexec_buf *kbuf)
+{
+	u32 pages = (u32)(kbuf->memsz >> PAGE_SHIFT);
+	unsigned long mem;
+	struct page *p;
+
+	if (kbuf->image->no_cma)
+		return -EPERM;
+
+	p = dma_alloc_from_contiguous(NULL, pages, get_order(kbuf->buf_align), true);
+	if (!p)
+		return -EADDRNOTAVAIL;
+
+	pr_debug("allocated %d DMA pages at 0x%lx", pages, page_to_boot_pfn(p));
+
+	mem = page_to_boot_pfn(p) << PAGE_SHIFT;
+
+	if (kimage_is_destination_range(kbuf->image, mem, mem + kbuf->memsz)) {
+		/* Our region is already in use by a statically defined one. Bail out. */
+		pr_debug("CMA overlaps existing mem: 0x%lx+0x%lx\n", mem, kbuf->memsz);
+		dma_release_from_contiguous(NULL, p, pages);
+		return -EADDRNOTAVAIL;
+	}
+
+	kbuf->mem = page_to_boot_pfn(p) << PAGE_SHIFT;
+	kbuf->cma = p;
+
+	arch_kexec_post_alloc_pages(page_address(p), pages, 0);
+
+	return 0;
+}
+
 /**
  * kexec_locate_mem_hole - find free memory for the purgatory or the next kernel
  * @kbuf:	Parameters for the memory search.
@@ -694,10 +729,21 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
 	kbuf->memsz = ALIGN(kbuf->memsz, PAGE_SIZE);
 	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
 
-	/* Walk the RAM ranges and allocate a suitable range for the buffer */
-	ret = arch_kexec_locate_mem_hole(kbuf);
-	if (ret)
-		return ret;
+	/*
+	 * Try to find a free physically contiguous block of memory first. With that, we
+	 * can avoid any copying at kexec time.
+	 */
+	kbuf->cma = NULL;
+	ret = kexec_alloc_contig(kbuf);
+	if (ret) {
+		/*
+		 * Could not find one. Walk the RAM ranges and allocate pages for the
+		 * buffer. Maybe some even get us into the target range.
+		 */
+		ret = arch_kexec_locate_mem_hole(kbuf);
+		if (ret)
+			return ret;
+	}
 
 	/* Found a suitable memory range */
 	ksegment = &kbuf->image->segment[kbuf->image->nr_segments];
@@ -705,6 +751,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
 	ksegment->bufsz = kbuf->bufsz;
 	ksegment->mem = kbuf->mem;
 	ksegment->memsz = kbuf->memsz;
+	ksegment->cma = kbuf->cma;
 	kbuf->image->nr_segments++;
 	return 0;
 }
-- 
2.34.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

