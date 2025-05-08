Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDBA22AE65
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710019; cv=none; b=j5eKtliNENncBdfUKJuL0H8R0i5hjmaomcoU+aCmgtRBT9OQP2OxD0japJ4TDZG3PEp8QBTBJpVQtB/jrcZ9viRkPQGc1D0aYf68JywGdWf3Ef16vxvQDZj0b24d/p8BAjyBonXA2A2WtU3UrjBIxZ/lTQ4MgvQbkdUUw5I/7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710019; c=relaxed/simple;
	bh=XujGJkZhCSkwHMGSuBJNd55TPO2Z4BJb7HiFfSAi9Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IKAF+5FLff2cbZzejbKYUvvq+4bom/EC0ZckcCfxtNUj5g3HMnHcMUkUzI9L0t5vaCBdJQhjddsQwA65N/0fATrizbxKiqmyqSWjWEYbBM3DoSNwiEptCeDTtYiNLG5kuUvww/GC8W+V55FEs1RGr4K+Aj6MQHraN3KFJf/p/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfj5ktEk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfj5ktEk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0nUu031131
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TRUWHokJKC7m2iCGbohZyoJjf8FEo8fZCbp
	VE1hpGPY=; b=gfj5ktEkh1JuFJ8KseuLjyjciRAT211YtJPunx+55YzGIF670g4
	CqK0nwyr31guhCWtQDzY9ZcNdgymzM51SgjmQvJ5lkz8eoZb7TG9U/bAk03FHNkP
	jthjNq86zGaJKDBehWcCAVe4zPD0gMW0mxOW7zdE8LA0dHOLuuRp8gBdyWLKdg/K
	VHCOrXU/wEGB7VkAfdpQ9tzVjhP2+zqTuAyiuzxNb3hNtzaIQS5BF03LD/bphOKc
	dDITz5aXJ3b1/MpetI/XRB3DnTiA5E7GzNmDsZnRvo6Jc3UDBVAkhw6LFGOooV6I
	naFEbGqWipfgS3vE+zlJ6k+6IFn6Rp8FQvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpghd45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:13:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so141530385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710015; x=1747314815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRUWHokJKC7m2iCGbohZyoJjf8FEo8fZCbpVE1hpGPY=;
        b=UWfYxu97efZ/DjGA+XCM57UvDLLlE7sXxp9VBNxLD+ulwYGloTsCGYVFQyTBK2a3QF
         P2TyC84hyypC9YlWh0L45GBEt3oTzh+ysLwSrqIew/naTSyue1ePQJQT38FqaFylI8qC
         GRVSnUkDv2pSsriEjXkaxkXcpUgMdA/UlqFJ9fJTRvjO3YKPcBIhe30eTZTVbnZLQmSz
         IA06tElKoX/s6lS/AF7DLaxmcfa/yAecbu88uljE8L33pNH/gAyZY/Gdtp4yYSYgT3dB
         wp3UQfSB3JD7WJPBBHGO25cfW8zwAD23f1XQozc/185DtEt+NK7QFFhGVwmjrWrvAaWO
         iMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX69wkN1ANc2hxzQOtcCEx8Q7JClWWsCaIUsU/Sp7+h1/95ClVVhp6vH3/bZFby1pZMjQ5ipQIbNq0kwkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7N2smFCjYi1M5SoReHAYqGps6EqLz3wVxiJ3erGxK54GwAwZl
	sUYx2O2oyMONVyn1Rx+XZaiGtqvfFo50fnvqE8tkIbG1hCuAvHAysTrQzbu8nHEYiqVea5r0lpR
	8v4o4sHutQYHYznubkJEuq1qSgp3FpDap5wM8K1rMak8Y+n8UV5yiFjLF2975E23TvY25u7Y=
