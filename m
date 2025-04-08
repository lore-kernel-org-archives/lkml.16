Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F325FA26
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097828; cv=none; b=g1An9+tT1d4+ItMyeaH3iuUDlhsQur1L1GZPy4kl8jGYVNnpHyktUVNsU+la/SQlx/qCVXUk6YB19FJdwRZRFDAt9EnQvNi5ZBXnVCLt0j8m507bfCWKdj9uSOM/vtIp2JVdGOaRIhWrUvrHg+jsDKPgV1TdoexeRT54ee/cvhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097828; c=relaxed/simple;
	bh=FOc10CU6cFIA7geG+YLgieKATWTB7zuFtsCN+hfFgtw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b+zxAZyFuOSljh/+evTI11EWNWAuhovLr1v9AT3zJiQXwBdo5cCCKw32MDYeYvn94B/CMz+IkgHJq+qdIwm2LK9SQPr4XqZ15b7z3rDcBaFiyt9Egk9h2b4TrfKiOavVbVOS9DYkGECRbfJzXHhUnj9qKWxg7NEFCHnziNSFqok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=C7zsN+HP; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C7zsN+HP"
X-UUID: 42613d40144c11f0aae1fd9735fae912-20250408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5fIewfRHgqHusXK3VZZV3qKak18ZJEB3oyX1A6sI74Y=;
	b=C7zsN+HPDgCgw7ecOCnmBGcXF0FX+ESm1w5mt1lX/cW5BhqgMBfBMha10uarzrRekII9iITaLv2MiLl2OBoRcbJdvYx+b0q+/8MDQjuCDVNgFSbKy5SDM9LL6SIzCQuekxJktFrBzw4fJmrbCf6KlM4L8apvMOY3lRDdq8qrnOw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f7baa0c2-d052-43cd-881d-a9a573a47dc8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:019c4fc7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 42613d40144c11f0aae1fd9735fae912-20250408
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yiru.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 806329905; Tue, 08 Apr 2025 15:37:01 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 15:36:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 15:36:59 +0800
From: yiru zhang <yiru.zhang@mediatek.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, yiru
 zhang <yiru.zhang@mediatek.com>
Subject: [PATCH] [Patch v1]Add ETE devarch condition in etm4_init_iomem_access
Date: Tue, 8 Apr 2025 15:36:46 +0800
Message-ID: <20250408073651.17140-1-yiru.zhang@mediatek.com>
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
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..971b9f0fe5e4 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1135,8 +1135,9 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
 	 * with MMIO. But we cannot touch the OSLK until we are
 	 * sure this is an ETM. So rely only on the TRCDEVARCH.
 	 */
-	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
-		pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
+	if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH \
+	&& (devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETE_ARCH) {
+		pr_warn_once("TRCDEVARCH doesn't match ETMv4&ETE architecture\n");
 		return false;
 	}
 
-- 
2.46.0

