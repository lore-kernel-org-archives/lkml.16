Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C728B407
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224118; cv=none; b=HbtYCsalU8Jn25U5AfMTxZB9l19YktbFxVUlESZHeEmjVHS/7S7mzDRng3c/rNNdsw5p/fCv3Q35Dqww4t1CAUybtXMcbO5kjv1rWGKwMtAizriMTDQHRpq45wENqem19B1za8ar9Yv4h5vO0qLEDnMc+2HY3imz43HDMAhafbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224118; c=relaxed/simple;
	bh=pNz8oI4NgRu/uensBbLsGjNJQn6uHB9jVjTVFyCtJ4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSZaaXyvlZiYlT9x1jxu21P/6R2mQNXucV7CKmcKmtdpjryzbIElLZ6ojHErcnsd/C75Zfn7mhjJOJ7H2zSvX12/P0ZOtHljw1I+152lfGPqT6zouFGVQ1S8emiTT6UNnd/6Fmy9t5jBNcJgXHdfn5ksa+glBeU7VEh3NHLzzvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mNBcPPCC; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mNBcPPCC"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MZla011741;
	Fri, 6 Jun 2025 15:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=f38ZA
	5UozH5ByoH9pR2Me3XWlBHPHaaOZKuA3m4xCvo=; b=mNBcPPCCrNvUL9SWEX+zF
	wtMfnFD1CxwA9eEKB4G2cQy6D0INZKIN9FFtwspSyzMjdEWKr1WHYYj492TH3yzW
	FzUzTF03RndBP0E96ioasVIRkHaCM/Fr1k5MuGordPALlFy07ew5FAFgWcCZjQ5l
	NtsxitRKc2F+SKLHhW3DDgwbfUNiyIz33Rp98MD3p8Uc4d+sY/+1uWijvbL502wy
	vKQdkL6+wBPGgal7NYUPY5AniLpu5dwsQZgFyjbqcMII06MXqDCreMrEkljxP7Q9
	K3i2V3TT4X/DkyJAdegRTWSDuVsrfcfXMRaeUPriv3jeYVPYxaGnSXuH5hi8nwee
	Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j89dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556Ejvkt039147;
	Fri, 6 Jun 2025 15:35:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:10 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh43015517;
	Fri, 6 Jun 2025 15:35:09 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-13;
	Fri, 06 Jun 2025 15:35:09 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 12/13] objtool: Improve tracing of alternative instructions
Date: Fri,  6 Jun 2025 17:34:39 +0200
Message-ID: <20250606153440.865808-13-alexandre.chartre@oracle.com>
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
X-Proofpoint-GUID: hhTm_Y8lnZ6qNsoBXw5vdrtJCrxJL3O3
X-Proofpoint-ORIG-GUID: hhTm_Y8lnZ6qNsoBXw5vdrtJCrxJL3O3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX1XcM7KO0aCQq Futq2/ZXyc09l51rO2FmdQvHev7IKAL29JbogRGkJG7PMgoCL5HxJevXsgw5BfmRutB8e7nUIlX P6xAnhp0oewvlAqeTsaRwjiYV3HdqjPuEmNQ9vZDHfPJRswKOeET/r52WUi/y3JvwsYxdBrj5Ia
 QNW+s29Pxrb771+wqHkIVU5JDXJN1vNIrf6yCFJxeD6a/UbUdEMHN1/8ycE27Yt2EQl8dZgS8o3 hq3aQ4VcxKvFuvhEqKQo68ZwsCiN71WR432t61mSdKkPWwfZKyvRPeAjU1sxuc6JUXLkEsBbQqX NxxN4+Lx+CTDL4eXBU4Y/bvr/8V1gdXy+NmAy6M1SYS2gRlVMSAf5O9iPVBeby7yOUcVxK5sRxK
 H0J3Y6liJ+/X/O1mDxaK3SNm87ktFecUYruB0eZUoNSHwEAYcT+XZgv14kgmbTDJFhjdYX8W
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=68430ab0 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=RxUVdm5A3GcFcKIcQO8A:9

