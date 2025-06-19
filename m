Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E2128CF74
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345045; cv=none; b=Y27UDiwH0QDy3lGXbP7rvYaUpFopsonoZQ+A5uUiBfBnzOSnx1x8YkioCxb97jaxe3W0tHZjMbbJlI4lDK2fVLhMLoEBQrxCKv1pZ2VH1uZoqIOll3FiHX07dXSK6yS5NMbssxipoykve7537zJmMGAODGEB6pOd4mw5JY2OuwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345045; c=relaxed/simple;
	bh=H+g7cbISVtaDY1JKt6Ybf8xc/ZLewI60cjadART3OkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o30SO5QSLNkcxTB42dCpCcteS98Xql+s0DKWosbVtbttLULU7V/VgvcIdclmVXys2HnrjrmGR0gPufzAI96bWeTMw5/h4G7nHgXxU8pj0oThCjbACrCDmEhk3EAo2YGeIq1EHHebXhebYabzQTkxwpVI/YS8q2tykD44ww7B23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XuX6uwAc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XuX6uwAc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMai5011412;
	Thu, 19 Jun 2025 14:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=8ZeRf
	10ljaEG1hqhsCLWmhWBbnsfFG1tSxdo2JnGEO0=; b=XuX6uwActotcUcJY+xvJh
	HMcj7QZP7MmzCd2Qg4Vxh/Q4ehkoqOudHlQn4POyZ36Eyp6emvP8hCSbgH1qL0bb
	aAiWx8FfMvoKNotG1DkY2akeFxwfTFy/Xc59PWd51mR6RYo4agK+vf0XtEizMno8
	WELtt2KtQB7QVRSvzJvOIDxUw/JY/BJrznHjTOT2Xx32La7j2ruEA3mcghBjBxyN
	kdVqkDzj5BiiUJyURUWhzZCkVTd14VP/JmU7abpZFPJQ9H6I4gRuEv344iAA8u03
	7bwRtiH1kV4sWP8HdQ7LjIPmMLMMwRbGfh0wBOvzK4j5d8h5FydMA6Ie67PSWa5M
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f23qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDQ7B1023309;
	Thu, 19 Jun 2025 14:57:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:18 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0Jb008257;
	Thu, 19 Jun 2025 14:57:17 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-15;
	Thu, 19 Jun 2025 14:57:17 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 14/17] objtool: Improve tracing of alternative instructions
Date: Thu, 19 Jun 2025 16:56:56 +0200
Message-ID: <20250619145659.1377970-15-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX9I66rYDyhbaR DXVgrlJzyKfy1FrYs+vfHZkQ8TDMHfOoaYypyHQjT17PBmMAt6fZ8sTbQoXPjuXsPF6qNtlRRZX siQ9z5kdO5VSWQgSDuFu2AQE6qZS8izGcHdCqSCGywBgGI3jqQxC0uoebIjiDfyO11S6pg+abcK
 V+3VzEbZ9EPzIZJ+QdNCCpmDPzA5+w91gDbX6YqYGPERtVB9s+zAfKZBLQygLVP9A9sauacqV27 vx+ZlIEo4U5KohWKLk/ODJhbZpe8yaKx9RiFeQHsqh4I2CW505r5Wos+GLAWSg1MO3aSKkDu04x ytHq0YWbQHFS9A6x8xB0cq0uVJyTbLL9fNlXuWiuh9oHRlwlaHD0OgnbTIu2I5dwvbrDeki727B
 9qlvrOaWdBKN0oFPCW+NYP4twsP2bpc1uEZ23Yva3DrayMMeDnrTz7zx+S35GZlyjn8N3afI
X-Proofpoint-ORIG-GUID: DP1CzKmDrWi3RAxSBZoHg2OuL6fGk77_
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=6854254f b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=6-_rUJ9W-rRKKU8erE8A:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: DP1CzKmDrWi3RAxSBZoHg2OuL6fGk77_

When tracing function validation, improve the reporting of
alternative instruction by more clearly showing the different
alternatives beginning and end.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                 | 64 ++++++++++++++++++++++++---
 tools/objtool/include/objtool/trace.h | 33 ++++++++++++++
 2 files changed, 91 insertions(+), 6 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 8a51c871e1dc..43c88a5fd58a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -3517,7 +3517,7 @@ static bool skip_alt_group(struct instruction *insn)
 
 	/* ANNOTATE_IGNORE_ALTERNATIVE */
 	if (insn->alt_group && insn->alt_group->ignore) {
-		TRACE_INSN(insn, "alt group ignored");
+		TRACE_ALT(insn, "alt group ignored");
 		return true;
 	}
 
