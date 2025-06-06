Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346E728A1DD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224104; cv=none; b=j6bLt1y/LYMgx1ggy8C9bxd6DB5dayOOR/vmGgLzJAC2YoGdVPwdyoHTovEl/+MvCcGVV2fxzA8O335fgXoj9OiRjQe8nvi/oiIa0W2gDYeEbgF9q0cbjVM5M+v3c7nWWe2RYtw9Ip9g21q+3GZTUpn1uK/9Zb0xSThPrdRHcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224104; c=relaxed/simple;
	bh=rh2rppaKF/ghsqA+OyEMxeQOq2p9iJlfrX8v9ArZL3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXy292uTXggc9nNV+ZSUJTCKhdzdORa/qLUKsbtilKfvxGOQCMa/HkENO9c3xiwbBRp/oXpw37f0aWDq6v679kituxirt8Lwlh1vi9c9VLSQxLbMTLGXiF/77EsLEhj9YUd0w4GF2xsAneBHUZ1bZHjWg9NpQVkKvy3TBXKxgmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m98Cz9AF; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m98Cz9AF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MXVq002110;
	Fri, 6 Jun 2025 15:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ShrFy
	nUlxGk8nWVeIgPchPdYzOw/hadrawBr7I8U5Rs=; b=m98Cz9AFnrjZpLdCSlPDb
	Mo0nLDlA9E/XgsSyG2XQ1KNZHFVR5Duqp5zm3JZKS3uR0rmhckig7a3+Ocz5qm++
	ooIaUl4xidiCj+WnoUn/aHu704mooo1fVvRZAMimgmPn8PoPm8jmzbxy8+oETB4D
	Zw2x8xRzNxsH18of613KuoL7ieltyu8TGXiQ90Gs1o1x2TNr683B+znaoIWm0wbF
	Eneaw7ypOjMU3vesspaX+n5Tv0vhEC53Z4dGi+1ktSutx63/MkkgyqvBLMpSmG+M
	lNoBhV3OVWWsPjoNKZ52EeQjifa+iES13mpupX0Cb/UVtpkTfZ/G4VzlSuwKlLMq
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahgafv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556EZ1PY038505;
	Fri, 6 Jun 2025 15:34:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:56 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3p015517;
	Fri, 6 Jun 2025 15:34:56 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-7;
	Fri, 06 Jun 2025 15:34:56 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 06/13] objtool: Disassemble instruction on warning or backtrace
Date: Fri,  6 Jun 2025 17:34:33 +0200
Message-ID: <20250606153440.865808-7-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68430aa2 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=49cdYLv4DVxkACFpF8YA:9
X-Proofpoint-GUID: 8eFwyzk2SNiDdwO87Tl6ExPQVgbfTpQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX+PcvDh66Ll5F q/s0sQbFKi/PKr6MZZf6FxM8OG0OOsjxyyTqKxczBb5AnoDX5dA2l6ZobKEqFExVLPYe5LKF9s+ 2WNKDEcW7/77tfjTgZgyfLI5TtxPowgl41kuURhc9yq0aO2SplOY5HfeoXjaeaRAcuR2UvsP1a4
 m7ZE/IADqaI7ZY9gtd7KvsqL45V3HWtTak/XFPAVGNbZGmJUjG4oitsIvg3c1H7O2KYxVPZyHec xAulE36toVZm5hTi4LSsJObWd2nzHknroKC6Dk4aPqjgYKcykKIzLTCz3VeMJnDYACfA3MjzJ8g msd9PCcbPrnvE15Amx9QYVOk+k+ahbHWOZiTzM0HqpBH8Ldrk+gCxF4+fLD01yEliY3Mh27k5/U
 8MHflJ0qb1vXSEo86RFGznaGsvkPBvHFPgpHl3gc/NXCzJWxV211M2d8jufONegwa6GfPW1a
X-Proofpoint-ORIG-GUID: 8eFwyzk2SNiDdwO87Tl6ExPQVgbfTpQP

