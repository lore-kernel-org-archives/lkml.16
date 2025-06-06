Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7F28A735
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224115; cv=none; b=fPex5TxCl2P9EleU47yARBu5ycfYMfTaE/BvHYBuKIKA20554i7vhie8yvH/xLE2XA1hG9UizdOMKfnBBR+dzcsbKcPGC87a3vFFyd99MH6r5ojpIlAEW1Nsp1GQ1+HyJSiNj/ZkyDgDFYsGcy8n48dAzet181dnhzEZbZzUgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224115; c=relaxed/simple;
	bh=dgMNb7nu3lnJ+1jnVGA/ngCPVqkJTEXfIFpETz3HFyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IOv7I2WI5bL0kspui8/s6matib0/6lM3YN0Goaoc8Ld38GKkdpFdgwgOSsnJHLAnVdlx0oQXdCKVXxeNM4TxPbnmaEuOHMf2oDZ08CXNpNHH/62Y9DC8TcOzmy6R1OdfIBPjeqq0qOriJI3C4ET7c7JUw3zYwH6V9koDbev4/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GFo1JNNt; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GFo1JNNt"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MZft030080;
	Fri, 6 Jun 2025 15:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=wIqqo
	/7E2WJ8UlpKCwyClHDZQx7NjCfXE9MZI+8M53M=; b=GFo1JNNtU8DtfYiVqw71F
	GVJs007b+7kddzy9+pF+Igyfd7kHea+kQUpCBTuUjj88mBg3c12FBFucGiNud4Px
	ywthMtvLnKBvU4/IjvXGUgFP2KBtXFvgfeBkxq6XaUigxWHHa+35FF3hGZMO1P7X
	9qlBab6jYvRjsb7/CroZiLn4k7IeAkA3S0ibpWIJ2saK6K3w71CyIlT5UuVrqmPw
	p8ygOdbmxIdocsKgmay8UhrFPyIySLYVM8qZd7/ARXK1KM07CKKecmgff4Y1cbTM
	Af6ZQH6AxMdOeZm66u8bKDWxdz34DmnEjCPBK8KvHzgm0TF1LAp1k4eeHolqupgC
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8e087g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556Eshsx039288;
	Fri, 6 Jun 2025 15:35:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:07 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh41015517;
	Fri, 6 Jun 2025 15:35:07 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-12;
	Fri, 06 Jun 2025 15:35:07 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 11/13] objtool: Improve register reporting during function validation
Date: Fri,  6 Jun 2025 17:34:38 +0200
Message-ID: <20250606153440.865808-12-alexandre.chartre@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250606153440.865808-1-alexandre.chartre@oracle.com>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060136
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=68430aac cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=CogidulLUEdmuW3A26oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfXx4CU7yTzBV5J maLSzd0flFMTqFuNXLqsGgkZYy3K/gQnIe4/j4QQFSDiOw0TKRW++6DYa9bsDcWN1ZKsmxKI7uV RF1Y3J/zQj/0JrwN8HFuRa4kyBamXZUNnFTTzIr/Gnoj3i7wcYBniD5xnWItUHZFYL8ORMFe8DW
 C8moURtp9W9sAdgg7PtbhATnEQ7uyry+cOa44J4zBLdI9Bal+PTNTSx+PpWqRWqi6FZKwpR/4Vt dRJyUaM2NMmgOLIIqSbWykmHb+nGzIK8SRpIFrTtpnE3n1Ij+RF7Mw+v+Ec8oHFaXh0z62WYT1I AwFz0F3VTflDo5iIylzFDz+LYMWLVdqVefplagVRIEY9ntve0bA8elM3FC3o4BBZ/AkB2o4g2sb
 e2zGsCV95MCoc2DrHd/GGp/JRl9Ru3C0F3aFYKQEoSlnEO6oKrPiuSvJrU5UBV/KxRxqKbxl
X-Proofpoint-ORIG-GUID: 3210MFP6L7sjBEL_xe6PHwdRWL07PmeV
X-Proofpoint-GUID: 3210MFP6L7sjBEL_xe6PHwdRWL07PmeV

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
 tools/objtool/disas.c                 |  7 +++++++
 tools/objtool/include/objtool/arch.h  |  2 ++
 5 files changed, 40 insertions(+)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index bf5ac6750512..fbad237e54fb 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -7,6 +7,17 @@
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
index c0fcab2d643c..df5bf6476b78 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -9,6 +9,18 @@
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
index 6c13c67ed9b9..56e2df35c9ee 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -23,6 +23,14 @@
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
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 4326c608f925..8265ad7479a3 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -38,6 +38,7 @@ struct disas_context {
 const char *register_name(unsigned int reg)
 {
 	static char rname_buffer[REGISTER_NAME_MAXLEN];
+	const char *rname;
 
 	switch (reg) {
 	case CFI_UNDEFINED:
@@ -50,6 +51,12 @@ const char *register_name(unsigned int reg)
 		return "(bp)";
 	}
 
+	if (reg < CFI_NUM_REGS) {
+		rname = arch_reg_name[reg];
+		if (rname)
+			return rname;
+	}
+
 	if (snprintf(rname_buffer, REGISTER_NAME_MAXLEN, "r%d", reg) == 1)
 		return NULL;
 
diff --git a/tools/objtool/include/objtool/arch.h b/tools/objtool/include/objtool/arch.h
index aecf8fc29571..4736b08805d6 100644
--- a/tools/objtool/include/objtool/arch.h
+++ b/tools/objtool/include/objtool/arch.h
@@ -106,4 +106,6 @@ unsigned long arch_jump_table_sym_offset(struct reloc *reloc, struct reloc *tabl
 
 int arch_disas_info_init(struct disassemble_info *dinfo);
 
+extern const char *arch_reg_name[CFI_NUM_REGS];
+
 #endif /* _ARCH_H */
-- 
2.43.5

