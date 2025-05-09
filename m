Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320A269B18
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776816; cv=none; b=r8eVJzEyU0NOBJEJFWG/lidxOXWK8faY111g7YaDFJfCjB3fde6gmnRtdevpt3DGtojDmQm3SD3qfNCB2JLya5QepzBJTv7oqqfj3EgNHEpWye2llC6FYI4XuT5FlHDrD8UKIdPxrMm1Z765BKjvnS6FBwAzpcocI3ddlBBCc4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776816; c=relaxed/simple;
	bh=HxpMBl40YhLhylbujC3nLoBfZafq917rsBMiCNrBD40=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t517E3voX1dBAGIbMK8Wqq+vymL2GtGrw/ckCuXpaYgkwNyl8+eL33FfK47+gfumYAnA35h/8uTCM9wQM5e24aRfKFjEz6yGuBI5gfLUhlQfLAdgdjJdzBpx7z3w1NlvJi4mdpAJ5A7yZXQo/rCnxTKac3vZRhLwo/XzTtglhLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iqmyHmod; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iqmyHmod"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22fba2426f5so11226835ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776814; x=1747381614; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQleSYKHX+gNmlKmlKO75ZDJI9Hk7h4ANgbFHNrq/5A=;
        b=iqmyHmodiASYZBJg9+WygBhgRv3C6hc+pQ06MkmLfeadoW/UuXED2IoVIFU3oO2ASy
         7lvxt8arWzskHzGi8C5ylKzxSowuZPJDxNrR4A3AaOMD80xwYU88FdNtjITW8Amcv+k6
         30oph5RRSAO0ZK+xpIHQhyUSd9T5XNXMZD90+2HoqLejEgbkYj3boFN117CT0Px5/qGC
         9H1dh6Qwmp98IBrC4CE4qPU3IAxyVo6gwYyIcQj7eJth18ea++pFSutCgYEg6GiqcQ+o
         tpXbJ5cbQ5KLdMQRkPS+ITFoTrLeNLMxTT0qvntQXCsjCqV9flGI3ESmcHGueCT8uxpQ
         JXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776814; x=1747381614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQleSYKHX+gNmlKmlKO75ZDJI9Hk7h4ANgbFHNrq/5A=;
        b=g6aM9n89wxj2yG3v+srckeOxjwNBdENnves6kwO9rYOcaR1q0Qego2bC0/TkHZCe49
         9pjH91oWJxgpbn6jSUR/h6b+VKqgkLCSfH/0hyTlPgYUw2xqSTCGJD033ALSrFsNu2zq
         bfvpewMv2Pwmx1uUg/GBz9iO6MaohvzkinH070jgN346OFd8QcYCkEYpUy0N6GizWi6a
         ri+7f94TthkBIFsXCX0bQ+nFkGJRhgVIfOvxtd+rcQaed9ekL6cSJ49Tynf6X30IHoAn
         shbfyuXeANQUB2o2ZdnxL0I/3J7T7zJzXh5VYPzkCc+Uyr9w5eS/YfXkdQvzlwdDwRLl
         uZIA==
X-Forwarded-Encrypted: i=1; AJvYcCX0bHBDXPVoRAi7AisqZXzFjzBBcCkl2iiSf7zKPicIrGzEADNCWSKtjub9Q9BK+SNugSVRRmU3srru2mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAO0yetXFWhkJiTjCzIUk0aPWshgch2cKdpjH94bKji21lb9D8
	ZO3SBRkZS7CrZvJQKE55qxdRNlGqs1gUq+IP2RKpK2cUTGX6r0M7LFAIkET6qxYoe5UqrA1+mv9
	JEt4+V8c2J0JbzIo6lw==
X-Google-Smtp-Source: AGHT+IE0ecbHFG5zaMIC4HVa8/XK/kIO72d826eBh5y/vMRu72CI084/gqbKkAhATPz+cmQRUmjqsO3tccHgC5XI
X-Received: from ploh10.prod.google.com ([2002:a17:902:f70a:b0:223:5c97:5c3c])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2309:b0:22e:7f20:52c6 with SMTP id d9443c01a7336-22fc8b5c3dfmr34558255ad.23.1746776814150;
 Fri, 09 May 2025 00:46:54 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:19 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-2-changyuanl@google.com>
Subject: [PATCH v8 01/17] memblock: add MEMBLOCK_RSRV_KERN flag
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
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
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

