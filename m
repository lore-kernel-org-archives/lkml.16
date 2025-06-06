Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CD01C1741
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224096; cv=none; b=T1PgdjM7KK4c1xRf1eW4fvimez4KBB/eEsF6rIP/UiP+/0oZdCqsocj90P2TMNzYjB7pZ3js2LqazPKvUOtz9WVrUw6ie+65/bKPqzaIPmWafRP+e6rLV+C4ArPz7aiaty1pAKWK/2aKtbKl0aN3pHmHZvNTMu7WYfRHPdJ9yDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224096; c=relaxed/simple;
	bh=4rH/Gc2zIAmQVULcfBWujwFbbIqz8s2kJYv87k077Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QL/3KIZnE/2qdPis2AVmT48TfYDNTH6Vyz3/bwGmpAJSFqyMnrwFKgtRRSLAswIOGjS67uVAV1rd23zwPCV9+1XKRIm/cD8WWQXczo4GmsOwcdA12qU8HrY01rjVdLQOSr0IVIxCaH0LkLE9/pvlEX9a7uQFgzucKL/yKqmcHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jov7fJJk; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jov7fJJk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565Md4K011823;
	Fri, 6 Jun 2025 15:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=fsWbO
	kl2AGNdbyJ3MQxyQRY4djEzAoU2dzjlX/stUUo=; b=Jov7fJJk6yXySm0iQ8lT+
	VP2NqwTU/fAz4QCGRmXqWh4zE8qcUQhJkkNyi/no7eP0WUzqbao/2Qn3woFv7Ela
	CJm06mh19Tp7YLd5nv2r7fAApI/j3mQOIWgyEZoPT/+ut+y9ivZITv/G4eRmS3Xg
	mfye1FOhLgwJo3mFonJ97SWsNR0+tqwbMSi4LHRr4ohLn1AsGhZkOSiClempgyX5
	v6iSl9q/GTRI5XqcBA3yz/psKbHqdzzQtLTnHqJO35p+bCl3g6cjVxwoLcmIMDF1
	GxzzsyYlUJQt63JbVIk5ZGCOEsx6G3Oxto7NEeSSaSFBboXlNJv1STyDEgdnNXMB
	w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8j89ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556E22Oa038561;
	Fri, 6 Jun 2025 15:34:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7des51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:34:48 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3h015517;
	Fri, 6 Jun 2025 15:34:48 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-3;
	Fri, 06 Jun 2025 15:34:47 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 02/13] objtool: Create disassembly context
Date: Fri,  6 Jun 2025 17:34:29 +0200
Message-ID: <20250606153440.865808-3-alexandre.chartre@oracle.com>
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
 phishscore=0 mlxlogscore=934 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506060136
X-Proofpoint-GUID: 2KpW7A7QWI1djaUkjkBtM-BaPdnmGI2g
X-Proofpoint-ORIG-GUID: 2KpW7A7QWI1djaUkjkBtM-BaPdnmGI2g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX1ZKd6bL/BLPp M7go1xXG1VxXtzkD5TNi8VFfgE9UCp04+/y4KOE5GX9kXrP0dke8YMfdfN3FubKnr5zpFPvfgq/ iz/W7PLWlWlkVj1aMbJ5wmx4vNJbPeg9lsYeGyhr+AyHUuxvLxwGa8nFw+WJMekE2MeRiytG9J8
 Gy6CT16uFpcRgzQ6mGvsllYxD+Y7wO/+npEtyNr4KZLaJbNPpIWipKFW55wU6yVBvbTpT0o5L/m M889X0FZdqV4msH5DrCDvInGwltnyYd6P5Y+W7Bd25FcnSOts65Pi0jwU32YhblCvlcmjEl0cJ7 nQUeeMec1uuRZoaIx/VXHsgDLFwoIa0s/U3Yq8+OsVaU3NoZxn0m/qudm6CS4VWSNkul8vOgSvr
 ZMmxztQ16GseVRX1l9kL9PKHtKKkhe/EmawPSWbn1P7wgWHn/LI/Aftc6Tq6F3NfCvz2pzYu
X-Authority-Analysis: v=2.4 cv=QI1oRhLL c=1 sm=1 tr=0 ts=68430a99 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=WrX3ccauloUazzeUkokA:9

Create a structure to store information for disassembling functions.
For now, it is just a wrapper around an objtool file.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c                   |  5 +++-
 tools/objtool/disas.c                   | 33 +++++++++++++++++++++++--
 tools/objtool/include/objtool/objtool.h |  5 +++-
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index bd1974717fa3..085fcc1b643b 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4591,6 +4591,7 @@ static void free_insns(struct objtool_file *file)
 
 int check(struct objtool_file *file)
 {
+	struct disas_context *disas_ctx;
 	int ret = 0, warnings = 0;
 
 	arch_initial_func_cfi_state(&initial_func_cfi);
@@ -4720,7 +4721,9 @@ int check(struct objtool_file *file)
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
index 77de46beb496..ed74554bccbf 100644
--- a/tools/objtool/disas.c
+++ b/tools/objtool/disas.c
@@ -8,6 +8,30 @@
 
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
+		WARN("failed too allocate disassembly context\n");
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
@@ -58,12 +82,17 @@ static void disas_funcs(const char *funcs)
 	}
 }
 
-void disas_warned_funcs(struct objtool_file *file)
+void disas_warned_funcs(struct disas_context *dctx)
 {
 	struct symbol *sym;
 	char *funcs = NULL, *tmp;
 
-	for_each_sym(file, sym) {
+	if (!dctx) {
+		ERROR("disassembly context is not defined");
+		return;
+	}
+
+	for_each_sym(dctx->file, sym) {
 		if (sym->warned) {
 			if (!funcs) {
 				funcs = malloc(strlen(sym->name) + 1);
diff --git a/tools/objtool/include/objtool/objtool.h b/tools/objtool/include/objtool/objtool.h
index 4d3e94b70fd8..f5ab71f07f5c 100644
--- a/tools/objtool/include/objtool/objtool.h
+++ b/tools/objtool/include/objtool/objtool.h
@@ -47,6 +47,9 @@ int check(struct objtool_file *file);
 int orc_dump(const char *objname);
 int orc_create(struct objtool_file *file);
 
-void disas_warned_funcs(struct objtool_file *file);
+struct disas_context;
+struct disas_context *disas_context_create(struct objtool_file *file);
+void disas_context_destroy(struct disas_context *dctx);
+void disas_warned_funcs(struct disas_context *dctx);
 
 #endif /* _OBJTOOL_H */
-- 
2.43.5

