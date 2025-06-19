Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D457D28C2B2
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345045; cv=none; b=YZii9pE4hAIQVUweE22WFZQiM04X5m2YAn+SROOTm64t8ZqDRVS+a/neTh8QH48v9Eja/umX3h6CHeKD3OXC6BCyiy/Ken48X1pm0S8jRekEXCG3ySAAmKekDiXBjJn8jlfcLpZBpZfk7rQwdlU3epNuQj4slpelunBuec84wvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345045; c=relaxed/simple;
	bh=xDncNZ1LMSZ2vmrz0U4flqze0YPzr8pIo1W3I1JFvJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0YM0dANX0mjCW35Ug0ARqNq8FyHS+TJkLDAKYxoakT8uiSa5ogiEyi1ylbf2nUS/rrB3/J+n65pu+xvlvxUCPu9sJqxKkb4ipisjkzj4JQaakqqMBnCnBvSsHlkGN762jIaf71UTdW/demsocwrLigvnxzSvOkxuzlTXsZA3DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R+KPvIJR; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R+KPvIJR"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMZKd011354;
	Thu, 19 Jun 2025 14:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=doqIi
	4reJlriDhvs3y7SwGJ48Sv7QImP3E9ho3zRMUc=; b=R+KPvIJRQYDvjNbdLiVyq
	c/mc+PG9qdyTGlpCF3Ax8V/g6//K2r/oVcx6wMfkwr+njuyM8c1+xrBx2EOIqf9K
	Ne3p5Zq1ohcKqozlrMjJbWXNNY/9O7/9BpPm+y8gXbaNNZ/jvqOZggkl+pk4XynP
	OOsxbkS1LTk/wvaIGX/EHdhx7qyr1lWYzTfwdVcPkMUs7HL0evIHA1S9jAyWcqlu
	jTX5QOir6BdHOpWknogiZY+J8mqnMdnAUzsiiphM2J9kV4eN9hbPNaPAr8Ia84Gr
	RUarT4lK+bcvcqQXhpqZIcAoIhoSStkV/SaRrNRN2HAzSXjKdWuXOTCYFQRyL9G0
	A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f23qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDQ7Ax023309;
	Thu, 19 Jun 2025 14:57:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:16 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JZ008257;
	Thu, 19 Jun 2025 14:57:16 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-14;
	Thu, 19 Jun 2025 14:57:16 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 13/17] objtool: Improve register reporting during function validation
Date: Thu, 19 Jun 2025 16:56:55 +0200
Message-ID: <20250619145659.1377970-14-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
References: <20250619145659.1377970-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=838 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX77Sy8mHJT0LM ueW4sh6Vn07uo87RM8C30A6zEWMdfPSfoqVoW+qhifLRdQSdVaQzEnO/xQ73jNH/A8nA/o8Jqf8 1tqQNSSC/yOpncsfdFHT4mZcMpsaURqKRkYOPjg2KPLwASTev8QGkOIma9NvNgpML/+egL+huVZ
 qvJmJItxjJJTIbxECWfpUS8HXFofFcuxNeo9J2onVkkbknLfnvKopccl9zVhNIkbxiiHz/hCtUG A1e7rA91sAAEAq092fpUluiINkmAkDVZJUa1Zj1ChnDi6vwePyAr+7sMNEisJ34HIIYPKi78Z7I x5NLbSJk2s/gMJPzgAlrtkY1pPfZmMepeV6aHKXeBaD5yY+VJuTcR+SlVv0deddgylMV2DjF6a7
 mWjzqO+FVl0+hK+doh3uXfCRX43gzsP4W36qp/NmEDv+e3t00ks9E7AqnWvea3EWAZDIDc2x
X-Proofpoint-ORIG-GUID: JDzneLuCzdpCE2ggXwP45zU9Ixqge7Ax
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=6854254e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=SYeOCZSjma0EYi-zULIA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: JDzneLuCzdpCE2ggXwP45zU9Ixqge7Ax

