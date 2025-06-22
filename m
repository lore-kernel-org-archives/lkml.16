Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171CD7261C;
	Sun, 22 Jun 2025 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750612665; cv=none; b=ZApE7rlaYaOOqEm4Ed9OkBvwzrFXRrm2ECxG5xjLoEamWKMqEvvmw5n0x+MRq79UeHKAyP9kxpCanZLuS9q1qN2EA03dgfTgOfMA31BuPHS283EiUPEGBmHhRXE9Te3nYjfP/udnRGcPoya8ENi/l8YrvNf6Tt+TnW/gMiGUkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750612665; c=relaxed/simple;
	bh=xmnmpxYNdE/NUpzzxs6hTIqfsXmG+ffvuatXkcIZFzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rv7DL9jQBQ4PfzWdf1w5jgl/Nl1L8LAag4Fiw/W7sZZFWhq0/UE+LDytVw7vSDEWFrBBrg2ym2SVeAqPiQ7yLhSZAgb1x7iGj44GlTb6cNf7Nn5ysqcr6/UMJtw19MrB/SdneXA+ggvSYnak6mxttyy3qmWqnC+oj06NGN+FfPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HT/jQHUm; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HT/jQHUm"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MFNABu014190;
	Sun, 22 Jun 2025 17:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=dcwPDEPIw8nEIB5octF8nzdPM8tFc
	OOV+wIglE8yHMs=; b=HT/jQHUmJ5VhlDIv6SQxpUQlcM1DPrkqhjMt70wOqy1ar
	gaiZHJaLPh2cXsi1uW8053XSv5m8snaZtHZdJw6WT1E8xhtivt+qzghbSGCe+9B0
	fKd+oy9E/SbUksyZ5TMrAwEI0T/vK+qXLDiy/A5lUuPdY0/tklWGiBO8ByjRggrh
	47w8SkuQjS55jbMGN9vVvI4NnX3El17KWZuoOfVsfGjFrTF9HbCBzrrNfOZn16XC
	EJAsrc0+CgYZ6CHUa9qEdE1wIJwi7iK+43pHeM6XXoeKPgyoqmCoFXH/OH7DhjDt
	FQkV/nvJJW+pRXhjaODzFRkSxnKStPmd38LXn46Ww==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5g60b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 17:17:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCABWG024183;
	Sun, 22 Jun 2025 17:17:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehknkj7m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 17:17:36 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MHHZKc002548;
	Sun, 22 Jun 2025 17:17:35 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehknkj7c-1;
	Sun, 22 Jun 2025 17:17:35 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] thunderbolt: Fix redundant Bit masking of ADP_DP_CS_1_AUX_RX_HOPID_MASK
Date: Sun, 22 Jun 2025 10:17:02 -0700
Message-ID: <20250622171705.4148948-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506220109
X-Proofpoint-GUID: JtTvwIgdxc-VAdX0Aw1zkmj3d25lX-5d
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=68583ab1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=mMPtaQJRcDU99zQWy00A:9 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDExMCBTYWx0ZWRfX7oOGX2jg7h+2 NVYW4PLz7Qe3CYqagBdHlJHfskntQQUYcxdLZ2M27pe2dzpc4WYz07Pd5pJrCwwZW0j2ijBI9yR /x1KEvTFChk4ihZtPAw9NztlHWlplQ2WenG7p9c1+KDYxh/sXTxAqX5K4FBtmIAlG8WOep4ZZ9m
 1/0TeVi8DmsKIAuWV41CF4oft/bPUxLyD9n6gT4H5AN8/6zp1rGBYfQT+z02SHvB3k/5S5t8MXl lhOV5Y4qis6vCO669Xurrk5SxxUQgzAQQQp+LZ6Px8MfDbZG3yhBiW03/QBkCyZXMykoLH17znM y4lIQLaSzfYM6BLpbg14q+V/qjockB4jABYiGduMPaUZm9IAuIqgIBWtvxfzoLWOYk0NMNzL79P
 rhOGeFZFMf5m+KKBDBWb/dFvYArRcVaJkWWURggksNLKWRs2m4bzWA1v10w95DUiyeG3EZIv
X-Proofpoint-ORIG-GUID: JtTvwIgdxc-VAdX0Aw1zkmj3d25lX-5d

The tb_dp_port_set_hops() function was incorrectly clearing
ADP_DP_CS_1_AUX_RX_HOPID_MASK twice.
According to the function's purpose, it should clear both TX and RX AUX
hop ID fields.
Replace the first instance with ADP_DP_CS_1_AUX_TX_HOPID_MASK to ensure
proper configuration of both AUX directions.

Fixes: 98176380cbe5 ("thunderbolt: Convert DP adapter register names to follow the USB4 spec")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 28febb95f8fa1..36918a656f456 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1450,7 +1450,7 @@ int tb_dp_port_set_hops(struct tb_port *port, unsigned int video,
 		return ret;
 
 	data[0] &= ~ADP_DP_CS_0_VIDEO_HOPID_MASK;
-	data[1] &= ~ADP_DP_CS_1_AUX_RX_HOPID_MASK;
+	data[1] &= ~ADP_DP_CS_1_AUX_TX_HOPID_MASK;
 	data[1] &= ~ADP_DP_CS_1_AUX_RX_HOPID_MASK;
 
 	data[0] |= (video << ADP_DP_CS_0_VIDEO_HOPID_SHIFT) &
-- 
2.46.0

