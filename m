Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063552F9492
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268999; cv=none; b=hUs0LuGH2Ja7lDywlsfZbCXs/JwCwzbylGrLMtNZ1CJCV0GChdgFJnuP0rKCsu8IWQNWoKmgOosCX3JO17HR6cgLLyeqB8jLCp+4oSQlwXnXjHwVUI69+i8IFgdffmr5L0E7BoD75fQRA6PL3SYAhakozMNPrNOyIvmFBAHuOAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268999; c=relaxed/simple;
	bh=ryRpSA92USUhOzaygJj4k7Hg/jHuIKu6qNW8qSohB3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZbfcCGIjqP0yJZeKDa0JR63uEwDV/CmZxsuK2zi09xW486LHOZ8jB7pT+M0RS8ygbFn6kLGGm0UspO7QxF0/T6Ang+aDhX7o27HAiNMREqN1nYysh6FG+g1lnD5CwSEsvyYpVUoplKmGoiaDyrKD1WlhYzjm9ShOWoHT4f+MK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enFxBmNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enFxBmNT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IAnQs9018217
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGCJlUVvVVMxsfvZ8Q/CT6/JNdsXaa6RZ2Rxs7o1igo=; b=enFxBmNTr43d1cnF
	FxPa7APILelFuA5SvL7V/bM+QpvPmbZBKcMsE5EcXjo+VKW2gQMz76dhFVUqK76W
	lYsjR+aTig5ke8XxqS7zlG7Dfxi5wnNwFXRg55PVoDQyQyV7XqCZvRgrheJvLDeC
	cIeW7O7LEy6P+7WdhV/GeC450Z59KvTaC9HpHXPH5Ig1xQsjOmSrmzkj4wgZGydE
	xTOcR2y58EUoKv4+Kmq4N06yIQ/Z5QakW3V3KB/kun+Bxr5hRyYFkAA2qxRQpgPG
	zdZBqDljft6qxC2yFmC1IMCzLtaTbMGLDcXymLLxlMIe1SEpoX3FA0vkaG7VWXhD
	MNQEnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mn2ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:49:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399070cecso211971385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268996; x=1750873796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGCJlUVvVVMxsfvZ8Q/CT6/JNdsXaa6RZ2Rxs7o1igo=;
        b=HlmXcpspAWYdEzHqal2laUWZ2UDPGPqw7vufKOI3+SOzUeIdP547PWCCwdDnRSdOe0
         gP/cQ4GURXKgJMQIYkZNa8mlEFMxBIDOVof2cRZG1PayeN5zUQLN+H1956+uY7803Kw9
         optM1YNyBw2QS+BGS1KZAuTDVkEaee1g4J2Al/vJJ3Cqb92QKJj5aP8kaFwhwXSIRE3u
         P1ISXO3sVseTqXSGKTgxxZhZ9nRaTvg5Q19GdQMGoU7P7uZACkViWuPgN60kvw4XQqR8
         v/WQ5YldbYbME6we4bf2shKqTqX2Nv9W0h5Eu1Jv875GyZ+hwavBFThXSaqjYid33NjB
         Sf6w==
X-Forwarded-Encrypted: i=1; AJvYcCXTMvSOgOkcvIDmbSshQoV1mvvtoFzO8TVQ80gXQBVNEn5GVRuYSGyESiZobWm6vOnU6j3yUiynR/NDP3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRismjildcK+UGOqQS87HhFB+7AeBKPk5GzRRc4S+V/tTc/Q9S
	z+M7dKDlRVOvWaBV6UJTm85t3OffbDGzSGj6tAV2RRM1cNL9eGhVy5k4hDwz/s49E8TNY5wXTmN
	0wkldrPZhIaPpANYKNKZbMqRaz0ibpPFVWV/c2c1Rn/j/pnmePpwFXK7XZu9A8jYoigw=
