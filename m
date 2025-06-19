Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0CC230D2B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345037; cv=none; b=C2IS3guIeDtSR5KwTBA9gDk0OTUBmEaDuajZYdbPvQsJJ1TUrz3tnsPfmyfft8Bxi43rb/ZyiUc3dNhlcphyOw47YTO9+xpRxJcn0harZxfHh+rC6d5V9/UqAukoRjFOpM6bdnqJDcFHC5689Yr1fMdifYe5K0Q5oSvNLd+Ccio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345037; c=relaxed/simple;
	bh=ZI9VuxpxL6OkMDZdK7rQxtNCWS9uPNyI/dYz/jzQsKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tv0ZUpUIORsDoL0ZLbLoAz4ew7pdMKWPkoLKfci5EM6N56uOl/OtHoVyAoaFLZIyTUYi2y7CMg6urMpMAlFSrmhxUZ8CbeWjESc6ZY2BB790t1z375O4x2iRq1WLrtNARn5amGUQlsB0G6+KY1fgWWyS77VBp5uK8ltddNxAdKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q9EDnqq1; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q9EDnqq1"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMbVL029383;
	Thu, 19 Jun 2025 14:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=QiUiN
	u83/u8PIbpSz74ANU1xCRgFmpKw89MT6iibuVs=; b=Q9EDnqq1D69zb1mqBY0qk
	X3Ah3MlcTjBhzpWZIn3TXJt/mzfMIHuZ3MyzkUZFVrYtvKpgA+T6qCDRfZevyaUe
	dBAywyvazE/S/esW8jRnwiqXImBeDH0llVu6+IxsUYcgHehRyuJrlM42DZxOmIhg
	WHee3LPY5srkUmCNPYOea/RcurwYhTzJKGoOnF+rHRB91otbL1ZTEOSdiZsY/VZl
	GM7vr3JMqRr3znRPgt8oT2ATd2XDpArGdgXiZ8kMx0yh8Yu05QVbKQujg4b7NZBK
	rnBxJPVmGk/uqoEl2kmK5b3N9JQsgvzhyOL4mgz29Rw5RpBptLT2ITJk8z9JunMd
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xwjxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDNm1C022907;
	Thu, 19 Jun 2025 14:57:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:03 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JD008257;
	Thu, 19 Jun 2025 14:57:02 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-3;
	Thu, 19 Jun 2025 14:57:02 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 02/17] objtool: Create disassembly context
Date: Thu, 19 Jun 2025 16:56:44 +0200
Message-ID: <20250619145659.1377970-3-alexandre.chartre@oracle.com>
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
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=925 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX4CMdfiNDraT3 eFuLHCdFpchCHb36mgrK16l0V0ATTifnoF5ZIsPHU1Z8QoQISGM8/jzg61z2fuxJC7XBI6ZCeBu JSS9fdjfUaTAUheClanJ8TN2iD/qZlijKFLn7R0qhqXZkUgXSvlWdrHgp8UT6rhMaDr8G4e8FaJ
 FRWQlyH9TuaWKxFZ8fTuClAfUWx+hB8s2P/vCylOwypixQbT7ThsDGECAR5otb/IYWW91gao5S2 ivi4p5EiIutrQzq+PRAa/yKOq5WEiwXERzi+wc+M1yxJlmPbyZcqVue7AGmiDSGJ3S61ALXc0U8 HBQjm8iof/bSZWwEoGVw7epY8R9Wdz+IB1A+7ZYkprmEsfLgrDeVme5CTY7zNM6lWwZKvHJVxyM
 6bR+cpD4FGu0zH60DjxtICH/1sVf/kI5BeDFvppYDXa7zvDN5xjjarTWsVhDjXhTU7qJWl3D
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=68542540 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=-R_vEHidSSj7PnaEDHgA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: swcVQduEC-3m3w-w3oyflNBvhJUNFBOP
X-Proofpoint-ORIG-GUID: swcVQduEC-3m3w-w3oyflNBvhJUNFBOP

