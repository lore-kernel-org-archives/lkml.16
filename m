Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5C255225
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051281; cv=none; b=pW2x61eFp1tTQECrcRy5HVwghkgjkwjyHFtKhvRp/Wa79qrEyQxFF3FZbwuePsOIDjlWURA4DPdRmoN8iymapI6CSYuVfVKPHEcAXvD6cSvwkdsCsq2/Rzh4Vg9gCO5sfUj/3djnLKlJ9SO0yksP2urBMOqRWJeVlWn5x/BFkgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051281; c=relaxed/simple;
	bh=5FmvgLwUgefF/15jQPZPuLOR7HLUsegiYz+SY3v7WMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkcJp/YsijL/y6wwo80KvZb/G6HOlmdc6lgHvJnh1gauRqZr6gX58DMpWNXTQ6bS6JaQWVw3kklE/IZAir5W7HR8Z7egNFt5vEbkdIhQ/SB3WwtGezEznNAFZzcJ/1In4k5HDfk6ajIvA8olYk0/UaE6EnAojR9ezOMxs6N7RhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J5+STbyq; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J5+STbyq"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537H0ihp029680;
	Mon, 7 Apr 2025 18:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=xifEa
	GxLrCosb9AknfMROurmyL6jhk0BySHE36IGbs0=; b=J5+STbyq/ZJOEaT+XDikd
	8Z/XTQs3dk3GWdUI+8zyptFFX0zInhPjVAT6/6+KsI1v1d1wREdiQvDCTFqJn5ln
	8+7rjZ/T5ElFsLg0jm+HTVCUO1pAWN8IN3CGttmMAFzBjuArUNwW0YlRz7NnpZ47
	gddpoxOJEn6QkzBf75qT1LkuJBZWWPnKd5+Fm8VUYCJ3sodJNZdy9k+YorKN+Xuw
	+si55jbOMAXf4Gd6GgcPDANd2FL0lSd+3K+fZsplEtcXfMKy4+hlTHP0TpCUZklE
	7cQwYzKJPyZ+oULmwGN5JKbqsG76KvKmrsqMoFRpqkr3TmtpOdWL7TfvMabd5k2n
	Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tua2ua1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 537I0VB0023792;
	Mon, 7 Apr 2025 18:41:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyefwrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Apr 2025 18:41:06 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 537IY5DR038909;
	Mon, 7 Apr 2025 18:41:06 GMT
Received: from sidhakum-ubuntu.osdevelopmeniad.oraclevcn.com (sidhakum-ubuntu.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.250.108])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45ttyefwqr-2;
	Mon, 07 Apr 2025 18:41:06 +0000
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
To: linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, liam.howlett@oracle.com,
        willy@infradead.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        "Liam R . Howlett" <Liam.Howlett@Oracle.com>
Subject: [PATCH v4 1/6] maple_tree: convert mas_prealloc_calc() to take in a maple write state
Date: Mon,  7 Apr 2025 18:40:57 +0000
Message-ID: <20250407184102.2155415-2-sidhartha.kumar@oracle.com>
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
X-Proofpoint-GUID: YVHIWhmhFpr19K0Q-elXIcN-oqF4NoLv
X-Proofpoint-ORIG-GUID: YVHIWhmhFpr19K0Q-elXIcN-oqF4NoLv

In a subsequent patch, mas_prealloc_calc() will need to access fields only
in the ma_wr_state. Convert the function to take in a ma_wr_state and
modify all callers. There is no functional change.

Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
---
 lib/maple_tree.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index d0bea23fa4bc..f25ee210d495 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -4140,13 +4140,14 @@ static inline void mas_wr_prealloc_setup(struct ma_wr_state *wr_mas)
 /**
  * mas_prealloc_calc() - Calculate number of nodes needed for a
  * given store oepration
- * @mas: The maple state
+ * @wr_mas: The maple write state
  * @entry: The entry to store into the tree
  *
  * Return: Number of nodes required for preallocation.
  */
-static inline int mas_prealloc_calc(struct ma_state *mas, void *entry)
+static inline int mas_prealloc_calc(struct ma_wr_state *wr_mas, void *entry)
 {
+	struct ma_state *mas = wr_mas->mas;
 	int ret = mas_mt_height(mas) * 3 + 1;
 
 	switch (mas->store_type) {
@@ -4243,16 +4244,15 @@ static inline enum store_type mas_wr_store_type(struct ma_wr_state *wr_mas)
  */
 static inline void mas_wr_preallocate(struct ma_wr_state *wr_mas, void *entry)
 {
-	struct ma_state *mas = wr_mas->mas;
 	int request;
 
 	mas_wr_prealloc_setup(wr_mas);
-	mas->store_type = mas_wr_store_type(wr_mas);
-	request = mas_prealloc_calc(mas, entry);
+	wr_mas->mas->store_type = mas_wr_store_type(wr_mas);
+	request = mas_prealloc_calc(wr_mas, entry);
 	if (!request)
 		return;
 
-	mas_node_count(mas, request);
+	mas_node_count(wr_mas->mas, request);
 }
 
 /**
@@ -5397,7 +5397,7 @@ void *mas_store(struct ma_state *mas, void *entry)
 		return wr_mas.content;
 	}
 
-	request = mas_prealloc_calc(mas, entry);
+	request = mas_prealloc_calc(&wr_mas, entry);
 	if (!request)
 		goto store;
 
@@ -5494,7 +5494,7 @@ int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
 
 	mas_wr_prealloc_setup(&wr_mas);
 	mas->store_type = mas_wr_store_type(&wr_mas);
-	request = mas_prealloc_calc(mas, entry);
+	request = mas_prealloc_calc(&wr_mas, entry);
 	if (!request)
 		return ret;
 
-- 
2.43.0

