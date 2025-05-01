Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247F27815F
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140125; cv=none; b=giwQpCmTnoO/gJrvMMD+BENkh43vows4PkTTKemXXdH1XSFop5yqnw0XHK2RKYa0FHUYe6ze3TkGKPkB8rYpIveQK1ahU1Ra2kwjV8dsOHtHFrCzJ9UbI3fsesGzjfI+M867C83BpsxuOGzVTRcsHSQxMbXWxrujPSIrguCbFF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140125; c=relaxed/simple;
	bh=zdWPhrCRGhenM783PYZaKYNEDK7bnm3XtFRg4N5OXU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cNONYsAIXyJKfVwukF7VTFv7W6LIjgXk8scD47aTIXOiYvUVrRGGtRdKWvv9TkPwWccsxtk+a6sS4VkpGNX59zuEIEiFw9L9LDrprp3oL914r+4rhgok+HtHEZjZ1xYmIgYX/e0T2TbfY1RTgJDLMYWaEWCdh0LVR0M6zcyiMIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z29PYda/; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z29PYda/"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b16f5365310so907845a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140123; x=1746744923; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahn0CpwGlow7d1B2oRzig1Hirg8bGDbJkNyQ2rWb7+Y=;
        b=Z29PYda/e5zrfTN5B5QYgq10nM2gsTQb/ALdV5HP98MRKQSKL59G4/yt+LHB5hAxje
         equnEZrNetGzk0hH132g/j57rLkcg3R2WFYhZHfkyHAkzrCo3K2RdU4G1ooBDaQ/aTxK
         4E2ElhOqUHyTQI3kQr8Q6jGeKQ2ZeKYjpPfbfLiA+/UVCQ3PMK8emXSw/GhfokVO/Ko8
         rURx1j4RtL14EqDdJ06bfml7KWVjvEyohuYcfxP+fKs63NZ7dM7mnffVZykLTAvxLXdW
         bZiBa1z2AiGrPjje9BvY6iqu6sEoYcHZOIdOg8Mq8UobQfxtAWJ+HsOAei/FIc56g3Cq
         uOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140123; x=1746744923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahn0CpwGlow7d1B2oRzig1Hirg8bGDbJkNyQ2rWb7+Y=;
        b=TKMpFR0CYnuO+FFGIwhYej4lHE1ieUCvRks97SA/osIkyJ5sRu3naijXtM/lk+gPXA
         xuPigPsztmpclP18D+gbe2LLDM/2hZIBVN3MIiXffoN5KnfrSJOYZEVuFfxfa7/z5OCR
         9tujUYq2cgxepNCRdtt9eF5hSaaKF4fzKyvUp1NOT54z6OTggxu31iabIrQdeONbNDIJ
         egql2oJrHWMz3To7Ui8MHpFhGk/p0TPSDfeu9hAd0a1EUJv9/lQG8XWxJOg95eQ4tlG+
         MQCMHC2tUhi9KBt3RtxgHkQM7tZncIhfYeN1nKgSostoo8wY6aJQInMsdJ/x9SjAxXnd
         1gZg==
X-Gm-Message-State: AOJu0Yy9EP1D4+0r9uaD/2gMoulZpEnzOpe1SUaZIHCUj2hTrG6enjMM
	sRN9w3JSAdazNOva5gguv1R7OawrWXizy2SlqqjaDP3dwEZG8fpGMIYb46FmniiJR2tWbC3EST/
	xQR1dBc/wPC/J9J4GNcYgS27j1fRfL2swOauSFkaD+SXnbLv4aQPsFkMMr3U/JY5vy2iaCmZwtw
	U/uku4v6u5Q4IRQ03q0474bSdNxd3uR1Z1MGuxZ+AnEaFivxpHaEDMlAa3FpCmRQ==
X-Google-Smtp-Source: AGHT+IE7Ipcc3Yfu0opFD7T9fLG2qdetuzGT/pPArsEd4Y7NNLnPX6DlCyLOptaPTidbIU/KZquDv6iti8nU9gNz
X-Received: from pgq9.prod.google.com ([2002:a63:1049:0:b0:b1f:9d93:19a7])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9004:b0:1f5:9393:fd4d with SMTP id adf61e73a8af0-20ce04e70cdmr969801637.27.1746140122500;
 Thu, 01 May 2025 15:55:22 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:14 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-8-changyuanl@google.com>
Subject: [PATCH v7 07/18] kexec: enable KHO support for memory preservation
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Introduce APIs allowing KHO users to preserve memory across kexec and
get access to that memory after boot of the kexeced kernel

