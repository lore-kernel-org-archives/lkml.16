Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10242594BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451477; cv=none; b=FFqhLUmHCW0VXQhJZ+PvJ72F9BeFIvFdtnZKubX9CKFUHcbuVWnovk8P+I1wneNm9gYXQJ7UrrHpH8JppqoZ8eokgZxrz+NmE0t130nCaD50I+RGzP8W39F223v9ei0ky0bFUW60bZkA1aK8E29+7sWPOLQzehWK0gXZhoVpTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451477; c=relaxed/simple;
	bh=xzzMzwUChajbRnqt6sZCtMpudF62NJzRt4P4qkk4IBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUZzhagec4sdowVdXyLtVE+lONDJN7/Hn21pTYLOMdrKi0vW3S3+ZecuAak1dNRWrVxRsfPWdzkvXiMzHJLuU7zQT7V1+muGkZDWeqOGiJqfOei3wfnyIBouNwO2RZlmB9AqNEwQRgnNFxRQX6Q7dfPu0BZQmIXdnCO3RNQ3VtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eHnbDhhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eHnbDhhe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626tTTB025164
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5iIorz+E6POrscHAc8h3CoMG34cykm17D1uNtyhLRk=; b=eHnbDhhe0HEYTrqm
	bvcLHr91PmvrxdbzcJ6SjrL94ulTpzyRhhJzUaS+9qqg7c1EBs4d09/8CtAxPVc8
	cH9kpoM3Wayer6daAcIH1+mIhFk07ylN7xxcG4u+sPB73nIQm+ayQX7rNBJ6WPTF
	iEIluAyOv/jKTdqjnGJciNE//2qXJM3xCufTW4cUjZjTEMGgRbj4cyP8KgNxqRZk
	PciVaox5nNJeUJa0C0J6bbXu5aqzkP+H0wAkJD9zERj1LYBmzlthkWGhjm2Dcs4G
	gzIhU5IKPSWIONAZb6fe9vh4iupyDs2gmdELwW9uIyD8PxUL81B/Rtey9HS2F8IP
	Qd+8hQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64sdu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:17:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748efefedb5so673274b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451473; x=1752056273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5iIorz+E6POrscHAc8h3CoMG34cykm17D1uNtyhLRk=;
        b=Ji0FMnYU4cIZtsOaOepSb3yvBELYkWkwciVsc7ZscDpJK39cSpvjp0gdPtj1XLUPOG
         qYQaLKAeLKszU6Myfa8MNPQtVQk91YfSkGRlue9hV92IKjWFUdbZK8H1JfDjbWevl3NK
         qqtdgM96enbgNZz1yGLn+wYuyuYvnQKKJwLYPYH5+KMJ2qtRZ6CMl34hilg4Ef47oOuh
         immgr7ZZdniohR5F2f9cn6NF7N1vFoL8X/qUFLR2PqTsYjCSRfTF0y/4qZ32jwqr3Xme
         mpJbCm/RKZOFt+Hfy6li8DuUzx+RQrcm0ncHvc+XtaIpmGfMUyFIkf7YhYvf4hHsSgVT
         hhlw==
X-Forwarded-Encrypted: i=1; AJvYcCXXPRMJ4McPkHaxLQ4FchZBCVb5rbpC8CiiC3wF9QrD2BQlHzMpX4kh2dUA1sm0ZIrO/W/Ax/1T/NUnR3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRVlF848oZ+CiPdIOJklDYjNzhtOREtPpEOo9AnCv4qpDxyUH
	v3xoPxptzWaJcK888HoqfgYZLTPzHMTp8qwQywXtdJ/XdwfLUH90n8BCn3s4nanvfWuKZ5O4MiO
	ZWimn/XEA1ucvBPHbEtCcD5rUcPckeVxr7Im0B6SwGaKSOXXdTBRnRkFxXVJzQvFqj28=
