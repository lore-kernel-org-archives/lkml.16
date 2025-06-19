Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94E28DB4A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345045; cv=none; b=XcET29Ra4q+F0rN3z+++PsCxiKMbklhHCXRzi2HsMIIhJyHeij9LykRcyAt6Zuar1y5sd4N1QQ0n1/ze67ZNOn86XuWYsziKxKbcK0NTTr5OzXVdCznOfYj/74Rjrudnr8XWG+/yrjcaxrNPYIv+ZE0aU3fBNemeTGmAR0hsKSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345045; c=relaxed/simple;
	bh=zQckDNelWG6CV1PJeKinn6jnwA7PvmhWytZ/b79m1IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ia8RH4sF6ho8ctZNQwlAL/Dcv2qEhbapM/vQdwZMmKGu/50902nPHpkhDXL2uPpPuzxpfqbaeAtmGzrdcxNnD73WrVXKGE/kqXgjgzoQO0Oy3InhnSHqM/QjEBlVqERNXRXFNVyzBaKZkOkPX65mW97ikzVMPnWJLOGg2p6X4jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WCcbaqUS; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WCcbaqUS"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMZ2D011343;
	Thu, 19 Jun 2025 14:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=fgAm9
	hTnxGqHi2kf7mMzxwksSkxtw8Hfs9QzUIFInhA=; b=WCcbaqUSD8HjNS89dty/8
	tUQi42mvan1HBBkum89jDrPyo5rAm3fmpZsAQEmGYkQs7QNWuh9gIy+akik9gFS4
	E+rD7OFyDT32c5kCUFhK3kx3ZUfXsTaHZ1DacaCQBOMtrNo455AwIguTTtF1pdAq
	nviJ6NJimXoMi6Y57VGLAmmZxuHLFRzVHnKQductg6x7MESV1C0K0LMugjvSVfFc
	vDOWKxldQWb35mpaEWcOO8lSuAZKgBgIryUFCnkP+NXsuxwyuGOW3lR4j6kPz/aH
	JRa4z8zT+ju0QF6FkcxE/1AOFqe6Q8Hu/JtWIYks5/IW7OQ1Fqzb0NW31KxmpPpr
	Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47900f23qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDLxh0022869;
	Thu, 19 Jun 2025 14:57:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8e67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:19 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0Jd008257;
	Thu, 19 Jun 2025 14:57:18 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-16;
	Thu, 19 Jun 2025 14:57:18 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 15/17] objtool: Do not validate IBT for .return_sites and .call_sites
Date: Thu, 19 Jun 2025 16:56:57 +0200
Message-ID: <20250619145659.1377970-16-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX1JFBVHVYfgao 72YIRqDdf6NiMtXgjhb/suWE/ovk/3bAbxrOfgnwgpTQDt0nKa9u3nL0cJhB091eW2p2lME8uDu zsOnhNchN+21Znzwx/vlp32ecvaCpyCNqubLfXlNmMt4AQ3Cvi1yOgvy9GMqUCVgZ2I8oNo1KqG
 1Sv5Ji3JUeuBQb7NhbVTMXf+bCt24ESQWEPfv2zzygy9wBdCv+ebCK3EKEQn8Q5t6PNE9BriLpV tbs409FqXSQZDiEcTkI2EcBxRKgVrNSmbrApN/lJ6P3OwJK/r7JIt9oeQxLcazn+FIa6DKZKna5 507RLpdVsmoQCCzpQ9LlKE5mr8gCswF0Gjj/PTRjfW+KuW/ZNU6UGBV2zsMOzVlBPciPdS52P68
 +TJ5GBiiQhLMCOecmy6tsAofgtMFjeVs8mbioriHjLoBiNywDcZErAr7pDv8il8nJtpzBPJl
X-Proofpoint-ORIG-GUID: QoObeOXMPGK6QUfLZHfK8s48QLvgFD16
X-Authority-Analysis: v=2.4 cv=X/5SKHTe c=1 sm=1 tr=0 ts=68542550 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=yvIqsss6GtJD96b7xZoA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: QoObeOXMPGK6QUfLZHfK8s48QLvgFD16

The .return_sites and .call_sites sections reference text addresses,
but not with the intent to indirect branch to them, so they don't
need to be validated for IBT.

This is useful when running objtool on object files which already
have .return_sites or .call_sites sections, for example to re-run
objtool after it has reported an error or a warning.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 43c88a5fd58a..fecdf6f42358 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4645,6 +4645,8 @@ static int validate_ibt(struct objtool_file *file)
 		    !strcmp(sec->name, ".llvm.call-graph-profile")	||
 		    !strcmp(sec->name, ".llvm_bb_addr_map")		||
 		    !strcmp(sec->name, "__tracepoints")			||
+		    !strcmp(sec->name, ".return_sites")			||
+		    !strcmp(sec->name, ".call_sites")			||
 		    strstr(sec->name, "__patchable_function_entries"))
 			continue;
 
-- 
2.43.5

