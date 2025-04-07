Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B25263C6B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051286; cv=none; b=aJ1E6tSlQQbFtmpOoHbqX7dsojTnxtAzQEiTHk5FvCVNdu/htaDuaELJqj9WCUoAidVP33ZOVJzifPaXj0MRe65TT1hf/AeqmavG/kWNTcBtWsHZnTe0H63Z17sJ9mX0DYM5Huf/PDBUm+Vwc+qt9tTNc400+f4PfjrGGHLwu5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051286; c=relaxed/simple;
	bh=nK3FiUMU9SwGqAn1k3UA4EJzY11tlg+gTK/nHfoUzEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MD4zKO4at9ixFUIGyav+g0pVuM8ONiia6QygzXuMDU5V06X1yzdrUt8kvO+uRKYqIJHum/nDrlXkTauhC0CB248MujyDEMEZwspTLBrpjKab7q37/KfQxONkJ9Os6xFduBcmDhR7vntCAvkKx2La08xUy9NQKiZQadFk8dftcyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ja+q7cue; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ja+q7cue"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H127F016641;
	Mon, 7 Apr 2025 18:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=+W7IS
	dG8szb9zeJ330uZlJcsSPgv9PK2sFXgns5vqWg=; b=Ja+q7cueKl5J+zWvTjdt9
	8eAZR1+yo0XRy5GEVRw3njJXDoAMZXHgkVTzHhvjDprVluZo9N57QsGSKyWLey3y
	dv+p+ag9up2cDcgR/6OO652Z/GqhRk12sgfmuaiKC791SY4cnoBwiKzc4RpiucAl
	5dqdKzgvV0SVeFA3RwFMKEHJBtYcYgXzVJR7dOhilu1VN1Bk4lBCbQ5OBtxUUOiC
	kYa7SXnDAkUeTXEdPxSxQ3uYHLYltpHGcigllgUasoYlZX+cN1Sk/4x+6+dpaX/c
	XfKORTv1RSOhriGLM68X/fs6NsogDfBb9ird6/P7BVpMz28OJAb5Fh6FRA3e5a8A
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvjcua7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537IbAYh023937;
	Mon, 7 Apr 2025 18:41:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyefwte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:08 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 537IY5Db038909;
	Mon, 7 Apr 2025 18:41:08 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyefwqr-7;
	Mon, 07 Apr 2025 18:41:08 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R . Howlett" <Liam.Howlett@Oracle.com>
Subject: [PATCH v4 6/6] maple_tree: reorder mas->store_type case statements
Date: Mon,  7 Apr 2025 18:41:02 +0000
Message-ID: <20250407184102.2155415-7-sidhartha.kumar@oracle.com>
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
X-Proofpoint-ORIG-GUID: BfDzaKACSBh63y6jvwJTyYULhApBmvAO
X-Proofpoint-GUID: BfDzaKACSBh63y6jvwJTyYULhApBmvAO

Move the unlikely case that mas->store_type is invalid to be the last
evaluated case and put liklier cases higher up.

Suggested-by: Liam R. Howlett <liam.howlett@oracle.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 lib/maple_tree.c | 51 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 98b06709d864..8425728e3c5a 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4085,15 +4085,6 @@ static inline void mas_wr_store_entry(struct ma_wr_state *wr_mas)
 	unsigned char new_end = mas_wr_new_end(wr_mas);
 
 	switch (mas->store_type) {
-	case wr_invalid:
-		MT_BUG_ON(mas->tree, 1);
-		return;
-	case wr_new_root:
-		mas_new_root(mas, wr_mas->entry);
-		break;
-	case wr_store_root:
-		mas_store_root(mas, wr_mas->entry);
-		break;
 	case wr_exact_fit:
 		rcu_assign_pointer(wr_mas->slots[mas->offset], wr_mas->entry);
 		if (!!wr_mas->entry ^ !!wr_mas->content)
@@ -4115,6 +4106,14 @@ static inline void mas_wr_store_entry(struct ma_wr_state *wr_mas)
 	case wr_rebalance:
 		mas_wr_bnode(wr_mas);
 		break;
+	case wr_new_root:
+		mas_new_root(mas, wr_mas->entry);
+		break;
+	case wr_store_root:
+		mas_store_root(mas, wr_mas->entry);
+		break;
+	case wr_invalid:
+		MT_BUG_ON(mas->tree, 1);
 	}
 
 	return;
@@ -4179,19 +4178,10 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
 	unsigned char delta = height - wr_mas->vacant_height;
 
 	switch (mas->store_type) {
-	case wr_invalid:
-		WARN_ON_ONCE(1);
-		break;
-	case wr_new_root:
-		ret = 1;
-		break;
-	case wr_store_root:
-		if (likely((mas->last != 0) || (mas->index != 0)))
-			ret = 1;
-		else if (((unsigned long) (entry) & 3) == 2)
-			ret = 1;
-		else
-			ret = 0;
+	case wr_exact_fit:
+	case wr_append:
+	case wr_slot_store:
+		ret = 0;
 		break;
 	case wr_spanning_store:
 		if (wr_mas->sufficient_height < wr_mas->vacant_height)
@@ -4211,10 +4201,19 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
 	case wr_node_store:
 		ret = mt_in_rcu(mas->tree) ? 1 : 0;
 		break;
-	case wr_append:
-	case wr_exact_fit:
-	case wr_slot_store:
-		ret = 0;
+	case wr_new_root:
+		ret = 1;
+		break;
+	case wr_store_root:
+		if (likely((mas->last != 0) || (mas->index != 0)))
+			ret = 1;
+		else if (((unsigned long) (entry) & 3) == 2)
+			ret = 1;
+		else
+			ret = 0;
+		break;
+	case wr_invalid:
+		WARN_ON_ONCE(1);
 	}
 
 	return ret;
-- 
2.43.0

