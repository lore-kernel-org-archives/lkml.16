Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D941EB19B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163377; cv=none; b=Ip1dOpHwA7LL3JXYJK5xlDsEnM6am2Wk+GsCzvXkoNpsXwgZDXWUkynHxuU75L3O26VA589q5EGkLix3mrUJbvhpLlDkpd3Vi5KIHat+Gr3BP6CQMAdOcF1WwqU9McDVh4VfpvXCYzLTk33Q3v5lNPS+DiZUvn4U5khg+kj2PNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163377; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zpg7ktz3fQ24MW8SPZTaiDa+Oj/3+32CP6vaWAAXSt6p/0gUYrup705Zu2s/x5O6Ok3u+3FsUgcBOysWDYUWSeuRo0kOx8wW9B1P30BbBzjMseQnvBMnJIf3l6npu9Gb7D7QQN4v9SsC3UhCqEYJitZPhwH2/q8Xbh0+/hlAqVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frTaDuli; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frTaDuli"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P8VsQB027869
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=frTaDuliW9pFQz5/
	YC38OKTFrqQFottZhTMeMEeQrBNt0Ulk6KPT9Qao4D3cAe1m8s7W4o3jdTLciE1K
	rMBPj8gWlaa9UeipWlPtnKRZrw1FZ/H6qj8jKDfD5ELWKIRVhCCHmCb3tND5YX8J
	E47KrvACVlJ9c+dYRNDyrPK2OU5MzI0Ij1cAlOqaUfgFvE+3BCShWIHpZ2tq5xqe
	X9EH4bZ6oqKBRj7Jw/tzZiveEBdTQS3S3c6y344xsOJyek6LsTV3gliKFoVmEcwl
	oWp+jjkvixX55RuH6KLzExD5mF89pVcB2sLlbT0Wel9V7dbsfBdHrWDTXMq3vs+Q
	0ftqwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52usv6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:56:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2344476c9f9so2592525ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163374; x=1748768174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=O8S9LgGnb49o/JF+m0giTbjTh77plNYvnWnk/Wj1CI0Y+5T9TzUYLfvDZegOKujDhP
         VJJSQ8U+Acb93tzKGJuyAYa5+BI+QirOdIg1zX++PhaaePlY7kkm4/FnN3oRNsutMn94
         uKVVJTOT1L7hk2wySVwQwpZL2ULvBDAxAAws0HLswEDChb+tkVHZ6n4WH7TppVmNgvji
         Xasdaz7/evXLM3xVFMX0mn7ju9Eot65NDqMdzOx4q1lifG13MU7lNmoupjNLvmys0/K1
         tbfNKqFsEWtdf4XhefjOKuiI5TEJXs0IH3w6IWnSeVzb0rjEi4esj2C6ObLHB8bPAHMH
         l5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXE+R4PQh4BsKDGEtRgce4eKf0QuGbKIQTc7LVtzyd3zmS2AKxDS34aCc3TCv1yDCp+oAmWq2H+VE47IY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrv7Joi6zyGBzWo272TXVE8Xja8FRBw3sb9Hq++9pkeSpP4ZkO
	iXWLkAuu6UV064zbRSyRdVZok32U3mfxLVvoWIE4chEDEfgD1fxreCiKdnWRcAUT9xnt+qlduR0
	XzWKpSQb9erhySstNh1nIak6UspUTXCQFNTMJlHZJNFH41IZEGzJcCsw5goBsaV8AallBu+XjTI
	M=
X-Gm-Gg: ASbGnct3zzdKdR3OpKWRYJEFXAaxJXAfQmKcaZnIOMnPo9z1jXuv2BUYb39MTZ15N9t
	0qj/K+xAn0DETFIH1omA+N2jeiFJpFv30NHSkFyMyJ70QWiL+BMYMSRw+oikX9ubGdEmAmyJY5h
	U35Kz2kVqr571RDkkbjgbDvaz9IHDqf9P8yAL72mflOTUiRj/VDDjkph7wPW0EPHV/v1nVsbAYn
	xQFeKUmVeMHGBhwpjAgfXKsyT1Fh24e7+fUzxQ+UQC0Hpe3W9PgVM7dbWqgWgj40ThxDRSjLMM4
	3gL3PyPU7KIAK2WQmix4tZL0iw==
X-Received: by 2002:a17:903:3a86:b0:22e:491b:20d5 with SMTP id d9443c01a7336-23414e3b515mr81384075ad.26.1748163374554;
        Sun, 25 May 2025 01:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz5i9KkFKiGLBVFi1nTJLPMlZymSsCYwnstYCW3DdUOQw+MT5Qgnws3vyUZpvuuMIc5SBZKg==
X-Received: by 2002:a17:903:3a86:b0:22e:491b:20d5 with SMTP id d9443c01a7336-23414e3b515mr81383865ad.26.1748163374174;
        Sun, 25 May 2025 01:56:14 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:13 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 25 May 2025 14:25:59 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ddr_stats_-v3-3-49a3c1e42db7@oss.qualcomm.com>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
In-Reply-To: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=vfnJcFVH+Tg5NcLHWExEPQ9qovSf2ZuLYUvr5WZ9K1wk6d4Ap2SZ2hbKdlrF/S1cDzOflNv/5
 PVVVQBcbsivDqMJGDq7xdAzDsg4MxIkvc8dC6CmsFpu5ED0SQQmSflq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfX/Xfsp24fHGTU
 YWY/2UCR8izzqk0nAznHL4G57S0mgURnJo2XR2xceFR2CjAvOESBrrpetfoQt7EKZHTjZm1exgd
 WRsgOubnqS+PK/ybRzHZWzYubfykymXpXX2aRBo2fjefup/1u4jocI1nF839go9h/3ck/6UZDRO
 VbhIipfEqUmDgnQ3iRiP4ekRLz/9UnaqRA807fnsHcGEcj9/egnhM2EYSew3VsLdWb68r2hp50m
 D5UYcWqkFjQacc8D0tzH4EGh5ubgAZ76igjXuhzT5CQDG/FlEw+8n8r5Z0WF06ZO4fTDVA2trOm
 O4q2u9p90YyQ1xhQMmOa1sFyixtxpYUAc2GFFqOb5lC1kSFzbxBqzIOr1nZo6McsdCgQ4jyLSL4
 uRANvW2+3FmEvfI2vS8MqfMwoI6Lyqr8MwdbPXKsnw9ovRa6mvgdHcpNXJuFQ/HYzmSgSVfl
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=6832db2f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: KK9zL66bQxdnH_L8xW0eSMKrA0CjlcM3
X-Proofpoint-GUID: KK9zL66bQxdnH_L8xW0eSMKrA0CjlcM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=686
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250081

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2afa51084c510eddc341d6087189611..33574ad706b915136546c7f92c7cd0b8a0d62b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3739,6 +3739,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..e8371a90b9b98fbc12a429def8f6246c6418540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3943,6 +3943,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..875b5a89d2555f258665c881ee3d96965b6d7a6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5725,6 +5725,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..4c54ed84e2d1ec836438448e2a02b6fe028f4c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2490,6 +2490,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {

-- 
2.34.1

