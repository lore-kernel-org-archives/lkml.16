Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DBB2857D2
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224096; cv=none; b=muimDWBA8pVlbhQ3VTtuA/0atS7XI8CntTIJ1JBLos2TD/7TR2B+w/Y4atailUGUYALvCYDQFX6NKjVDa+JEEyL2uedUYjdUucCPy8U8nNxPo/KZd9qgcH3/UIrB9fuB+OLsYxh/KqbfbZiCj6cQ05/psNj5wSW/swHZg0VjCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224096; c=relaxed/simple;
	bh=uFli8qripjOIKS+FVhZZomp//yZqATpNXfvNFflsUhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lC2wbbHzAHDs/knMNa/s2vsmlVdIVJFyD51U6PdP6knU2mscchLs52MS5UXhy3zGm4yPN9HNCI2d4W8FyAFKouFQdFahy7Osjf45ToWvHiVBNRp2/IaehvawrRXfIBoM+a5+iMt78PE9/zgli0S/aShxMLr1jryJ6+K0dqSeR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ALVVZTNv; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ALVVZTNv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MYQU002138;
	Fri, 6 Jun 2025 15:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=TQjWc
	pisuoarYkrPpFS4fkXe+RQOPP/UyAZhdCaRaSQ=; b=ALVVZTNvUQHgnoHuoB/lr
	wQ9+rILCUe41zJLgPAPOIuO3unqWdAKrDUQonV0e3pS0Ui41Rq2/HLaxI2bJc0bG
	k/Jd1VKeoEsuFAi3c+iYYQ47F287NezTfkQM1TfFd8Px97R3iK+VGOyXkbNayabU
	ujMde3VJU0h/y3bhFpCJEo0SPNP+OIkq94p0IF2KPJo4VL1tMBy4A6FyZ6BA2Dh5
	vTLYDkFMAYn35o55im24CBZ+riDlupq5CILgSo4iWhJZBkXNJKCIVv4RsodCIZHr
	6LA74JgIiTbjbDs+ts/p8x4xeWypdXci1/GLTrVewX/9D4kv/HwowD0K+1gJAsEI
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahgafe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556EKfsp039169;
	Fri, 6 Jun 2025 15:34:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7des3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:46 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3f015517;
	Fri, 6 Jun 2025 15:34:46 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-2;
	Fri, 06 Jun 2025 15:34:45 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 01/13] objtool: Move disassembly functions to a separated file
Date: Fri,  6 Jun 2025 17:34:28 +0200
Message-ID: <20250606153440.865808-2-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68430a97 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=dBVU6wt392Vc8wzyTJAA:9
X-Proofpoint-GUID: afOuQ-x1qthg74Vzxnhh2gywORA-aq3p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX2myZSbfx0x9q +V6JoFeWGO2E4lB6p1BGpPsfxEidOB0hcwjuf0ageOuLa4Kgp7TTWcaEf2gOK7yG1UsLNAgOf2J LngR4cMCBPuz00KRSGBj07nEjuhUX1th6KIAL6H5a1W8ViCXdqNLxTxTXnPlsSma3xpkR/KLqH9
 8RHyTtGbBa7X89pVcltouCJ8kQCRdumfo3c8kiEUSDXhbfKvOCV6gyrz3vM1ef8TDrm0QGmaPGg oenAXUe7OjXNbmiSlRv7tBjXwUt1+bPaP9gAI4qY1Uovm28+9V5L79A0nsgym45iAAJfiClQIeE ShiafMjCWVp84Trjk2q25m3HXxcTMSuJFMH2j2e5sZUojKH16WpmLTq1E4t+QZEC7m9b3XDDjNv
 1GA0azkC+XRA4uLKO9y/2KOvn9/E1C8a2kG4bP3M3foR048siuvujn5S/D2CGl6Powj4SNxr
X-Proofpoint-ORIG-GUID: afOuQ-x1qthg74Vzxnhh2gywORA-aq3p

objtool disassembles functions which have warnings. Move the code
to do that to a dedicated file. The code is just moved, it is not
changed.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/Build                     |  1 +
 tools/objtool/check.c                   | 81 ----------------------
 tools/objtool/disas.c                   | 90 +++++++++++++++++++++++++
 tools/objtool/include/objtool/objtool.h |  2 +
 4 files changed, 93 insertions(+), 81 deletions(-)
 create mode 100644 tools/objtool/disas.c

diff --git a/tools/objtool/Build b/tools/objtool/Build
index a3cdf8af6635..677bf9148cba 100644
--- a/tools/objtool/Build
+++ b/tools/objtool/Build
@@ -7,6 +7,7 @@ objtool-y += special.o
 objtool-y += builtin-check.o
 objtool-y += elf.o
 objtool-y += objtool.o
+objtool-y += disas.o
 
 objtool-$(BUILD_ORC) += orc_gen.o
 objtool-$(BUILD_ORC) += orc_dump.o
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f23bdda737aa..bd1974717fa3 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4561,87 +4561,6 @@ static int validate_reachable_instructions(struct objtool_file *file)
 	return warnings;
 }
 
