Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490727CB04
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628646; cv=none; b=E/TBPZ0Ev1VukkJBFGYYlP8hu56l6gfP2xZr9+fXxMTBxcFOedpTIHY0rGyclbxPRLVTLbHdc2q7u7BX6cdkCyzURCy6JScPfKeVg2RICc/b+TfbhkvGRSFq5DKAEnMB0okKOCLHUHJrKmGIwI8vgwp1TqUW59MI0gaP/mWG0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628646; c=relaxed/simple;
	bh=3Am2Cd1VOOLz9RfaU+/P+fOLxMsEKbxd6wVjp7Wl+JU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TJ7FDVHN+cRppbgMfm4baV8pmSx9E1LmSxidbnpcaTNXHD+k9IGevCSI/aLWWpwyPnNeX3EfYHO9Lu9TfTyI4Pm1sD4WCWumw6D7qdHXu2OWY+y0sHHM35XQLaWQdaT8Of3HKLfSr+c6qo4AmoHergUd66gS4faUvN33+SolZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsZVIiTY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsZVIiTY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648X5Oj025373
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 11:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TRT/1n9Uj6hl0JSHIwiesVxFk9Y13Rj5QHc
	z9Wen35g=; b=EsZVIiTYwyBVrUqRp1t19DxCNCfddOOP9hFKAdzwyoRdU5ocQrG
	mm7X+Iv+EP6d5vxS/YKFNAcs/wwsd7V5w+7Oe2Gi1VNAR2GhQN7THDDVAaFKnKM9
	DVewZUf388rO47zchyQCs85CuIUhJ04cmPSca8NLzEvqrCMiyOffyhueHTGRfbEN
	LmUAzDhtT93jNBk9M6O4c27OAjPakryVED+PB3XCMZe+c8LMGwvH+ZTEMzB8Z3zD
	/DLoFYqV+S/BEMPAK5/xP+s9wQk+gCTsIdpFTkHjGQZIIw8aQtgObo84iGw/zzhV
	ASQTGLSZ+oPX2G9CZtzXPaOghYGnRP8sQ3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650u0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:30:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235089528a0so16292955ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751628642; x=1752233442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRT/1n9Uj6hl0JSHIwiesVxFk9Y13Rj5QHcz9Wen35g=;
        b=Sm25cuVb8Z5wXyIAHUxor/iXPKc/T2t7VQ3zzpW617Ek4IITwWAY4UiO5+5P8IBTfR
         lxgdfSNmGCG3Zmdq9mT+o08EMfX7oR7cDJh3AKwcOLzGZXBBvFC/9PL2U+b2g5zXYf0E
         L/fPnLI/P316r9g6TJFGAG0roVWolDP+Zl1Dw7AGAycEPnt1Js1FjPt9U9t7vwiT0UE6
         W3HsqtavRo+j5bixk71Q//m0VqmMcUD5QR2diN72uiIDMgHR+FRw4mpcmyMBJ6nbHgPL
         uVKYqjx/ggqgZMHbtf4LA7odgmPHkTD+FNFKuzWL0G/zgj+rmenvXxH11+RUU4d0U3G8
         k00Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXwZrqLvWU3SAt7+WlNVXB3OVoU/zI5is6HAWn/EP5A9qi+rBStC+bB/z1svOQ7IcBKUi8K3Jb5Ktd9wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfyLMTYathH49tJ0eIbrKuxQLXIIuFjJu/ET/VG/c4ThfNezfW
	rsDW5ccd9md3CfvrxhlQC+MIN5upxlxLglzmnGGtmaAX3cJ4bKfH5uCz1z1zEfQo6INWeheLiJZ
	T/z9n7AzfQf89X1FU4N5QWSnM0dOyEGAbJ4wLdiWishLNKJ6raLjbNRsIT5PCA4Rhfw==
