Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4236A303DC4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477777; cv=none; b=s40pQnMmuaeXaAlRw0Ogmw4VqQp+o52fmUJDMnhsP3hUsCfKLBkOYOOhER5MoxynTkKsubpBUeFszYecqTjU8bA/jnPAEsZEUeQzibxT41jtFhAGzKNvkjsHXYI9AqGzrfNpw/RnbZkRtFI/F01Uqta0gcI7fHxpwrIWkV9IEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477777; c=relaxed/simple;
	bh=IcZVDD4PqCPvRH9Tv0Yzxexs8Xfs5CVXiVFXXhDy2C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLrYgvUBW/NdLV15TT+Rv0BdDTEH51ZjGE2MwqpDhEVpXdX8TW+NRX1ltnyBWBKrhqasuZGg0GkRvchjG0Bt3rkHLFdZTKezJAwOhpWV+UE1GQNQ3wiyvWlbziArCooxKJs5IqeYbO0JfZ5VPZyf1nmM0cVMrxtTBIYg+r9HCc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dm8kvj85; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dm8kvj85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF6C4CEEE;
	Wed,  2 Jul 2025 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751477774;
	bh=IcZVDD4PqCPvRH9Tv0Yzxexs8Xfs5CVXiVFXXhDy2C0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dm8kvj85eAA+xP+KHiFlmlOZjR+bqAodYmMkoKUruVf0dTyLyoFRVu+cK07+JJ6V7
	 r9EyXym8DbdsIKUBsKDR3socBoBq68tLhycyV0HHoRJ4f+8TeXdmrSmk/00RA+gFHE
	 T66U26mL2KxDF6GMMulH0K/G25NsJH51UE8XR7xHoPMLRmAvSSseDiW2Fg0n1P7s48
	 ytBiaUtGqlF8QtVFGcmhqFwInk9GtyT3Rdy447ZpHr+AUsozd7LVz9rI3Bp96FGX60
	 K7oPpxKGnuwgUVpBwzr+fnFx5nMihuFhjA4QuElNM4texmWvL1+Z/wgxAkt0KGqXVK
	 rNLSMKB4f80sA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/3] cma: move __cma_declare_contiguous_nid() before its usage
Date: Wed,  2 Jul 2025 20:36:03 +0300
Message-ID: <20250702173605.2198924-2-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250702173605.2198924-1-rppt@kernel.org>
References: <20250702173605.2198924-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

and kill static declaration

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/cma.c | 294 +++++++++++++++++++++++++++----------------------------
 1 file changed, 144 insertions(+), 150 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 397567883a10..9bf95f8f0f33 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -35,12 +35,6 @@
 struct cma cma_areas[MAX_CMA_AREAS];
 unsigned int cma_area_count;
 
-static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
-			phys_addr_t size, phys_addr_t limit,
-			phys_addr_t alignment, unsigned int order_per_bit,
-			bool fixed, const char *name, struct cma **res_cma,
-			int nid);
-
 phys_addr_t cma_get_base(const struct cma *cma)
 {
 	WARN_ON_ONCE(cma->nranges != 1);
@@ -358,6 +352,150 @@ static void __init list_insert_sorted(
 	}
 }
 
