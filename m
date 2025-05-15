Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643E1FF7CD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310379; cv=none; b=Esr+sXnUllTFOsWOeNnFROA9HEouW80xeivZGChQJpHUq3dZFWGiZqr4X5FSYCFb9gPO+j7m4tyVBbDxmQqsAEgGUJNSaQWWMxsB388TEWvyyidLKcmHyky5pshLVGV/XSAdR6AJc5yeAVnm31mRSp/cIQQ27nlxv7MpsLWgZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310379; c=relaxed/simple;
	bh=W5tQpGezyACQ07x3k8e9Qln0LgPn+x2pDoFNSogLARM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mv8533QlBUu1Ne3MCt69ugh1RKVJzKc1BYgkBSzvIbluIAEypm+4fsWZEiELT3066WOazlJf4/pPMIDvFDgSqfYdTEOOr1No7MKqtcEuTmms78jmmkjQSh+wPJdMENHydW+QHKZxyN4FZ2hyJ5zlN06EZBNvJ1auEtNl8fnRw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: Wenjie Xu <xuwenjie04@baidu.com>
To: <muchun.song@linux.dev>, <osalvador@suse.de>, <akpm@linux-foundation.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Wenjie Xu
	<xuwenjie04@baidu.com>, Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] hugetlb: Show nr_huge_pages in report_hugepages()
Date: Thu, 15 May 2025 19:42:31 +0800
Message-ID: <20250515114231.65824-1-xuwenjie04@baidu.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) To
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex12_2025-05-15 19:42:40:672
X-FEAS-Client-IP: 10.127.64.35
X-FE-Policy-ID: 52:10:53:SYSTEM

The number of pre-allocated huge pages should be nr_huge_pages, not
free_huge_pages, although they are same during booting stage

Signed-off-by: Wenjie Xu <xuwenjie04@baidu.com>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6ea1be71aa42..2a4d4551749a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3740,7 +3740,7 @@ static void __init report_hugepages(void)
 
 		string_get_size(huge_page_size(h), 1, STRING_UNITS_2, buf, 32);
 		pr_info("HugeTLB: registered %s page size, pre-allocated %ld pages\n",
-			buf, h->free_huge_pages);
+			buf, h->nr_huge_pages);
 		if (nrinvalid)
 			pr_info("HugeTLB: %s page size: %lu invalid page%s discarded\n",
 					buf, nrinvalid, nrinvalid > 1 ? "s" : "");
-- 
2.41.0

