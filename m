Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E11C253953
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451480; cv=none; b=OaxBMMGx4lBI6XiWIUQ69tbZUr1V+SqcV6r3DamZ0qWIOSM2u6CnNieMRimW51ISwG/F/JuINp5e7QLKsVUcWcodEZO0fXvT4j95E+ck9X5MogIdXN15HN+xOGiUWK0VmL2SuGwVYhKVbSS0gIqbKwuYPpjhkL7REjQpfzmJDz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451480; c=relaxed/simple;
	bh=77ZuaHveNvhSKbkxNFyy95qf065tME6iiMrltKzTBxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtWycmG6RSXOaKmQA+LWM8heZyk29b6MH92nf87F3187qW4PlZDPJLjXEj7U86CjXRPtdOxonSDs25KjmjAkU6MagP1+KSh5X9ce52ikyW/yzc9+PzPCjHpuizGi0TxXkdk1/u7jkLTVQiiYZCA0RM0Wb9Mmrc+gvM4v4z9rbPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fSz5qL7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fSz5qL7/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56289FtA025086
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T09UNjHK+2hSBQr84lcaxG3C3fEEMAoZA13KF8lWGN4=; b=fSz5qL7/nS843xYQ
	uDx2PTWKJPw6smYsUPx3m80i/0aeuZrpyAsvYItMkCTCF4o4Jxk9dIAwv7EP2wGJ
	X4tcFn/Xk7ZG5fZPjo642LB64qXKaJBR3hmA3qfI6OpQdgruKNz4AVoMZqx5Q78k
	rwVgGrAHPo7cNSPUf9im5KDg1LRJcIvWOj/sxMn9SxmbhilowaznIZowFrZjTSfI
	Iw33hintisYsniUMth/gN8sbJTFfQUjDGlf7BOfNvroZoYu44jLQfCgLCzkNyPeB
	pIF97fP+FiXI6L/LvgcshD8k2UoesyPIUGxMosX80x6ZCTjWHRXWo3gKnedZxmsv
	NEhi9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j802432u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:17:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2fa1a84568so5127297a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451477; x=1752056277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T09UNjHK+2hSBQr84lcaxG3C3fEEMAoZA13KF8lWGN4=;
        b=xGP3TPonxIpgqzxPjr9uQsnvXfV2ryAsyfzDd8epvCeOmlJoA/LhCAaK7xSFLmkTVd
         oUFMJXe9eJ1ZVH+WCnuzsXDdIzVOyrsg1aCkDQRZr+IJWK4KfRC73yh95yJ5yRKFX8Vr
         HYWXsh1aCtIDeO2utSTHYzG0uz1HKZFiOoYIorizAhTGtUwwH+4p43b1onWeQzZG5lti
         3WS2YjG/UB/Lml/DFKSOqwxKXjIs70YPxKBdkFws9f1IXQLs5/Wrk62eXGVAThmUnwuD
         uN4TthFqwR50AD0z4PDfZ4EvnVKwwttn9rIdqmtUjqPKRqP96lGUA2SmOjXkbCMCjAln
         C3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZKN5ntfd5loTqShWpFWt9dAeUBqoUE34Ra3T0zfaBKbOmdqvSJcierOb8gtw6q22hRnG9U+TOpyvRubM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvoYudAVjb4syByvQx/zpcPdPixnnR5IFV8K4QzTpW8bIuBcJ
	k8k5IjThUkow3xpp8Y7zZXf1VR1dh5oeFmDoQ9doayu7A3m4kvP0zfx95oIewWjLhxwuwBWp3D8
	TGJw2lkS3tLO8mMHxTA/KWA8BDBSDEt/s4JAbGoZUQ5GZJ13CRcrEyyPL/QYAk/we60ryexW4qI
	I=
