Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BB727AC57
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756057; cv=none; b=jj3gpti9nm91GWcP1JWHBaAyE65gC9eXvFVQCUWaUobTA9lYXDoMRQJAztM8e31E6eIQR+qH+BYw2DQ+ttQVIfyb397xhEf8kxk2Ott/zfvDNkyZ2Xg63R9zqx/yZ3oth1/Hg8HKxn7/jx8TcWR9roAD7R2T/UocCxN8GaDGG4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756057; c=relaxed/simple;
	bh=wCs4i87jJYOsPZ2Vm1E8RoZR7ejFzjqL1pmElM07eyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S7bJ3Jbh9Drg08u+/xWs3UFJpgvHX663m1ebpDen6d8eWOHbGX2rH8K7fHZO66AESwhNzt4uxM7lsXpFAsGqp9IKk57V6iZfYy8xC8wDMC12BG57UtbT24AsIxBmcxwwWVFt6yKwyyj/5+wrA90ng3G0VBrzAymcmZCXMc/7HG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=O1wdHTTg; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="O1wdHTTg"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O78SQJ017397;
	Tue, 24 Jun 2025 05:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=1t/j9
	5uo+rfdf+7ItOaKA2g2tv6TYJM7N8IK0++IJpY=; b=O1wdHTTg48sIy+J8ZwHu2
	ZTibfzR53HIQEpg/Pfhh9A907UJyObV5h38KBeCElyYbJDPycTxdpcidKIan0vaV
	dnAgsbogHoHmuch21xfQ6cnDcZUTUEymt3556aHUuG30rB7ArwLC2OaHDkf3FSlp
	waJrs/QNFC/KktcmKhEVhLK8PzfjvVNXJeilZu3Rwp9wN0RJzl2qoPQVNRJKcKYd
	0BsvixWDEKC/fUVCIIbgzs4NBkLfU2WKsBdk3LUNh8FollFyJuiB3R0zcS9bqMPG
	/pzI8yKdV9r5csuZXYpEr8GcGjjPqiGVXwK5jgaRp49RnzWyu5bwvTd9KlT7Tqcr
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47f43a6g06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:07:21 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55O97IBc012640
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jun 2025 05:07:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 05:07:18 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 05:07:18 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Jun 2025 05:07:18 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.55] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55O973aq007498;
	Tue, 24 Jun 2025 05:07:13 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Tue, 24 Jun 2025 11:06:06 +0200
Subject: [PATCH v3 3/3] i3c: master: dw: Use i3c_writel_fifo() and
 i3c_readl_fifo()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-i3c-writesl-readsl-v3-3-63ccf0870f01@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750756023; l=2104;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=wCs4i87jJYOsPZ2Vm1E8RoZR7ejFzjqL1pmElM07eyQ=;
 b=KsrDy+vX0StOQy9eXsmLzz2Qtjbs+wEjPnKUNxUGhNF9SYiReu1JSoUwdha9exn85ufrhQvOx
 IgGd54NbjntDJ8lSC0+lFW2dpK0YTufxla98reI3+FwrucIwUI7ABwJ
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NyBTYWx0ZWRfX4szgUOkXI/D+
 SEYNQvAr6OucyRV5x0RemVaNzpNnhQ0k5bkJxMDRm7PhDax3zT+Elro0UlJv8MiZzqyhZR9cv3Q
 AzCQlJop3ZL4Zu2v2JmMBZXWWMztFPqesMZW2YSHuMjxYxy1z7BUGhTXB/TJ9bRpgwA0fbixZPd
 1aZeAhnciIskKIOPD6jbJoLrnZyn/ZlKieTimAAOE4OmlLZNQKYQDIntcCG6Go6/iDM82AVmGpR
 J2Qus2ts5QtPRDGtM0blAvRwSb+jjw+nbgF9RSFq6X75s6e1h+RO5JDLiSR9bwQAobxSm4pb4hi
 r/SHyHourQVB1crxuScUckmOalNWgp2yAgongmq2C2XDCbqeJB3e6x8Q8qeFVTRRO5ThYsJfqNJ
 ZCd10bzApq+TtmxSHxOILuWnDcA+hjOD0clKuPAgjS/I4fjHsb6qHNVs4Zl2DIT+W5m8oiWP
X-Authority-Analysis: v=2.4 cv=PuGTbxM3 c=1 sm=1 tr=0 ts=685a6ac9 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=HIdXEUdWjxm5DSZX9lgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Tw9L9c6SN7TFMlD-MWZHESK-5RmbKTot
X-Proofpoint-GUID: Tw9L9c6SN7TFMlD-MWZHESK-5RmbKTot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=808
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240077

Use common inline i3c_writel_fifo()/i3c_readl_fifo() methods to
simplify code since the FIFO of controller is a 32bit width.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/dw-i3c-master.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c1572ddf717c8ad473e44a3b8fcceaf..886f8b74defda31ae93248467d144f9c8c561581 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -23,6 +23,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
+#include "../internals.h"
 #include "dw-i3c-master.h"
 
 #define DEVICE_CTRL			0x0
@@ -336,37 +337,19 @@ static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
 static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
 				     const u8 *bytes, int nbytes)
 {
-	writesl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
-	if (nbytes & 3) {
-		u32 tmp = 0;
-
-		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
-		writesl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
-	}
-}
-
-static void dw_i3c_master_read_fifo(struct dw_i3c_master *master,
-				    int reg,  u8 *bytes, int nbytes)
-{
-	readsl(master->regs + reg, bytes, nbytes / 4);
-	if (nbytes & 3) {
-		u32 tmp;
-
-		readsl(master->regs + reg, &tmp, 1);
-		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
-	}
+	i3c_writel_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
 }
 
 static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
 				       u8 *bytes, int nbytes)
 {
-	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
+	i3c_readl_fifo(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
 }
 
 static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
 					u8 *bytes, int nbytes)
 {
-	return dw_i3c_master_read_fifo(master, IBI_QUEUE_STATUS, bytes, nbytes);
+	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);
 }
 
 static struct dw_i3c_xfer *

-- 
2.49.0