+static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
+			phys_addr_t size, phys_addr_t limit,
+			phys_addr_t alignment, unsigned int order_per_bit,
+			bool fixed, const char *name, struct cma **res_cma,
+			int nid)
+{
+	phys_addr_t memblock_end = memblock_end_of_DRAM();
+	phys_addr_t highmem_start, base = *basep;
+	int ret;
+
+	/*
+	 * We can't use __pa(high_memory) directly, since high_memory
+	 * isn't a valid direct map VA, and DEBUG_VIRTUAL will (validly)
+	 * complain. Find the boundary by adding one to the last valid
+	 * address.
+	 */
+	if (IS_ENABLED(CONFIG_HIGHMEM))
+		highmem_start = __pa(high_memory - 1) + 1;
+	else
+		highmem_start = memblock_end_of_DRAM();
+	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
+		__func__, &size, &base, &limit, &alignment);
+
+	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
+		pr_err("Not enough slots for CMA reserved regions!\n");
+		return -ENOSPC;
+	}
+
+	if (!size)
+		return -EINVAL;
+
+	if (alignment && !is_power_of_2(alignment))
+		return -EINVAL;
+
+	if (!IS_ENABLED(CONFIG_NUMA))
+		nid = NUMA_NO_NODE;
+
+	/* Sanitise input arguments. */
+	alignment = max_t(phys_addr_t, alignment, CMA_MIN_ALIGNMENT_BYTES);
+	if (fixed && base & (alignment - 1)) {
+		pr_err("Region at %pa must be aligned to %pa bytes\n",
+			&base, &alignment);
+		return -EINVAL;
+	}
+	base = ALIGN(base, alignment);
+	size = ALIGN(size, alignment);
+	limit &= ~(alignment - 1);
+
+	if (!base)
+		fixed = false;
+
+	/* size should be aligned with order_per_bit */
+	if (!IS_ALIGNED(size >> PAGE_SHIFT, 1 << order_per_bit))
+		return -EINVAL;
+
+	/*
+	 * If allocating at a fixed base the request region must not cross the
+	 * low/high memory boundary.
+	 */
+	if (fixed && base < highmem_start && base + size > highmem_start) {
+		pr_err("Region at %pa defined on low/high memory boundary (%pa)\n",
+			&base, &highmem_start);
+		return -EINVAL;
+	}
+
+	/*
+	 * If the limit is unspecified or above the memblock end, its effective
+	 * value will be the memblock end. Set it explicitly to simplify further
+	 * checks.
+	 */
+	if (limit == 0 || limit > memblock_end)
+		limit = memblock_end;
+
+	if (base + size > limit) {
+		pr_err("Size (%pa) of region at %pa exceeds limit (%pa)\n",
+			&size, &base, &limit);
+		return -EINVAL;
+	}
+
+	/* Reserve memory */
+	if (fixed) {
+		if (memblock_is_region_reserved(base, size) ||
+		    memblock_reserve(base, size) < 0) {
+			return -EBUSY;
+		}
+	} else {
+		phys_addr_t addr = 0;
+
+		/*
+		 * If there is enough memory, try a bottom-up allocation first.
+		 * It will place the new cma area close to the start of the node
+		 * and guarantee that the compaction is moving pages out of the
+		 * cma area and not into it.
+		 * Avoid using first 4GB to not interfere with constrained zones
+		 * like DMA/DMA32.
+		 */
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+		if (!memblock_bottom_up() && memblock_end >= SZ_4G + size) {
+			memblock_set_bottom_up(true);
+			addr = memblock_alloc_range_nid(size, alignment, SZ_4G,
+							limit, nid, true);
+			memblock_set_bottom_up(false);
+		}
+#endif
+
+		/*
+		 * All pages in the reserved area must come from the same zone.
+		 * If the requested region crosses the low/high memory boundary,
+		 * try allocating from high memory first and fall back to low
+		 * memory in case of failure.
+		 */
+		if (!addr && base < highmem_start && limit > highmem_start) {
+			addr = memblock_alloc_range_nid(size, alignment,
+					highmem_start, limit, nid, true);
+			limit = highmem_start;
+		}
+
+		if (!addr) {
+			addr = memblock_alloc_range_nid(size, alignment, base,
+					limit, nid, true);
+			if (!addr)
+				return -ENOMEM;
+		}
+
+		/*
+		 * kmemleak scans/reads tracked objects for pointers to other
+		 * objects but this address isn't mapped and accessible
+		 */
+		kmemleak_ignore_phys(addr);
+		base = addr;
+	}
+
+	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
+	if (ret) {
+		memblock_phys_free(base, size);
+		return ret;
+	}
+
+	(*res_cma)->nid = nid;
+	*basep = base;
+
+	return 0;
+}
+
 /*
  * Create CMA areas with a total size of @total_size. A normal allocation
  * for one area is tried first. If that fails, the biggest memblock
@@ -593,150 +731,6 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
 	return ret;
 }
 
-static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
-			phys_addr_t size, phys_addr_t limit,
-			phys_addr_t alignment, unsigned int order_per_bit,
-			bool fixed, const char *name, struct cma **res_cma,
-			int nid)
-{
-	phys_addr_t memblock_end = memblock_end_of_DRAM();
-	phys_addr_t highmem_start, base = *basep;
-	int ret;
-
-	/*
-	 * We can't use __pa(high_memory) directly, since high_memory
-	 * isn't a valid direct map VA, and DEBUG_VIRTUAL will (validly)
-	 * complain. Find the boundary by adding one to the last valid
-	 * address.
-	 */
-	if (IS_ENABLED(CONFIG_HIGHMEM))
-		highmem_start = __pa(high_memory - 1) + 1;
-	else
-		highmem_start = memblock_end_of_DRAM();
-	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
-		__func__, &size, &base, &limit, &alignment);
-
-	if (cma_area_count == ARRAY_SIZE(cma_areas)) {
-		pr_err("Not enough slots for CMA reserved regions!\n");
-		return -ENOSPC;
-	}
-
-	if (!size)
-		return -EINVAL;
-
-	if (alignment && !is_power_of_2(alignment))
-		return -EINVAL;
-
-	if (!IS_ENABLED(CONFIG_NUMA))
-		nid = NUMA_NO_NODE;
-
-	/* Sanitise input arguments. */
-	alignment = max_t(phys_addr_t, alignment, CMA_MIN_ALIGNMENT_BYTES);
-	if (fixed && base & (alignment - 1)) {
-		pr_err("Region at %pa must be aligned to %pa bytes\n",
-			&base, &alignment);
-		return -EINVAL;
-	}
-	base = ALIGN(base, alignment);
-	size = ALIGN(size, alignment);
-	limit &= ~(alignment - 1);
-
-	if (!base)
-		fixed = false;
-
-	/* size should be aligned with order_per_bit */
-	if (!IS_ALIGNED(size >> PAGE_SHIFT, 1 << order_per_bit))
-		return -EINVAL;
-
-	/*
-	 * If allocating at a fixed base the request region must not cross the
-	 * low/high memory boundary.
-	 */
-	if (fixed && base < highmem_start && base + size > highmem_start) {
-		pr_err("Region at %pa defined on low/high memory boundary (%pa)\n",
-			&base, &highmem_start);
-		return -EINVAL;
-	}
-
-	/*
-	 * If the limit is unspecified or above the memblock end, its effective
-	 * value will be the memblock end. Set it explicitly to simplify further
-	 * checks.
-	 */
-	if (limit == 0 || limit > memblock_end)
-		limit = memblock_end;
-
-	if (base + size > limit) {
-		pr_err("Size (%pa) of region at %pa exceeds limit (%pa)\n",
-			&size, &base, &limit);
-		return -EINVAL;
-	}
-
-	/* Reserve memory */
-	if (fixed) {
-		if (memblock_is_region_reserved(base, size) ||
-		    memblock_reserve(base, size) < 0) {
-			return -EBUSY;
-		}
-	} else {
-		phys_addr_t addr = 0;
-
-		/*
-		 * If there is enough memory, try a bottom-up allocation first.
-		 * It will place the new cma area close to the start of the node
-		 * and guarantee that the compaction is moving pages out of the
-		 * cma area and not into it.
-		 * Avoid using first 4GB to not interfere with constrained zones
-		 * like DMA/DMA32.
-		 */
-#ifdef CONFIG_PHYS_ADDR_T_64BIT
-		if (!memblock_bottom_up() && memblock_end >= SZ_4G + size) {
-			memblock_set_bottom_up(true);
-			addr = memblock_alloc_range_nid(size, alignment, SZ_4G,
-							limit, nid, true);
-			memblock_set_bottom_up(false);
-		}
-#endif
-
-		/*
-		 * All pages in the reserved area must come from the same zone.
-		 * If the requested region crosses the low/high memory boundary,
-		 * try allocating from high memory first and fall back to low
-		 * memory in case of failure.
-		 */
-		if (!addr && base < highmem_start && limit > highmem_start) {
-			addr = memblock_alloc_range_nid(size, alignment,
-					highmem_start, limit, nid, true);
-			limit = highmem_start;
-		}
-
-		if (!addr) {
-			addr = memblock_alloc_range_nid(size, alignment, base,
-					limit, nid, true);
-			if (!addr)
-				return -ENOMEM;
-		}
-
-		/*
-		 * kmemleak scans/reads tracked objects for pointers to other
-		 * objects but this address isn't mapped and accessible
-		 */
-		kmemleak_ignore_phys(addr);
-		base = addr;
-	}
-
-	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
-	if (ret) {
-		memblock_phys_free(base, size);
-		return ret;
-	}
-
-	(*res_cma)->nid = nid;
-	*basep = base;
-
-	return 0;
-}
-
 static void cma_debug_show_areas(struct cma *cma)
 {
 	unsigned long next_zero_bit, next_set_bit, nr_zero;
-- 
2.47.2