-/* 'funcs' is a space-separated list of function names */
-static void disas_funcs(const char *funcs)
-{
-	const char *objdump_str, *cross_compile;
-	int size, ret;
-	char *cmd;
-
-	cross_compile = getenv("CROSS_COMPILE");
-	if (!cross_compile)
-		cross_compile = "";
-
-	objdump_str = "%sobjdump -wdr %s | gawk -M -v _funcs='%s' '"
-			"BEGIN { split(_funcs, funcs); }"
-			"/^$/ { func_match = 0; }"
-			"/<.*>:/ { "
-				"f = gensub(/.*<(.*)>:/, \"\\\\1\", 1);"
-				"for (i in funcs) {"
-					"if (funcs[i] == f) {"
-						"func_match = 1;"
-						"base = strtonum(\"0x\" $1);"
-						"break;"
-					"}"
-				"}"
-			"}"
-			"{"
-				"if (func_match) {"
-					"addr = strtonum(\"0x\" $1);"
-					"printf(\"%%04x \", addr - base);"
-					"print;"
-				"}"
-			"}' 1>&2";
-
-	/* fake snprintf() to calculate the size */
-	size = snprintf(NULL, 0, objdump_str, cross_compile, objname, funcs) + 1;
-	if (size <= 0) {
-		WARN("objdump string size calculation failed");
-		return;
-	}
-
-	cmd = malloc(size);
-
-	/* real snprintf() */
-	snprintf(cmd, size, objdump_str, cross_compile, objname, funcs);
-	ret = system(cmd);
-	if (ret) {
-		WARN("disassembly failed: %d", ret);
-		return;
-	}
-}
-
-static void disas_warned_funcs(struct objtool_file *file)
-{
-	struct symbol *sym;
-	char *funcs = NULL, *tmp;
-
-	for_each_sym(file, sym) {
-		if (sym->warned) {
-			if (!funcs) {
-				funcs = malloc(strlen(sym->name) + 1);
-				if (!funcs) {
-					ERROR_GLIBC("malloc");
-					return;
-				}
-				strcpy(funcs, sym->name);
-			} else {
-				tmp = malloc(strlen(funcs) + strlen(sym->name) + 2);
-				if (!tmp) {
-					ERROR_GLIBC("malloc");
-					return;
-				}
-				sprintf(tmp, "%s %s", funcs, sym->name);
-				free(funcs);
-				funcs = tmp;
-			}
-		}
-	}
-
-	if (funcs)
-		disas_funcs(funcs);
-}
-
 struct insn_chunk {
 	void *addr;
 	struct insn_chunk *next;
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
new file mode 100644
index 000000000000..77de46beb496
--- /dev/null
+++ b/tools/objtool/disas.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2015-2017 Josh Poimboeuf <jpoimboe@redhat.com>
+ */
+
+#include <objtool/arch.h>
+#include <objtool/warn.h>
+
+#include <linux/string.h>
+
+/* 'funcs' is a space-separated list of function names */
+static void disas_funcs(const char *funcs)
+{
+	const char *objdump_str, *cross_compile;
+	int size, ret;
+	char *cmd;
+
+	cross_compile = getenv("CROSS_COMPILE");
+	if (!cross_compile)
+		cross_compile = "";
+
+	objdump_str = "%sobjdump -wdr %s | gawk -M -v _funcs='%s' '"
+			"BEGIN { split(_funcs, funcs); }"
+			"/^$/ { func_match = 0; }"
+			"/<.*>:/ { "
+				"f = gensub(/.*<(.*)>:/, \"\\\\1\", 1);"
+				"for (i in funcs) {"
+					"if (funcs[i] == f) {"
+						"func_match = 1;"
+						"base = strtonum(\"0x\" $1);"
+						"break;"
+					"}"
+				"}"
+			"}"
+			"{"
+				"if (func_match) {"
+					"addr = strtonum(\"0x\" $1);"
+					"printf(\"%%04x \", addr - base);"
+					"print;"
+				"}"
+			"}' 1>&2";
+
+	/* fake snprintf() to calculate the size */
+	size = snprintf(NULL, 0, objdump_str, cross_compile, objname, funcs) + 1;
+	if (size <= 0) {
+		WARN("objdump string size calculation failed");
+		return;
+	}
+
+	cmd = malloc(size);
+
+	/* real snprintf() */
+	snprintf(cmd, size, objdump_str, cross_compile, objname, funcs);
+	ret = system(cmd);
+	if (ret) {
+		WARN("disassembly failed: %d", ret);
+		return;
+	}
+}
+
+void disas_warned_funcs(struct objtool_file *file)
+{
+	struct symbol *sym;
+	char *funcs = NULL, *tmp;
+
+	for_each_sym(file, sym) {
+		if (sym->warned) {
+			if (!funcs) {
+				funcs = malloc(strlen(sym->name) + 1);
+				if (!funcs) {
+					ERROR_GLIBC("malloc");
+					return;
+				}
+				strcpy(funcs, sym->name);
+			} else {
+				tmp = malloc(strlen(funcs) + strlen(sym->name) + 2);
+				if (!tmp) {
+					ERROR_GLIBC("malloc");
+					return;
+				}
+				sprintf(tmp, "%s %s", funcs, sym->name);
+				free(funcs);
+				funcs = tmp;
+			}
+		}
+	}
+
+	if (funcs)
+		disas_funcs(funcs);
+}
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index c0dc86a78ff6..4d3e94b70fd8 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -47,4 +47,6 @@ int check(struct objtool_file *file);
 int orc_dump(const char *objname);
 int orc_create(struct objtool_file *file);
 
+void disas_warned_funcs(struct objtool_file *file);
+
 #endif /* _OBJTOOL_H */
-- 
2.43.5

