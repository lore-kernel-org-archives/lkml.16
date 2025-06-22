Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B519995E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584133; cv=none; b=VXB7EjQECnMGiKaAu8DDeaPGtlhNqSffbqxjIVgesyPcw10hDFp+4Gzb6Hyon5faxEdv9LtKogysNstHXL2snlzBdi8hRdzRo2hH6JzUFBD8QctbF9ytZepkrvRw/BQ6igpqhCbZUuyVXVmiacqoy27ScVkPOz1NM3GC4/+KP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584133; c=relaxed/simple;
	bh=G2ndV+MQ36l3fmzDtWBM3JUhQ84vhzEGz9R9pdPXqtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jbwV2AnbYtOQgZDcslIj866k/XvIgjJJYpAodSBBbzGaA9Rh1vJ8PVGC1Sgg8OTCZLZ43iGkXwHYWqOkzgpijRE0fuQuXNw+oiyF221Ok2ccjdaaWK2aE/kBL3r5JMZ4+J7RzbtakWUdCNHpUSrUK71v57t2JXYG303ZyTlB6pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Q0+59x/c; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Q0+59x/c"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M528BI012266;
	Sun, 22 Jun 2025 05:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=HNtXL
	lkrbNK2ae+OChWznVZiy3xck+hIBQLK1M8aHhY=; b=Q0+59x/c8npg74NeDQWVK
	miUor0Gq+GhWu1Bp/CwchAsVBEbZWe6pRd12IPW7Lm3ydsBss0PZtuUBMf5YVwtl
	nqYT9hPensH1skZM/FqXXsUAEcSgMdZhWwu2wvHiZ31ge8hf110zbYa+4MNHj3fa
	67ft6zSNvjgqjTK3tUOt+lVKh/C6jf3SjR09ioYMX4lVuDIATcw3bSAgg+4jIimI
	yjZpPMTMwa5oDplxufth4x1fPqhVxYv8StMUfSYuqZuQV1IAVP4YTpBk/5vQdKzS
	fQQdPMyrZYsY4Be9QwpIAMz9Gd911nWW5xxgk2iNGAWvWRaJcXuerziH1KITqU4U
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47dsn7bkpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 05:22:02 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55M9Lkgp063097
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Jun 2025 05:21:46 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 05:21:46 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 05:21:46 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 22 Jun 2025 05:21:46 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55M9LVbB002307;
	Sun, 22 Jun 2025 05:21:35 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 22 Jun 2025 11:18:59 +0200
Subject: [PATCH v2 2/3] i3c: master: cdns: Use i3c_master_writesl() and
 i3c_master_readsl()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250622-i3c-writesl-readsl-v2-2-2afd34ec6306@analog.com>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
In-Reply-To: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750583937; l=2213;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=G2ndV+MQ36l3fmzDtWBM3JUhQ84vhzEGz9R9pdPXqtA=;
 b=6UjcbzqVvZ0MDA4cGh0jcPXQMkgtWJsMgUAp+JZv9v77SFFVIcm377k5eSTqzJOERSVd3mqPh
 QfLJjktqYIuDRaZjM1SiujngWWbxWnDNvjmrFPUv9Alq74lV35J+yWW
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=GLsIEvNK c=1 sm=1 tr=0 ts=6857cb3a cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=wBeUhC9FeeX9q1_Bn2kA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1NiBTYWx0ZWRfX5Kb3dTJYyylB
 iaWUEXH7Le0RO5rSgHaP3WA2wQPG96CEkE34ApdRht4SfoyvtFBjBkKM8qZMCqNOQ7f6UB/9a6l
 rIucK4pW6yPqDhREQyJqKcwr/dDSjlwNzcLBDiI70b+LMNIbQScenIkH1CebS3unxMyrJ4YZKYO
 6OhrbbRfEHIrKFw005bvZErgXppThkLhTUtoNr+ztvepVQ6+zQgGDyG9mdNp7orOWc3ymISo+v0
 /2WvzZYXE2zbDka0iRPMVWaYcAKhpTYJbpahm3rAWU8Fr7jowcVDcvaLUpjddXw4rLxw0l0047l
 DDMAFtx2zKLDQrn+xQ/AKOhrXUJxSN4odRI0Wts0HZMmEcIgDLfs71Et9MnUdjmx1HAdeuBNTop
 PMZBMCVFQ8AGIH4nXh/tpIUJKpvCRrZWJgSOAIEFIifYMBC3UTzaD9+y9ONairin/uqFn9fM
X-Proofpoint-GUID: MJ-2Q7Sa5SSomXW1FOY3EPwni_BTskM0
X-Proofpoint-ORIG-GUID: MJ-2Q7Sa5SSomXW1FOY3EPwni_BTskM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=807 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220056

Use common inline i3c_master_writesl()/i3c_master_readsl() methods to
simplify code since the FIFO of controller is a 32bit width.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654954ed1e37337754e45fddbbbf68e..321c04d2109ec1951f2b07a9d1b88c6aaf055c95 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -23,6 +23,8 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
+#include "../internals.h"
+
 #define DEV_ID				0x0
 #define DEV_ID_I3C_MASTER		0x5034
 
@@ -427,25 +429,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
 static void cdns_i3c_master_wr_to_tx_fifo(struct cdns_i3c_master *master,
 					  const u8 *bytes, int nbytes)
 {
-	writesl(master->regs + TX_FIFO, bytes, nbytes / 4);
-	if (nbytes & 3) {
-		u32 tmp = 0;
-
-		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
-		writesl(master->regs + TX_FIFO, &tmp, 1);
-	}
+	i3c_writel_fifo(master->regs + TX_FIFO, bytes, nbytes);
 }
 
 static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
 					    u8 *bytes, int nbytes)
 {
-	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);
-	if (nbytes & 3) {
-		u32 tmp;
-
-		readsl(master->regs + RX_FIFO, &tmp, 1);
-		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
-	}
+	i3c_readl_fifo(master->regs + RX_FIFO, bytes, nbytes);
 }
 
 static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
@@ -1330,12 +1320,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 	buf = slot->data;
 
 	nbytes = IBIR_XFER_BYTES(ibir);
-	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
-	if (nbytes % 3) {
-		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
-
-		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
-	}
+	i3c_readl_fifo(master->regs + IBI_DATA_FIFO, buf, nbytes);
 
 	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
 			  dev->ibi->max_payload_len);

-- 
2.49.0


