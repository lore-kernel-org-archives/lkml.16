Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF9822A1C5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710014; cv=none; b=mkaALBNCGi7WYi1tr+hTDfU64lL+eT8uXCDiR0nIkD5jTOcCqLKhE8kuwmuSBCFg6vbzAOrNnd9bsueJ8wX/3JcGmLAldQqCR0x/5r/0qYgCit2ZW2eiMuXXti6kW5yWoppVoNBqySSyHlrJ0vMBFHsFdh7pr7bNOQn9P+e+uKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710014; c=relaxed/simple;
	bh=L0Moi4f1O1O/7Z3W++9fu2ewfyT3ssNEmDKRTtyM2Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j4Ceu7PWXPStW6IRg+GYBN9dsSnE6yL7tgngXXPH5YnDnkLA9xrCiKGdcnwkk767zRMC0qDq6O9r48Xjy5S0NQk+PWlrIVoex6V8oKXmvqfS96u+NTvkfZZp4b2YJRSqfyVKTGGtOHngshVpdLoEII3OFLeNtudwnqWqqdu1yRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ok1YrwKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ok1YrwKX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484XBDx016419
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5gCvBHzV4SX
	gzzgzkWVLKwTim9/9MmKEiaEQq6fbHgs=; b=Ok1YrwKXz/fBAaix62DoKSxQWm8
	TQbddWnZ7Mcy0RWA2noj6kzoXrZ/Br6eOJBWs1OXiyzhCO19pxVGC2WhcjQTekES
	GBL6Y2PlWkE+dF+535tAWG2Qyy3EOLrf35hqNJDHAGOLXTZeoW7oFvAq+Zdw/Orm
	5kuzF5w0OVN9hwzkZUW1ENsvD5A/2i4+RXg1vtjRhRtbuUJCwqphSAZSl1I23wiF
	D0K0eZu6awfADLCtdemdgEfbVEBCbT00nIxEHacckvQbO/AB48HEBH0Kaw4YWx9m
	TcAQUdnYm+7kmU/cOmDSf99jii86lcAHPqIyBxUxFp8tkryEr1dEVIkmgdQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sd2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:13:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30a8fc0ac84so1012436a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710010; x=1747314810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gCvBHzV4SXgzzgzkWVLKwTim9/9MmKEiaEQq6fbHgs=;
        b=HBwGxVPng/f6lOSU21+f+4ZvIygsxO0cx2VubK4Cdu/L4ECNirnUp7uSPzEag8Q+5g
         pGukPxIorWqs/HkbcfH7LlEUNGpem134REJ6K6r2QN44cJ4KRyztcUOM8XVKAvm8wxZV
         ibUGrOIE3uXVVRBOorTEWfxzBhRx5lNLRTXtfXwsc5I4Ucoy4t8nB4FgmH3COIDmabmR
         p8Qvg93UWarpROvp+3Eu8HEDChMs+feXXbfS4hG9szYeubxQLA2NRMKJvXJbVvzGPAIR
         BpQnvoUY1EQUoL+40P5+6pJkSJEH3RPAhVjkarpsEhO6BWmiLhYG5MI28mQV6zG5Uea4
         2ZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRkrLOfcp0tWMtMCWhwlK0jIUlh/Kgn4eTID3/z+EJFJoeHZIdoca62DNKgobOR0BQxifInOvcLV3zLuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpRbD0wgbw4czDGg9JrKoAEFotleIs/o0e0c/iDmEE1XGFnYcM
	daG41OQtKAG3owLtJqAodag/YWFc8/rGGXPavlcR6PuD3pshyU+a+/bdxCXaSxEpm9UzJ0l2OGA
	NrnJbaHqETnql/oL9pYJ4LBqWi3bHYTWp1r/OU/nmYbgxFRg7EWgxkYBkYFSkV5OUxPjqTnM=
