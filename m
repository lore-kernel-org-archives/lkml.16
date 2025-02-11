Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6914D433BE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739255530; cv=none; b=AabuN5zBAREMjJm47KlzfOhYYX/YQStf/hbLB6mSwzWx1pnmAeXUdrt6sJnpLI+6ZqCdkVPJPLm8TU1GPDtoecQqXjMZEFgVcGePO6cpErV3PYBBu+9/5geHCQ95kFZgyO+xJgqpMgzHnzEozk5W1mi/WbwSQCtIHVjauqPu54o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739255530; c=relaxed/simple;
	bh=jf2t+9h6qec9RLmajAa53yPZiZPc9KBBRZ5a/b1UHAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jCBja3HxghQkEGqG4l8ZoR/a87GvAsC37ziAylfomxdAAizxz+elQnqHmUkLQo0eRRJABXxGsULulIuwEsmkuBEEZ6eaC0jWSfQRwOetOo2JGGNjP+i/3FjD52GPOU6GhHppSbyW1av1npjEnZ0e8oGcqHS0t5SIqZ1yfuZQ9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZKW9spiD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZKW9spiD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A90DC4CEDD;
	Tue, 11 Feb 2025 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739255530;
	bh=jf2t+9h6qec9RLmajAa53yPZiZPc9KBBRZ5a/b1UHAE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZKW9spiD5zdEDRsTGijztXIljRwnw1V8SaV6Lpeal8XYN6ixRr5AkZUt55pDmiFq9
	 q9hEOkDvaSAmICAwBbSraHE99piICtB6QG3unsgw8hJK+O2hA/1RAv1BD4wVL981UC
	 o0c1q3/Ej/1vEFo8JB2KHbpiez8qlwBa/XBN/yOuSLCVeb60JeMCl4Me0TY9IWE73o
	 GPtjZnnDQNd9769r69ge/S0tQsd9VZnq385/BkU0c75L7BJwcPF4SDpf+oEZG0MFcl
	 /nZIT0f5yRrCjANQfI+g29xguzU+ynIFO3sPXbBufkgKVImb9XNW5osQ7uCWe3+1RQ
	 qIUqusaPlhk7g==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	"Lai, Yi" <yi1.lai@linux.intel.com>
Subject: [PATCH mm-unstable] mm/madvise: handle MADV_{HWPOISON,SOFT_OFFLINE} from madvise_unlock()
Date: Mon, 10 Feb 2025 22:32:01 -0800
Message-Id: <20250211063201.5106-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

madvise_lock() does nothing for MADV_HWPOSION and MADV_SOFT_OFFLINE
behavior, but madvise_unlock() does mmap_lock unlocking regardless of
the behavior.  Commit 948a0a9ea070 ("mm/madvise: split out mmap locking
operations for madvise()") in mm-unstable, which introduced the wrong
function didn't cause a real problem because do_madvise() was not
calling madvise_unlock() for the behavior.

Later, commit f19c9d7b57cf ("mm/madvise: split out madvise() behavior
execution") in mm-unstable made do_madvise() to call madvise_unlock()
even for the two behaviors.  As a result, the kernel tries to unlock
unlocked mmap_lock.

Fix the issue by handling the two behaviors in madvise_unlock().  For
the two behaviors, do nothing but just return.  Also remove an
unnecessary blank line in madvise_lock().

Technically speaking this patch fixes commit f19c9d7b57cf ("mm/madvise:
split out madvise() behavior execution").  But since the broken commit
is not in the mainline yet, squashing this fix into commit 948a0a9ea070
("mm/madvise: split out mmap locking operations for madvise()") would
make more sense, so adding Fixes: tag with it.

Fixes: 948a0a9ea070 ("mm/madvise: split out mmap locking operations for madvise()") # mm-unstable
Reported-by: "Lai, Yi" <yi1.lai@linux.intel.com>
Closes: https://lore.kernel.org/Z6rgiVp7221r4JZ5@ly-workstation
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index b5ef8e03d8b0..b8969457f3ef 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1577,7 +1577,6 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 
 static int madvise_lock(struct mm_struct *mm, int behavior)
 {
-
 #ifdef CONFIG_MEMORY_FAILURE
 	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
 		return 0;
@@ -1595,6 +1594,11 @@ static int madvise_lock(struct mm_struct *mm, int behavior)
 
 static void madvise_unlock(struct mm_struct *mm, int behavior)
 {
+#ifdef CONFIG_MEMORY_FAILURE
+	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
+		return;
+#endif
+
 	if (madvise_need_mmap_write(behavior))
 		mmap_write_unlock(mm);
 	else

base-commit: 8bf30f9d23eb5040d37e6e712789cee8e71e1577
-- 
2.39.5
