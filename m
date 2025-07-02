Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3B303DF9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477780; cv=none; b=NvtoNwojat1YxNPt84H+5sX+FXe2IwJq4yeeSfyYf10VLLEJn8iJdSlNfDVk5R5KFF7eUjMdMRLMaTBX0RbdqFo3c/uwCKkdkesXy3GqPYeOMD3SYPLMu5do/+T2pR5dcFK3+OCUZEAcTocTBIPbBFylJiE3YzX64dq8M3dWA+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477780; c=relaxed/simple;
	bh=NqKk8ngarG6g3EyeYQKPZPq7rwSgnU5mnxeVmbW10t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKhWAsFbin3jCRL4eX/yFXfpOFQWD8TxVIBbEyYo4ON2sVIOXMNWxMypXbASluwZXTmIidZvPl/qVc5p6BhwS8OuHS3HnApjXaxm8IBdTg9k5YtA+KezRKOQmJ6W0e5WGbIo7W6qRt2y+BktRcQH/uOv+py6pcL0FZWzzHiUHvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQleZpGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQleZpGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A365C4CEEE;
	Wed,  2 Jul 2025 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751477780;
	bh=NqKk8ngarG6g3EyeYQKPZPq7rwSgnU5mnxeVmbW10t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vQleZpGgNy3mRTy5dbm9tOQSQllRNd7C7MW0izMjJH9NSe7mbO92fQJ0qQUrNG2R2
	 2dIWbQ1ryYr6OTjjqOP5P3arqEyF2pAUeb1rHo+D1daavMkQN2y7kXt/V9IBRCneJY
	 XRE7FNsbSaTMWKkw15gykIINHiFYjQ6TEjSLcBUS4TVVcGMjBKE/VnrzrJ5iABejga
	 +4QMO6t9+bbz4kDf9Kqt00H7L3dEOFkyjj4DuZYQsGl6oSHR97tFHEBZLTzCnrBzA+
	 zKP74NX5aLNUqsRFVdYFODDbnG27smcrw3eGree46NKcn5WyuA+5aAhuK5cFuhMBi+
	 n4oL+U2o1vUqg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 3/3] cma: move allocation from HIGHMEM to a helper function
Date: Wed,  2 Jul 2025 20:36:05 +0300
Message-ID: <20250702173605.2198924-4-rppt@kernel.org>
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

When CONFIG_HIGMEM is enabled, __cma_declare_contiguous_nid() first
tries to allocate the area from HIGHMEM and if that fails it falls back
to allocation from low memory.

Split allocation from HIGMEM into a helper function to further decouple
logic related to CONFIG_HIGHMEM.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/cma.c | 52 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 1df8ff312d99..0a24c46f3296 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -376,6 +376,30 @@ static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
 	return 0;
 }
 
+static phys_addr_t __init cma_alloc_highmem(phys_addr_t base, phys_addr_t size,
+			phys_addr_t align, phys_addr_t *limit, int nid)
+{
+	phys_addr_t addr = 0;
+
+	if (IS_ENABLED(CONFIG_HIGHMEM)) {
+		phys_addr_t highmem = __pa(high_memory - 1) + 1;
+
+		/*
+		 * All pages in the reserved area must come from the same zone.
+		 * If the requested region crosses the low/high memory boundary,
+		 * try allocating from high memory first and fall back to low
+		 * memory in case of failure.
+		 */
+		if (base < highmem && *limit > highmem) {
+			addr = memblock_alloc_range_nid(size, align, highmem,
+							*limit, nid, true);
+			*limit = highmem;
+		}
+	}
+
+	return addr;
+}
+
 static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 			phys_addr_t size, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
@@ -383,19 +407,9 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
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
 
@@ -472,18 +486,10 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 		}
 #endif
 
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
+		/* On systems with HIGHMEM try allocating from there first */
+		if (!addr)
+			addr = cma_alloc_highmem(base, size, alignment, &limit,
+						 nid);
 		if (!addr) {
 			addr = memblock_alloc_range_nid(size, alignment, base,
 					limit, nid, true);
-- 
2.47.2

