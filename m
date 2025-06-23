Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E60B1F873B;
	Mon, 23 Jun 2025 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663958; cv=none; b=DSz6BHHqXsBxiBocwlQFqiA5rwx7abJce6oXw0GcCtjE44Zm3ARsy5UCfz6ByK9afCCWbuPXRtddIzVx9XBr9pvK/oMhDhkmN3582+riWBEuce4WBTfXOnljXNIeKsdY0hxNquBQbVrxmxBQQK6LgM3g1KvSPQn5VTfmWmAfVgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663958; c=relaxed/simple;
	bh=bNs2IGmUjjgr2mV/fxGWA6QhEgEIoJjbqXrhdsHHu2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NM+DKI/OZAOamR92T7/tVmTPrNpTYWBCzcSosLwXtHjrDf7FBQ/YpDdh/Z+wwm9UWcSN1sLrmJXQRMxDw2hmTUZaxevac5TN4T0kBylfdMEg4xvVkgCVllewMD6+Ftzb2qAhRXXMgxFJ6qls07EaO9227JjUOAFGlen8Id/m4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByB4Kd2o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByB4Kd2o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1C2C4CEED;
	Mon, 23 Jun 2025 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750663957;
	bh=bNs2IGmUjjgr2mV/fxGWA6QhEgEIoJjbqXrhdsHHu2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByB4Kd2oEYYh8EFmDaFU5sICDYRS/lUy7MkKHJDE48QHqOu1GLGLAc3nEbgDcq92t
	 7ei3qOL2CczcfysatuKLIjWQxy9m+OlR7T9X4gUweq5pdstnbOzSOPwUDw/wQapzsi
	 yM5Am1yORjmP8IqUqwtZNfBIGBgIznfe1DXfExveXyYa9P7ke36gXNJmRuRZ1R3Evt
	 J89z4HZkatatwm3at0EsryHEwqt1dgSbDLKx7ooIutZ3YazG6vHXUxfk5T+crtHhkz
	 lEwEeA48m30rS60kxf0f0qOQiZunf8l9kyKg5T0FEwZmFMmRWFcRLoBix8ZupTxbp+
	 qJRe5VpBF/ycw==
Date: Mon, 23 Jun 2025 10:32:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	jasonmiu@google.com, graf@amazon.com, changyuanl@google.com,
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
Message-ID: <aFkDBNpzcCNdqjm8@kernel.org>
References: <mafs0sekfts2i.fsf@kernel.org>
 <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org>
 <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org>
 <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org>
 <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>

On Wed, Jun 18, 2025 at 01:43:18PM -0400, Pasha Tatashin wrote:
> On Wed, Jun 18, 2025 at 1:00 PM Pasha Tatashin
>
> So currently, KHO provides the following two types of  internal API:
> 
> Preserve memory and metadata
> =========================
> kho_preserve_folio() / kho_preserve_phys()
> kho_unpreserve_folio() / kho_unpreserve_phys()
> kho_restore_folio()
> 
> kho_add_subtree() kho_retrieve_subtree()
> 
> State machine
> ===========
> register_kho_notifier() / unregister_kho_notifier()
> 
> kho_finalize() / kho_abort()
> 
> We should remove the "State machine", and only keep the "Preserve
> Memory" API functions. At the time these functions are called, KHO
> should do the magic of making sure that the memory gets preserved
> across the reboot.
> 
> This way, reserve_mem_init() would call: kho_preserve_folio() and
> kho_add_subtree() during boot, and be done with it.

I agree that there's no need in notifiers.

I even have a half cooked patch for this on top of "kho: allow to drive kho
from within kernel"

From 02716e4731480bde997a9c1676b7246aa8e358de Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Sun, 22 Jun 2025 14:37:17 +0300
Subject: [PATCH] kho: drop notifiers

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/kexec_handover.h   |  27 +-------
 kernel/kexec_handover.c          | 114 ++++++++++++++-----------------
 kernel/kexec_handover_debug.c    |   3 +-
 kernel/kexec_handover_internal.h |   3 +-
 mm/memblock.c                    |  56 +++------------
 5 files changed, 65 insertions(+), 138 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index f98565def593..ac9cb6eae71f 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -10,14 +10,7 @@ struct kho_scratch {
 	phys_addr_t size;
 };
 
-/* KHO Notifier index */
-enum kho_event {
-	KEXEC_KHO_FINALIZE = 0,
-	KEXEC_KHO_ABORT = 1,
-};
-
 struct folio;
-struct notifier_block;
 
 #define DECLARE_KHOSER_PTR(name, type) \
 	union {                        \
@@ -36,20 +29,15 @@ struct notifier_block;
 		(typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NULL); \
 	})
 
