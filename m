Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BF278771
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424114; cv=none; b=EzKRxRDI0sVIFqPx51BaOjFKE5C8osyM1doxduFneZolxCPaWGj7D8P3QL5UJme9WWoUTNpjF6BH98r8aQjLt7YnfSnioFVrtEz5k4lCyUNo6nxvN2pLLSZTMKph9JN9gQNb3qM7rwJhngRcBLrIM+btK87fuiwKKFtxSa7mWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424114; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tB2iMcy8j53y6OBjATwrvlORy9Z95P4zPmkmCU0dxvPALcWBtX1C5bnVeqiv5DHCz9GQ7J4GU6oLyCX77jvKM5WnpW9Ya1LV5sQ/hJgX+RGK81Y0nkdqDICUymFyl5TR21E6FnjPh/g5mZo2+XaCMfa13fi/4y9XoCoSrU54NNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLawmlCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLawmlCP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S93rt4023955
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=SLawmlCPUdvWI+tZ
	o6QRN/0BbsAv6qG8FrX7W881ZHZqUgVvqGH42PiKfYe80K8uOKwW1x8aM6+GdKEx
	lUOyrzR+47CLTc7PIIPKOGIBa8ut5IACGuvMJ5ZJB6+1QTIkXXTwJB16qb70tw0Q
	KyqJHvbBfTEXL4uyGaTztlvftb2kZdCrLG2hGax1ezUP0N69JmR04XP9wVrmMeYO
	R8xtHq6RmLS6PblTJswR59AofWbKM8qtasYsVgZOXikUbuCzYBYmOiPIe/U8UYA0
	po9WPfhtHDvfIKVrz2xIH7JXU3dV0J7u8TQ/VsNMLsWXIJxl8mSLmfw0ZQyXLeAK
	kcXPtQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek1n9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:21:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73c09e99069so5034278b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424109; x=1749028909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=asjVUdu6IU6XPBQEfKbEy7vmadcXk5p7G5Y7X0Lk0Bu/BS95eDzrktgh9UFFD+X3HS
         H/QH44IwMRoHAdv8OKh7p01HDpwYxH3XvxFC1g5/cScKN50cCq04idVFF+oz1yoOUd4R
         CxtSMmAGMh6aJVgdgDkQXpV62fDmW0GNiRVE2XxJ7sEyB4Md2GGPFlUbu3E17tVKl/Ah
         mycXiHSR8gYYuaCVieb5Ir4ZtspQSVkByGYBlIrgpuRcKHHeT/Pq2tLs8+JDQ9bjGb9l
         OAgAxhQTRcxQZg5KyuJyIzXaxdL2mcz6fJSH9JtqJekDIsFuFTmeYXg+h9Uiw6AduwMf
         G+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXb4SzJ5drCBmxZn44xUvHZCPSPKuREknNWRvlG9etrA4KPfK4Q0fgbJmeP6t2A8KjSJwCDfJbOrifxQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIMQdjL7JlBMqkf5lhxKw0lR4ux3slVRhO0gaeDR2joWuKyIt
	6zQY1AkoGHDLDjTGmwLtOTGbwfGsUflGbiDABf/ROHtgMoEJHqWE4rOne/pdTDLmA1dpnkEw2tS
	HNHDSnV3OMVm+kVN+mM4SijUO3r8NyIyLnVsY+yl68ZtW4Ac14biCQTwbmgJGoYS/a6M=
X-Gm-Gg: ASbGnctypud0j+z0gDTcVoSuUhLMHHDkf4q5Zb1aAFjYLcJZbxaRguNMKRBPdv6UkRH
	0EZ3l7RNMezHaOWRoqet51BwBjgCbzFhEYUfXfi08sjuGaVoH7433ILviltpTAFJ5SHm7PryXkm
	EXa7CU3F2M5pK7Lrb30jGTUTt8mfRN0ujc/kX2chzSFzXzJE8coJbwhcwruOmEM9koK/C46oiM7
	n+jDAJruB/muDUqqN70O7mDeimloELkBekHW5feK54k1VFBAspxbf8qPCM3g5STtqkBPGqrAPeF
	Ah4yDQHmYxXCEAI2WDGDgM9wLw==
X-Received: by 2002:a05:6a00:140f:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-745fe035e87mr23787274b3a.19.1748424109392;
        Wed, 28 May 2025 02:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8F1Leeb8hvqWanbPhFDRIXbSQk+YihOTKHY3m3CJ7M+ZPDA0t/uCx0hLnU+pvOhLg+qqIGg==
X-Received: by 2002:a05:6a00:140f:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-745fe035e87mr23787223b3a.19.1748424108964;
        Wed, 28 May 2025 02:21:48 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c2c6sm833456b3a.134.2025.05.28.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:21:48 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 28 May 2025 14:51:33 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-ddr_stats_-v4-3-b4b7dae072dc@oss.qualcomm.com>
References: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
In-Reply-To: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748424095; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=RVhu3aYygw1jl79Ka7vUZ/MHVDs5AnJ/SXP1NxKfVCri/JIKo0YFwrKfUNK45qGAa8Ez9gbqa
 9fhVIsnDbnxDxUyyrlmeXQXK7TH1j97wTIakKGHennXv6lV72Sr1BKb
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6836d5ae cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -vVi2_56pu9SHoa7lYE5joqtAp_O1-A5
X-Proofpoint-GUID: -vVi2_56pu9SHoa7lYE5joqtAp_O1-A5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3OSBTYWx0ZWRfXzShTNKJbTOk/
 L8HQ6TeEIaugkP/9dvRnbGy9dTWo4Wt+hXGUFeJXF+8h/oGMCwjAXPg0enZNcEwKNyeI2ZWI30C
 73r8cH4pvPtU/nbPvBGPBNunxiprphDAyg4cZuHNY2LlQAzmTH3HNA1vd/BBrLvFver1u5WBemo
 ckbjNItZJ6zAWZzfEnoP4qtCz99AebH7ZY8o6ucz7rz/yGL7AKJD9zmAKKVlcFtV4gF/1hlcgi9
 2bJuheLkvwlawOwm3GZt9AXF4r1TxK9c+QE/I8gQMYD4XCzl78v4eUW5qTJmql/n2ctSjIie+qO
 uuAZOEd9LnTNqsvCUCm4mI9onlAU2feR+rFvlLXe+JEXT9YwUPfIomBohaz0puxnVerUt1xQBZs
 UHywitIiKIoYjgiKld2ku2EMFqs7PGmJ1Yz8sypCmUxaf+NepS7Ioa73o0ZV7P84zMTEJGRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=688 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280079

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

