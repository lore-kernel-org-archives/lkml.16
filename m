Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337192F235C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568446; cv=none; b=p2A2uM8Y2sMHkFKaGQxZi0wHAbn4AidzZzcsDzEHEWmBbF3mihNYep+8KeefroeVGRGjBJ64XvYDma49+wLnXDm8iCylMrbgiqHMQRyg5XuSeOqrmMce/OrGrHOWXva6EZC6C6dAeCNQ1q4FAb3GVI03IE+mm57eu7V8TSXqsbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568446; c=relaxed/simple;
	bh=tcEi1U27IGWBqhLz+MiaA8hsyIY4ToMuJMarpB78bYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nkCLS4idJ9jHZUAKn3mD68XOMJ1k47AGkKfpvXKTHnHw7qDhsZ52S8SfwRL7NGgygY/6tw0LVkpZGzO5Ka0BeSIcsPE7zRtcvErBFaRNbOkY+3LSCnTmAd+x6ALw4NmxZqivFY/qN50Sx0W1cf9cqPT0Lzo92/jZJ2I3pBgf+v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cC1HbyRC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cC1HbyRC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8854AC4CEEB;
	Thu,  3 Jul 2025 18:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751568445;
	bh=tcEi1U27IGWBqhLz+MiaA8hsyIY4ToMuJMarpB78bYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cC1HbyRCOJFDG82jAk9zvUdgKaaXF9EB4TpKl2LDzz6smpm/KMg41qjDNNlssg4Ft
	 9EJSyiaZ2couYjzqBYw7BDXDvfLWfpLdkMTfkkjpjGWfPjZC00NfITqCaG7yXeKEkF
	 yudER+7ibLUzi5Uf/pRpNRaqiEYRkVv7pRYJQnXQHCFn6eJUI0WIKqy7dvyQXyHMdV
	 oozjI7A4UCyMbrXPg0auXTPormz7d3rIsY++U4jvGqTKZTbQQsrG+gHEQWBVakV9mk
	 sdNIwJHwePibkZV0r5Sds9pLShJ/LQhv0eqCm3dURTxokrRJ9KQrSKwbAZoT8KKnW4
	 gQ6ltbIIXpxxg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 3/3] cma: move memory allocation to a helper function
Date: Thu,  3 Jul 2025 21:47:11 +0300
Message-ID: <20250703184711.3485940-4-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250703184711.3485940-1-rppt@kernel.org>
References: <20250703184711.3485940-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

__cma_declare_contiguous_nid() tries to allocate memory in several ways:
* on systems with 64 bit physical address and enough memory it first
  attempts to allocate memory just above 4GiB
* if that fails, on systems with HIGHMEM the next attempt is from high
  memory
* and at last, if none of the previous attempts succeeded, or was even
  tried because of incompatible configuration, the memory is allocated
  anywhere within specified limits.

Move all the allocation logic to a helper function to make these steps more
obvious.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/cma.c | 104 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 54 insertions(+), 50 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 40986722f2e2..38876ccc07cf 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -376,6 +376,55 @@ static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
 	return 0;
 }
 
+static phys_addr_t __init cma_alloc_mem(phys_addr_t base, phys_addr_t size,
+			phys_addr_t align, phys_addr_t limit, int nid)
+{
+	phys_addr_t addr = 0;
+
+	/*
+	 * If there is enough memory, try a bottom-up allocation first.
+	 * It will place the new cma area close to the start of the node
+	 * and guarantee that the compaction is moving pages out of the
+	 * cma area and not into it.
+	 * Avoid using first 4GB to not interfere with constrained zones
+	 * like DMA/DMA32.
+	 */
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
+	if (!memblock_bottom_up() && limit >= SZ_4G + size) {
+		memblock_set_bottom_up(true);
+		addr = memblock_alloc_range_nid(size, align, SZ_4G, limit,
+						nid, true);
+		memblock_set_bottom_up(false);
+	}
+#endif
+
+	/*
+	 * On systems with HIGHMEM try allocating from there before consuming
+	 * memory in lower zones.
+	 */
+	if (!addr && IS_ENABLED(CONFIG_HIGHMEM)) {
+		phys_addr_t highmem = __pa(high_memory - 1) + 1;
+
+		/*
+		 * All pages in the reserved area must come from the same zone.
+		 * If the requested region crosses the low/high memory boundary,
+		 * try allocating from high memory first and fall back to low
+		 * memory in case of failure.
+		 */
+		if (base < highmem && limit > highmem) {
+			addr = memblock_alloc_range_nid(size, align, highmem,
+							limit, nid, true);
+			limit = highmem;
+		}
+	}
+
+	if (!addr)
+		addr = memblock_alloc_range_nid(size, align, base, limit, nid,
+						true);
+
+	return addr;
+}
+
 static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 			phys_addr_t size, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
@@ -383,19 +432,9 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 			int nid)
 {
 	phys_addr_t memblock_end = memblock_end_of_DRAM();
-	phys_addr_t highmem_start, base = *basep;
+	phys_addr_t base = *basep;
 	int ret;
 
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
 	pr_debug("%s(size %pa, base %pa, limit %pa alignment %pa)\n",
 		__func__, &size, &base, &limit, &alignment);
 
@@ -452,50 +491,15 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 		if (ret)
 			return ret;
 	} else {
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
+		base = cma_alloc_mem(base, size, alignment, limit, nid);
+		if (!base)
+			return -ENOMEM;
 
 		/*
 		 * kmemleak scans/reads tracked objects for pointers to other
 		 * objects but this address isn't mapped and accessible
 		 */
-		kmemleak_ignore_phys(addr);
-		base = addr;
+		kmemleak_ignore_phys(base);
 	}
 
 	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
-- 
2.47.2

