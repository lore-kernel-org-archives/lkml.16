Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7128BA9F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345042; cv=none; b=icJgjWNVbOwAvhvRt0S/zYphcDlbdqpwAqo/MWgXqDZdJHMHFRfvG4xlf9ueVlBVdVi4Q7dzAbmFEgP5UzhJTQa257ZEWCWKRvA1yyYYonNQt7esFmYM04TB/zDOOg3V7TJy+JgXpocme5Ud2vu+cdTEd2qIuRYnwSwPZhM2wWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345042; c=relaxed/simple;
	bh=F8PfXIfzWJ6RkyKXQgM8zxJG43m6MlfkSdRSZPzILFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUDBeaYlFqs88v4fjwJa9nM3+hmFpfVMMS1t6oQnXQTbhKfPNk3YC0MiYIIL3QcfRdP3c9y833AP+kwRyLNvBvceLA8rVeg86j5TULcxc0FyoNN+fgWIlVMn9WwWpMdisRm32KvAi5yCLAvETuPCoejte57mPKMMYcWb70RmvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eVhiv+qw; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eVhiv+qw"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMbGx014966;
	Thu, 19 Jun 2025 14:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=ekONx
	pl/jy/BTRt4dLK5HaTQUgYSLv2wGO8hibSauo0=; b=eVhiv+qw2avakHaGjpcy1
	DZ2siXTfuuy0woRP3WR599C82vrxBULQpwXDNT8Hj6uLiQvTcZ8Zg+4hLYW4Tgsd
	f5cF38aaO6jMHHSikCkw7hz+IIJ/nAoMas5gPZajDE+9MxRLEYq/60/4Sl1KE8kC
	g7g3XAGT75RYF1z0gGoiQvo/8yRO2SC2iebB/bJQ1AEW4YFWXVNa7yFBgY9NWZph
	gJQFZuh1j8FOM3mLghJnnoinPpQcFEbGMiXaY+gOXQ3bpFrwYuJS27F++WNO5w5G
	QpOoze2Yt/KRRdtgubaOT+HWlnI0nRY+z5avz+T1AwWCF4xIro1mOArGa/7SlWCL
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4t4b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDQCJX022863;
	Thu, 19 Jun 2025 14:57:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:15 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JX008257;
	Thu, 19 Jun 2025 14:57:15 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-13;
	Thu, 19 Jun 2025 14:57:15 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 12/17] objtool: Trace instruction state changes during function validation
Date: Thu, 19 Jun 2025 16:56:54 +0200
Message-ID: <20250619145659.1377970-13-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXy7Fg7dJ66J/4 51N6ZeAi+xR9FL+5+LWLbUarDYl8lmeYQq5Mw7dKjQksgNbBIxCPlVv13BQBWRbD0vtIU4A2pta giI1irxnKuiwJegvcbTUwvNCi5DjQi68X/8Xlgt9LEWm5qD6INvYE8HLajmDgbfUtPgpFBdboaF
 6hIK3AK8FbEEHQONzXTsQCz88MtMRMAwvHYktou4W+zv2G3v4TUlfO4SbWggt9g8bHYzuQ5jxOQ RL2AXJVl1J+5CHjydyFT/24CWzYtoAj+y6nQuTTdmzR3OFAYOSKBRUCAVx31nhRuXDBllPz8ACk KJqpfBvt4/BkG+VwP7lDsis+n/mc3fuiVSe6yQZsCxsjpcxi3ndjk2jkJg/fYgKpsIffEKXGh9w
 xOF2RscKY3ca3CxRdESN3ocvYBZscnbBlX4Ve5ooUUPi7p9nQc+9lezsCfSgYBc1YeInISPg
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6854254d b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=pqBKm9nhAekokd3aI5kA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: M6e6ywTbexAtwaBo_hJIBcaXfg_weqi_
X-Proofpoint-ORIG-GUID: M6e6ywTbexAtwaBo_hJIBcaXfg_weqi_