to denote areas that were reserved for kernel use either directly with
memblock_reserve_kern() or via memblock allocations.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/memblock.h                      | 19 ++++++++-
 mm/memblock.c                                 | 40 +++++++++++++++----
 tools/testing/memblock/tests/alloc_api.c      | 22 +++++-----
 .../memblock/tests/alloc_helpers_api.c        |  4 +-
 tools/testing/memblock/tests/alloc_nid_api.c  | 20 +++++-----
 5 files changed, 73 insertions(+), 32 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index ef5a1ecc6e595..6c00fbc085132 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -42,6 +42,9 @@ extern unsigned long long max_possible_pfn;
  * kernel resource tree.
  * @MEMBLOCK_RSRV_NOINIT: memory region for which struct pages are
  * not initialized (only for reserved regions).
+ * @MEMBLOCK_RSRV_KERN: memory region that is reserved for kernel use,
+ * either explictitly with memblock_reserve_kern() or via memblock
+ * allocation APIs. All memblock allocations set this flag.
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -50,6 +53,7 @@ enum memblock_flags {
 	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
 	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
 	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
+	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 };
 
 /**
@@ -116,7 +120,19 @@ int memblock_add_node(phys_addr_t base, phys_addr_t size, int nid,
 int memblock_add(phys_addr_t base, phys_addr_t size);
 int memblock_remove(phys_addr_t base, phys_addr_t size);
 int memblock_phys_free(phys_addr_t base, phys_addr_t size);
-int memblock_reserve(phys_addr_t base, phys_addr_t size);
+int __memblock_reserve(phys_addr_t base, phys_addr_t size, int nid,
+		       enum memblock_flags flags);
+
+static __always_inline int memblock_reserve(phys_addr_t base, phys_addr_t size)
+{
+	return __memblock_reserve(base, size, NUMA_NO_NODE, 0);
+}
+
+static __always_inline int memblock_reserve_kern(phys_addr_t base, phys_addr_t size)
+{
+	return __memblock_reserve(base, size, NUMA_NO_NODE, MEMBLOCK_RSRV_KERN);
+}
+
 #ifdef CONFIG_HAVE_MEMBLOCK_PHYS_MAP
 int memblock_physmem_add(phys_addr_t base, phys_addr_t size);
 #endif
@@ -476,6 +492,7 @@ static inline __init_memblock bool memblock_bottom_up(void)
 
 phys_addr_t memblock_phys_mem_size(void);
 phys_addr_t memblock_reserved_size(void);
+phys_addr_t memblock_reserved_kern_size(phys_addr_t limit, int nid);
 unsigned long memblock_estimated_nr_free_pages(void);
 phys_addr_t memblock_start_of_DRAM(void);
 phys_addr_t memblock_end_of_DRAM(void);
diff --git a/mm/memblock.c b/mm/memblock.c
index 0a53db4d9f7be..2dc95ecdee5ce 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -492,7 +492,7 @@ static int __init_memblock memblock_double_array(struct memblock_type *type,
 	 * needn't do it
 	 */
 	if (!use_slab)
-		BUG_ON(memblock_reserve(addr, new_alloc_size));
+		BUG_ON(memblock_reserve_kern(addr, new_alloc_size));
 
 	/* Update slab flag */
 	*in_slab = use_slab;
@@ -642,7 +642,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
 #ifdef CONFIG_NUMA
 			WARN_ON(nid != memblock_get_region_node(rgn));
 #endif
-			WARN_ON(flags != rgn->flags);
+			WARN_ON(flags != MEMBLOCK_NONE && flags != rgn->flags);
 			nr_new++;
 			if (insert) {
 				if (start_rgn == -1)
@@ -902,14 +902,15 @@ int __init_memblock memblock_phys_free(phys_addr_t base, phys_addr_t size)
 	return memblock_remove_range(&memblock.reserved, base, size);
 }
 
-int __init_memblock memblock_reserve(phys_addr_t base, phys_addr_t size)
+int __init_memblock __memblock_reserve(phys_addr_t base, phys_addr_t size,
+				       int nid, enum memblock_flags flags)
 {
 	phys_addr_t end = base + size - 1;
 
-	memblock_dbg("%s: [%pa-%pa] %pS\n", __func__,
-		     &base, &end, (void *)_RET_IP_);
+	memblock_dbg("%s: [%pa-%pa] nid=%d flags=%x %pS\n", __func__,
+		     &base, &end, nid, flags, (void *)_RET_IP_);
 
-	return memblock_add_range(&memblock.reserved, base, size, MAX_NUMNODES, 0);
+	return memblock_add_range(&memblock.reserved, base, size, nid, flags);
 }
 
 #ifdef CONFIG_HAVE_MEMBLOCK_PHYS_MAP