@@ -3641,22 +3641,74 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 	if (insn->alts) {
 		int i, num_alts;
 
+		/*
+		 * Count the number of alternatives with an alt group.
+		 *
+		 * For a jump alternative, count is 0 and there is a single
+		 * alternative (with no alt group).
+		 *
+		 * For a group alternative, count is at least 1. In addition
+		 * there is an alternative that points to the code following
+		 * the alternative.
+		 */
 		num_alts = 0;
-		for (alt = insn->alts; alt; alt = alt->next)
-			num_alts++;
+		for (alt = insn->alts; alt; alt = alt->next) {
+			if (alt->insn->alt_group)
+				num_alts++;
+		}
 
 		i = 1;
 		for (alt = insn->alts; alt; alt = alt->next) {
-			TRACE_INSN(insn, "alternative %d/%d", i, num_alts);
+			if (!num_alts) {
+				/*
+				 * For a jump alternative, the non-default
+				 * branch is validated first. So if the
+				 * default instruction is a NOP then the
+				 * branch is validated first (jump taken),
+				 * otherwise the branch is not taken. Then
+				 * the default alternative is validated.
+				 */
+				if (insn->type == INSN_NOP)
+					TRACE_ALT_INFO(insn, "jump taken - begin");
+				else
+					TRACE_ALT_INFO(insn, "jump not taken - begin");
+			} else {
+				/*
+				 * For a group alternative, the code after the
+				 * alternative (alternative with no alt group)
+				 * is validated first. Then each alternative
+				 * is validated. Finally the default alternative
+				 * is validated.
+				 */
+				if (alt->insn->alt_group)
+					TRACE_ALT_INFO(insn, "alt %d/%d - begin", i, num_alts);
+				else
+					TRACE_ALT_INFO(insn, "after alternative - begin");
+			}
+
 			ret = validate_branch(file, func, alt->insn, *statep);
+
+			if (!num_alts) {
+				if (insn->type == INSN_NOP)
+					TRACE_ALT_INFO(insn, "jump taken - end");
+				else
+					TRACE_ALT_INFO(insn, "jump not taken - end");
+			} else {
+				if (alt->insn->alt_group)
+					TRACE_ALT_INFO_NOADDR(insn, "alt %d/%d - end", i, num_alts);
+				else
+					TRACE_ALT_INFO_NOADDR(insn, "after alternative - end");
+			}
+
 			if (ret) {
 				BT_INSN(insn, "(alt)");
 				return ret;
 			}
-			i++;
+			if (alt->insn->alt_group)
+				i++;
 		}
 
-		TRACE_INSN(insn, "alternative orig");
+		TRACE_ALT_INFO(insn, "default");
 	}
 
 	if (skip_alt_group(insn))
diff --git a/tools/objtool/include/objtool/trace.h b/tools/objtool/include/objtool/trace.h
index 5b8abdb9b09f..da3d41d6dedd 100644
--- a/tools/objtool/include/objtool/trace.h
+++ b/tools/objtool/include/objtool/trace.h
@@ -19,6 +19,21 @@ extern int trace_depth;
 		fprintf(stderr, fmt, ##__VA_ARGS__);		\
 })
 
+/*
+ * Print the instruction address and a message. The instruction
+ * itself is not printed.
+ */
+#define TRACE_ADDR(insn, fmt, ...)				\
+({								\
+	if (trace) {						\
+		disas_print_info(stderr, insn, trace_depth - 1, \
+				 fmt "\n", ##__VA_ARGS__);	\
+	}							\
+})
+
+/*
+ * Print the instruction address, the instruction and a message.
+ */
 #define TRACE_INSN(insn, fmt, ...)				\
 ({								\
 	if (trace) {						\
@@ -36,6 +51,20 @@ extern int trace_depth;
 		trace_insn_state(insn, sprev, snext);		\
 })
 
+#define TRACE_ALT_FMT(fmt) "<alternative.%lx> " fmt
+
+#define TRACE_ALT(insn, fmt, ...)				\
+	TRACE_INSN(insn, TRACE_ALT_FMT(fmt),			\
+		   (insn)->offset, ##__VA_ARGS__)
+
+#define TRACE_ALT_INFO(insn, fmt, ...)				\
+	TRACE_ADDR(insn, TRACE_ALT_FMT(fmt),			\
+		   (insn)->offset, ##__VA_ARGS__)
+
+#define TRACE_ALT_INFO_NOADDR(insn, fmt, ...)			\
+	TRACE_ADDR(NULL, TRACE_ALT_FMT(fmt),			\
+		   (insn)->offset, ##__VA_ARGS__)
+
 static inline void trace_enable(void)
 {
 	trace = true;
@@ -65,8 +94,12 @@ void trace_insn_state(struct instruction *insn, struct insn_state *sprev,
 #else /* DISAS */
 
 #define TRACE(fmt, ...)
+#define TRACE_ADDR(insn, fmt, ...)
 #define TRACE_INSN(insn, fmt, ...)
 #define TRACE_INSN_STATE(insn, sprev, snext)
+#define TRACE_ALT(insn, fmt, ...)
+#define TRACE_ALT_INFO(insn, fmt, ...)
+#define TRACE_ALT_INFO_NOADDR(insn, fmt, ...)
 
 static inline void trace_enable(void) {}
 static inline void trace_disable(void) {}
-- 
2.43.5

