Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621171A2381
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921479; cv=none; b=INB7qECrUlpAXOw/j7UoANuu3O+wIl1YtYpkGp+mnuEWudrextRPnGRnHD/0jGhYKwphQnMqBhRsQQmHiRGbu3mgXM3XkeDvaVSlK19k4RPloUaRg3fsZiAac32JpOSrsdKMY+uvHa7TBT1CxBUmbrYdSf3vwKf9jIUvbtmoopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921479; c=relaxed/simple;
	bh=Bn8cN8EuTTOa2Tul9uX/XQvuP9MbPwyRlKDWxAAAmRU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H18t+zIFyhrIy9IgZrzuuTiw6bc1XaSA8fTz4smQvaMtDQylPIMUIiv0nQaXjNb7mS8Kaldi5av+Gt+ewl/E1OeJn6MAgW0T1lIVE8CMkZ0mxlhjR/0rH7drfhUwQX8RwGiQnkMM7D3fMc4OhyOYobs/hcmNS0n1oumCAGtxrQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bGM4ZQm2; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bGM4ZQm2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921471; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=kcZEGoLAZWYmpxFrSA4KxILcMvDpALoGBVXuA8rwiuA=;
	b=bGM4ZQm2T+6qFM4Vh9dklNqjJSxaxY3ErMKtdiuA1RrVrwrHRCAbH3WWsEj9KPRxYhtgtvo5aHRF1CxOTIcKmbOBqP5+32o2Ldbxlr8c/Uyfg/Rg7hOLR7xGdUGQVGbp872N2aBMo+OF37uxq+QoxAoz/wySKKrvoMVDh92b0YM=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz4okK_1738921470 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:30 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] mm: shmem: change the return value of shmem_find_swap_entries()
Date: Fri,  7 Feb 2025 17:44:20 +0800
Message-Id: <070489b5946b8379b2a2d25f78115cef167cd145.1738918357.git.baolin.wang@linux.alibaba.com>
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

The shmem_find_swap_entries() originally returned the index corresponding to
the swap entry, but no callers used this return value. It should return the
number of entries that were found like other functions, which can be used by
the callers.

No functional changes.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index b764ad336598..c243d814f2b0 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1379,9 +1379,9 @@ static void shmem_evict_inode(struct inode *inode)
 #endif
 }
 
-static int shmem_find_swap_entries(struct address_space *mapping,
-				   pgoff_t start, struct folio_batch *fbatch,
-				   pgoff_t *indices, unsigned int type)
+static unsigned int shmem_find_swap_entries(struct address_space *mapping,
+				pgoff_t start, struct folio_batch *fbatch,
+				pgoff_t *indices, unsigned int type)
 {
 	XA_STATE(xas, &mapping->i_pages, start);
 	struct folio *folio;
@@ -1414,7 +1414,7 @@ static int shmem_find_swap_entries(struct address_space *mapping,
 	}
 	rcu_read_unlock();
 
-	return xas.xa_index;
+	return folio_batch_count(fbatch);
 }
 
 /*
@@ -1461,8 +1461,8 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
 
 	do {
 		folio_batch_init(&fbatch);
-		shmem_find_swap_entries(mapping, start, &fbatch, indices, type);
-		if (folio_batch_count(&fbatch) == 0) {
+		if (!shmem_find_swap_entries(mapping, start, &fbatch,
+					     indices, type)) {
 			ret = 0;
 			break;
 		}
-- 
2.39.3

