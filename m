Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E528A712
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224111; cv=none; b=NoQIGCBfZoooJPEXeZlnD+kWebR1CZ89yKf7IIKzoNiMmE5s8kWhp73gkAesf0ENEd2q2tW3Llsnm56vOmWs1joaS/6pELIwPN690CaQ8lBy5Z3+fO5dQbqJ2jyfDVbF4DwK96rs0Bl26zlnaZEEo+tmt49B9hkh7ZpLlWCPpJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224111; c=relaxed/simple;
	bh=5VRcBlwWdFrzBO1gZwxKYh3RHAZZunOUilG2FYKP2c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ak5H53mcFD42iU9/ZT01Tuaj56vEao7gge/Z5cKR+RwnI3wrpd+Sjsku/QL3HuhZjDSwItKaQDZMPS8pWtZ50Twu/Q/e9DelfqxOMdMfHZGsRCV4GzyafPuPFy9GQ5639xoVwTJXowSsBr/0JtZsG4q9m3SxORq3in2p4ZN+DGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i8xOlKOt; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i8xOlKOt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565Nd0Y003840;
	Fri, 6 Jun 2025 15:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=YQ4u7
	YKzX0ON4oY/CU35826hOt/DbKIXfUFaOcdRH9g=; b=i8xOlKOtf9J/Rpww/lM5E
	3HRmuqahlkgBPdYQE7Yajd+diJN/NVxjR0uAQjgUBmnAM08tt9kYHqzX24dEjVYF
	OmDkp7uRLUASr8Lkd31WWDknF3sv/4Y9k40sLZmwEwUjMKQ3nH7I+s4sM3xgFSl/
	EcVlVnrNumOC25p4idX+yEcs0lHefFozeF/oqCNa+sytUYs/qgce30yvvwsDeLsY
	gcBjEa8yAzJzJ3WsJahaP6UutMrx1l+SnL510SteP/npVtUb2RfJUqB3WbD0tYAD
	htKPh4hqljZIkoIqtiHFCOfPMyow2qVdrQLh6yJ1TeubqSMdGm2yFm7AdQ5Y8ZKa
	A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahgaga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556EHAmA038592;
	Fri, 6 Jun 2025 15:35:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:03 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3v015517;
	Fri, 6 Jun 2025 15:35:03 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-10;
	Fri, 06 Jun 2025 15:35:02 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 09/13] objtool: Add option to trace function validation
Date: Fri,  6 Jun 2025 17:34:36 +0200
Message-ID: <20250606153440.865808-10-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68430aa8 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=6m_oaggMU0vmvekz6BQA:9
X-Proofpoint-GUID: qjQK7fmGsMVNBOSqSRIFg3gtUi0qjT1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX6xXqnDS0xO71 680QuWOVuAck64FUgH1Odil07pCEyxpipkdRC9xd2Jrvp0ApMyUVZCAAUu+qMTI/7+bvpQubUEN BDdHCFOjj+2rw7qiu+EHdHgIjoHFYA0pN0+auX74UyQWBggtwJPdOLx3524r9VRiPZM/sEdhrtD
 xYzauWMqbab/DMLo2M/I0TVDfuzLKlHLz1aludKJofZmy6Uv05mTBPTb3VYa7xSZrp48tP0jKll T0zTKn/CPVOcdeck7x/lE/JrrwvWC0H+OsKMsMsnJp8ZNhZGjhmD8pagQ7gIAJDLLkul8tACCzk 0NMOaKNn+RoWTF2c8vu/JOz63CSXBB+IS/ZXCNKS79WMJDzHm8m8ehPppWxOGUAWhkHXX5xJq5p
 RF3t9xpt8JPSDZp+zTWHB+ddwVq5Bg602Y3VonnE6WhtrK9ZmmTz4vKtk45MlYIjMvxrRvrK
X-Proofpoint-ORIG-GUID: qjQK7fmGsMVNBOSqSRIFg3gtUi0qjT1L