X-Gm-Gg: ASbGnctwUvDs6updx7ISIsCIMaguy41jgMEzJdfhZ+uQY2FdVSgwo6FRkOdWvlWjuyt
	epv/sL4gM2BaNpVyU29jVcIi0hMcJ+SQSj+wGpOpP9VToWpB+scbecPYtIhyIqYkUu+mxC41xYp
	wSrnGScb1O1ZgDUzWNRC48W5Yuqmy39yPDhIwca6oN9cL2qP0Vv/9UWtZ+QpPiTZos3NbTLKu+s
	ZdYgUzi/A2AESSwM5J57EJggI8WvLIYGYa+2dFZOMe1xblqJSa8ZZ6EU93dm+GCuuOD6jW0S/K8
	2rKtovL5J06oI0H1lnmnfMBO7QjTCDDy4OAFvNz296ZrlvTH04v+CZpRGDSrtup+7OWlBveKu7m
	bwUtIFtO10omQal5WOQ6nKmfUNwsQZeEVbv28D5C4IJaI2fNHi2Qxm/qgpw==
X-Received: by 2002:a05:6a20:3944:b0:215:dacf:5746 with SMTP id adf61e73a8af0-222edc659demr3809118637.19.1751451476645;
        Wed, 02 Jul 2025 03:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyhtoak9EuObS5+zsZc5vBQamU5dSqk6hcFiDb6UWXhvdbnRmO85R7+EK94e0PzBqNb/9RRg==
X-Received: by 2002:a05:6a20:3944:b0:215:dacf:5746 with SMTP id adf61e73a8af0-222edc659demr3809085637.19.1751451476244;
        Wed, 02 Jul 2025 03:17:56 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:55 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:36 +0530
Subject: [PATCH 4/7] arm64: dts: qcom: ipq5018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-4-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1172;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=77ZuaHveNvhSKbkxNFyy95qf065tME6iiMrltKzTBxE=;
 b=KJfuhcl/8ICPaBzaFfh/exbJzfleF8zPULmyFMS2dYsoSw+8BFtFP+sEdgQgTwO6Umy3eTkpC
 8/JauUBdLBRC+s9vu0KxtMM2gJYK11tHkZEn5X4/aoGaEpKLRXeEWEg
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 0pV4ln1HOWBxM90W95kSWAFHfGu6KPPH
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68650756 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LzuAw_qlYXXAwiqMVrUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 0pV4ln1HOWBxM90W95kSWAFHfGu6KPPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX1nWVLCYTk8IH
 MfTY1BWtfL+f8ov/snrCh+Nvdvo+GWkV14KYyeusLU+HkQicy9IZ6JxsQBfyix4nR8XTEAwjj2v
 7r9X0UpkJfCFDBFFYCktr9DT0KY80dsxv0soHu5lCXCc3tnz50z3a/6yzM/OMSi+XO9YGx9egu2
 DFongXID5G6kRl0ZWciDKeQ7Hthx3vPCrHW0Jvl5kjaOvjgxxHuHeIuWN2X6TXXPwQeT1FQTcMd
 LYApazlPNQBnd9ZNLGJcPAe3zoGBJII6CL8KUeuN+OIqpd5593wkTAtofUgC4ymbnBTvN+de0zN
 v1cQ3RodYbfhjXI/j3V5MfcO2rzSCBdDytbD/pVCkeovBrowEOAOV+6e2Wr28SLJzqmhkqcbWwm
 O49X1e98R7c1hd/RBa2EQYDXlyY4qXjYj/ZdBOzCttTz7cA8n2/f4zTnTKPQ9D2mUL68CzA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=767 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 80KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 130360014c5e14c778e348d37e601f60325b0b14..c57d855e373b7cb26a3533f4651df078c1188fd0 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -278,6 +278,15 @@ blsp1_spi1: spi@78b5000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5018-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x14000>;
+			ranges = <0 0x08600000 0x14000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb: usb@8af8800 {
 			compatible = "qcom,ipq5018-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