X-Gm-Gg: ASbGncviKBtlhJ6i099ViHpmYK62Ho42sHyc/Z+8dngdu3D+X7wV3NRukqzgQBilIFI
	s19zRoecVvZ+vSzk7CyHxiMO0cFxBsdT+EioufJshMA6TLLntnHWhamFeBBxCjXLlVAoEwZgPE/
	OsV65dSbwflAg2+FRvamDg9pwkTWRXAFXFkt5Qa0REHIgvaLAvXYRrzrkbRbcR8/TOz4zBOpF+Z
	XPcdV3hTGk653VYJmd9YwnV2F7YXqnteUA0r7uHCpg8zxTIfnUUIbM83s9bS1QOw5ptENSGyqh9
	9s035AlPmmd7ds+kbwJNtPgcn6Rrh+HgPBrFvGo=
X-Received: by 2002:a17:90b:4a05:b0:30a:4ce4:5287 with SMTP id 98e67ed59e1d1-30aac093fd4mr13759718a91.0.1746710010077;
        Thu, 08 May 2025 06:13:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeJn4r2vJnVdLAy9QQ6STCGE+MtqmPNGyDNrVcPHKh1skv55MS2gSqEK8DVD8+uVCY1eedVQ==
X-Received: by 2002:a17:90b:4a05:b0:30a:4ce4:5287 with SMTP id 98e67ed59e1d1-30aac093fd4mr13759681a91.0.1746710009717;
        Thu, 08 May 2025 06:13:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4d2e499sm2135477a91.16.2025.05.08.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:13:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 3/3] soc: qcom: socinfo: Add support for new fields in revision 22
Date: Thu,  8 May 2025 18:42:58 +0530
Message-Id: <20250508131258.1605086-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UmiOH8a_rp17Y0honqmrM-ii7Ggd1QSq
X-Proofpoint-ORIG-GUID: UmiOH8a_rp17Y0honqmrM-ii7Ggd1QSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX6kpiVmAACpT1
 KZp/+C0L5SQMhkWbALoWBVRYT2qgKBnUrI4Vsud6Lk5+wph0NgkI/iaowAFQ4P2dVY9krGEpY+m
 ArjS4Zss/vlmJR+FcpNlpc39vFln16ZvPW6APeBWsvxuapOkADag9ZYxSXcpDO+8o/yjocYhhiY
 0e8ZQuFM+KPy+DP80JzjsP4wPqQCF7Pe94Uwe3yfu9j2it6lea7rnFlH0s6trNUATWpGpEITp0F
 L3IYM1Xy6XyaCQrHeSsZkt3gvBaZDB704U81/5iIt+DjwCq61qYzTer3/7t/s9VjSdgzn8Ww30L
 CVNOlj8zU/0XcAJmed8HyF2KF70S4OBFHSl+QLCT4F0HEUyHo/78Aq4l6MmSKjlRt+48GRdIEMx
 pGs5U6NpZAQX3akh0HGvxs3PEv5atfaF5Ixi+2vNgOtk2Y77j/rorJBtfKpf27fmp7K+O7Kv
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cadfb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=V04GdxmOTIv6GTtReyUA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080111

Add the ncluster_cores_array_offset field with socinfo structure
revision 22 which specifies no of cores present in each cluster.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v3:
 - Removed debugfs entry as per review comment by [Dmitry B]

Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com/
 - Added debugfs entry.

 drivers/soc/qcom/socinfo.c       | 1 +
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 55acae79ec3a..7ae4c602e3cd 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 22):
 	case SOCINFO_VERSION(0, 21):
 	case SOCINFO_VERSION(0, 20):
 		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index 3666870b7988..0c12090311aa 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -86,6 +86,8 @@ struct socinfo {
 	__le32 raw_package_type;
 	/* Version 21 */
 	__le32 nsubpart_feat_array_offset;
+	/* Version 22 */
+	__le32 ncluster_cores_array_offset;
 };
 
 /* Internal feature codes */
-- 
2.34.1

