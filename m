Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55445263C6C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051286; cv=none; b=cfN1+djwG4jX+w2QNF13ixziJVJ7QIXTkShZNPd7AtkF2PZNzliW8SEwAQDX65DsHgcTo6cANXW0UdtPtqxczbAJO0BhmCQG0VhxYlRXk7XpQghG8mZt8rgw+FTrL5QNkwB3cahMe7WqlAELeBpKPZqEG+E35alSvzxo8CNQXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051286; c=relaxed/simple;
	bh=G1yf811KXeXGcXtL46ITK5w/ygIDGWRIEAWI9f1MLJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayoFwmTVCpavgZwjATsfCdQoKER7Hu7fl1PtBlOBjVTkH6jeTbhFdD1/YkAiUlrhDwUibySMtRuFV01bUVqxhop0bDbefrAjt66C4gHAkzmJ3exZZd7TTt+JQZ9lkLPiZcfBj9rJlzKcSqZ9Ardlwyj6vHRrgRtrvuYD9EJ26LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BhL4SIzl; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BhL4SIzl"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H0vkg016513;
	Mon, 7 Apr 2025 18:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=EcVeW
	3eFU2ClmEtFd30xm3FtUPKd3pdiQSzgw/fblBc=; b=BhL4SIzl59d7zOiRob1po
	zizBb6ocwIP924Q40aoxFHWPEYbJc5eR3p/GRvegxELNMPl6Hr89qESh01qT0NE9
	YgC4GP6ZUzmN+gJEsO7sqie3ZgFrp1OejeNIjvPf8b1BA2ZMSd6GOcsWGjZZth5q
	/Nku+BN3siIYHby7xUP5HEKiaYRR/nqGuX9vkYzq0u0sNr+De7kZ6T24gbCQil2H
	h0JarxHjclDfgqs3cc5XGVwfgOtvLzk3NyM2t+sH7Hi9IBMGPgjjxE/QdUc9+3hi
	VHE3RrTSU7CYbParP4Rh62go4F2D8o2dsqaUi7hV641XzLDA77w2WtU+ABbom82K
	g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvjcua7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537HGJL7023953;
	Mon, 7 Apr 2025 18:41:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyefwsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:08 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 537IY5DX038909;
	Mon, 7 Apr 2025 18:41:07 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyefwqr-5;
	Mon, 07 Apr 2025 18:41:07 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Wei Yang <richard.weiyang@gmail.com>,
        "Liam R . Howlett" <Liam.Howlett@Oracle.com>
Subject: [PATCH v4 4/6] maple_tree: break on convergence in mas_spanning_rebalance()
Date: Mon,  7 Apr 2025 18:41:00 +0000
Message-ID: <20250407184102.2155415-5-sidhartha.kumar@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
References: <20250407184102.2155415-1-sidhartha.kumar@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504070130
X-Proofpoint-ORIG-GUID: U05rjn_-aW1IcL7szSOtuziPGQPgEfqg
X-Proofpoint-GUID: U05rjn_-aW1IcL7szSOtuziPGQPgEfqg

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
index 203a1a529884..acecd4e8a6a0 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2895,11 +2895,21 @@ static void mas_spanning_rebalance(struct ma_state *mas,
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

