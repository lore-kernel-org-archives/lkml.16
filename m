Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0C81E1A3D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431662; cv=none; b=lRNNx7F5ToH7oZdvpy7tYalkum8HxxgZb5rfu10NCbnXz58w8ZORAfsqWZV6xGjqBcHhhqRtF7qejaAk42hJ1XRbyN93wYxkv/+rai53ZIYwffI+ATbrOmKvVLra0H3VvyZU46/cWvE3PCmcWXyI+ujnkn0ObtXvmBKCjTThtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431662; c=relaxed/simple;
	bh=g1hYJuDYMuiFu/5q2bw+kLYLPNqgFWVqNLve7lYpB8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAys5VQq8g8K8q+0dJzNEmQovoW3GC3OY45a9Qxy55Zf6rSu7resDJoUykeiUFrZyr+A3l3oG60MsayrygtS5rkJpVUr7aOTCjMGrGSN7+Z9I2WhQ4ERKO9V2+tzvz3OYS2cNBSVZPmG4MtFU2xkcOl6+4DHgGuhMWmRc5mX4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ryOO+MLR; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ryOO+MLR"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Ldtip013927;
	Mon, 5 May 2025 07:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=OqAhgP8FWBlXmf8nF
	2v4BPjYZCHOc6b7lDMnCVmQOZo=; b=ryOO+MLREZm060gT6CQkIGtzaIc/tsrYZ
	pTBRZCQxW/xoEg2oJkgOga9Djjn0m8pxHleT5A6PDJIFS4iS189Uh3raYlCpFAGq
	jaRJx897jXaoH8OhUrmlIoIdfAy+7ioN7x7ba4xT6Rus0T4C7AdbFlkf1lu9H0pF
	j5aQMO0F69LqibYtyssijfO6/cJ7sTAL8huixtJEIc3LK6hyA+YF7LHH15N+r3Gb
	T/25FrL0WrCUWxVSQ6I/w9uuwLgj5Y1r9b2ZQJjGGdntBt0V1AkVNxaZ+SS4B+9e
	3bX9aC848FcuNqUlRylUYIjDIvVfBpxT2MBBU2OWOtqhB5T6p8jeQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egb7sr3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:07 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457lvb1015756;
	Mon, 5 May 2025 07:54:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egb7sr3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453EFlB002713;
	Mon, 5 May 2025 07:54:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnn832-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457s1Le50069912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C362020043;
	Mon,  5 May 2025 07:54:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9066720040;
	Mon,  5 May 2025 07:53:59 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:53:59 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 3/6] powerpc: fadump: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:30 +0530
Message-ID: <20250505075333.184463-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WCnN3m6NyGpt-ZNmy6anH3a-MhMpyHca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfXwbFSG1kvXsC5 TjLE9qbWti8tDJ4Uqf4zaIH/IKw2qbTkW1FH8rJUEj2Mjv5elQ/WZl4Q315YonRZdFu2ibTu3Kx kwtT84NLxWYhK26TyUiIKnqRCpj6kQZKYS7M76E9mPEk2z5k80OXL7WB7BplPMJfSd4EZFoWb3e
 34p+ghlQESirdtyEJH+w6gM33B6r8VAQjRyINnvyI5L1DMjDjnGIQwzvzrpMollysLY43i8MuzU nrPxrIMdSFKqtxD/Ps+q0Bu3PBGFfWgV1g9A5Lfl90gHzPhiADvACr6PUDhZvmCer5pp7/r0ApB Ub5OF71gqzmvXRuUXXJ+yuvT9WMJ4wNhUTlxm6rBBYPnpOkbnnvc3dEvajY797awl3KiRmnQMud
 LX1iFk0+OCsU7JNLHIhV9ZCxQ4X7r7hBNcm1zCdPRXtN5oobSwJ1j3Gw6+NhNh7Y4ZTr3HxX
X-Authority-Analysis: v=2.4 cv=YcK95xRf c=1 sm=1 tr=0 ts=68186e9f cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=WIUl_hUChEs9ptHD0HQA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 3v_uOT5hiA-TuCE7Z1T_UDbXXHkLZD9R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=768 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070

use scoped_guard for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index df16c7f547ab..b8c7993c5bb1 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1375,15 +1375,12 @@ static void fadump_free_elfcorehdr_buf(void)
 
 static void fadump_invalidate_release_mem(void)
 {
-	mutex_lock(&fadump_mutex);
-	if (!fw_dump.dump_active) {
-		mutex_unlock(&fadump_mutex);
-		return;
+	scoped_guard(mutex, &fadump_mutex) {
+		if (!fw_dump.dump_active)
+			return;
+		fadump_cleanup();
 	}
 
-	fadump_cleanup();
-	mutex_unlock(&fadump_mutex);
-
 	fadump_free_elfcorehdr_buf();
 	fadump_release_memory(fw_dump.boot_mem_top, memblock_end_of_DRAM());
 	fadump_free_cpu_notes_buf();
-- 
2.39.3

