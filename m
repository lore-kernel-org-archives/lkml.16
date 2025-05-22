Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61332288CBE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905498; cv=none; b=u7x3HxNYQN0BGezn9Q4OhaZtn0K1WAqa0/UFuQ9sONsU4YJIze8ZpwbbCa2t2FdlFnWL8YP2Nqxvm6ZSPhVzpPT/0PemU2gTiGtf+jEfVeB6jXtjvHeD6cX+jg5pPGfdOwjQ4FkF+/vZHsdRKQ6MW6jWnzhDVEiFXglC1EmP5iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905498; c=relaxed/simple;
	bh=5C7zGS2V3bJGrbJSaGM15IPI3yesRppaPH4GfppApto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKl9yI46EwmjQxwYUtIGVI/xIGS9T5FaRUGJuE1ThjhN7pOL/zuZybptlHc7sFB/53AaoQjHE8crONYmAnOyfUTsq+TzFfJAZ3oUlGiiaYw5m2DVl9g+w40afOcJ37D5EK8V/7GoE+dkZ/TY0k5zIVxIZmi40ShW7L5eBaN5tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dikqZ495; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dikqZ495"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6G5mg005437;
	Thu, 22 May 2025 09:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rWaAiDWPrg8jjAFfZ
	H8NkCi00pTyPIdq5c1PN1pWnZw=; b=dikqZ495MaKGwbKFqMT4ngWMvB1bLrGDO
	hPS3pEBB26zb0c2LvApo8d6MfNhKEBxJo2DNVhKoIWhSDTTwZ/8TYVpz6brPGcJl
	slqssabxJlnvuYXUtYIpNtoUmDCsxXWhoEznTVqAaYKIvd9o3vv9lNvScI4+tnsG
	NrO909BvjlWs+qVyLIvEmzXImAEWfOcdiXDReg7jUBQQRgh7oywCeC9PnIJQ2Z55
	4+Agw7nnwwKo4NgRGS85qIV8N2y0tzBPVCU+545nlIlmGuVZOM5O0RSGWKRHjMvm
	hQihFpRBPKbcvhD6tTsXMod+ofpHwftvgauBbrn9pbMr0CTYjhKjw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46smf9bbdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:51 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54M9Hprg032684;
	Thu, 22 May 2025 09:17:51 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46smf9bbdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5VBeU032076;
	Thu, 22 May 2025 09:17:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmgqbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:50 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54M9HmT932375072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 09:17:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FA8E2004E;
	Thu, 22 May 2025 09:17:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4300620043;
	Thu, 22 May 2025 09:17:46 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 May 2025 09:17:46 +0000 (GMT)
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
Subject: [PATCH v5 4/4] drivers/base/node : Rename register_memory_blocks_under_node() and remove context argument
Date: Thu, 22 May 2025 04:17:31 -0500
Message-ID: <8394a530c01fbc38607e392ef9ffcdaaa3a8d3da.1747904868.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
References: <d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pa_7H_jzah6JRAGZGES_e-t1MQBr14UB
X-Proofpoint-ORIG-GUID: NO1FuBF6KTFc06MF5QgLWWLovuDPQkx_
X-Authority-Analysis: v=2.4 cv=TbqWtQQh c=1 sm=1 tr=0 ts=682eebbf cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=xjaU-GFjuEzJSOh1rDoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4NiBTYWx0ZWRfXzzyrnHtgZHpk cnIWXk4ib1sr9YcO7Q/dQ3mvBa1xe3hCW332hYj8ARFbFVS9+d8LetHX80ubRUhwo3NcaeSWOtA 7QHdKO3G29CkcUCH5byEVpnxdsBwkUk1rBdLCgPYQxrFel+qh208kKxkWeRnO3a4H8HsHPTvtMx
 BQ7F4TeGzTbYsZiRFSGKVqi+1YFOnMrQQ7Ss+kGN/syr9nEH5RCZL37V1TA5j6OH5x9U2DjDYuK BPsMzBQrkvmEsf9/BXZ3/4zxbsPCF4V6rHgcbCV6xmPGVPw6pe5b+MtYixxwO292B/CO9JfTcaN MAZOEZpn6R8yJLmULZhNFruNAh8CiIOBpjTFMIkpgySCJ7nMw8aU8Rtv045COOovHJK9ioWpQDU
 cH3yi1drBrlCTM3UmdKhft8kyUHLwWzCqhVNqh4qYG/OseCJM/ijNbT1EJwM/FDoGYXuzWNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220086

The function register_memory_blocks_under_node() is now only called from
the memory hotplug path, as register_memory_blocks_under_node_early()
handles registration during early boot. Therefore, the context argument
used to differentiate between early boot and hotplug is no longer needed
and was removed.

Since the function is only called from the hotplug path, we renamed
register_memory_blocks_under_node() to
register_memory_blocks_under_node_hotplug()

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---

v4->v5

Added Acked-by tag

V4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/node.c  |  5 ++---
 include/linux/node.h | 11 +++++------
 mm/memory_hotplug.c  |  5 ++---
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 0c97523e7b7d..3f7c8662696a 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -837,9 +837,8 @@ static void register_memory_blocks_under_node_early(void)
 	}
 }
 
-void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-				       unsigned long end_pfn,
-				       enum meminit_context context)
+void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
+					       unsigned long end_pfn)
 {
 	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
 			   (void *)&nid, register_mem_block_under_node_hotplug);
diff --git a/include/linux/node.h b/include/linux/node.h
index 6cf349c26780..fb567e5aef1c 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -111,13 +111,12 @@ struct memory_block;
 extern struct node *node_devices[];
 
 #if defined(CONFIG_MEMORY_HOTPLUG) && defined(CONFIG_NUMA)
-void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-				       unsigned long end_pfn,
-				       enum meminit_context context);
+void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
+					       unsigned long end_pfn);
 #else
-static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-						     unsigned long end_pfn,
-						     enum meminit_context context)
+static inline void register_memory_blocks_under_node_hotplug(int nid,
+							     unsigned long start_pfn,
+							     unsigned long end_pfn)
 {
 }
 static inline void register_memory_blocks_under_node_early(void)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8305483de38b..f734cc924b51 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1575,9 +1575,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		BUG_ON(ret);
 	}
 
-	register_memory_blocks_under_node(nid, PFN_DOWN(start),
-					  PFN_UP(start + size - 1),
-					  MEMINIT_HOTPLUG);
+	register_memory_blocks_under_node_hotplug(nid, PFN_DOWN(start),
+					  PFN_UP(start + size - 1));
 
 	/* create new memmap entry */
 	if (!strcmp(res->name, "System RAM"))
-- 
2.43.5

