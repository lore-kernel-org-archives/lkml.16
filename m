Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F427D799
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349910; cv=none; b=hJCRGl6dJmyei48OG9waj00CoJp1nkD2WQR1H5VeNWIZa7J6X1orrv5hgIh7sfMigmSWiCCPqXIIH77GvrqSWhr/DOaRIIx0t35ymBAgMnhhc6H/GhRWvBfzP4Y9Tdy7ddNCbYALuObT2F5y3m6Exo70ZZeUU5UqRUNco246L9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349910; c=relaxed/simple;
	bh=1Uuj08OPX6jPfaDRHnkl8SQzyACvJ5IazZxMYw2kBJM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s6LQUNt7qKc1hzRnyfW0rdsayFx38E2+OLWP4V1kAc/d8m4c0Oi4k25lw2ineXg48AEG1yDbtz4OCief0uUn5YXHns6ngYq8MN7aarw803nWnsg+V4GPY3vJgeEUhcpBDmbTCiDmOhxhvyNKAa5aqcM7J3ggcnkRUAQRXZJ/TtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1Of2ayW; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1Of2ayW"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72b881599f6so1364565a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349908; x=1744954708; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8/tw64ZaXw3+8Mw68exs5moBeGsA6izDAl/HLWUnHo=;
        b=B1Of2ayW2mLIzKMl9MVHF2qsKNfzU5Xvd+tdNNm7MZttHOAD3kFJgP0OwgQsanWQo8
         tflY2viTLa1fQ3fa2MlDiXsNaLoY+jUg7aGYd2Oe5kfE8a4i4oVZn8Y0LMNdDYT1niEz
         74AcaljLodOmqRpo4B6Uqrw72laQkQ61+RiyLxThNCS4KrP8aINYYcYTrFPOwvjEOQXc
         PVp14R8AqKeiEBFy2ybXecukmYEt9Grz6X6zg7OZGJ3SMV/EgDUQdOEIvjutDrUHaTxS
         l0JXkZizIhIQA0kU3D7cdHqSJlGqjvKFHVEeDV/mRIHwN+isyMXz+J9KePLHpia5NgxZ
         Emeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349908; x=1744954708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8/tw64ZaXw3+8Mw68exs5moBeGsA6izDAl/HLWUnHo=;
        b=BebRSX2ILteXL4CwI8Zs2d+cft1F2nIxD5rgAJLkeLUgA/UF3WMPHFDkM/1hG6dcE1
         p33MNW3ZRTPb2HxaDsPZR6kPWILL6tKU26jnQYCLrF0iMqcss2rknZh/UQAm8Yz2f3zT
         nc+eMZQ45DrBeq2sDygryZSdPSiGKf7+hSSifTICdtLqzUZvK6d6WpsHbaJfxZspzWnv
         6sXacBNPv8pGMP7XxmQOh7TD7e8vcPlhju2LtIgUOQr1UR9AeRBNuhQOTU6xxuCTGkVz
         5s3KM3s2xS62JDP7lY7iff3xN3SKtIQ/f8RxFEC9vkMukfWLVGaPhVCagBmCQ4h0X5V2
         8dnQ==
X-Gm-Message-State: AOJu0YyDWeBFI7qK8lrqlWrm5mXEdoanyikUxmD1eSk8HZrEz4vlI3By
	h7PltZNGhvZlTyqLcOjFVaakeN1qpxyUjOJXdcs5bFGZp7VXuzZsNrrfDq67jjEPN7P1/X5UPU2
	v7Jckc1RGdBdobwxTiNLHtUmb6lKX/ZoOHBxEhRHC2Snlwjy1r8FfCL6FFtCCkGXgUazCRoKX8N
	d0kOSj9rPgpW+Z3dwLa44nnBOS7gm0H1VSgVLmPo9uHZRkbt51Mh0M4+DUgjIdDw==
X-Google-Smtp-Source: AGHT+IGwZ1eisxe0ymuYtmLoCJqD7rlopgQFj4rrMwmM4Wrelc58jw3CKa/b1F9+keU+6losfGrOoBNzqRMO1/hD
X-Received: from oabvs3.prod.google.com ([2002:a05:6871:a103:b0:2b8:40a0:4445])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:6987:b0:72b:823c:8f66 with SMTP id 46e09a7af769-72e862fbc8amr968642a34.9.1744349907721;
 Thu, 10 Apr 2025 22:38:27 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:36 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-6-changyuanl@google.com>
Subject: [PATCH v6 05/14] kexec: add KHO parsing support
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, 
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de, robh@kernel.org, 
	rostedt@goodmis.org, rppt@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	will@kernel.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

When we have a KHO kexec, we get an FDT blob and scratch region to
populate the state of the system. Provide helper functions that allow
architecture code to easily handle memory reservations based on them and
give device drivers visibility into the KHO FDT and memory reservations
so they can recover their own state.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec_handover.h |  14 ++
 kernel/kexec_handover.c        | 230 ++++++++++++++++++++++++++++++++-
 mm/memblock.c                  |   1 +
 3 files changed, 244 insertions(+), 1 deletion(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 593ea842a5b61..2b77d4b9fbc3c 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -23,11 +23,15 @@ struct kho_serialization;
 bool kho_is_enabled(void);
 
 int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt);
