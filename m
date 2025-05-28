Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F0228ECDB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452735; cv=none; b=QV6R5bK74ql9pmGuK4FpYayGHPXyfjUpMqeuNtlt3Jd0/YJLzjl0sVu+SC22hx7fbtIXMMvW37rtKSuau7qlekfRVe3KEkHzbY2L9/LGZ0P+INApU0kl9QiizhDgRK5xJgIvym1XluUOM6CCwdargh53AmHVCZEm84t+2bgraxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452735; c=relaxed/simple;
	bh=ckIhFdxE04Lau/vKJs59Z1zqSBhVHfsavPj/gDhabdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CTJ6PYmWXzSf94gQrxshy/5CFboSqSQbooXStF012t9Gcs1TKGR74NXQE5aM70p/ELt0AXpaR3cw1pGNgZR5IthNqjsgRZnxj5NLs04EmCp00Eh05YtlwBrk3ys1Nztclw79ijhDYMi786WwzPU9dPx3UYtu2HaIOtmHnzMZY0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=r8Bd5g/F; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="r8Bd5g/F"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SE9b9A032088;
	Wed, 28 May 2025 17:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=D7/L5K8Z89ZuqhiYt
	FhmptPNwJ8U1u1PPrC83182IKY=; b=r8Bd5g/FnFTLY58rwGSclASQI82xn9N5d
	9zAJZHwz86QPj94AMRWaZ30csGj7egNw3RvWllmIPKYFUUb33mkEUHjQukH+MlLI
	hdqgcC4D2gkET5rbUy/ZHIuwUv+HrSZKv3d7D1NGlJo3D/9HcFD83AfFnR8KJSBc
	cdyt/gh7a1noGWqcBFAB7TsRex2KMOnIzksLqcomBbvukHolx6fwRTyJwf+14YAy
	CtN/FCRT7RsSnf+uqjW3lIrs1mC3pUlJPjgwL/VwRlqTX1l8dOiuOAFAiX7gODnd
	ZC8ygNDoYcW7Euk6KS8Vh6FwWEweHN+IzbCsvIkhjRLWDoeh31dTQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40js0fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54SHIV0k025448;
	Wed, 28 May 2025 17:18:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46x40js0ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54SF8RJB016192;
	Wed, 28 May 2025 17:18:30 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru0rmsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 17:18:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54SHIQRL60096848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 17:18:26 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 243712004B;
	Wed, 28 May 2025 17:18:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F7DF20040;
	Wed, 28 May 2025 17:18:23 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 17:18:23 +0000 (GMT)
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
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nilay Shroff <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v7 5/5] drivers/base/node: Rename __register_one_node() to register_one_node()
Date: Wed, 28 May 2025 12:18:04 -0500
Message-ID: <8262cd0f44eeb048a1fcd3ac8382760d7f7dea60.1748452242.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=SdL3duRu c=1 sm=1 tr=0 ts=68374568 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=TOWdrs_80VijkQ5-_Q4A:9
X-Proofpoint-GUID: B0Hc32s58QfmHv4DN76JZJCET9P27pX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0OCBTYWx0ZWRfXxDf9vCNip17n EuzL8qRC7JXPaMWJm12lT2qTLQrnShmEFkJeeFGPXsMUvkMOO/br5TuzfmANereOhydHd99YAgV ySpK3swLyNk2yRiOCo/hfkmCi45q9BrFfZ5qPDruY9h/BRJ70tQsoDiASGyZhAmpjWYzxmGum2e
 aYXd8Kw0HOPox4NjbsnlS6JfVgVeJCfkZHPnEWoYXV4LQ91hrBiPkYBn5GcPbC0Lzi2DMnVvpVC A0SKv6dCfXkWC1D8Q2xgx7l+pt5JOwfjP1RRCReGtyAKNQg1UpEWTpq3xHl1Z36Q6uQSne8ErZZ /OY/g1VFsFdFxHUPBeKZUJANnJL1us2AmtvuTSj3e7MM4CNJaGFxMcNKMk7JC53cAps+xQi0hR0
 1PYRHPD1moQQWT8CcrdAUZuwOkafcyoStFAQAcRy+k797dV6wLcIJx/fsMcwJ5HpES9nF1qo
X-Proofpoint-ORIG-GUID: B3UWd6qwXRYfKH4sHkfP79h5sKOS5QTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=984 suspectscore=0 bulkscore=0
 spamscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280148

The register_one_node() function was a simple wrapper around
__register_one_node(). To simplify the code, register_one_node()
has been removed, and __register_one_node() has been renamed to
register_one_node().

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
v6 -> v7

No change

v6 - https://lore.kernel.org/all/bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com/
v5 - https://lore.kernel.org/all/d2490e807b2c13950bc1d4199f22ec078cc4c56a.1747904868.git.donettom@linux.ibm.com/
v4 - https://lore.kernel.org/all/f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com/
v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
---
---
 arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
 drivers/base/node.c                        |  4 ++--
 include/linux/node.h                       | 13 +------------
 mm/memory_hotplug.c                        |  2 +-
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 52e2623a741d..aeb8633a3d00 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -29,7 +29,7 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 	nid = of_node_to_nid(dn);
 	if (likely((nid) >= 0)) {
 		if (!node_online(nid)) {
-			if (__register_one_node(nid)) {
+			if (register_one_node(nid)) {
 				pr_err("PCI: Failed to register node %d\n", nid);
 			} else {
 				update_numa_distance(dn);
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 973b7a89a37e..baab9348244f 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -839,7 +839,7 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
 }
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
-int __register_one_node(int nid)
+int register_one_node(int nid)
 {
 	int error;
 	int cpu;
@@ -946,7 +946,7 @@ void __init node_dev_init(void)
 	 * to already created cpu devices.
 	 */
 	for_each_online_node(i) {
-		ret =  __register_one_node(i);
+		ret =  register_one_node(i);
 		if (ret)
 			panic("%s() failed to add node: %d\n", __func__, ret);
 	}
diff --git a/include/linux/node.h b/include/linux/node.h
index 75b036a100d2..88bceebcbfa5 100644
--- a/include/linux/node.h
+++ b/include/linux/node.h
@@ -128,14 +128,7 @@ extern void unregister_node(struct node *node);
 #ifdef CONFIG_NUMA
 extern void node_dev_init(void);
 /* Core of the node registration - only memory hotplug should use this */
-extern int __register_one_node(int nid);
-
-/* Registers an online node */
-static inline int register_one_node(int nid)
-{
-	return __register_one_node(nid);
-}
-
+extern int register_one_node(int nid);
 extern void unregister_one_node(int nid);
 extern int register_cpu_under_node(unsigned int cpu, unsigned int nid);
 extern int unregister_cpu_under_node(unsigned int cpu, unsigned int nid);
@@ -148,10 +141,6 @@ extern int register_memory_node_under_compute_node(unsigned int mem_nid,
 static inline void node_dev_init(void)
 {
 }
-static inline int __register_one_node(int nid)
-{
-	return 0;
-}
 static inline int register_one_node(int nid)
 {
 	return 0;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f734cc924b51..4dadd156f836 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1571,7 +1571,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		 * We online node here. We can't roll back from here.
 		 */
 		node_set_online(nid);
-		ret = __register_one_node(nid);
+		ret = register_one_node(nid);
 		BUG_ON(ret);
 	}
 
-- 
2.43.5

