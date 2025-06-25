Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E229AAEA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866178; cv=none; b=pQU6/ZZM1Rpa0MhSg1eWiYDCXNMx9PpmK3/T/yOgQ0x4nbYWcdBWpweEpqWNe5G5P4WUeoYYN0Fez5e5caxvaBfpb7L/SSKMI/YjRQV43xryURvPrM3IkRLZdijw14Uo4sDc3L79BaGhGXwygXSdqqFOL07dYXNnLXd2JqQiZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866178; c=relaxed/simple;
	bh=M44cOwDSOzwK6ucelmjTStq0tllOXs3obltXPDfLdQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mDf62FbvBhxqpgLGJiZQ2bxftJqMMDZiZqP+uMZePlH0jRP/1mqXOwPIFdXAmVfeEOf5LIcUzNbbj6DEzsYpM3tENXGaXO2lmLARMlAjB5BIzzcAlUOUULcpC0sgEpxuJUngnOGv9/8sKfdW+HGDhR2/Obqt5MpyuDQ1b64QifA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iCXlHVN3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iCXlHVN3"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAXcgd022278;
	Wed, 25 Jun 2025 15:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vyEEqkmbNpakBZYSZ
	1/rYXdlcg4gTMeSzG/cKgH2nlU=; b=iCXlHVN3yQocUdft/xe1wY5bAu2URlZ4b
	AJadqzJT69vck57uvHmk026pdX5S8nx39jNbN0x1gVBP56lDTWuPPyNzhvnNfBU4
	klLoiHmGqiOKymVt4e0lxATmVY7rCaDsstPjJ2RZU3C1LZNet5/2oYsDUsaX8yri
	DH/U4gzjhq7P/7NtY51H2czUS40iY2BvTXj8QTXE01T72wcIHb/Xq4kJegLMul2T
	ziC5/+zACslSB15T/36ahgS5TDK6qS3LSoijwaGcmeyHZZkVZ09/JdeG5Zp/RoEn
	MkYKAd7UQI9oh4Nf3nstAuU2fZR2kNGIcKwpCxFvxMnuEeehnpF2g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dme1gbpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 15:42:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD7n9Q014987;
	Wed, 25 Jun 2025 15:42:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72tt9m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 15:42:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PFge7m56492540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 15:42:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B32FF20043;
	Wed, 25 Jun 2025 15:42:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 494A020040;
	Wed, 25 Jun 2025 15:42:40 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.87.147.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 15:42:40 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] s390/boot: Introduce jump_to_kernel() function
Date: Wed, 25 Jun 2025 17:36:51 +0200
Message-ID: <20250625154220.75300-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625154220.75300-1-iii@linux.ibm.com>
References: <20250625154220.75300-1-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Tc6WtQQh c=1 sm=1 tr=0 ts=685c18f5 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=kbgPvGLC2egfjOHORFIA:9
X-Proofpoint-GUID: nhiHWanJEGOS7HP6NvY5FqU6yn5WIlvk
X-Proofpoint-ORIG-GUID: nhiHWanJEGOS7HP6NvY5FqU6yn5WIlvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExMiBTYWx0ZWRfX6K7374vUKs2d edUFeugOzVOh7ioaNg/yUpOrCjeRqgwBT+T1KITOHWfDHiFt6F6VQ1Hu4nv1VbkZbfqjwyk7dOH F4GZZR6rQux3AzhI9hGO+319l187AjgklGu48qs7KI8BxIwgC88noUi919xndAOVoka7/dQsBuB
 Lj+eWNd9CMFGgoKsR3CXCoVxKLNp0o7Df/gz6rDIW62PWtD4sx5aZaErdN1w67/lXJT3Yq5Zd88 esLfN0sVLHplYPEULyxo0hUcfVT70qtN9v7dYlIvdTRoQj2Y57ylReFtm4kbXNLjNp4TGxF0LBL B+6qYDxU1rPYpMH+NY1YNEotE7V8Zfd/bSugoG7JORrbhA6Exz0cBsX8/cW+mVTXKvlm3tO8pmB
 URSlcoRxNUO4IUGq6kW30h3a0wBe6QTDciLPQ+H6oaLPW+Dh9L0g7LIPINrzodWuNOYIKKxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250112

Introduce a global function that jumps from the decompressor to the
decompressed kernel. Put its address into svc_old_psw, from where GDB
can take it without loading decompressor symbols. It should be
available throughout the entire decompressor execution, because it's
placed there statically, and nothing in the decompressor uses the SVC
instruction.

Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 arch/s390/boot/Makefile     | 2 +-
 arch/s390/boot/boot.h       | 1 +
 arch/s390/boot/ipl_data.c   | 9 ++++++++-
 arch/s390/boot/startup.c    | 2 +-
 arch/s390/boot/trampoline.S | 9 +++++++++
 5 files changed, 20 insertions(+), 3 deletions(-)
 create mode 100644 arch/s390/boot/trampoline.S

