Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B028A72F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224113; cv=none; b=j9nMO8B2qy5NfrDHABEr2XagbseJrYSAv3iU/w16XqO0Vy6Y47D2PgOx1oW2gxEMZz2MEBT6L7c3aAj9Q5D2VeUMWzNUonXJnl6PejCV77kY6CsE+7zGT/2IrXv8H5imsEaRyVKp/ldK4pzwTGMEvRMsWjl6CjDl0c24UnXB/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224113; c=relaxed/simple;
	bh=6Bblu348mo32rRnTruCxD/P6AYHqPJFxK0tzVbRIe7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHp6UX0pEQY0jkmU9Jlb4kIAvFQUu+hvvFWjy+vo2ZZMMkqkjJH5y94zkuuYXdvOlKtx5M5YNq6qzFCvo2qKkP5VXgRGxbEcj2TVVsQIcqDakDBhe0GQ3MVzjVTNcWEcQ7eVGCwoIX94accslc9TyuOZ9iaQuLv3e+dtLQF1tyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RYIBqSxz; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RYIBqSxz"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565Mteq030195;
	Fri, 6 Jun 2025 15:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=PRLnR
	8PU0PfWjOaw1qk46DtX5R6mdIBS8buVTSqwDxU=; b=RYIBqSxzY+j3oar7pl0RC
	4lRqM5nBXUk1kAyHl0wQC7JbZMyzmYXETqkmYZI0l3nYaJpdP2WYbiECI+gMNq4t
	euifI7v0QXs8CbR4gR/1Yli9Q42x9wXIdHx13/CMHvXJgfCgwPOEOsNRcg/UD8gQ
	DtwvlOdEJSmy1vA5tGa2romPG7D/2tkyrf+nlkVjHRpZlryBq1B5+zhKhv6jjMQi
	BFWCLv8M0aEoA3/diDMvp2SVwLq+ZjTsk7uO0Y519bLAH4frveCfKNSjAlv3lwZa
	409rzqx+UzJEBBtXtvl9TzaAoIgEjitBlKxlK0T2MkIfB1dlCD+tgOqMFEozW5th
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8e087e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556DjJJ7038525;
	Fri, 6 Jun 2025 15:35:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:05 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3x015517;
	Fri, 6 Jun 2025 15:35:05 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-11;
	Fri, 06 Jun 2025 15:35:04 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 10/13] objtool: Trace instruction state changes during function validation
Date: Fri,  6 Jun 2025 17:34:37 +0200
Message-ID: <20250606153440.865808-11-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=68430aaa cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=drXov0Ccr8RUBnCnCHQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX0lIbybLshXxO 8K+nYizUUJa+/RXVOuQ+h079xxlHuR/y4Wb2WXS4ymUWaq6MwPPgZFt/Exj9u3PsLDXEyp+azhW CATo102vv713ToX5qYCbl5FSowG2dMpPiIvHz5IW8LCCY9GZj8ncg3ovjdCiL4kBhMdmP20nfm8
 j8pWqWUgZt5q5WFerKDxFxJASzGxteY0RQpQBBmmRXCOPizD6kXQBDkM6Z01o2PKEMdYysLXhOt nF5mwB3ETsAXVOS97PbgbPbvltLKrrQ+AUOnkJuZ1gmtzUox8J51Shl7GFu1ZCWf0YmbrmUkwun k9MzLT+aM0zfh2B1hTLaiUHAe0CuYahcdkJ3gZqhQCVX6nJpOF1w9OcOozu4n8fQjmMh+BjkY3s
 JISQlu5OKdr/tNQFoZ5UNVWtQqVWpj0e3rL5hi+AHmf67RJDe+pbXjdDtLEa++YRJjvdBDNq
X-Proofpoint-ORIG-GUID: 8sEli5ux3Vc1FmUomLOlD7wxC05mPr-4
X-Proofpoint-GUID: 8sEli5ux3Vc1FmUomLOlD7wxC05mPr-4

During function validation, objtool maintains a per-instruction state,
in particular to track call frame information. When tracing validation,
print any instruction state changes.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                 | 116 +++++++++++++++++++++++++-
 tools/objtool/disas.c                 |  27 ++++++
 tools/objtool/include/objtool/check.h |   1 +
 3 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 40eaac4b5756..050d34930372 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -111,6 +111,111 @@ static void vtrace_insn(struct instruction *insn, const char *format, ...)
 		free((char *)addr_str);
 }
 
