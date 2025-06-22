Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3453481E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750593711; cv=none; b=NTkZtkzWA16WP7muONDl9Qwv85FTiougCT2GCwnb3Qm5SdxNkrBABolpmfneGOnySwNAm3MW6w6JWqLxYNrpkWPKXFPfE/K/e5DEzqBsOGdPT8z3xecUEZ1d2vsau0vzeIBMMzWgXqb57g5ap4lDCbwiaCNJG+kH+CM0VX68XGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750593711; c=relaxed/simple;
	bh=1YVscIhQte8srgde9FBngOLHohQo1i7Dyj3WpbWh50k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lo5aY3UkesuQOa6omh56T9LJPB7RdgTVESSWQXcMvmA4X2AabxTv1aN5oDkcUi1FCEuWxsieq4pLfgZAVIeCcVPJqze5x6diZ0UUEia2tLtnXWc9qaia4biXA0ix/ZXG2K75LJl08SVkFlG7ttxncbkmYDuryh6CrS20UWJfJDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=QYq2GBVZ; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="QYq2GBVZ"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M9maoS010062;
	Sun, 22 Jun 2025 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ef0VbalxgvFFroWpQ1CXd3B27NS/ujuqE1tR87+85
	m4=; b=QYq2GBVZk+4/oF4Bwp1Ng5dh4pxa0jtPIYx3cNO68Es/ftXOE5681ALlp
	YZVthtLjos2yOJCaiIhsWNcqkc678B8LnD0TsSPhKcirxU9mci/GnwKi7k62LQnC
	WsD/oF1cUWiMHwhRrJaGSrWC/5FcEQhEnULEq2PH0Za022o2+7krn3vPFf3uwrwW
	o75GojY7p1jk/6cPdOyDlAHxD3/ltEemLc4sQxkhLMk/7MRWSkXnitlhjTZnGGK9
	lhRyIBfK8nzcrf7fsnSDpSVZf2t/C3Uvz8nNZ8H5TFcZ+jKtXiPVqxP0WNdm+NCZ
	xiXL59TNeFZkoGp65F76ytT0be61A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfdvkn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:35 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55MC05sC007533;
	Sun, 22 Jun 2025 12:01:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfdvkmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55M7gNqq002908;
	Sun, 22 Jun 2025 12:01:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jksjb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55MC1Tvs32899770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 12:01:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5008820049;
	Sun, 22 Jun 2025 12:01:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE20920040;
	Sun, 22 Jun 2025 12:01:27 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Jun 2025 12:01:27 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 1/2] book3s64/radix : Handle error conditions properly in radix_vmemmap_populate
Date: Sun, 22 Jun 2025 07:01:24 -0500
Message-ID: <7f95fe91c827a2fb76367a58dbea724e811fb152.1750593372.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ko-1ZNUOnmS_lZIXjpwNo6inw7KsRJHM
X-Proofpoint-GUID: bIjkYh3LCsCiCwK1X0Xbl0EkN5pl16-Y
X-Authority-Analysis: v=2.4 cv=BpqdwZX5 c=1 sm=1 tr=0 ts=6857f09f cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=ttLXqP_FGL-iw6hVZZ4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA3MiBTYWx0ZWRfX3C+tcKRn30zn 99Tqk3xu9v5yicEvgMQ6QLqrH4K8V8iVD6l9yXZAAd9jt6ykBS78WBmHXDnYy0RFnQmYmV+Kizj NL2Q86qcyGJOc/e/utWpIiCVwd5xxEf0+JNs2K1nnIjTW3rVuCv2WeVs+yJXKi3QGSBNazd/tb5
 LPjvEOYt8llhVOG3HCVzFqvT+S0AgrqOcIOKbMzeRKZzqZ+lstnP00DJZWvhk3U6VoRUaOvz7dy 6bajVi8HnLzxHywYlp0pU9v1pAnqGGTV74r97yYkKH9b7J2o0BPUEo27IJGCOCyTu7xIsLsPAtj tlx46YO4vgRf9E8a0OLPhJLBT4vjhCWjrzygajjnnvY+HLZQoCc6+c8e/3xN9eNwewlHuk2qatM
 SuNOJCjIDF5MmHbpt1B9ERxMokY+sw8D03MK7bQaIlBaFV2pPNcFct1nOHb8Glob5q5UEulg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=720
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220072

Error conditions are not handled properly if altmap is not present
and PMD_SIZE vmemmap_alloc_block_buf fails.

In this patch, if vmemmap_alloc_block_buf fails in the non-altmap
case, we will fall back to the base mapping.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
v1 -> v2 - rebased to v6.16-rc2
v1 - https://lore.kernel.org/all/e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com/
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc42b8c..3d67aee8c8ca 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1173,7 +1173,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 				vmemmap_set_pmd(pmd, p, node, addr, next);
 				pr_debug("PMD_SIZE vmemmap mapping\n");
 				continue;
-			} else if (altmap) {
+			} else {
 				/*
 				 * A vmemmap block allocation can fail due to
 				 * alignment requirements and we trying to align
-- 
2.47.1

