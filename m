Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457527FD4F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709166; cv=none; b=pW4YMiQ2n+0fTlTuF9vtBc18nuOfIqE1DjbOkNjbFdG6UIDC5ZYx3fJE9tWk1BiAOmUPH2I/iYKsGsF+j6LNhtpZkZgz/s4hQvk172ZXvte5LUbr0HRjzm+jhM5cBt9I5WZ5B5gsdv0/AJC8GnwOOborWwq3f03Qi5rQNW0rnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709166; c=relaxed/simple;
	bh=fVclga1UkUu0hcY/uvkolrpHb4FqJilGqPDl9WnSj40=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YOYj5jM/DYB8ZM1IiU0Fu7vomI9f6lKR9reA5ISc1RogzE22SAEmdD5/NNF3cmNUz/IUpTRKgEndvodI+sPTi0yM9XdifINk91LEKkig+PMCnvHwFgrSEV9Ul1MD3EnMNAiAAeuRjrJ4oZO904uw8i7M6XDs+ZJGF5uMdQP1mT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IOn1n8dh; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IOn1n8dh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744709160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t8GWBbvNAyASsGHRjRlleeuP7nCk/V15qdS4Y4WVO48=;
	b=IOn1n8dh8IjO6+zB1Tq4ua6g5Rc/EobI3F3VjW9p8vVrgEqn8xQA0Ng7wWQus07haFpvKl
	I7WOOVnAngwNpRKkwFX7DtNLgtDw4LC8/eBzspERzumwoJVaEfqWO7qs2sUeexmgzm5PlZ
	oQZoDIvwLbO/PCow5Qg99DTiTuDku2E=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH] mm/rmap: Move anon_vma initialization to anon_vma_ctor()
Date: Tue, 15 Apr 2025 17:25:48 +0800
Message-Id: <20250415092548.271718-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Currently, some initialization of anon_vma is performed in
anon_vma_alloc(). Move the initialization to anon_vma_ctor()
so that all object setup is handled in one place.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/rmap.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 67bb273dfb80..9802b1c27e4b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -89,22 +89,7 @@ static struct kmem_cache *anon_vma_chain_cachep;
 
 static inline struct anon_vma *anon_vma_alloc(void)
 {
-	struct anon_vma *anon_vma;
-
-	anon_vma = kmem_cache_alloc(anon_vma_cachep, GFP_KERNEL);
-	if (anon_vma) {
-		atomic_set(&anon_vma->refcount, 1);
-		anon_vma->num_children = 0;
-		anon_vma->num_active_vmas = 0;
-		anon_vma->parent = anon_vma;
-		/*
-		 * Initialise the anon_vma root to point to itself. If called
-		 * from fork, the root will be reset to the parents anon_vma.
-		 */
-		anon_vma->root = anon_vma;
-	}
-
-	return anon_vma;
+	return kmem_cache_alloc(anon_vma_cachep, GFP_KERNEL);
 }
 
 static inline void anon_vma_free(struct anon_vma *anon_vma)
@@ -453,8 +438,16 @@ static void anon_vma_ctor(void *data)
 	struct anon_vma *anon_vma = data;
 
 	init_rwsem(&anon_vma->rwsem);
-	atomic_set(&anon_vma->refcount, 0);
+	atomic_set(&anon_vma->refcount, 1);
 	anon_vma->rb_root = RB_ROOT_CACHED;
+	anon_vma->num_children = 0;
+	anon_vma->num_active_vmas = 0;
+	anon_vma->parent = anon_vma;
+	/*
+	 * Initialise the anon_vma root to point to itself. If called
+	 * from fork, the root will be reset to the parents anon_vma.
+	 */
+	anon_vma->root = anon_vma;
 }
 
 void __init anon_vma_init(void)
-- 
2.25.1