Add an option to trace and have information during the validation
of specified functions. Functions are specified with the --trace
option which can be a single function name (e.g. --trace foo to
trace the function with the name "foo"), or a shell wildcard
pattern (e.g. --trace foo* to trace all functions with a name
starting with "foo").

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/builtin-check.c           |   1 +
 tools/objtool/check.c                   | 179 ++++++++++++++++++++++--
 tools/objtool/include/objtool/builtin.h |   1 +
 tools/objtool/include/objtool/check.h   |   2 +
 tools/objtool/include/objtool/warn.h    |   3 +-
 5 files changed, 171 insertions(+), 15 deletions(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index 80239843e9f0..ac7baf95f5bf 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -99,6 +99,7 @@ static const struct option check_options[] = {
 	OPT_STRING('o',  "output", &opts.output, "file", "output file name"),
 	OPT_BOOLEAN(0,   "sec-address", &opts.sec_address, "print section addresses in warnings"),
 	OPT_BOOLEAN(0,   "stats", &opts.stats, "print statistics"),
+	OPT_STRING(0,	"trace", &opts.trace, "func", "trace function validation"),
 	OPT_BOOLEAN('v', "verbose", &opts.verbose, "verbose warnings"),
 	OPT_BOOLEAN(0,   "Werror", &opts.werror, "return error on warnings"),
 
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 300428cb5c2c..40eaac4b5756 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2015-2017 Josh Poimboeuf <jpoimboe@redhat.com>
  */
 
+#include <fnmatch.h>
 #include <string.h>
 #include <stdlib.h>
 #include <inttypes.h>
@@ -36,6 +37,80 @@ static struct cfi_state force_undefined_cfi;
 
 static size_t sym_name_max_len;
 
+static bool vtrace;
+static int vtrace_depth;
+
+/*
+ * Validation traces are sent to stderr so that they are output
+ * on the same flow as warnings.
+ */
+#define VTRACE_PRINTF(fmt, ...)		fprintf(stderr, fmt, ##__VA_ARGS__)
+
+#define VTRACE_INSN(insn, fmt, ...)				\
+	do {							\
+		if (vtrace) {					\
+			vtrace_insn(insn, fmt, ##__VA_ARGS__);	\
+			VTRACE_PRINTF("\n");			\
+		}						\
+	} while (0)
+
+#define VTRACE_INSN_OFFSET_SPACE	10
+#define VTRACE_INSN_SPACE		60
+
+/*
+ * Print an instruction address (offset and function), the instruction itself
+ * and an optional message.
+ */
+static void vtrace_insn(struct instruction *insn, const char *format, ...)
+{
+	char fake_nop_insn[32];
+	const char *addr_str, *insn_str;
+	bool fake_nop;
+	va_list args;
+	int i, len;
+
+	len = sym_name_max_len + VTRACE_INSN_OFFSET_SPACE;
+
+	/*
+	 * Alternative can insert a fake nop, sometimes with no
+	 * associated section so nothing to disassemble.
+	 */
+	fake_nop = (!insn->sec && insn->type == INSN_NOP);
+	if (fake_nop) {
+		addr_str = "";
+		snprintf(fake_nop_insn, 32, "<fake nop> (%d bytes)", insn->len);
+		insn_str = fake_nop_insn;
+	} else {
+		addr_str = offstr(insn->sec, insn->offset);
+		insn_str = objtool_disas_insn(insn);
+	}
+
+	/* print the instruction address */
+	VTRACE_PRINTF("%6lx:  %-*s  ", insn->offset, len, addr_str);
+
+	/* print vertical bars to show the validation flow */
+	for (i = 1; i < vtrace_depth; i++)
+		VTRACE_PRINTF("| ");
+
+	/* print the instruction */
+	len = vtrace_depth * 2 < VTRACE_INSN_SPACE ?
+		VTRACE_INSN_SPACE - vtrace_depth * 2 : 1;
+	VTRACE_PRINTF("%-*s", len, insn_str);
+
+	/* print message if any */
+	if (format) {
+		VTRACE_PRINTF(" - ");
+		va_start(args, format);
+		vfprintf(stderr, format, args);
+		va_end(args);
+	}
+
+	insn->vtrace++;
+
+	if (!fake_nop)
+		free((char *)addr_str);
+}
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset)
 {
@@ -3511,8 +3586,10 @@ static bool skip_alt_group(struct instruction *insn)
 	struct instruction *alt_insn = insn->alts ? insn->alts->insn : NULL;
 
 	/* ANNOTATE_IGNORE_ALTERNATIVE */
-	if (insn->alt_group && insn->alt_group->ignore)
+	if (insn->alt_group && insn->alt_group->ignore) {
+		VTRACE_INSN(insn, "alt group ignored");
 		return true;
+	}
 
 	/*
 	 * For NOP patched with CLAC/STAC, only follow the latter to avoid
@@ -3539,14 +3616,17 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 			 struct instruction *prev_insn, struct instruction *next_insn,
 			 bool *validate_nextp);
 
+static int validate_branch(struct objtool_file *file, struct symbol *func,
+			   struct instruction *insn, struct insn_state state);
+
 /*
  * Follow the branch starting at the given instruction, and recursively follow
  * any other branches (jumps).  Meanwhile, track the frame pointer state at
  * each instruction and validate all the rules described in
  * tools/objtool/Documentation/objtool.txt.
  */
-static int validate_branch(struct objtool_file *file, struct symbol *func,
-			   struct instruction *insn, struct insn_state state)
+static int do_validate_branch(struct objtool_file *file, struct symbol *func,
+			      struct instruction *insn, struct insn_state state)
 {
 	struct instruction *next_insn, *prev_insn = NULL;
 	struct section *sec;
@@ -3558,7 +3638,10 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 
 	sec = insn->sec;
 
-	while (1) {
+	do {
+
+		insn->vtrace = 0;
+
 		next_insn = next_insn_to_validate(file, insn);
 
 		if (func && insn_func(insn) && func != insn_func(insn)->pfunc) {
@@ -3570,6 +3653,8 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			if (file->ignore_unreachables)
 				return 0;
 
+			VTRACE_INSN(insn, "falls through to next function");
+
 			WARN("%s() falls through to next function %s()",
 			     func->name, insn_func(insn)->name);
 			func->warned = 1;
@@ -3580,10 +3665,8 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 		ret = validate_insn(file, func, insn, &state,
 				    prev_insn, next_insn,
 				    &validate_next);
-		if (!validate_next)
-			break;
 
-		if (!next_insn) {
+		if (validate_next && !next_insn) {
 			if (state.cfi.cfa.base == CFI_UNDEFINED)
 				return 0;
 			if (file->ignore_unreachables)
@@ -3595,9 +3678,17 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
 			return 1;
 		}
 
+		if (!insn->vtrace) {
+			if (ret)
+				VTRACE_INSN(insn, "validated (%d)", ret);
+			else
+				VTRACE_INSN(insn, NULL);
+		}
+
 		prev_insn = insn;
 		insn = next_insn;
-	}
+
+	} while (validate_next);
 
 	return ret;
 }
@@ -3629,8 +3720,10 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		if (!insn->hint && !insn_cfi_match(insn, &statep->cfi))
 			return 1;
 
-		if (insn->visited & visited)
+		if (insn->visited & visited) {
+			VTRACE_INSN(insn, "already visited");
 			return 0;
+		}
 	} else {
 		nr_insns_visited++;
 	}
@@ -3667,8 +3760,10 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 				 * It will be seen later via the
 				 * straight-line path.
 				 */
-				if (!prev_insn)
+				if (!prev_insn) {
+					VTRACE_INSN(insn, "defer restore");
 					return 0;
+				}
 
 				WARN_INSN(insn, "objtool isn't smart enough to handle this CFI save/restore combo");
 				return 1;
@@ -3696,13 +3791,24 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		return 1;
 
 	if (insn->alts) {
+		int i, count;
+
+		count = 0;
+		for (alt = insn->alts; alt; alt = alt->next)
+			count++;
+
+		i = 1;
 		for (alt = insn->alts; alt; alt = alt->next) {
+			VTRACE_INSN(insn, "alternative %d/%d", i, count);
 			ret = validate_branch(file, func, alt->insn, *statep);
 			if (ret) {
 				BT_INSN(insn, "(alt)");
 				return ret;
 			}
+			i++;
 		}
+
+		VTRACE_INSN(insn, "alternative orig");
 	}
 
 	if (skip_alt_group(insn))
@@ -3714,10 +3820,12 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	switch (insn->type) {
 
 	case INSN_RETURN:
+		VTRACE_INSN(insn, "return");
 		return validate_return(func, insn, statep);
 
 	case INSN_CALL:
 	case INSN_CALL_DYNAMIC:
+		VTRACE_INSN(insn, "call");
 		ret = validate_call(file, insn, statep);
 		if (ret)
 			return ret;
@@ -3733,13 +3841,21 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	case INSN_JUMP_CONDITIONAL:
 	case INSN_JUMP_UNCONDITIONAL:
 		if (is_sibling_call(insn)) {
+			VTRACE_INSN(insn, "sibling call");
 			ret = validate_sibling_call(file, insn, statep);
 			if (ret)
 				return ret;
 
 		} else if (insn->jump_dest) {
-			ret = validate_branch(file, func,
-					      insn->jump_dest, *statep);
+			if (insn->type == INSN_JUMP_UNCONDITIONAL) {
+				VTRACE_INSN(insn, "unconditional jump");
+				ret = do_validate_branch(file, func,
+							 insn->jump_dest, *statep);
+			} else {
+				VTRACE_INSN(insn, "jump taken");
+				ret = validate_branch(file, func,
+						      insn->jump_dest, *statep);
+			}
 			if (ret) {
 				BT_INSN(insn, "(branch)");
 				return ret;
@@ -3749,10 +3865,12 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		if (insn->type == INSN_JUMP_UNCONDITIONAL)
 			return 0;
 
+		VTRACE_INSN(insn, "jump not taken");
 		break;
 
 	case INSN_JUMP_DYNAMIC:
 	case INSN_JUMP_DYNAMIC_CONDITIONAL:
+		VTRACE_INSN(insn, "dynamic jump");
 		if (is_sibling_call(insn)) {
 			ret = validate_sibling_call(file, insn, statep);
 			if (ret)
@@ -3765,6 +3883,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		break;
 
 	case INSN_SYSCALL:
+		VTRACE_INSN(insn, "syscall");
 		if (func && (!next_insn || !next_insn->hint)) {
 			WARN_INSN(insn, "unsupported instruction in callable function");
 			return 1;
@@ -3773,6 +3892,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		break;
 
 	case INSN_SYSRET:
+		VTRACE_INSN(insn, "sysret");
 		if (func && (!next_insn || !next_insn->hint)) {
 			WARN_INSN(insn, "unsupported instruction in callable function");
 			return 1;
@@ -3781,6 +3901,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		return 0;
 
 	case INSN_STAC:
+		VTRACE_INSN(insn, "stac");
 		if (!opts.uaccess)
 			break;
 
@@ -3793,6 +3914,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		break;
 
 	case INSN_CLAC:
+		VTRACE_INSN(insn, "clac");
 		if (!opts.uaccess)
 			break;
 
@@ -3810,6 +3932,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		break;
 
 	case INSN_STD:
+		VTRACE_INSN(insn, "std");
 		if (statep->df) {
 			WARN_INSN(insn, "recursive STD");
 			return 1;
@@ -3819,6 +3942,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		break;
 
 	case INSN_CLD:
+		VTRACE_INSN(insn, "cld");
 		if (!statep->df && func) {
 			WARN_INSN(insn, "redundant CLD");
 			return 1;
@@ -3831,8 +3955,10 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 		break;
 	}
 
-	if (insn->dead_end)
+	if (insn->dead_end) {
+		VTRACE_INSN(insn, "dead end");
 		return 0;
+	}
 
 	/*
 	 * Indicate that the caller should validate the next
@@ -3843,6 +3969,18 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	return 0;
 }
 
+static int validate_branch(struct objtool_file *file, struct symbol *func,
+			   struct instruction *insn, struct insn_state state)
+{
+	int ret;
+
+	vtrace_depth++;
+	ret = do_validate_branch(file, func, insn, state);
+	vtrace_depth--;
+
+	return ret;
+}
+
 static int validate_unwind_hint(struct objtool_file *file,
 				  struct instruction *insn,
 				  struct insn_state *state)
@@ -4253,9 +4391,22 @@ static int validate_symbol(struct objtool_file *file, struct section *sec,
 	if (opts.uaccess)
 		state->uaccess = sym->uaccess_safe;
 
+	if (opts.trace && fnmatch(opts.trace, sym->name, 0) == 0) {
+		vtrace = true;
+		vtrace_depth = 0;
+		VTRACE_PRINTF("%s: validation begin\n", sym->name);
+	}
+
 	ret = validate_branch(file, insn_func(insn), insn, *state);
 	if (ret)
 		BT_INSN(insn, "<=== (sym)");
+
+	if (vtrace) {
+		VTRACE_PRINTF("%s: validation %s\n\n",
+			      sym->name, ret ? "failed" : "end");
+		vtrace = false;
+	}
+
 	return ret;
 }
 
@@ -4651,7 +4802,7 @@ int check(struct objtool_file *file)
 	 * disassembly context to disassemble instruction or function
 	 * on warning or backtrace.
 	 */
-	if (opts.verbose || opts.backtrace) {
+	if (opts.verbose || opts.backtrace || opts.trace) {
 		disas_ctx = disas_context_create(file);
 		objtool_disas_ctx = disas_ctx;
 	}
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index 6b08666fa69d..b3c84b6fdc5f 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -37,6 +37,7 @@ struct opts {
 	const char *output;
 	bool sec_address;
 	bool stats;
+	const char *trace;
 	bool verbose;
 	bool werror;
 };
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index 92bfe6b209ad..1b9b399578ea 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -81,6 +81,8 @@ struct instruction {
 	struct symbol *sym;
 	struct stack_op *stack_ops;
 	struct cfi_state *cfi;
+
+	u32 vtrace;
 };
 
 static inline struct symbol *insn_func(struct instruction *insn)
diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index 32a8dd299c87..0bb94f2d3ae4 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -96,7 +96,8 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 		len = snprintf(NULL, 0, "  %s: " format,  _str, ##__VA_ARGS__);	\
 		len = (len < 50) ? 50 - len : 0;		\
 		WARN("  %s: " format "  %*s%s", _str, ##__VA_ARGS__, len, "", _istr); \
-		free(_str);					\
+		free(_str);						\
+		__insn->vtrace++;				\
 	}							\
 })
 
-- 
2.43.5

