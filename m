Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844128B4E3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345040; cv=none; b=TGf1yPpLcwGIy6pIiaSH6UkQOW/Cq0OK9c0+BVFQuNagAKN5OSkjfuFSBQQ/DOPHOZtmBo+jd7zD2Q484Lm2fGa/0b6no5suT7rqg0osAIlLOvcCBLaCAXCVRRogDnXKTL4yLrsAOMKrBA7dALjYWKIkNbTZG3GRNmaSvkyMga8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345040; c=relaxed/simple;
	bh=2+J0Ma7F8aswnAgESnHjIrlfBsU5+IxaYdlSFeg4rs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLc24xwT9d/Jl6ZQK4pptzlWzlgmVSJKsuKlEUKpHCgYbkduRzVECqVATX6VoEXShVmTOl9E4JZru57iMQAQNns4ngpiNqAH4YR2t4dv2Z9a89O5XER/JBozk9+E8TQKaM2VEpPb38Aw46uIDzLX7J+9X5c/1rUEXlFesnvqpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WdUhcekc; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WdUhcekc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMaar002967;
	Thu, 19 Jun 2025 14:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=7EfvH
	dt7hzlIhbWgdXEx3hKGGQCk35d8Qu0bVOuZZwI=; b=WdUhcekcg/EU9sM3/g2Ma
	OmdHUZLGTYRkoMjKWTBj7/qLrh86p6jp/m3hy66rf86gLzL3Ynh0kMdWmYYHqGjL
	KEnnqDJ9F6xRFtiRbqeRUWq1TRdQgyx5T3XRrbQsq7grC/haZjKdOGMUjSNaWjGx
	MIa5HLuZwxxnQAU0KVGwJBlmz7ZubsIGZek8cP3ntXXjBJfWu4Pr4V+WzruAKyqM
	T32Zy+P+MvdHQmsthPvtXH3ueh20ETatdWd+7EEHFJZfCHIQyx3bDnAOFQes4TZm
	Tl2Bqn8g/g72PCz967l2XSHz+pMp4TQPGpOwAun8fbFbjbbhZczK2SBS5rBEMpTJ
	A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yda16s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDOaxY022852;
	Thu, 19 Jun 2025 14:57:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:13 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JT008257;
	Thu, 19 Jun 2025 14:57:12 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-11;
	Thu, 19 Jun 2025 14:57:12 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 10/17] objtool: Record symbol name max length
Date: Thu, 19 Jun 2025 16:56:52 +0200
Message-ID: <20250619145659.1377970-11-alexandre.chartre@oracle.com>
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
X-Proofpoint-GUID: yULLnoUm-1vj4kJo4YRTI4ijs6T7yomU
X-Proofpoint-ORIG-GUID: yULLnoUm-1vj4kJo4YRTI4ijs6T7yomU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfXyoq8mz0Tqgmp Xb3267roO9pccHanqTbi6/T86c7kw30yoVBjdjmPAb0Hzn7FM2gvIrI8GaWRNx+ULNO1vrxMV+0 +MtlH/tlfcnly71BI9BoAdlFzuHLWFrNhdyqOl6qFeOACyuARHy/fn7VvxgQyXR8olzy4+hELmu
 TZSBZek21JoYem9beyPx+sytUzHJzaL93WkFXvKU59DN0zaBDlA4P1tXVa4UKtfTAvvVAqXl/9a aQT35UOYghAm40jI/LbniuT1FZoIoxSDYQ5kRALQC1Pl+5cXkbpkq/rIYANOcGfOgkDbWFHNEk4 gTEkrO8clEB+lz+odKGZSGvaLVr7Lj17W4ZYFJJ2RW+Kl2/2dmQEkSuhdeQz73NiGrSCaelwBnK
 CYsbjj55naVhNiLsPKzLQ1yIyoOAwXw3Q3d0dKzYBrc/X1o/jNDIYf/cHCxfvDnJEOZ/X5Tc
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=6854254a b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=xKpiAcmDGk3KfUQPlkUA:9 cc=ntf awl=host:13207

Keep track of the maximum length of symbol names. This will help
formatting the code flow between different functions.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 947fe57e9a6d..413860f2d7fa 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -35,6 +35,8 @@ static struct cfi_state init_cfi;
 static struct cfi_state func_cfi;
 static struct cfi_state force_undefined_cfi;
 
+static size_t sym_name_max_len;
+
 struct instruction *find_insn(struct objtool_file *file,
 			      struct section *sec, unsigned long offset)
 {
@@ -2459,6 +2461,7 @@ static bool is_profiling_func(const char *name)
 static int classify_symbols(struct objtool_file *file)
 {
 	struct symbol *func;
+	size_t len;
 
 	for_each_sym(file, func) {
 		if (func->type == STT_NOTYPE && strstarts(func->name, ".L"))
@@ -2485,6 +2488,10 @@ static int classify_symbols(struct objtool_file *file)
 
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

