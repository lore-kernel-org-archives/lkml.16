Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3B31E520D;
	Mon, 23 Jun 2025 06:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660893; cv=none; b=PpGfj2bvMxjIsXvjA3lpU2CFYrBMNPMdYZK4CC0PI8h0j30xCWDUrN9kvxzFuRwz2HuTPnk8Ujw7WwpV2ayUyE/pRgPzK61q9Y6Ro5vDzL8wc46peH5bvtLg721HAcxYPFoMp3uMkPCNMAdp+96Y68xTVBeUwzw31oVdwV2jjV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660893; c=relaxed/simple;
	bh=Bh8zJoSzitJzgrrl2hvmxkah85zlAPrmB0CgiRoF9UM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHjvmXTR6nt55gx2gQpWC4LLinXyUQuTVieD4pj9WF/mP1FuinvUCLGthHfM47k5eNQ0sqfP1h2QoEeSGt+h/M4p092T0M33SqHsqhmgFrkwJxJ/ZdykSgMAFwp28H7WrIQ0uI2VaLeIiJsoyw1tijT2Kh+gCt239nUqVWgkdOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F0jmll2U; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F0jmll2U"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0SfFZ017235;
	Mon, 23 Jun 2025 06:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=YeAqG
	FD/xlXxbKWQdmK2afim53mngK1HgVKCLss+cJE=; b=F0jmll2UlwZjKGWtK2e7Q
	j0yuIPhG5FMD32loIVNYBbC6ozJ/OmiPCP9r4s3OIafIT7FtNwBbfcBY/QiHOKlY
	Y8/Z3REKY3xTyzHPQbjAMRUKmnDoS9T3I7CIon5s5HEAS24NiSSnMTFm1p09qob9
	U95nEIpawSCDUmO/lwkOrRIIrpRQ3wv5Cro6JQfwxe9PMpwxVAujvNeBuYkD7rhx
	KtefKrRWsDbdfDxZL3R6i8vnHu6dof+tM3um50h//OUwfe0X06j0xhwEB+WoA2+p
	OfUHmpmugFq58xw1iZE22Bntip6phqK4XgKs8cAs0pDyf0xmdno1e5LGVpSDGqNd
	Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y20gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 06:41:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4kieW028823;
	Mon, 23 Jun 2025 06:41:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpnfduq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 06:41:12 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55N6fAju006422;
	Mon, 23 Jun 2025 06:41:12 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehpnfdt5-3;
	Mon, 23 Jun 2025 06:41:12 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, kbusch@kernel.org, axboe@kernel.dk,
        hch@lst.de, sagi@grimberg.me, kch@nvidia.com, nilay@linux.ibm.com,
        corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] nvmet: Remove redundant assignment of error code in nvmet_ns_enable()
Date: Sun, 22 Jun 2025 23:40:21 -0700
Message-ID: <20250623064036.4187788-4-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
References: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230038
X-Proofpoint-ORIG-GUID: H2xUzxREbbDoLv2D2P7rMubS6q-x5DV_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzOCBTYWx0ZWRfXz5dJ+iFtdUsQ SuZU4GAsiKOiLnzjVarCnsG3+dvxdUisoLQUxt+OjLdV+ol4VmXIPq6VaM2pbFufiUjIpxj+fg7 mpmGbD3X35NAjIwnURuUmjFGD/clEql5kBWKe/AkWXhV9f9NFPasdYSl3TpI9OJnp17cjoifnfA
 TIsu3TAwJSvMfuv5VP0v4Rs1j13j5pH1G6XXl8hrk0ZxfvJyZrtva1AfqCKYpPwC/UnUuI6tl+y o9Li/Ed9a0BaAr6+dfTE/Bl/zGWZmuEHBI9opvgrP7GeXNNJzbiU7XPL1FBIU4xgaxknS07pfoJ 561FKGeuFs1ccTZoa7agLmUvXNQ5TlFLEfXt1M/SgwEx7q8E6ZBWDwKPRvPTOCdljr+h6iwm5Jj
 4FuxC2n68lrMPJPdQ+hlYnIA5PJd/tZJwTGQmVsOPMKRmva0wVFP5ShdACoaSF3zfNyJMInm
X-Proofpoint-GUID: H2xUzxREbbDoLv2D2P7rMubS6q-x5DV_
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=6858f709 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=hQNXMjqaqMWDSZxnGksA:9

removing the unnecessary ret = -EMFILE; assignment since it is
immediately overwritten by the result of nvmet_bdev_ns_enable()
The initial value(-EMFILE) is redundant because it has no effect
on the code logic or outcome.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
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