X-Gm-Gg: ASbGncucjLKCft++oQdcZbnaH58Vnz0cFhd2haOBsLMHwrW9+lrZTMfWgJmkwC341X2
	H7YWqnQoNpKyRsMtwodBsHQDKZRyCQ8GpLI/xJbLMxcsnV7xYqFlFlnp9F2PLQlDCQfQ/oSA+rL
	VsdiwN+UI9jmaJKbg59hU6FWkAJGPKye82RKHJ9m+7/DP07Y9V5Xc80aOPxGRjShBdo04l99af8
	tV6ZQKWleOmG9FsUrOkfq5vB8Y2YwJEABm5N7O0I8Nx+C+ylPiVgFxd+crYy5rxE58wmPDM8JPy
	4pCgqFuu/dWEkSmwB7GL/UPi0osv+3jSpvFQh3ZyJswNEMXruAwl+DxhCPBut250yUYiL+FURa2
	9xHosHOWXeKo9Dv7iSzHKL2pwg+SD19LszcssSBLFKHhQm15LgTG2lv7hmw==
X-Received: by 2002:a05:6a00:1821:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74b50e698f8mr2908583b3a.5.1751451473471;
        Wed, 02 Jul 2025 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKCfh4xLcTR3PAnV1X3SJoB5NqIRJ+ET8NtGT7a1A8+qckiXtJhR1Gj7PXwK9Vi2UWumM5ow==
X-Received: by 2002:a05:6a00:1821:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-74b50e698f8mr2908555b3a.5.1751451473047;
        Wed, 02 Jul 2025 03:17:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:35 +0530
Subject: [PATCH 3/7] arm64: dts: qcom: ipq6018: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-3-12d49b1ceff0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1210;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=xzzMzwUChajbRnqt6sZCtMpudF62NJzRt4P4qkk4IBc=;
 b=1j30y1CTb0BZgw0Xpu03TDce9YqyEJhLjbS6+OLhL7ASxY+nGNdRennrian6oAw4WtdtG0/zt
 WqeLsFyACysBDDKxL0Hu7X5rtuf9x4kpXfT16mfb9S/LctrLKRg9h1Y
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68650752 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kuyrhOGAXNEpbtS0LE4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX8310PqYss0e8
 nOoNvO4phb58B0Vsql35jjU5SbePkLAn5c1XHR8KmCIVA39cGRV4qEUvaysIR2eJnURhksKF90/
 lV8PQ1lOAdf3Cb40+2K9d8jhQfmy2pBfkO4UAJHvPrTORKb3S+l4iYOFWPLjoGJTQLuBRnJwKxZ
 /Uv6yvXGWbz80O6ZMxFKJ6AB0YSuYxGP1WPfHWq3hJC22HjV8/TPgZ1MqE8jyFwpYi7xiEPfSzf
 R/ZQB8/7RipLzu0jOowKvVwdQ4HbBophRhBZP+Lk6whQVxdNfSmDFGhIviMYkrX4DCjH67YUEQP
 DIY6ndMsOwXzeqoa55lqJV8OVJPlCa3rePAYMiN3xOJV3vL4lv2/KVQKu0JFa1tlf2KPagdkrNZ
 5aomoRUptNE/rViHdsQT63uofLfJe4vhPhJYcCBYmL7U1SVMOI7tKiKZ894fFxA1h4KYF9oL
X-Proofpoint-GUID: N1NgKBzX19FJ61s-DtaIf_Gsej-NrhSw
X-Proofpoint-ORIG-GUID: N1NgKBzX19FJ61s-DtaIf_Gsej-NrhSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=714
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is approximately 32KB but only initial
4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index bfe59b0208415902c69fd0c0c7565d97997d4207..7eca5ba416c2ef5ef1c4e0eb4f58f1ca94fc92f0 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -659,6 +659,15 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq6018-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x7fff>;
+			ranges = <0 0 0x08600000 0x7fff>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
 			reg = <0x0 0x08af8800 0x0 0x400>;

-- 
2.34.1

