Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4B1BF37
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312506; cv=none; b=dCDILv0fgpn3p3+03Cl1XsPBmIwcS2u7Nt6IiJ6R9kiHSLujBO/o0C+qSPOgjkQNt5a4OkswJYQCoajYLYVdWiBnrraSRAHr1yRAYAihiPPWfcMWLbArndfGFsrKqFpuHT6wPQfALBEPyyUIviWj6N8i4nzDnS1oqAeAZKfFrCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312506; c=relaxed/simple;
	bh=bN/wby9GJTyHNrfTR8MR87g9+BbHW99FSM7/16TluMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcGJuP+eaC7xGYko20sNXR6CdgSuEMUPbYictypuP0e7Xdd5LMwBUUGYZ5E+EDLw3dND6D9QApy+KnyGwQHNh1f9I8RGhP9cU188l9xQVQ+mzPleuT7WfdRviepXimb2e59GlyrUhJfEolnaraUYP6RJx/uYd8fpjXXly1nZhF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ta1Y01ti; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ta1Y01ti"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AHv49n030910;
	Thu, 10 Apr 2025 19:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=bWJjw
	0o7BbqQgCw33nopo5k8/4LIRBtq0w5bjnsN5bc=; b=Ta1Y01tiixjTIg11fVb1U
	Vs6Un+54F1lMe1zMik+3M2GiqcBT5usJgyhS/ino/YBMgivrnwh2xxziXpVNuDl6
	23ffqTidprnCeGmw/mtyd73pnJaIwR1gA4Gp0Y31UoC0jflAc+9dyWyIe7CuV7Ok
	0PiSGDZ/763WI7X5amOuIM6xTI31Yz+qOpTUGgJuBgDnv/lsng/v353NR531/bEg
	81FpyKAiWxjs7JTDaJ9q+7nqu597I0j4JkgMJI2p+i7kBrHG/JEk7zI2W9f4Bkp1
	igVSrXogsZToJtfnz/PZQwf0hZCsDzvDpeohhi+066efCO7tIBhBpTW++akE1Gu+
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xju3g6ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:14:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53AInuKw023836;
	Thu, 10 Apr 2025 19:14:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyk1gjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:14:55 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53AJEn94040606;
	Thu, 10 Apr 2025 19:14:55 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyk1gg6-5;
	Thu, 10 Apr 2025 19:14:55 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        "Liam R . Howlett" <Liam.Howlett@Oracle.com>
Subject: [PATCH v5 4/6] maple_tree: break on convergence in mas_spanning_rebalance()
Date: Thu, 10 Apr 2025 19:14:44 +0000
Message-ID: <20250410191446.2474640-5-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410191446.2474640-1-sidhartha.kumar@oracle.com>
References: <20250410191446.2474640-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504100139
X-Proofpoint-GUID: IP9YCkA5Kq5Y17sI9bPL-LaoxMXu4I7k
X-Proofpoint-ORIG-GUID: IP9YCkA5Kq5Y17sI9bPL-LaoxMXu4I7k

This allows support for using the vacant height to calculate the worst
case number of nodes needed for wr_rebalance operation.
mas_spanning_rebalance() was seen to perform unnecessary node allocations.
We can reduce allocations by breaking early during the rebalancing loop
once we realize that we have ascended to a common ancestor.

Suggested-by: Liam Howlett <liam.howlett@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 lib/maple_tree.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 3f794ef072f4..5610b3742a79 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2893,11 +2893,21 @@ static void mas_spanning_rebalance(struct ma_state *mas,
 		mast_combine_cp_right(mast);
 		mast->orig_l->last = mast->orig_l->max;
 
-		if (mast_sufficient(mast))
-			continue;
+		if (mast_sufficient(mast)) {
+			if (mast_overflow(mast))
+				continue;
+
+			if (mast->orig_l->node == mast->orig_r->node) {
+			       /*
+				* The data in b_node should be stored in one
+				* node and in the tree
+				*/
+				slot = mast->l->offset;
+				break;
+			}
 
-		if (mast_overflow(mast))
 			continue;
+		}
 
 		/* May be a new root stored in mast->bn */
 		if (mas_is_root_limits(mast->orig_l))
-- 
2.43.0

