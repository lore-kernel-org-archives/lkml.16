Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E951DE3B1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921481; cv=none; b=QXaFPcmZN3Euh5GSHq2Qwd0P0oIRPh76XznC2kh6A71HOCwFceJwFoqnsvm9aSvxP/T12xMlP6ucUpbU8XzcOKIeJrSgqkJBMvT5EMAHpSACeOsyQ70X9l1N2Lf8YZx3+MJn5u/4f3guRpHvNvXrkSuYmkSLLggGiUXnnx4wELc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921481; c=relaxed/simple;
	bh=sS5JxqZg5kTZup42wGhqtzc0oextva1bVrjA5BrW9Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzh5wmPvnAiml+fSr9NlOKJeMg9+kWEOpf5ONyjgxAGNhE0ghFX9jDTAbhMqtZ8f12aCYKKQH4v0hrvbK9EQI8NublNz1zCIkotNhdgNpA6HthVsMzswOPXL5JCnQw2G2K7RiTFaKEvixa9g3qlp9M0jqzNqZr5HnBBP5K4Nfq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=F53DoYrb; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="F53DoYrb"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921470; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fDtKOoTlfOTw82XR7J+JbdVd7+T6vjeWrc6ajVUoZGA=;
	b=F53DoYrbzEM6WJ2hvRHp/AOUl/w/O8pWeuDEk8PwJ0jjQpu4lStOevA8KL2oAydD4iucUzihkioQ28ngjf0zqKJeKr2Jf3OkGwXjMIrLeLR2qfpX+S/O9WnNWpOiqqc/LXW5GQqN08LEd+9v/b9JJJk717dKQcHxGINPlzGDkdE=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz4ojg_1738921469 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:29 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] mm: shmem: remove 'fadvise()' comments
Date: Fri,  7 Feb 2025 17:44:18 +0800
Message-Id: <fae702b9775f58b55b45be5eaad22d8586d0290a.1738918357.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
References: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to commit 255ff62d1586 ("docs: tmpfs: drop 'fadvise()' from the
documentation"), fadvise() has no HUGEPAGE advise currently. Remove
the confusing fadvise() comments.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index ddf800357e7a..b7aef4f0a427 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -525,9 +525,9 @@ static bool shmem_confirm_swap(struct address_space *mapping,
  *	enables huge pages for the mount;
  * SHMEM_HUGE_WITHIN_SIZE:
  *	only allocate huge pages if the page will be fully within i_size,
- *	also respect fadvise()/madvise() hints;
+ *	also respect madvise() hints;
  * SHMEM_HUGE_ADVISE:
- *	only allocate huge pages if requested with fadvise()/madvise();
+ *	only allocate huge pages if requested with madvise();
  */
 
 #define SHMEM_HUGE_NEVER	0
-- 
2.39.3

