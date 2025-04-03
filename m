Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340318D65F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743662965; cv=none; b=h86/lPre8RBIQueGyej4CugGfynzC/oBSMBjPHSk2zQpihkFhLgdKH19ft4klNet3kz8jr/OF2OWd7s6CVdSQLXmqWEYK70dSZCBwpBzusVUSPWGL96iV0SkE+mIGQRYXu4860dnk6xgqgy07ixr23PwgNi8bJkNtRlTAIgnQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743662965; c=relaxed/simple;
	bh=mS3Euhg9zY19dCAeMuhQZ68GEfViYG7NSsFNIxWcT6o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uK1BqxQnVd9+NByg1Jj9EURgsg1c2uOgUwJorgKWTpA0cNHzYwSjAzHpiRHII69UxtzQhCfkZfqIceNjPg2WgmWolPXW5vy1gdmJ/EKe11BEDTOBQXnH+Xn0aqVXGJt/TXTscDI5zCjVHFWMdi/yDYkAqQ8K5EvuGi6BHki8A5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZSsgL5kqczvWpF;
	Thu,  3 Apr 2025 14:45:18 +0800 (CST)
Received: from kwepemg200013.china.huawei.com (unknown [7.202.181.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 10B06180087;
	Thu,  3 Apr 2025 14:49:19 +0800 (CST)
Received: from huawei.com (10.175.113.32) by kwepemg200013.china.huawei.com
 (7.202.181.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 3 Apr
 2025 14:49:18 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Andrew Morton <akpm@linux-foundation.org>, Muchun Song
	<muchun.song@linux.dev>, Kefeng Wang <wangkefeng.wang@huawei.com>, David
 Hildenbrand <david@redhat.com>, Nanyong Sun <sunnanyong@huawei.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Liu Shixin
	<liushixin2@huawei.com>
Subject: [PATCH] mm/hugetlb: fix nid mismatch in alloc_surplus_hugetlb_folio()
Date: Thu, 3 Apr 2025 14:41:38 +0800
Message-ID: <20250403064138.2867929-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200013.china.huawei.com (7.202.181.64)

It's wrong to use nid directly since the nid may be changed in allocation.
Use folio_nid() to obtain the nid of folio instead.

Fix: 2273dea6b1e1 ("mm/hugetlb: update nr_huge_pages and surplus_huge_pages together")
Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 mm/hugetlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6fccfe6d046c6..d538f8aa8203c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2271,7 +2271,7 @@ static struct folio *alloc_surplus_hugetlb_folio(struct hstate *h,
 	 * as surplus_pages, otherwise it might confuse
 	 * persistent_huge_pages() momentarily.
 	 */
-	__prep_account_new_huge_page(h, nid);
+	__prep_account_new_huge_page(h, folio_nid(folio));
 
 	/*
 	 * We could have raced with the pool size change.
-- 
2.34.1

