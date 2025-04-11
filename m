Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C72046AF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744349903; cv=none; b=WDpNpsjQm3kpY3dtV/FrA7d4HCgbME8FhXdMDvJWIXIA/pluFKJ5L0YC2cKOYy4Loup8d49J1Y4Rl3lrCs1/pkHfTAIxFyrz8Frkr+zfsnbaAG4fSGEhn37ytr2Z+l537Z83LBI26CwxgpqvCef3EBtbBV4XNIyJhreLAU9VR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744349903; c=relaxed/simple;
	bh=O4paHUM5WUKRElwhqbiya2OTDy+4u3mMqoywnUx+Lrg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KtP1p71QUVvxX3U1EOrg/G/JE9Y1itNrnwOfWixupmwkfWjdMMtUo0l2ZIPtPcsfLSi49LiE60CIhI3LoJv8luTIKDXGEDEchsH33vn96LA1+3tZWhStjqDycuNtu/ZNavslEjfrgoYypIH+B51OxVFGg/d2X8YT1b/M2AuOL2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IaogZ+bl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IaogZ+bl"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-227e2faab6dso14293655ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 22:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744349901; x=1744954701; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlX8nA7Xk9H5c98D5iYmnhzWmAB9L4MDv6xIzYdT0mI=;
        b=IaogZ+bl5wxEFYGZOfHGFp7Un45RUOWUE8bRoAaAeq+FruP5NRXYDM3Y27UIcWBEfW
         xYzLJZgjEr2mieqhR/ynq7wo+8LY3LYWrHLWZtKx6dquNxqrHy0E2KlVgbFW0y+8uiTt
         hwk4A/fZ/NnfRy+yTQRyWcxgH8AU4u3AsQ4b9bByawXkjgA+OSu8VKQNlU5DbVBqw5oX
         3MTfAWOpnjZGpTwXJUt3UFnsaBKLhDmtpZEtIT2hXct/saITZRQmeu/vdCD8eNmdy19n
         GuN4LbjN1e2SaFxy6sjYJD6lHSzVr3rENl50nuqEWc28XeZFijNEnkpp3jd0B/rj5TbN
         lWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744349901; x=1744954701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlX8nA7Xk9H5c98D5iYmnhzWmAB9L4MDv6xIzYdT0mI=;
        b=tJ8ZNHVicztZi6ayRCEaaGP5zaUuUfY8ZcJ+eQHLVFp+8GaBQ59TjP4zY1Yl99bs1B
         JpQlkFw71C1cXWt+5zNwz4NPoteFaEjP/+56iHhONj59mzD9QSWu4zrwSIOFqGPBI8ys
         rpbnLl+uV0N+odA15vNNH9JFFwp5v+YHbLVrN5981bsvpH7hTwPRKrb493nEVKQ20H25
         Q/JSr9mloSnq9a8uNp+zkPxdoN7vD8XLs5Ia5NkV1RRQd0hsADw47WBCdjpsrD3IF6l1
         kMCDsGzsktgnR+aF6nvYV4b9Bi5G3prx1qouHUR4G6IxhIKZzX1tdCeNbywSfBWBwqbZ
         gsRQ==
X-Gm-Message-State: AOJu0YwnPI4Ucx+AGpGw3On8vpA9GCS34lSRmPWTvtDD8UhwUu6slcPB
	PjQzGbXv3zdUqEGdJYm3cqudVjag9QcNiW+4uPoh52MGNB9ZIbBLDpIbqX0lPQTWGhcM4iuJVXK
	OgEA+GEBRoaJV92yPR98ABGJLrXHomWulkMHl40ZV09bgzCVfCCl5iP0GrmOT3JOFMFZIPqTa5P
	KpKJKQM53yOe1CSBVZDmdX1gYzdCzFZ+aBkGJota5yeAJ/Ph0UTl836Fx6qqBG6Q==
X-Google-Smtp-Source: AGHT+IGmLdsivViTeSGIGhIMJrpZ+eiCfZe7b18ElxHjAINDV7KJLIeK9aAKlBDGOH8e7R2YQZlTLbj0XmtsWn8h
X-Received: from plfu7.prod.google.com ([2002:a17:902:e5c7:b0:220:ddee:5ee])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:c951:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22bea4f009amr23225795ad.39.1744349900801;
 Thu, 10 Apr 2025 22:38:20 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:37:33 -0700
In-Reply-To: <20250411053745.1817356-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411053745.1817356-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250411053745.1817356-3-changyuanl@google.com>
Subject: [PATCH v6 02/14] memblock: Add support for scratch memory
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

With KHO (Kexec HandOver), we need a way to ensure that the new kernel
does not allocate memory on top of any memory regions that the previous
kernel was handing over. But to know where those are, we need to include
them in the memblock.reserved array which may not be big enough to hold
all ranges that need to be persisted across kexec. To resize the array,
we need to allocate memory. That brings us into a catch 22 situation.

The solution to that is limit memblock allocations to the scratch regions:
safe regions to operate in the case when there is memory that should remain
intact across kexec.

KHO provides several "scratch regions" as part of its metadata. These
scratch regions are contiguous memory blocks that known not to contain any
memory that should be persisted across kexec. These regions should be large
enough to accommodate all memblock allocations done by the kexeced kernel.

We introduce a new memblock_set_scratch_only() function that allows KHO to
indicate that any memblock allocation must happen from the scratch regions.