When tracing function validation, instruction state changes can
report changes involving registers. These registers are reported
with the name "r<num>" (e.g. "r3"). Print the CPU specific register
name instead of a generic name (e.g. print "rbx" instead of "r3"
on x86).

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/arch/loongarch/decode.c | 11 +++++++++++
 tools/objtool/arch/powerpc/decode.c   | 12 ++++++++++++
 tools/objtool/arch/x86/decode.c       |  8 ++++++++
 tools/objtool/include/objtool/arch.h  |  2 ++
 tools/objtool/trace.c                 |  7 +++++++
 5 files changed, 40 insertions(+)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 09c43f008c9a..17eebf358e5d 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -8,6 +8,17 @@
 #include <linux/objtool_types.h>
 #include <arch/elf.h>
 
+const char *arch_reg_name[CFI_NUM_REGS] = {
+	"zero", "ra", "tp", "sp",
+	"a0", "a1", "a2", "a3",
+	"a4", "a5", "a6", "a7",
+	"t0", "t1", "t2", "t3",
+	"t4", "t5", "t6", "t7",
+	"t8", "u0", "fp", "s0",
+	"s1", "s2", "s3", "s4",
+	"s5", "s6", "s7", "s8"
+};
+
 int arch_ftrace_match(char *name)
 {
 	return !strcmp(name, "_mcount");
diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 9c3f49c45587..74d1a8603535 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -10,6 +10,18 @@
 #include <objtool/builtin.h>
 #include <objtool/endianness.h>
 
+const char *arch_reg_name[CFI_NUM_REGS] = {
+	"r0",  "sp",  "r2",  "r3",
+	"r4",  "r5",  "r6",  "r7",
+	"r8",  "r9",  "r10", "r11",
+	"r12", "r13", "r14", "r15",
+	"r16", "r17", "r18", "r19",
+	"r20", "r21", "r22", "r23",
+	"r24", "r25", "r26", "r27",
+	"r28", "r29", "r30", "r31",
+	"ra"
+};
+
 int arch_ftrace_match(char *name)
 {
 	return !strcmp(name, "_mcount");
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index 6a39cc619d63..6a8aad383695 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -24,6 +24,14 @@
 #include <objtool/builtin.h>
 #include <arch/elf.h>
 
+const char *arch_reg_name[CFI_NUM_REGS] = {
+	"rax", "rcx", "rdx", "rbx",
+	"rsp", "rbp", "rsi", "rdi",
+	"r8",  "r9",  "r10", "r11",
+	"r12", "r13", "r14", "r15",
+	"ra"
+};
+
 int arch_ftrace_match(char *name)
 {
 	return !strcmp(name, "__fentry__");
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index baa6eee1977f..f4aa8e134276 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -103,6 +103,8 @@ unsigned long arch_pc_relative_offset(struct instruction *insn,
 unsigned int arch_reloc_size(struct reloc *reloc);
 unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *table);
 
+extern const char *arch_reg_name[CFI_NUM_REGS];
+
 #ifdef DISAS
 
 #include <bfd.h>
diff --git a/tools/objtool/trace.c b/tools/objtool/trace.c
index 28c0257b02b5..ea67c41e9128 100644
--- a/tools/objtool/trace.c
+++ b/tools/objtool/trace.c
@@ -34,6 +34,7 @@ int trace_depth;
 static const char *cfi_reg_name(unsigned int reg)
 {
 	static char rname_buffer[CFI_REG_NAME_MAXLEN];
+	const char *rname;
 
 	switch (reg) {
 	case CFI_UNDEFINED:
@@ -46,6 +47,12 @@ static const char *cfi_reg_name(unsigned int reg)
 		return "(bp)";
 	}
 
+	if (reg < CFI_NUM_REGS) {
+		rname = arch_reg_name[reg];
+		if (rname)
+			return rname;
+	}
+
 	if (snprintf(rname_buffer, CFI_REG_NAME_MAXLEN, "r%d", reg) == 1)
 		return NULL;
 
-- 
2.43.5

