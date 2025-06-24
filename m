Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE37927A917
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756056; cv=none; b=Y102PkEdLaPy/FLnkFIWoeNIAiHyLI4KpsvZ4gvhkslgZoZzkNhrOxx/y0KncUbX8G1ibvzo0o0CLd/+uatjw+L+iuN6P+WQZB3d4P0UncA5dPpl5O2Bcu0fMcDl9ASupEPVvDTkpwQIggSz6uOVPWwwJZBVlKefUZiDXpiDL3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756056; c=relaxed/simple;
	bh=HfDaL1+3ZZH7qU0UrdVmwCMTo/BAN5wJ95E8N0SQOVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D8Sgykjr8PmP0n29k0fHqxeAIrZtTAtDY2z6rqewQIoES861pL/gYlyxO59Zwm5LI4PgX95QpPOPyA/CM/iS8pNQCJoxNE7ReNvgaTsTZOzQ0qrSi1euAuzJkD3aErxPCdjDlom8+riiagcJH9vSB84ozOvjldL1p7/mmHadXdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=dED7wLVU; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="dED7wLVU"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6vAGN016424;
	Tue, 24 Jun 2025 05:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZFVYa
	UcJ8QJdBtj22eJipmqjgLTId7OEXFrgqfcYbfw=; b=dED7wLVUO9R3U4UOjXJRz
	oSMQ0QbDCEH7TNrWp+Kirdhp65lEGNMV7m2jeBhR2x+u6E098dRz0bo/KAka/2tM
	Goibl5y8oR42u/Ax7DxTBScLU2WY+0d0zlR+ZArObLwPzCcqpZHoB/mya+aT1tdU
	VeBbXk1NyOKSmKYkXoeu92wm1squsiG/ATKsiFYnmDTOPz3ks1OwcBz91kOMwePn
	ncYMJ5iH6QYLy4qoKxMzf0gm84BzHLHSkhRY+At6G/lmIaOHldmVEQCIAZU8AHEC
	csk9ihs2/BlKWeo5N7xPGH3tfWlFmrHvPUu6Y34sP8TbB/EQs/o8clk4FDEStBin
	g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47dpk9enxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:07:17 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55O97F1A012602
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jun 2025 05:07:15 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 05:07:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 24 Jun 2025 05:07:15 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Jun 2025 05:07:15 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.55] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55O973ao007498;
	Tue, 24 Jun 2025 05:07:10 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Tue, 24 Jun 2025 11:06:04 +0200
Subject: [PATCH v3 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-i3c-writesl-readsl-v3-1-63ccf0870f01@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750756023; l=1856;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=HfDaL1+3ZZH7qU0UrdVmwCMTo/BAN5wJ95E8N0SQOVA=;
 b=MX2OdZVXP3WUYbaV5W5gev/9zEQjAMYLZ3UF5hGa4mUxtsD3MgrB503Q0kAKF5tRTYfH7ewjJ
 TA6L7J9BPt4DXftOK6eKiG6WqLplJn6XW0SXH5EoCYmvRXjljxwt5Tx
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=aclhnQot c=1 sm=1 tr=0 ts=685a6ac5 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=Xws4TFRhkSG2vrPBptAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NyBTYWx0ZWRfX92rQiST2s3fr
 J+Itrn3Sk1MTEo+cxLmt10G+7KWyKJN6YlCeIDP23+zQznAtzK/+pVwQZ6MLobK/RViZZiHOJ2r
 qih223Uy79PV8qZm/bqKReTTpbdWao4sQs5/tPKSvH8vaeYHX2b5aTzOImIu/5Nj+SEH/64V/Xi
 xOgJr0CCIBPgIZmKS/U2gNw59Kqq6S78gNCq5sc+8OGDe2yVd0UnfTIDA44motWlu5LyCovSXwP
 j3cC19ppxsuXqhptu88DSl5StUeusNeB56poySrn4lnnHTnQjvB7qVpAk/NaQZUFB1627PVCLGS
 KSf6JN9BoT1PJc/yVnBMBve7dHzYsy6DZBza2xusY1bszCq2OJUiJIGb6zBGz3zB22beo8lp2Z5
 wumZrmDPhJDW71D/EWrJHLT/2JcA8N8IpiTNqe0w0bu6r0mUpAqTVOZLCJGyAzlnbkN0OAwp
X-Proofpoint-ORIG-GUID: zxH2MtxFqNAamX6WOWD3AzazaBD3zz7Y
X-Proofpoint-GUID: zxH2MtxFqNAamX6WOWD3AzazaBD3zz7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=824 phishscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240077

The I3C abstraction expects u8 buffers, but some controllers operate with
a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
reading or writing outside the buffer bounds, use 32-bit accesses where
possible and apply memcpy for any remaining bytes

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7cec8c77288ee24dbee8b18338aa1eb..6a11437fee47bd1d19354e983d4a561a4356b08d 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -22,4 +22,41 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req);
 void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
+
+/**
+ * i3c_writel_fifo - Write data buffer to 32bit FIFO
+ * @addr: FIFO Address to write to
+ * @buf: Pointer to the data bytes to write
+ * @nbytes: Number of bytes to write
+ */
+static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
+				   int nbytes)
+{
+	writesl(addr, buf, nbytes / 4);
+	if (nbytes & 3) {
+		u32 tmp = 0;
+
+		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
+		writel(tmp, addr);
+	}
+}
+
+/**
+ * i3c_readl_fifo - Read data buffer from 32bit FIFO
+ * @addr: FIFO Address to read from
+ * @buf: Pointer to the buffer to store read bytes
+ * @nbytes: Number of bytes to read
+ */
+static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
+				  int nbytes)
+{
+	readsl(addr, buf, nbytes / 4);
+	if (nbytes & 3) {
+		u32 tmp;
+
+		tmp = readl(addr);
+		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
+	}
+}
+
 #endif /* I3C_INTERNAL_H */

-- 
2.49.0