kho_preserve_folio() - record a folio to be preserved over kexec
kho_restore_folio() - recreates the folio from the preserved memory
kho_preserve_phys() - record physically contiguous range to be
preserved over kexec.

The memory preservations are tracked by two levels of xarrays to manage
chunks of per-order 512 byte bitmaps. For instance if PAGE_SIZE = 4096,
the entire 1G order of a 1TB x86 system would fit inside a single 512
byte bitmap. For order 0 allocations each bitmap will cover 16M of
address space. Thus, for 16G of memory at most 512K of bitmap memory
will be needed for order 0.

At serialization time all bitmaps are recorded in a linked list of pages
for the next kernel to process and the physical address of the list is
recorded in KHO FDT.

The next kernel then processes that list, reserves the memory ranges and
later, when a user requests a folio or a physical range, KHO restores
corresponding memory map entries.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec_handover.h |  36 +++
 kernel/kexec_handover.c        | 406 +++++++++++++++++++++++++++++++++
 2 files changed, 442 insertions(+)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 02dcfc8c427e3..348844cffb136 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -16,13 +16,34 @@ enum kho_event {
 	KEXEC_KHO_ABORT = 1,
 };
 
+struct folio;
 struct notifier_block;
 
+#define DECLARE_KHOSER_PTR(name, type) \
+	union {                        \
+		phys_addr_t phys;      \
+		type ptr;              \
+	} name
+#define KHOSER_STORE_PTR(dest, val)               \
+	({                                        \
+		typeof(val) v = val;              \
+		typecheck(typeof((dest).ptr), v); \
+		(dest).phys = virt_to_phys(v);    \
+	})
+#define KHOSER_LOAD_PTR(src)                                                 \
+	({                                                                   \
+		typeof(src) s = src;                                         \
+		(typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NULL); \
+	})
+
 struct kho_serialization;
 
 #ifdef CONFIG_KEXEC_HANDOVER
 bool kho_is_enabled(void);
 
+int kho_preserve_folio(struct folio *folio);
+int kho_preserve_phys(phys_addr_t phys, size_t size);
+struct folio *kho_restore_folio(phys_addr_t phys);
 int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt);
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys);
 
@@ -39,6 +60,21 @@ static inline bool kho_is_enabled(void)
 	return false;
 }
 
