Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B718EFD1
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250862; cv=none; b=NzNLgftncW7nYM9P/9uAF1cTpZCaMcMQETD2TxBWzI9Ww1wZuSMd5p01bJLhTF8WTMySXXE5zMFvb/xl5rSoJ4nFEp5VohiU2v8YE2qrHwXvHo7oTPYQwpxqyW0V9Odg88a8u+9goWw+fEI3lhH6WdK7KHVo1nA+/iLKS9FKdDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250862; c=relaxed/simple;
	bh=XwDZf4eeNIxR6Etn6KW0cde7H9TfDfcPipMQlSc8YJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heTlfRoeqp/aFOuLv4DmuRJ61sVUqT3phR7gHqhOmgva0PynvDnybJ1bsb3ZTdcqwHfUX+N1YKQeU5/3skXsDCKVSwWDlmAkmwpPOyzpZoOduPsNeaZjVtglm63V8pa2t6NE0fw9/VxT56wX/SfoQBnPks3zuHb8pLc19cxdRaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QdcozqtV; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QdcozqtV"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543303JC007380;
	Sat, 3 May 2025 05:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=YBuG9iHpO49vJs0ff
	6cHvwnAQWzm8aA82ZPebpBqUp0=; b=QdcozqtVhkjka+TpNpxmWSFGkDPLw42r2
	HM6peNtzfLnibKERYEyTsgbpOPmGNr/bkvuox1Qw4T/yKNrvzNMukD/rNV8yOtof
	fOWs9LCOuR4/B6ZKfO8k67Ll9lkkvx578uuDj4EZzmflwSRArOPGT8+Bhze+hUbg
	BYDJ02UYBvPsHVwdQUqeF2pPCXVkNU1PhUzZCXO0auXg78bWMVWP5wO7BH8s1PNL
	YN43/AbF4Nb5Zm1aFSIN6HopscstB8PV927OlBbon3p3B+TeeEcEIl0vw3A796as
	jNAzjpk+H0QlWxs1zRZq0QSUugDtrwsiA1BhEcsvDMQOtsh1LhIIA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46daty0abt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:39 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5435ecOn016737;
	Sat, 3 May 2025 05:40:38 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46daty0abr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:38 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5431I55G024662;
	Sat, 3 May 2025 05:40:37 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1mms5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5435ea2036503828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 05:40:36 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2735320040;
	Sat,  3 May 2025 05:40:36 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA9302004F;
	Sat,  3 May 2025 05:40:32 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.98])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  3 May 2025 05:40:32 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v3 2/3] driver/base: remove register_mem_block_under_node_early()
Date: Sat,  3 May 2025 11:10:13 +0530
Message-ID: <871e79e4583fcf5f28ecbb37f28297098f1ac748.1746250339.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=fKc53Yae c=1 sm=1 tr=0 ts=6815ac57 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=64vTnB0G6KJa_LJvZe8A:9
X-Proofpoint-GUID: FVnB2AsHyshvjv0CBXGw5-inUP-IRfxE
X-Proofpoint-ORIG-GUID: nv-RFAkYlDNglGJ2En-dlGUOLwH8xdec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NSBTYWx0ZWRfX0ElWrtPn4Lai 0YrFCkOj9fVAad4nSnbWMe/9ClT8IERCy7IBiLMrvDpQXLnhp3NvR82Az+e9AuvN4a+QK+X7Tw3 sfNrpMqhqzMExB5IXk+sy/Ko09IMHUU91HMyBDgW6KXm9pvnrhGp0J+tae1LXkB8jMMUDbWbI6x
 d7/u6DmRNsxIFabIM/FtQXZY3gBuElYWLF369GMzXuyoxPYjs7lqsB4ASBbOJXjt9szwL4WlPKp vaN3J414Dy5OnLOhxEzQL75VthxcHxRn5CpkbkNxuGYUIPdUFD64L8lBjHm6ZJtjRBXidehBM3D nAmWbgN4X7JIWAHO3bezYqVKFfCoQhIrrZXZhBreYeoZ00uf7Lk8fUceUPp7EO0EpxEAEBW9qox
 0ixCEdVyBoc1nbi3xLbO/zPEozxkAgqNNyuxl7YaIWcW/XS5hVVKWqwxeC30Gxyb2vLePaUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030045

The function register_mem_block_under_node_early() is no longer used,
as register_memory_blocks_under_node_early() now handles memory block
registration during early boot.

Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
the latter was only used by the former.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v2->v3

Removed temporary variable(fun) and passing
register_mem_block_under_node_hotplug directly to walk_memory_blocks.

v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/node.c | 58 +--------------------------------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 0f8a4645b26c..948392b477ea 100644
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
@@ -892,15 +843,8 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
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
2.48.1

