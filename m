Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB37127C869
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905483; cv=none; b=YRpIclQ9ou+r0ZlDmKl7wnBF6RThFjTv/00Cf0ZXdl41Q/Pt4Gp8vq5eX7MTZe+jRE0If+osuWzWCALuPaJnWTcgxnE0gKp/ppAnMi8YIQRKyZqeNKozeZQxCnnfyRRXr/94lbA47sPHH08580LEjMvvztDVYJVTcjDQES4iECU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905483; c=relaxed/simple;
	bh=Dm20eX1b5H/QGysDGSiYGrrtBBqu7jvqOp5f8gXtoIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Muvs2fur6Nw9WcdLZN7KFPqzu4onjsSKa4igFidgqLFzC2E0YKImCyHl2ZwU6dSDaK1QI0S+O9jfgPm/17TCLYLbqEC2KplAfqKV3EWwrRtSRrIod5iR7rY0vo0RLLNkvCIU8EwFx5beBQZ5XXIqTKLy8eEUc+tWIqw7hlG2d20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=okdNg68Y; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="okdNg68Y"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M4j3BC002956;
	Thu, 22 May 2025 09:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TtWjzGfDgA0mX4hjM
	2vWKY03Fjh2zXSiv+myTdwYUmw=; b=okdNg68YTtnN5t6tu9OthgKerggBCLKTe
	aubd7dS6e6vqkEfMJO3Bzi3RPConTaa/nDcIK4+VezQbgumeOxnJ4NMSRHYn1n6O
	NxS9pUt9WY9ySorllLGkvfrV2C/3H9PZtreQEtksnj/GXtdbdH2DirQ4wYvrDZlU
	gu1Y0u7oj8aEKatd32na5mzWaCss6GiGPdP/yhoA0TFPoFROAKH+vJalOfRXU2Ee
	4IMHG3NCKiyIHid2A9h+lUl6Q+2NMXGHIrr9eWnD8+trnNrSf2/kFF7dZu0UQ6+J
	M/BjkKd6as+nSmC+ARah/+PhOJ9fl7aw/1gfdj/4sgOY/Uh96HBxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46smh736fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54M9DlQ9022507;
	Thu, 22 May 2025 09:17:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46smh736fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5U89Y031996;
	Thu, 22 May 2025 09:17:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwmq8r21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 09:17:42 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54M9HesM53346726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 09:17:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BE9A2004B;
	Thu, 22 May 2025 09:17:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CC032004D;
	Thu, 22 May 2025 09:17:38 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 May 2025 09:17:38 +0000 (GMT)
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
Subject: [PATCH v5 2/4] drivers/base/node: remove register_mem_block_under_node_early()
Date: Thu, 22 May 2025 04:17:29 -0500
Message-ID: <18a5fb89a347e1ceb4c87266152b5c7d07f3ceed.1747904868.git.donettom@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA5MSBTYWx0ZWRfX6qSJVEEserpw eZGwW/X4QY9Z8B8yhDf2B/N3o9I0J/svFUWlL2OpEF7KoRNHRAiDOIT5yjxWqHUItdw0S3YSwY8 nm4WsjRMZH7riX5DYkNVigib6bpwn08L+hR4xW8+h3zKI1fZoYncAsHcdkxz/jZ9kn2R8jB+Ww5
 pmLv9d9doEGOnu+23eUM8TJ9LcCd4n7+Kf77tK1wClBRi1bm6Y8ZXpOToEuD2/8qPhs62XfUhFq NQQ3a/PjT4O8vKgNpz/F/HK5Uyo6msM+HXAeHeYGNBurJieqxHL5qmZCMYSYDbHBYSmVJV5nn0S gPGRAR/I+4CO80kYoFlNiSYTvE8q8Axj69NWeOcma9JG/kLzD7IfTkHISrT8QNl/5QDsunFA+eA
 OUXBWyLWb+cQ7n7difELcazkUH037smDajq+jW1CQylKJfcOpo61dEoaqDuGKPu9QHw9TSUR
X-Proofpoint-GUID: WK4z5NF3zWGxnqMoEJTXfOLeo-9aSB1c
X-Proofpoint-ORIG-GUID: 21naQz5JmqY6iwE0DgDbXqR0pHEww4UV
X-Authority-Analysis: v=2.4 cv=EdfIQOmC c=1 sm=1 tr=0 ts=682eebb8 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=xjaU-GFjuEzJSOh1rDoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220091

The function register_mem_block_under_node_early() is no longer used,
as register_memory_blocks_under_node_early() now handles memory block
registration during early boot.

Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
the latter was only used by the former.

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
 drivers/base/node.c | 58 +--------------------------------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index e8b6f6b9ce51..0c97523e7b7d 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -748,15 +748,6 @@ int unregister_cpu_under_node(unsigned int cpu, unsigned int nid)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-static int __ref get_nid_for_pfn(unsigned long pfn)
-{
-#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
-	if (system_state < SYSTEM_RUNNING)
-		return early_pfn_to_nid(pfn);
-#endif
-	return pfn_to_nid(pfn);
-}
-
 static void do_register_memory_block_under_node(int nid,
 						struct memory_block *mem_blk,
 						enum meminit_context context)
@@ -783,46 +774,6 @@ static void do_register_memory_block_under_node(int nid,
 				    ret);
 }
 
-/* register memory section under specified node if it spans that node */
-static int register_mem_block_under_node_early(struct memory_block *mem_blk,
-					       void *arg)
-{
-	unsigned long memory_block_pfns = memory_block_size_bytes() / PAGE_SIZE;
-	unsigned long start_pfn = section_nr_to_pfn(mem_blk->start_section_nr);
-	unsigned long end_pfn = start_pfn + memory_block_pfns - 1;
-	int nid = *(int *)arg;
-	unsigned long pfn;
-
-	for (pfn = start_pfn; pfn <= end_pfn; pfn++) {
-		int page_nid;
-
-		/*
-		 * memory block could have several absent sections from start.
-		 * skip pfn range from absent section
-		 */
-		if (!pfn_in_present_section(pfn)) {
-			pfn = round_down(pfn + PAGES_PER_SECTION,
-					 PAGES_PER_SECTION) - 1;
-			continue;
-		}
-
-		/*
-		 * We need to check if page belongs to nid only at the boot
-		 * case because node's ranges can be interleaved.
-		 */
-		page_nid = get_nid_for_pfn(pfn);
-		if (page_nid < 0)
-			continue;
-		if (page_nid != nid)
-			continue;
-
-		do_register_memory_block_under_node(nid, mem_blk, MEMINIT_EARLY);
-		return 0;
-	}
-	/* mem section does not span the specified node */
-	return 0;
-}
-
 /*
  * During hotplug we know that all pages in the memory block belong to the same
  * node.
@@ -890,15 +841,8 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 				       unsigned long end_pfn,
 				       enum meminit_context context)
 {
-	walk_memory_blocks_func_t func;
-
-	if (context == MEMINIT_HOTPLUG)
-		func = register_mem_block_under_node_hotplug;
-	else
-		func = register_mem_block_under_node_early;
-
 	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
-			   (void *)&nid, func);
+			   (void *)&nid, register_mem_block_under_node_hotplug);
 	return;
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
-- 
2.43.5

