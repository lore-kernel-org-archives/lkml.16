Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF7267AF2
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749995545; cv=none; b=XrkH031UetWPiHjwZ+3u1xPJpv2x+CwgEJRNjB/5XP1pSjg5GVVCNsdhILpDJKMCyFI6jKBiN80OKW9XPtCl0Em5LgjPlNDfewth5CVlflXibhmmVFbQxRlDm3sRQXSsXfKRPqHvE61NVbxWP4FqH6W9seB7k0shLuJ1knYWuEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749995545; c=relaxed/simple;
	bh=Pgy5rToWsLv5Cdzd/TiuQ9c1VLUYVj2nhkTpJIMNXjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hrkh7vldK6524aahSHP/X3czKqIWhhozAuPPFDpdDBBtNsE1arO5uSs7haAftc/lv0yivKnI4oknm0Nc27Ono5K9p2FeaCamIjpKcZ/T6O2e4tdLjRhitCtF0VK7tD1elFaGy7MTH+k7AXX2/8h8MPzBS4G2NoIa50r8cQV034I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MdJ7wGu/; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MdJ7wGu/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FApYGx011160;
	Sun, 15 Jun 2025 13:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=RukXu
	zcNyIJaD0pVXNmGXQuxnS/JaP8FRJTyBNNG6b8=; b=MdJ7wGu/Iu0ZcH/Pdjgwa
	IrOtruPkINgPjj2z1v/eg/woGzZmo47IORDOBz2XRLDUF9qmQC3JgGCocaQxDeSF
	rbp5xBGHi/hMrYVdaJysi9uTEy/8Z2dIe4WMEtS/B+b8HLvvmO9DKrtcovm397Tl
	ys04p2zYYvRKMsBI0FTfLVA0SFUezBr/IitZpXmCTuAnN0YWLh2pPfIKzYMQsumL
	muohBfxjLeR0bxedofRtuFnkRy7SX3Ll/t0MzKLus4CsJMwbs2dm50yEMeFoOLiC
	8ADOJU2nKjG3w7LCaeZzKMbb0HdVJwLYlQMp3sVSLtogLxSIdABTHkJKs6hJCj6U
	w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4h66e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 13:52:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55FBEEix032069;
	Sun, 15 Jun 2025 13:52:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh72v2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 13:52:19 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55FDqJbk010140;
	Sun, 15 Jun 2025 13:52:19 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 478yh72v1h-2;
	Sun, 15 Jun 2025 13:52:19 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: srini@kernel.org, linux-kernel@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com
Subject: [PATCH 2/2] nvmem: core: Fix typos in comments and MODULE_AUTHOR strings
Date: Sun, 15 Jun 2025 06:52:08 -0700
Message-ID: <20250615135212.1356469-2-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
References: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506150103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDEwMyBTYWx0ZWRfX+Ndnt5EP8n8T lD1Q2+tLGFNVILUveoNg+y8EV3KipdIMEgaariJAmzDTmN8bMuo8yGpkNs1dPcQ/Sge2EVpD1tD KcbzwVYQHJ+4hgzYSgbOQ/+9I/UauQZISCiuOMbpkuJJ46stbzwel2kvmNZt6al1fZzxo52OZCP
 G82W9SRc3e0vmQ+Rix0yObJ/9k8Qh8R3D7C5k9e/eikL9v1bXfbzfRWNHX4xqh9cAXC93xboS/b 26JwAqtUeZF2zPeRlr5IKXtx8t0w7Q73BMqt2d3CRwt6d4YknK7AOab4k4ZQTG7MgdojLl/5l7+ 2qm68iVvs7o7hNswZk/GGN1/+vgBRsWOIv9HHFr7fSIqGCKuK+WWpGGTXuvHu6w0w/OCMYn2u95
 EkgiyE4wqQwOQVploEVpHdTtHSOf1Dt73gd2KkR8cFKP54eNeMLjGVfS69MizF735xl6Hzj1
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=684ed014 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=KKAkSRfTAAAA:8 a=uP1ucDPQAAAA:8 a=5ztq51SMrzK_ac4FWY8A:9
 a=cvBusfyB2V15izCimMoJ:22 a=9a9ggB8z3XFZH39hjkD6:22
X-Proofpoint-GUID: dHopcPRjaqgfGoRsAD4rPROyeP-yeuB7
X-Proofpoint-ORIG-GUID: dHopcPRjaqgfGoRsAD4rPROyeP-yeuB7

This patch fixes minor typo issues for nvmem-core.c:
 Corrects "form" to "from" in multiple function descriptions.
 Fixes missing closing angle brackets in MODULE_AUTHOR entries.

These changes improve readability and formatting consistency.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/nvmem/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 3203524ad49f..d0b956133c61 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1264,7 +1264,7 @@ void nvmem_device_put(struct nvmem_device *nvmem)
 EXPORT_SYMBOL_GPL(nvmem_device_put);
 
 /**
- * devm_nvmem_device_get() - Get nvmem device of device form a given id
+ * devm_nvmem_device_get() - Get nvmem device of device from a given id
  *
  * @dev: Device that requests the nvmem device.
  * @id: name id for the requested nvmem device.
@@ -1492,7 +1492,7 @@ EXPORT_SYMBOL_GPL(of_nvmem_cell_get);
 #endif
 
 /**
- * nvmem_cell_get() - Get nvmem cell of device form a given cell name
+ * nvmem_cell_get() - Get nvmem cell of device from a given cell name
  *
  * @dev: Device that requests the nvmem cell.
  * @id: nvmem cell name to get (this corresponds with the name from the
@@ -1527,7 +1527,7 @@ static void devm_nvmem_cell_release(struct device *dev, void *res)
 }
 
 /**
- * devm_nvmem_cell_get() - Get nvmem cell of device form a given id
+ * devm_nvmem_cell_get() - Get nvmem cell of device from a given id
  *
  * @dev: Device that requests the nvmem cell.
  * @id: nvmem cell name id to get.
@@ -2195,6 +2195,6 @@ static void __exit nvmem_exit(void)
 subsys_initcall(nvmem_init);
 module_exit(nvmem_exit);
 
-MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org");
-MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com");
+MODULE_AUTHOR("Srinivas Kandagatla <srinivas.kandagatla@linaro.org>");
+MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
 MODULE_DESCRIPTION("nvmem Driver Core");
-- 
2.47.1

