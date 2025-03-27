Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BA21C8634
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109436; cv=none; b=gWtj3oYpiNjW57BrdTqgpmzQ9KrD6u+nceBnmpf8bSJImLWB8Zwf0RuFJB3YMLHI9oAQMfslGfFGsEcXvHiMg0QfxS+dXwKppAYIUar8lgigrSAUZOUZhtLcYQl5yU64eyHPxoy4S8tOMWnu6UOojHSHzEaJPd5fiBnhqrC1I9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109436; c=relaxed/simple;
	bh=Fq5RPeP3gRNpdG2hzkrcEqaIDf/0+EsYC+SVZ+O+SMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TefrFrQoT6QrZAwuPRAIkvCrF5DRwGObpYabft1bRRqnArabnbhsCBWzoY8TOf+jQmKn2pn+jdXI6Y8dbs+CcllAVpI6exK42/qVIxzq3LKZZ6yLlg0W7JWUlMmTQG2MzuYnRWXCkT37Xvm0jeuHTtDA/qfBiZUbNd1iylXgaVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W+LpcG8H; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W+LpcG8H"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RJu7rQ028357;
	Thu, 27 Mar 2025 21:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=1kOan
	1MEwIc+R98iNUHZL4R6nmc6Q6LTwX431Naq5Xg=; b=W+LpcG8HeZVjGVILSxOwU
	MQTXEAa5OijZOfSgxDV7WVJv+EfpTRMY55STksZ78wUy4FLHTrOPFSv/Pdmnf+bG
	CgGu1HFZPNcsgCBGrMM9fUf75wAP0Wa4BrAjgjGv/SNGTTq0dCO8twWoCSswvqnu
	ZAqI4MrM/tciIbsb7tiirGn4ugO0MkCXtRqMrYq/TKWNI9TB7xtUY1zGZLx1wXVw
	EB/VvSLd1wR8ez18J4MzjqGl45RsPguAoIAzSneoeHVPaF1ELF4IDBrmg7200R7F
	nbfu61I4zGVl3egOA1ogti0ojaQzF5aN66OECuX1Fxiv5pxO9a14bRSSDmXuutbS
	g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn7dwpv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 21:03:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52RKeCfo022884;
	Thu, 27 Mar 2025 21:03:28 GMT
Received: from bostrovs-home.us.oracle.com (bostrovs-home.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.198])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jjch6mpa-2;
	Thu, 27 Mar 2025 21:03:28 +0000
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: bp@alien8.de, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Subject: [PATCH 1/2] x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
Date: Thu, 27 Mar 2025 17:03:04 -0400
Message-ID: <20250327210305.1694664-2-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270142
X-Proofpoint-GUID: zpKHM8InmKoYicHyoM0_bjtLp_6wlPQo
X-Proofpoint-ORIG-GUID: zpKHM8InmKoYicHyoM0_bjtLp_6wlPQo

When verify_sha256_digest() fails, __apply_microcode_amd() should propagate
the failure by returning false (and not -1 which is promoted to true)

Fixes: 50cef76d5cb0 ("x86/microcode/AMD: Load only SHA256-checksummed patches")
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 138689b8e1d8..b61028cf5c8a 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -600,7 +600,7 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, u32 *cur_rev,
 	unsigned long p_addr = (unsigned long)&mc->hdr.data_code;
 
 	if (!verify_sha256_digest(mc->hdr.patch_id, *cur_rev, (const u8 *)p_addr, psize))
-		return -1;
+		return false;
 
 	native_wrmsrl(MSR_AMD64_PATCH_LOADER, p_addr);
 
-- 
2.43.5

