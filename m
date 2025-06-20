Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED2F2D3A6E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441047; cv=none; b=ZJUUlM82iA3xOkTWCDfbeNnipZ6wYZbj7Bpxqq1+IuM4jJ0FRtFs7x6ujxLwhHBzp9tkiMX49ShI6gX8iE5mhSjSi79pjsgaO/Z2fuGPww9Xzh9UlwwMSryJz77EgbwK0+KsZgI6+u9saXDZo72bb8DVHYcl8p1Bu6rYfWqcnH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441047; c=relaxed/simple;
	bh=HEHqQQ7md4AtnD1WNTKFI9O4LORm/dcbnxJwhQIFoMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JUkfi+3z7K6p1yFedKQtm5P0iHjOXEpevpIVKDjTpyRGVIAjQiStTe7n4A9zZUDUqqqlGu0TvJtR/HqfsieTF3BlRsKXM3J2C3xpWL24FmtmIrlxlHvmAb1Oz4W2sFjVtA6mx6+ptAiw2XPiMkgGFWDjyyGn1yWHy25LvZwXwB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fQ3l7e4g; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fQ3l7e4g"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KF6rR4002421;
	Fri, 20 Jun 2025 13:37:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RldU0
	ApsscJBkOsNIbr0aQ4uVjATZO+7iODdIhAK34M=; b=fQ3l7e4gxyPX+bgIdqVq+
	1mBc04cMvcSC/SZ4D56A/DLwxQRR+qdpYkPFQiTVmapq0UalzGYEij1COU/grBtC
	29mF0DsB4N7J/Io7+kG9Z/J1NZ48T2NEWW9edPF2ksDcHtNrCLHdsHsSYVNHscsj
	ewym8j/oqtNxlmspCk7BWOnGSZuXTgReM3yjwZ9lYuyQCevwdE/+sDAmHKgMwEyu
	AjDegcsMKPRrHuy+klpdq0YLLxMpYmArZ53CHfxvR2DDqNTFM04Rr3J9+SzXkOKK
	hFUbKjHCbdSMoKMyqlSiTxqCM4EQ7QH9r8RUwMBcItdzvRAwYm/u4B1iP7WriESR
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47d3bntqag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 13:37:17 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55KHbGFB008685
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jun 2025 13:37:16 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 20 Jun
 2025 13:37:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Jun 2025 13:37:16 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55KHb0Iq030676;
	Fri, 20 Jun 2025 13:37:04 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Fri, 20 Jun 2025 18:55:00 +0200
Subject: [PATCH 2/3] i3c: master: cdns: Use i3c_master_writesl and
 i3c_master_readsl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250620-i3c-writesl-readsl-v1-2-e0aa1c014dff@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750438498; l=2002;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=HEHqQQ7md4AtnD1WNTKFI9O4LORm/dcbnxJwhQIFoMA=;
 b=c0aVDhL8Nh127EsCHwm2w9l5CSYzxla9ItyGfLOtB6WXpUw54tBogpQrEl5ViEudhL2aGW9Td
 d0DKvr2qlb7AOYzfCWXPYxJJSwSzgsBVKvZnC1qQYGccmfDPTN4a0Vv
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mNXToBSh2MktLd6_M9tcFYqsNKPdouM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNCBTYWx0ZWRfXyq1g304CgMWr
 2K9P7c/4CiODmXG0ZwuB9M511xAZ+JPkzaYOeHbAybNkmOSThlxmJdqYTRorjJaxN05VLvDaGRK
 mLbktTcD0x15LNDRuBIOWVGuNl2nwUChpNpQsK94FrntUZTwK8iI++7CVCtZgN7hk8CDtJ21PNd
 JY0ZYD2UbyzKbcFB0SKcbzMaWKB5vkfp+uIaCLmDtbUezq/pABHkDxEnFjsNxJOW9GTVsS10njR
 0+8VrueacdN2gi91oer1FTjpgEMVOrk/lilwuCLk/l0jEfAM2hP+mOv2RotDI4ObMmBv5aue4nO
 sGZHFFZDCuUFKhkFvx++DcB89KDzPJziJ2IMHVZp8q+Fz+076nb72zzV0eIY97zmGjztPQOFtSh
 LyJUu18TRQvb5VNVBUvBw7nkprIacxTaAruQj9MEs4jduaiLm9DUcNaILzMIh3qrWwCxL2aH
X-Authority-Analysis: v=2.4 cv=c+irQQ9l c=1 sm=1 tr=0 ts=68559c4d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=-g-jYOOAgZ6Gv6mRHeUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: mNXToBSh2MktLd6_M9tcFYqsNKPdouM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=693 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200124

Use the inline write/read methods common to controllers that have a
bus width of 32-bits.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654954ed1e37337754e45fddbbbf68e..6775751144ae86c1795abf45ceede17e1961bb74 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -427,25 +427,13 @@ to_cdns_i3c_master(struct i3c_master_controller *master)
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
+	i3c_master_writesl(master->regs + TX_FIFO, bytes, nbytes);
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
+	i3c_master_readsl(master->regs + RX_FIFO, bytes, nbytes);
 }
 
 static bool cdns_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
@@ -1330,12 +1318,7 @@ static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 	buf = slot->data;
 
 	nbytes = IBIR_XFER_BYTES(ibir);
-	readsl(master->regs + IBI_DATA_FIFO, buf, nbytes / 4);
-	if (nbytes % 3) {
-		u32 tmp = __raw_readl(master->regs + IBI_DATA_FIFO);
-
-		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
-	}
+	i3c_master_readsl(master->regs + IBI_DATA_FIFO, buf, nbytes);
 
 	slot->len = min_t(unsigned int, IBIR_XFER_BYTES(ibir),
 			  dev->ibi->max_payload_len);

-- 
2.49.0