-struct kho_serialization;
-
 #ifdef CONFIG_KEXEC_HANDOVER
 bool kho_is_enabled(void);
 
 int kho_preserve_folio(struct folio *folio);
 int kho_preserve_phys(phys_addr_t phys, size_t size);
 struct folio *kho_restore_folio(phys_addr_t phys);
-int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt);
+int kho_add_subtree(const char *name, void *fdt);
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys);
 
-int register_kho_notifier(struct notifier_block *nb);
-int unregister_kho_notifier(struct notifier_block *nb);
-
 void kho_memory_init(void);
 
 void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t scratch_phys,
@@ -79,8 +67,7 @@ static inline struct folio *kho_restore_folio(phys_addr_t phys)
 	return NULL;
 }
 
-static inline int kho_add_subtree(struct kho_serialization *ser,
-				  const char *name, void *fdt)
+static inline int kho_add_subtree(const char *name, void *fdt)
 {
 	return -EOPNOTSUPP;
 }
@@ -90,16 +77,6 @@ static inline int kho_retrieve_subtree(const char *name, phys_addr_t *phys)
 	return -EOPNOTSUPP;
 }
 
-static inline int register_kho_notifier(struct notifier_block *nb)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int unregister_kho_notifier(struct notifier_block *nb)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline void kho_memory_init(void)
 {
 }
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 176eaf2c31ab..b609eaf92550 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -15,7 +15,6 @@
 #include <linux/libfdt.h>
 #include <linux/list.h>
 #include <linux/memblock.h>
-#include <linux/notifier.h>
 #include <linux/page-isolation.h>
 
 #include <asm/early_ioremap.h>
@@ -552,7 +551,6 @@ static void __init kho_reserve_scratch(void)
 
 /**
  * kho_add_subtree - record the physical address of a sub FDT in KHO root tree.
- * @ser: serialization control object passed by KHO notifiers.
  * @name: name of the sub tree.
  * @fdt: the sub tree blob.
  *
@@ -566,11 +564,12 @@ static void __init kho_reserve_scratch(void)
  *
  * Return: 0 on success, error code on failure
  */
-int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt)
+int kho_add_subtree(const char *name, void *fdt)
 {
+	struct kho_serialization *ser = &kho_out.ser;
 	int err = 0;
 	u64 phys = (u64)virt_to_phys(fdt);
-	void *root = page_to_virt(ser->fdt);
+	void *root = ser->fdt;
 
 	err |= fdt_begin_node(root, name);
 	err |= fdt_property(root, PROP_SUB_FDT, &phys, sizeof(phys));
@@ -584,7 +583,6 @@ int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt)
 EXPORT_SYMBOL_GPL(kho_add_subtree);
 
 struct kho_out kho_out = {
-	.chain_head = BLOCKING_NOTIFIER_INIT(kho_out.chain_head),
 	.lock = __MUTEX_INITIALIZER(kho_out.lock),
 	.ser = {
 		.fdt_list = LIST_HEAD_INIT(kho_out.ser.fdt_list),
@@ -595,18 +593,6 @@ struct kho_out kho_out = {
 	.finalized = false,
 };
 
-int register_kho_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&kho_out.chain_head, nb);
-}
-EXPORT_SYMBOL_GPL(register_kho_notifier);
-
-int unregister_kho_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_unregister(&kho_out.chain_head, nb);
-}
-EXPORT_SYMBOL_GPL(unregister_kho_notifier);
-
 /**
  * kho_preserve_folio - preserve a folio across kexec.
  * @folio: folio to preserve.
@@ -676,7 +662,6 @@ EXPORT_SYMBOL_GPL(kho_preserve_phys);
 
 int __kho_abort(void)
 {
-	int err;
 	unsigned long order;
 	struct kho_mem_phys *physxa;
 
@@ -697,44 +682,15 @@ int __kho_abort(void)
 		kho_out.ser.preserved_mem_map = NULL;
 	}
 
-	err = blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_KHO_ABORT,
-					   NULL);
-	err = notifier_to_errno(err);
-
-	if (err)
-		pr_err("Failed to abort KHO finalization: %d\n", err);
-
-	return err;
+	return 0;
 }
 
 int __kho_finalize(void)
 {
 	int err = 0;
-	u64 *preserved_mem_map;
-	void *fdt = page_to_virt(kho_out.ser.fdt);
-
-	err |= fdt_create(fdt, PAGE_SIZE);
-	err |= fdt_finish_reservemap(fdt);
-	err |= fdt_begin_node(fdt, "");
-	err |= fdt_property_string(fdt, "compatible", KHO_FDT_COMPATIBLE);
-	/**
-	 * Reserve the preserved-memory-map property in the root FDT, so
-	 * that all property definitions will precede subnodes created by
-	 * KHO callers.
-	 */
-	err |= fdt_property_placeholder(fdt, PROP_PRESERVED_MEMORY_MAP,
-					sizeof(*preserved_mem_map),
-					(void **)&preserved_mem_map);
-	if (err)
-		goto abort;
+	void *fdt = kho_out.ser.fdt;
 
