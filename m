Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C928A40C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224108; cv=none; b=Ur34ta/MgVArfJcVl3qZk08ZlxfQzGjfeMj+39YdfBXEnrs+PjzNPKLhifZTgbR/BBVv7WMeI8xgOAibE8EAli+IwWXY2mKsOuaWWanxxQQOY21DBL4ExeH+qVNb2SCNXRi18GLi+VwQQMYB2UBHVcIHi2CZiC3XNRen/7sZX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224108; c=relaxed/simple;
	bh=wf45yRpEwq5KiZcDz36ZHOLG9XlM2tWNLMFFlF385kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtmER+rwgaOmXDwjN317Kyq7pTci6fb1miOdiwV59R8zfzcT6JuWk36Z9UmXjbNvtluaBuvSO55DY6f1avdWhkx3TQ+R9BboObttpcsLJ1gL92YqrQV3H/FflUbLPpchF3ixFlwEjZuth5Dm6/lwnZXtPf0Pf4DFKw6HcB7XfDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kszUSr7b; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kszUSr7b"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MWAb002101;
	Fri, 6 Jun 2025 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=G4+f+
	x8WW0xnNhwauAPhEewB+fqNtqeekRCjKKOKkv8=; b=kszUSr7bMRY1tjD/kw/6L
	FEyttZn5jB/KBErkPqj3XxhWZmyZPDx5wlQIQaj4jLUgY7pJz2hV0vlss1OE379a
	TgHQeaNJ+THaH97blIEuwoCHX/SDgKFzcdYEH0R1sUln7P5CQ3Wnct8+bRpSaOfw
	NspDdC/cyQ2ATfNdOrGtqhi3+pfdcGTM+PXifkdPX7jwwcFYC2QH1/J1OGBvvGBS
	VTqoARwIOCmOn8bVNszQ7Us/6AzKEzBRutmKpVwTG9vDq46dshbO/2Ynoc+017s8
	e6CoN7+U1CkScCPcERobjWZn53c5ac87YhIvFhUZTbEPBKWDoyKqS/4jvY+E6zx5
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahgag7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556EGXHo039442;
	Fri, 6 Jun 2025 15:35:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7desdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 15:35:01 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 556FYh3t015517;
	Fri, 6 Jun 2025 15:35:00 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-187-118.vpn.oracle.com [10.154.187.118])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 46yr7des15-9;
	Fri, 06 Jun 2025 15:35:00 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC 08/13] objtool: Record symbol name max length
Date: Fri,  6 Jun 2025 17:34:35 +0200
Message-ID: <20250606153440.865808-9-alexandre.chartre@oracle.com>
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
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68430aa6 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=xKpiAcmDGk3KfUQPlkUA:9
X-Proofpoint-GUID: e1aT2PFvLXcXI2pJ_4RM6K48iuejL4A3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNyBTYWx0ZWRfX6A6eS7NrWZgb 60CsbyU2+rrEjaUBDPy5cN1GzVJOsciSu9P3vBHYZznFcgcCTcGtJqecppGn+UmB5ym5maIVYhA Tf9RdcAbqecxJvnmwlLofoSFUW58lExHA8uGDMLn6Ess4ssMQHqJidu/Bz/JWJ1KhS8DoqA54eG
 wn0LyjtJdlblg9mBR5jTmgClhhVoZuvY0wBIiBHRIs12odcaBEbksuWaz1uSYE3ft4MCxN5gbI0 P/CeEoFKeOXtElOrhwowCLHuH73ovwEnbFbT5XacvyLDwxCxRzh9wrBKA3ZeV29knryZFoi2iL2 6Z7OHT/XGhVBNcqGFAbnBndF+1HcpuKIaN0Z7Rxbz1gfR/aDZfRg5SEmHaw6kW9/6fJN3wIEqrN
 rCnnyECd+t/ritPyFRnCngyUVZBaHok8WrlrIqu1SIeb7C0vdIPz4Z2/sjmoPGU7nmwtnajw
X-Proofpoint-ORIG-GUID: e1aT2PFvLXcXI2pJ_4RM6K48iuejL4A3

Keep track of the maximum length of symbol names. This will help
formatting the code flow between different functions.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 36ec08b8d654..300428cb5c2c 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -34,6 +34,8 @@ static struct cfi_state init_cfi;
 static struct cfi_state func_cfi;
 static struct cfi_state force_undefined_cfi;
 
+static size_t sym_name_max_len;
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset)
 {
@@ -2458,6 +2460,7 @@ static bool is_profiling_func(const char *name)
 static int classify_symbols(struct objtool_file *file)
 {
 	struct symbol *func;
+	size_t len;
 
 	for_each_sym(file, func) {
 		if (func->type == STT_NOTYPE && strstarts(func->name, ".L"))
@@ -2484,6 +2487,10 @@ static int classify_symbols(struct objtool_file *file)
 
 		if (is_profiling_func(func->name))
 			func->profiling_func = true;
+
+		len = strlen(func->name);
+		if (len > sym_name_max_len)
+			sym_name_max_len = len;
 	}
 
 	return 0;
-- 
2.43.5

