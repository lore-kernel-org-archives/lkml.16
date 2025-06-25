Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E572307490;
	Wed, 25 Jun 2025 04:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825058; cv=none; b=HrpNpVm3kZ67ue5es1q02qIF477Vk/zUXXEtMWJZ9TB3xtf4NjBz8RwwKiWkume6UMKNAlET6gibDWP4erjCFn8RDlMJUGj1o1boaRERsxOPtfN+Ycw2o6WKjLqPfg5ELzRDQQbj9oZk/7hxUJRZzcXGLDngIBZW2lh5t3RRA8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825058; c=relaxed/simple;
	bh=oBifa7HgdAmU0P8c+iv7KaLVhafdKxDD99mndx0l1Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj1ug7kSkquynTpMw31g9OJ8QfWUgvgiZjKN5lo/lGCciirIitv28P5eAlZeFKZWLxf3uKBRSZjlycGN/3oPThjYHzJI/8dfWdQ7RwvLTugNvYO7AG2vTmEsGS/LFeYsWdi7xuzTcg7O6C2C1Vi8NHLWB7bdbZvDjQhhKi4k9mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hRIjSz28; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hRIjSz28"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMiveR005149;
	Wed, 25 Jun 2025 04:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=SvGZh
	iUYui8KbGx47ihhr8pF1NSZfJJcOgsix8Qx1ac=; b=hRIjSz28X8/wKkPsTbiT3
	VmpkS0XbElHxJCs3uCw4e5vDEapShUg5PRsxGqV/B6k0rRFneN7B+SiETIOCkFkY
	x3eeAEVLjW07zG7bypnRz2j7Wz5xGXHLRnCu9YXSg7ZarYanyS/68yPDQ6bH4X70
	vMS/yF9DGNX7DAERQVSA67JOc2x4px//8D4xIQspp/JyTtvG7M5qKoEe/NkBMbK3
	LXzXmi3n6bMH4n4CHWRRtaYhKZy2EpHaOLtL7UW6UbbHXCfDO8IdRsqeMlWGUiGD
	naCkpIX5RaTJsZQ+mOPQUSrI8+TpNURk7Dly70rFHgj0/gnXS/PvEAnE3lJWAkf7
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7dd07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1fYqV024212;
	Wed, 25 Jun 2025 04:17:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrhfgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:21 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P4HGqe029022;
	Wed, 25 Jun 2025 04:17:20 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehkrhfem-4;
	Wed, 25 Jun 2025 04:17:20 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, rdunlap@infradead.org, kbusch@kernel.org,
        axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
        nilay@linux.ibm.com, corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] nvmet: Remove redundant assignment of error code in nvmet_ns_enable()
Date: Tue, 24 Jun 2025 21:16:32 -0700
Message-ID: <20250625041643.174110-4-alok.a.tiwari@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMCBTYWx0ZWRfX75lhb/iGGSBV 19j0x2GsWJyN4FSuaQORWyUI8Vt2ryiyeKXEw9TNot7NrKTAXvEDJP60p+7kf6/qGY7ozI/vLU8 hLGybdKgx8Kdmi3+YVMuT/O01uA15XFxaqIsMi8MzILKZTsdawlEQ0dMmur9PbIauRv/qinaJ8e
 0Btr72QgdJIqmhU+mgnMLhzZQ2Ea+ZIwo67YL2jYnxZgSOz9e4a2b/23y1+VcqEbO2WkiABNAN7 /epkErt26oUAyLJ8KNRYCRulQmQ2IAzfynHL2yXqyYZVXGE3nlyuxXDyzdHTzv54ratAp/qEQ+i QN5Jjr8Bzsu7/dzvt654xCGqq0SxR43/XJXqDDU+9TnT9oNCzSLuBRyzcDbJMitDDS12ANMRfQV
 oK2/LAXOwtWWkL9p8617A1Nf/n+w/P6TrpbJx7kYD7/xZ3bxm74WgCYP7GGwOK4jPQx0kTt+
X-Proofpoint-GUID: L7LC2VHGr2DSRg6mxJ2BMUYGzwtydKYa
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685b7852 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=hQNXMjqaqMWDSZxnGksA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13207
X-Proofpoint-ORIG-GUID: L7LC2VHGr2DSRg6mxJ2BMUYGzwtydKYa

removing the unnecessary ret = -EMFILE; assignment since it is
immediately overwritten by the result of nvmet_bdev_ns_enable()
The initial value(-EMFILE) is redundant because it has no effect
on the code logic or outcome.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2
no changes only added Reviewed-by
---
 drivers/nvme/target/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 175c5b6d4dd58..884286f90688a 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -581,8 +581,6 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
 	if (ns->enabled)
 		goto out_unlock;
 
-	ret = -EMFILE;
-
 	ret = nvmet_bdev_ns_enable(ns);
 	if (ret == -ENOTBLK)
 		ret = nvmet_file_ns_enable(ns);
-- 
2.46.0

