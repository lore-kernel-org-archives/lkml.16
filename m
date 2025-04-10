Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81821FA26C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290671; cv=none; b=ZOwZwkrxdwwiWqob/74UfvbcUgdNz51022XFs/VTX8E+QEI+jfZ9RoXdXrd5LI2XVKjmqtIZzcqDvvd1VRgApKzqJGR0qlelAVvtPDel71iJDr3TtT5aN9uqGkTXxUIiHEZyX3V1FtLIvjraZLlOO/1K4hTTeYedHxCTA+oGCzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290671; c=relaxed/simple;
	bh=8d1Bj+rWJlSAOCF1I8U2KCccSYYFGk0ZQLNdZQUYHMM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VGEzJ0pTBJUqDp3+/AZpCE6defbeL7HX5eLiClDqcu9e43b3QQkj+wQ7MVEa/UdShn/8n//veEURaXCtEfwjbTI2+mzDxI3LFHNKC5y8ejSTR+Sx26fY+F4b8xjnwGHrMLY72ti3Z6iLk0JTFlaxhvVRJ5byluUoOI08lQTsojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YCfrqg14; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YCfrqg14"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75kdt019836;
	Thu, 10 Apr 2025 13:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GSTYIoDC3taO/H3PBzamyP
	+DgPg9Sx/YMyidJNSRrFM=; b=YCfrqg14HrLORCIdJ6qWJfTFqpM8YSwNsahblJ
	Dg3MGBtdnjDKOQ6Q2qpBRbEUxp4mArxRjST78Re7oHiAHv/U8wWjoE8umXfoqIN8
	reLu5YwOq3Ehh/e9/9WWEJqrbhuzHMc+lobVa9+i0FGEc+iRA6dOoCbvKljb/WYT
	RbqqXibPK3lTTqpxNPARUiUXWCC1MAG0rqBSuYS23IVlpPbAqx2IkQOXRjm/Xl0/
	Jn8sKPhJuXX+rgPMDfziFL1rkCjvx3aClLzSpvq4qnHQcLlRNJUDRvXgZVbWJAb1
	xqxp03pD6hRZ8i0WvIDNZLc7vs2chltYSzx9mOwebgZZo6dA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrq4vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 13:11:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53ADB4rC005862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 13:11:04 GMT
Received: from nsssdc-sh01-lnx.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 06:11:01 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>
CC: <linux-kernel@vger.kernel.org>, <andrew@lunn.ch>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>
Subject: [PATCH v2] bitfield: Add FIELD_MODIFY() helper
Date: Thu, 10 Apr 2025 21:10:48 +0800
Message-ID: <20250410131048.2054791-1-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V06s0Eir4Z4Gg-FThfAXA0W09DMDWXNp
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f7c369 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=bpWgvMM22m3vV3Jt9xMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V06s0Eir4Z4Gg-FThfAXA0W09DMDWXNp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100095

Add a helper for replacing the contents of bitfield in memory
with the specified value.

Even though a helper xxx_replace_bits() is available, it is not
well documented, and only reports errors at the run time, which
will not be helpful to catch possible overflow errors due to
incorrect parameter types used.

Add the helper FIELD_MODIFY() to the FIELD_XXX family of bitfield
macros. It is functionally similar as xxx_replace_bits(), and in
addition adds the compile time type checking.

FIELD_MODIFY(&reg, REG_FIELD_C, c) is the wrapper of the code below.
reg &= ~REG_FIELD_C;
reg |= FIELD_PREP(REG_FIELD_C, c);

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---

The new added macro FIELD_MODIFY() is expected to be used by the
following Ethernet PPE driver as link.
https://lore.kernel.org/linux-arm-msm/20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com/

Changes in v2:
- Update the documented example for FIELD_MODIFY().
- Improve the commit message to describe the need for the change.

 include/linux/bitfield.h | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 63928f173223..421c7701a18d 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -7,8 +7,9 @@
 #ifndef _LINUX_BITFIELD_H
 #define _LINUX_BITFIELD_H
 
-#include <linux/build_bug.h>
 #include <asm/byteorder.h>
+#include <linux/build_bug.h>
+#include <linux/typecheck.h>
 
 /*
  * Bitfield access macros
@@ -38,8 +39,7 @@
  *	  FIELD_PREP(REG_FIELD_D, 0x40);
  *
  * Modify:
- *  reg &= ~REG_FIELD_C;
- *  reg |= FIELD_PREP(REG_FIELD_C, c);
+ *  FIELD_MODIFY(REG_FIELD_C, &reg, c);
  */
 
 #define __bf_shf(x) (__builtin_ffsll(x) - 1)
@@ -156,6 +156,23 @@
 		(typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask));	\
 	})
 
+/**
+ * FIELD_MODIFY() - modify a bitfield element
+ * @_mask: shifted mask defining the field's length and position
+ * @_reg_p: pointer to the memory that should be updated
+ * @_val: value to store in the bitfield
+ *
+ * FIELD_MODIFY() modifies the set of bits in @_reg_p specified by @_mask,
+ * by replacing them with the bitfield value passed in as @_val.
+ */
+#define FIELD_MODIFY(_mask, _reg_p, _val)				\
+	({								\
+		typecheck_pointer(_reg_p);				\
+		__BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: "); \
+		*(_reg_p) &= ~(_mask);					\
+		*(_reg_p) |= ((_val) << __bf_shf(_mask)) & (_mask);	\
+	})
+
 extern void __compiletime_error("value doesn't fit into mask")
 __field_overflow(void);
 extern void __compiletime_error("bad bitfield mask")
-- 
2.34.1

