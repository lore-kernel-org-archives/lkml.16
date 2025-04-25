Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4E2512D5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589638; cv=none; b=RYaPehvQsJ59oYfMpcRrf71O03xbSurfQ3J9IIoCYF35qudPEfuxx08kG+x779LCz/hIyzBxG5i96Gg6GfBovBWGozCoHXm5U4HTduRlzgGuqYiym52D/lwViHFAV5RfWN66VEr153D60Omgns3oYW/goobBy9su/S6CsyTR7fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589638; c=relaxed/simple;
	bh=5MFwbZndW/3CCDlkJDKALnMkGV0Rc4IC08W7tOBbf4g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FxcU6DLri5QWSeWf22fLgK8zWjTpiDo9xtjZtT+A5YZ4kXM9vWR3g3aB2luVb75mQy+wknjaCdJdlHf8KllCvyR1N33FRbY9n60QtV20Z4Dlr0J71Yd+bZC5vVm46TbDBZf6pbNXO/VEYvEl1go5A1hYpHqxtT5RHK9v5E+m3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6YH9B08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6YH9B08"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T5xg022908
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lZ7Ppv9foYm
	9vXF3GOtDCITIngSjuhVT5D3uFuR78Nw=; b=d6YH9B08uGbJAZY5ErT+GFZDiCS
	Lst9F6QybF47xE8UjZPSQdjK4SygcOrleqRyaL/zt5AUMvpsI9qkyoxWa5/Ntuvw
	XBmAKrEhaBrr6duHrdkCTQP+CRmLvNrnpbyJb9UAhVIDI7MvywWOPthQVWLMUWDm
	RSPZquuTXz3B1cauEIuOLz+6K3ZJ4JjAKXE/HEKsK2n0Q3qaqhj1HZ/88de3dnYH
	OZKn7T2qpvffX4kzL23omCbyJXGFYs3X8IpvePlozI0HUdHxUcRIASx5vdqWxBKH
	B4bM4nFXSI4CrYmCIt+e1oopkcyZWpdP9oHMZBnJcVGXtdpPoytI29ueeZg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hb62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:00:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3087a704c6bso2342203a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589623; x=1746194423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ7Ppv9foYm9vXF3GOtDCITIngSjuhVT5D3uFuR78Nw=;
        b=B13Ayob8UHuTpsjtNvKgt+dwW/3dQox3LytmbktaUqFUwkoT6XH2t/5hPErZmlnXec
         eb59sDFcxk9gnzHYoR1uCsOvl7Hnv4oS2W6qz3svnPFrcqYmaHe9xkOnebcX5D4RZ5rQ
         HO9mtpV3qML3FXfEKC1BMsZHSDp+aV6MOfOf1IAzJO8WzzfiMJCD7e712tgOmY+iO5uE
         LEHH2DvhtWxvbKj7ajzMpDjSBXk+m4yF7g5ZWWvmPhc8KsdOfKeNng304NuJvpNYKQwy
         7ZTDV3PZwZIQpXcg5BwzPMokkEFDpWbJjhz8aNpnquVm8FlH6eyCDN2kwIqn36LBM82+
         +ajQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIQ7dUjg0lARBGLU2AP1GYW92cO8KE/Aefuy6z2dWu15oTJssCb8eo+7b+nnawujBgsxTO6aFB916wMDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGy/Ifz4QULjrTXUKvjzxyuhIWixDLG7wFBg0FRRkAMkPhU4D3
	yJeufw+7XeEzZOi6kODBIwa6cfAnaN4U5vFcpkVya0gnLVdPCzHhs7kTkFfOxtQbvOxEWDQrS3+
	iUcEh8zDVQtPI9SlacqhtqNkPLVhq3tVnivgS/RmDMJwfpbVuOsjQ9WCAprPUgI0=
