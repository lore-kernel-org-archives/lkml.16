Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C122B8AB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621870; cv=none; b=K+S1V2+hETKWXE8tvMgSaENcDLGqqIqjxh5SJAGFESYyJl4ArEE1V3PaSvpGJgXXWDIS3wbzyLBGJj7vorCa9zLKVFPYfzyrUKNrz26z024JDUSoavLRI3V/QlbHQ2tL4svQBsfYz4EFICDpcDmLg1cduiZqpcTH4OrINzeXKKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621870; c=relaxed/simple;
	bh=QoWE5qzsIN231ymP8NOt+cwLglAC7WAj3m6Ww6hRwCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MaBQkYwsdlmf/MT3qxnS8kvHVWJe3TK8TMj35YrT2y3KBdxhJLVwi8iqZBH/H+Px5l7UKHaMQ/dEmnb1sA+G1ZMfkx90W7CYsJcGkOpz29QEIYwQWKcysAMSldj0DXhDLiGFtYNVOnvduxxJp/cBd/ix8gu3YmUIcDksV7rUriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIkT/zH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIkT/zH+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4scO0017282
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tuc2uE9tPVejGW/SpGhtTl8SWFWWhJXDr0F/rXNvP2E=; b=RIkT/zH+VkJ6nL6E
	+ySs5yqgy9lR1YRJndtxeHzsf8jwOlXhywt5ZygS/011mzw1aKQOs7DA6esprFSk
	K1qCufP0X6Hj4f8t5R5WPVcpdp0h0FwpeLCIbhvQhvfWCs4sUkN5zhpb1YYV9UJl
	knwOdMM2mBpiVGxu0iye4y/tOkbISddtDtt2xWniUchNX5spUi8wN2p5MtK3DhvM
	S2C2LY/33+g2axsuKczQYwI8/6xneM3Vh0FjTFKoTI2FS86ZdW8k4GPpLhxiPSkm
	UIbEm+SSjNJzDgcqtwB7WWXxlwGl1giOBbpZmvLuGLmVXpGFkH4j2IiLd0oUXqEY
	oZPMng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47736dr4m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f6b829cfso44977305ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621866; x=1750226666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuc2uE9tPVejGW/SpGhtTl8SWFWWhJXDr0F/rXNvP2E=;
        b=D/tPbF2AkcEQtGTLSeCxr/W66Nv0A+oZ3dbQ1Df6j2JjPDFiL31etX/J9p+lQ1ECaB
         Ix3g3LPQuOmPPBX7YAc7oKbSosJVZAOvP22mVFriDcGNjb7HRDxYCD1/LZBvCjQImZfh
         07Wmm1FKIDFK2xTQPfPRt0o02wHbYzDR+wz/0iwn65l13IVX7sqMCB2B/4C+O2dqp1nI
         7L+ep/dQne17BDlQURHl/TP/VpbqFJkjSqEQnhEhtbuqg/vwaVDWrtvY2NCL/DhNBluc
         VVKJP3OwZ9rrgtlekMQqBdmw/yuv9zhcynxCZvfnMSLoGmNdUs2DwW1hRpxYBooUHV/J
         gJEg==
X-Forwarded-Encrypted: i=1; AJvYcCWqRJSOw9vt4w/MDQRfPVUhJ4ZWNnYWi2/4fSmZomMM+uTKI+6H8rcYfhSYABtFivyeUiYGEXdmsT9Owl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLu1/IJ4jOO88jPVKwaQS7/TQ093R7NNXO/8S9V48oKOQB8Z12
	CmmvqCvYOt9hmZGGwp5dAvW+TvYw2idrfDfCOGvauwqAz43WPonn8JdqgJC0JcgdKwhKxbQqeTc
	07dptSAKtBKMLt85J9Qqr2GoFvy5dm2rwnsjq73akT+OdOh6kX0uJr0rtu/vbuZezQQM=
X-Gm-Gg: ASbGnctT7JPQfCcd7pCfBV/gGaRwrTXPtH5OiHuLxcCaBc+kpq7xkZfhBbXh9MBRtU9
	r2m9ZEBfhs5lg3hhwOmr2eCnNKKvLK4ecGxGvMrrlXTDj4KBeQyWHAsXC6rAKRVKXyqJkZxzSbG
	0pAV/OU3zlh1RMN0QZnJdsLVIzcUW/hKb5PpU0wFhBYRaBgPblhKN44wf3msefCQJa51+CC659v
	iMsmYnoBJNwoco3EX+l3Z71CHJdTmZiL3KBmaKSgDrsq72xhM59doXKIUwhSOk8I8NNcGhO1BTy
	pIx9DSVWMjsitKG/UV+crZ3NpurpNyVdbOS7
X-Received: by 2002:a17:903:11cc:b0:235:225d:3083 with SMTP id d9443c01a7336-236425fe5ffmr17483305ad.6.1749621865874;
        Tue, 10 Jun 2025 23:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjRlTU5O6GIFibdwvkIpsRe91SomzTqcoS6HqIebb/RbidfRMn3z/pQmVDsVnZTpzJOv4eLA==
X-Received: by 2002:a17:903:11cc:b0:235:225d:3083 with SMTP id d9443c01a7336-236425fe5ffmr17483015ad.6.1749621865460;
        Tue, 10 Jun 2025 23:04:25 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff05esm79429685ad.135.2025.06.10.23.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:04:25 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 11:33:47 +0530
Subject: [PATCH v5 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ddr_stats_-v5-3-24b16dd67c9c@oss.qualcomm.com>
References: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
In-Reply-To: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749621850; l=2490;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=QoWE5qzsIN231ymP8NOt+cwLglAC7WAj3m6Ww6hRwCA=;
 b=w+819P08y+ZW2WR1u7wKMQcFAMBzs3arGunRn1pIv8y9QDhasVeQZQIxjX8fY4IKYFTj5Qex3
 88ItNnz1m4fAGCJYwZV1eh8IF6T000LKWoRgASHGVn3ugsCqVgreDPg
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=GIYIEvNK c=1 sm=1 tr=0 ts=68491c6b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=YfaFlAmDMIYh2TYAZrUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SRiZX9xWFh0aTKZJwUHkaNWyJ8Tuz3pf
X-Proofpoint-GUID: SRiZX9xWFh0aTKZJwUHkaNWyJ8Tuz3pf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MiBTYWx0ZWRfX0TtkhLOXom1a
 pYFmcByb7EB/NLI9f1OxqhnoDYscOPwkNd+bZKZlH7wjnJqlxRe4z/4BptvVYkMDvxJGls3SAPS
 4Gmy4Dr6z4BsnkZYheP2G3cWcR4jBcUF6g88r/PE18uYmMYQ3a2nfJ8YvIvFOnUa329DwONyxW3
 CKVSrc8jHAmMZs5dZWN3sWSBapQ5O4DPDB4j1GiC0rSx7isDAaoZyBPC1GNbAbe7JbSXRPRGZja
 E1zE37xHMaTnY+2cmGslhxzZ9ep/cDnlPy0HNRMNPAi+9N0Cf005PnLIW0fzjnKvgUNT8Nj6r9S
 J7aKidkUTg+X4QoxZzMFjUn4dXBtNj21XzX76EnEUNikaUuXJa/wPeaKmewB6zO6Opo0s+wMO3r
 8AN3WxZNqc4omZg+oMaEatBjJNy0KkVJnsE6N+lA48Y3IvlYdWxhSYABOoVJ/RTbgF9+TKIS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 mlxlogscore=698 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110052

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

