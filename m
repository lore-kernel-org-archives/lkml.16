Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554522BF01B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345050; cv=none; b=qSSes7dOlgI0YfMP716IsmBGq0GbnHQN0h5lVXN9+mUCo0SRBk6PCk89O5NrlohSlMQ/IyJTbcGlsnHkw6eckgHKkSw7xLjwUe6toZv2HV/wCkly4jef0sD0KH3lpKREdwD5NmaUQSpSmLDjYTUBf6Fb0+rNCaCabvoT/7ttaUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345050; c=relaxed/simple;
	bh=0Ve5OciXTs/DgxXHyeH/Hw760EvX6jjzvIh5HDoxUeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMwXPJhsY/Egv/peX36YU+E6XkYLgZk4lw0UzxsruU8fh/FOlk3QwOHNi0x0n6aBQO1mo118gbJXrs+BU+zpg+UgkQUsNxGk2YORKJlnatPQV1I5VyTTZl1zVW7SQgc9O/rPG07Tei3v1UR0o3s13MfZoOQbTdp9ySobDO/tMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I0BDEIWc; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I0BDEIWc"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMYSB025798;
	Thu, 19 Jun 2025 14:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=p1NR5
	Uo9qxE/c+XYrd4u93UyzfRLfeM7J5KTXpPZ2rI=; b=I0BDEIWcJBFX3XY6cjlyN
	Fx13e7Q3fJ15C4s9QH0c6xyP/vlqk792aO2gRsxg0oofeiO0jX2AczwedydR7jKt
	mbB+m1b/JCFMsPkfEbnCBKKGdpGYk+98d/5a0UB+l/3Xy26wlUgD/x4ekPmpAV0b
	HM/dKmlIu9bDXok0v24WRPEBUKC6YqI7TYlLBm12uMum1KL0VYhMHAsMbCB43sWN
	MtWx+K04O/KboRz1ZxNr0mAFzuH3TpH70t8I9W+nS8rgp7A9zJdxRBXEMfb2k7s5
	/Ee9tHKzgs3rnsBsJM4ty/2uC2aRT3sq2JGJ1tz/2fRboqbkP5tU6ORtXj+wrYbk
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv5a0r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDJbWI022755;
	Thu, 19 Jun 2025 14:57:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:20 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0Jf008257;
	Thu, 19 Jun 2025 14:57:20 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-17;
	Thu, 19 Jun 2025 14:57:19 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 16/17] objtool: Add the --disas=<function-pattern> action
Date: Thu, 19 Jun 2025 16:56:58 +0200
Message-ID: <20250619145659.1377970-17-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyNCBTYWx0ZWRfXxd5PW7QJH39m PC1O2ZM0WGtPdzJXob7AgJiBXrm8rbJ9xTZcUaKUUSGzRs4x4Oal4DkidOpPVzvWRWBVGd8NsEP ivubBbrEHio6iYJxPp+dGcXOFTm2v8vRaRZIcH+5MMSISHV6BMtM9hA7nedz5632mv8RnQVCIex
 6OB9JuoOtK2TRsKkrMJvWMwbTf8bEYhTvIff5Qc9HFDuLDkEQt5m9RCLON7OIrWY9hwzS0QaUko 7L/7qI2i86dH8qpyKhCFWxJGRt/k3dp/6vnyM33xl4zSO6l/LF9FjusLviVEZdmvZGzzKl6rijp QgrnuVRKbrKybWpMr87352HwFWQ0IbdYhOLm2HIfGjQXrOH+byRq0iDdVGAQYiI9HsXM6nf0UHX
 jJsHE0uI3haCKrfLIlQFSRURBESoKr08uA+qnRh7NCnK4tdZx+XeFl1Pd3mUTd9FZQ5HwZBk
X-Proofpoint-GUID: JmF_Xw6DKI12uWtPLMo1cJod_Pc5eQ_B
X-Proofpoint-ORIG-GUID: JmF_Xw6DKI12uWtPLMo1cJod_Pc5eQ_B
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=68542551 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=Yos37rPc9-vhJleOp_oA:9 cc=ntf awl=host:13207

Add the --disas=<function-pattern> actions to disassemble the specified
functions. The function pattern can be a single function name (e.g.
--disas foo to disassemble the function with the name "foo"), or a shell
wildcard pattern (e.g. --disas foo* to disassemble all functions with a
name starting with "foo").

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/builtin-check.c           |  4 ++-
 tools/objtool/check.c                   | 35 ++++++++++++++-----------
 tools/objtool/disas.c                   | 28 ++++++++++++++++++++
 tools/objtool/include/objtool/builtin.h |  1 +
 tools/objtool/include/objtool/disas.h   |  2 ++
 5 files changed, 53 insertions(+), 17 deletions(-)

diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index c53d738e4fb0..49b37da28b90 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -73,6 +73,7 @@ static int parse_hacks(const struct option *opt, const char *str, int unset)
 
 static const struct option check_options[] = {
 	OPT_GROUP("Actions:"),
+	OPT_STRING_OPTARG('d',   "disas", &opts.disas, "function-pattern", "disassemble functions", "*"),
 	OPT_CALLBACK_OPTARG('h', "hacks", NULL, NULL, "jump_label,noinstr,skylake", "patch toolchain bugs/limitations", parse_hacks),
 	OPT_BOOLEAN('i', "ibt", &opts.ibt, "validate and annotate IBT"),
 	OPT_BOOLEAN('m', "mcount", &opts.mcount, "annotate mcount/fentry calls for ftrace"),
@@ -159,7 +160,8 @@ static bool opts_valid(void)
 		return false;
 	}
 
