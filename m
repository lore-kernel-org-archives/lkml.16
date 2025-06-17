Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180E2E3AF6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193783; cv=none; b=Mft0XEqxZLe5BUdLRHjNgaU2j3ib4pd9qLTwvcsYbAQE7ZWhD8yLC++p04sy4+MzOHKRFlOFkCKJ96uODyeRR42hgiqrjhkqdezbHJijVw4zyIw7UjhBtUIWV1Ki4W4BSmG+P0gckJWtFQ/OF05/KNCKqZmdTD4VVVTmO7NMuk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193783; c=relaxed/simple;
	bh=oXxbhsdF7Ovsv3JxjK+zbv6G6DnkU4vMj28oo9wfwDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVcyojeiufwuEcQcGhFR79Y+BECk7cYE3ATmM20D42etpJmPeiUVS9l9hMffWPjV+FLKu8Slj7DqNvgAs/vf4HrSkqCTuCBrylH/ZmHpxj2bf1+i7ISeTclBMZpX0e1iJjJ68FnQ80ajmE6SLuxddpM+odZJQwpok7aQce2woOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HrAKiXjJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HrAKiXjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750193779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3nV7xFalwTU6jumFi5RVEwLdhhgciIX+H7UfLXI3Le4=;
	b=HrAKiXjJ3qU1lYh44V/HoByZV1ilJWYBq7Ef1IiqVXfNymWkIaMd+yl0ILM6njCAJGni3Y
	rv3I7EaKB2k9+gY4wHCE1XquEyW0UkoHDeq1W9bv99Ihsc9yLFWg6xmC++zBPQ2nacPJWQ
	HsjjM1gwK1IUhAaH1KhQPuzs0Co00NA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-yNK4230UOd6ZRrX4X5c9EA-1; Tue, 17 Jun 2025 16:56:17 -0400
X-MC-Unique: yNK4230UOd6ZRrX4X5c9EA-1
X-Mimecast-MFC-AGG-ID: yNK4230UOd6ZRrX4X5c9EA_1750193777
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb3466271fso2137096d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193777; x=1750798577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nV7xFalwTU6jumFi5RVEwLdhhgciIX+H7UfLXI3Le4=;
        b=EOfCFhSdbF5/zo3wRA6cTzmzFH7LB2GAqEuQSDni96BUe520hOcQbRRvBUJv/MLi5x
         mhTZtWSrQ+U9UfZROZ0PmW0ZwgZAZ+cfNXREz1LuHr8BMh4z/duSuyxkU8YZbvhKs4KC
         Nn2g6xsClOqOnT54p59M2EX1EG0d9TrQCldiIwELyGRABAbjQMzIWiHxu9jjHDhh1zsh
         jdjgqT4+le036dq7Vo2UGfaPve0FAZnwaBFeaKSqwAUt3lJKfghXbNjuH60yV9sZ/pn9
         bb9Futq67+C55w6xr1oS5BPlfwx4ZspDugIC/ClP4CctzL11hxhdaTqEpMTM4JjVGes+
         S9lg==
X-Gm-Message-State: AOJu0Yxyk+iZub1IwheVdqqTRJNFkml+yPCR2nDTmjw+ezI+4YpHNNPu
	F4uRlx0VpZC1oABfRvvhUz3X3r2hApYCHt3UHbH3+ahqlgc2mpilDp0BXyZZLqj0K8yKDyJr6we
	MrKoGmrRvpNKw2J/HgUOltZG0KuwHTvnZKJ2NSdeAemZYBkpIzrtTS90tIYw4Hdl3aw==
X-Gm-Gg: ASbGncvRJKZlg+voy1LEEz9pKxPqcf1ApcAgygUUCCoBTH63o1v5AIMLJXDABtIRZJj
	sONJiX0u2UX7NqIyZSitev/TsYklnsmUG6Uy/L5HYmWCX94TlL57FN3ljGRK9FjXX4s+Rcjkct8
	SC8l/A4MlKfTx4B6p4pcLSJ1b6QITl1BmutWF1tChYsKl7xrs7fyyAMKWa/I/BHLtWsUwTmLC8D
	p89hr6wE1Uvu3AmddxKK/6WtYBqh8jGfFQQa9MvCrEEwsIXQfyPapu1G4O2Xw7WHWobLJzWXl+h
	OsnyNs9uCGJUzg==