When tracing function validation, improve the reporting of
alternative instruction by more clearly showing the different
alternatives beginning and end.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 59 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 050d34930372..afcb6c67daa9 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -54,9 +54,61 @@ static int vtrace_depth;
 		}						\
 	} while (0)
 
+#define VTRACE_INFO(insn, fmt, ...)				\
+	do {							\
+		if (vtrace)					\
+			vtrace_info(insn, fmt, ##__VA_ARGS__);	\
+	} while (0)
+
+#define VTRACE_ALT_FMT(fmt) "<alternative.%lx> alt " fmt
+
+#define VTRACE_ALT(insn, fmt, ...)				\
+	VTRACE_INSN(insn, VTRACE_ALT_FMT(fmt),			\
+		    (insn)->offset, ##__VA_ARGS__)
+
+#define VTRACE_ALT_INFO(insn, fmt, ...)				\
+	VTRACE_INFO(insn, VTRACE_ALT_FMT(fmt),			\
+		    (insn)->offset, ##__VA_ARGS__)
+
+#define VTRACE_ALT_INFO_NOADDR(insn, fmt, ...)			\
+	VTRACE_INFO(NULL, VTRACE_ALT_FMT(fmt),			\
+		    (insn)->offset, ##__VA_ARGS__)
+
 #define VTRACE_INSN_OFFSET_SPACE	10
 #define VTRACE_INSN_SPACE		60
 
+/*
+ * Print a message in the instruction flow. If insn is not NULL then
+ * the instruction address is printed in addition of the message,
+ * otherwise only the message is printed. In all cases, the instruction
+ * itself is not printed.
+ */
+static void vtrace_info(struct instruction *insn, const char *format, ...)
+{
+	const char *addr_str;
+	va_list args;
+	int len;
+	int i;
+
+	len = sym_name_max_len + VTRACE_INSN_OFFSET_SPACE;
+	if (insn) {
+		addr_str = offstr(insn->sec, insn->offset);
+		VTRACE_PRINTF("%6lx:  %-*s  ", insn->offset, len, addr_str);
+	} else {
+		len += 11;
+		VTRACE_PRINTF("%-*s", len, "");
+	}
+
+	/* print vertical bars to show the validation flow */
+	for (i = 1; i < vtrace_depth; i++)
+		VTRACE_PRINTF("| ");
+
+	va_start(args, format);
+	vfprintf(stderr, format, args);
+	va_end(args);
+	VTRACE_PRINTF("\n");
+}
+
 /*
  * Print an instruction address (offset and function), the instruction itself
  * and an optional message.
@@ -3692,7 +3744,7 @@ static bool skip_alt_group(struct instruction *insn)
 
 	/* ANNOTATE_IGNORE_ALTERNATIVE */
 	if (insn->alt_group && insn->alt_group->ignore) {
-		VTRACE_INSN(insn, "alt group ignored");
+		VTRACE_ALT(insn, "alt group ignored");
 		return true;
 	}
 
@@ -3905,8 +3957,9 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 
 		i = 1;
 		for (alt = insn->alts; alt; alt = alt->next) {
-			VTRACE_INSN(insn, "alternative %d/%d", i, count);
+			VTRACE_ALT_INFO(insn, "%d/%d begin", i, count);
 			ret = validate_branch(file, func, alt->insn, *statep);
+			VTRACE_ALT_INFO_NOADDR(insn, "%d/%d end", i, count);
 			if (ret) {
 				BT_INSN(insn, "(alt)");
 				return ret;
@@ -3914,7 +3967,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
 			i++;
 		}
 
-		VTRACE_INSN(insn, "alternative orig");
+		VTRACE_ALT_INFO(insn, "default");
 	}
 
 	if (skip_alt_group(insn))
-- 
2.43.5