-	if (opts.hack_jump_label	||
+	if (opts.disas			||
+	    opts.hack_jump_label	||
 	    opts.hack_noinstr		||
 	    opts.ibt			||
 	    opts.mcount			||
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index fecdf6f42358..c7a70d47f104 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2563,7 +2563,7 @@ static int decode_sections(struct objtool_file *file)
 	 * Must be before add_jump_destinations(), which depends on 'func'
 	 * being set for alternatives, to enable proper sibling call detection.
 	 */
-	if (opts.stackval || opts.orc || opts.uaccess || opts.noinstr) {
+	if (opts.stackval || opts.orc || opts.uaccess || opts.noinstr || opts.disas) {
 		ret = add_special_section_alts(file);
 		if (ret)
 			return ret;
@@ -4766,14 +4766,15 @@ int check(struct objtool_file *file)
 	int ret = 0, warnings = 0;
 
 	/*
-	 * If the verbose or backtrace option is used then we need a
-	 * disassembly context to disassemble instruction or function
-	 * on warning or backtrace.
+	 * Create a disassembly context if we might disassemble any
+	 * instruction or function.
 	 */
-	if (opts.verbose || opts.backtrace || opts.trace) {
+	if (opts.verbose || opts.backtrace || opts.trace || opts.disas) {
 		disas_ctx = disas_context_create(file);
-		if (!disas_ctx)
+		if (!disas_ctx) {
+			opts.disas = false;
 			opts.trace = false;
+		}
 		objtool_disas_ctx = disas_ctx;
 	}
 
@@ -4892,19 +4893,21 @@ int check(struct objtool_file *file)
 	}
 
 out:
-	if (!ret && !warnings)
-		return 0;
-
-	if (opts.werror && warnings)
-		ret = 1;
-
-	if (opts.verbose) {
+	if (ret || warnings) {
 		if (opts.werror && warnings)
-			WARN("%d warning(s) upgraded to errors", warnings);
-		print_args();
-		disas_warned_funcs(disas_ctx);
+			ret = 1;
+
+		if (opts.verbose) {
+			if (opts.werror && warnings)
+				WARN("%d warning(s) upgraded to errors", warnings);
+			print_args();
+			disas_warned_funcs(disas_ctx);
+		}
 	}
 
+	if (opts.disas)
+		disas_funcs(disas_ctx);
+
 	if (disas_ctx) {
 		disas_context_destroy(disas_ctx);
 		objtool_disas_ctx = NULL;
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 376c7bedef47..97d506afdf45 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2015-2017 Josh Poimboeuf <jpoimboe@redhat.com>
  */
 
+#include <fnmatch.h>
+
 #include <objtool/arch.h>
 #include <objtool/check.h>
 #include <objtool/disas.h>
@@ -399,3 +401,29 @@ void disas_warned_funcs(struct disas_context *dctx)
 			disas_func(dctx, sym);
 	}
 }
+
+void disas_funcs(struct disas_context *dctx)
+{
+	bool disas_all = !strcmp(opts.disas, "*");
+	struct section *sec;
+	struct symbol *sym;
+
+	for_each_sec(dctx->file, sec) {
+
+		if (!(sec->sh.sh_flags & SHF_EXECINSTR))
+			continue;
+
+		sec_for_each_sym(sec, sym) {
+			/*
+			 * If the function had a warning and the verbose
+			 * option is used then the function was already
+			 * disassemble.
+			 */
+			if (opts.verbose && sym->warned)
+				continue;
+
+			if (disas_all || fnmatch(opts.disas, sym->name, 0) == 0)
+				disas_func(dctx, sym);
+		}
+	}
+}
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index b3c84b6fdc5f..e41f3802d397 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -26,6 +26,7 @@ struct opts {
 	bool uaccess;
 	int prefix;
 	bool cfi;
+	const char *disas;
 
 	/* options: */
 	bool backtrace;
diff --git a/tools/objtool/include/objtool/disas.h b/tools/objtool/include/objtool/disas.h
index 5db75d06f219..5d2149ffac33 100644
--- a/tools/objtool/include/objtool/disas.h
+++ b/tools/objtool/include/objtool/disas.h
@@ -14,6 +14,7 @@ struct disassemble_info;
 struct disas_context *disas_context_create(struct objtool_file *file);
 void disas_context_destroy(struct disas_context *dctx);
 void disas_warned_funcs(struct disas_context *dctx);
+void disas_funcs(struct disas_context *dctx);
 int disas_info_init(struct disassemble_info *dinfo,
 		    int arch, int mach32, int mach64,
 		    const char *options);
@@ -37,6 +38,7 @@ static inline struct disas_context *disas_context_create(struct objtool_file *fi
 
 static inline void disas_context_destroy(struct disas_context *dctx) {}
 static inline void disas_warned_funcs(struct disas_context *dctx) {}
+static inline void disas_funcs(struct disas_context *dctx) {}
 
 static inline int disas_info_init(struct disassemble_info *dinfo,
 				  int arch, int mach32, int mach64,
-- 
2.43.5

