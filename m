Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A7D1A2C0B
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250869; cv=none; b=VCxJpYqEea27ty51GF/N1DYPEaPxLT+oWYX+ZovtKl+plkwo2NFonlJu8xJsN66jM3yE3HBaSmr6EXQugDhGCTR3FArM8tIAA791+i5+HMAZaSAiXogtEaDHkFL8AnvuAKQ2UqhzqireUE7QbidaSA0+tFxp8zTeP1R1baItFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250869; c=relaxed/simple;
	bh=DEhnxsXx4VyePjrJTUbAoxReJpbAZwiMS/AH9S2WLF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7uasyAFBhMAMce/EylUXhPGIRlMHkBgB0XEsVceC/UntOHNoc85mQOI79RFmotKwleCIUSL5S3vYSkQSQq44BOomiQkgO2v2aJyZy2lGUoCMJDWUpFRx3bv73HtkI78/GujF415BC9TlKMD4mcrbcOgkvkvWS1sdK/WJ+3bzZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WMU2vsQK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WMU2vsQK"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5430PsZC018751;
	Sat, 3 May 2025 05:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=inI6MUKmqlTmRFr++
	9JUAZsfAWPVWrFtVxsCsA3vcFk=; b=WMU2vsQKPOnUQhtMB/zbycJOowAQR8g25
	yfPEHqxvAen1PeriqT5dO25PHlQIEFn3/w727sv6x9P/b2BvdirrDJ9kSc9Oh5G/
	AZi5pst4JLkBzLSJZxmBhhKBntAxHkyC2iVNR1ZX2rhUmmxNIXw7ugZRA2dtul4L
	enr8MdsevusQOF7oD/W4ePrIgGmEVfq4EhCxPbTKXy/FtvbhA5+vmGcFeb5OcRIQ
	WcpZAhZ8g5jq8K/AjckiSuTq0dhm8CusJ+3LQMTwPUkFu/bYJPqXb13poA/AJtN+
	n4jIebS/2fLUlnJxeJlOgChNM0TIl4bn8vBPaCdOTACpPvcr5Xg5Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46d8jr0p4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:45 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5435ejbf018962;
	Sat, 3 May 2025 05:40:45 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46d8jr0p4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5435cOZ6000700;
	Sat, 3 May 2025 05:40:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atpw199-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 05:40:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5435egcC52494732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 05:40:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8253920043;
	Sat,  3 May 2025 05:40:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BAFB20040;
	Sat,  3 May 2025 05:40:39 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.98])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  3 May 2025 05:40:38 +0000 (GMT)
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
Subject: [PATCH v3 3/3] drivers/base : Rename register_memory_blocks_under_node() and remove context argument
Date: Sat,  3 May 2025 11:10:14 +0530
Message-ID: <9e9fe4715c729e54e3820de0f24c185a26679e72.1746250339.git.donettom@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=TduWtQQh c=1 sm=1 tr=0 ts=6815ac5d cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pSmtlzIa0S65UvMo3TcA:9
X-Proofpoint-GUID: h_Qxi5KQ9QHkcf3fhZ1-Qn6b1Cy1d_-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NSBTYWx0ZWRfX7GLlN1lEuTuF s81unHmQd7Np8GlRsL3+U+j14id8M9FF8AJpOi3YtxMHrF18tmmIDgvGrSUsaocN+hKllC1f8sk Pp8cPttbkgbWFkiIYrHW7pOvzKnAApgiWCq5xF2a93hyYIB8dbg0eLS5bOclzDYO36fO4jvo073
 CKfERfMPHtgk3e7g/adnHvs12XK7i8aLldGMnrbRHIePGOkRlL6t/Wo/wnRn+Nf9S3wwqlUioyr 2LVS1OVNq46es8RKZCEtusxdUZ7ClkaL90wAk7utlpttt2/mrA9Lgu34bMSDB53PgkTiREX8d+n WpjI+x7jRdoboiQPFxJ1ASENS/nubVQNKfRls8tDiaybnJJb9FBaxAkyhbUG6+P77Lp15LF6zLF
 5c6Z1Si8djEjrfVRzm20J4cl5Otn4GeS9yfgpraxUOQVS4XCGTOz15Ngtoi2AjqljfRXKZ1N
X-Proofpoint-ORIG-GUID: cD9RStQBoKFd80914gyHdZ302U33Ij-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030045

The function register_memory_blocks_under_node() is now only called from
the memory hotplug path, as register_memory_blocks_under_node_early()
handles registration during early boot. Therefore, the context argument
used to differentiate between early boot and hotplug is no longer needed
and was removed.

Since the function is only called from the hotplug path, we renamed
register_memory_blocks_under_node() to
register_memory_blocks_under_node_hotplug()

Signed-off-by: Donet Tom <donettom@linux.ibm.com>

---

v2->v3

Removed context argument from register_memory_blocks_under_node()
Renamed  register_memory_blocks_under_node() to
register_memory_blocks_under_node_hotplug()

v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
 drivers/base/node.c  |  5 ++---
 include/linux/node.h | 11 +++++------
 mm/memory_hotplug.c  |  5 ++---
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 948392b477ea..206944c83849 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -839,9 +839,8 @@ void register_memory_blocks_under_node_early(int nid)
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
index 93beefe8f179..ac233c302d1d 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -111,14 +111,13 @@ struct memory_block;
 extern struct node *node_devices[];
 
 #if defined(CONFIG_MEMORY_HOTPLUG) && defined(CONFIG_NUMA)
-void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-				       unsigned long end_pfn,
-				       enum meminit_context context);
+void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
+					       unsigned long end_pfn);
 void register_memory_blocks_under_node_early(int nid);
 #else
-static inline void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
-						     unsigned long end_pfn,
-						     enum meminit_context context)
+static inline void register_memory_blocks_under_node_hotplug(int nid,
+							     unsigned long start_pfn,
+							     unsigned long end_pfn)
 {
 }
 static inline void register_memory_blocks_under_node_early(int nid)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 8305483de38b..e3e83ae90c7c 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1575,9 +1575,8 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		BUG_ON(ret);
 	}
 
-	register_memory_blocks_under_node(nid, PFN_DOWN(start),
-					  PFN_UP(start + size - 1),
-					  MEMINIT_HOTPLUG);
+	register_memory_blocks_under_node_hotplug(nid, PFN_DOWN(start),
+						  PFN_UP(start + size - 1));
 
 	/* create new memmap entry */
 	if (!strcmp(res->name, "System RAM"))
-- 
2.48.1