+int kho_retrieve_subtree(const char *name, phys_addr_t *phys);
 
 int register_kho_notifier(struct notifier_block *nb);
 int unregister_kho_notifier(struct notifier_block *nb);
 
 void kho_memory_init(void);
+
+void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t scratch_phys,
+		  u64 scratch_len);
 #else
 static inline bool kho_is_enabled(void)
 {
@@ -40,6 +44,11 @@ static inline int kho_add_subtree(struct kho_serialization *ser,
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_retrieve_subtree(const char *name, phys_addr_t *phys)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int register_kho_notifier(struct notifier_block *nb)
 {
 	return -EOPNOTSUPP;
@@ -53,6 +62,11 @@ static inline int unregister_kho_notifier(struct notifier_block *nb)
 static inline void kho_memory_init(void)
 {
 }
+
+static inline void kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
+				phys_addr_t scratch_phys, u64 scratch_len)
+{
+}
 #endif /* CONFIG_KEXEC_HANDOVER */
 
 #endif /* LINUX_KEXEC_HANDOVER_H */
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index e541d3d5003d1..a1e1cd0330143 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -501,9 +501,112 @@ static __init int kho_out_debugfs_init(void)
 	return -ENOENT;
 }
 
+struct kho_in {
+	struct dentry *dir;
+	phys_addr_t fdt_phys;
+	phys_addr_t scratch_phys;
+	struct list_head fdt_list;
+};
+
+static struct kho_in kho_in = {
+	.fdt_list = LIST_HEAD_INIT(kho_in.fdt_list),
+};
+
+static const void *kho_get_fdt(void)
+{
+	return kho_in.fdt_phys ? phys_to_virt(kho_in.fdt_phys) : NULL;
+}
+
+/**
+ * kho_retrieve_subtree - retrieve a preserved sub FDT by its name.
+ * @name: the name of the sub FDT passed to kho_add_subtree().
+ * @phys: if found, the physical address of the sub FDT is stored in @phys.
+ *
+ * Retrieve a preserved sub FDT named @name and store its physical
+ * address in @phys.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_retrieve_subtree(const char *name, phys_addr_t *phys)
+{
+	const void *fdt = kho_get_fdt();
+	const u64 *val;
+	int offset, len;
+
+	if (!fdt)
+		return -ENOENT;
+
+	if (!phys)
+		return -EINVAL;
+
+	offset = fdt_subnode_offset(fdt, 0, name);
+	if (offset < 0)
+		return -ENOENT;
+
+	val = fdt_getprop(fdt, offset, PROP_SUB_FDT, &len);
+	if (!val || len != sizeof(*val))
+		return -EINVAL;
+
+	*phys = (phys_addr_t)*val;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kho_retrieve_subtree);
+
+/* Handling for debugfs/kho/in */
+
+static __init int kho_in_debugfs_init(const void *fdt)
+{
+	struct dentry *sub_fdt_dir;
+	int err, child;
+
+	kho_in.dir = debugfs_create_dir("in", debugfs_root);
+	if (IS_ERR(kho_in.dir))
+		return PTR_ERR(kho_in.dir);
+
+	sub_fdt_dir = debugfs_create_dir("sub_fdts", kho_in.dir);
+	if (IS_ERR(sub_fdt_dir)) {
+		err = PTR_ERR(sub_fdt_dir);
+		goto err_rmdir;
+	}
+
+	err = kho_debugfs_fdt_add(&kho_in.fdt_list, kho_in.dir, "fdt", fdt);
+	if (err)
+		goto err_rmdir;
+
+	fdt_for_each_subnode(child, fdt, 0) {
+		int len = 0;
+		const char *name = fdt_get_name(fdt, child, NULL);
+		const u64 *fdt_phys;
+
+		fdt_phys = fdt_getprop(fdt, child, "fdt", &len);
+		if (!fdt_phys)
+			continue;
+		if (len != sizeof(*fdt_phys)) {
+			pr_warn("node `%s`'s prop `fdt` has invalid length: %d\n",
+				name, len);
+			continue;
+		}
+		err = kho_debugfs_fdt_add(&kho_in.fdt_list, sub_fdt_dir, name,
+					  phys_to_virt(*fdt_phys));
+		if (err) {
+			pr_warn("failed to add fdt `%s` to debugfs: %d\n", name,
+				err);
+			continue;
+		}
+	}
+
+	return 0;
+
+err_rmdir:
+	debugfs_remove_recursive(kho_in.dir);
+	return err;
+}
+
 static __init int kho_init(void)
 {
 	int err = 0;
+	const void *fdt = kho_get_fdt();
 
 	if (!kho_enable)
 		return 0;
@@ -524,6 +627,20 @@ static __init int kho_init(void)
 	if (err)
 		goto err_free_fdt;
 
+	if (fdt) {
+		err = kho_in_debugfs_init(fdt);
+		/*
+		 * Failure to create /sys/kernel/debug/kho/in does not prevent
+		 * reviving state from KHO and setting up KHO for the next
+		 * kexec.
+		 */
+		if (err)
+			pr_err("failed exposing handover FDT in debugfs: %d\n",
+			       err);
+
+		return 0;
+	}
+
 	for (int i = 0; i < kho_scratch_cnt; i++) {
 		unsigned long base_pfn = PHYS_PFN(kho_scratch[i].addr);
 		unsigned long count = kho_scratch[i].size >> PAGE_SHIFT;
@@ -551,7 +668,118 @@ static __init int kho_init(void)
 }
 late_initcall(kho_init);
 
+static void __init kho_release_scratch(void)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	memmap_init_kho_scratch_pages();
+
+	/*
+	 * Mark scratch mem as CMA before we return it. That way we
+	 * ensure that no kernel allocations happen on it. That means
+	 * we can reuse it as scratch memory again later.
+	 */
+	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
+			     MEMBLOCK_KHO_SCRATCH, &start, &end, NULL) {
+		ulong start_pfn = pageblock_start_pfn(PFN_DOWN(start));
+		ulong end_pfn = pageblock_align(PFN_UP(end));
+		ulong pfn;
+
+		for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages)
+			set_pageblock_migratetype(pfn_to_page(pfn),
+						  MIGRATE_CMA);
+	}
+}
+
 void __init kho_memory_init(void)
 {
-	kho_reserve_scratch();
+	if (kho_in.scratch_phys) {
+		kho_scratch = phys_to_virt(kho_in.scratch_phys);
+		kho_release_scratch();
+	} else {
+		kho_reserve_scratch();
+	}
+}
+
+void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
+			 phys_addr_t scratch_phys, u64 scratch_len)
+{
+	void *fdt = NULL;
+	struct kho_scratch *scratch = NULL;
+	int err = 0;
+	unsigned int scratch_cnt = scratch_len / sizeof(*kho_scratch);
+
+	/* Validate the input FDT */
+	fdt = early_memremap(fdt_phys, fdt_len);
+	if (!fdt) {
+		pr_warn("setup: failed to memremap FDT (0x%llx)\n", fdt_phys);
+		err = -EFAULT;
+		goto out;
+	}
+	err = fdt_check_header(fdt);
+	if (err) {
+		pr_warn("setup: handover FDT (0x%llx) is invalid: %d\n",
+			fdt_phys, err);
+		err = -EINVAL;
+		goto out;
+	}
+	err = fdt_node_check_compatible(fdt, 0, KHO_FDT_COMPATIBLE);
+	if (err) {
+		pr_warn("setup: handover FDT (0x%llx) is incompatible with '%s': %d\n",
+			fdt_phys, KHO_FDT_COMPATIBLE, err);
+		err = -EINVAL;
+		goto out;
+	}
+
+	scratch = early_memremap(scratch_phys, scratch_len);
+	if (!scratch) {
+		pr_warn("setup: failed to memremap scratch (phys=0x%llx, len=%lld)\n",
+			scratch_phys, scratch_len);
+		err = -EFAULT;
+		goto out;
+	}
+
+	/*
+	 * We pass a safe contiguous blocks of memory to use for early boot
+	 * purporses from the previous kernel so that we can resize the
+	 * memblock array as needed.
+	 */
+	for (int i = 0; i < scratch_cnt; i++) {
+		struct kho_scratch *area = &scratch[i];
+		u64 size = area->size;
+
+		memblock_add(area->addr, size);
+		err = memblock_mark_kho_scratch(area->addr, size);
+		if (WARN_ON(err)) {
+			pr_warn("failed to mark the scratch region 0x%pa+0x%pa: %d",
+				&area->addr, &size, err);
+			goto out;
+		}
+		pr_debug("Marked 0x%pa+0x%pa as scratch", &area->addr, &size);
+	}
+
+	memblock_reserve(scratch_phys, scratch_len);
+
+	/*
+	 * Now that we have a viable region of scratch memory, let's tell
+	 * the memblocks allocator to only use that for any allocations.
+	 * That way we ensure that nothing scribbles over in use data while
+	 * we initialize the page tables which we will need to ingest all
+	 * memory reservations from the previous kernel.
+	 */
+	memblock_set_kho_scratch_only();
+
+	kho_in.fdt_phys = fdt_phys;
+	kho_in.scratch_phys = scratch_phys;
+	kho_scratch_cnt = scratch_cnt;
+	pr_info("found kexec handover data. Will skip init for some devices\n");
+
+out:
+	if (fdt)
+		early_memunmap(fdt, fdt_len);
+	if (scratch)
+		early_memunmap(scratch, scratch_len);
+	if (err)
+		pr_warn("disabling KHO revival: %d\n", err);
 }
diff --git a/mm/memblock.c b/mm/memblock.c
index c2633003ed8ea..456689cb73e20 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2377,6 +2377,7 @@ void __init memblock_free_all(void)
 	free_unused_memmap();
 	reset_all_zones_managed_pages();
 
+	memblock_clear_kho_scratch_only();
 	pages = free_low_memory_core_early();
 	totalram_pages_add(pages);
 }
-- 
2.49.0.604.gff1f9ca942-goog

