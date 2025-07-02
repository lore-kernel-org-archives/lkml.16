Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B552303DD4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477779; cv=none; b=aPIMe186guxnxJ8t0W39+aNfuIJGGPP3YTzJRItuHAzaqvv+N3bUnuscCwxbJLMHXw8d/Tzor5XmHncw1M+vqGw781YdpAGhdDNWDLfaST8JPQP5Iw2zji7wrFFV9MqAMaJhJnCWVmPr0kthAO2CeeoRwq5Ev8HuB/+ynsBB+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477779; c=relaxed/simple;
	bh=EXacDh63KkBz1wR1cI8SHJiNqTMma8mwS1tgtRPH3wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWywZ3cIhbb/SquIoWsMmkogWWy7VkrTbMLTbrJIKCLpTOuk9WPrk002QGpW7+PfjdtrSPtHRDxXpfedfwHOK7HUjuJxu1tHFp7feUFuoF90fAw210NfmSYjiV8ybuAo7z0bLa0lFwzONidkrKLy060gWP3FwrOY+iC33u1nrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7o28+x2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7o28+x2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F5AC4CEF1;
	Wed,  2 Jul 2025 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751477777;
	bh=EXacDh63KkBz1wR1cI8SHJiNqTMma8mwS1tgtRPH3wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D7o28+x2/mgxX5nwyTE3ftuQMeHogJzEYes3Ly2UlH8uednwmJKST3ewJ5iH2A1Vp
	 ElfKd5xPUPlSCV83J4L+M7TikEEP1hf2Od29EO2TYF/Lgb4Z7X31knbOAweLKZsytn
	 8ByZtOgjwAjV1Kd4WyulYkTl9rdwgtMsOBNYnOkaJlnbBS4oCxG0etKLgn/yuscXDf
	 W8onn6+Eggn8QWb83ajII+2fm/ZwSee7WmsUPFt2gg8+NiNljcHzwQaOt7NxI7cUSH
	 EkQ8Sz8NxvC/LK9HmLz5ld857e2BlW3WQWLJj5sYPw7fWgFyAMRXaaqKOU+oZNtgrF
	 ih5OigKav5t5g==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/3] cma: split resrvation of fixed area into a helper function
Date: Wed,  2 Jul 2025 20:36:04 +0300
Message-ID: <20250702173605.2198924-3-rppt@kernel.org>
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

Move the check that verifies that reservation of fixed area does not
cross HIGHMEM boundary and the actual memblock_resrve() call into a
helper function.

This makes code more readable and decouples logic related to
CONFIG_HIGHMEM from the core functionality of
__cma_declare_contiguous_nid().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/cma.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 9bf95f8f0f33..1df8ff312d99 100644
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
@@ -433,10 +448,10 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t *basep,
 
 	/* Reserve memory */
 	if (fixed) {
-		if (memblock_is_region_reserved(base, size) ||
-		    memblock_reserve(base, size) < 0) {
-			return -EBUSY;
-		}
+		int err = cma_fixed_reserve(base, size);
+
+		if (err)
+			return err;
 	} else {
 		phys_addr_t addr = 0;
 
-- 
2.47.2