+static inline int kho_preserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_preserve_phys(phys_addr_t phys, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct folio *kho_restore_folio(phys_addr_t phys)
+{
+	return NULL;
+}
+
 static inline int kho_add_subtree(struct kho_serialization *ser,
 				  const char *name, void *fdt)
 {
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 59f3cf9557f50..3bf74b4960f84 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "KHO: " fmt
 
 #include <linux/cma.h>
+#include <linux/count_zeros.h>
 #include <linux/debugfs.h>
 #include <linux/kexec.h>
 #include <linux/kexec_handover.h>
@@ -44,12 +45,307 @@ static int __init kho_parse_enable(char *p)
 }
 early_param("kho", kho_parse_enable);
 
+/*
+ * Keep track of memory that is to be preserved across KHO.
+ *
+ * The serializing side uses two levels of xarrays to manage chunks of per-order
+ * 512 byte bitmaps. For instance if PAGE_SIZE = 4096, the entire 1G order of a
+ * 1TB system would fit inside a single 512 byte bitmap. For order 0 allocations
+ * each bitmap will cover 16M of address space. Thus, for 16G of memory at most
+ * 512K of bitmap memory will be needed for order 0.
+ *
+ * This approach is fully incremental, as the serialization progresses folios
+ * can continue be aggregated to the tracker. The final step, immediately prior
+ * to kexec would serialize the xarray information into a linked list for the
+ * successor kernel to parse.
+ */
+
+#define PRESERVE_BITS (512 * 8)
+
+struct kho_mem_phys_bits {
+	DECLARE_BITMAP(preserve, PRESERVE_BITS);
+};
+
+struct kho_mem_phys {
+	/*
+	 * Points to kho_mem_phys_bits, a sparse bitmap array. Each bit is sized
+	 * to order.
+	 */
+	struct xarray phys_bits;
+};
+
+struct kho_mem_track {
+	/* Points to kho_mem_phys, each order gets its own bitmap tree */
+	struct xarray orders;
+};
+
+struct khoser_mem_chunk;
+
 struct kho_serialization {
 	struct page *fdt;
 	struct list_head fdt_list;
 	struct dentry *sub_fdt_dir;
+	struct kho_mem_track track;
+	/* First chunk of serialized preserved memory map */
+	struct khoser_mem_chunk *preserved_mem_map;
 };
 
+static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
+{
+	void *elm, *res;
+
+	elm = xa_load(xa, index);
+	if (elm)
+		return elm;
+
+	elm = kzalloc(sz, GFP_KERNEL);
+	if (!elm)
+		return ERR_PTR(-ENOMEM);
+
+	res = xa_cmpxchg(xa, index, NULL, elm, GFP_KERNEL);
+	if (xa_is_err(res))
+		res = ERR_PTR(xa_err(res));
+
+	if (res) {
+		kfree(elm);
+		return res;
+	}
+
+	return elm;
+}
+
+static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
+			     unsigned long end_pfn)
+{
+	struct kho_mem_phys_bits *bits;
+	struct kho_mem_phys *physxa;
+
+	while (pfn < end_pfn) {
+		const unsigned int order =
+			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
+		const unsigned long pfn_high = pfn >> order;
+
+		physxa = xa_load(&track->orders, order);
+		if (!physxa)
+			continue;
+
+		bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
+		if (!bits)
+			continue;
+
+		clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+
+		pfn += 1 << order;
+	}
+}
+
+static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
+				unsigned int order)
+{
+	struct kho_mem_phys_bits *bits;
+	struct kho_mem_phys *physxa;
+	const unsigned long pfn_high = pfn >> order;
+
+	might_sleep();
+
+	physxa = xa_load_or_alloc(&track->orders, order, sizeof(*physxa));
+	if (IS_ERR(physxa))
+		return PTR_ERR(physxa);
+
+	bits = xa_load_or_alloc(&physxa->phys_bits, pfn_high / PRESERVE_BITS,
+				sizeof(*bits));
+	if (IS_ERR(bits))
+		return PTR_ERR(bits);
+
+	set_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+
+	return 0;
+}
+
+/* almost as free_reserved_page(), just don't free the page */
+static void kho_restore_page(struct page *page)
+{
+	ClearPageReserved(page);
+	init_page_count(page);
+	adjust_managed_page_count(page, 1);
+}
+
+/**
+ * kho_restore_folio - recreates the folio from the preserved memory.
+ * @phys: physical address of the folio.
+ *
+ * Return: pointer to the struct folio on success, NULL on failure.
+ */
+struct folio *kho_restore_folio(phys_addr_t phys)
+{
+	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
+	unsigned long order;
+
+	if (!page)
+		return NULL;
+
+	order = page->private;
+	if (order) {
+		if (order > MAX_PAGE_ORDER)
+			return NULL;
+
+		prep_compound_page(page, order);
+	} else {
+		kho_restore_page(page);
+	}
+
+	return page_folio(page);
+}
+EXPORT_SYMBOL_GPL(kho_restore_folio);
+
+/* Serialize and deserialize struct kho_mem_phys across kexec
+ *
+ * Record all the bitmaps in a linked list of pages for the next kernel to
+ * process. Each chunk holds bitmaps of the same order and each block of bitmaps
+ * starts at a given physical address. This allows the bitmaps to be sparse. The
+ * xarray is used to store them in a tree while building up the data structure,
+ * but the KHO successor kernel only needs to process them once in order.
+ *
+ * All of this memory is normal kmalloc() memory and is not marked for
+ * preservation. The successor kernel will remain isolated to the scratch space
+ * until it completes processing this list. Once processed all the memory
+ * storing these ranges will be marked as free.
+ */
+
+struct khoser_mem_bitmap_ptr {
+	phys_addr_t phys_start;
+	DECLARE_KHOSER_PTR(bitmap, struct kho_mem_phys_bits *);
+};
+
+struct khoser_mem_chunk_hdr {
+	DECLARE_KHOSER_PTR(next, struct khoser_mem_chunk *);
+	unsigned int order;
+	unsigned int num_elms;
+};
+
+#define KHOSER_BITMAP_SIZE                                   \
+	((PAGE_SIZE - sizeof(struct khoser_mem_chunk_hdr)) / \
+	 sizeof(struct khoser_mem_bitmap_ptr))
+
+struct khoser_mem_chunk {
+	struct khoser_mem_chunk_hdr hdr;
+	struct khoser_mem_bitmap_ptr bitmaps[KHOSER_BITMAP_SIZE];
+};
+
+static_assert(sizeof(struct khoser_mem_chunk) == PAGE_SIZE);
+
+static struct khoser_mem_chunk *new_chunk(struct khoser_mem_chunk *cur_chunk,
+					  unsigned long order)
+{
+	struct khoser_mem_chunk *chunk;
+
+	chunk = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!chunk)
+		return NULL;
+	chunk->hdr.order = order;
+	if (cur_chunk)
+		KHOSER_STORE_PTR(cur_chunk->hdr.next, chunk);
+	return chunk;
+}
+
+static void kho_mem_ser_free(struct khoser_mem_chunk *first_chunk)
+{
+	struct khoser_mem_chunk *chunk = first_chunk;
+
+	while (chunk) {
+		struct khoser_mem_chunk *tmp = chunk;
+
+		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
+		kfree(tmp);
+	}
+}
+
+static int kho_mem_serialize(struct kho_serialization *ser)
+{
+	struct khoser_mem_chunk *first_chunk = NULL;
+	struct khoser_mem_chunk *chunk = NULL;
+	struct kho_mem_phys *physxa;
+	unsigned long order;
+
+	xa_for_each(&ser->track.orders, order, physxa) {
+		struct kho_mem_phys_bits *bits;
+		unsigned long phys;
+
+		chunk = new_chunk(chunk, order);
+		if (!chunk)
+			goto err_free;
+
+		if (!first_chunk)
+			first_chunk = chunk;
+
+		xa_for_each(&physxa->phys_bits, phys, bits) {
+			struct khoser_mem_bitmap_ptr *elm;
+
+			if (chunk->hdr.num_elms == ARRAY_SIZE(chunk->bitmaps)) {
+				chunk = new_chunk(chunk, order);
+				if (!chunk)
+					goto err_free;
+			}
+
+			elm = &chunk->bitmaps[chunk->hdr.num_elms];
+			chunk->hdr.num_elms++;
+			elm->phys_start = (phys * PRESERVE_BITS)
+					  << (order + PAGE_SHIFT);
+			KHOSER_STORE_PTR(elm->bitmap, bits);
+		}
+	}
+
+	ser->preserved_mem_map = first_chunk;
+
+	return 0;
+
+err_free:
+	kho_mem_ser_free(first_chunk);
+	return -ENOMEM;
+}
+
+static void deserialize_bitmap(unsigned int order,
+			       struct khoser_mem_bitmap_ptr *elm)
+{
+	struct kho_mem_phys_bits *bitmap = KHOSER_LOAD_PTR(elm->bitmap);
+	unsigned long bit;
+
+	for_each_set_bit(bit, bitmap->preserve, PRESERVE_BITS) {
+		int sz = 1 << (order + PAGE_SHIFT);
+		phys_addr_t phys =
+			elm->phys_start + (bit << (order + PAGE_SHIFT));
+		struct page *page = phys_to_page(phys);
+
+		memblock_reserve(phys, sz);
+		memblock_reserved_mark_noinit(phys, sz);
+		page->private = order;
+	}
+}
+
+static void __init kho_mem_deserialize(const void *fdt)
+{
+	struct khoser_mem_chunk *chunk;
+	const phys_addr_t *mem;
+	int len;
+
+	mem = fdt_getprop(fdt, 0, PROP_PRESERVED_MEMORY_MAP, &len);
+
+	if (!mem || len != sizeof(*mem)) {
+		pr_err("failed to get preserved memory bitmaps\n");
+		return;
+	}
+
+	chunk = *mem ? phys_to_virt(*mem) : NULL;
+	while (chunk) {
+		unsigned int i;
+
+		for (i = 0; i != chunk->hdr.num_elms; i++)
+			deserialize_bitmap(chunk->hdr.order,
+					   &chunk->bitmaps[i]);
+		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
+	}
+}
+
 /*
  * With KHO enabled, memory can become fragmented because KHO regions may
  * be anywhere in physical address space. The scratch regions give us a
@@ -324,6 +620,9 @@ static struct kho_out kho_out = {
 	.lock = __MUTEX_INITIALIZER(kho_out.lock),
 	.ser = {
 		.fdt_list = LIST_HEAD_INIT(kho_out.ser.fdt_list),
+		.track = {
+			.orders = XARRAY_INIT(kho_out.ser.track.orders, 0),
+		},
 	},
 	.finalized = false,
 };
@@ -340,6 +639,73 @@ int unregister_kho_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_kho_notifier);
 
+/**
+ * kho_preserve_folio - preserve a folio across kexec.
+ * @folio: folio to preserve.
+ *
+ * Instructs KHO to preserve the whole folio across kexec. The order
+ * will be preserved as well.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_preserve_folio(struct folio *folio)
+{
+	const unsigned long pfn = folio_pfn(folio);
+	const unsigned int order = folio_order(folio);
+	struct kho_mem_track *track = &kho_out.ser.track;
+
+	if (kho_out.finalized)
+		return -EBUSY;
+
+	return __kho_preserve_order(track, pfn, order);
+}
+EXPORT_SYMBOL_GPL(kho_preserve_folio);
+
+/**
+ * kho_preserve_phys - preserve a physically contiguous range across kexec.
+ * @phys: physical address of the range.
+ * @size: size of the range.
+ *
+ * Instructs KHO to preserve the memory range from @phys to @phys + @size
+ * across kexec.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_preserve_phys(phys_addr_t phys, size_t size)
+{
+	unsigned long pfn = PHYS_PFN(phys);
+	unsigned long failed_pfn = 0;
+	const unsigned long start_pfn = pfn;
+	const unsigned long end_pfn = PHYS_PFN(phys + size);
+	int err = 0;
+	struct kho_mem_track *track = &kho_out.ser.track;
+
+	if (kho_out.finalized)
+		return -EBUSY;
+
+	if (!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	while (pfn < end_pfn) {
+		const unsigned int order =
+			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
+
+		err = __kho_preserve_order(track, pfn, order);
+		if (err) {
+			failed_pfn = pfn;
+			break;
+		}
+
+		pfn += 1 << order;
+	}
+
+	if (err)
+		__kho_unpreserve(track, start_pfn, failed_pfn);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(kho_preserve_phys);
+
 /* Handling for debug/kho/out */
 
 static struct dentry *debugfs_root;
