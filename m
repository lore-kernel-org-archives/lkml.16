Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA722D4C4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383654; cv=none; b=uWrRMFFQohXTVJ6UM+6L/R6v45EaP0lUesFXNwvin90dqCogz5ie6o9CllL8HNgS6l+UWO+S5llZZyKz6wke5g5luvj2LWVQAqJuoDtUYYZNCSCUFuPIfI5AKzcmHInnNFrTZiz/Pd+XohPPoQJr2B6sBQ3+IAJudj0etOWGm4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383654; c=relaxed/simple;
	bh=J9DnHgy2BF+cbkJ2/4gFnndTecwS5emxPtitsEMwi44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+W4JENNwkHg3AnpFlcpl18jW5vdxThjYYDoU6fdlEBw3DebVFh6gTJZJlfJabnJUWJcozncBzY5OeCzC/dqKzMut0oWFHw4yf9HhImPz8FzG6GsY3PXOYFDoOGzif6osyxlpSmbCYrXefw1wAXc2EMb0ILKK3NPT0xck3YEWG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ntkK7Phr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ntkK7Phr"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G5uhuY021535;
	Fri, 16 May 2025 08:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=iS7T8T3x1EfQiHSLX
	sjjIhxoPQh0G/JsTN2WjpebZKs=; b=ntkK7Phrfdi5Zi4MHHLsYlbn1s7juyp5v
	lef7kiju9D5AR9chR2R8ALB5LFrVg8y9owVNIiCaSZ+JmM9VBmzKLM/d7CWqtPA5
	y3m+xCGc7PJk2uInDy/dkukJeLFbAxldLcrQHPcG0MCnZY45pv0yDfMvPrBmvG+R
	vqcTwdAaZShNyb4BpBeO624Dg8hC6PxiQQ3fqXFnbYs8YenRdb9L9vOrZVIk9/FD
	fQadKIb6ceTZimNeg9BkDew844FbYGvGdkz2oXlGYYZEl25D2QL2LYWDQFq7cYcg
	cK7q5w7WmiyYS9aCvJrtj3w//rDiyjJa+12tWbxj6uxpEgCtb9bew==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ndfjwr3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:31 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54G8KHMK013902;
	Fri, 16 May 2025 08:20:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ndfjwr3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54G6F3W9019451;
	Fri, 16 May 2025 08:20:30 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46mbfrxkk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 08:20:30 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54G8KRKk49676648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 08:20:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E4DC201EB;
	Fri, 16 May 2025 08:20:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 935C2201EC;
	Fri, 16 May 2025 08:20:24 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 May 2025 08:20:24 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v4 2/4] driver/base: remove register_mem_block_under_node_early()
Date: Fri, 16 May 2025 03:19:52 -0500
Message-ID: <1b516adb43371fad2dbc69c83a2ed2a224219688.1747376551.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4YQZMspnuggds3Obm4g65M_i_DcZlapS
X-Authority-Analysis: v=2.4 cv=ecg9f6EH c=1 sm=1 tr=0 ts=6826f54f cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=xjaU-GFjuEzJSOh1rDoA:9
X-Proofpoint-ORIG-GUID: jynXYBiZcjgvp8_-r42KNlf6q3J-5e4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA3NSBTYWx0ZWRfX5TZ7Kp3Gdunh GbNT8nun3yvYtYLVbSOyK3fTZ3cpGb/WXqkAdReL+M0XO42Xd8x0qo4+FRUo47wC6Xep+LzSm4d JgfNglfsp5L7cf7IwHuP9MN+fIEptB7PNvOXHwk/I3NZeupjJbfVNe+hiRdkaABZV55MRMbZBly
 maYCVhgot7btbjrkGqRTgzI3Ty+zthjgoTjzexBYCv295wg3HkZXHnME6GaZHPxCiVJJKEsx5PM AeBfuNFA2RnFy57aZUFgMwWH8Zvj9DEX2pg+PgRURsxk6WPIIUcD8hF70pK+UmNTz0sM8eX+1Nu mLqB9JRPnxkfV3qx7Nxo//Lq08tQd4hmaei/pUCwFfLFuo7fQWPsXCpd/lR2YpQcR3urJ7LNVyU
 llOzdSk9pQTO1nggMuKuqdS7KU/5xnSYNM1hNpxtaa1iJDGACYdlCuSww+5DthH8LV/pS+IH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160075

The function register_mem_block_under_node_early() is no longer used,
as register_memory_blocks_under_node_early() now handles memory block
registration during early boot.

Removed register_mem_block_under_node_early() and get_nid_for_pfn(),
the latter was only used by the former.

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---
v3->v4

Added Acked-by tag

v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/node.c | 58 +--------------------------------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index f8cafd8c8fb1..8a14ebcae3b9 100644
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
2.43.5

