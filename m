Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6470F14830F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908306; cv=none; b=LJ2LpwvuwsDKCWK9UwyphUtmpieDl0EAn+maijVl997agYFY/Cx5pgfKY5Y+aPtGd8IGCp+2B3+BznM3R+V1myYOG576tIFrsHNZyT0UIlFLg1bSN4ThN010jrRPsI7eKZJFQLStPdV8yfc2o1lmnBrRMndp757IutkW6tPjmqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908306; c=relaxed/simple;
	bh=dAMp6AoUlDNf/JBWDulVLiey/lZJfGDVRDIGPjWybVk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s3pb+CrwJahqSX5PyjQwmFGmsNRbQcIDygfkC/6MZ4F9pbLqbV7Zm0cUtjrZFco2pcXD9+Zb7ZIGPNEYAY2yDL2x6JUasngx2wr+g0IjccnVXHhEMnlJ/GKgqit5PNCcfl+i5pOPBS/o36+8djiCwq+GNQNnvesYDZLGoEjqlJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 73c7495ee51911efa216b1d71e6e1362-20250207
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
X-CID-O-INFO: VERSION:1.1.45,REQID:396ae1c4-c3c3-4ad1-800b-23b4ff26ea62,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:396ae1c4-c3c3-4ad1-800b-23b4ff26ea62,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:1e909fe92a23362bffd0d5b830b00e05,BulkI
	D:250207140457V2MBV3HK,BulkQuantity:0,Recheck:0,SF:17|19|24|38|44|66|78|10
	2,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 73c7495ee51911efa216b1d71e6e1362-20250207
X-User: liuye@kylinos.cn
Received: from localhost.localdomain [(223.70.160.239)] by mailgw.kylinos.cn
	(envelope-from <liuye@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2000563527; Fri, 07 Feb 2025 14:04:55 +0800
From: Liu Ye <liuye@kylinos.cn>
To: akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liu Ye <liuye@kylinos.cn>
Subject: [PATCH] mm/mlock: Fix WARN_ON_ONCE condition.
Date: Fri,  7 Feb 2025 14:04:48 +0800
Message-Id: <20250207060448.146606-1-liuye@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The condition in WARN_ON_ONCE(cpu_online(cpu)) should be !cpu_online(cpu)
to ensure the warning is triggered when the CPU is offline.

Signed-off-by: Liu Ye <liuye@kylinos.cn>
---
 mm/mlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mlock.c b/mm/mlock.c
index cde076fa7d5e..40acf7897917 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -224,7 +224,7 @@ void mlock_drain_remote(int cpu)
 {
 	struct folio_batch *fbatch;
 
-	WARN_ON_ONCE(cpu_online(cpu));
+	WARN_ON_ONCE(!cpu_online(cpu));
 	fbatch = &per_cpu(mlock_fbatch.fbatch, cpu);
 	if (folio_batch_count(fbatch))
 		mlock_folio_batch(fbatch);
-- 
2.25.1