X-Gm-Gg: ASbGnct2SvbbWFaK3L2xliBLb5zfVFGa9Fg9Rf69OhPVDBBcQg+xCMBbYzmr8sB773b
	wPqVOjpSgIEwHj7cKG7BpNmazS5DgGvkkghY1bgpYnX1pe13u8UU18/5ay6eoyCTopdnut9zOZr
	ZDDpCtQRvwf3z9nHX6zE9AU8wmyFaAzb9uQ+KWtQv1xqtPW5VU+FWCAbjzmBhcYR36VnQJo84Z2
	T0+Xos16L1SAADeUgENwpM/UV/Ysg5nP4p5tgwgBxk1WnfCdxjXaY1G8yngaZmhBVaHdpO8BnVI
	X8PgIKOBIGhs4tpTRNAJdSNsgi9srWaFP4k9WUs=
X-Received: by 2002:a05:620a:3951:b0:7c7:9813:4ad9 with SMTP id af79cd13be357-7caf741b558mr1093107785a.58.1746710015014;
        Thu, 08 May 2025 06:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDrhVc+yGPmNSfozBhPFrM2mPRVmMRXF9BT/DnRW3LWoaMYbKtuFctdQKyEiyRscqYA3Detw==
X-Received: by 2002:a17:90b:1e08:b0:308:65d4:9dda with SMTP id 98e67ed59e1d1-30aac1b49b9mr12384398a91.16.1746710003891;
        Thu, 08 May 2025 06:13:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2e499sm2135477a91.16.2025.05.08.06.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:13:23 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 1/3] soc: qcom: socinfo: Add support for new fields in revision 20
Date: Thu,  8 May 2025 18:42:56 +0530
Message-Id: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cae00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zoRWVKxRGUSOgPgIeVcA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX6hm89qRKrtBJ
 pjnJzZFaG8aiIw6Maj3mmzd1edhdOVXjOKYX9aEppKjVrQW3cy2uYd35ZM0EwVaC0ohSMyKErIn
 UmaasNQzW1C/Gr9Iv20eMHgCYTnuk0eQI8HQlV1EoZyCsuUPf1RUShF7t3kHWgciyPkWyfxXjgs
 B4YAYcL2uFSfi2EV8/C7s7de7eVTe4aGSY2FeZeRvJkoXu7IQfL5urfe/xYbpZAua+J0uRQB4Va
 qehFKDEfzKUS6HgTAj7QZOV+uBtXyCY6gWwd1XbsRedffnUpKARKyWqaq8ANPIoDJ2VAGGY+O/S
 UNyHkexIdfby4VRvGGdGDYLjbHsTnVNomAndhcFSiBu6+fIA8mGilLp/2i1XjgLrG6oYS6LszyN
 5aVmr0YIxbZYY58mr30epgXsXEB6xv7ab+d46H8If3KBk06Wn8QauyAbg+KqKi5//OJpd0UG
X-Proofpoint-GUID: Wq30DimXJUiwUkSQcNZeI4_W8Q-Ar1An
X-Proofpoint-ORIG-GUID: Wq30DimXJUiwUkSQcNZeI4_W8Q-Ar1An
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080111

Add support for socinfo version 20. Version 20 adds a new field
package id and its zeroth bit contain information that can be
can be used to tune temperature thresholds on devices which might
be able to withstand higher temperatures. Zeroth bit value 1 means
that its heat dissipation is better and more relaxed thermal
scheme can be put in place and 0 means a more aggressive scheme
may be needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - Added Reviewed-by tag.

Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com/
 - Added debugfs entry and described more about the field in commit
   text.


 drivers/soc/qcom/socinfo.c       | 6 ++++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18d7f1be9093..9a92c9c5713e 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -153,6 +153,7 @@ struct socinfo_params {
 	u32 num_func_clusters;
 	u32 boot_cluster;
 	u32 boot_core;
+	u32 raw_package_type;
 };
 
 struct smem_image_version {
@@ -607,6 +608,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 20):
+		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
+		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.raw_package_type);
+		fallthrough;
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

