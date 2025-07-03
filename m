Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153A2F2C60
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568443; cv=none; b=fxcODahiHStS9kmyDVc4ZGwi7H5OvdkpV/4iKjuyfnLQLFFj87ldlXbmznurM0t+OREnOlwLzX5nIJNJg63m9p73ep+clY0KiHAjtpdFFFqrhA9pWV8G87UzhgKxCVRxVdi11Hai0rt8EDNHiRb9lA/lOLLL4HbVRdV9Z9vrQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568443; c=relaxed/simple;
	bh=fDYGSp0mhPleTZCOwqNaMFjGYXswrc476BaeDuKTLlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEGyXUzqmzr/0syjEMs8Qs7yd915CDf3+okkRX+qmmDA3bnlHiNixz1r5/kY3Hfox2YmyuGwX1Su+wqL1mKXf9lZeEtzNViGJ2HENDBOxXBzipKFHnUZY2q2qg6vCeTYqNE/HpxeOOW4N7/N7twy78yDpLIL1RQIF9ZAf8aPoh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BL7X8Y9z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BL7X8Y9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD96FC4CEE3;
	Thu,  3 Jul 2025 18:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751568443;
	bh=fDYGSp0mhPleTZCOwqNaMFjGYXswrc476BaeDuKTLlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BL7X8Y9zuboU6b75TO6pEI89umaqtfAw0Fvdg7scetSgKDDqeKT+83YXNi1vmr/Rk
	 vUhKs7AuKX+6I6vMVc37yZ4pFz4TJ8+6/wEo2jePBl5I/wJPYnSOLiame9qlsoVG+7
	 B+51ZeUdIF2j4bDYbBkDiWazpXwPj9BspVIbNHip+hvMiKqXJbCT6qBhAvKljZ+IZU
	 +XbDBSMDPlSWd90wBbL6Bto7eHljFXfQAz1jPt+o7QIW/zLj1NArOTUdWnqucpc0aN
	 P8Gix12xky2S6OqLhFKjPWnwayL3lxSzIIKCqODV+wS02aS33tg1R0T2ufI8XFSgOE
	 1QDvCuxOI6Dug==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 2/3] cma: split resrvation of fixed area into a helper function
Date: Thu,  3 Jul 2025 21:47:10 +0300
Message-ID: <20250703184711.3485940-3-rppt@kernel.org>
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

Move the check that verifies that reservation of fixed area does not
cross HIGHMEM boundary and the actual memblock_resrve() call into a
helper function.

This makes code more readable and decouples logic related to
CONFIG_HIGHMEM from the core functionality of
__cma_declare_contiguous_nid().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
---
 mm/cma.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 9bf95f8f0f33..40986722f2e2 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -352,6 +352,30 @@ static void __init list_insert_sorted(
 	}
 }
 
+static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
+{
+	if (IS_ENABLED(CONFIG_HIGHMEM)) {
+		phys_addr_t highmem_start = __pa(high_memory - 1) + 1;
+
+		/*
+		 * If allocating at a fixed base the request region must not
+		 * cross the low/high memory boundary.
+		 */
+		if (base < highmem_start && base + size > highmem_start) {
+			pr_err("Region at %pa defined on low/high memory boundary (%pa)\n",
+			       &base, &highmem_start);
+			return -EINVAL;
+		}
+	}
+
+	if (memblock_is_region_reserved(base, size) ||
+	    memblock_reserve(base, size) < 0) {
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 			phys_addr_t size, phys_addr_t limit,
 			phys_addr_t alignment, unsigned int order_per_bit,
@@ -407,15 +431,6 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 	if (!IS_ALIGNED(size >> PAGE_SHIFT, 1 << order_per_bit))
 		return -EINVAL;
 
-	/*
-	 * If allocating at a fixed base the request region must not cross the
-	 * low/high memory boundary.
-	 */
-	if (fixed && base < highmem_start && base + size > highmem_start) {
-		pr_err("Region at %pa defined on low/high memory boundary (%pa)\n",
-			&base, &highmem_start);
-		return -EINVAL;
-	}
 
 	/*
 	 * If the limit is unspecified or above the memblock end, its effective
@@ -433,10 +448,9 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 
 	/* Reserve memory */
 	if (fixed) {
-		if (memblock_is_region_reserved(base, size) ||
-		    memblock_reserve(base, size) < 0) {
-			return -EBUSY;
-		}
+		ret = cma_fixed_reserve(base, size);
+		if (ret)
+			return ret;
 	} else {
 		phys_addr_t addr = 0;
 
-- 
2.47.2

