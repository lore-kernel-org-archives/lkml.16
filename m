Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0175276048
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224102; cv=none; b=BG83fNkS76buN4vbzQBPgb6egVH+LZ2ljtqP51neWR+MpYJSc50nBGlJPEQSIK2XgOnVHtzTEZHDg7jlEn5AQV68qhKkGhHQnZVgouUqMzCUDY2o/2ohEBfb+TIyafBOJFwmUFcAYfSzEeJXIB8nr3i4TtxOrkIObMZzODWP7g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224102; c=relaxed/simple;
	bh=kRHpxHGdnDbmGJgSjhss+LvCRQXFlC9CVb2+NgDTQCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=my6Z+TGiIs5VXIU5Wj4NEh/uIinYxqOJlmi//lPU/QB/1XDh3zQMVy/WM1mPPiF55ETvXgsaPvbI0mnu+qXVhGKElsr4zqZaYVdD09HkVgSiONQCC1EUf0n1TXcs9FJfsjCOW8a4cuVR6u2a3Z7IvkGmUFO5EdLlLJJ+DVJFL4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TS/SflEA; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TS/SflEA"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565Nd0U003840;
	Fri, 6 Jun 2025 15:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=5uU22
	ZQC8/bZaX1N2l5t1e/8/ilrOtO9X/0/f7od/jw=; b=TS/SflEAZ3b4zjtgYV+Xd
	AGNmlrcrZvlB7h4mqsD3jo/3c/jfRHIGkH99RsqUz4QeXjKh+ODF9+yT0ng9bYYB
	EHYo42gafxWFJu03xdtnkyuBBaUxMsWgZMy5QhgcKXBuwv6Xkgcj7R4e8iuLuNiQ
	T//uYVz9DZoglFDuNo1GRv0VPwxMknVPdb5czEAxP5eFHGgzFLWR+dCrJgfnKg3y
	cbBPnU+ALdUznh3dELWOM7/qAw6F6v3YkYUPix7kHyrzLj9kvfcDsaKEq2jmfmzg
	bBOxgMUZUAIqEvox/aWcQDwmWx2xARUfqsPehWEk/jBAk1YArWpon82MFH4cI/Ia
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahgafq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556EJExp038537;
	Fri, 6 Jun 2025 15:34:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7des9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:54 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3n015517;
	Fri, 6 Jun 2025 15:34:54 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-6;
	Fri, 06 Jun 2025 15:34:54 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 05/13] objtool: Store instruction disassembly result
Date: Fri,  6 Jun 2025 17:34:32 +0200
Message-ID: <20250606153440.865808-6-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68430a9f cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=15-dxsL2gXYqenlZGRYA:9
X-Proofpoint-GUID: Glyc08PLi2wD6WSLjOpAo2H0nxexilx6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX5VbHRAyjQ83/ dZPht+K35Vnc1XDZCC6vgSdsrs4F5MUuh9CadfD53jA4awRE4/4GiswJnmCnpjNB1wDqX9u7sjr PSWVhvQiw6v0ZxF5UaZTyrKpv4uAx58Wzv5AbBgcyq1V1zRsNSkJnTDItHQEp2x8Zd0+Uo7iQiE
 7AEdYtN78HjRoFgz4vC7LFEdo3Ra0iMGuT9zirCq4vjucXUCZVcZI8rfxxMJQEEculxB+HkfLC+ A8y4niVqGQbF6hjnl2TsnoMwQh6Xqb4nTfnlv3jDcM9+j0ZbpdERveP1/q7P0ouxndJXWGnqP82 7GR9x2xDYIn8g3rGGKdRy5ohe0W1PeJ8yDh7TalXu7D7meDBvn2qVyTAGbFTwg71stLLkEdssa6
 nEZke3WV/0qcZIyZjkwcP3+4Ckbggm76ENKM4SvcaczVBxqOQE/SPqklV6AZQeL0Jzrschk5
X-Proofpoint-ORIG-GUID: Glyc08PLi2wD6WSLjOpAo2H0nxexilx6

When disassembling an instruction store the result instead of directly
printing it.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/disas.c | 161 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 155 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 83fe2c018c4b..f86b9b04ef97 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -11,9 +11,16 @@
 #include <linux/string.h>
 #include <tools/dis-asm-compat.h>
 
+struct dbuffer {
+	char *addr;
+	size_t size;
+	size_t used;
+};
+
 struct disas_context {
 	struct objtool_file *file;
 	struct instruction *insn;
+	struct dbuffer result;
 	disassembler_ftype disassembler;
 	struct disassemble_info info;
 };