X-Received: by 2002:a05:6214:e6a:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fb68af9346mr805336d6.6.1750193777248;
        Tue, 17 Jun 2025 13:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfr6vkj7befOEfUGpHUjaSkVeQQacYkp2oyTmRU2sDcradB4K28NMZ2JLpNbMkLF2e5U8h5w==
X-Received: by 2002:a05:6214:e6a:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fb68af9346mr804946d6.6.1750193776753;
        Tue, 17 Jun 2025 13:56:16 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5f63431bsm10544746d6.43.2025.06.17.13.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:56:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:56:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aFHWbX_LTjcRveVm@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-6-peterx@redhat.com>
 <20250613142903.GL1174925@nvidia.com>
 <aExDMO5fZ_VkSPqP@x1.local>
 <20250613160956.GN1174925@nvidia.com>
 <aEx4x_tvXzgrIanl@x1.local>
 <20250613231657.GO1174925@nvidia.com>
 <aFCVX6ubmyCxyrNF@x1.local>
 <20250616230011.GS1174925@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616230011.GS1174925@nvidia.com>

On Mon, Jun 16, 2025 at 08:00:11PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 16, 2025 at 06:06:23PM -0400, Peter Xu wrote:
> 
> > Can I understand it as a suggestion to pass in a bitmask into the core mm
> > API (e.g. keep the name of mm_get_unmapped_area_aligned()), instead of a
> > constant "align", so that core mm would try to allocate from the largest
> > size to smaller until it finds some working VA to use?
> 
> I don't think you need a bitmask.
> 
> Split the concerns, the caller knows what is inside it's FD. It only
> needs to provide the highest pgoff aligned folio/pfn within the FD.

Ultimately I even dropped this hint.  I found that it's not really
get_unmapped_area()'s job to detect over-sized pgoffs.  It's mmap()'s job.
So I decided to avoid this parameter as of now.

> 
> The mm knows what leaf page tables options exist. It should try to
> align to the closest leaf page table size that is <= the FD's max
> aligned folio.

So again IMHO this is also not per-FD information, but needs to be passed
over from the driver for each call.

Likely the "order" parameter appeared in other discussions to imply a
maximum supported size from the driver side (or, for a folio, but that is
definitely another user after this series can land).

So far I didn't yet add the "order", because currently VFIO definitely
supports all max orders the system supports.  Maybe we can add the order
when there's a real need, but maybe it won't happen in the near future?

In summary, I came up with below changes, would below look reasonable?

I also added Liam and Lorenzo in this reply.

================8<================

From 7f1b7aada21ab036849edc49635fb0656e0457c4 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 30 May 2025 12:45:55 -0400
Subject: [PATCH 1/4] mm: Rename __thp_get_unmapped_area to
 mm_get_unmapped_area_aligned

This function is handy to locate an unmapped region which is best aligned
to the specified alignment, taking whatever form of pgoff address space
into considerations.

Rename the function and make it more general for even non-THP use in follow
up patches.  Dropping "THP" in the name because it doesn't have much to do
with THP internally.  The suffix "_aligned" imply it is a helper to
generate aligned virtual address based on what is specified (which can be
not PMD_SIZE).

When at it, using check_add_overflow() helpers to verify the inputs to make
sure no overflow will happen.

Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/huge_memory.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 4734de1dc0ae..885b5845dbba 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1088,23 +1088,28 @@ static inline bool is_transparent_hugepage(const struct folio *folio)
 		folio_test_large_rmappable(folio);
 }
 
