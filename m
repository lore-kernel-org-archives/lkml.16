Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDECB298CB4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365066; cv=none; b=GLaLPTSGvLgD2eBIVUgLpHY+9GfOj9DiN7c5eNHBCfXHXyKutaKkv8NASbE2B0qTZTJNHt0elXClA9Oa/69w5IXEHxYZiUX+mFVcTWWERD9rF5aXix59ZNmV2jFCp+Cp85rU3CTuMsOHAKoFBPz26YLiMlKlA0WF9Bx2XvXttEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365066; c=relaxed/simple;
	bh=kn2J4tKmKY6IP6EV+kBCSzJtadFwe9qSWz6nx/B12wc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F6Hf3+IHwBb44XovVT9/6yUmFzsIMjhhJcC2CbVNP94F1L1uT6RXt+SBAf1j37qgn94Ui3bR1KoFHBIy83424qyRY97ZNLmQp1s5Fp+8+3yW6GsyoAMjc/d8Au2nncFHI7UPTkPq9LMeVK8ngixs6iym7I5Bx+HwFUsjiQp6cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nB5q1odL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nB5q1odL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5bmta000880
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PaQEi6Hrc/R
	qt3l7bn0w9tX63GmJuGdEVb+/2HsLYbA=; b=nB5q1odL+ho0TIEI5Z7jaPAPqXw
	Ytt7OTFMooYt/dwdgJmybxEnqEk1uOjlNJNqe1XzyOPLXkPwY0TCNgh9DiPtyRyc
	uJi5X0lUTsXpdritfPN+N+jcgy8uvGPNnzn3qBjHC8zZJXvRuTI2CjtbVcpzss4a
	xgOvxl7AmWz/r+LDCmMG6Hd7LPyjASyO65YL+YcJnlDqRVuPtw6rEUiBj9XhyYxc
	mo7XfyV3RJlZbNMnaVJWsGtnzpDvvvz92lZdkY8FrFCo7veaDi/qwl+8nkH0n0OQ
	cCE+epb0xuSHywYfmHvqYW1+/75nJxhWFaqM09UAeiAQQ10Y2PEtX+H8TWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd31xkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:51:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2254e0b4b85so15320365ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365063; x=1744969863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PaQEi6Hrc/Rqt3l7bn0w9tX63GmJuGdEVb+/2HsLYbA=;
        b=gB5bTKXj1VHCZAGfLPj/YwhaLWvi2u13GcBXXIRmujvLiCgYJsOU26Q25QSy77gQ9m
         IIUscxbUbGyVunnZOXW/Ch0r8IcHeGWqz/Z9UKgUUwkyB0aKcS314MxJ5GivvddDCzIV
         YMJbjBce9H0qvm61wCE804jWsZiFWGkIfw0G7XIPjwWgtOic5Rgh8RioKO9WZOOY6CZu
         fExPgUCRoJTie3+FfJ9sVM2QEKyVC8FDqZrQmTiIB7OR2or4uOlPmK+BNdngceH1VwOe
         C/loRKKbxH/3MsBbS/mto9Cuy0l2W9Ih9Z/0O9sXv5IH0kUKl3GpO2owwry3loFO4ljC
         mxYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ex7iyZNpATshvDQUd/G17DgKfvhnLiEDm/M7TakjbeZOGRH7sgEkB5KHMLf5pcf991n/6/piDdgN74E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5ktqdkGNR8sn1lC/bTs45ECM9ZvgTCh3hLfssb/ACP8o/KfRI
	7Mh/MeCxzfB5O5xe55dfOOws8QwOu9vpPFkH7Hdi2IrCa4JIZiAZZBZQOGUuWDqAM9Xjga9ax+U
	sz2LArMD9Y2aGKprbso5QCSBS1V6uIygy6TntwtYpmg4h/YvWVUdr+KMN8wq+lq8=
X-Gm-Gg: ASbGncvOO6dnN1jx3pye52mrBAEYZMzj3rLfDOKFgXIlvyacCbbgjDh7HVDpJ53lbDe
	qlUEz/FFl7yMTWe2ZKy57dQfHzgmdXP/o2Zqe2zT/l6YQI0V8VKQe4225oWaRdAuXIuiI3OmPCt
	THqduGuE8WPZO7UzIBjG7/ychQaVAvBuSTTDAGTQ3hv5w3j7rYhlemaQOkL2rTKZZ++YiqzQDuL
	QeKHW60eniZqgY2A3wU3IaWbW2cFl0vnQu+hG0hm9tcGmjzP8pR04vhiIDLA0VEBUTbe8RIQozu
	s3T3EcqwBay+94LsvszLaOoS53f+ZTVTk8C01SA=
X-Received: by 2002:a17:902:fc45:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-22bea0c262fmr40601945ad.25.1744365063010;
        Fri, 11 Apr 2025 02:51:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNfxR5YEUyC5pY57vV0dpISwcfK15MuaiwfRAi4sz+t/tfe8cA+U0O5qBySiiNvi6OFfEMlg==
X-Received: by 2002:a17:902:fc45:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-22bea0c262fmr40601675ad.25.1744365062658;
        Fri, 11 Apr 2025 02:51:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b87b9fsm45010875ad.54.2025.04.11.02.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:51:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] soc: qcom: socinfo: Add support for new fields in revision 21
Date: Fri, 11 Apr 2025 15:20:24 +0530
Message-Id: <20250411095025.4067964-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
References: <20250411095025.4067964-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HOEV3T2JqnCtI-NU7p4-JVUkqj_d7HJ5
X-Proofpoint-GUID: HOEV3T2JqnCtI-NU7p4-JVUkqj_d7HJ5
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f8e607 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110061

Add the subpartfeature offset field to the socinfo structure
which came for version 21 of socinfo structure.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e56fb778e1cf..0a6eb8060f5b 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -607,6 +607,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 21):
 	case SOCINFO_VERSION(0, 20):
 	case SOCINFO_VERSION(0, 19):
 		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index c4dae173cc30..3666870b7988 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -84,6 +84,8 @@ struct socinfo {
 	__le32 boot_core;
 	/* Version 20 */
 	__le32 raw_package_type;
+	/* Version 21 */
+	__le32 nsubpart_feat_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1