X-Gm-Gg: ASbGncs4rYtbecVLCmWolYNQCU/k9Ac7XYKhp+uzbZ6ro7kLgzC2cpYSAqOgGyOycNW
	kMaVIgTBqa45sAAN5x1mTdPeNQ/EE/j7OKHK+4y4Vf6n/ex8pd2Mf5cYQOKzGkP6m6PGx1Vh4yJ
	B8d3i1D26LQAriq9xEJiYYZtFj+UI+a8wOHObFYrMnQe+Y/YuX/jYvQFLpDfnpbNrIf4CLt2/T/
	RnjP4AOokUVYmOVXEZs504kOjhVFBsPWOhUtCURv3n+RCxoI0YopdOLLdIirqJi+Sf8WaQZmZoo
	6/VZpgALyh9w4FTzvm2fXjiBNUOWfMXiJORV0ZEloHeF07wz+5+wFcc/Tufrqq20WZ2RyWboz+a
	jfqMEgeDjALRcgQL5R/sTnYs1Yc4ZK5evsdw=
X-Received: by 2002:a05:620a:394c:b0:7d3:914b:abe9 with SMTP id af79cd13be357-7d3c6d022femr2615354085a.57.1750268995866;
        Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGFORVK+zXZHWoBcwr7k2oSohqPg71ajlVS1t+7KvhjskeUc6dKYqyciXnJqATBf07B6dV4A==
X-Received: by 2002:a05:620a:394c:b0:7d3:914b:abe9 with SMTP id af79cd13be357-7d3c6d022femr2615351285a.57.1750268995475;
        Wed, 18 Jun 2025 10:49:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b7b43a98esm2911131fa.65.2025.06.18.10.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:49:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 20:49:51 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's
 mdp0-mem path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-sar2130p-fix-mdss-v1-1-78c2fb9e9fba@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ryRpSA92USUhOzaygJj4k7Hg/jHuIKu6qNW8qSohB3k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoUvxAFlmBsoLtgXsB+qdtY2U3llCg/vGa2HQQs
 Vnnt7uOWcuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFL8QAAKCRCLPIo+Aiko
 1RP9B/0dtaYwm02JahyLCXxGRZ13eTgwLoot8FI55q+mlgXYNTDlh1bidMMgJ4UVF7Abu4uApVq
 1y2NNeZUIn1lYZmCoCD6BzL3A8bCpqiqoUY0C5D8ZEedTUeqwV9BNjGkKz3g6EgJwyw4M2Dqf/U
 kL1//qTj8hN7TxpVvo3w0HIXp/evI7yfdSoQytwKwUHq6Cod7qtHGEMfZHGMPmjiRS7htvPCQvS
 FRYeuYm6LEoM6vQGAF5f8Z/48tgeZt9jmSSjlWSpnMruoeXcj27ob/lDc/Y5L7CrYQYsipu4B0h
 6KUbM6guN9EnvXGUKfoOCzJ/9MSJ+0L+nk1CemFjOp3hIO8g
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE1MSBTYWx0ZWRfX42T3mrvWyaLI
 uSist9Rbt4CbA/nbSQbTeqlOA5NKQvu5E4IEe/HiCrmbiHZj5reRH1LkPe4goSag0J0gvry8BxY
 Ga5qPF2VMWu/fFfY9aDhkr+IvKcgHFIo9W9jVtgvTBQWC8iG/0b+tmWcQ5iPQsf/4M6TynBLC47
 89JVFGbOV7V2fH9ol+N1XNeOlZbPrqDv/Ls6Pksenfy9vj556CmAljPYCwLhlwd+OWX3ye2ey+R
 U50D1Gf+vE/wEfI0WrJK5yA3ITgrxXOyajd2VAvs3p8MaAEyt7p59V/CFh9XBpirlWRaIZNjyAn
 3uWicg9+W47d2m+F7HZDYtkCI8gxTWmYKNdCqZFfLNnqLF/VhYYLGFQfiRoGBMCD7TsQpLihvaT
 MdfAt6ldoOsrXMB9zcH1dBsttflQFdgAO/r0c/diXvPnxTf8Z/KzlKW0qZw26Ueg/KbIVH4B
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6852fc45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=tt7aItV1iZXsY7X5gRYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7IWr6M3QSfkPUssQ0xwY-pwql7E_wYbL
X-Proofpoint-ORIG-GUID: 7IWr6M3QSfkPUssQ0xwY-pwql7E_wYbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180151

Switch the main memory interconnect of the MDSS device to use
QCOM_ICC_TAG_ALWAYS instead of _ACTIVE_ONLY.

Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index e400ea4cdee8c9f512a8bee4444506fd23d0f0b3..6d7d4f05d502049dd6dc404317412c438b11d081 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -2036,8 +2036,8 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "mdp0-mem", "cpu-cfg";

-- 
2.39.5