X-Gm-Gg: ASbGncuxMtS/NKhDaCZpTCx+be3wHJpESSTgXZjgKfllDan1TrOtCaOCN5BWS+xDU0g
	Bou1ooPcmsKmOqlT54hz4ro2slYmrirQEXNp2+A0UJi0r0lb4/p3kTDhttRdenM66emJBZTZxsJ
	X11RXAsl4iR5QxclGl8ka/mMdRqMHx8Rfcwo4qP5CZCTHP/hff/qCehkQNggzinPhH86TyZWF+v
	xTjdkU8P5Wjvc3DLnIMzTyTCvQ5OKrDYrUAvZ7MNyGilS/OLi68mo4f16EoQgnV20PhEDvV0cPX
	bLUoJf8lQGwO9Zyif/Iooh7RBstUIGhn5C7t1tyltJQ7wVmiCQFL
X-Received: by 2002:a17:903:298d:b0:235:278c:7d06 with SMTP id d9443c01a7336-23c858ac2camr35631045ad.8.1751628642302;
        Fri, 04 Jul 2025 04:30:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgveXe0/YeKWEfOQKlimaMpMFKvBsskf0SziUSbDx8nOrhY41iGmb2VeU9JAOFPCpbCoAhQQ==
X-Received: by 2002:a17:903:298d:b0:235:278c:7d06 with SMTP id d9443c01a7336-23c858ac2camr35630505ad.8.1751628641873;
        Fri, 04 Jul 2025 04:30:41 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845b4f8bsm18221515ad.229.2025.07.04.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 04:30:41 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rakesh.kota@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
Subject: [PATCH] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
Date: Fri,  4 Jul 2025 17:00:36 +0530
Message-Id: <20250704113036.1627695-1-rakesh.kota@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867bb63 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=X0g3_YmebwwKsQmXG4UA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4OCBTYWx0ZWRfX48VfUU5XxU4Z
 dHuJ1JW+Mkq6TSmsrMsqlO8xIuCbI9VUgFPT3NsOYAImW2sijxq3EPZ6EhI6P8uUAI69BEAGt0v
 XI0eORcqhBStzrKofBzhamL64Lx8NuXynpFH93BSEJgTmm5Jb+P1h52U5a5nRp0tdtsnGb0GQwV
 E9ZlDc18dG5e5gDwGEgty//ekI+jxastKXxaF7Gk1dLp+NyFJbIyYhg4fQ2J/DKgY3LumFyq3dB
 nVCLn1ETh3w53rOY6zTz8W5lrQB0MQbseGgjVWzNURbqQgdLVJccQs4CNWFxCDfjpJBqu4ABK3J
 kiC0PFC+Ci2XcH+ur9jy7FCRygJsArwU8WHQ1c4laZvsRSO0q0S8tmwxmmgo3Foh74i/kbeIzr8
 V4QJJ2B/yrAmpy73fKFM+q51TiF9V1I/oIiSi8nVOxAjR5p0NnP5xb84RVO6ENim9jQh1WFI
X-Proofpoint-GUID: buqkRbuFPr4Vt86vgeFCf-GcFzTqTSb_
X-Proofpoint-ORIG-GUID: buqkRbuFPr4Vt86vgeFCf-GcFzTqTSb_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 mlxlogscore=712
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040088

Add the PMM8650AU and PMM8650AU_PSAIL PMIC SUBTYPE IDs and
These PMICs are used by the qcs8300 and qcs9100 platforms.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c        | 2 ++
 include/soc/qcom/qcom-spmi-pmic.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8c4147737c35..e975b30d3ee0 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -126,6 +126,8 @@ static const char *const pmic_models[] = {
 	[72] = "PMR735D",
 	[73] = "PM8550",
 	[74] = "PMK8550",
+	[78] = "PMM8650AU",
+	[79] = "PMM8650AU_PSAIL",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
 };
diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index df3d3a0af98a..2cf9e2d8cd55 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -50,6 +50,8 @@
 #define PMR735B_SUBTYPE		0x34
 #define PM6350_SUBTYPE		0x36
 #define PM4125_SUBTYPE		0x37
+#define PMM8650AU_SUBTYPE       0x4e
+#define PMM8650AU_PSAIL_SUBTYPE 0x4f
 
 #define PMI8998_FAB_ID_SMIC	0x11
 #define PMI8998_FAB_ID_GF	0x30
-- 
2.34.1

