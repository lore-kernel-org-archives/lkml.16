Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3382E6125
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441062; cv=none; b=YlaHFOZiELCaWqpWE25ZSYfSZqg+qfwc4EZB55p3TCNgspQgzSR6Ul05OIJDhb7PR+0vPHtJnyF/HrI8pO1ctBxrnfstA/36lMWP6u9ko90Txy9+azB+BP6phtjqz+nBIvvHXmRsFby7lfpAYxhAyU58k6c67HP9jpwvS0qTB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441062; c=relaxed/simple;
	bh=BAY7XByXgMFVNwFKD6933qf59V3/WCIDwbV+JGWtPFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fapYA9xi0+jjY9Fm+Vc/x7Gpkjc32s/VmCkvEko/mZP47vq4u/CqSRjUloJO74vPdavPWg5QVtcwRIbNXHAzo6UXp3olmC45j0Vt3FHTima2VX+mE5G3FeLWDOrcd5hdNIV5MMk8QmQqfDzC3qp35ox7CRLnl6ZK9lbqkFIejJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=by1XIGAy; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="by1XIGAy"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGQQBt019233;
	Fri, 20 Jun 2025 13:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=irglX
	W9m1Q5FXxONXVbLB2k7lP7/bhTQkoZzemTVQjE=; b=by1XIGAyTkYpfgphefAlF
	t42OJltXrh9jIRPSGSn9e8hx8L10rxMQ/l/Q5rmbGUeuMpaQyaWZmMoMB6ZA7UX+
	vLjSEKj9HvgfOEW1kEzhJ3aPCs733A1i5E4kgx4GUrG0E4Vv6Jx2Fj1F+rtUtd6l
	Wfq8KEF4Y/wj8KlQ85zVxU64s8Jv759U942NQPc2g0LNFCXbiO9HncquEsLuuPNv
	c486jV3KbjKvlH8sPWuh67OfVsake/llOjYtarDXmJuK+Xkw/Uy5VGDhlnQOF34X
	pQhX9BMaCyge8zOb7F04Ykld6IgNSzXQVq2KmLCJPQADcQ6h/JopH1+HsN6ARIjQ
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47d21du56j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 13:37:31 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55KHbU5X032843
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jun 2025 13:37:30 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 20 Jun
 2025 13:37:30 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Jun 2025 13:37:30 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55KHbEPc030681;
	Fri, 20 Jun 2025 13:37:18 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Fri, 20 Jun 2025 18:55:01 +0200
Subject: [PATCH 3/3] i3c: master: dw: Use i3c_master_writesl and
 i3c_master_readsl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250620-i3c-writesl-readsl-v1-3-e0aa1c014dff@analog.com>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
In-Reply-To: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jorge
 Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750438498; l=1902;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=BAY7XByXgMFVNwFKD6933qf59V3/WCIDwbV+JGWtPFk=;
 b=VntJQT3NsYb6lAlu+PDBwgBaqastKOhto2s4j6qCOIKpuqVPXTJJr0UuD6iHWyBVRVX+i4o/I
 DxypYZkZyejBxaMBAnqDRJx9jcuyZvtXNDopkllWlsrdCBxEjzRKP77
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=Z4zsHGRA c=1 sm=1 tr=0 ts=68559c5c cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=lSS91xS1W9WTNWmX6BAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fx9dTcQQoCQiWBlP4T6W77ojUQ7kCb0W
X-Proofpoint-ORIG-GUID: fx9dTcQQoCQiWBlP4T6W77ojUQ7kCb0W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNCBTYWx0ZWRfX8eh/UKl0Ubpg
 tFiwRPhqG85qzLKT9G8fNiNh0TNyLEgodBi3pC6xwwtZ1cHM2cNFSRuo00Xj5bDzDciOZ8oNykX
 MERZWvxq+nabbfoUuULr6JLOqBBlz2CPyO8h4YbqjDpMgA+uHLBuYqxrf/MrdworARdGZrAzzVT
 gMgdes6MvpD1AYPEpCWmHm25DA6GDaGQhvMDB+/Kk7KaPzNxajz7r0WW6iuGsxamcOhPu3SzpHR
 7QLYv/8H6X21i2W83YW3OTiDAGlUMeo8EgJUw07JoBUtBSwLlPnSAw0RgFJ/YwhV+YEsxin6f77
 PP/V5DxMbZbUUEAJtqYy5w+/6BigGvSTrAAEWfon0dAJzLx0r+pffMSxW+Maq4dOObOT82rSP0L
 dJWQUZO6XbKq8BoELj3YiGX4r49QbTmy6WHnVggyJspioTR9Sri2pgF1ACroGty+0jvXT8JG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=723
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200124

Use the inline write/read methods common to controllers that have a
bus width of 32-bits.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/dw-i3c-master.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c1572ddf717c8ad473e44a3b8fcceaf..eb1346409829dc64cdd1d738e9870993d38bbb0f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -336,37 +336,19 @@ static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
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
+	i3c_master_writesl(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
 }
 
 static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
 				       u8 *bytes, int nbytes)
 {
-	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
+	i3c_master_readsl(master + RX_TX_DATA_PORT, bytes, nbytes);
 }
 
 static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
 					u8 *bytes, int nbytes)
 {
-	return dw_i3c_master_read_fifo(master, IBI_QUEUE_STATUS, bytes, nbytes);
+	i3c_master_readsl(master + IBI_QUEUE_STATUS, bytes, nbytes);
 }
 
 static struct dw_i3c_xfer *

-- 
2.49.0


