Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D262288C2C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345041; cv=none; b=JakQsLrjFMXjCqDoCQ1frDzSYR/n9on8fLfck/+3IEKHvqTCG5WWKcCmCrngQfJ8i9UpjDPFSKTc/H9UOtP2gB/Bii7Sh+4/DYIkP4HdUfQBDtc4r9yhBvDKJxC/LOGVNE56Fgd29r11HK6cNFywBivhpGW+e4BKSn5eOLOND0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345041; c=relaxed/simple;
	bh=eOvrWZYs7cpkr1jC2F6FHT95SEh0+ql4jGl77Y1613Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IR3JtXUqZxH8gyyZn0FI9F4vEK+mM/K93e1cHPAT2KjR8h3n8IwUUn1cKOwYekr6s9MpS2jdgdD2rBHqC/ZH1MYpeNyAh08l2nUSEuGORsNjfddDKKfWFwYLt1sJqdQu3dzHQAp9uBGqTDBRGFI45rc9RtuLs++P/PBYXagvOYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ndEjMbuN; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ndEjMbuN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMn3w029814;
	Thu, 19 Jun 2025 14:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=OcrmH
	Vb9VrydAGeRz/jWkrVwwnwuG5f1aGkxLUAikyo=; b=ndEjMbuN3hIDsqGX5HoP/
	VfhgWsp0jWkPZ3cR2MVPEHYowji9myC/luYtBciJeCYnwnPIFb0z/Dy+Hyy3ylBv
	Jc6mL9Bu2yBPzEV2CDxdXivM8vgBuc9kMP4VpBu4I43niDptT4FkCoW6OHn334jP
	IHaiMwwZ3ZehN4oJjlxk088WVKM3zIiirmMa2VqlsWj6J0HBvFPAWaGpkpqvqrLm
	I8HSw4SHdFns/Gq1qWY8Mxl2Ib+EKPvEgzfbf7sHGrefRpdq5of2zIXy07bHKd1p
	+2m+En3PazsGWw3QBedyYg6vxqqoFjVyrrOyw2XTK+56I/fQTXoqVbZqtPKKEDSh
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xwjxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDNXfu022847;
	Thu, 19 Jun 2025 14:57:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:09 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JN008257;
	Thu, 19 Jun 2025 14:57:09 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-8;
	Thu, 19 Jun 2025 14:57:08 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 07/17] objtool: Store instruction disassembly result
Date: Thu, 19 Jun 2025 16:56:49 +0200
Message-ID: <20250619145659.1377970-8-alexandre.chartre@oracle.com>
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
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX14uYeiE2SPSd +/6YVCo8MCzJjFMLxP1fKXUtlMegAZN60rfP6TM2lBXrzmaWwyScFi1JMY3HtUUEO85y5OXL+rq w6CQsfwjROAGagmz4Wb0dzIoG1Ufq1CZWuPnfjCadyI7NBByre+7MYhC8/mp37htEPky/Rs6jv8
 C3sAc9zRWOw+o8Ibh4Sqsx31peOvPTiKBcBizuDWCtqVQO4zI93WPR7X7aUh7Vics6TXiu7+Tzn EaXqsSGtUNwn4jQUPoMSj7fSfj3qmy14ZbEL6uCCIwfcEUvpntNZYDUUozvQbo+hgsMH63BtROG XKMajysWhFLqYrXVh1LtGtoA/MqMWaLVraOrSwTTS77+HvceSxh3UgfBlSjRI2zwdk0gWY0QgKQ
 X58JlfeNujKQczsHXmquqismoZXcIwMcfCMBWomhdtWr1WHMB4TU7ZXXhdNaoF4mLIvhh8xu
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68542547 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=jcmHYjYDc9FjrwFKAggA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: NoTd7VEjyzEpCzMTRqlM9jHc9ZFdJL0x
X-Proofpoint-ORIG-GUID: NoTd7VEjyzEpCzMTRqlM9jHc9ZFdJL0x