-	err = kho_preserve_folio(page_folio(kho_out.ser.fdt));
-	if (err)
-		goto abort;
-
-	err = blocking_notifier_call_chain(&kho_out.chain_head,
-					   KEXEC_KHO_FINALIZE, &kho_out.ser);
-	err = notifier_to_errno(err);
+	err = kho_preserve_folio(page_folio(virt_to_page(kho_out.ser.fdt)));
 	if (err)
 		goto abort;
 
@@ -742,7 +698,7 @@ int __kho_finalize(void)
 	if (err)
 		goto abort;
 
-	*preserved_mem_map = (u64)virt_to_phys(kho_out.ser.preserved_mem_map);
+	*kho_out.ser.fdt_mem_map = (u64)virt_to_phys(kho_out.ser.preserved_mem_map);
 
 	err |= fdt_end_node(fdt);
 	err |= fdt_finish(fdt);
@@ -863,19 +819,13 @@ static __init int kho_init(void)
 	if (!kho_enable)
 		return 0;
 
-	kho_out.ser.fdt = alloc_page(GFP_KERNEL);
-	if (!kho_out.ser.fdt) {
-		err = -ENOMEM;
-		goto err_free_scratch;
-	}
-
 	err = kho_debugfs_init();
 	if (err)
-		goto err_free_fdt;
+		goto err_free_scratch;
 
 	err = kho_out_debugfs_init();
 	if (err)
-		goto err_free_fdt;
+		goto err_free_scratch;
 
 	if (fdt) {
 		kho_in_debugfs_init(fdt);
@@ -894,9 +844,6 @@ static __init int kho_init(void)
 
 	return 0;
 
-err_free_fdt:
-	put_page(kho_out.ser.fdt);
-	kho_out.ser.fdt = NULL;
 err_free_scratch:
 	for (int i = 0; i < kho_scratch_cnt; i++) {
 		void *start = __va(kho_scratch[i].addr);
@@ -933,10 +880,50 @@ static void __init kho_release_scratch(void)
 	}
 }
 
