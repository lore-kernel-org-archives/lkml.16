Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B629827C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563138; cv=none; b=rKvVqDeffVDXIKCC0UBLW0mVF55s2rxdAd/Ot0fGQRvgm0fEA9G/yDwh+PxYFUs9e2yWfacVIqoZR/dRWtmDXXl0Psf2ckULwPFHL7uRNJmNkZOCnYk7xIQq2dUhksspMhYWznerSHhK0Op/NfOc1b/v1u/Aw9xgcS/AUA0bLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563138; c=relaxed/simple;
	bh=gRV628O4cjIUWMgrYP/Hj7VGLprVkTS/C0/4hXFUHyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gz0jN7a2KIwfjh1jXaAMYSTQnqTYnP7UkBSHESaP2Zt3bAessk8vj/VMJOXNW3VQDx6irczh3U3OQmaJ7u8ogzGbEyDHeIpOt+WNKl+zgk07bCvkGMX1rHM7AfpBxOu8Qs7I1AxgeevoLRk4seI7uDv8ijpyINMkJI+TCl6LqJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YR3q1n2J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YR3q1n2J"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6e2UW020237
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQoPrvg9W5jhvTTkdFPGa/0JYUGBtoa8pnLOQRkk+tU=; b=YR3q1n2JVHQLdr6v
	pjKEirpMjncJcsHdVXF2nMpJhR3X8SEHIFtYAzi+bWx77YUqgNrZjH7M9pwND4eL
	4m1eR6kyi6jBSxAYCwifyZAPg0m4uA3zmutKwTRTNX1GnV8YunGwSMyFpX3qeJK1
	sj0gVkTSz2cP4txCen7zRv+baCzf8nwvS+FjOP1bDTlpNj9Sm9kO84lpB8CfxpgK
	ZHaERhRw1RMFKJdPtKarfJovrRo/ue84SmRW7veYwm38QkZuq6w92fD/149as3Q3
	VTQ9xHH2gy5DNl3+D/rOYLLsSrHErmdPTm6BbKHeHG9B2hAYe5bravvBF4fR/vcv
	US2ILA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn97nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:45:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so5333753b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563135; x=1750167935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQoPrvg9W5jhvTTkdFPGa/0JYUGBtoa8pnLOQRkk+tU=;
        b=LWnQm+Bif7Mjo9MoMATou+asS5vjWf3J0aNwcQP8OQbNKFOv2nTdI2F2B3ZNB/6hcb
         aqZJxMbt6015vbkuDK7EibzW27TVOLI/1k9KpxYMnq35bJZE+hnVlLKSqtrDlbYv1bC6
         63J1DXgq2WEn/I1nZ2+SF472dJ3Qm713WFVEL00HtXAEtcEh8tcVL4me+QBXG13Qm3jA
         RGf0qXZxwU0DJnUAbrEXzOVqfjyMbp8NPMiOCwpPO3Ne6zP1DpyamESIGaaiNqdqfQma
         3q5aZ8L6Ix2+7NrJ2FtSp7VW923edZfOD9MTNMEmGhcN6eEcxNExSkoHX3+/+mhkhN27
         vtKg==
X-Forwarded-Encrypted: i=1; AJvYcCVZhTYqbbEjPzuIFRoG2v4uW29BocdjZLP7E5jZNbHRG7Q6hR5qOhld1wjDkXY6jGdRhjOIU/Afls0FuMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp6ot+uoNLL4H9z8fNicuZs+USDhYkhnT+oHD5FICjTE9QIZha
	q24DEF0GzZ7cVJKoX0DFKPWk1Vf+BIDH/TVqG/8z6RUfBKtciFjoxDgFc/4Yulu/J0Ij6HyRpU5
	h/hfrl8KxYnNqag+xDjWLZ/bQzIj4P7LX1rpupU3CpU31yGXIsbaJYGW6rjHS8nUwDgk=