@@ -1460,14 +1461,14 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
 again:
 	found = memblock_find_in_range_node(size, align, start, end, nid,
 					    flags);
-	if (found && !memblock_reserve(found, size))
+	if (found && !__memblock_reserve(found, size, nid, MEMBLOCK_RSRV_KERN))
 		goto done;
 
 	if (numa_valid_node(nid) && !exact_nid) {
 		found = memblock_find_in_range_node(size, align, start,
 						    end, NUMA_NO_NODE,
 						    flags);
-		if (found && !memblock_reserve(found, size))
+		if (found && !memblock_reserve_kern(found, size))
 			goto done;
 	}
 
@@ -1752,6 +1753,28 @@ phys_addr_t __init_memblock memblock_reserved_size(void)
 	return memblock.reserved.total_size;
 }
 
+phys_addr_t __init_memblock memblock_reserved_kern_size(phys_addr_t limit, int nid)
+{
+	struct memblock_region *r;
+	phys_addr_t total = 0;
+
+	for_each_reserved_mem_region(r) {
+		phys_addr_t size = r->size;
+
+		if (r->base > limit)
+			break;
+
+		if (r->base + r->size > limit)
+			size = limit - r->base;
+
+		if (nid == memblock_get_region_node(r) || !numa_valid_node(nid))
+			if (r->flags & MEMBLOCK_RSRV_KERN)
+				total += size;
+	}
+
+	return total;
+}
+
 /**
  * memblock_estimated_nr_free_pages - return estimated number of free pages
  * from memblock point of view
@@ -2441,6 +2464,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_NOMAP)] = "NOMAP",
 	[ilog2(MEMBLOCK_DRIVER_MANAGED)] = "DRV_MNG",
 	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
+	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
diff --git a/tools/testing/memblock/tests/alloc_api.c b/tools/testing/memblock/tests/alloc_api.c
index 68f1a75cd72c4..c55f67dd367d0 100644
--- a/tools/testing/memblock/tests/alloc_api.c
+++ b/tools/testing/memblock/tests/alloc_api.c
@@ -134,7 +134,7 @@ static int alloc_top_down_before_check(void)
 	PREFIX_PUSH();
 	setup_memblock();
 
-	memblock_reserve(memblock_end_of_DRAM() - total_size, r1_size);
+	memblock_reserve_kern(memblock_end_of_DRAM() - total_size, r1_size);
 
 	allocated_ptr = run_memblock_alloc(r2_size, SMP_CACHE_BYTES);
 
@@ -182,7 +182,7 @@ static int alloc_top_down_after_check(void)
 
 	total_size = r1.size + r2_size;
 
-	memblock_reserve(r1.base, r1.size);
+	memblock_reserve_kern(r1.base, r1.size);
 
 	allocated_ptr = run_memblock_alloc(r2_size, SMP_CACHE_BYTES);
 
@@ -231,8 +231,8 @@ static int alloc_top_down_second_fit_check(void)
 
 	total_size = r1.size + r2.size + r3_size;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc(r3_size, SMP_CACHE_BYTES);
 
@@ -285,8 +285,8 @@ static int alloc_in_between_generic_check(void)
 
 	total_size = r1.size + r2.size + r3_size;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc(r3_size, SMP_CACHE_BYTES);
 
@@ -422,7 +422,7 @@ static int alloc_limited_space_generic_check(void)
 	setup_memblock();
 
 	/* Simulate almost-full memory */
-	memblock_reserve(memblock_start_of_DRAM(), reserved_size);
+	memblock_reserve_kern(memblock_start_of_DRAM(), reserved_size);
 
 	allocated_ptr = run_memblock_alloc(available_size, SMP_CACHE_BYTES);
 
@@ -608,7 +608,7 @@ static int alloc_bottom_up_before_check(void)
 	PREFIX_PUSH();
 	setup_memblock();
 
-	memblock_reserve(memblock_start_of_DRAM() + r1_size, r2_size);
+	memblock_reserve_kern(memblock_start_of_DRAM() + r1_size, r2_size);
 
 	allocated_ptr = run_memblock_alloc(r1_size, SMP_CACHE_BYTES);
 
@@ -655,7 +655,7 @@ static int alloc_bottom_up_after_check(void)
 
 	total_size = r1.size + r2_size;
 
