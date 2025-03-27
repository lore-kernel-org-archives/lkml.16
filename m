Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E91DE8AE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108908; cv=none; b=FrOAb9hTYfOgNetb5BdxWgQjUPJLBpEqyG2JWlikp5jHaJ8te7ucrgMVl4HvlVg8r0KxOsCf7luPE7KAuERVoOf9dMAYeHmNE17zQiwNMvDLp217xxLLOsVd+xg2DDHBcps+DGeWuWZWuxmJCGv4aNnZZ7OcORsBMOqVB0KYs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108908; c=relaxed/simple;
	bh=U9BdzzhWeFpEO03ZcdPUogQJ2eXNj04FLA772lDCFGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWKpokhsxsn6tfThiRgNK7bKuKfuYMFQaMQSkCBBtWmr6zEMJAGvKtmRPaYtmIXcJUPFl+itSK5zB2nRFFi87nYBt2OjFCsGsVnCG39UhX1vJJcdbEii/7fYIicloV/DoaaM1vzSwFFda+lGX+NLh+c6nqzykOkZtgnpXgBY+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUxRemTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JUxRemTs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REacR9013791
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HZL2J7j67fkYh+i4KJociVMY43u3MrYZFVTQ4IabZiE=; b=JUxRemTsSogy1f5n
	SiRsW6BUwBlwwJQOcJ8z23Ozz7FB8oiK9WFuHmf54ntRAQbqXqJwwoXJ1LUgLAHo
	ZXcas7ep60/Idm5Tjo4O8k6eh/+366fMHehP2GbhWU6HuJ4ZiVC2Kq5FP9begQ+r
	vLR3JDw3uS0DhQ7/AXX5EdHEaONls3ZtCLTA+12G/PoF09BUJ2Pk24EyY+8nZEdm
	G6K8VIhUbOheT/e0GJ4qzODwhAYFKf1imM4RxwH2LAHkv8viGSWmBrGZIwnCTjLw
	z5wBSaeVq7P/DjBiaTXiqoyA8JcBxBJTeojLCdj8GSY7lenaMtQJAo5At6/V/32x
	vdMqxA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcn8gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30364fc706fso2373289a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743108904; x=1743713704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZL2J7j67fkYh+i4KJociVMY43u3MrYZFVTQ4IabZiE=;
        b=pNS0mMkv+Gkyrowxi5S2OrcxTGyuAwb0Be7HUDVWlSQ2T8AyxlMuV6UvW6nISkb4le
         Qxww0q3oWLJICn9b59OIm0L8Sgs4YYIZCzmUSNvUVBd3uyiUEN5QxSrH+vQ6n4Lu4yYy
         q9Q+8rlxmIaj/PYl/oivDl5zsUMeEw9uAm3VAbxeuRaLPVSR35LJjwb+yM83eJ3lEJYc
         OXPt1KR2Zl7hEa15BCYCCNyM6ZoSqWtAISRevSJ8nS5t71f3ug15U59hNs48uMruCywT
         a1hBSq/fkQWd6M4sBKM6v8FpwKI9n3uh1BKHE3ARA4ldHj0QkMh/+SWrqzvtl/tS9myK
         b5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXK1MDIAN43Gem7PFO57Tx8RoNuudBB/3M7ngRuSAJNmT89uahZtiacVa7JE8Zbz9ZbQmotptkYxjjfgeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF/NKv1NURo/24mGhleYSFQ8UXL+EblpkbExrVozJxjyHDKtGp
	yoPkMJ4iDefNEKXHNmPIAR72p9HNZfoloFoQlnyEUh3ngiJELBE9SkBFpd0/35ydmaA0lOzgBqF
	6a5yQbmHgAcnqKKYYsYtekWOIbZN6x3GVStRC45q3UpoqSZkVGZ2CTE5Pw2i8ww4=
X-Gm-Gg: ASbGnct3Xwmet0ZyGV+xJXXiapztaMvNocNOh0EHf4xnbaAPnWO3fujyk3duN0LSI61
	BDm9ikYaUEn/D5FmwKZtz6UtxIAq6Bpkx5xlUxeOt3+S9SJnGS1q6Nvh5X4aMETsexP9hGgORg3
	eeX2pMhktRkx+MBkkshMBF65OqtZTKw9MbS7L5AUsjd0z/oYKOe2gM9snn9XQkvVK6MpzeFs4Ub
	y31Xc9xTDEfNb742hHOD60CF+gMTXrKhDZiqdsaWtpqHzWbDKRfDlfHuMQ5He9MLTIhRR+5yiU5
	oc9qmYYjgh48CHgWz7OfCBuyCQnQ8gPQI9l0QPlZ6A+psjZyO6UddiuRIwVE6t/WuwLcSPQ=
X-Received: by 2002:a05:6a20:9145:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1fea2f985e6mr9089558637.39.1743108904036;
        Thu, 27 Mar 2025 13:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeWk5YIjRb7LighhOG5PT8QRBGUHODIFCxkwgKYHselhxMyeDWhxxLY5JxTwBRj7OMdUcaDQ==
X-Received: by 2002:a05:6a20:9145:b0:1f5:873b:3d32 with SMTP id adf61e73a8af0-1fea2f985e6mr9089515637.39.1743108903558;
        Thu, 27 Mar 2025 13:55:03 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10da3sm330889a12.66.2025.03.27.13.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 13:55:03 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 13:54:30 -0700
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 MTP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-sm8750_ufs_master-v3-3-bad1f5398d0a@oss.qualcomm.com>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
In-Reply-To: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743108898; l=1323;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=MdjD8aiHN7OIuRznvg54M9HPuWn9/2mgRjQBVr1Q0Pk=;
 b=5T5ASOH7NkLgWgE7q0nmKRiqY5hB453mQWJyRvMZccbsIEoVlAaPpIZiCsEeCwYUlOkTUrM6Y
 CXJLyGLYFIWBmkxh+xrlpJHwai65gRsyY083J1n7VV+80/UKfQIC4qx
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e5bb29 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YBlEHuN6XgywxwcP54wA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Zjnuy0j3PiARjQ7PV1HycEQhJZlw5rbG
X-Proofpoint-ORIG-GUID: Zjnuy0j3PiARjQ7PV1HycEQhJZlw5rbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=709 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270141

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Add UFS host controller and PHY nodes for SM8750 MTP board.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 5d0decd2aa2d0e0849414534cdd504714402458e..90abdb9da183cc6fb93d2a28811baf4e348f9831 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -806,3 +806,21 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1j_0p91>;
+	vdda-pll-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 215 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1d_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};

-- 
2.48.1

