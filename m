Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6798F22DF99
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842343; cv=none; b=JPSml0WIGuftIQOJNJW/Gq+auKqwG/ZwYtlWyPG8gqy+gINuR/ceLx4MjY8MEaPhcD7SuQOw6Dbf+xaRgN3st8h0yFOqu/y0nTmVsnDpv3bhF0Pk+m7QJwJbneRAm/z6MWVd0GDTLIG2GZW0+KBr+mmjN8ahJLvQg3y4An+mACM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842343; c=relaxed/simple;
	bh=6qsbxfuDkvELYYQobIoh/0InnnvJdmLUF71rnIzPuHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WVKftApPxKSyfz0mKvSMakXyBDkPGESHzqqfzxf4d8TaQSucgVor2VX1w9pycoqUEp4KQc2uOycZ02rX6qQO0rlYSmMkpRUfaJNOdCWf86zbtdGlGAcskJCZw9spF3lYf/BjBgyzlD4uUsMbSkoUbM4OVtCph9v4ylYTUIoF9nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B5DC4CEDD;
	Thu,  6 Feb 2025 11:45:41 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] samples: kmemleak: Print the raw pointers for debugging purposes
Date: Thu,  6 Feb 2025 11:45:37 +0000
Message-Id: <20250206114537.2597764-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206114537.2597764-1-catalin.marinas@arm.com>
References: <20250206114537.2597764-1-catalin.marinas@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmemleak-test.c module is meant to leak some pointers for debugging
the kmemleak detection, pointer information dumping. It's no use if it
prints the hashed values of such pointers.

Change the printk() format from %p to %px. While at it, also display the
raw __percpu pointer rather than this_cpu_ptr() since kmemleak now
tracks such pointers independently of the standard allocations.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 samples/kmemleak/kmemleak-test.c | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/samples/kmemleak/kmemleak-test.c b/samples/kmemleak/kmemleak-test.c
index 544c36d51d56..8609812a37eb 100644
--- a/samples/kmemleak/kmemleak-test.c
+++ b/samples/kmemleak/kmemleak-test.c
@@ -40,25 +40,25 @@ static int kmemleak_test_init(void)
 	pr_info("Kmemleak testing\n");
 
 	/* make some orphan objects */
-	pr_info("kmalloc(32) = %p\n", kmalloc(32, GFP_KERNEL));
-	pr_info("kmalloc(32) = %p\n", kmalloc(32, GFP_KERNEL));
-	pr_info("kmalloc(1024) = %p\n", kmalloc(1024, GFP_KERNEL));
-	pr_info("kmalloc(1024) = %p\n", kmalloc(1024, GFP_KERNEL));
-	pr_info("kmalloc(2048) = %p\n", kmalloc(2048, GFP_KERNEL));
-	pr_info("kmalloc(2048) = %p\n", kmalloc(2048, GFP_KERNEL));
-	pr_info("kmalloc(4096) = %p\n", kmalloc(4096, GFP_KERNEL));
-	pr_info("kmalloc(4096) = %p\n", kmalloc(4096, GFP_KERNEL));
+	pr_info("kmalloc(32) = 0x%px\n", kmalloc(32, GFP_KERNEL));
+	pr_info("kmalloc(32) = 0x%px\n", kmalloc(32, GFP_KERNEL));
+	pr_info("kmalloc(1024) = 0x%px\n", kmalloc(1024, GFP_KERNEL));
+	pr_info("kmalloc(1024) = 0x%px\n", kmalloc(1024, GFP_KERNEL));
+	pr_info("kmalloc(2048) = 0x%px\n", kmalloc(2048, GFP_KERNEL));
+	pr_info("kmalloc(2048) = 0x%px\n", kmalloc(2048, GFP_KERNEL));
+	pr_info("kmalloc(4096) = 0x%px\n", kmalloc(4096, GFP_KERNEL));
+	pr_info("kmalloc(4096) = 0x%px\n", kmalloc(4096, GFP_KERNEL));
 #ifndef CONFIG_MODULES
-	pr_info("kmem_cache_alloc(files_cachep) = %p\n",
+	pr_info("kmem_cache_alloc(files_cachep) = 0x%px\n",
 		kmem_cache_alloc(files_cachep, GFP_KERNEL));
-	pr_info("kmem_cache_alloc(files_cachep) = %p\n",
+	pr_info("kmem_cache_alloc(files_cachep) = 0x%px\n",
 		kmem_cache_alloc(files_cachep, GFP_KERNEL));
 #endif
-	pr_info("vmalloc(64) = %p\n", vmalloc(64));
-	pr_info("vmalloc(64) = %p\n", vmalloc(64));
-	pr_info("vmalloc(64) = %p\n", vmalloc(64));
-	pr_info("vmalloc(64) = %p\n", vmalloc(64));
-	pr_info("vmalloc(64) = %p\n", vmalloc(64));
+	pr_info("vmalloc(64) = 0x%px\n", vmalloc(64));
+	pr_info("vmalloc(64) = 0x%px\n", vmalloc(64));
+	pr_info("vmalloc(64) = 0x%px\n", vmalloc(64));
+	pr_info("vmalloc(64) = 0x%px\n", vmalloc(64));
+	pr_info("vmalloc(64) = 0x%px\n", vmalloc(64));
 
 	/*
 	 * Add elements to a list. They should only appear as orphan
@@ -66,7 +66,7 @@ static int kmemleak_test_init(void)
 	 */
 	for (i = 0; i < 10; i++) {
 		elem = kzalloc(sizeof(*elem), GFP_KERNEL);
-		pr_info("kzalloc(sizeof(*elem)) = %p\n", elem);
+		pr_info("kzalloc(sizeof(*elem)) = 0x%px\n", elem);
 		if (!elem)
 			return -ENOMEM;
 		INIT_LIST_HEAD(&elem->list);
@@ -75,11 +75,11 @@ static int kmemleak_test_init(void)
 
 	for_each_possible_cpu(i) {
 		per_cpu(kmemleak_test_pointer, i) = kmalloc(129, GFP_KERNEL);
-		pr_info("kmalloc(129) = %p\n",
+		pr_info("kmalloc(129) = 0x%px\n",
 			per_cpu(kmemleak_test_pointer, i));
 	}
 
-	pr_info("__alloc_percpu(64, 4) = %p\n", __alloc_percpu(64, 4));
+	pr_info("__alloc_percpu(64, 4) = 0x%px\n", __alloc_percpu(64, 4));
 
 	return 0;
 }
