Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467A295524
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303979; cv=none; b=U+RzNhNclcN7ketE3j7gonsjri8oPGO30RO93xkdsvCgfzHt6He0uYu8W3b3bUyq1frEYfDI9Rev/vd1kd6t+p0W57VXpjZwk3KfpCncIuwNa7sNLq17fcVovZucJU7PR63dr+dsomI88DRwh7179uEYwwxFRi2pIf81uwHgD7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303979; c=relaxed/simple;
	bh=Z69WvqnqSuA76TfLex7V7kusjB/URZZSkAXwG8zMnbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cv/1oBwNGIL6LPKx3RzfVwS1pXIbFEcnKcB69x4Kl5JUq3+zKSXEN/doimXw8yHzpoyJQqUyCzzge4Ha0IMy7+UQLFp1he3TzbvThdp9GenLpDpISSbMMCEpl2aOyGJ2NQrroYTxAPR1gSbwsIojgfAGhirPkgwujSzGvUx90Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sfa9lqFa; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sfa9lqFa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751303974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZmI8nMByS0MXzzMaQIPrJcZVorXLee3dlktB3PSrEP0=;
	b=sfa9lqFaUMBM9emwrwz94QaLMN2gwynIpjJeVKl1ifv658ZJtuZZFR77Yh6RUGlEHJ4+O3
	C062OZVr6uEAWFgKmub7e69Ey7ZuN3SMDfZOn2ylJ+x2r7PqWBExdehfp0H1mf63cDici0
	vgyi2rCtTWFDOc4w1Y8Gm9+el0vu4V8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
Date: Mon, 30 Jun 2025 19:18:26 +0200
Message-ID: <20250630171826.114008-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use the string choice helper function str_plural() to simplify the code
and to fix the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

  opportunity for str_plural(nrinvalid)

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 mm/hugetlb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 9dc95eac558c..08abe7395f2f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -25,6 +25,7 @@
 #include <linux/mmdebug.h>
 #include <linux/sched/signal.h>
 #include <linux/rmap.h>
+#include <linux/string_choices.h>
 #include <linux/string_helpers.h>
 #include <linux/swap.h>
 #include <linux/swapops.h>
@@ -3724,7 +3725,7 @@ static void __init report_hugepages(void)
 			buf, h->nr_huge_pages);
 		if (nrinvalid)
 			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
-					buf, nrinvalid, nrinvalid > 1 ? "s" : "");
+					buf, nrinvalid, str_plural(nrinvalid));
 		pr_info("HugeTLB: %d KiB vmemmap can be freed for a %s page\n",
 			hugetlb_vmemmap_optimizable_size(h) / SZ_1K, buf);
 	}
-- 
2.50.0