+/*
+ * Macros to trace CFI state attributes changes.
+ */
+
+#define VTRACE_CFI_ATTR(attr, prev, next, fmt, ...)			\
+	do {								\
+		if ((prev)->attr != (next)->attr)			\
+			VTRACE_PRINTF("%s=" fmt " ", #attr, __VA_ARGS__); \
+	} while (0)
+
+#define VTRACE_CFI_ATTR_BOOL(attr, prev, next)				\
+	VTRACE_CFI_ATTR(attr, prev, next,				\
+			"%s", (next)->attr ? "true" : "false")
+
+#define VTRACE_CFI_ATTR_NUM(attr, prev, next, fmt)			\
+	VTRACE_CFI_ATTR(attr, prev, next, fmt, (next)->attr)
+
+/*
+ * Functions and macros to trace CFI registers changes.
+ */
+
+static void vtrace_cfi_register(const char *prefix, int reg, const char *fmt,
+				int base_prev, int offset_prev,
+				int base_next, int offset_next)
+{
+	const char *rname;
+
+	if (base_prev == base_next && offset_prev == offset_next)
+		return;
+
+	if (prefix)
+		VTRACE_PRINTF("%s:", prefix);
+
+	rname = register_name(reg);
+
+	if (base_next == CFI_UNDEFINED) {
+		VTRACE_PRINTF("%1$s=<undef> ", rname);
+	} else {
+		VTRACE_PRINTF(fmt, rname,
+			      register_name(base_next), offset_next);
+	}
+}
+
+static void vtrace_cfi_reg_value(const char *prefix, int reg,
+				 int base_prev, int offset_prev,
+				 int base_next, int offset_next)
+{
+	vtrace_cfi_register(prefix, reg, "%1$s=%2$s%3$+d ",
+			    base_prev, offset_prev, base_next, offset_next);
+}
+
+static void vtrace_cfi_reg_reference(const char *prefix, int reg,
+				     int base_prev, int offset_prev,
+				     int base_next, int offset_next)
+{
+	vtrace_cfi_register(prefix, reg, "%1$s=(%2$s%3$+d) ",
+			    base_prev, offset_prev, base_next, offset_next);
+}
+
+#define VTRACE_CFI_REG_VAL(reg, prev, next)				\
+	vtrace_cfi_reg_value(NULL, reg, prev.base, prev.offset,		\
+			     next.base, next.offset)
+
+#define VTRACE_CFI_REG_REF(reg, prev, next)				\
+	vtrace_cfi_reg_reference(NULL, reg, prev.base, prev.offset,	\
+				 next.base, next.offset)
+
+static void vtrace_insn_state(struct instruction *insn,
+			      struct insn_state *sprev,
+			      struct insn_state *snext)
+{
+	struct cfi_state *cprev, *cnext;
+	int i;
+
+	if (memcmp(sprev, snext, sizeof(struct insn_state)) == 0)
+		return;
+
+	cprev = &sprev->cfi;
+	cnext = &snext->cfi;
+
+	vtrace_insn(insn, NULL);
+	VTRACE_PRINTF(" - state: ");
+
+	/* print registers changes */
+	VTRACE_CFI_REG_VAL(CFI_CFA, cprev->cfa, cnext->cfa);
+	for (i = 0; i < CFI_NUM_REGS; i++) {
+		VTRACE_CFI_REG_VAL(i, cprev->vals[i], cnext->vals[i]);
+		VTRACE_CFI_REG_REF(i, cprev->regs[i], cnext->regs[i]);
+	}
+
+	/* print attributes changes */
+	VTRACE_CFI_ATTR_NUM(stack_size, cprev, cnext, "%d");
+	VTRACE_CFI_ATTR_BOOL(drap, cprev, cnext);
+	if (cnext->drap) {
+		vtrace_cfi_reg_value("drap", cnext->drap_reg,
+				     cprev->drap_reg, cprev->drap_offset,
+				     cnext->drap_reg, cnext->drap_offset);
+	}
+	VTRACE_CFI_ATTR_BOOL(bp_scratch, cprev, cnext);
+	VTRACE_CFI_ATTR_NUM(instr, sprev, snext, "%d");
+	VTRACE_CFI_ATTR_NUM(uaccess_stack, sprev, snext, "%u");
+
+	VTRACE_PRINTF("\n");
+}
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset)
 {
@@ -3698,6 +3803,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 			 struct instruction *prev_insn, struct instruction *next_insn,
 			 bool *validate_nextp)
 {
+	struct insn_state state_prev;
 	struct alternative *alt;
 	u8 visited;
 	int ret;
@@ -3814,7 +3920,15 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	if (skip_alt_group(insn))
 		return 0;
 
-	if (handle_insn_ops(insn, next_insn, statep))
+	if (vtrace)
+		state_prev = *statep;
+
+	ret = handle_insn_ops(insn, next_insn, statep);
+
+	if (vtrace)
+		vtrace_insn_state(insn, &state_prev, statep);
+
+	if (ret)
 		return 1;
 
 	switch (insn->type) {
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 1e198d5f9205..4326c608f925 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -29,6 +29,33 @@ struct disas_context {
 	((*(dinfo)->fprintf_func)((dinfo)->stream, __VA_ARGS__))
 
 
+#define REGISTER_NAME_MAXLEN   16
+
+/*
+ * Return the name of a register. Note that the same static buffer
+ * is returned if the name is dynamically generated.
+ */
+const char *register_name(unsigned int reg)
+{
+	static char rname_buffer[REGISTER_NAME_MAXLEN];
+
+	switch (reg) {
+	case CFI_UNDEFINED:
+		return "<undefined>";
+	case CFI_CFA:
+		return "cfa";
+	case CFI_SP_INDIRECT:
+		return "(sp)";
+	case CFI_BP_INDIRECT:
+		return "(bp)";
+	}
+
+	if (snprintf(rname_buffer, REGISTER_NAME_MAXLEN, "r%d", reg) == 1)
+		return NULL;
+
+	return (const char *)rname_buffer;
+}
+
 static int dbuffer_init(struct dbuffer *dbuf, size_t size)
 {
 	dbuf->used = 0;
diff --git a/tools/objtool/include/objtool/check.h b/tools/objtool/include/objtool/check.h
index 1b9b399578ea..137d20963921 100644
--- a/tools/objtool/include/objtool/check.h
+++ b/tools/objtool/include/objtool/check.h
@@ -152,5 +152,6 @@ int disas_info_init(struct disassemble_info *dinfo,
 size_t disas_insn(struct disas_context *dctx, struct instruction *insn);
 char *disas_result(struct disas_context *dctx);
 const char *objtool_disas_insn(struct instruction *insn);
+const char *register_name(unsigned int reg);
 
 #endif /* _CHECK_H */
-- 
2.43.5

