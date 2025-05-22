Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA85288C01
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905488; cv=none; b=l2NDkFHtXlBWcfxMD8e7RM28VfmOApDYdL6INruD5fvh2dW+1Kf+HxFnFG01eq413vKPMtsnX8bshk5PkeQSkQc8A3TVhMzTNQtnSFbggDQfvKH4BS09bmUioc2igA9rZzN/2DtVdtEjlLWuZoogEJDGJlJypMZRh/fw7j1wuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905488; c=relaxed/simple;
	bh=pGsG58D/rjaw5OqohFIn2znklrZzEcOYajQFtROvzvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qMAsSRrkUbPugEwL55klBk5qlC3+n+eUECR2jiyfDEhZSoI62m1mQZvXE3ZGgh6jVxFzsNT4GO0CHg6+TTXAsNER75HIyUUNVN/cezsFVkAH8paSoKSFrBWfO68TgDramqE1yY4cUvw3NFDrblo32+oEE3UwdxKnUrhlQ024ypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Xt1PVZB0; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Xt1PVZB0"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8peOY003104;
	Thu, 22 May 2025 09:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PZybCk
	6agW+jCUj1TxyS6TQVADEXGxw10uWVG0SgRIs=; b=Xt1PVZB0y5lHopvWJf9RRZ
	69DciFMZNXfsfiWkY4IlJ/KgNhKynuAIGQPB0KQ/abwHIPtJ11lVJ9oTF7pWI589
	JatDLhd1fKiKcDSljUNp/diV7oA5I6oVRJMAwZvI2J61Y2OBHoA8O4VdDXjXeiBm
	/KtJDd06Dz/eFZPNghQFrMctiILkulVD6TGK5vgkymQg3t63sac7Bq21UOLOa3co
	s0M32XDqqyxkyRFTOOj58bHM9ouT1T1NLAGXihNq5AfBcThxNYOp18Y/WB5gVPJz
	VHD6XZInD4EvFcf994sWCqzJWUFeK3Td5iba9FPe4ewq1Vj5iSwSWJC3aZ4Fo96g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t0sjg3g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54M9HlsF028287;
	Thu, 22 May 2025 09:17:47 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t0sjg3g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5J2c1024701;
	Thu, 22 May 2025 09:17:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwkr8rf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54M9HiED42926542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 09:17:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81DFA2004B;
	Thu, 22 May 2025 09:17:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5780620043;
	Thu, 22 May 2025 09:17:42 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 May 2025 09:17:42 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v5 3/4] drivers/base/node: Remove register_memory_blocks_under_node() function call from register_one_node
Date: Thu, 22 May 2025 04:17:30 -0500
Message-ID: <a2cc58f18dc984fc9563b9c10d5708cc92ac579f.1747904868.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA5MSBTYWx0ZWRfXxBQ6TIpA69jP f/ida1veoMXWFAJftA1aZSfBdAoxR09mFI0TO89BS6rp4n5euPTE9WB4+OV300Slx3eyMXLhdjq jbGVi0WFYr362rY8AFeVvbG2Ugl0ZViyNDBCbCG+QcoAaIGTnt3nOxWhVQqR59/5g1cerP1CSM5
 n6ev/u/dBADSFdBDCo4J84T78Ikrr1AKj1+WscQnic2VcqCEi0npcv+DmBigotHnvpE3n1IiK09 2NjBZk4VlJy0ENP6TRZewE9cdvLJHIb2uxmdcEmWnIWu5nr+Bo5qr/QI42dON1Rflzwl9xbmGfz 8IW8lv99i9IbklYaaD4mPA+8X42DWEGVtYRfXJgQIrXEmgdW7pwHZ/GvQJztHqh8hWiCcm4gumq
 fjgMzPgLWMrZI7oA+1f8KoNO7D/XT87ATJ1LpDGqmVW6sMqffGBlSYEbDpMGtuoKRmga5sSQ
X-Proofpoint-GUID: ebuOcw8Iw95uu9AikZP50pgKMkptl8t8
X-Proofpoint-ORIG-GUID: Qj4QBTUzyzQArw284nLZ-4wMiMlv5CyE
X-Authority-Analysis: v=2.4 cv=HcAUTjE8 c=1 sm=1 tr=0 ts=682eebbc cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=0pz2BeAarGysgqLgsfcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=781 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220091

register_one_node() is now only called via cpu_up() → __try_online_node()
during CPU hotplug operations to online a node.

At this stage, the node has not yet had any memory added. As a result,
there are no memory blocks to walk or register, so calling
register_memory_blocks_under_node() is unnecessary.

Therefore, the call to register_memory_blocks_under_node()
has been removed from register_one_node().

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v4->v5

1. register_one_node() implementation simplifiedi based on David's
   comment.
2. Added Acked-by tag

V4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 include/linux/node.h | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/linux/node.h b/include/linux/node.h
index 5c763253c42c..6cf349c26780 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -136,18 +136,8 @@ static inline int register_one_node(int nid)
 {
 	int error = 0;
 
-	if (node_online(nid)) {
-		struct pglist_data *pgdat = NODE_DATA(nid);
-		unsigned long start_pfn = pgdat->node_start_pfn;
-		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
-
+	if (node_online(nid))
 		error = __register_one_node(nid);
-		if (error)
-			return error;
-		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
-						  MEMINIT_EARLY);
-	}
-
 	return error;
 }
 
-- 
2.43.5