Create a structure to store information for disassembling functions.
For now, it is just a wrapper around an objtool file.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                   |  6 ++++-
 tools/objtool/disas.c                   | 32 +++++++++++++++++++++++--
 tools/objtool/include/objtool/disas.h   | 14 +++++++++++
 tools/objtool/include/objtool/objtool.h |  2 --
 4 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 tools/objtool/include/objtool/disas.h

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index bd1974717fa3..cef3a32a6747 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -11,6 +11,7 @@
 #include <objtool/builtin.h>
 #include <objtool/cfi.h>
 #include <objtool/arch.h>
+#include <objtool/disas.h>
 #include <objtool/check.h>
 #include <objtool/special.h>
 #include <objtool/warn.h>
@@ -4591,6 +4592,7 @@ static void free_insns(struct objtool_file *file)
 
 int check(struct objtool_file *file)
 {
+	struct disas_context *disas_ctx;
 	int ret = 0, warnings = 0;
 
 	arch_initial_func_cfi_state(&initial_func_cfi);
@@ -4720,7 +4722,9 @@ int check(struct objtool_file *file)
 		if (opts.werror && warnings)
 			WARN("%d warning(s) upgraded to errors", warnings);
 		print_args();
-		disas_warned_funcs(file);
+		disas_ctx = disas_context_create(file);
+		disas_warned_funcs(disas_ctx);
+		disas_context_destroy(disas_ctx);
 	}
 
 	return ret;
diff --git a/tools/objtool/disas.c b/tools/objtool/disas.c
index 77de46beb496..67eff2a14832 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -4,10 +4,35 @@
  */
 
 #include <objtool/arch.h>
+#include <objtool/disas.h>
 #include <objtool/warn.h>
 
 #include <linux/string.h>
 
+struct disas_context {
+	struct objtool_file *file;
+};
+
+struct disas_context *disas_context_create(struct objtool_file *file)
+{
+	struct disas_context *dctx;
+
+	dctx = malloc(sizeof(*dctx));
+	if (!dctx) {
+		ERROR_GLIBC("failed to allocate disassembly context");
+		return NULL;
+	}
+
+	dctx->file = file;
+
+	return dctx;
+}
+
+void disas_context_destroy(struct disas_context *dctx)
+{
+	free(dctx);
+}
+
 /* 'funcs' is a space-separated list of function names */
 static void disas_funcs(const char *funcs)
 {
@@ -58,12 +83,15 @@ static void disas_funcs(const char *funcs)
 	}
 }
 
-void disas_warned_funcs(struct objtool_file *file)
+void disas_warned_funcs(struct disas_context *dctx)
 {
 	struct symbol *sym;
 	char *funcs = NULL, *tmp;
 
-	for_each_sym(file, sym) {
+	if (!dctx)
+		return;
+
+	for_each_sym(dctx->file, sym) {
 		if (sym->warned) {
 			if (!funcs) {
 				funcs = malloc(strlen(sym->name) + 1);
diff --git a/tools/objtool/include/objtool/disas.h b/tools/objtool/include/objtool/disas.h
new file mode 100644
index 000000000000..5c543b69fc61
--- /dev/null
+++ b/tools/objtool/include/objtool/disas.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025, Oracle and/or its affiliates.
+ */
+
+#ifndef _DISAS_H
+#define _DISAS_H
+
+struct disas_context;
+struct disas_context *disas_context_create(struct objtool_file *file);
+void disas_context_destroy(struct disas_context *dctx);
+void disas_warned_funcs(struct disas_context *dctx);
+
+#endif /* _DISAS_H */
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index 4d3e94b70fd8..c0dc86a78ff6 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -47,6 +47,4 @@ int check(struct objtool_file *file);
 int orc_dump(const char *objname);
 int orc_create(struct objtool_file *file);
 
-void disas_warned_funcs(struct objtool_file *file);
-
 #endif /* _OBJTOOL_H */
-- 
2.43.5