When disassembling an instruction store the result instead of directly
printing it.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/disas.c | 78 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 91d23f7518e3..fbec062f40eb 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -12,9 +12,16 @@
 #include <linux/string.h>
 #include <tools/dis-asm-compat.h>
 
+/*
+ * Size of the buffer for storing the result of disassembling
+ * a single instruction.
+ */
+#define DISAS_RESULT_SIZE	1024
+
 struct disas_context {
 	struct objtool_file *file;
 	struct instruction *insn;
+	char result[DISAS_RESULT_SIZE];
 	disassembler_ftype disassembler;
 	struct disassemble_info info;
 };
@@ -22,6 +29,60 @@ struct disas_context {
 #define DINFO_FPRINTF(dinfo, ...)	\
 	((*(dinfo)->fprintf_func)((dinfo)->stream, __VA_ARGS__))
 
+
+static int disas_result_fprintf(struct disas_context *dctx,
+				const char *fmt, va_list ap)
+{
+	char *buf = dctx->result;
+	size_t avail, len;
+
+	len = strlen(buf);
+	if (len >= DISAS_RESULT_SIZE - 1) {
+		WARN_FUNC(dctx->insn->sec, dctx->insn->offset,
+			  "disassembly buffer is full");
+		return -1;
+	}
+	avail = DISAS_RESULT_SIZE - len;
+
+	len = vsnprintf(buf + len, avail, fmt, ap);
+	if (len < 0 || len >= avail) {
+		WARN_FUNC(dctx->insn->sec, dctx->insn->offset,
+			  "disassembly buffer is truncated");
+		return -1;
+	}
+
+	return 0;
+}
+
+static int disas_fprintf(void *stream, const char *fmt, ...)
+{
+	va_list arg;
+	int rv;
+
+	va_start(arg, fmt);
+	rv = disas_result_fprintf(stream, fmt, arg);
+	va_end(arg);
+
+	return rv;
+}
+
+/*
+ * For init_disassemble_info_compat().
+ */
+static int disas_fprintf_styled(void *stream,
+				enum disassembler_style style,
+				const char *fmt, ...)
+{
+	va_list arg;
+	int rv;
+
+	va_start(arg, fmt);
+	rv = disas_result_fprintf(stream, fmt, arg);
+	va_end(arg);
+
+	return rv;
+}
+
 static void disas_print_address(bfd_vma addr, struct disassemble_info *dinfo)
 {
 	struct disas_context *dctx = dinfo->application_data;
@@ -147,9 +208,8 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 	dctx->file = file;
 	dinfo = &dctx->info;
 
-	init_disassemble_info_compat(dinfo, stdout,
-				     (fprintf_ftype)fprintf,
-				     fprintf_styled);
+	init_disassemble_info_compat(dinfo, dctx,
+				     disas_fprintf, disas_fprintf_styled);
 
 	dinfo->read_memory_func = buffer_read_memory;
 	dinfo->print_address_func = disas_print_address;
@@ -196,6 +256,11 @@ void disas_context_destroy(struct disas_context *dctx)
 	free(dctx);
 }
 
+static char *disas_result(struct disas_context *dctx)
+{
+	return dctx->result;
+}
+
 /*
  * Disassemble a single instruction. Return the size of the instruction.
  */
@@ -206,6 +271,7 @@ static size_t disas_insn(struct disas_context *dctx,
 	struct disassemble_info *dinfo = &dctx->info;
 
 	dctx->insn = insn;
+	dctx->result[0] = '\0';
 
 	/*
 	 * Set the disassembler buffer to read data from the section
@@ -229,10 +295,10 @@ static void disas_func(struct disas_context *dctx, struct symbol *func)
 	printf("%s:\n", func->name);
 	sym_for_each_insn(dctx->file, func, insn) {
 		addr = insn->offset;
-		printf(" %6lx:  %s+0x%-6lx      ",
-		       addr, func->name, addr - func->offset);
 		disas_insn(dctx, insn);
-		printf("\n");
+		printf(" %6lx:  %s+0x%-6lx      %s\n",
+		       addr, func->name, addr - func->offset,
+		       disas_result(dctx));
 	}
 	printf("\n");
 }
-- 
2.43.5