X-Gm-Gg: ASbGnct/51HSCQ5xA9Ju/71qkOULazRuwdKMG7ZNJ2q6QbcaCHQWTESXJpQ+j+GwIAO
	KpKMmzSdvOD/PmatcgeTqo4zRz7R0q7TNu2I772viXkJOdPl9ueJl0CQ2TFmnMrxOkxlC5IOPGt
	cTdijfip+mC65qhZYno9iumxuxyC4n3Cwrm9zCf9+L7dSWzVOP8PrZKA0GoLdEmq9h8jLpZYcbY
	XzvGVTMAnspMA1bGGbq9cQF0XYulzUjUYZnSeZJguMZuVmfapBhz61lmQxAQTfxugej7aI7U7wT
	M2ZTpAndDWRecd5WCU9jtRhsdiUVPwFZe9rUBf8=
X-Received: by 2002:a17:90b:55c5:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-309f7da69abmr4185403a91.13.1745589622389;
        Fri, 25 Apr 2025 07:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJdjsH5eGSWRC5CHHXI8KUgu9tmYVHFcrW/ZP2Qz/WipHz/oCCqZtGhc5G5NEObNdIm+8QZg==
X-Received: by 2002:a17:90b:55c5:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-309f7da69abmr4185324a91.13.1745589621668;
        Fri, 25 Apr 2025 07:00:21 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03ca86sm3470432a91.3.2025.04.25.07.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:00:21 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/3] soc: qcom: socinfo: Add support for new fields in revision 22
Date: Fri, 25 Apr 2025 19:29:46 +0530
Message-Id: <20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7GbFCnCRtXhSrZf8AVeuT6xzVSFpbUC0
X-Proofpoint-ORIG-GUID: 7GbFCnCRtXhSrZf8AVeuT6xzVSFpbUC0
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b9584 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KzwQcsJEF2YzTSYNgzkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwMCBTYWx0ZWRfXzZrgS3+YAI+4 cpPo7nSVLtWXzxgovKO/jWnthmyIckQNkjxpAlILvuA9hbfaM9+YSnIZRiRYLl1f+FRWI30teD+ rQOTTSg7RMZHiu8GSDl/dvLlNdb0dOmTsHIzZI4iDqtpaaKIJCL8z0w+G7dEHxk/HTbu2mmvlkc
 8MGcRxHBw8CZ3KiMAMKnEbl26mUHH73sjEVpy6Tbkq4d3Gwfof7Ngcp8KIqmGnblRtoJTWQKNkN r0yXOJQJfuF93D7IOLl/CG8Bl/wbAuAjDXeeLzKuFLz2JPe8qs1YIKRbPtoSaAC6ui7/Hwo2wKP FOq3HPDSBUi26JBvcRbVQl36ct3JO0GT5cxRXrDAe/185EfXE5aXZmWjQuz+43MxuAtqyJYwhQ1
 MpY6RufXd235cnbG2tOrD5ADn2vFzSLndbgL96hrJQIbXtSsF/YvKzWwmQFQqQt3Mn36zfP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250100

Add the ncluster_cores_array_offset field with socinfo structure
revision 22 which specifies no of cores present in each cluster.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2:
 - Added debugfs entry.

 drivers/soc/qcom/socinfo.c       | 6 ++++++
 include/linux/soc/qcom/socinfo.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index bac1485f1b27..13cf73744bd9 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -155,6 +155,7 @@ struct socinfo_params {
 	u32 boot_core;
 	u32 raw_package_type;
 	u32 nsubpart_feat_array_offset;
+	u32 ncluster_cores_array_offset;
 };
 
 struct smem_image_version {
@@ -609,6 +610,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 22):
+		qcom_socinfo->info.ncluster_cores_array_offset =
+				   __le32_to_cpu(info->ncluster_cores_array_offset);
+		debugfs_create_u32("ncluster_cores_array_offset", 0444, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.ncluster_cores_array_offset);
 	case SOCINFO_VERSION(0, 21):
 		qcom_socinfo->info.nsubpart_feat_array_offset =
 				   __le32_to_cpu(info->nsubpart_feat_array_offset);
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