@@ -21,6 +28,129 @@ struct disas_context {
 #define DINFO_FPRINTF(dinfo, ...)	\
 	((*(dinfo)->fprintf_func)((dinfo)->stream, __VA_ARGS__))
 
+
+static int dbuffer_init(struct dbuffer *dbuf, size_t size)
+{
+	dbuf->used = 0;
+	dbuf->size = size;
+
+	if (!size) {
+		dbuf->addr = NULL;
+		return 0;
+	}
+
+	dbuf->addr = malloc(size);
+	if (!dbuf->addr)
+		return -1;
+
+	return 0;
+}
+
+static void dbuffer_fini(struct dbuffer *dbuf)
+{
+	free(dbuf->addr);
+	dbuf->size = 0;
+	dbuf->used = 0;
+}
+
+static void dbuffer_reset(struct dbuffer *dbuf)
+{
+	dbuf->used = 0;
+}
+
+static char *dbuffer_data(struct dbuffer *dbuf)
+{
+	return dbuf->addr;
+}
+
+static int dbuffer_expand(struct dbuffer *dbuf, size_t space)
+{
+	size_t size;
+	char *addr;
+
+	size = dbuf->size + space;
+	addr = realloc(dbuf->addr, size);
+	if (!addr)
+		return -1;
+
+	dbuf->addr = addr;
+	dbuf->size = size;
+
+	return 0;
+}
+
+static int dbuffer_vappendf_noexpand(struct dbuffer *dbuf, const char *fmt, va_list ap)
+{
+	int free, len;
+
+	free = dbuf->size - dbuf->used;
+
+	len = vsnprintf(dbuf->addr + dbuf->used, free, fmt, ap);
+
+	if (len < 0)
+		return -1;
+
+	if (len < free) {
+		dbuf->used += len;
+		return 0;
+	}
+
+	return (len - free) + 1;
+}
+
+static int dbuffer_vappendf(struct dbuffer *dbuf, const char *fmt, va_list ap)
+{
+	int space_needed, err;
+
+	space_needed = dbuffer_vappendf_noexpand(dbuf, fmt, ap);
+	if (space_needed <= 0)
+		return space_needed;
+
+	/*
+	 * The buffer is not large enough to store all data. Expand
+	 * the buffer and retry. The buffer is expanded with enough
+	 * space to store all data.
+	 */
+	err = dbuffer_expand(dbuf, space_needed * 2);
+	if (err) {
+		WARN("failed to expand buffer\n");
+		return -1;
+	}
+
+	return dbuffer_vappendf_noexpand(dbuf, fmt, ap);
+}
+
+static int disas_fprintf(void *stream, const char *fmt, ...)
+{
+	va_list arg;
+	int len;
+
+	va_start(arg, fmt);
+	len = dbuffer_vappendf(stream, fmt, arg);
+	va_end(arg);
+
+	return len == 0 ? 0 : -1;
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
+	int len;
+
+	(void)style;
+
+	va_start(arg, fmt);
+	len = dbuffer_vappendf(stream, fmt, arg);
+	va_end(arg);
+
+	return len == 0 ? 0 : -1;
+}
+
 static void disas_print_address(bfd_vma addr, struct disassemble_info *dinfo)
 {
 	struct disas_context *dctx = dinfo->application_data;
@@ -147,6 +277,7 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 {
 	struct disas_context *dctx;
 	struct disassemble_info *dinfo;
+	struct dbuffer *dbuf;
 	int err;
 
 	dctx = malloc(sizeof(*dctx));
@@ -157,10 +288,16 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 
 	dctx->file = file;
 	dinfo = &dctx->info;
+	dbuf = &dctx->result;
+
+	err = dbuffer_init(dbuf, 1024);
+	if (err) {
+		WARN("failed to initialize buffer\n");
+		return NULL;
+	}
 
-	init_disassemble_info_compat(dinfo, stdout,
-				     (fprintf_ftype)fprintf,
-				     fprintf_styled);
+	init_disassemble_info_compat(dinfo, dbuf,
+				     disas_fprintf, disas_fprintf_styled);
 
 	dinfo->read_memory_func = buffer_read_memory;
 	dinfo->print_address_func = disas_print_address;
@@ -204,9 +341,18 @@ struct disas_context *disas_context_create(struct objtool_file *file)
 
 void disas_context_destroy(struct disas_context *dctx)
 {
+	if (!dctx)
+		return;
+
+	dbuffer_fini(&dctx->result);
 	free(dctx);
 }
 
+static char *disas_result(struct disas_context *dctx)
+{
+	return dbuffer_data(&dctx->result);
+}
+
 /*
  * Disassemble a single instruction. Return the size of the instruction.
  */
@@ -216,6 +362,7 @@ static size_t disas_insn(struct disas_context *dctx,
 	disassembler_ftype disasm = dctx->disassembler;
 	struct disassemble_info *dinfo = &dctx->info;
 
+	dbuffer_reset(&dctx->result);
 	dctx->insn = insn;
 
 	/*
@@ -241,10 +388,12 @@ static void disas_func(struct disas_context *dctx, struct symbol *func)
 	sym_for_each_insn(dctx->file, func, insn) {
 
 		addr = insn->offset;
-		printf(" %6lx:  %s+0x%-6lx      ",
-		       addr, func->name, addr - func->offset);
 		size = disas_insn(dctx, insn);
-		printf("\n");
+
+		printf(" %6lx:  %s+0x%-6lx      %s\n",
+		       addr, func->name, addr - func->offset,
+		       disas_result(dctx));
+
 		if (size != insn->len)
 			WARN("inconsistent insn size (%ld and %d)\n", size, insn->len);
 	}
-- 
2.43.5

