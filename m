Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077D727462
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749007089; cv=none; b=efoBo7gn2HLpgc48DWY9vXzNTyjtDHoaDqRWKOvgfr1IQcteR5zJzVIEtEI15X2TjiUvvEn35z3Z+VtSnvvkYe67W72Ll731x2agfHvox5PbbnKYi36Kn8PVPTD7pslDEabiZl4+tz2FRRhe2M5eAI6TRKVAU8lMws5F5wRduls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749007089; c=relaxed/simple;
	bh=WP+CFvozs823XVsMgLRZyT0bYmUvzG90/HXgiPAIn/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyuxHH0eRKTEWmSf6UZM1sylF76bx9JeEaj0JfEUsVFYNySlU9gRXUjlU0gwBTV86kFQlWlf+kvS9sruEpAmNsf9gMM6QCXITfYwQzkGpQh8neUrTVFeA3XBi9sIgPK9Q92LD74Q2i5QhQBXAsGZVehqS3GjIW9K5BpLha6EbmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 859e940e40f211f0b29709d653e92f7d-20250604
X-CID-CACHE: Type:Local,Time:202506041104+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7c393c9e-0f25-4b82-a4b7-5efc9c34e84d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:bdac3ab60b7254cfaf95c3a7cf35d4d3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 859e940e40f211f0b29709d653e92f7d-20250604
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1682041122; Wed, 04 Jun 2025 11:18:01 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 789D316001CC7;
	Wed,  4 Jun 2025 11:18:01 +0800 (CST)
X-ns-mid: postfix-683FBAE9-333779653
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id EA3D816001A03;
	Wed,  4 Jun 2025 03:18:00 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: akpm@linux-foundation.org,
	xu.xin16@zte.com.cn
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 1/2] mm/ksm: calculate ksm_process_profit more accurately
Date: Wed,  4 Jun 2025 11:17:54 +0800
Message-ID: <20250604031758.4150209-2-xialonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250604031758.4150209-1-xialonglong@kylinos.cn>
References: <20250604031758.4150209-1-xialonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The general_profit_show() only considers ksm_pages_sharing,
whereas ksm_process_profit() accounts for both ksm_pages_sharing
and ksm_pages_shared for each process. This discrepancy leads to
the sum of ksm_process_profit() across all processes not being equal
to general_profit_show().

Fixes: 7609385337a4 ("ksm: count ksm merging pages for each process")
Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
---
 mm/ksm.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8583fb91ef13..fa4e1618b671 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -824,12 +824,10 @@ static void remove_node_from_stable_tree(struct ksm=
_stable_node *stable_node)
 	hlist_for_each_entry(rmap_item, &stable_node->hlist, hlist) {
 		if (rmap_item->hlist.next) {
 			ksm_pages_sharing--;
+			rmap_item->mm->ksm_merging_pages--;
 			trace_ksm_remove_rmap_item(stable_node->kpfn, rmap_item, rmap_item->m=
m);
-		} else {
+		} else
 			ksm_pages_shared--;
-		}
-
-		rmap_item->mm->ksm_merging_pages--;
=20
 		VM_BUG_ON(stable_node->rmap_hlist_len <=3D 0);
 		stable_node->rmap_hlist_len--;
@@ -976,13 +974,12 @@ static void remove_rmap_item_from_tree(struct ksm_r=
map_item *rmap_item)
 		folio_unlock(folio);
 		folio_put(folio);
=20
-		if (!hlist_empty(&stable_node->hlist))
+		if (!hlist_empty(&stable_node->hlist)) {
 			ksm_pages_sharing--;
-		else
+			rmap_item->mm->ksm_merging_pages--;
+		} else
 			ksm_pages_shared--;
=20
-		rmap_item->mm->ksm_merging_pages--;
-
 		VM_BUG_ON(stable_node->rmap_hlist_len <=3D 0);
 		stable_node->rmap_hlist_len--;
=20
@@ -2202,12 +2199,11 @@ static void stable_tree_append(struct ksm_rmap_it=
em *rmap_item,
 	rmap_item->address |=3D STABLE_FLAG;
 	hlist_add_head(&rmap_item->hlist, &stable_node->hlist);
=20
-	if (rmap_item->hlist.next)
+	if (rmap_item->hlist.next) {
 		ksm_pages_sharing++;
-	else
+		rmap_item->mm->ksm_merging_pages++;
+	} else
 		ksm_pages_shared++;
-
-	rmap_item->mm->ksm_merging_pages++;
 }
=20
 /*
--=20
2.43.0

