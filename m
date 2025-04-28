Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C54C28BA8A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859862; cv=none; b=Ap1OYBpKjsgJa3lNyv3HF8QpDB3vqELGViXNgKGYDyAYHCC9fpjNvsws/zWodbTLv4fVgF8vW1O4/fLRiu+iYv77z+V9iR9kFH2A6A2MQF7YLqoNSYhcR00/eRzmhWOhNjWQDBQaVwVhg3ESFbTKHMbYN25WPIGI8ANaBE2ptZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859862; c=relaxed/simple;
	bh=PAMV/G4w/lptJkSej+akFFuoJa5DgdPioMMDDmGqPkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/xKZA/qLvFAi4RamQ3usLSanSsw9xag0cTN3EVD+nr+rKdyobxfqaGVFNfR7uub33ajtyiY7zoJYCS5SR1rOnn4AjToSIJI3zptkL2nvGM7EAs5IweqdfYDCyb4PMQ4gFzcoYgVCQuJFECQJzLX5dAh/q1Tja3h+NcrsZbgxWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=As7HyC7U; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="As7HyC7U"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAorRR000968;
	Mon, 28 Apr 2025 17:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TxH2TbyyeurK2dlkz
	OwnR85fjDFTy+NV/WVrOpnsioM=; b=As7HyC7UawnR4ip/tDBoyN8cNUXn8bInw
	2/Do5nKnZGNO5DNuvyMguPS00mwIJVaZQanByZMJvvkg2inLJIYRAKoZHavzZNso
	TIcXu2mNDS0X/b5WSxu6JcrlzE+/8rPc0Y4PyAcTwFMcEKAq3sTMaIGZ/tMz1Uyy
	rtKX73USkpSidjyEFhyp5ITDoRGYyYyb2pD7mIfMsSHXukrI0dOTNJrq3NaIRsZO
	JEOeJOHMCl70S/QeO4/upatQdoZqFEEb2clrHI76uLV2M9+EppG2/5RPKbBxl3Cm
	HcLveEiX3uyrShaB7qYCxthowx5DNXQMvB7gya4QjKwj0NHE7oBuw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469xj0v5kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:04:02 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SGt7q4030387;
	Mon, 28 Apr 2025 17:04:02 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469xj0v5k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:04:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGoRmn008501;
	Mon, 28 Apr 2025 17:04:01 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch2y463-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:04:01 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SH3xdR40370498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 17:03:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7A5820043;
	Mon, 28 Apr 2025 17:03:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E06820040;
	Mon, 28 Apr 2025 17:03:56 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.39.16.18])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 17:03:56 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 2/2] driver/base: Remove unused functions
Date: Mon, 28 Apr 2025 22:33:47 +0530
Message-ID: <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jja8SR6AnwhpXQGbPwPufI5RwtoXScdZ
X-Authority-Analysis: v=2.4 cv=GJYIEvNK c=1 sm=1 tr=0 ts=680fb502 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=q9uJERnfbkf75TiDIWEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNiBTYWx0ZWRfX9gZfSE7EwWH1 go1JzsJ1KBApQZsQLJIbYPBHn59OqmXNVhpwfXqtBR515j5vnzx/aJGly1ulq4Y2CsqKw8F791b vjlJ6Rtsq94TccEj2v5KyXcFC65X85WlrnIq2X+fAj+f9L0yVYWls2Ri1V4VvwOAWsCrpru7mpq
 IMZpEmNjdCIMg8bWlxFNAYuOdOpBxtWmFV1E3vEQ/lFfrjh+58iiRfg3yPSLCCv3OMsGFEk/+Mx DAsqlPlnDy0/wIST+fGdTuDCuUijtvT1snj7OTAFq8x6KYU85fYi83CAEWC7ewi7Hk9ZOyCRdd6 jQT6tkDexvmQ3OWAnDqegY4PzK34YaQ59DyTJLRBScg4O9NtskoAL0TksObnrpLYk3Lrq2S/Drc
 WfdcN/KgJ7VPJocSNdgrJc6dZxfRHwrJva6qtLWYU3aqd0qEB6HTc9QP2126QghpSCCUTZ45
X-Proofpoint-ORIG-GUID: 1I0lZyULsfZHoKR4JKMtn0u1YeqhCGGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280136

The functions register_mem_block_under_node_early and get_nid_for_pfn
are not used, as register_memory_blocks_under_node_early is now used
to register memory blocks during early boot. Therefore, these unused
functions have been removed.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 drivers/base/node.c | 54 +--------------------------------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 4869333d366d..59ec507fc97d 100644
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
@@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
 {
 	walk_memory_blocks_func_t func;
 
-	if (context == MEMINIT_HOTPLUG)
-		func = register_mem_block_under_node_hotplug;
-	else
-		func = register_mem_block_under_node_early;
+	func = register_mem_block_under_node_hotplug;
 
 	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
 			   (void *)&nid, func);
-- 
2.48.1

