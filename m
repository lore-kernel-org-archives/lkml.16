Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294162686AB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278730; cv=none; b=F7e8PdI8pS18JL5TZGCRKOJUWxtcHFZVvgFQCigLSu9uydQiMseeUxj3Ere+1bIbmPZjKyvzrGO54S9gc9FEwFAV6VtVujo/NC7hkqZfE2fbHaUPG5gGtxjo5gqY3iuotJ9zTIAv/cZA3cNQDjM0RMud9tHi/EnLcsJRuzNHUmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278730; c=relaxed/simple;
	bh=MZ84i568MudrbnzkW7eLSSsitN+JayvOPUqqQdoJrFU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BlTfwi3SPVZZt8JElFIdVgN2mxf46Vf3NRl1lz0uzlb5KnGklYQe7cwYO6DrFPqqNqQewJsCJCsNyaA0ziLhJzQjkgrIP89yhBFwLBpeSnN0Emrlskbg6jYr9/L6cwu54f2j1mdd/12OFlbfsA74d7wTrrc0ZzwAE5HQmpUjbHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qVpx0/9u; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qVpx0/9u"
X-UUID: 7417b73c15f111f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8aFqx7rBqmhAKUDz1EoI12kISFmiMl1zSnR1/LjpxZQ=;
	b=qVpx0/9ujT4wejx8Eup3Ts1ZQp7vwDUfTULzpdcRX6x/kAulk45sMSqERcQ7l6TUGGY7qv4QS6lGdTl2FAH2FvOQGWs1PfGEemxfynyJe4nC9TnjgwKkcGuOH3KBfgH3NDxQGzjRq23mkGIyJ/vlURAUqlIEtilDe7D8w4sNYDo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:00d50654-4a71-4607-9e2e-4ab7c4b9cd6e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:bf2e168b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 7417b73c15f111f08eb9c36241bbb6fb-20250410
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yiru.zhang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2146154948; Thu, 10 Apr 2025 17:52:02 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 17:52:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 17:52:01 +0800
From: yiru zhang <yiru.zhang@mediatek.com>
To: <yiru.zhang@mediatek.com>
CC: <alexander.shishkin@linux.intel.com>,
	<angelogioacchino.delregno@collabora.com>, <coresight@lists.linaro.org>,
	<james.clark@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <mike.leach@linaro.org>, <suzuki.poulose@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] [Patch v3]Add ETE devarch condition in etm4_init_iomem_access
Date: Thu, 10 Apr 2025 17:51:58 +0800
Message-ID: <20250410095158.8966-1-yiru.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250409032917.7580-1-yiru.zhang@mediatek.com>
References: <20250409032917.7580-1-yiru.zhang@mediatek.com>
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504101759.7Ls0Uy4o-lkp@intel.com/

v1->v2: use switch case way
v2->v3: clean build warning
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2b8f10463840..4002a2823fd0 100644
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
+		pr_warn_once("Unknown ETM architecture: 0x%lx\n",
+			     devarch & ETM_DEVARCH_ID_MASK);
 		return false;
 	}
-
 	drvdata->arch = etm_devarch_to_arch(devarch);
 	*csa = CSDEV_ACCESS_IOMEM(drvdata->base);
 	return true;
-- 
2.46.0

