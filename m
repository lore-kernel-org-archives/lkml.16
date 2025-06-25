Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514E21DF99C;
	Wed, 25 Jun 2025 04:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825062; cv=none; b=Ad+BSw+Fe98B4pAf2fEaeev+tfkpnwghH7kNO4m7kXbouF35dew8YKbMeRgK6LXUgTq0bGsob2wzAxb63SS6eMvLaIGG0Gn0iRvqScfm2rYRh67oMy0xwZI4PfL5hfK4Bg1zbAP4mP3R7YJyWqTtYxGNyC6G/HSLlk+qKz3NM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825062; c=relaxed/simple;
	bh=WaJG7fxZK60LRj2I0OegX5/Geds4wssue7zeBO7ztoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qaOkeawZfnZqiW3k4cNLCLoGYBxEwWm4JhRiCZptMzeeuw4/8/kVPxvphkHmcpmVExUXFP7n0jkJCStvJ26H7wn7SUa3NsdIVfSfXwNWDA/ZpbqJ2hy7U5vIDi9yfquQFR4CmZYt2R9Nlh8GGCs4eZNzwfnx2MUV/f9xIK4Y2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rN20owLt; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rN20owLt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMia1C012705;
	Wed, 25 Jun 2025 04:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=yvq1h
	WHBDno53FsR1afZbBZCFVS049qax8wAHdWQ3SI=; b=rN20owLtBbR4o9PVjydiz
	htl/pAJAjbzA4/uQudQwz5ghCeVp+Y3QSFdhvPwHW/95cWGHOBQu84ycsVBVC6zx
	y+Te7TiH8HxTV/a4qyPYKBXpMAX63ddaTiSuFXYrZKC5BYWJ4XEBNt8gwQuf+zdW
	A8iTGHHF8OhMPRcR5WpSxkYfloEpGNaUTIIAghr/Rv+ZaiarjwxJ4TJU71VJ22Ha
	a65W6/tAFgeOK+DqZjrfNV6ugsUbCmiAKoZdS+AtQUwJrCjmiNuREY6NzzxD/Bsu
	T/GqOrV2RiaynMujhCU3z0Razx+OwyyAlVPTRvX/wEWAdhK7IA2/eHFQf2CuVlJF
	A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumnfr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1Z36q024414;
	Wed, 25 Jun 2025 04:17:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrhfhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:22 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P4HGqg029022;
	Wed, 25 Jun 2025 04:17:22 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehkrhfem-5;
	Wed, 25 Jun 2025 04:17:22 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, rdunlap@infradead.org, kbusch@kernel.org,
        axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
        nilay@linux.ibm.com, corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] nvme: Fix typo in status code constant for self-test in progress
Date: Tue, 24 Jun 2025 21:16:33 -0700
Message-ID: <20250625041643.174110-5-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
References: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250029
X-Proofpoint-ORIG-GUID: l7oEuo7l1ztBQNgdxSvX8eNsLp-fXSbo
X-Proofpoint-GUID: l7oEuo7l1ztBQNgdxSvX8eNsLp-fXSbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAyOSBTYWx0ZWRfXxoDXhU0hKznN e6brteV+ZitTWd0TJMuwh72DhfBOWrqlqEGohwSSFy+FJoiiNFpkA3GFiONzWerjzzlsmXfjG5W z93AHH5EXnGAckkvvAjXAWHJWuS01BFnzo6P3nKYh1XKthXslfgrxJiFHm4xXKCZcH60ZaiFbkk
 KEjsysunmLRMBxI60y/qhNYREhrE57T8x/fjQZtmFjhvh5m6AapQSQkKCHasndzgND2bmIZt/TM eZXF8CtQoN/F0D4SocfPdT3I92befCW6OVlKwRrI5C55c++IVdgqKyQaRUVnLphI+i9V5zFAfXc O2bENS+26YL76GV2ItV3nhXIIfxVe4pTOemxY824sW8A6EEtRbYdispxuXL0WBwl1dTr0QopeIp
 UdmMyArQ/pcL5CddXlwM4FB9ghVTcsU7kSgK2TVeuE22nb01EJ08BFjMtInB52XYOBkaU3BE
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685b7853 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=JPcgd-ljN0tfNaZuDOwA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13207

Corrected a typo error in the NVMe status code constant from
NVME_SC_SELT_TEST_IN_PROGRESS to NVME_SC_SELF_TEST_IN_PROGRESS to
accurately reflect its meaning.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2
no changes only added Reviewed-by
---
 drivers/nvme/host/constants.c | 4 ++--
 include/linux/nvme.h          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/constants.c b/drivers/nvme/host/constants.c
index 1a0058be58210..dc90df9e13a21 100644
--- a/drivers/nvme/host/constants.c
+++ b/drivers/nvme/host/constants.c
@@ -133,7 +133,7 @@ static const char * const nvme_statuses[] = {
 	[NVME_SC_NS_NOT_ATTACHED] = "Namespace Not Attached",
 	[NVME_SC_THIN_PROV_NOT_SUPP] = "Thin Provisioning Not Supported",
 	[NVME_SC_CTRL_LIST_INVALID] = "Controller List Invalid",
-	[NVME_SC_SELT_TEST_IN_PROGRESS] = "Device Self-test In Progress",
+	[NVME_SC_SELF_TEST_IN_PROGRESS] = "Device Self-test In Progress",
 	[NVME_SC_BP_WRITE_PROHIBITED] = "Boot Partition Write Prohibited",
 	[NVME_SC_CTRL_ID_INVALID] = "Invalid Controller Identifier",
 	[NVME_SC_SEC_CTRL_STATE_INVALID] = "Invalid Secondary Controller State",
@@ -145,7 +145,7 @@ static const char * const nvme_statuses[] = {
 	[NVME_SC_BAD_ATTRIBUTES] = "Conflicting Attributes",
 	[NVME_SC_INVALID_PI] = "Invalid Protection Information",
 	[NVME_SC_READ_ONLY] = "Attempted Write to Read Only Range",
-	[NVME_SC_CMD_SIZE_LIM_EXCEEDED	] = "Command Size Limits Exceeded",
+	[NVME_SC_CMD_SIZE_LIM_EXCEEDED] = "Command Size Limits Exceeded",
 	[NVME_SC_ZONE_BOUNDARY_ERROR] = "Zoned Boundary Error",
 	[NVME_SC_ZONE_FULL] = "Zone Is Full",
 	[NVME_SC_ZONE_READ_ONLY] = "Zone Is Read Only",
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index b65a1b9f2116c..655d194f8e722 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -2155,7 +2155,7 @@ enum {
 	NVME_SC_NS_NOT_ATTACHED		= 0x11a,
 	NVME_SC_THIN_PROV_NOT_SUPP	= 0x11b,
 	NVME_SC_CTRL_LIST_INVALID	= 0x11c,
-	NVME_SC_SELT_TEST_IN_PROGRESS	= 0x11d,
+	NVME_SC_SELF_TEST_IN_PROGRESS	= 0x11d,
 	NVME_SC_BP_WRITE_PROHIBITED	= 0x11e,
 	NVME_SC_CTRL_ID_INVALID		= 0x11f,
 	NVME_SC_SEC_CTRL_STATE_INVALID	= 0x120,
-- 
2.46.0