+static int __init kho_out_fdt_init(void)
+{
+	void *fdt;
+	int err = 0;
+
+	fdt = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+	if (!fdt)
+		return -ENOMEM;
+
+	err |= fdt_create(fdt, PAGE_SIZE);
+	err |= fdt_finish_reservemap(fdt);
+	err |= fdt_begin_node(fdt, "");
+	err |= fdt_property_string(fdt, "compatible", KHO_FDT_COMPATIBLE);
+	/**
+	 * Reserve the preserved-memory-map property in the root FDT, so
+	 * that all property definitions will precede subnodes created by
+	 * KHO callers.
+	 */
+	err |= fdt_property_placeholder(fdt, PROP_PRESERVED_MEMORY_MAP,
+					sizeof(*kho_out.ser.fdt_mem_map),
+					(void **)&kho_out.ser.fdt_mem_map);
+	if (err)
+		goto err_free_fdt;
+
+	kho_out.ser.fdt = fdt;
+	return 0;
+
+err_free_fdt:
+	memblock_free(fdt, PAGE_SIZE);
+	return err;
+}
+
 void __init kho_memory_init(void)
 {
 	struct folio *folio;
 
+	int err = kho_out_fdt_init();
+
+	if (err) {
+		pr_err("failed to allocate root FDT, disabling KHO\n");
+		kho_enable = false;
+		return;
+	}
+
 	if (kho_in.scratch_phys) {
 		kho_scratch = phys_to_virt(kho_in.scratch_phys);
 		kho_release_scratch();
@@ -1008,6 +995,7 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	}
 
 	memblock_reserve(scratch_phys, scratch_len);
+	memblock_reserve(fdt_phys, PAGE_SIZE);
 
 	/*
 	 * Now that we have a viable region of scratch memory, let's tell
@@ -1043,7 +1031,7 @@ int kho_fill_kimage(struct kimage *image)
 	if (!kho_enable)
 		return 0;
 
-	image->kho.fdt = page_to_phys(kho_out.ser.fdt);
+	image->kho.fdt = virt_to_phys(kho_out.ser.fdt);
 
 	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
 	scratch = (struct kexec_buf){
diff --git a/kernel/kexec_handover_debug.c b/kernel/kexec_handover_debug.c
index a15c238ec98e..a34997a1adae 100644
--- a/kernel/kexec_handover_debug.c
+++ b/kernel/kexec_handover_debug.c
@@ -62,8 +62,7 @@ int kho_out_update_debugfs_fdt(void)
 
 	if (kho_out.finalized) {
 		err = __kho_debugfs_fdt_add(&kho_out.ser.fdt_list, kho_out.dir,
-					    "fdt",
-					    page_to_virt(kho_out.ser.fdt));
+					    "fdt", kho_out.ser.fdt);
 	} else {
 		list_for_each_entry_safe(ff, tmp, &kho_out.ser.fdt_list, list) {
 			debugfs_remove(ff->file);
diff --git a/kernel/kexec_handover_internal.h b/kernel/kexec_handover_internal.h
index 0b534758d39d..bf78ecb06996 100644
--- a/kernel/kexec_handover_internal.h
+++ b/kernel/kexec_handover_internal.h
@@ -16,7 +16,8 @@ struct kho_mem_track {
 };
 
 struct kho_serialization {
-	struct page *fdt;
+	void *fdt;
+	u64 *fdt_mem_map;
 	struct list_head fdt_list;
 	struct kho_mem_track track;
 	/* First chunk of serialized preserved memory map */
diff --git a/mm/memblock.c b/mm/memblock.c
index 154f1d73b61f..6af0b51b1bb7 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2501,51 +2501,18 @@ int reserve_mem_release_by_name(const char *name)
 #define MEMBLOCK_KHO_FDT "memblock"
 #define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
 #define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
-static struct page *kho_fdt;
-
-static int reserve_mem_kho_finalize(struct kho_serialization *ser)
-{
-	int err = 0, i;
-
-	for (i = 0; i < reserved_mem_count; i++) {
-		struct reserve_mem_table *map = &reserved_mem_table[i];
-
-		err |= kho_preserve_phys(map->start, map->size);
-	}
-
-	err |= kho_preserve_folio(page_folio(kho_fdt));
-	err |= kho_add_subtree(ser, MEMBLOCK_KHO_FDT, page_to_virt(kho_fdt));
-
-	return notifier_from_errno(err);
-}
-
-static int reserve_mem_kho_notifier(struct notifier_block *self,
-				    unsigned long cmd, void *v)
-{
-	switch (cmd) {
-	case KEXEC_KHO_FINALIZE:
-		return reserve_mem_kho_finalize((struct kho_serialization *)v);
-	case KEXEC_KHO_ABORT:
-		return NOTIFY_DONE;
-	default:
-		return NOTIFY_BAD;
-	}
-}
-
-static struct notifier_block reserve_mem_kho_nb = {
-	.notifier_call = reserve_mem_kho_notifier,
-};
 
 static int __init prepare_kho_fdt(void)
 {
 	int err = 0, i;
+	struct page *fdt_page;
 	void *fdt;
 
-	kho_fdt = alloc_page(GFP_KERNEL);
-	if (!kho_fdt)
+	fdt_page = alloc_page(GFP_KERNEL);
+	if (!fdt_page)
 		return -ENOMEM;
 
-	fdt = page_to_virt(kho_fdt);
+	fdt = page_to_virt(fdt_page);
 
 	err |= fdt_create(fdt, PAGE_SIZE);
 	err |= fdt_finish_reservemap(fdt);
@@ -2555,6 +2522,7 @@ static int __init prepare_kho_fdt(void)
 	for (i = 0; i < reserved_mem_count; i++) {
 		struct reserve_mem_table *map = &reserved_mem_table[i];
 
+		err |= kho_preserve_phys(map->start, map->size);
 		err |= fdt_begin_node(fdt, map->name);
 		err |= fdt_property_string(fdt, "compatible", RESERVE_MEM_KHO_NODE_COMPATIBLE);
 		err |= fdt_property(fdt, "start", &map->start, sizeof(map->start));
@@ -2562,13 +2530,14 @@ static int __init prepare_kho_fdt(void)
 		err |= fdt_end_node(fdt);
 	}
 	err |= fdt_end_node(fdt);
-
 	err |= fdt_finish(fdt);
 
+	err |= kho_preserve_folio(page_folio(fdt_page));
+	err |= kho_add_subtree(MEMBLOCK_KHO_FDT, fdt);
+
 	if (err) {
 		pr_err("failed to prepare memblock FDT for KHO: %d\n", err);
-		put_page(kho_fdt);
-		kho_fdt = NULL;
+		put_page(fdt_page);
 	}
 
 	return err;
@@ -2584,13 +2553,6 @@ static int __init reserve_mem_init(void)
 	err = prepare_kho_fdt();
 	if (err)
 		return err;
-
-	err = register_kho_notifier(&reserve_mem_kho_nb);
-	if (err) {
-		put_page(kho_fdt);
-		kho_fdt = NULL;
-	}
-
 	return err;
 }
 late_initcall(reserve_mem_init);
-- 
2.47.2




> Pasha
> 

-- 
Sincerely yours,
Mike.