-	memblock_reserve(r1.base, r1.size);
+	memblock_reserve_kern(r1.base, r1.size);
 
 	allocated_ptr = run_memblock_alloc(r2_size, SMP_CACHE_BYTES);
 
@@ -705,8 +705,8 @@ static int alloc_bottom_up_second_fit_check(void)
 
 	total_size = r1.size + r2.size + r3_size;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc(r3_size, SMP_CACHE_BYTES);
 
diff --git a/tools/testing/memblock/tests/alloc_helpers_api.c b/tools/testing/memblock/tests/alloc_helpers_api.c
index 3ef9486da8a09..e5362cfd2ff30 100644
--- a/tools/testing/memblock/tests/alloc_helpers_api.c
+++ b/tools/testing/memblock/tests/alloc_helpers_api.c
@@ -163,7 +163,7 @@ static int alloc_from_top_down_no_space_above_check(void)
 	min_addr = memblock_end_of_DRAM() - SMP_CACHE_BYTES * 2;
 
 	/* No space above this address */
-	memblock_reserve(min_addr, r2_size);
+	memblock_reserve_kern(min_addr, r2_size);
 
 	allocated_ptr = memblock_alloc_from(r1_size, SMP_CACHE_BYTES, min_addr);
 
@@ -199,7 +199,7 @@ static int alloc_from_top_down_min_addr_cap_check(void)
 	start_addr = (phys_addr_t)memblock_start_of_DRAM();
 	min_addr = start_addr - SMP_CACHE_BYTES * 3;
 
-	memblock_reserve(start_addr + r1_size, MEM_SIZE - r1_size);
+	memblock_reserve_kern(start_addr + r1_size, MEM_SIZE - r1_size);
 
 	allocated_ptr = memblock_alloc_from(r1_size, SMP_CACHE_BYTES, min_addr);
 
diff --git a/tools/testing/memblock/tests/alloc_nid_api.c b/tools/testing/memblock/tests/alloc_nid_api.c
index 49bb416d34ffc..562e4701b0e02 100644
--- a/tools/testing/memblock/tests/alloc_nid_api.c
+++ b/tools/testing/memblock/tests/alloc_nid_api.c
@@ -324,7 +324,7 @@ static int alloc_nid_min_reserved_generic_check(void)
 	min_addr = max_addr - r2_size;
 	reserved_base = min_addr - r1_size;
 
-	memblock_reserve(reserved_base, r1_size);
+	memblock_reserve_kern(reserved_base, r1_size);
 
 	allocated_ptr = run_memblock_alloc_nid(r2_size, SMP_CACHE_BYTES,
 					       min_addr, max_addr,
@@ -374,7 +374,7 @@ static int alloc_nid_max_reserved_generic_check(void)
 	max_addr = memblock_end_of_DRAM() - r1_size;
 	min_addr = max_addr - r2_size;
 
-	memblock_reserve(max_addr, r1_size);
+	memblock_reserve_kern(max_addr, r1_size);
 
 	allocated_ptr = run_memblock_alloc_nid(r2_size, SMP_CACHE_BYTES,
 					       min_addr, max_addr,
@@ -436,8 +436,8 @@ static int alloc_nid_top_down_reserved_with_space_check(void)
 	min_addr = r2.base + r2.size;
 	max_addr = r1.base;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc_nid(r3_size, SMP_CACHE_BYTES,
 					       min_addr, max_addr,
@@ -499,8 +499,8 @@ static int alloc_nid_reserved_full_merge_generic_check(void)
 	min_addr = r2.base + r2.size;
 	max_addr = r1.base;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc_nid(r3_size, SMP_CACHE_BYTES,
 					       min_addr, max_addr,
@@ -563,8 +563,8 @@ static int alloc_nid_top_down_reserved_no_space_check(void)
 	min_addr = r2.base + r2.size;
 	max_addr = r1.base;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc_nid(r3_size, SMP_CACHE_BYTES,
 					       min_addr, max_addr,
@@ -909,8 +909,8 @@ static int alloc_nid_bottom_up_reserved_with_space_check(void)
 	min_addr = r2.base + r2.size;
 	max_addr = r1.base;
 
-	memblock_reserve(r1.base, r1.size);
-	memblock_reserve(r2.base, r2.size);
+	memblock_reserve_kern(r1.base, r1.size);
+	memblock_reserve_kern(r2.base, r2.size);
 
 	allocated_ptr = run_memblock_alloc_nid(r3_size, SMP_CACHE_BYTES,
 					       min_addr, max_addr,
-- 
2.49.0.1015.ga840276032-goog