@@ -366,6 +732,25 @@ static int kho_out_update_debugfs_fdt(void)
 static int kho_abort(void)
 {
 	int err;
+	unsigned long order;
+	struct kho_mem_phys *physxa;
+
+	xa_for_each(&kho_out.ser.track.orders, order, physxa) {
+		struct kho_mem_phys_bits *bits;
+		unsigned long phys;
+
+		xa_for_each(&physxa->phys_bits, phys, bits)
+			kfree(bits);
+
+		xa_destroy(&physxa->phys_bits);
+		kfree(physxa);
+	}
+	xa_destroy(&kho_out.ser.track.orders);
+
+	if (kho_out.ser.preserved_mem_map) {
+		kho_mem_ser_free(kho_out.ser.preserved_mem_map);
+		kho_out.ser.preserved_mem_map = NULL;
+	}
 
 	err = blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_KHO_ABORT,
 					   NULL);
@@ -380,12 +765,25 @@ static int kho_abort(void)
 static int kho_finalize(void)
 {
 	int err = 0;
+	u64 *preserved_mem_map;
 	void *fdt = page_to_virt(kho_out.ser.fdt);
 
 	err |= fdt_create(fdt, PAGE_SIZE);
 	err |= fdt_finish_reservemap(fdt);
 	err |= fdt_begin_node(fdt, "");
 	err |= fdt_property_string(fdt, "compatible", KHO_FDT_COMPATIBLE);
+	/**
+	 * Reserve the preserved-memory-map property in the root FDT, so
+	 * that all property definitions will precede subnodes created by
+	 * KHO callers.
+	 */
+	err |= fdt_property_placeholder(fdt, PROP_PRESERVED_MEMORY_MAP,
+					sizeof(*preserved_mem_map),
+					(void **)&preserved_mem_map);
+	if (err)
+		goto abort;
+
+	err = kho_preserve_folio(page_folio(kho_out.ser.fdt));
 	if (err)
 		goto abort;
 
@@ -395,6 +793,12 @@ static int kho_finalize(void)
 	if (err)
 		goto abort;
 
+	err = kho_mem_serialize(&kho_out.ser);
+	if (err)
+		goto abort;
+
+	*preserved_mem_map = (u64)virt_to_phys(kho_out.ser.preserved_mem_map);
+
 	err |= fdt_end_node(fdt);
 	err |= fdt_finish(fdt);
 
@@ -700,6 +1104,8 @@ void __init kho_memory_init(void)
 	if (kho_in.scratch_phys) {
 		kho_scratch = phys_to_virt(kho_in.scratch_phys);
 		kho_release_scratch();
+
+		kho_mem_deserialize(kho_get_fdt());
 	} else {
 		kho_reserve_scratch();
 	}
-- 
2.49.0.906.g1f30a19c02-goog

