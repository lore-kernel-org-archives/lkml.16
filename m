Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E208252904
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956970; cv=none; b=g5bBB8lRH1Chl5R8LTx+PUs8RRrNUdiT7Bh7JTX16rtAWGmbXCr7a/DboOJpYrOAORq1C0GxE2WLpCO+hN+/JHyhHSnLG7aSO5jw74T0/hXn9bbfiPEw26VmwAYmJ/OKER/PsonXbh54q+Wdsqk2Wkliht+VZKRhh21DYyqs1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956970; c=relaxed/simple;
	bh=oTwsiV50aqxRCRvypZebKsZXO/RWTl9KrgYy02Nk0Ts=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tIgJ0QLGNtUQTUcrnApKUCBsU5zeZ7qKUgpi9+xEMH8TUsPasXhQYZZkzZedByhxX2SC/2C6MQ/u7lBeQwO8cfr6PtK6caGKgI3wOVZZo9Rs6BBvrhvq85suQPUHs5RS3vaetst70c1/KLVptZyfpaJlme06sxNt+RkAXnPzEug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EGOxgoU+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EGOxgoU+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I206FW028984;
	Fri, 18 Apr 2025 06:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0J320wFNfNkPp3yz7HmB6N
	MOcySii5t5WpCME6PMgXU=; b=EGOxgoU+ZiS94d3dVbZCqnor6MStiuR2+XwVwb
	dX4JQifQhbc0ysscZ+8cdGdqjKobdJ5XYietmCdZkqkjGDG9LEtrfJ79FUZLamZ5
	xCSqL93jcunLhY/qQZIr9ey9+4D9rngNRot3Cm8CU1cPJYZJ1CLEBoAqVSsw016k
	eyljTcpfl5bBsT1W+tXraSfdBOwL+Bcn6wiyYasVlZMVsVNSRMDDoT5msKwJU6+E
	G/ZhYME/tfQy1LEDrKWhNp1aqkCYnzege1wvft3WguemonXmCFYxZzVZ/edg6cDV
	vjHBm7eWpiaZoT2RehMkOMmpyps5m+Yx7iHdmEJHQ7kNmjcg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9h4k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:15:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I6FVoU013022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 06:15:31 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 23:15:27 -0700
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <cl@linux.com>, <rientjes@google.com>, <vbabka@suse.cz>,
        <roman.gushchin@linux.dev>, <harry.yoo@oracle.com>,
        <surenb@google.com>, <pasha.tatashin@soleen.com>,
        <akpm@linux-foundation.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH] mm, slab: clean up slab->obj_exts always
Date: Fri, 18 Apr 2025 14:14:59 +0800
Message-ID: <20250418061459.3898802-1-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zS1fMGwwXk2SBij4yoRV86rGmFfhIAvl
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=6801ee14 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TuTZUksUTkBGaCY47_EA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zS1fMGwwXk2SBij4yoRV86rGmFfhIAvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180045

When memory allocation profiling is disabled at runtime or due to an
error, shutdown_mem_profiling() is called: slab->obj_exts which
previously allocated remains.
It won't be cleared by unaccount_slab() because of
mem_alloc_profiling_enabled() not true. It's incorrect, slab->obj_exts
should always be cleaned up in unaccount_slab() to avoid following error:

[...]BUG: Bad page state in process...
..
[...]page dumped because: page still charged to cgroup

Fixes: 21c690a349baa ("mm: introduce slabobj_ext to support slab object extensions")
Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
 mm/slub.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index dac149df1be1..b42ce3a88806 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2023,7 +2023,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 	return 0;
 }
 
-/* Should be called only if mem_alloc_profiling_enabled() */
+/* Should be called if slab_obj_exts(slab) */
 static noinline void free_slab_obj_exts(struct slab *slab)
 {
 	struct slabobj_ext *obj_exts;
@@ -2592,7 +2592,11 @@ static __always_inline void account_slab(struct slab *slab, int order,
 static __always_inline void unaccount_slab(struct slab *slab, int order,
 					   struct kmem_cache *s)
 {
-	if (memcg_kmem_online() || need_slab_obj_ext())
+	/*
+	 * The slab object extensions should now be freed regardless of
+	 * whether mem_alloc_profiling_enabled() or not now.
+	 */
+	if (memcg_kmem_online() || slab_obj_exts(slab))
 		free_slab_obj_exts(slab);
 
 	mod_node_page_state(slab_pgdat(slab), cache_vmstat_idx(s),
-- 
2.25.1

