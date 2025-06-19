Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BD28B4F4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345040; cv=none; b=HkkY3gYBbqVbsfzaZe+9i2/U8NHAduJlVr0ooGs8vGxeYkse60M86Q2pV4McGKyxyPjs1UVC6eYfWu23Sj3s/D7vYVhqf+PE0P8ovSUx8PzQrYs5ZPcpr1JD3QTzqg7rk1eQXcrr7wSS1U+Xr9n4yST6YOuzMe8i5V4igQI8l2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345040; c=relaxed/simple;
	bh=gCMfQZaDgZAa6+fgwvc+M0DkImFzVss5qhfWe7EaR1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEmlr6hABxyxPr1ECTOTsv7i26S7wy3ea/0P9nLepBnDUKTeynj/x1E+t5WayVwTBhyzVQtnwXUqw8xPrrGgphHefCwXyLb3c3jXkMATpRqKNKEf2NobUFSx7unH1aREC7IJJrdOuxU3eL+dJr76nGG39cVFLXKRDz3K6BYlvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=od4cTT3g; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="od4cTT3g"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMaCn002973;
	Thu, 19 Jun 2025 14:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=PF7pm
	YfcDtTPC/InUY7QsSb4h76e3rzVk0Dnlk581Aw=; b=od4cTT3gM1ppJGNIKA03W
	mCHrl5SM25uRcNPq2apEjbOqXPik/qzrF7fSwQJ2vJReaddVKp9a6KLb0AwhNxfj
	dRS5VNffdak9pUhxiyOgyliHjpZ4c67/fxKQtfB3Q7s1RlPEFdGXvVBLOMN00mFW
	RlCatTR9XCoiNKGuIOeSi8oGt+0XxukKBcblxKfU/XHhayiJjhmiWw2RfpJF5M4j
	78dZStpgVfncS0xdjMZd2n5fO/Jn/LbQ62UoB/gDVFR8ppje6yyzgLDQel6pOGIP
	V2hysXLic7E10WKcT516kv3/lz2Hd29kaBkIe9aGhEa5QiBSuZTQfIREG8Av3ngn
	w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yda16m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDLCjN023045;
	Thu, 19 Jun 2025 14:57:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:08 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JL008257;
	Thu, 19 Jun 2025 14:57:07 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-7;
	Thu, 19 Jun 2025 14:57:07 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 06/17] objtool: Improve offstr() output
Date: Thu, 19 Jun 2025 16:56:48 +0200
Message-ID: <20250619145659.1377970-7-alexandre.chartre@oracle.com>
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
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=798 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190124
X-Proofpoint-GUID: i_n-bWpVT6c3F4z1SI_Jhc0ElBCZZf10
X-Proofpoint-ORIG-GUID: i_n-bWpVT6c3F4z1SI_Jhc0ElBCZZf10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX3v1pe4mDxLHz jtDkAmL03HUWCyYOI2nEcnd/Eu1LgoXTkoDpuQI/ZUQ2HWVMy0WR2SOeFfK2O60HHzvEIotyzoA 3UQcYEk9j7Qp6Yzey7WSiKDXlPyUhRvGuXSqZW0bnKXQIKVBChEfyQ1pB6Rap5oOorHAyGGEHhq
 I66rK5FQCKjdfBvu3m1uYDjmeudbcfkOCYYRJ7TANdjRdLS2IP6CF52etbAyAF7h5A0FAtcWJli 5kvEXGDUTSy7KjKqM+SxFJ5bsLie83qm/EjlnxCFpCgt9R8NX6RmtmTMMmoOelmPrUC8ldyB+XQ mM1OQB1OBWuLTf3W1LVVt1ejIpWxKKJ3HTFffC0r4wXJdhiDiAd31U8+FcM6I8b0rSBBLoIUNTL
 lcuc890jG0LMMgzN7hEQdx8p+JbjsKTzLQ/Ba+bpUd1wO1m93v15OcT11ZtHdka8zSQuPlla
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68542545 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=bbKr6aJM5K5ssBc2alEA:9 cc=ntf awl=host:13207

offset() formats a section offset into a "<symbol>+<offset>" string.
Improve the output to just "<symbol>" when the offset is zero.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/objtool/include/objtool/warn.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/include/objtool/warn.h b/tools/objtool/include/objtool/warn.h
index 125093d568be..d89e6ae69143 100644
--- a/tools/objtool/include/objtool/warn.h
+++ b/tools/objtool/include/objtool/warn.h
@@ -43,12 +43,12 @@ static inline char *offstr(struct section *sec, unsigned long offset)
 
 	if (sym) {
 		str = malloc(strlen(sym->name) + strlen(sec->name) + 40);
-		len = sprintf(str, "%s+0x%lx", sym->name, offset - sym->offset);
+		len = sprint_name(str, sym->name, offset - sym->offset);
 		if (opts.sec_address)
 			sprintf(str+len, " (%s+0x%lx)", sec->name, offset);
 	} else {
 		str = malloc(strlen(sec->name) + 20);
-		sprintf(str, "%s+0x%lx", sec->name, offset);
+		sprint_name(str, sec->name, offset);
 	}
 
 	return str;
-- 
2.43.5

