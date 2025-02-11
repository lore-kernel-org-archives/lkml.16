Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C125A358
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290513; cv=none; b=DoPk0T4YSwvPwCNSSqo68UGU3JiNIsa2WaJ+CDcX/JSmBhTBEFMnaVgo+Xj33SOXEy+wlk3/nQWhJYsnNsO/mLDuvqMbi2hlzu/Hk0KDNVraqLfTncTUTpzVrzcCFC5T9DXvg03Ffz63ZkHb/sfRTHm4Mru1F2yjXp0e5wJGn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290513; c=relaxed/simple;
	bh=Ya9CPMG3cp0++iEmZFhLTWNjdIGwFrlAsN/ATRuYtqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZu+Mp+POD7oWG84vf3wsdnL4tDBlytq2v2TlueVeYQyHSimf7rHd6oXHeFynvaaweu/NT/V1DYQx89tmbgt68SqNCPtOIe6GW9mkZu6sX20Kgq2OskB81XZNgrnyl9ZaK27iwkKoPF+nx2KPHQ2uIKXBEwG7T97rU/5tCHNtbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=BGuQx3dE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="BGuQx3dE"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B7XsWl016779;
	Tue, 11 Feb 2025 16:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1/MffBCUm9m82jvA1
	NRJumlTJ0JqOPkuZuVYPCmtM1o=; b=BGuQx3dEXiml+/fqh7ikWhU7v+YLresXm
	UPWS8CFxBcuPO91eywCSG1ejECjYYJsMh45itoin99j+GWMW4AcTEYvSJWIL+gJt
	S/69iM7i1XJzu9s7nug6+XtKfCb0MCDKTvRdPxrrSLgEG2qXZCGP3Aaj50hehBHj
	tJHdTchwiheWkVRKOCLGHIENY/fjUa9USdEA4HSYR91HZ90rCNiZHRCbrdli8NEU
	PdmXcQC0HihTunCgGZehVKtsMVHfzeHwdLYuTgpLRzuXKXTAn25cBI4KlUQwdyZv
	cZaeo0DkNbFxsj9GuifJnBADlZzrx4W2wjDmsznOAG4SBfhPk9MsA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r28ptdub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:15:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDg5xx016692;
	Tue, 11 Feb 2025 16:14:59 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pk3k41b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:14:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BGEvJv38535552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:14:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F0A320040;
	Tue, 11 Feb 2025 16:14:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C72120043;
	Tue, 11 Feb 2025 16:14:57 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:14:57 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.150.7.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6CB2B6014F;
	Wed, 12 Feb 2025 03:14:52 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me
Subject: [PATCH v13 08/11] powerpc: mm: Add pud_pfn() stub
Date: Wed, 12 Feb 2025 03:14:01 +1100
Message-ID: <20250211161404.850215-9-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211161404.850215-1-ajd@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D1Ls5QKgaJ4jVjTDfpaP9Z9WwkAgttuP
X-Proofpoint-GUID: D1Ls5QKgaJ4jVjTDfpaP9Z9WwkAgttuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=742 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110106

From: Rohan McLure <rmclure@linux.ibm.com>

The page table check feature requires that pud_pfn() be defined
on each consuming architecture. Since only 64-bit, Book3S platforms
allow for hugepages at this upper level, and since the calling code is
gated by a call to pud_user_accessible_page(), which will return zero,
include this stub as a BUILD_BUG().

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 2f72ad885332..bb43e4f46367 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -215,6 +215,15 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 
 #endif /* CONFIG_PPC64 */
 
+#ifndef pud_pfn
+#define pud_pfn pud_pfn
+static inline int pud_pfn(pud_t pud)
+{
+	BUILD_BUG();
+	return 0;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.48.1

