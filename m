Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98404224B13
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822525; cv=none; b=DLA+SS9NcFDjJ+HQCoOvRybrLuI4LH5Rd+wiTfXIODpxTXNFKixnQlXWK8pS+Z9/clxI98o8vD327iAHiBB/+Ck+EA3R6ZBtr+qz+mBup8MhuMquyMFmtsxEx/fHGifddCaPZtonRbNHUqaX2MLMLvuFR+yS5d4qj8Iq71z5gLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822525; c=relaxed/simple;
	bh=+hjnCmx0FZ2b8X/9Br4bzXPNjaytMayZsysgOyR4ceE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F4qaHgSUWkkajvwCu8zc9gXFmJHzUXBNHfBhgo6K2lSpq2YMeEYsWFaFMyc1e2lDA5LyOM6sBFY7UOhWPezBljxgUFL3UU6y3yjvdwAWrRjKLeEPejwWIJyo+lakHPiHHBqf96jteTR3LPs3aUDU4QLp19C/208gO/p6WmV2N/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/3arlxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/3arlxO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C383CC4CEE5;
	Thu,  6 Feb 2025 06:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738822525;
	bh=+hjnCmx0FZ2b8X/9Br4bzXPNjaytMayZsysgOyR4ceE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K/3arlxOqIDaHiwNUfUWykQ8SDElT+W0dUaWTeLY7i0YEUNiktTduB7k3yK4gEaYf
	 oK6SlGmzF25bAPkjWNd5Pqb4UF2JHmWaQRzVkvQ0HuA4br4Sqxqje2aWCdixuhjB+i
	 KBm6fYYCM1QN2ZH7n4XXqvyITFZXT/aXmhx9oHtmuHlGBgYUqz5WXklyQ0nV1474md
	 OsTGJV6+mPIVG3xq3BifF/4vf6+6hYpkg4mSZVve9pXPTG0zH94YvSTHv0guey0axZ
	 yIM5ieBVsnOCNHth37flLuikLX6fnuHjDaQH10yps+aBuYBdimQCS645z/lHJlsDQT
	 /58KitQjTM5fg==
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
Subject: [PATCH 3/4] mm/madvise: split out madvise() behavior execution
Date: Wed,  5 Feb 2025 22:15:16 -0800
Message-Id: <20250206061517.2958-4-sj@kernel.org>
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

Split out the madvise behavior applying logic from do_madvise() to make
it easier to reuse from the following change.

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 53 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index efab2878be7c..31e5df75b926 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1615,6 +1615,35 @@ static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
 	return true;
 }
 
+static int madvise_do_behavior(struct mm_struct *mm,
+		unsigned long start, size_t len_in, size_t len, int behavior)
+{
+	struct blk_plug plug;
+	unsigned long end;
+	int error;
+
+#ifdef CONFIG_MEMORY_FAILURE
+	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
+		return madvise_inject_error(behavior, start, start + len_in);
+#endif
+	start = untagged_addr_remote(mm, start);
+	end = start + len;
+
+	blk_start_plug(&plug);
+	switch (behavior) {
+	case MADV_POPULATE_READ:
+	case MADV_POPULATE_WRITE:
+		error = madvise_populate(mm, start, end, behavior);
+		break;
+	default:
+		error = madvise_walk_vmas(mm, start, end, behavior,
+					  madvise_vma_behavior);
+		break;
+	}
+	blk_finish_plug(&plug);
+	return error;
+}
+
 /*
  * The madvise(2) system call.
  *
@@ -1692,7 +1721,6 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	unsigned long end;
 	int error;
 	size_t len;
-	struct blk_plug plug;
 
 	if (!is_valid_madvise(start, len_in, behavior))
 		return -EINVAL;
@@ -1706,28 +1734,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	error = madvise_lock(mm, behavior);
 	if (error)
 		return error;
-
-#ifdef CONFIG_MEMORY_FAILURE
-	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
-		return madvise_inject_error(behavior, start, start + len_in);
-#endif
-
-	start = untagged_addr_remote(mm, start);
-	end = start + len;
-
-	blk_start_plug(&plug);
-	switch (behavior) {
-	case MADV_POPULATE_READ:
-	case MADV_POPULATE_WRITE:
-		error = madvise_populate(mm, start, end, behavior);
-		break;
-	default:
-		error = madvise_walk_vmas(mm, start, end, behavior,
-					  madvise_vma_behavior);
-		break;
-	}
-	blk_finish_plug(&plug);
-
+	error = madvise_do_behavior(mm, start, len_in, len, behavior);
 	madvise_unlock(mm, behavior);
 
 	return error;
-- 
2.39.5
