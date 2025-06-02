Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478DA523A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748886580; cv=none; b=aCytWGoxomIBpAo9cqLZEltE+mzkz0ZZ04HvbSGrhwP1lLgnx+0Jf1o6x2TXMvMvANxEY8oztw7GOAEGZkI7dVKjmJkZIrYa3jZpdZFJzFKF4Mcro1LqYPF6du9NbdsNe50ViSZYYHM7CaREAMqwtlU1yaoouvLn9cRm5pjCv8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748886580; c=relaxed/simple;
	bh=0pF7W5nDodLyDaDRsawbxvt9O7kgIx1eeXo1DFqCyWw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZckRvLI6rm9EI8WLvjfYMYpMlTvOmHmledmngECz7cL0mWNIonueuDFBUYGP5pGR5UJoKsMYWzfNWt6GhnhoMXuO3uRD9DUkR4HxoWYio0upDOL7ZDSqJoTqv1Flpczj7v33vRd+Y0X4NJdaffNBVbcxEFvYSZgIFGrZFxnTaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ui9wChQJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ui9wChQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8255AC4CEEB;
	Mon,  2 Jun 2025 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748886579;
	bh=0pF7W5nDodLyDaDRsawbxvt9O7kgIx1eeXo1DFqCyWw=;
	h=From:To:Cc:Subject:Date:From;
	b=ui9wChQJsuGhH1mAQl2/0sJ87jasohaoM3541r34h0y3sGT6Bq9AvdgZ0MokOFlwS
	 p6+gy+N6pIS2pisd96br6uqEzvbdPSPB6XnOQp9nlIrNLDJvP7ZpT4hAm1Z4+pF//T
	 MC2KxfbvantAj+GeAn+IEU6N4Z9lIzSxQ7HdZpvPHLDTydDImWNMHYi4EJJ2Q5jb2l
	 0G1baoaCPCfmdKY0mm3dwfs5lPHD1MJHeUNVCgeQmZPm4XrsGi9VOYpMLHp0DplhN8
	 1i8LLUAlg8ba6kKs4nubmx1tXPn/Tm2Y9uQSXTdfNz5Nn1br5sKRZD4p9a0pcHKiqk
	 FQrWGFgBq3r2A==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Jann Horn <jannh@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@kernel.org,
	Barry Song <21cnbao@gmail.com>
Subject: [PATCH] mm/madvise: handle madvise_lock() failure during race unwinding
Date: Mon,  2 Jun 2025 10:49:26 -0700
Message-Id: <20250602174926.1074-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
madvise_lock() failure is ignored.  Check the failure and abort
remaining works in the case.

Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations from process_madvise()")
Cc: stable@kernel.org
Reported-by: Barry Song <21cnbao@gmail.com>
Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 mm/madvise.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 8433ac9b27e0..5f7a66a1617e 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1881,7 +1881,9 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 			/* Drop and reacquire lock to unwind race. */
 			madvise_finish_tlb(&madv_behavior);
 			madvise_unlock(mm, behavior);
-			madvise_lock(mm, behavior);
+			ret = madvise_lock(mm, behavior);
+			if (ret)
+				goto out;
 			madvise_init_tlb(&madv_behavior, mm);
 			continue;
 		}
@@ -1892,6 +1894,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
 	madvise_finish_tlb(&madv_behavior);
 	madvise_unlock(mm, behavior);
 
+out:
 	ret = (total_len - iov_iter_count(iter)) ? : ret;
 
 	return ret;

base-commit: d85ea9175e4147e15ff6e3c0e02c6c447ef473c8
-- 
2.39.5
