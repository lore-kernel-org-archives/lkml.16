Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB01A00F0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665895; cv=none; b=WtU94QNwp+PAOsiL6koNTEuqkaAww0z6abJqynkhjQ3zEVMNCmDR+UKeksyqHhEwOREmX524HjlYVYCihlrAsr5LxJ5yKWlhdcZSKyqMDwyluaZqkANZ+NYC8uSQYpQBxmOxIa93VTAVOsR0UX0LG1oNW5PcexC0jCDMR2nzNvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665895; c=relaxed/simple;
	bh=+OHByPgRl5RiXGFNl0E58mJNINq7pj5C9YweCi5djds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfZdNMvCIvuTOlpfei8DDMpf7dFvtbBbAEg61/lUUl7Uny5Cc0ktPVVSU1nEWl49OhiB57C/JFJpL3XLjwVdyE2uReT7iBtfJ45JnZcMBaiU/bH2y3Z0wwFj+WUX9Zm7M9X/qxQXVIeDt6nRujbglR1dqqEDexx5zmxJAinjHdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bfOBrXv6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bfOBrXv6"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3i5Zu021411;
	Mon, 23 Jun 2025 08:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=2AMcuYHsldxHRn+sbTsoboTobvXdpEEEIuvyOd9+x
	E8=; b=bfOBrXv6DX80JNX2tjCb9YzRKmzMsQ7f319/Fu82yb/jhn2OdlLNEK7rH
	nsYcaVjOBRyHeKOQkbuQ1V7rmHw0rAzRwj1txAOiKZW/LMgAe+rQI7FKAdEP0jip
	SHCZxlML2tjCuUTcvYatXtpwSn4bn+auDzEffp2AgPbipy0PNJF6Vb72/PmqdrCe
	jRdfNKNAV4KWuHILD872XZqGOZErLw5opkideQ5AOjDBusyhW6xqMYPzx2SoeVc/
	GywQVgL1cvE75wadzk3NWCP65tWvkiNrwPYc0slMvMo2ur/+OTP3+QWoUDTEDnhq
	f2vuxI3VX8UIAj9/ETzbONEuKe1kw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5tg9h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:04:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55N60Bp9014698;
	Mon, 23 Jun 2025 08:04:42 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e9s24t82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 08:04:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55N84e6T25166364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 08:04:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEFC12004B;
	Mon, 23 Jun 2025 08:04:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD82820040;
	Mon, 23 Jun 2025 08:04:40 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Jun 2025 08:04:40 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 65FF6E073A; Mon, 23 Jun 2025 10:04:40 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm: move mask update out of the atomic context
Date: Mon, 23 Jun 2025 10:04:40 +0200
Message-ID: <20250623080440.3005693-1-agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5uzd94gi1LW3t-YnPUx-svgf-hSM2JJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfXxDrWbhO9SBzZ khbnsS2thK392Wj8fdxXCOAjsiTEuLZSc1cyNKCgZv4fVYoL4ZIc04a6wMszS8GffakRMMUs39N QgdtoicBMACmuj22SxnAJxAjSGvjw2jL0LfjoDVqC/5+4y5je3mzixyF/PmJsxix2fs4PxZO3l/
 BWgM79qr7M/jVwWULeySSC8oN+kSrp36w97yB0ZcwYI4H9juOmuH+lpCotUbvEkBZ95LlOC6rov o6PQHiYrODe0SQHWhxtoH3whfMpZbPcoDi/nW3CdYCmBFdDfXMvHXQozYUP5VbC4xaLmumlOK3Q d3GzgBzOfKZ8NsdxyTWw0F598PGkxCqLjwEWzrg2oOUZmTTAiupcCdIrVzEsFN8ON9A4nyVyc1b
 GBvMXJh4nY4CS/3LvLoTS0bvCmjJhxCtnSTEyeNZKD+KkmN8P0Vm8lrY7muaOVQv0BZmdTyF
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=68590a9b cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=gryDZzxsDFo3jIyxcIsA:9
X-Proofpoint-GUID: 5uzd94gi1LW3t-YnPUx-svgf-hSM2JJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=807 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045

There is not need to modify page table synchronization mask
while apply_to_pte_range() holds user page tables spinlock.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..6849ab4e44bf 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3035,12 +3035,13 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			}
 		} while (pte++, addr += PAGE_SIZE, addr != end);
 	}
-	*mask |= PGTBL_PTE_MODIFIED;
 
 	arch_leave_lazy_mmu_mode();
 
 	if (mm != &init_mm)
 		pte_unmap_unlock(mapped_pte, ptl);
+	*mask |= PGTBL_PTE_MODIFIED;
+
 	return err;
 }
 
-- 
2.48.1