When an instruction warning (WARN_INSN) or backtrace (BT_INSN) is issued,
disassemble the instruction to provide more context.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                   | 30 +++++++++++++++++++++++--
 tools/objtool/disas.c                   |  5 ++---
 tools/objtool/include/objtool/check.h   | 12 ++++++++++
 tools/objtool/include/objtool/objtool.h |  9 --------
 tools/objtool/include/objtool/warn.h    | 14 ++++++++----
 5 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index ee613f03e57d..2c73c8d3515d 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4580,11 +4580,34 @@ static void free_insns(struct objtool_file *file)
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
@@ -4710,9 +4733,12 @@ int check(struct objtool_file *file)
 		if (opts.werror && warnings)
 			WARN("%d warning(s) upgraded to errors", warnings);
 		print_args();
-		disas_ctx = disas_context_create(file);
 		disas_warned_funcs(disas_ctx);
+	}
+
+	if (disas_ctx) {
 		disas_context_destroy(disas_ctx);
+		objtool_disas_ctx = NULL;
 	}
 
 	free_insns(file);
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index f86b9b04ef97..1e198d5f9205 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -348,7 +348,7 @@ void disas_context_destroy(struct disas_context *dctx)
 	free(dctx);
 }
 
-static char *disas_result(struct disas_context *dctx)
+char *disas_result(struct disas_context *dctx)
 {
 	return dbuffer_data(&dctx->result);
 }
@@ -356,8 +356,7 @@ static char *disas_result(struct disas_context *dctx)
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
index 4adbcd760c6f..92bfe6b209ad 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -139,4 +139,16 @@ struct instruction *next_insn_same_sec(struct objtool_file *file, struct instruc
 	     insn && insn->offset < sym->offset + sym->len;		\
 	     insn = next_insn_same_sec(file, insn))
 
+struct disas_context;
+struct disassemble_info;
+struct disas_context *disas_context_create(struct objtool_file *file);
+void disas_context_destroy(struct disas_context *dctx);
+void disas_warned_funcs(struct disas_context *dctx);
+int disas_info_init(struct disassemble_info *dinfo,
+		    int arch, int mach32, int mach64,
+		    const char *options);
+size_t disas_insn(struct disas_context *dctx, struct instruction *insn);
+char *disas_result(struct disas_context *dctx);
+const char *objtool_disas_insn(struct instruction *insn);
+
 #endif /* _CHECK_H */
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index 0b404cfd81c0..c0dc86a78ff6 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -47,13 +47,4 @@ int check(struct objtool_file *file);
 int orc_dump(const char *objname);
 int orc_create(struct objtool_file *file);
 
-struct disas_context;
-struct disassemble_info;
-struct disas_context *disas_context_create(struct objtool_file *file);
-void disas_context_destroy(struct disas_context *dctx);
-void disas_warned_funcs(struct disas_context *dctx);
-int disas_info_init(struct disassemble_info *dinfo,
-		    int arch, int mach32, int mach64,
-		    const char *options);
-
 #endif /* _OBJTOOL_H */
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index cb8fe846d9dd..32a8dd299c87 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -77,9 +77,11 @@ static inline char *offstr(struct section *sec, unsigned long offset)
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
@@ -87,9 +89,13 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 #define BT_INSN(insn, format, ...)				\
 ({								\
 	if (opts.verbose || opts.backtrace) {			\
-		struct instruction *_insn = (insn);		\
-		char *_str = offstr(_insn->sec, _insn->offset); \
-		WARN("  %s: " format, _str, ##__VA_ARGS__);	\
+		struct instruction *__insn = (insn);		\
+		char *_str = offstr(__insn->sec, __insn->offset); \
+		const char *_istr = objtool_disas_insn(__insn);	\
+		int len;					\
+		len = snprintf(NULL, 0, "  %s: " format,  _str, ##__VA_ARGS__);	\
+		len = (len < 50) ? 50 - len : 0;		\
+		WARN("  %s: " format "  %*s%s", _str, ##__VA_ARGS__, len, "", _istr); \
 		free(_str);					\
 	}							\
 })
-- 
2.43.5