diff --git a/arch/s390/boot/Makefile b/arch/s390/boot/Makefile
index bee49626be4b..30ceaa42224f 100644
--- a/arch/s390/boot/Makefile
+++ b/arch/s390/boot/Makefile
@@ -27,7 +27,7 @@ CFLAGS_sclp_early_core.o += -I$(srctree)/drivers/s390/char
 obj-y	:= head.o als.o startup.o physmem_info.o ipl_parm.o ipl_report.o vmem.o
 obj-y	+= string.o ebcdic.o sclp_early_core.o mem.o ipl_vmparm.o cmdline.o
 obj-y	+= version.o pgm_check.o ctype.o ipl_data.o relocs.o alternative.o
-obj-y	+= uv.o printk.o
+obj-y	+= uv.o printk.o trampoline.o
 obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr.o
 obj-y	+= $(if $(CONFIG_KERNEL_UNCOMPRESSED),,decompressor.o) info.o
 obj-$(CONFIG_KERNEL_ZSTD) += clz_ctz.o
diff --git a/arch/s390/boot/boot.h b/arch/s390/boot/boot.h
index e045cae6e80a..7c1b9a21018a 100644
--- a/arch/s390/boot/boot.h
+++ b/arch/s390/boot/boot.h
@@ -74,6 +74,7 @@ void print_stacktrace(unsigned long sp);
 void error(char *m);
 int get_random(unsigned long limit, unsigned long *value);
 void boot_rb_dump(void);
+void __noreturn jump_to_kernel(psw_t *psw);
 
 #ifndef boot_fmt
 #define boot_fmt(fmt)	fmt
diff --git a/arch/s390/boot/ipl_data.c b/arch/s390/boot/ipl_data.c
index 0846e2b249c6..c4130a80b058 100644
--- a/arch/s390/boot/ipl_data.c
+++ b/arch/s390/boot/ipl_data.c
@@ -16,7 +16,9 @@ struct ipl_lowcore {
 	struct ccw0	ccwpgm[2];			/* 0x0008 */
 	u8		fill[56];			/* 0x0018 */
 	struct ccw0	ccwpgmcc[20];			/* 0x0050 */
-	u8		pad_0xf0[0x01a0-0x00f0];	/* 0x00f0 */
+	u8		pad_0xf0[0x0140-0x00f0];	/* 0x00f0 */
+	psw_t		svc_old_psw;			/* 0x0140 */
+	u8		pad_0x150[0x01a0-0x0150];	/* 0x0150 */
 	psw_t		restart_psw;			/* 0x01a0 */
 	psw_t		external_new_psw;		/* 0x01b0 */
 	psw_t		svc_new_psw;			/* 0x01c0 */
@@ -75,6 +77,11 @@ static struct ipl_lowcore ipl_lowcore __used __section(".ipldata") = {
 		[18] = CCW0(CCW_CMD_READ_IPL, 0x690, 0x50, CCW_FLAG_SLI | CCW_FLAG_CC),
 		[19] = CCW0(CCW_CMD_READ_IPL, 0x6e0, 0x50, CCW_FLAG_SLI),
 	},
+	/*
+	 * Let the GDB's lx-symbols command find the jump_to_kernel symbol
+	 * without having to load decompressor symbols.
+	 */
+	.svc_old_psw	  = { .mask = 0, .addr = (unsigned long)jump_to_kernel },
 	.restart_psw	  = { .mask = 0, .addr = IPL_START, },
 	.external_new_psw = { .mask = PSW_MASK_DISABLED, .addr = __LC_EXT_NEW_PSW, },
 	.svc_new_psw	  = { .mask = PSW_MASK_DISABLED, .addr = __LC_SVC_NEW_PSW, },
diff --git a/arch/s390/boot/startup.c b/arch/s390/boot/startup.c
index da8337e63a3e..305e6c791071 100644
--- a/arch/s390/boot/startup.c
+++ b/arch/s390/boot/startup.c
@@ -642,5 +642,5 @@ void startup_kernel(void)
 	psw.addr = __kaslr_offset + vmlinux.entry;
 	psw.mask = PSW_KERNEL_BITS;
 	boot_debug("Starting kernel at:  0x%016lx\n", psw.addr);
-	__load_psw(psw);
+	jump_to_kernel(&psw);
 }
diff --git a/arch/s390/boot/trampoline.S b/arch/s390/boot/trampoline.S
new file mode 100644
index 000000000000..1cb5adf005ea
--- /dev/null
+++ b/arch/s390/boot/trampoline.S
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/linkage.h>
+
+# This function is identical to __load_psw(), but the lx-symbols GDB command
+# puts a breakpoint on it, so it needs to be kept separate.
+SYM_CODE_START(jump_to_kernel)
+	lpswe 0(%r2)
+SYM_CODE_END(jump_to_kernel)
-- 
2.49.0

