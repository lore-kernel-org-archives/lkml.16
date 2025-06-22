Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2019309C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584105; cv=none; b=jEWDpTqiH0Tv9cO46DfRLVEB+hkrK73cc+q9ZhN50cLi6YpNo4ZaecYPfrmAwyL59T4hKqWHk0saBQsuCp6tDzOiN/KD5dADrwy6u+A+SuglqSoQ1mc5Dl+9uDVSSE/GxG2kWqa3JwZskWXNhqnKyXwThoLXhMKd0woujklXres=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584105; c=relaxed/simple;
	bh=Dva/GbAbWuDLMMK+tDe/4bHG1TBRDryfMCpLVW9ikz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BYC0IoVUtyuGubJwKQiT4bL3a5inpzIgqnUDS5wos7nJ5WtnJ1nzt89KkSiZN+XAGFj9YpDURRAU53oiliQUN9E2AEG963cUHulsiwxwGC2KuJaeW9F1ncrAyZAZcakNtkDG852rjbNnMapV8ccOaH6JJiUJXXunbbbQQXGuweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=medRs/qL; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="medRs/qL"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M73Dsj024613;
	Sun, 22 Jun 2025 05:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=11/PY
	CO3hBt0DXZSESexUszH2l715ialGwaHJ+BPMeg=; b=medRs/qLuL+LV5bwrEHPr
	RjuF+JNp4vxjN3p8DlK7kxvXCalYWWzTflSnhjkU7qun+AUAv1/nU/JL19z65wZK
	5SeSqxTEjvQRGB1R9IFcmaTel89afSxFyZGbbZYB2RK4GoTf7UXg+42E2d3cQ0p5
	UZ1uE6ee39IEAJSqkoeWfF5p5eOJcelw+me61aV70yzz78xMdEXM2+jNajUauDEL
	FjVXLa7RYf97OOwWDnPXZlaChJBfMKiG6Ej4pxgNK1foDc6yNRTv9Bch5FPAOzVP
	n/B1oPpu6BQO9Px5Gq2Te0rByEA63XAmh3V7iU1BL2K0mdPAd+NlGSeSFG7Zlhoj
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47ed3qga57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 05:21:34 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55M9LXGF058699
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Jun 2025 05:21:33 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 05:21:33 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 22 Jun 2025 05:21:33 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 22 Jun 2025 05:21:33 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55M9LHqS002302;
	Sun, 22 Jun 2025 05:21:21 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Sun, 22 Jun 2025 11:18:58 +0200
Subject: [PATCH v2 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750583937; l=1919;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=Dva/GbAbWuDLMMK+tDe/4bHG1TBRDryfMCpLVW9ikz0=;
 b=Zu7VYTthOqrCyBGQSr6n7eFUw1aIAaTBS+zk7LcsICJ/94C/Kmd2aBuZbto2yLXWxRhr/IXn1
 NV+x92LgwP/B4Fnuz8Bq8l9nWehnQiHSZoFckMHNpfwJiSyvTPB/VPs
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=HZYUTjE8 c=1 sm=1 tr=0 ts=6857cb1e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=QMVJh2PuZ69kPaAn0y8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gSUpFxPmM7AQcT5HLhgxOrUAXQFYQg7I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1NSBTYWx0ZWRfXyrKTB3LrpQHA
 tsCTERBYcOmqqzrOBtSyROZdnTO4EDWiVlotdLH4sG8g8e0XihVcK4L0rRInMlIDV/B6dHIKZy6
 iygj47hp/3brmm86HFGOZZ3EzFOahl3mxDCzjYvVQDo/3RE30nDZLSWCbQ1ryoC2S4ZerR+sd0C
 VNSHMLvfSj63HDTe4Mj4wk0lIbBoPjjKiKt7h2uy296RHSqW82tiQqpILwdEGqSmSFg5Nj3FygA
 r/KhK6/nzo8BQ3pEv9nh9L0vScAllSvZvAV4a/Ipmr/+Woo9UQfrpctmdwRzKK+g5G060cSiOIe
 bzuy6sI3E6//o0uKV7uxWt4lNgOtx3kR4vQDf4485ayrdNpXHB4FAPmvT9OrI4T680OyTnsi/vN
 gGuhNDfZ413aNFJ41BwWp6JBP6++HpdGMjaXqTRQo5aJAqTcDUX0djRbOjyXZTd35IJhou+Q
X-Proofpoint-ORIG-GUID: gSUpFxPmM7AQcT5HLhgxOrUAXQFYQg7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=741 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506220055

The i3c abstraction excepts u8 buffers, but some controllers have a bus
width of 32-bits and don't support flagging valid bytes, so it is
required to read/write long words and to use memcpy on the remainder of
the number of bytes by 32-bits to not write/read outside the buffer
bounds.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7cec8c77288ee24dbee8b18338aa1eb..88887b12122efafac81bcfdd093d943259e13a08 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -22,4 +22,41 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
 			       const struct i3c_ibi_setup *req);
 void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
+
+/**
+ * i3c_master_writesl- Write bytes to long memory region from byte array
+ * @addr: Register to write to
+ * @bytes: Pointer to the data bytes to write
+ * @nbytes: Number of bytes to write
+ */
+static inline void i3c_writel_fifo(void __iomem *addr, const void *bytes,
+				   int nbytes)
+{
+	writesl(addr, bytes, nbytes / 4);
+	if (nbytes & 3) {
+		u32 tmp = 0;
+
+		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
+		writel(tmp, addr);
+	}
+}
+
+/**
+ * i3c_master_readsl - Read bytes from long memory region to byte array
+ * @addr: Register to read from
+ * @bytes: Pointer to the buffer to store read bytes
+ * @nbytes: Number of bytes to read
+ */
+static inline void i3c_readl_fifo(const void __iomem *addr, void *bytes,
+				  int nbytes)
+{
+	readsl(addr, bytes, nbytes / 4);
+	if (nbytes & 3) {
+		u32 tmp;
+
+		tmp = readl(addr);
+		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
+	}
+}
+
 #endif /* I3C_INTERNAL_H */

-- 
2.49.0


