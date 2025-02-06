Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B142248AE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822522; cv=none; b=Cyc/RtBHnBcle2JkqTjwNoLxvZuOUtqjmbmGeqZU3TaoE2mKlfqPW1UTxgKQ9e/x4GJ9A2UmO3DNxxW+lwal1vp8Ry9A5oA4wCqSrlXakiCRggGMohwAVTtPBqR53R0a4PafRYgL0DW5UvJlgQiBuQLQ19lf2R1ojfr28e6m7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822522; c=relaxed/simple;
	bh=v9imdnw1laUwcaZ0L7TzqeKruhJu/RKKPxXcWFCWS6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yg0HNopH97dEGAgkgZ+gyIWMm+pMLtiq5X/MzOhzwzFEqEtixvR2Y3Uv63x+HCVwkgMGLOEDXPjfrYRPMtAl4DjeqOzFNwFs3G/R6H6U9vNqDZB8lEWtMk0bo0RVKj3AuHi0e6zY5IAoxLl/7CDEMuG4KKprj2h21KmqTZa/lS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vuq0xk1G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vuq0xk1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35113C4CEE0;
	Thu,  6 Feb 2025 06:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738822521;
	bh=v9imdnw1laUwcaZ0L7TzqeKruhJu/RKKPxXcWFCWS6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vuq0xk1GFf7K7aLeK5IU/IWvtpIglV8lakjb0V1/ii6zxiXGBD7/syJXUxK25irCD
	 iLncnsB2VIC+lM7KH0pa40jsRpBrHH4xRq4h7UeGVNck+6bFLUiZdQOXJxL7AHwzit
	 mc1qT0ZG4agZsNnCC/uog9DbOayV7qesHAV1FG3A4B2dQ3KscqoMUeDSDkQ9sS4KFV
	 yE7O7Ux7EBw1ZLLvXd1SENfTf1iaH7Fh0wvrfuRYu9h1dozqHbZ3wxkitTWgN52j5v
	 LlNfVrlTyxwSeRZ4IRTNGSt7IEN6bwYhHFuPU1D7a8S3YmM4QSF9FXPB0Clld9tlmh
	 t1ZkiV4Tmwafg==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/4] mm/madvise: split out mmap locking operations for madvise()
Date: Wed,  5 Feb 2025 22:15:14 -0800
Message-Id: <20250206061517.2958-2-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206061517.2958-1-sj@kernel.org>
References: <20250206061517.2958-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split out the madvise behavior-dependent mmap_lock operations from
do_madvise(), for easier reuse of the logic in an upcoming change.

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index c8e28d51978a..df5a87a1846a 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1567,6 +1567,33 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 				 madvise_vma_anon_name);
 }
 #endif /* CONFIG_ANON_VMA_NAME */
+
+static int madvise_lock(struct mm_struct *mm, int behavior)
+{
+
+#ifdef CONFIG_MEMORY_FAILURE
+	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
+		return 0;
+#endif
+
+	if (madvise_need_mmap_write(behavior)) {
+		if (mmap_write_lock_killable(mm))
+			return -EINTR;
+	} else {
+		mmap_read_lock(mm);
+	}
+	return 0;
+
+}
+
+static void madvise_unlock(struct mm_struct *mm, int behavior)
+{
+	if (madvise_need_mmap_write(behavior))
+		mmap_write_unlock(mm);
+	else
+		mmap_read_unlock(mm);
+}
+
 /*
  * The madvise(2) system call.
  *
@@ -1643,7 +1670,6 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 {
 	unsigned long end;
 	int error;
-	int write;
 	size_t len;
 	struct blk_plug plug;
 
@@ -1665,19 +1691,15 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	if (end == start)
 		return 0;
 
+	error = madvise_lock(mm, behavior);
+	if (error)
+		return error;
+
 #ifdef CONFIG_MEMORY_FAILURE
 	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
 		return madvise_inject_error(behavior, start, start + len_in);
 #endif
 
-	write = madvise_need_mmap_write(behavior);
-	if (write) {
-		if (mmap_write_lock_killable(mm))
-			return -EINTR;
-	} else {
-		mmap_read_lock(mm);
-	}
-
 	start = untagged_addr_remote(mm, start);
 	end = start + len;
 
@@ -1694,10 +1716,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	}
 	blk_finish_plug(&plug);
 
-	if (write)
-		mmap_write_unlock(mm);
-	else
-		mmap_read_unlock(mm);
+	madvise_unlock(mm, behavior);
 
 	return error;
 }
-- 
2.39.5
