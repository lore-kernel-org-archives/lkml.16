Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A032609E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451490; cv=none; b=LLtYb5iMK4bUpGAmnHHVSzqSUE7h9GrYBP8v20GdPf5BOm3PDevl/ATFhwonbO8QT4Ugi68CaUjuCejcl0Q3a9rQe76wYQ2YT4Hpx1RfgKh7HryruzNlH6HWIz+joV1P/7fG7J2iyB4veLsv4sp0ZOYhxRUf9wA+IWQRiRg+aUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451490; c=relaxed/simple;
	bh=wQhsflpGUJsF+aNy/iW2kaaJ5se0e5REu9ZJGt4Bxr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEi9aAp7SElaIAvRAQs0132gyoPmFBw9oIZDnGS1ymfXYzaI8+r2d0TuyOwteb0K/4ip5O1gWXY7p9ypnXEASa5V36A51K7G6xIIzajNuKUCMEcqbYstEW0tHvywop4F0DSWYLxIbRpY0CdyuPhH395uYEwCmRcyqo0vxNImEL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQEIm0Ig; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQEIm0Ig"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AG8FV022671
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTRlJy5AluWIif9amlNmxw6fYDtyppKSnmMprtqf4AU=; b=GQEIm0IgtuBprJEQ
	JFmCsA8OA0XaxjzaT/6iKGDQ85eDaG2r/W65EbWw4SD1nrFIyDnNb7zqk+K1wVWs
	tVqUL37HqmtJON9+xL0YuhskbsUq+yv/0hP611N/9tksMNj44CgoTctxOFaRlfOv
	ZsDJo5VB7Q/d4jOA897+gkU6elWRuwfauXIuiw3wZAUXhhzQvNRKmqnaYwPYebch
	+oBLPSBkoWpKWNeOTB/j4DaS/FdJZMruuVTaRaf4AaccMRgueE8EXetnW/qDkVy6
	h97Zl2R/w3PZpyyItp7NqC7ZnEG/qh+l8ASLaNpe5U+JpNG/mYy2Yd7x5AkUX0wy
	iCvxcQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn2w6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:18:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ad608d60aso4037650b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451486; x=1752056286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTRlJy5AluWIif9amlNmxw6fYDtyppKSnmMprtqf4AU=;
        b=d6UEmB9JK0fPqWGxsB3mSjTEqauOkMh9vocpEFiFkpc/JbvQo0CkiK7yI3Qyzeykc9
         m12agCKI3AFv1qaOMKN/k4WgOUB0Y0Taj9Cu+4ChTLxgr4syc/sjTH5Gbv6eG5TQ883h
         No+IzNTKTljB67efc6XpFI/kF6poTBZuw9pF8EMvswlR/2aeSl0o013RbjELTX5zfcE7
         QTx+2Ur0r/p1MyD75XvSTNpc2Q816e4YJ7mh6xm4VZrfMaX357AFa3EtlQ8MKD7qQEnJ
         zYaezFslxA7+sZjckSptFgT+Z6xZ9YpXKtQGYLKWsWcwwq3TkI/bgCEi+L9xUXCxOGRJ
         8Phw==
X-Forwarded-Encrypted: i=1; AJvYcCUr3Nlq26rXpADSZc5KB4HDd1doTOM9S96eRmjq9BGxVHvhD+n/1fiqSpoh2kXrA1ugrsF2jv+HJ0J3dsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1yNKwwikvQgseHpAGCviYHOPhN3G+0pEUm6rzg9stGUfu0b81
	BfTyT7HZ3jh/D0AxLJ5Yzr/5saGx5QEwIlE4v8t9gun63xlUjT9rfcA9jCFiIjlMRt39e6Ku7vv
	BMreh/TLp+nU3oo9Ey8LiqGWyfqpM5I6n/dWmcp8jXxR8bqQHpRz9LRRHCN4tx0iLHE8=
X-Gm-Gg: ASbGnctAP3aG4jWYcYqX3zY/OvrLJ1euMaTfEAXwpZVsmXZ70Rjob7gCqs/Pn+XnSJs
	JlETT0Hu92gKRpyr56IQGngQIVbWqLtY7Tx/pLustZ0J4h6FYczif96kmLInaIiS1HkbLOpWn64
	Nw97GawDgMymHIJn3keCDsFP22a7ibL1enYA+w/EykMuo9mris+BUmUrjI7oEHmvtCT6lmouMWi
	D60xDhTysdm5YwHz/oykDWMFxoilBvkU/C0+KbBKCrD2E3HLoREoSmenZusdaTXM+SFGE0cpiMO
	YhLUr4S8jtqEGTfewAAiJrAl8ctQkF5QHj2DKRgEgcp3VK0n7ZSR2cG1RxIsrU7oNyYmm78QX4X
	h7TZ+kPG0Y1hxcjZjwf+wgED6JI+Tkk8wiH1ozDlFYB3d8Ng5qsUEGweBKA==
X-Received: by 2002:a05:6a00:2e23:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-74b50ff2460mr2719918b3a.11.1751451486496;
        Wed, 02 Jul 2025 03:18:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMQEdvSXHqqhuaPgtstQB18HJ3z9tqef/wqhHRt/9fj8UJtu6zQxc7Ajq9lHSgUS46mwo1w==
X-Received: by 2002:a05:6a00:2e23:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-74b50ff2460mr2719897b3a.11.1751451486133;
        Wed, 02 Jul 2025 03:18:06 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:18:05 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:39 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-7-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1241;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wQhsflpGUJsF+aNy/iW2kaaJ5se0e5REu9ZJGt4Bxr4=;
 b=dlEJCwIp++OqsutI9yPrAT1bCt3t/bafD3CsMNbdS9MjMOUztfbCvJHjqTDengumkaXwyejs3
 SrB/oBcCpR4AVsG2FLFkPpnOAQfNpJwojGRJdukN6NKJexJ4ydDezYr
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX5I9LLwYnohlH
 IjYtlVBn76jFH4eEXBgDPu0qe9RUTn2wFSHPg4C+MzR6Xj4TmE8TCvtUFoKKfIRtbz73HlmxMAd
 BjSuvxsWAjdV9mE8oOeYbL+JDgoqnzD9hSRFRARKGV+4kda1/tStZ4eqOATG/4gnIpLAxsRoN2g
 uCdF1tJcceTjQ+UeHqktsgvrMYrx4jzZ7UsCuQ47xaGWuwQY+5yDX6etktOgpfBjNjTRN97HAB+
 /1fWd2MkCQ3DZ+iUk+ZGJUj877gimXF7Z+SY/JsoP7JbHRhRPvGdv5ZkHoYm8xSAyoAwCAYMhSQ
 TmFXQAvNwygVemKCkljw/gWesctgBggNwxQRV9O2Y5Ljtde5bt59duCwpkMNTe/6hX26du6FwQx
 TSarqCHrLsxSs+HnG+Lp/Nhyftahfa2yv+yniLwv5koGxCAvUniGRs1aogd9t4tQRgRGvni3
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865075f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lg4m642HZgdeJmb-uEy3WS2yoAyKrNoj
X-Proofpoint-GUID: lg4m642HZgdeJmb-uEy3WS2yoAyKrNoj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=829 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
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

