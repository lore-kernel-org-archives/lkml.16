Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A87B1F03FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365062; cv=none; b=KAUdcuUD/28AAHA4Ld33Uf0M1Vgv7pzs5ORTUKHL3Z2wAD6gpxj4hLhlUmxk6wq0DlnVxHdtxujiL2va3fZxdbJzrTzuOYU4WsFSTc2E++uDygHfEDOyKLBVKdyRgiJ/kF0fDtdnsVV1fy7Tdz5lONRdTapHRQnNxZRpAA4IV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365062; c=relaxed/simple;
	bh=OAmrXv4fKRP5dEicBxan4R+MR4jNBF0kOR7k+RwWr/I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IMoyEE8SMTQcMW9ITbnv3QURz/ME0C8qJkCW055+nD4SByamW7CWfsHbeVGTbYNwP6RpKcJ71bxbDfz8jWMRvOcrAm63G57RP3IZNiS4AbmsfQ4ZDkNDFGohgQl0fGFhxdvbwGBcq4RxFXiX7rYxUHjT6FJSRCIz1sfC5KYB2u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkXp4lQV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkXp4lQV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4tQRc018607
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xypb37583HRw96ug/EnY88BmozjS7Dp9msK
	YYRNCohs=; b=YkXp4lQVnEckwZKUrz7BzTdTNqAiGWYGdu540G8yVUOaaJtwnNG
	fqCfZ+DHm/rrh4P1AY0V/foKLrhXhewIxZ23HiMKiJcD88vGPdYZAMeZ4/3KB0KX
	5oz25LsQRfTrkPQH4eV7SqhHayweE0A522WgGaTV1vya4it0NHQ+HHEAe1Z78P71
	BwaVswH3nGVu12d7yNR8Fa9ej99EFcccbs5qmY1ErnyFooBRqhLjEEuJGqzHC9Ng
	QYBSYT9mNRevgd2Yxhbk152eWfEyvSWuDZWr9R4gEzFphFka2Xb8v3bs2StR4Dga
	kWV8ioLjKXhOjafMwNjrC/jQGOxEH1icHGw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgt4ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:50:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af8f28f85a7so1244300a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365058; x=1744969858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xypb37583HRw96ug/EnY88BmozjS7Dp9msKYYRNCohs=;
        b=GY2DTALGDizxEgVaBatoe7p3nFY+eSuBNfs7YqALeYalQcu7jLlrJ5Ik90+7IiWWlp
         pFYHOVAIjJE6bP16JrGWh36KZfyMsNnQ/eAHoxS0pW1cIvtQboFHeiNBfqPQwXDpB7aj
         muPtCK+ualcUgl26M6Xv2HwIDcM9T10jsJzyABASNVwk8CSw72lg7gEbcCVA+uYsLJUI
         wHXg3MKwc+yAEI4QWF9kw+iaXz46YXTnRVPX+DLIXdfUdccV3qtby8r8vB9GMsubGc2I
         5CWYbDG4PzCslXRaZA5/5QYW670rW0LKr61lRfald+BfDYkc/aplJVYfuQlZeiRtjCoQ
         BhGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw7u3BkJVGd5G/uEzKjGhwtfJ5qjy+xajRvuNUC5ofbbx+wzws0fkRSL5++z4uMER2SQlksKePdhEbXbk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0X0uVRzVhnoL7C0JBhf2iToKLJbJ3WbTAyk0KeNbEzGHsMrl
	BKdr7mK1qfionC7JkH5IyNnDHICaDSUkCEZWpWcGWvSQw5yR9ETVjKXyvQ8jDhiB+34Tfocod/y
	0Yg7/N4IxY0EySxn2XxM2JvbpqfPM51S8o7/kU4qsciKTLXps4YAOtsT6b4oPXfc=
X-Gm-Gg: ASbGnctlZ4LVwqIeQQkB23WXfLHRcAgiQYZIjdptXg76j3ySsXrSoIqEGsjw6/obnJx
	ht2S/4dgL5qSidyu22HQuOJ8/mFFQfhFxg1EFuk84v1SsorXWFcf9IXEz3GYtQYAKf6e2nbZ2He
	RCcuQjCwh/4ZMypfJhGkqs1ScwpJZ6cYhZ6scyR0iJFn7T7Pmc7ItSiB/jJ6OdHLdqam0XmlzVI
	uuCxAoYn5ilhfEh2WTjgcNTk3sE8F17kIwfy3kdIVyS9jvYrdActXi6jgO2FA/sIiHZvZGUaosZ
	OCIsFS8ktIG5I02ihfny/BxYR9PwerOsDxMIjuc=
X-Received: by 2002:a17:903:3c6d:b0:21f:768:cced with SMTP id d9443c01a7336-22bea495845mr28140085ad.8.1744365058289;
        Fri, 11 Apr 2025 02:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHhJwwebyAoVQn1/4i+u0YKkxKHiwCVGMq2ulrgX68bMl80txEhHqJIkYaBSrTqmcan3XRBQ==
X-Received: by 2002:a17:903:3c6d:b0:21f:768:cced with SMTP id d9443c01a7336-22bea495845mr28139795ad.8.1744365057840;
        Fri, 11 Apr 2025 02:50:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b87b9fsm45010875ad.54.2025.04.11.02.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:50:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Fri, 11 Apr 2025 15:20:23 +0530
Message-Id: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f8e603 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: F7OWzYsz8_4e9oqR09oioorP0PZJxvUS
X-Proofpoint-GUID: F7OWzYsz8_4e9oqR09oioorP0PZJxvUS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110061

Add support for socinfo version 20. Version 20 adds a new
package ID, which is used to tune temperature thresholds on
devices which might be able to withstand higher temperatures.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..e56fb778e1cf 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -607,6 +607,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 20):
 	case SOCINFO_VERSION(0, 19):
 		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
 		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 608950443eee..c4dae173cc30 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -82,6 +82,8 @@ struct socinfo {
 	__le32 num_func_clusters;
 	__le32 boot_cluster;
 	__le32 boot_core;
+	/* Version 20 */
+	__le32 raw_package_type;
 };
 
 /* Internal feature codes */
-- 
2.34.1