X-Gm-Gg: ASbGnctTKWrf6YgVMlIMhy0hpgt39hZWozWEVE9YZqesBd84MfyWaQvl+EzgFB2E+Uj
	+IZ13ah11KP3fokMnu8QLomvnBR27YKxUNPz/pvqOOmArzzLLI2qvKgXDiP7BH2dbnvYWcU5Ms1
	KI6bhNMNMSSTjJ6Thl0faCp1NvNQx+m7fUEmM2AYmvjWO85IpN0+1rhYLjtyUyBM7m9K9JLdy2F
	KQZeYhCXZ5+m3hUy525msFisVvD1B6X1ifRRGsDUYzogE+EzS4dWuILsI9WBc8OCkgYoTczpek7
	ctcCWMOgTBzSiQ5SDDDg7WtmdqrgjFk+4ydnKZB0p9bnSqp2+ROH50C5ljfWSE5HS6aMFQBZoBo
	Y7kElhFxHZaPFihwocxLENH+WCDE7rnA5xb6vAlW6o317U77bEoJWwzTFgw==
X-Received: by 2002:a05:6a20:6f8f:b0:218:23bd:6927 with SMTP id adf61e73a8af0-21f768bb422mr6565248637.6.1749563135338;
        Tue, 10 Jun 2025 06:45:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBBcdRBFkeEE+EAH0fFVFZ0A3sioZzVlSSFpOGgykRhiygclkXJi8Oq+aCuNfkRivNItmW8Q==
X-Received: by 2002:a05:6a20:6f8f:b0:218:23bd:6927 with SMTP id adf61e73a8af0-21f768bb422mr6565202637.6.1749563134928;
        Tue, 10 Jun 2025 06:45:34 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70085sm5858107a12.25.2025.06.10.06.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 19:15:18 +0530
Subject: [PATCH v5 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-wdt_reset_reason-v5-2-2d2835160ab5@oss.qualcomm.com>
References: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
In-Reply-To: <20250610-wdt_reset_reason-v5-0-2d2835160ab5@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749563123; l=1511;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=gRV628O4cjIUWMgrYP/Hj7VGLprVkTS/C0/4hXFUHyw=;
 b=aa7tvznPKLnp0bSqhajVeSBeJlJay4tBzrkC146ZA43XpW2btA/5JFYYC8ecBuRn70TtsZCUZ
 EZ9AsHBDQIxDhxcbLnPRpMx5uMS+iITu99D1s6kQcJ30OpMty9M9jW5
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: zldmWPa9PA0HsTLODFkRgdabT5TJpxl4
X-Proofpoint-GUID: zldmWPa9PA0HsTLODFkRgdabT5TJpxl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfXxQwFIO0UKw98
 boEAG53SlSJyP/T5Dp6Re+5xoZreZMzJZjGGCxpBNbBpk2z+EVCYpJhYiHntnJ8kgqSXpUg6yxc
 KlxeNPjO6F1vesvF1bA7lMZMZOKrZNbPsQFFW0gnffkM0v4/XRfFmk08j6NTgYfqEHPnQiwo4vN
 fu+6C104YYvNGlB75WdfienNximjeRLtD0p5phKu731tSWN8mIhWdCmmjEI+qQ/BpH/8jNBJw52
 wlwfXofr8MadBFhUq6Isr1uvqffqRrd4x86mxWubE1McLRe4cyJqq+JOrssv4LE/HacS+TI89HU
 7dwlz5qTzaBMLqqFX/feLiP4H6a9/YgzIUpy82LI9ZTNsr23T6PgNHPcR1OA0aWuRwEsOveOSls
 Fp8nOQx8N0r+SeqitbWrIJAUhBB3MjlTp3urm/0pi8SJNc4fiUzMHkG5ER4giCOadi08m26D
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68483700 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=979 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100108

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v5:
	- No changes
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..7fdc003f210e5a69944b00361a16fbdf58f39801 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -591,6 +591,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1

