Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED36224B04
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822524; cv=none; b=ITL9nRHKZ7auf4xAApAJgghyFc2yhISUWktIw/DAF2JRs2IM/ujdll5JEaeCM3fEKCy8CikNbwistWgXBjx35oYnYGKYM1ZPvG83snahVQbFfKc7RMDanvB4+NBMxjQ/YxDzwANsDI10rYA+Ma2KbEUjvu2k55TrYjeXdYT6AJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822524; c=relaxed/simple;
	bh=mfBMQDGwCijsuSEaM5RCGlWQCxDRxNtkNxhQORCqX0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ECys4QKAwbePByAcUfhiBTg5oLK0XTrsriP5EP1AifhpfrYgQyd34HuQEOIM0I+uviXslqmlb95Hp0HFbp7Z9lVtSA+gW6z7jqLQ1Q5NEHesS0Zj9OXenr0ZHam6/GdrE5/ahXzle8ALKyMGB1Bqb6VOJgKFMWesHJvWwvwlNOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1xkWOmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1xkWOmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACD7C4CEE5;
	Thu,  6 Feb 2025 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738822523;
	bh=mfBMQDGwCijsuSEaM5RCGlWQCxDRxNtkNxhQORCqX0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E1xkWOmctRFfUviRHAuoF/YWqqtLhCLSeVJMBCIZ5GOfqX1Em3z6RE1AsxPdoFvDD
	 DcmtmDzLgBMTvvl9UJA+Jpmt30YKmA5ghNeJS2A6DqzlEe5dDoE7SVFsK1znh2SXXT
	 m8kJckllh6o8rTjHTiWiWPNXY3TwvPqqeRkdlvE+X0eUk1rxbmFdJZ0d7CXqty/uXB
	 5vk5WFGbcI9uK2h/3oAZu064VNDhZGcd6TYV76rphB8u6smNhIJBi6Npo6PCYlWj02
	 1vcsPrkLrYI7Gp5UPuIGgBGedOPuWnhC4dxe6EWSGe+Gxxj6S3PhBWLyYVz4sV36CU
	 2vGrcVjrwY5IA==
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
Subject: [PATCH 2/4] mm/madvise: split out madvise input validity check
Date: Wed,  5 Feb 2025 22:15:15 -0800
Message-Id: <20250206061517.2958-3-sj@kernel.org>
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

Split out the madvise parameters validation logic from do_madvise(), for
easy reuse of the logic from a future change.

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index df5a87a1846a..efab2878be7c 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1594,6 +1594,27 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
 		mmap_read_unlock(mm);
 }
 
+static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
+{
+	size_t len;
+
+	if (!madvise_behavior_valid(behavior))
+		return false;
+
+	if (!PAGE_ALIGNED(start))
+		return false;
+	len = PAGE_ALIGN(len_in);
+
+	/* Check to see whether len was rounded up from small -ve to zero */
+	if (len_in && !len)
+		return false;
+
+	if (start + len < start)
+		return false;
+
+	return true;
+}
+
 /*
  * The madvise(2) system call.
  *
@@ -1673,20 +1694,11 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
 	size_t len;
 	struct blk_plug plug;
 
-	if (!madvise_behavior_valid(behavior))
+	if (!is_valid_madvise(start, len_in, behavior))
 		return -EINVAL;
 
-	if (!PAGE_ALIGNED(start))
-		return -EINVAL;
 	len = PAGE_ALIGN(len_in);
-
-	/* Check to see whether len was rounded up from small -ve to zero */
-	if (len_in && !len)
-		return -EINVAL;
-
 	end = start + len;
-	if (end < start)
-		return -EINVAL;
 
 	if (end == start)
 		return 0;
-- 
2.39.5
