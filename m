Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71828FFCC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312510; cv=none; b=tfZsUuwNQmtfrHgNlNi4MrRCqUmEEH1wVM4enFXw1JQRfSB+2zOjr7uOSriK45mRmC4fTTQBdt1003lx4AVzNn1JSsaO5iNW/3MiUAIfHzDtIVKFLx2b5sWJk4vW3yCnfWkprU7bpB/tP/JjrBurx4cA7sAoWQHFJfXisOiHH7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312510; c=relaxed/simple;
	bh=jaBwtcIvdXOI214Lt+jj3N7iNSjZP2AHKebTyoAaGvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gj9D9AihxFAp2Lql7iesplBAq5MancjxvacUTfdQvBwwRHJQBld8zfuS/rUnpKDZTQDQSLx36Mqj/hvQhnFxbeINLoLlo7rfuBrcWe5ZR1P4TPdP/HEcWe/j/bv812VK+h3D1mV+se7/FAOIfk6o48ejHAMYnEc1SPlV3y2YDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fj9P3Wg7; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fj9P3Wg7"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AJ71BN029309;
	Thu, 10 Apr 2025 19:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=zWlQ0
	xIqmwybEu+J7v33mBZJCqNRUP8L6NFstG34c08=; b=fj9P3Wg7WQF9LKYDJwqO1
	Um0VyKZvueVYbtKgCajE2cIuBVTzk+J57OFgSaVWeKjcmWmnicVCeWwLMo2dOpmZ
	R9xxiW4hlactsgtxbqyM7aTaWDaedAvBuOYZYRq+2xAfW5Dui6SwOcCGERTYUlsH
	+V28WGh69JztY/cSzzJvCoM0P4TUVvFNOq+ryjWH1W+dq6hQsH+j2b86F4ARWJZ7
	eTb6VPUi/B8rGGH8TS0zqxR+HoBDIRKeP3eO3nMYsaD1MwDOw5WNNcUKQbYxKo6r
	mz0ivu4ERPoB6H7s9kqFHuyfE50GoFQHGVlmcvzkSV43rDlHTIDpgA4XXzxYUkWE
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45xkuy00h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:14:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53AHe4Fc023813;
	Thu, 10 Apr 2025 19:14:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyk1gkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 19:14:56 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53AJEn98040606;
	Thu, 10 Apr 2025 19:14:56 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyk1gg6-7;
	Thu, 10 Apr 2025 19:14:56 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R . Howlett" <Liam.Howlett@Oracle.com>
Subject: [PATCH v5 6/6] maple_tree: reorder mas->store_type case statements
Date: Thu, 10 Apr 2025 19:14:46 +0000
Message-ID: <20250410191446.2474640-7-sidhartha.kumar@oracle.com>
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
X-Proofpoint-GUID: AuQSBcultmD_cCUSWfwdXLuB5k9yBpJM
X-Proofpoint-ORIG-GUID: AuQSBcultmD_cCUSWfwdXLuB5k9yBpJM

Move the unlikely case that mas->store_type is invalid to be the last
evaluated case and put liklier cases higher up.

Suggested-by: Liam R. Howlett <liam.howlett@oracle.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 lib/maple_tree.c | 51 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 26 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index aa139668bcae..affe979bd14d 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4083,15 +4083,6 @@ static inline void mas_wr_store_entry(struct ma_wr_state *wr_mas)
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
@@ -4113,6 +4104,14 @@ static inline void mas_wr_store_entry(struct ma_wr_state *wr_mas)
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
@@ -4177,19 +4176,10 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
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
@@ -4209,10 +4199,19 @@ static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
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

