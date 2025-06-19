Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6632356A0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345037; cv=none; b=a6scatWUHNw4ewo6e8JmoiTGXdsUykkIoj9fHj6XAVvE1ULq1IgQWFV0NaJhPzdAFU5stsRDM9NLvMYw6ZjyHYVBNwTWcuqLBIz9zZ4L8Vhg+85YQFmlIJqs1AsB2T+3qjIWxWkb/mH6URqBWeDaNxDiCuv/Uu9tYzGcGiE64NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345037; c=relaxed/simple;
	bh=kf2K/4yHc7UfQpUUCMQcOijB+wqlhvABpHjMA8u4rLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URJBSpapFPOZZqUPBQcbz1I0oqB0snbH55HetBSeKyBB9ChGc8/Fu15oMY3TATDJQeuknC/MnslArAI9vAx5eOse82zzY14Wvze1O6NY36Zp0COXlh5oXgkDWUfhXQqN4a5Ln35F6wwk5e641jqLsHo5wiIMecm1UPKo9QhFlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LPqZH4AC; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LPqZH4AC"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMa4K029324;
	Thu, 19 Jun 2025 14:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=pOEYx
	EsOe9UkNR/ofqlxOJIxGVqObktx2bB0sTIhGWQ=; b=LPqZH4AC6rW9ir0TiAoft
	UkbTLD4cbIWjWhoHXWkwcLxnpQty/j0C3Q6amfU1cCE+fznx5XtD4V/voFAtK7Nk
	OERUiu4E9AKXa6xrxFuAI7qSCP9IvehB8oqwwBJGgluC9U7Vt05gJs70GReOOG+f
	5y+YirGO/Vk0yRyXWhoCTgbdzOGLGLx/yp0TCUDczN6pJuubEP3bs4oj3Ng2v5th
	XRI210/Gyo8sVOupLHy/IUjPwg8yZBujzZR4znOvtDZmGEr8mflziUZaKiASsVHe
	6ItZ2awkUfm6vBo/BQsVmbrX+lGCXJCx282nZX1xjo6CL+KduLorh3sGCPLhrzQj
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xwjxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDEZug022842;
	Thu, 19 Jun 2025 14:57:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:10 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JP008257;
	Thu, 19 Jun 2025 14:57:10 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-9;
	Thu, 19 Jun 2025 14:57:10 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 08/17] objtool: Disassemble instruction on warning or backtrace
Date: Thu, 19 Jun 2025 16:56:50 +0200
Message-ID: <20250619145659.1377970-9-alexandre.chartre@oracle.com>
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
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=969 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX+FJMGF4yVtei 0704kNBv+REjlR5EZ7cQVQqLEH1bIC262aXIy8DeRBQxPwlltDGrnqLi4l6jyHoNZ84sRO1F1dZ 2KCdKO8bl7jCaqvHBOOe4WdT9GajzpYDX21Jx5P0S7nFY45aiEjxMhfxGn34vti/A+0h4Jq22IP
 Ld9wRNYIaAz91AYSp3bGDFZoUyM16iRx6mV7T+9oqBQOamsGPOVWX56kQUulQM1w55wUwnTj5sh pIDR6cLy2FJh8A0Rxl2JAt66IV4HSwAJLo92yV+AKhUkYale8/I2yA00Z5L+MHmzRCw8mljfW5q 25NA8q6wQUVlvITyKDPxys4V0xKYQbqA2i2KIqeWQt+UA25QZbJ8VsBpYK9L3S95abk22jI3fAX
 8Zj2fqNeMl11ffsanN3BLQKgdWuNFKAlnBBiVEN8fErp11ZSIvOCL49cKnYg8SVWmrO+49Pg
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68542548 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=49cdYLv4DVxkACFpF8YA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: SCveHgeJddkUem3bJRIaVdWnRKLckwAZ
X-Proofpoint-ORIG-GUID: SCveHgeJddkUem3bJRIaVdWnRKLckwAZ

When an instruction warning (WARN_INSN) or backtrace (BT_INSN) is issued,
disassemble the instruction to provide more context.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                 | 36 ++++++++++++++++++++++-----
 tools/objtool/disas.c                 |  5 ++--
 tools/objtool/include/objtool/check.h |  2 ++
 tools/objtool/include/objtool/disas.h | 13 ++++++++++
 tools/objtool/include/objtool/warn.h  | 16 ++++++++----
 5 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index a4d0a6c62bc0..beaafa1f0323 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4581,11 +4581,34 @@ static void free_insns(struct objtool_file *file)
 		free(chunk->addr);
 }
 
