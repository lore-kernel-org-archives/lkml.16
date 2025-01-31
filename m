Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9210E0
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323551; cv=none; b=r++DrbZmzinOQGqljQgP2Dj83Pv5zeIT8G7lXYwyXOOZUAohEukIO8Bs8UF3BdLNqsYEFXA6QrYA3/8292scfiH/qTtf2N654T0NPjBVPFiG6vXGTGlih4K0e90Y3CiCgDNMJOmjExPxbzz1WqYACG+ft2bfgJnka+Uq6aOZwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323551; c=relaxed/simple;
	bh=wP5g3NiGo8Hv8hpLCk2ZBYlXTjLKcA3/A/mMRm0Jgwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeIIzCUIASIkIJM6G+RF0lewiwbItlOP2o7LDgrXp2TftDYTHvh1tzN38VtLf9E2Cd+U1KRW/hzNAIsJt8W+IMKv3kUc5lGJ8s2Y0PFILxJRIGNgSo8m6U67SJzf7c9DAcCp03GMyt8B8cYAYvRJm8aK9W18WQ7ogPYPa547wo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SF2XRTvB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SF2XRTvB"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V2OZ3j030769;
	Fri, 31 Jan 2025 11:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sRPw8EikbB6hNm82K
	wvptzvv0MyQS1J/WqpM4E2FbYQ=; b=SF2XRTvBQrACH84/+sKr9pjKsxR4gWyeW
	JRavQ1iLeDVaFSIEgerJpVToqSfyiirlJqw+3f0Xj6iSR2NbLPcaWA6dH5nYdwvF
	xReUPV6iO8sKwpIL6nzvCRxWdp9jhjYarKJV4IYR+mIYInBoMeFz1xnqoXFgxNEQ
	kX8UGKmY/5O/+pTeHYKewdMAymAFTp5n1dr2Z5SvaywnZ+U5E+CvlKQz5nnlDCB7
	Z4tEvAs9QM+gcjyq96xGm7WeizBolrWl9eky6zvQbnzwTLe820U0oLzPahTMItO2
	4Peo3nWgOpr8MgTsSkXzDPufGqXSZvPjsmnI3fio13sm+kX/7MFaQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gfn5ba8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:38:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V8Ejtn013896;
	Fri, 31 Jan 2025 11:38:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gf93bb2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:38:50 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VBckI960424624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:38:47 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4B80200FD;
	Fri, 31 Jan 2025 11:38:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38C50200F9;
	Fri, 31 Jan 2025 11:38:43 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.16.21])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 11:38:42 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>,
        Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 1/7] kexec: Initialize ELF lowest address to ULONG_MAX
Date: Fri, 31 Jan 2025 17:08:24 +0530
Message-ID: <20250131113830.925179-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ieB63_zMsBoY1bOPmlpBdsX9Y-n-S2AS
X-Proofpoint-GUID: ieB63_zMsBoY1bOPmlpBdsX9Y-n-S2AS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2501310087

kexec_elf_load() loads an ELF executable and sets the address of the
lowest PT_LOAD section to the address held by the lowest_load_addr
function argument.

To determine the lowest PT_LOAD address, a local variable lowest_addr
(type unsigned long) is initialized to UINT_MAX. After loading each
PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
address is lower, lowest_addr is updated. However, setting lowest_addr
to UINT_MAX won't work when the kernel image is loaded above 4G, as the
returned lowest PT_LOAD address would be invalid. This is resolved by
initializing lowest_addr to ULONG_MAX instead.

This issue was discovered while implementing crashkernel high/low
reservation on the PowerPC architecture.

Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Hari Bathini <hbathini@linux.ibm.com>
Acked-by: Baoquan He <bhe@redhat.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 kernel/kexec_elf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
index d3689632e8b9..3a5c25b2adc9 100644
--- a/kernel/kexec_elf.c
+++ b/kernel/kexec_elf.c
@@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 			 struct kexec_buf *kbuf,
 			 unsigned long *lowest_load_addr)
 {
-	unsigned long lowest_addr = UINT_MAX;
+	unsigned long lowest_addr = ULONG_MAX;
 	int ret;
 	size_t i;
 
-- 
2.48.1

