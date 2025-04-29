Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5007526FD95
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898798; cv=none; b=uM2X+/xif8x5qbTu5eJ4AyKnuf9akx82zDjBQkQ7AVr9xil7KshSPEca3GhJ3S2Od4lirvBWsdFb7sfKOWUJRErU81PafzX3QhGqawDv10ZX6YEfbw3V6tsdZSEAGUPg0iGPFeC5DWnzPAO7DuvDGga5zIbCbRr+mnbVFizqh3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898798; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lAA9tmkq/8AQhoIq3e/b2UfFsQ7tX1FZUkXoCIbMG5b7QsnKdHG+YizKzmjRvZoSRgWZhCel0CcQmoZmZWbshRw6uuMyLrUdAKtxV0zueh277CpMY90fGpjm10ErjUfL6vLHgQEWuOelQ7n+uKg3SqTQZTaQkNReTc98bvR7Wh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZvp3WpP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZvp3WpP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqCj5000768
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=MZvp3WpPHdeZJzCf
	gCG0i4xY2pvHYfsv2cGDPKeriUzsGnNpN1YWrSxHSHNM0ExM2BZ0ZUYiEnjjZ6Q1
	IEK2ZBe+SZZ/tTyssqF7xjrOFX5pH6fjGPCrEa6MXRYDsDBKPffmZgv+6HEVClVE
	M/aWkOJcPKrg/7udwQWOStH9unnktuS3YBpLlb6NTAM9CB934/KocwwABri2MsV6
	V5hbzXjRabvpt9/rJzOIQWP+F8HT44YqLQJciWMPcFkz1TYwimW15gECVFz5762P
	ijdDc6wjoMUNauNbF+8aGZ0A4pV/TbWFWJDlWxNLq/lCgQihEBZ2uLHwnCWylFKe
	7hZgYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9k4ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22de54b0b97so6716285ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898794; x=1746503594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=wuOwPkzG0MBjNb/8nIzk8QLB+VwcU5wlRoYRLBRQLVb8PEN/K2Du4TfKmAvFq7K7LY
         e72JlchP4eDWBVZpaomNUTeHMLKHM3+ctZu0VUlhTUdkn5dD/y/n1ZMZGeeH6j/VNUJp
         J6uE07I7j43dVl/YDgYtKiGeVgHnxVn0AY9OfH5jww7WG1sa/XqnyX2RM2L8p2pEw7h5
         gqxe9S2hUY5S1Q/v6F1Lr30mRjMMKt9a2qpBGgsgj/k0zqB3e2v26Tcnmc6Hm5jVYvPs
         RSEvAqjjMrTr7N0DXbypy+xl37A245QRI1OYoopLz4SknAXtkaybl5J4soxYVdFKw9Wp
         7hvA==
X-Forwarded-Encrypted: i=1; AJvYcCWiuk+w6qZZoHgHCKtK1QKTwRROes3c9D4dcQ/zRk6Rd3j2OuGIDg1BkDM/R7VL1a9KjFYJfECQNda5imw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWDIXZWrSYUpHSNrd48SgqMvHZHiPzadLYEzKixeUHlIADzMv
	NnuVUiU2zyK4IBZSe+MzbTojF/p4fdIgWVZylaj7nnGIghhhOR2VfOjx4b2Yhrvwdf+aQ6tohBl
	vA2vGG3Az1qzJ+JQK4kbQ0RsRRNQ6qj1mUHlH6Jw9zDTrBHaMP6LTulF6v0BEF63zh8Y0HOQ=
X-Gm-Gg: ASbGnctbknxaoEFg2lHfwXfSeLifzb1YHyx7TsIAdkVvpM719fmzCgtYzi6bQmez671
	c1Mo64LXdJNhImVDaQ06t9vwwHII9L2MVRvCYJk+ZjEdyabz9WTAgFHDPJ4wcs2MMajZfN2drR1
	d2KzY6EUebltYB0+vdJNar6CAWm8DY/psfZ112RRKj9uh9wVdWf6MpWdnZAWrWA6Xm44jqWhh8V
	BR0WP/CWz0X7gLITDG4F4xhfxK7s3yvC0ae/cpS+Xv4XREWrGn5FgyQ9OdWdiZJWyFgqZtbrErv
	eEEBxpciukho/zG/xG9H7GHKyQ==
X-Received: by 2002:a17:90b:1d51:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30a01033a09mr19761865a91.0.1745898794124;
        Mon, 28 Apr 2025 20:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz/yoGOCtkxG61Y388At57vkidFm4d9jlbyUVuP2IvXjqVOZVOballcMOOvtXcLz9jntlNHA==
X-Received: by 2002:a17:90b:1d51:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30a01033a09mr19761844a91.0.1745898793767;
        Mon, 28 Apr 2025 20:53:13 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:13 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 09:22:35 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ddr_stats_-v1-3-4fc818aab7bb@oss.qualcomm.com>
References: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
In-Reply-To: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=m8vzzDztRzCVdUvyFvXn4roSIywRLgmQCPiNd+b9l29u4EfXBExYqBT0NFPXUd/tYfhPwRwRH
 qSMweHgCM7+BHqNJRzp/0oJgzFTDpF9Q1t38BG7/3isJ2Dm2Vt9dk/m
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=68104d2c cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 5Tgsehnjx_g-0DaTVZAvh33t4P0MT1cp
X-Proofpoint-ORIG-GUID: 5Tgsehnjx_g-0DaTVZAvh33t4P0MT1cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX4aTNjRwN8gol 03115LFvkSQC5nVqzT/B4O1njA4CXnlg49tYbi4DssTQkfO6rwpYNjdGTky9K/Ui6nhn78j9KOi aOJZ5nR72OpjosoDA+yWW2Gtk27TM7p3NhCZa3ZS65yWCw4ZEBqGt6XbWwBj7dEkyZDUkEqRz7O
 EF3vDdiN4NP+8+V1q3ZTumVrsln1mdgTwB+XTh0Sl2VxE1/Ru3vuIDiiCJUztQ8d10/cJypP4HF HXeHpLVhmnPrXMXkFOpuAdV1a44vJ6zK9vI0GlF5qfULu3UxYBLBYK57/jX4ulHZik3qYWVN2EP pjCXBa2J5wKLJYU/FzIodFiPfkTKBG38rEydVagxsD+9Ykmkmm6/VNES2Rhqs7K6v/u02YsR7tj
 21Z2x9XzCxkilaslqbLzavFemJSBfS0shYGQERcYh+F87N3dbUWTuYUEeXQXsU3/KrwMiKVC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=662 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

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

