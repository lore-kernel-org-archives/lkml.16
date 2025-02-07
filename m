Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F91A3A8A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914174; cv=none; b=M7aARklOJKXwh+vEqU8j5XnYZdB6Mr7UXrZeNa16p7OeZyXNNPXkDQK1CgDx7FfoHyZR/rDAQQEepbrDQwOEx0iFVclRlDo2yeoyU0dwx4t4k6YpsFf7bIQYlIcP6Fa9w+v5w6m6Bb9TPJkVnQxzW6+abMXj/exGYdcmbcNKAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914174; c=relaxed/simple;
	bh=Vw9LLGMrlYiJkQ30vcYj6lfEVJwVo75Kgh6Xy+jvaPo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YZr2xIMwsmQ2clRzGjUEBcX+6l3/JStgH3CcztxPrbmVsD5I43GRDa4wY0eIFfTOCSPUn9e3YbfRIwFlhSEAq39Sd14wVGXd2qV2INC8/6K2jR/xWdpCJhJocS7b7Y0HflWxpzDfKpEVo2MROwgJjkH/yRKTS9JGMH9Tb1f01MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1e0a4ed6e52711efa216b1d71e6e1362-20250207
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
	CIE_UNKNOWN, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1
	AMN_GOOD, AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ec42488f-2be3-4542-b882-67fd49fce446,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.1.45,REQID:ec42488f-2be3-4542-b882-67fd49fce446,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:6493067,CLOUDID:1e0c42fa0debf136c6e0df9aea6a58a5,BulkI
	D:250207154246NGIVU3IE,BulkQuantity:0,Recheck:0,SF:17|19|23|43|66|74|78|10
	2,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 1e0a4ed6e52711efa216b1d71e6e1362-20250207
X-User: liuye@kylinos.cn
Received: from localhost.localdomain [(223.70.253.31)] by mailgw.kylinos.cn
	(envelope-from <liuye@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1148564924; Fri, 07 Feb 2025 15:42:44 +0800
From: Liu Ye <liuye@kylinos.cn>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Liu Ye <liuye@kylinos.cn>
Subject: [PATCH] mm/secretmem: Bool type variables should be initialized with true
Date: Fri,  7 Feb 2025 15:42:37 +0800
Message-Id: <20250207074237.193775-1-liuye@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable secretmem_enable is initialized with 1, which is an integer.
It would be more appropriate to use true for better readability and
consistency with the bool type.

Signed-off-by: Liu Ye <liuye@kylinos.cn>
---
 mm/secretmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 1b0a214ee558..2f9442d6633d 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -35,7 +35,7 @@
 #define SECRETMEM_MODE_MASK	(0x0)
 #define SECRETMEM_FLAGS_MASK	SECRETMEM_MODE_MASK
 
-static bool secretmem_enable __ro_after_init = 1;
+static bool secretmem_enable __ro_after_init = true;
 module_param_named(enable, secretmem_enable, bool, 0400);
 MODULE_PARM_DESC(secretmem_enable,
 		 "Enable secretmem and memfd_secret(2) system call");
-- 
2.25.1