During function validation, objtool maintains a per-instruction state,
in particular to track call frame information. When tracing validation,
print any instruction state changes.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                 |   8 +-
 tools/objtool/disas.c                 |   1 -
 tools/objtool/include/objtool/trace.h |  10 ++
 tools/objtool/trace.c                 | 131 ++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 1505dc8812fb..8a51c871e1dc 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3551,6 +3551,8 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 			 struct instruction *prev_insn, struct instruction *next_insn,
 			 bool *dead_end)
 {
+	/* prev_state is not used if there is no disassembly support */
+	struct insn_state prev_state __maybe_unused;
 	struct alternative *alt;
 	u8 visited;
 	int ret;
@@ -3660,7 +3662,11 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	if (skip_alt_group(insn))
 		return 0;
 
-	if (handle_insn_ops(insn, next_insn, statep))
+	prev_state = *statep;
+	ret = handle_insn_ops(insn, next_insn, statep);
+	TRACE_INSN_STATE(insn, &prev_state, statep);
+
+	if (ret)
 		return 1;
 
 	switch (insn->type) {
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 004683c2b1ff..376c7bedef47 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -29,7 +29,6 @@ struct disas_context {
 #define DINFO_FPRINTF(dinfo, ...)	\
 	((*(dinfo)->fprintf_func)((dinfo)->stream, __VA_ARGS__))
 
-
 static int disas_result_fprintf(struct disas_context *dctx,
 				const char *fmt, va_list ap)
 {
diff --git a/tools/objtool/include/objtool/trace.h b/tools/objtool/include/objtool/trace.h
index ea0904a0ce00..5b8abdb9b09f 100644
--- a/tools/objtool/include/objtool/trace.h
+++ b/tools/objtool/include/objtool/trace.h
@@ -30,6 +30,12 @@ extern int trace_depth;
 	}							\
 })
 
+#define TRACE_INSN_STATE(insn, sprev, snext)			\
+({								\
+	if (trace)						\
+		trace_insn_state(insn, sprev, snext);		\
+})
+
 static inline void trace_enable(void)
 {
 	trace = true;
@@ -53,10 +59,14 @@ static inline void trace_depth_dec(void)
 		trace_depth--;
 }
 
+void trace_insn_state(struct instruction *insn, struct insn_state *sprev,
+		      struct insn_state *snext);
+
 #else /* DISAS */
 
 #define TRACE(fmt, ...)
 #define TRACE_INSN(insn, fmt, ...)
+#define TRACE_INSN_STATE(insn, sprev, snext)
 
 static inline void trace_enable(void) {}
 static inline void trace_disable(void) {}
diff --git a/tools/objtool/trace.c b/tools/objtool/trace.c
index bc3113ba72fd..28c0257b02b5 100644
--- a/tools/objtool/trace.c
+++ b/tools/objtool/trace.c
@@ -7,3 +7,134 @@
 
 bool trace;
 int trace_depth;
+
+/*
+ * Macros to trace CFI state attributes changes.
+ */
+
+#define TRACE_CFI_ATTR(attr, prev, next, fmt, ...)		\
+({								\
+	if ((prev)->attr != (next)->attr)			\
+		TRACE("%s=" fmt " ", #attr, __VA_ARGS__); 	\
+})
+
+#define TRACE_CFI_ATTR_BOOL(attr, prev, next)			\
+	TRACE_CFI_ATTR(attr, prev, next,			\
+		       "%s", (next)->attr ? "true" : "false")
+
+#define TRACE_CFI_ATTR_NUM(attr, prev, next, fmt)		\
+	TRACE_CFI_ATTR(attr, prev, next, fmt, (next)->attr)
+
+#define CFI_REG_NAME_MAXLEN   16
+
+/*
+ * Return the name of a register. Note that the same static buffer
+ * is returned if the name is dynamically generated.
+ */
+static const char *cfi_reg_name(unsigned int reg)
+{
+	static char rname_buffer[CFI_REG_NAME_MAXLEN];
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
+	if (snprintf(rname_buffer, CFI_REG_NAME_MAXLEN, "r%d", reg) == 1)
+		return NULL;
+
+	return (const char *)rname_buffer;
+}
+
+/*
+ * Functions and macros to trace CFI registers changes.
+ */
+
+static void trace_cfi_reg(const char *prefix, int reg, const char *fmt,
+			  int base_prev, int offset_prev,
+			  int base_next, int offset_next)
+{
+	const char *rname;
+
+	if (base_prev == base_next && offset_prev == offset_next)
+		return;
+
+	if (prefix)
+		TRACE("%s:", prefix);
+
+	rname = cfi_reg_name(reg);
+
+	if (base_next == CFI_UNDEFINED) {
+		TRACE("%1$s=<undef> ", rname);
+	} else {
+		TRACE(fmt, rname,
+		      cfi_reg_name(base_next), offset_next);
+	}
+}
+
+static void trace_cfi_reg_val(const char *prefix, int reg,
+			      int base_prev, int offset_prev,
+			      int base_next, int offset_next)
+{
+	trace_cfi_reg(prefix, reg, "%1$s=%2$s%3$+d ",
+		      base_prev, offset_prev, base_next, offset_next);
+}
+
+static void trace_cfi_reg_ref(const char *prefix, int reg,
+			      int base_prev, int offset_prev,
+			      int base_next, int offset_next)
+{
+	trace_cfi_reg(prefix, reg, "%1$s=(%2$s%3$+d) ",
+		      base_prev, offset_prev, base_next, offset_next);
+}
+
+#define TRACE_CFI_REG_VAL(reg, prev, next)				\
+	trace_cfi_reg_val(NULL, reg, prev.base, prev.offset,		\
+			  next.base, next.offset)
+
+#define TRACE_CFI_REG_REF(reg, prev, next)				\
+	trace_cfi_reg_ref(NULL, reg, prev.base, prev.offset,		\
+			  next.base, next.offset)
+
+void trace_insn_state(struct instruction *insn, struct insn_state *sprev,
+		      struct insn_state *snext)
+{
+	struct cfi_state *cprev, *cnext;
+	int i;
+
+	if (!memcmp(sprev, snext, sizeof(struct insn_state)))
+		return;
+
+	cprev = &sprev->cfi;
+	cnext = &snext->cfi;
+
+	disas_print_insn(stderr, objtool_disas_ctx, insn,
+			 trace_depth - 1, " - state");
+
+	/* print registers changes */
+	TRACE_CFI_REG_VAL(CFI_CFA, cprev->cfa, cnext->cfa);
+	for (i = 0; i < CFI_NUM_REGS; i++) {
+		TRACE_CFI_REG_VAL(i, cprev->vals[i], cnext->vals[i]);
+		TRACE_CFI_REG_REF(i, cprev->regs[i], cnext->regs[i]);
+	}
+
+	/* print attributes changes */
+	TRACE_CFI_ATTR_NUM(stack_size, cprev, cnext, "%d");
+	TRACE_CFI_ATTR_BOOL(drap, cprev, cnext);
+	if (cnext->drap) {
+		trace_cfi_reg_val("drap", cnext->drap_reg,
+				  cprev->drap_reg, cprev->drap_offset,
+				  cnext->drap_reg, cnext->drap_offset);
+	}
+	TRACE_CFI_ATTR_BOOL(bp_scratch, cprev, cnext);
+	TRACE_CFI_ATTR_NUM(instr, sprev, snext, "%d");
+	TRACE_CFI_ATTR_NUM(uaccess_stack, sprev, snext, "%u");
+
+	TRACE("\n");
+}
-- 
2.43.5

