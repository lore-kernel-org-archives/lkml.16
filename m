Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA45A15ECD7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 03:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744169368; cv=none; b=dNUD5lAGfIS42heFRanrA49612JL6rO9r4LQsxy+cbfltLE3blrMLiSNCzjLSRZhnUsZL31ncfKnXnQHrIO3t5oJ2SM/BHRjF2bO2pTWUModXkTh5TJyxanZ5QSXBQgQciaSymYQvyiTfi6vjDWI6dXjO1XEAVi+gix0ROqneLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744169368; c=relaxed/simple;
	bh=OaV2nZps2HP5eYw6vUrmrGpMskBsu5LdwZT5VfvVF9c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E+s5EoWjjoE0Mh8WwRcmCK7vcgBqVjUDKGc7+RKjM1SX/i+zWsb+EvaGdkcRuneYTN4mM3NOIGIMmueSgB0E7PP+C0k/Mu+u6wVruwJx04ax0wRwZFrEOq1/DNSaEBCb++ReRQqKbCjvT5CXy1aVkctMKa4RgceSex3ciJufyk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=J0/TFlWo; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J0/TFlWo"
X-UUID: d37feb0414f211f08eb9c36241bbb6fb-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/ldIfw+IopvBD+8WtZqHSYb8hrJIJMbhoye5hb+79cI=;
	b=J0/TFlWoPiF7AcKLYkuJgpkA7U0DRzQd+w/yx3GdBK2A9QeeKJfz6ptT07OHix7+DwxatVwqvpmjlfHk8KkUClIIDsI+f7tUrj19eFVGjpWYI3ck/oIRWFt/2jnPBn4/WMin4U6BjboEe0hJ6TYNFupbSPicpDtk8Ma5aqOLj1U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:9b6b14f8-8046-4540-af96-2bf1e52366c2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fefcd9a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d37feb0414f211f08eb9c36241bbb6fb-20250409
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yiru.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1452954279; Wed, 09 Apr 2025 11:29:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 11:29:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 11:29:19 +0800
From: yiru zhang <yiru.zhang@mediatek.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, yiru
 zhang <yiru.zhang@mediatek.com>
Subject: [PATCH] [Patch v2]Add ETE devarch condition in etm4_init_iomem_access
Date: Wed, 9 Apr 2025 11:29:12 +0800
Message-ID: <20250409032917.7580-1-yiru.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Due to ETE supported, so add ETE devarch condition in etm4_init_iomem_access.
Signed-off-by: yiru zhang <yiru.zhang@mediatek.com>

v1->v2: use switch case way
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..366d11e038de 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1135,11 +1135,15 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
 	 * with MMIO. But we cannot touch the OSLK until we are
 	 * sure this is an ETM. So rely only on the TRCDEVARCH.
 	 */
-	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
-		pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
+	switch (devarch & ETM_DEVARCH_ID_MASK) {
+	case ETM_DEVARCH_ETMv4x_ARCH:
+	case ETM_DEVARCH_ETE_ARCH:
+		break;
+	default:
+		pr_warn_once("Unknown ETM architecture: %x\n",
+			     devarch & ETM_DEVARCH_ID_MASK);
 		return false;
 	}
-
 	drvdata->arch = etm_devarch_to_arch(devarch);
 	*csa = CSDEV_ACCESS_IOMEM(drvdata->base);
 	return true;
-- 
2.46.0

