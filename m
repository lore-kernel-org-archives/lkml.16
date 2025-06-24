Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93376251792
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756054; cv=none; b=K8cJHU0lGhLyAUb8Lk7LmgYTx2Q95/IdC/Dfs7YUAqKRv6YG+PQs9Sy//q1fRMInrjvV3gE5xDQ0EQQ7xHYB3B9ShTtFHfdljaZYN3ArxkPq1dAA1Zy5IOHTeIUFO/hZOJF5QwThONt8ZZHVZHGP+fnAIjCS+wxXewsnOGGC8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756054; c=relaxed/simple;
	bh=0h1B/EXtyfjip0W6o3w7xdrYftaObTtcOMMwc/DNLCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YQ0LGEy41YLAvXtmnl7BL/P2WKBAPnB9RLIU5gHwlog4kYNxr7kQUGB+UnHCRzGsFu95mad2b94Gko5kS3Ca8t2x923DeiM2L21802tGlYbUJ4NN1IGrlZXtfL8+HDexMN1N+U+6e1phmwq/h1REgyoHeahydQyKesIo31bVByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vtvJ78HK; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vtvJ78HK"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6i84M016383;
	Tue, 24 Jun 2025 05:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=i4IeI
	J8yn+pHeHifgHBvLNv1j95vL/lajmEMjYmg9Fw=; b=vtvJ78HKc3gYphvn3frE3
	vvlGXlOtzg54eWA5fpkkihZ1Xo5fb0MfSvK/BLC9CQCYawqqkCo625FoLwKOZNvy
	6w6dJcugGppFUJIbgvWuwdYYGcF9qPKLYGybcIiT+KiiEJKFYBTEKEBWSIxK3NHl
	bfoJr0xt1I2CLnsmLLm6h3cLWnnbDKgnZHDhMoufTFECopdWJ/afairZDmn8YRD3
	oWvmObnOe1qP/lWWIOYx4Cr7tqD0U9ljncsadNf3ancAV4N5mN5+kzZLUXfPGqg9
	75HNtypUyLESwGSbmdh/OOwKvviW57F445b2f+UlchiM8oCmxBhFyYuj3tw1jWii
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47dpk9eny2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:07:18 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55O97H4T012615
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jun 2025 05:07:17 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 05:07:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 05:07:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Jun 2025 05:07:17 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.55] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55O973ap007498;
	Tue, 24 Jun 2025 05:07:11 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Tue, 24 Jun 2025 11:06:05 +0200
Subject: [PATCH v3 2/3] i3c: master: cdns: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-i3c-writesl-readsl-v3-2-63ccf0870f01@analog.com>
References: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
In-Reply-To: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750756023; l=2207;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=0h1B/EXtyfjip0W6o3w7xdrYftaObTtcOMMwc/DNLCM=;
 b=F1IjRYp3Q0ELCStfPrS7g51UhC7/jgUgw14x+qaqyVvt6dWadVRF6/X7P3mUpWb2BCoV18AL6
 40bLuzCmPHEBbRr1ooWDw3Z601MzklzOty9xBgsHYFl0zbpvSN4OyUI
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=aclhnQot c=1 sm=1 tr=0 ts=685a6ac6 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=HIdXEUdWjxm5DSZX9lgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NyBTYWx0ZWRfX7beYt5zqI7jB
 djo/m4mL2oY/hy7/JKN/r0TcwcPK9bHUUAb7WH8TOZd/FZ8z1eToqB8bHxSEhqHSMBDxWg/L0Kk
 qJbZbf4sZYB/z/nFjh1+/1PGdZJo47YostQEGqEtgcrxoZBwtSPegYstTyf1pE22sz+uPFg2Vt0
 /0KaxG+ma5PJX2hMQdUU09iZeXFsFNyZVOXVqsapOg2JJUAZ1l75L/ufJF/Qq1akGMtuNiBvcIV
 cxf5NNUOuPnhC5rjDOfGdeq7vVqzsB2sdqL9LceweuHonmY5Q+2CG01ty4ww5e9cm29e1FWQaEP
 DVBeg0n3KqhrhoA8jvOYylFIYB7O4hZXx7o1xgGkpmrO8zTpVBjWJ4C1AdmGVz29UpQbPZ5jdcP
 Hz7QXhcrB5DteaUvWgqzdhZ5sZ/7VzHVzrLFywAQlQz2h0RqQr1RdajsgzNc8M/+09uHPL+k
X-Proofpoint-ORIG-GUID: G789YaPys_ZBzYqe3cU5W8fn3Eo0Z0Au
X-Proofpoint-GUID: G789YaPys_ZBzYqe3cU5W8fn3Eo0Z0Au
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=807 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240077

Use common inline i3c_writel_fifo()/i3c_readl_fifo() methods to
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

