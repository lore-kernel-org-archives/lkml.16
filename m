Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572F9165F16
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584131; cv=none; b=MoobGYTai9k5RuJQc61L5yoNDUus66+ovNsXBpeUcZ7KEhxXbwxvRBNSEq3NF/nfmioKMUkeSJ5Z+1RGUmhwtyeKqFdxeTpgeKGy4WDA5AlCS2gf/n7VE903o6wrmuFTb7I11afBgetrqIac0Dx941chSuu7BAdEJgmbapt6wrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584131; c=relaxed/simple;
	bh=EVtmVW1IwOASaN6R3rocsgTFp0b6Lx3rU+vedxS57Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GOhq561e2Nke9TMgkI2t6Br9sJxrCVluqNjiygjtWRX5uUqXkcLHz3dqqzpNmXYZDe0ywh/qpwRk27iYtkR2H+m1+e790ohz7BUk2/m7CBroMdCx8tNj3369x4LIf+ihNk4JHXldJisLIu6KOgussRKER7qE0WuiDfcIYMq3I90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=m8OxWh3r; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="m8OxWh3r"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M73COc024600;
	Sun, 22 Jun 2025 05:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=OrLzQ
	8IA6w4hYwzQtNtB4fAW5I0GOz7zTw3X11/xH5E=; b=m8OxWh3rdbUK9TeCybMvs
	TNu85yv3KXhN53TcN+Ldvg5b4+wpEmlUW0C2UqS/HsH7Te5EGUzDYfwWW2KmrjfJ
	qUKEznTgttn4C78SKSMmnUN8UThKDZvKpW6e3aHV/3v7sK+Ss9Xc5Fqr/uVXLPlp
	CCSR6L4R7xviOJc4wf7A86HeXWYNCubIIiprvL+sGdamXoX+hV4D6IsErCjwV1yr
	WKChjMMS//5q2nsW9rTje5ESHerKzodr78JfsLomx9BkPlRTzARPVJ+7SN3YnjGN
	k+vLMGC5TpApUC37FK1HU0Fc+KtqGGqGR9gVOVlEJtc1LuWo7NWoypquMo7psPlV
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47ed3qga62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 05:22:01 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55M9M0vk063117
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Jun 2025 05:22:00 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 22 Jun
 2025 05:22:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 22 Jun 2025 05:22:00 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55M9LkIi002322;
	Sun, 22 Jun 2025 05:21:50 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 22 Jun 2025 11:19:00 +0200
Subject: [PATCH v2 3/3] i3c: master: dw: Use i3c_master_writesl() and
 i3c_master_readsl()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250622-i3c-writesl-readsl-v2-3-2afd34ec6306@analog.com>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
In-Reply-To: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jorge
 Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750583937; l=2110;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=EVtmVW1IwOASaN6R3rocsgTFp0b6Lx3rU+vedxS57Gk=;
 b=btZUFab5KJHmhyTgU85BexIUN9q4XouW5kMnFxP6SZLHuvySJ3Rzb47Va48UT7atnYx6STv8H
 8ogEvZYDIGIDZ5Io+1Rd3jlHFIdbAuQ8wWQpNJfMcGH6CEdVMSFKX2/
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=HZYUTjE8 c=1 sm=1 tr=0 ts=6857cb39 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=5rRNbQybwip5eFZw3WsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: utokvlCfw76XicjdkaGxMEiHfsp9gqss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1NSBTYWx0ZWRfXz3ITp/BEjrCV
 GIZdLHY2uYjMUUdrLe0xwji9QcSPPN4BCI5vajsoVtbiDUiweLIYBLg1ltzwZLrWi7U3BRLMYxo
 2qctIdF33vMMk9FSAzM/mbm47xo+NVCIkaqOzM5PwlWa4IODHJCprMR2/TO6Vp+1pbFITy84HgT
 UqTQobvv6tK7riOyJv7i6eSYAXq7iBpFLZ8wZZSWFlbcCSYvOP08t6VVUnyutvIYONzUe8TesVt
 0BqNcfRYgALc7jtGK9ydg1GgYHPke9DfFitwnqXAJcnmpvbdBlvBES79FobfiMZJt+6sAmrOfoz
 WJWArgDO1wyUEi6Ql4lEowU2JdjVWEamKkxFwu0i0lR7ft3XwYM7V7hiKWtqQtZwBfZGfbZn0KH
 5KqgvA5gPOTz6vIdq+O2og49IcDugjOneLBmh0hwvxpHGwPjzqODZxafNHSGQ5VNjSOC5pWW
X-Proofpoint-ORIG-GUID: utokvlCfw76XicjdkaGxMEiHfsp9gqss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=821 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506220055

Use common inline i3c_master_writesl()/i3c_master_readsl() methods to
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