-static unsigned long __thp_get_unmapped_area(struct file *filp,
+static unsigned long mm_get_unmapped_area_aligned(struct file *filp,
 		unsigned long addr, unsigned long len,
-		loff_t off, unsigned long flags, unsigned long size,
+		loff_t off, unsigned long flags, unsigned long align,
 		vm_flags_t vm_flags)
 {
-	loff_t off_end = off + len;
-	loff_t off_align = round_up(off, size);
+	loff_t off_end;
+	loff_t off_align = round_up(off, align);
 	unsigned long len_pad, ret, off_sub;
 
 	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
 		return 0;
 
-	if (off_end <= off_align || (off_end - off_align) < size)
+	/* Can't use the overflow API, do manual check for now */
+	if (off_align < off)
 		return 0;
-
-	len_pad = len + size;
-	if (len_pad < len || (off + len_pad) < off)
+	if (check_add_overflow(off, len, &off_end))
+		return 0;
+	if (off_end <= off_align || (off_end - off_align) < align)
+		return 0;
+	if (check_add_overflow(len, align, &len_pad))
+		return 0;
+	if ((off + len_pad) < off)
 		return 0;
 
 	ret = mm_get_unmapped_area_vmflags(current->mm, filp, addr, len_pad,
@@ -1118,16 +1123,16 @@ static unsigned long __thp_get_unmapped_area(struct file *filp,
 		return 0;
 
 	/*
-	 * Do not try to align to THP boundary if allocation at the address
+	 * Do not try to provide alignment if allocation at the address
 	 * hint succeeds.
 	 */
 	if (ret == addr)
 		return addr;
 
-	off_sub = (off - ret) & (size - 1);
+	off_sub = (off - ret) & (align - 1);
 
 	if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
-		return ret + size;
+		return ret + align;
 
 	ret += off_sub;
 	return ret;
@@ -1140,7 +1145,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
 	unsigned long ret;
 	loff_t off = (loff_t)pgoff << PAGE_SHIFT;
 
-	ret = __thp_get_unmapped_area(filp, addr, len, off, flags, PMD_SIZE, vm_flags);
+	ret = mm_get_unmapped_area_aligned(filp, addr, len, off, flags,
+					   PMD_SIZE, vm_flags);
 	if (ret)
 		return ret;
 
-- 
2.49.0


From 709379a39f4a59a6d3bda7a39ca55f08fdaf9e1a Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 17 Jun 2025 15:27:07 -0400
Subject: [PATCH 2/4] mm: huge_mapping_get_va_aligned() helper

Add this helper to allocate a VA that would be best to map huge mappings
that the system would support. It can be used in file's get_unmapped_area()
functions as long as proper max_pgoff will be provided so that core mm will
know the available range of pgoff to map in the future.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h | 10 ++++++++-
 mm/huge_memory.c        | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2f190c90192d..59fdafb1034b 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -339,7 +339,8 @@ unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
 		vm_flags_t vm_flags);
-
+unsigned long huge_mapping_get_va_aligned(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags);
 bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
 int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
 		unsigned int new_order);
@@ -543,6 +544,13 @@ thp_get_unmapped_area_vmflags(struct file *filp, unsigned long addr,
 	return 0;
 }
 
+static inline unsigned long
+huge_mapping_get_va_aligned(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
+{
+	return mm_get_unmapped_area(current->mm, filp, addr, len, pgoff, flags);
+}
+
 static inline bool
 can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins)
 {
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 885b5845dbba..bc016b656dc7 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1161,6 +1161,52 @@ unsigned long thp_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(thp_get_unmapped_area);
 
+/**
+ * huge_mapping_get_va_aligned: best-effort VA allocation for huge mappings
+ *
+ * @filp: file target of the mmap() request
+ * @addr: hint address from mmap() request
+ * @len: len of the mmap() request
+ * @pgoff: file offset of the mmap() request
+ * @flags: flags of the mmap() request
+ *
+ * This function should normally be used by a driver's specific
+ * get_unmapped_area() handler to provide a huge-mapping friendly virtual
+ * address for a specific mmap() request.  The caller should pass in most
+ * of the parameters from the get_unmapped_area() request.
+ *
+ * Normally it means the caller's mmap() needs to also support any possible
+ * huge mappings the system supports.
+ *
+ * Return: a best-effort virtual address that will satisfy the most huge
+ * mappings for the result VMA to be mapped.
+ */
+unsigned long huge_mapping_get_va_aligned(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
+{
+	loff_t off = (loff_t)pgoff << PAGE_SHIFT;
+	unsigned long ret;
+
+	/* TODO: support continuous ptes/pmds */
+	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
+	    len >= PUD_SIZE) {
+		ret = mm_get_unmapped_area_aligned(filp, addr, len, off, flags,
+						   PUD_SIZE, 0);
+		if (ret)
+			return ret;
+	}
+
+	if (len >= PMD_SIZE) {
+		ret = mm_get_unmapped_area_aligned(filp, addr, len, off, flags,
+						   PMD_SIZE, 0);
+		if (ret)
+			return ret;
+	}
+
+	return mm_get_unmapped_area(current->mm, filp, addr, len, pgoff, flags);
+}
+EXPORT_SYMBOL_GPL(huge_mapping_get_va_aligned);
+
 static struct folio *vma_alloc_anon_folio_pmd(struct vm_area_struct *vma,
 		unsigned long addr)
 {
-- 
2.49.0


From ff90dbba05ea54e5c6690fbedf330c837f8f0ea1 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Wed, 4 Jun 2025 17:54:40 -0400
Subject: [PATCH 3/4] vfio: Introduce vfio_device_ops.get_unmapped_area hook

Add a hook to vfio_device_ops to allow sub-modules provide virtual
addresses for an mmap() request.

Note that the fallback will be mm_get_unmapped_area(), which should
maintain the old behavior of generic VA allocation (__get_unmapped_area).
It's a bit unfortunate that is needed, as the current get_unmapped_area()
file ops cannot support a retval which fallbacks to the default.  So that
is needed both here and whenever sub-module will opt-in with its own.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 drivers/vfio/vfio_main.c | 25 +++++++++++++++++++++++++
 include/linux/vfio.h     |  8 ++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 1fd261efc582..480cc2398810 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1354,6 +1354,28 @@ static int vfio_device_fops_mmap(struct file *filep, struct vm_area_struct *vma)
 	return device->ops->mmap(device, vma);
 }
 
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+static unsigned long vfio_device_get_unmapped_area(struct file *file,
+						   unsigned long addr,
+						   unsigned long len,
+						   unsigned long pgoff,
+						   unsigned long flags)
+{
+	struct vfio_device_file *df = file->private_data;
+	struct vfio_device *device = df->device;
+	unsigned long ret;
+
+	if (device->ops->get_unmapped_area) {
+		ret = device->ops->get_unmapped_area(device, file, addr,
+						      len, pgoff, flags);
+		if (ret)
+			return ret;
+	}
+
+	return mm_get_unmapped_area(current->mm, file, addr, len, pgoff, flags);
+}
+#endif
+
 const struct file_operations vfio_device_fops = {
 	.owner		= THIS_MODULE,
 	.open		= vfio_device_fops_cdev_open,
@@ -1363,6 +1385,9 @@ const struct file_operations vfio_device_fops = {
 	.unlocked_ioctl	= vfio_device_fops_unl_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.mmap		= vfio_device_fops_mmap,
+#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
+	.get_unmapped_area = vfio_device_get_unmapped_area,
+#endif
 };
 
 static struct vfio_device *vfio_device_from_file(struct file *file)
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 707b00772ce1..d900541e2716 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -108,6 +108,8 @@ struct vfio_device {
  * @dma_unmap: Called when userspace unmaps IOVA from the container
  *             this device is attached to.
  * @device_feature: Optional, fill in the VFIO_DEVICE_FEATURE ioctl
+ * @get_unmapped_area: Optional, provide virtual address hint for mmap().
+ *                     If zero is returned, fallback to the default allocator.
  */
 struct vfio_device_ops {
 	char	*name;
@@ -135,6 +137,12 @@ struct vfio_device_ops {
 	void	(*dma_unmap)(struct vfio_device *vdev, u64 iova, u64 length);
 	int	(*device_feature)(struct vfio_device *device, u32 flags,
 				  void __user *arg, size_t argsz);
+	unsigned long (*get_unmapped_area)(struct vfio_device *device,
+					   struct file *file,
+					   unsigned long addr,
+					   unsigned long len,
+					   unsigned long pgoff,
+					   unsigned long flags);
 };
 
 #if IS_ENABLED(CONFIG_IOMMUFD)
-- 
2.49.0

From 38539aafac83ae204d3e03f441f7e33841db6b07 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 30 May 2025 13:21:20 -0400
Subject: [PATCH 4/4] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings

This patch enables best-effort mmap() for vfio-pci bars even without
MAP_FIXED, so as to utilize huge pfnmaps as much as possible.  It should
also avoid userspace changes (switching to MAP_FIXED with pre-aligned VA
addresses) to start enabling huge pfnmaps on VFIO bars.

Here the trick is making sure the MMIO PFNs will be aligned with the VAs
allocated from mmap() when !MAP_FIXED, so that whatever returned from
mmap(!MAP_FIXED) of vfio-pci MMIO regions will be automatically suitable
for huge pfnmaps as much as possible.

To achieve that, a custom vfio_device's get_unmapped_area() for vfio-pci
devices is needed.

Note, MMIO physical addresses should normally be guaranteed to be always
bar-size aligned, hence the bar offset can logically be directly used to do
the calculation.  However to make it strict and clear (rather than relying
on spec details), we still try to fetch the bar's physical addresses from
pci_dev.resource[].

[1] https://lore.kernel.org/linux-pci/20250529214414.1508155-1-amastro@fb.com/

Reported-by: Alex Mastro <amastro@fb.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 drivers/vfio/pci/vfio_pci.c      |  1 +
 drivers/vfio/pci/vfio_pci_core.c | 34 ++++++++++++++++++++++++++++++++
 include/linux/vfio_pci_core.h    |  3 +++
 3 files changed, 38 insertions(+)

diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index 5ba39f7623bb..32b570f17d0f 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -144,6 +144,7 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.detach_ioas	= vfio_iommufd_physical_detach_ioas,
 	.pasid_attach_ioas	= vfio_iommufd_physical_pasid_attach_ioas,
 	.pasid_detach_ioas	= vfio_iommufd_physical_pasid_detach_ioas,
+	.get_unmapped_area	= vfio_pci_core_get_unmapped_area,
 };
 
 static int vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 6328c3a05bcd..5392bec4929a 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1641,6 +1641,40 @@ static unsigned long vma_to_pfn(struct vm_area_struct *vma)
 	return (pci_resource_start(vdev->pdev, index) >> PAGE_SHIFT) + pgoff;
 }
 
+/*
+ * Hint function to provide mmap() virtual address candidate so as to be
+ * able to map huge pfnmaps as much as possible.  It is done by aligning
+ * the VA to the PFN to be mapped in the specific bar.
+ *
+ * Note that this function does the minimum check on mmap() parameters to
+ * make the PFN calculation valid only. The majority of mmap() sanity check
+ * will be done later in mmap().
+ */
+unsigned long vfio_pci_core_get_unmapped_area(struct vfio_device *device,
+		struct file *file, unsigned long addr, unsigned long len,
+		unsigned long pgoff, unsigned long flags)
+{
+	struct vfio_pci_core_device *vdev =
+		container_of(device, struct vfio_pci_core_device, vdev);
+	struct pci_dev *pdev = vdev->pdev;
+	unsigned int index = pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
+	unsigned long req_start;
+
+	/* Currently, only bars 0-5 supports huge pfnmap */
+	if (index >= VFIO_PCI_ROM_REGION_INDEX)
+		return 0;
+
+	/* Calculate the start of physical address to be mapped */
+	req_start = (pgoff << PAGE_SHIFT) & ((1UL << VFIO_PCI_OFFSET_SHIFT) - 1);
+	if (check_add_overflow(req_start, pci_resource_start(pdev, index),
+			       &req_start))
+		return 0;
+
+	return huge_mapping_get_va_aligned(file, addr, len, req_start >> PAGE_SHIFT,
+					   flags);
+}
+EXPORT_SYMBOL_GPL(vfio_pci_core_get_unmapped_area);
+
 static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
 					   unsigned int order)
 {
diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
index fbb472dd99b3..d97c920b4dbf 100644
--- a/include/linux/vfio_pci_core.h
+++ b/include/linux/vfio_pci_core.h
@@ -119,6 +119,9 @@ ssize_t vfio_pci_core_read(struct vfio_device *core_vdev, char __user *buf,
 		size_t count, loff_t *ppos);
 ssize_t vfio_pci_core_write(struct vfio_device *core_vdev, const char __user *buf,
 		size_t count, loff_t *ppos);
+unsigned long vfio_pci_core_get_unmapped_area(struct vfio_device *device,
+		struct file *file, unsigned long addr, unsigned long len,
+		unsigned long pgoff, unsigned long flags);
 int vfio_pci_core_mmap(struct vfio_device *core_vdev, struct vm_area_struct *vma);
 void vfio_pci_core_request(struct vfio_device *core_vdev, unsigned int count);
 int vfio_pci_core_match(struct vfio_device *core_vdev, char *buf);
-- 
2.49.0


-- 
Peter Xu