+static struct disas_context *objtool_disas_ctx;
+
+const char *objtool_disas_insn(struct instruction *insn)
+{
+	struct disas_context *dctx = objtool_disas_ctx;
+
+	if (!dctx)
+		return "";
+
+	disas_insn(dctx, insn);
+	return disas_result(dctx);
+}
+
 int check(struct objtool_file *file)
 {
-	struct disas_context *disas_ctx;
+	struct disas_context *disas_ctx = NULL;
 	int ret = 0, warnings = 0;
 
+	/*
+	 * If the verbose or backtrace option is used then we need a
+	 * disassembly context to disassemble instruction or function
+	 * on warning or backtrace.
+	 */
+	if (opts.verbose || opts.backtrace) {
+		disas_ctx = disas_context_create(file);
+		objtool_disas_ctx = disas_ctx;
+	}
+
 	arch_initial_func_cfi_state(&initial_func_cfi);
 	init_cfi_state(&init_cfi);
 	init_cfi_state(&func_cfi);
@@ -4711,11 +4734,12 @@ int check(struct objtool_file *file)
 		if (opts.werror && warnings)
 			WARN("%d warning(s) upgraded to errors", warnings);
 		print_args();
-		disas_ctx = disas_context_create(file);
-		if (disas_ctx) {
-			disas_warned_funcs(disas_ctx);
-			disas_context_destroy(disas_ctx);
-		}
+		disas_warned_funcs(disas_ctx);
+	}
+
+	if (disas_ctx) {
+		disas_context_destroy(disas_ctx);
+		objtool_disas_ctx = NULL;
 	}
 
 	free_insns(file);
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index fbec062f40eb..3831e46e0f35 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -256,7 +256,7 @@ void disas_context_destroy(struct disas_context *dctx)
 	free(dctx);
 }
 
-static char *disas_result(struct disas_context *dctx)
+char *disas_result(struct disas_context *dctx)
 {
 	return dctx->result;
 }
@@ -264,8 +264,7 @@ static char *disas_result(struct disas_context *dctx)
 /*
  * Disassemble a single instruction. Return the size of the instruction.
  */
-static size_t disas_insn(struct disas_context *dctx,
-			 struct instruction *insn)
+size_t disas_insn(struct disas_context *dctx, struct instruction *insn)
 {
 	disassembler_ftype disasm = dctx->disassembler;
 	struct disassemble_info *dinfo = &dctx->info;
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index 4adbcd760c6f..f3ea144d4746 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -139,4 +139,6 @@ struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruc
 	     insn && insn->offset < sym->offset + sym->len;		\
 	     insn = next_insn_same_sec(file, insn))
 
+const char *objtool_disas_insn(struct instruction *insn);
+
 #endif /* _CHECK_H */
diff --git a/tools/objtool/include/objtool/disas.h b/tools/objtool/include/objtool/disas.h
index 3ec3ce2e4e6f..1aee1fbe0bb9 100644
--- a/tools/objtool/include/objtool/disas.h
+++ b/tools/objtool/include/objtool/disas.h
@@ -17,6 +17,8 @@ void disas_warned_funcs(struct disas_context *dctx);
 int disas_info_init(struct disassemble_info *dinfo,
 		    int arch, int mach32, int mach64,
 		    const char *options);
+size_t disas_insn(struct disas_context *dctx, struct instruction *insn);
+char *disas_result(struct disas_context *dctx);
 
 #else /* DISAS */
 
@@ -38,6 +40,17 @@ static inline int disas_info_init(struct disassemble_info *dinfo,
 	return -1;
 }
 
+static inline size_t disas_insn(struct disas_context *dctx,
+				struct instruction *insn)
+{
+	return -1;
+}
+
+static inline char *disas_result(struct disas_context *dctx)
+{
+	return NULL;
+}
+
 #endif /* DISAS */
 
 #endif /* _DISAS_H */
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index d89e6ae69143..f001233b27df 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -89,9 +89,11 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 #define WARN_INSN(insn, format, ...)					\
 ({									\
 	struct instruction *_insn = (insn);				\
-	if (!_insn->sym || !_insn->sym->warned)				\
+	if (!_insn->sym || !_insn->sym->warned)	{			\
 		WARN_FUNC(_insn->sec, _insn->offset, format,		\
 			  ##__VA_ARGS__);				\
+		BT_INSN(_insn, "");					\
+	}								\
 	if (_insn->sym)							\
 		_insn->sym->warned = 1;					\
 })
@@ -99,10 +101,14 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 #define BT_INSN(insn, format, ...)				\
 ({								\
 	if (opts.verbose || opts.backtrace) {			\
-		struct instruction *_insn = (insn);		\
-		char *_str = offstr(_insn->sec, _insn->offset); \
-		WARN("  %s: " format, _str, ##__VA_ARGS__);	\
-		free(_str);					\
+		struct instruction *__insn = (insn);		\
+		char *_str = offstr(__insn->sec, __insn->offset); \
+		const char *_istr = objtool_disas_insn(__insn);	\
+		int _len;					\
+		_len = snprintf(NULL, 0, "  %s: " format,  _str, ##__VA_ARGS__);	\
+		_len = (_len < 50) ? 50 - _len : 0;		\
+		WARN("  %s: " format "  %*s%s", _str, ##__VA_ARGS__, _len, "", _istr); \
+		free(_str);						\
 	}							\
 })
 
-- 
2.43.5

