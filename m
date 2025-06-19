Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8266927F166
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345039; cv=none; b=EIXzqh1hH61VKtNI0n5CnZ2xC9XFyGRrFZEhwlZRRVJL/XYfZMoiTdvNIGbecN4NHkFOWyNN/Xphz8cy7g3XhadEuphtA1NHMHorF/vWs4y1ITnndejZ8hvyjdzvQh/DBwnJaO2N5nCFtUOw3Gv+zUKZJzRAo/sGpuvvw2tr8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345039; c=relaxed/simple;
	bh=uFli8qripjOIKS+FVhZZomp//yZqATpNXfvNFflsUhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJ4uGFxDJZoyRA4SZm8TWRWzS71fF12pelt+SrHtboFERtqbqcXL6DE5MyuE0pNnIlDRE2A9Gjtsf7VLDrNQAW4dpuo5iwvEmfc/8960AdctdF79EBt4zfmeOBfmVurnt1qnoWOTmrKZTNUD1FjZ1GkaLcOk+l5VqUaQZT3q4l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BO2cFz04; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BO2cFz04"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMaE0014939;
	Thu, 19 Jun 2025 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=TQjWc
	pisuoarYkrPpFS4fkXe+RQOPP/UyAZhdCaRaSQ=; b=BO2cFz0431WL7/rIFzb0X
	1eLKCYvi8rLJzlHY9r8IpACI4JOTSTAvykBkADZjaEttFZjRB4ZDBWM0IaaLUZFJ
	mMOn0G6O/+iOsvHzuta3NVJXVFE/WGCxAQtp9UNXwr/PrsjlphRcgunkRBQtyqBk
	rDdPzzn4/+Wlidz8PZr1s5B9lHnbjIwI6ogXesVZbPaYBiriLWtRkposUmXjntoq
	1zcfICZO+pMzkyuFBVMXTH+W+r3cdU8p2e7CuOBVh9eYVmz8ERZtU9u2ycyp8U20
	SdWv7qBqy6ffKdwsfi6weN7szQd65l8cEhmWzxualu1v/C/ZZl2fQPwd0Cd0qdB/
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4t4ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDOK9Q022966;
	Thu, 19 Jun 2025 14:57:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8du6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:02 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JB008257;
	Thu, 19 Jun 2025 14:57:01 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-2;
	Thu, 19 Jun 2025 14:57:01 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 01/17] objtool: Move disassembly functions to a separated file
Date: Thu, 19 Jun 2025 16:56:43 +0200
Message-ID: <20250619145659.1377970-2-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX5K2m+8rdOrEb wwSG2XbgWmRTntY4STGoVjQxxqnWfqRMSuvZyvNNZ7CSkJX6IagS8hN52KiV1XQnpnbRxVB9N5/ JeDQsq+vARCCksFsM6HBMktMBvdEZU9tU4nd6t2oYSmy9xxgbuxLWThrkNQuvax7gc37C+VGyMy
 USHGLWRV/1YYvYMHKhIUwYEVxWa0Wl+xPlo5I1tEhLKQZA7p5uixwzvysmwb+yTnbifD/xtSaaI cbzwMsU8nYq2YfNDWyVLUrb024UaAHoywBGCY+/ADbLNJyXYUhoJL4Bf5/dZ1BlUQXZ8ff4EfYA Cf3VgaQDg6L8gOpTowSyfkkyGCrEEYINuNU04CJUqiJuS+HSymco5eYfPRshu+67ZtbXKXw/Bk3
 qCvnRIhNERFhW2qMMiZA3lHZtDjojgE3S4Cgj7l4Z6iWZ+t+NXJUy/HRB57xAVByj4fI9yVl
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6854253f b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=dBVU6wt392Vc8wzyTJAA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: gxn8Z8Ab0L1J2-R04nzZWDe_yPANApJC
X-Proofpoint-ORIG-GUID: gxn8Z8Ab0L1J2-R04nzZWDe_yPANApJC

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