Later, we may want to perform another KHO kexec. For that, we reuse the
same scratch regions. To ensure that no eventually handed over data gets
allocated inside a scratch region, we flip the semantics of the scratch
region with memblock_clear_scratch_only(): After that call, no allocations
may happen from scratch memblock regions. We will lift that restriction
in the next patch.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/memblock.h | 20 +++++++++++++
 mm/Kconfig               |  4 +++
 mm/memblock.c            | 61 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 6c00fbc085132..993937a6b9620 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -45,6 +45,11 @@ extern unsigned long long max_possible_pfn;
  * @MEMBLOCK_RSRV_KERN: memory region that is reserved for kernel use,
  * either explictitly with memblock_reserve_kern() or via memblock
  * allocation APIs. All memblock allocations set this flag.
+ * @MEMBLOCK_KHO_SCRATCH: memory region that kexec can pass to the next
+ * kernel in handover mode. During early boot, we do not know about all
+ * memory reservations yet, so we get scratch memory from the previous
+ * kernel that we know is good to use. It is the only memory that
+ * allocations may happen from in this phase.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -54,6 +59,7 @@ enum memblock_flags {
 	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
 	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
+	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
 };
 
 /**
@@ -148,6 +154,8 @@ int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
 int memblock_mark_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_clear_nomap(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
+int memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size);
+int memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 void reset_all_zones_managed_pages(void);
@@ -291,6 +299,11 @@ static inline bool memblock_is_driver_managed(struct memblock_region *m)
 	return m->flags & MEMBLOCK_DRIVER_MANAGED;
 }
 
+static inline bool memblock_is_kho_scratch(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_KHO_SCRATCH;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
@@ -619,5 +632,12 @@ static inline void early_memtest(phys_addr_t start, phys_addr_t end) { }
 static inline void memtest_report_meminfo(struct seq_file *m) { }
 #endif
 
+#ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
+void memblock_set_kho_scratch_only(void);
+void memblock_clear_kho_scratch_only(void);
+#else
+static inline void memblock_set_kho_scratch_only(void) { }
+static inline void memblock_clear_kho_scratch_only(void) { }
+#endif
 
 #endif /* _LINUX_MEMBLOCK_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b4938..60ea9eba48140 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -469,6 +469,10 @@ config HAVE_GUP_FAST
 	depends on MMU
 	bool
 
+# Enable memblock support for scratch memory which is needed for kexec handover
+config MEMBLOCK_KHO_SCRATCH
+	bool
+
 # Don't discard allocated memory used to track "memory" and "reserved" memblocks
 # after early boot, so it can still be used to test for validity of memory.
 # Also, memblocks are updated with memory hot(un)plug.
diff --git a/mm/memblock.c b/mm/memblock.c
index 2dc95ecdee5ce..3a213e2a485bc 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -107,6 +107,13 @@ unsigned long min_low_pfn;
 unsigned long max_pfn;
 unsigned long long max_possible_pfn;
 
+#ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
+/* When set to true, only allocate from MEMBLOCK_KHO_SCRATCH ranges */
+static bool kho_scratch_only;
+#else
+#define kho_scratch_only false
+#endif
+
 static struct memblock_region memblock_memory_init_regions[INIT_MEMBLOCK_MEMORY_REGIONS] __initdata_memblock;
 static struct memblock_region memblock_reserved_init_regions[INIT_MEMBLOCK_RESERVED_REGIONS] __initdata_memblock;
 #ifdef CONFIG_HAVE_MEMBLOCK_PHYS_MAP
@@ -166,6 +173,10 @@ bool __init_memblock memblock_has_mirror(void)
 
 static enum memblock_flags __init_memblock choose_memblock_flags(void)
 {
+	/* skip non-scratch memory for kho early boot allocations */
+	if (kho_scratch_only)
+		return MEMBLOCK_KHO_SCRATCH;
+
 	return system_has_some_mirror ? MEMBLOCK_MIRROR : MEMBLOCK_NONE;
 }
 
@@ -925,6 +936,18 @@ int __init_memblock memblock_physmem_add(phys_addr_t base, phys_addr_t size)
 }
 #endif
 
+#ifdef CONFIG_MEMBLOCK_KHO_SCRATCH
+__init_memblock void memblock_set_kho_scratch_only(void)
+{
+	kho_scratch_only = true;
+}
+
+__init_memblock void memblock_clear_kho_scratch_only(void)
+{
+	kho_scratch_only = false;
+}
+#endif
+
 /**
  * memblock_setclr_flag - set or clear flag for a memory region
  * @type: memblock type to set/clear flag for
@@ -1050,6 +1073,36 @@ int __init_memblock memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t
 				    MEMBLOCK_RSRV_NOINIT);
 }
 
+/**
+ * memblock_mark_kho_scratch - Mark a memory region as MEMBLOCK_KHO_SCRATCH.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Only memory regions marked with %MEMBLOCK_KHO_SCRATCH will be considered
+ * for allocations during early boot with kexec handover.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_kho_scratch(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_KHO_SCRATCH);
+}
+
+/**
+ * memblock_clear_kho_scratch - Clear MEMBLOCK_KHO_SCRATCH flag for a
+ * specified region.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_clear_kho_scratch(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 0,
+				    MEMBLOCK_KHO_SCRATCH);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -1081,6 +1134,13 @@ static bool should_skip_region(struct memblock_type *type,
 	if (!(flags & MEMBLOCK_DRIVER_MANAGED) && memblock_is_driver_managed(m))
 		return true;
 
+	/*
+	 * In early alloc during kexec handover, we can only consider
+	 * MEMBLOCK_KHO_SCRATCH regions for the allocations
+	 */
+	if ((flags & MEMBLOCK_KHO_SCRATCH) && !memblock_is_kho_scratch(m))
+		return true;
+
 	return false;
 }
 
@@ -2465,6 +2525,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_DRIVER_MANAGED)] = "DRV_MNG",
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
+	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.49.0.604.gff1f9ca942-goog

