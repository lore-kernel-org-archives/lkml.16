Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D727F4D9
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345039; cv=none; b=XtaaViszLOpowj+r+ADxU0NOD5Jvg4ZjkvfvpQedpbaNxEIzEdoQi/q++eg5MxpiWggMGEsEEK94JFQBx81Yel3Q55Sr/NeoOPhv9PaxVJgYPcvQGhlOzKNI7NDjfJxfLhkS4C6n5i8iw6rj3jBx/TDsipX62mnMH1gCL8pmPvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345039; c=relaxed/simple;
	bh=tCklpb8wK10CCyWhK13gf23iZM3lr+6DCajDx3CmoGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOHMYrQNOxZFpw5toGwGnfuTgv0bEEMQ/c9/5C0vro3SRsBPQTWRL/dGpfajk4mhYlBAzk1saBVcJziKBBv2xgH4O1+tcPxUpPUejXFM/CePwwIsJYI1yNh3HCgCUP1eK+jvvU5/yuu/4wqdd3Aft0TqQoenWMGpyd906TdKkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HvyOxP/w; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HvyOxP/w"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMkqP015134;
	Thu, 19 Jun 2025 14:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=eKR+7
	LgU9IBwQLc1KxkrJXBDCFr0hxFBW8MFnGM786I=; b=HvyOxP/w4gZW6kg6pEmVo
	02in2oKiFv71j4J60oxX7WcK+cSxKQvXu8qn7ajRMpBQr+V8+yZeTZ/2yx2Z8Ij2
	gCv+cEJ+cUfGsdEdL6Czm9G3032wzpQOe3Iy8EmEHBkHozub6O+GEuz9o7OQnz91
	tMk7mDr4sKZf+P/SUATgjgZin7iF+C89WdTXcTN72vk2PRbSZGTHkM5134Ta/mSW
	wZ3Jv0vnyJuCdnR7TDLxQqhSKkkUDfzlwCxtRCbsJdu6uaGifyiYmr5M1x5kSi/C
	kFQJoXFOEgxzNJPhZsvGem/cQFXL/Jdpj4Ez5Xr9eHUEAM5VCLLinW5BcrZ5fJJg
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4t4an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDR6hx022898;
	Thu, 19 Jun 2025 14:57:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhj8dvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:57:05 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55JEv0JH008257;
	Thu, 19 Jun 2025 14:57:05 GMT
Received: from laptop-dell-latitude7430.nl.oracle.com (dhcp-10-154-180-74.vpn.oracle.com [10.154.180.74])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhj8dta-5;
	Thu, 19 Jun 2025 14:57:05 +0000
From: Alexandre Chartre <alexandre.chartre@oracle.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org
Cc: alexandre.chartre@oracle.com
Subject: [RFC PATCH v2 04/17] tool build: Remove annoying newline in build output
Date: Thu, 19 Jun 2025 16:56:46 +0200
Message-ID: <20250619145659.1377970-5-alexandre.chartre@oracle.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMiBTYWx0ZWRfX1qcIVjsylJPH JesmUJBv1ab0qBEvUen1BWnXWuW4zjxo67dRVmdtGyVd8V4ap4n+JfMw8QH462QxWFi1euxFx1v 0+cZO9CVEppXeONGB1pzSIlJg3ag1+XZbY3vd0+rmIPJ1hrKqcWdYJ1tBv6LGA39OPCyt8gvww4
 18irADRpUshb045ZwMf+6a3j7Br1r59ah68Jv01ecqwtiBv73wY3AogGLeMRdYmGFKkvT5RUXNE KGPEPeLTZ5zD56qMzrxbdMx8plhdlplSNrXTP5jUlMOXgj5zjECNB5ZBCqXnODaUv8D8IB563pe 4F6t0JlkzNhgFCdi1IdyemAqb6zxaixJBsnP/XHsGej01UhMUlkI7CbJPYRZq8v4xob3fks1QUt
 mW8mFWJaKGSvaEzh2eaoNgflfPaPPw6yBsgsLUp3Zo/LQ4kvID017H18opn9ks2djeqcJ8BH
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=68542543 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=gaUgYgG710qbGCIvUrAA:9 cc=ntf awl=host:13207
X-Proofpoint-GUID: Q1CafMb6cu6fX5ngBIj-i6adetF8BQDi
X-Proofpoint-ORIG-GUID: Q1CafMb6cu6fX5ngBIj-i6adetF8BQDi

Remove the newline which is printed during feature discovery
when nothing else is printed.

Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
---
 tools/build/Makefile.feature | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 57bd995ce6af..3e45164df894 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -326,5 +326,7 @@ endef
 
 ifeq ($(FEATURE_DISPLAY_DEFERRED),)
   $(call feature_display_entries)
-  $(info )
+  ifeq ($(feature_display),1)
+    $(info )
+  endif
 endif
-- 
2.43.5

