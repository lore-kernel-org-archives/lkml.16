Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B49EC2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738907560; cv=none; b=nMnDFJjhNAVRU+FKMzxGd0lTR/XtyPnyQV4aYtu+6Rt7nqPwXIb0zFSs7zNZTz8WrHYZTpMKJAmaMwiH3md6ah2Cya/3VeeSYx+5PU/QKdnSLcUYgcxlBtjXk4ayTylVfbRr5woRbgwEIX/QCtSeF6RPJkazdf2wlbkJWc3aKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738907560; c=relaxed/simple;
	bh=6DQNrIw4w3ywgrjiJSjzpYpLLZOHqDkJSh6Fv15YLz0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HNBv6WJ2Mw7r6WP9pcl8gRQ3YYnk4r7hP8/zOcuAGnf69X/d6GKIFiHlbbRniKo3DmY6dSQ8JrDpxkiaXF3OXt+HRF6hIFY4/2fC7eGsZXjz1oTrJE974mMtUGw63Yv0iSubQnzIYPhWK/U9UYHveUTo8E9VYKLU1oVMyxTYotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b36571aae51711efa216b1d71e6e1362-20250207
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED, SA_EXISTED
	SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
	CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU
	ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:74c514ec-f930-42d1-9698-931be2707538,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:74c514ec-f930-42d1-9698-931be2707538,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:d10b1296668f78fa636306332eb2729a,BulkI
	D:250207135223AZFL31D4,BulkQuantity:0,Recheck:0,SF:17|19|24|44|66|78|102,T
	C:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
	nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-UUID: b36571aae51711efa216b1d71e6e1362-20250207
X-User: liuye@kylinos.cn
Received: from localhost.localdomain [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <liuye@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 940186289; Fri, 07 Feb 2025 13:52:22 +0800
From: Liu Ye <liuye@kylinos.cn>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liu Ye <liuye@kylinos.cn>
Subject: [PATCH] mm/mempool: Use kmalloc_array_node to replace kmalloc_array
Date: Fri,  7 Feb 2025 13:52:13 +0800
Message-Id: <20250207055213.141890-1-liuye@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc_array call could be replaced with kmalloc_array_node
to allocate memory on a specific NUMA node.

Signed-off-by: Liu Ye <liuye@kylinos.cn>
---
 mm/mempool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mempool.c b/mm/mempool.c
index 3223337135d0..51eabcc87177 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -328,8 +328,8 @@ int mempool_resize(mempool_t *pool, int new_min_nr)
 	spin_unlock_irqrestore(&pool->lock, flags);
 
 	/* Grow the pool */
-	new_elements = kmalloc_array(new_min_nr, sizeof(*new_elements),
-				     GFP_KERNEL);
+	new_elements = kmalloc_array_node(new_min_nr, sizeof(*new_elements),
+				     GFP_KERNEL, NUMA_NO_NODE);
 	if (!new_elements)
 		return -ENOMEM;
 
-- 
2.25.1

