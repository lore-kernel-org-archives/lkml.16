Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C589225487D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452194; cv=none; b=XwsS1GgpVb2BhyfM3OTP2bNNfknu/6tWgMILNPfMxhD5m3OGzr7Hmg76uY+6reSxoHwz6SMvZY9vYl9YJ+GuZWlBw/ZJudN3XyE4XFGX2D2/TyJUXDSDXw8R7zTXVyaijCuUHtdcUhHBorMFNfbCZLRHwVeI/UVHWt4/02W1kX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452194; c=relaxed/simple;
	bh=gzvJalMbedHcmnfq8Ixf1Gj3tOKb/Kjj6Kd5Mc5EIQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qPuXFtFvj+VbgpaFRMTwCDzkF6+yRccBVRrJK+1udqHFLrEnS1egNDArNe+c/oKi4KoGfKBw3sAiO5qznCRv9REMcBbIfNp8RsIyRvnEDt4YKDOr/qRQqzr3+3iwmQSelzBpU1CmCM0H7gM5w+PQXn3sTxjdwrrbEXpqGYG4x7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: da94afec44fe11f0b29709d653e92f7d-20250609
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_UNTRUSTED, SA_LOWREP, SA_EXISTED, SN_UNTRUSTED
	SN_LOWREP, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:221b8a28-7d67-404f-b161-761a707210be,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:18,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:28
X-CID-INFO: VERSION:1.1.45,REQID:221b8a28-7d67-404f-b161-761a707210be,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:18,FILE:0,BULK:0,RULE:Release_HamU,ACTION
	:release,TS:28
X-CID-META: VersionHash:6493067,CLOUDID:01d4378e4e31474b0669c5966d371f7c,BulkI
	D:250609145624TAPJGJ8R,BulkQuantity:0,Recheck:0,SF:16|19|23|43|66|74|78|10
	2,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_USA,TF_CID_SPAM_FSD
X-UUID: da94afec44fe11f0b29709d653e92f7d-20250609
X-User: husong@kylinos.cn
Received: from localhost.localdomain [(223.104.40.206)] by mailgw.kylinos.cn
	(envelope-from <husong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1542986758; Mon, 09 Jun 2025 14:56:22 +0800
From: Hu Song <husong@kylinos.cn>
To: muchun.song@linux.dev
Cc: osalvador@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Hu Song <husong@kylinos.cn>
Subject: [PATCH] hugetlbfs:inode: initialize 'error' variable at definition to reduce code redundancy
Date: Mon,  9 Jun 2025 14:56:15 +0800
Message-Id: <20250609065615.108240-1-husong@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize the error variable to -ENOMEM at definition in
init_hugetlbfs_fs().This removes the need for a separate
initialization later and makes the code slightly more concise,
while still preserving the original logic.
No functional change intended.

Signed-off-by: Hu Song <husong@kylinos.cn>
---
 fs/hugetlbfs/inode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index e4de5425838d..390cddd5872c 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1600,7 +1600,7 @@ static int __init init_hugetlbfs_fs(void)
 {
 	struct vfsmount *mnt;
 	struct hstate *h;
-	int error;
+	int error = -ENOMEM;
 	int i;
 
 	if (!hugepages_supported()) {
@@ -1608,7 +1608,6 @@ static int __init init_hugetlbfs_fs(void)
 		return -ENOTSUPP;
 	}
 
-	error = -ENOMEM;
 	hugetlbfs_inode_cachep = kmem_cache_create("hugetlbfs_inode_cache",
 					sizeof(struct hugetlbfs_inode_info),
 					0, SLAB_ACCOUNT, init_once);
-- 
2.25.1

