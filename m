Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A401F2253EB
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822526; cv=none; b=oAWkh7PFvyJP3RJ5hLzxketvjuSnChwwT8YdPTDi9xiRQBcQi6Kp4bFgx81eg9XV0MRYwHM+jlsr2Xo0Dc11V862rDPqsUH1ldO77ockxmmkgahh3TLXza4iL4obWmlIkCQPGx20RgCN96lOAWdB6RPdL9glFmZ1M1obrW+dX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822526; c=relaxed/simple;
	bh=MP/17pf09yAFjnq6HfK1rSNsdKEXlrcNK/A1rjmLh9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XFmwz9ImJdGaWghZqV/31fkrtmYZoHqHmE06CqRBRzq6l9jKTs6vuOE9qLnKW2muhBPWo6IJicCKd0VYIMXHPkQWVgkch3PQn5q12+O0iUvPZKISAW6GePSMijrwnyydsMa27QGM465306WgbE3sV0rhHaQaoOeJQ6Xgj/RjqUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeS+zBDr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeS+zBDr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5517C4CEE7;
	Thu,  6 Feb 2025 06:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738822526;
	bh=MP/17pf09yAFjnq6HfK1rSNsdKEXlrcNK/A1rjmLh9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AeS+zBDrcocIE5whSD/5gWTiHktVgl4p1z2AIiKeTcCh7xmQYLD+OXL/RaZfFtNcu
	 hV1sCJcNigWgqPbttaPV4aOO1TIGzB6zT9MtTB+m3BwqfA2+u4O+xc8GLeo8W9DGds
	 x/93/07bnlYUuqh3x8jnyxl6WwwrXLZigIC2mljeqwpA2HmsX3TgbDO+Cm91Gdq4C+
	 cBU/LRxPoRAAuv426uEieDoORu6nhMXi7jb0qNlNssLt7jWZwV6J4rVPBQ5G9ittRh
	 Sb1TCC8ZuELFpKY3xHwi1CO6RGRYiv1weim8TPZB9h22iVgvfa+V83ScIn6iNEVS0V
	 URqSXH8iKa+hg==
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
Subject: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Wed,  5 Feb 2025 22:15:17 -0800
Message-Id: <20250206061517.2958-5-sj@kernel.org>
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

Optimize redundant mmap lock operations from process_madvise() by
directly doing the mmap locking first, and then the remaining works for
all ranges in the loop.

Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 31e5df75b926..5a0a1fc99d27 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1754,9 +1754,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 
 	total_len = iov_iter_count(iter);
 
+	ret = madvise_lock(mm, behavior);
+	if (ret)
+		return ret;
+
 	while (iov_iter_count(iter)) {
-		ret = do_madvise(mm, (unsigned long)iter_iov_addr(iter),
-				 iter_iov_len(iter), behavior);
+		unsigned long start = (unsigned long)iter_iov_addr(iter);
+		size_t len_in = iter_iov_len(iter);
+		size_t len;
+
+		if (!is_valid_madvise(start, len_in, behavior)) {
+			ret = -EINVAL;
+			break;
+		}
+
+		len = PAGE_ALIGN(len_in);
+		if (start + len == start)
+			ret = 0;
+		else
+			ret = madvise_do_behavior(mm, start, len_in, len,
+					behavior);
 		/*
 		 * An madvise operation is attempting to restart the syscall,
 		 * but we cannot proceed as it would not be correct to repeat
@@ -1772,12 +1789,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 				ret = -EINTR;
 				break;
 			}
+
+			/* Drop and reacquire lock to unwind race. */
+			madvise_unlock(mm, behavior);
+			madvise_lock(mm, behavior);
 			continue;
 		}
 		if (ret < 0)
 			break;
 		iov_iter_advance(iter, iter_iov_len(iter));
 	}
+	madvise_unlock(mm, behavior);
 
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
 
-- 
2.39.5
