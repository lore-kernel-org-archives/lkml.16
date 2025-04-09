Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49D2777E7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220914; cv=none; b=ZNjOZrepZLDqGw533kIZw3ZCqrw/FRujEwkcZnyCexu52P59EYRzsbzHl6PzaATY9CwehJcEerZUFQp+DWIert2p1LRoAGfDYRl93w6IWWY1FP2Kh2NqRK5XIwcCq7PH1srUl6O2IRskZygViH/tRcSz0zpeeZ23wiw5SsOPErY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220914; c=relaxed/simple;
	bh=8CUUeLp6Hb7dKQ0Qrcq7uOUmNoB3d2/+coS+/Ely/tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cEYbnW0Kq2uetUN61FJQ5MmGZXjOnk3I8YRi0qxD4QbzIpTk+Tl0OfhaGI/30wm2FfYE0Sac7xPm7NI6jJSwLYu1iFOQTLVmKb811nuoILuMKuiYF2S6Lf+wDR6DHXSK8LW+PAhFw9Rjq52v/dTy8amMhk8QTBTNNur8Ma2zWuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIsm59PY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIsm59PY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Hdiwe024294
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 17:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwC1MXd1DUxzL/Pd3IiGa72EeBbd5SeSmY7qcx7CvjY=; b=lIsm59PY6Zgcd7PK
	8K7wwJoZmWhKeqosXjED+afh//KKyPbKLmLZ1YvyatEUznZ5IphtRe/pfkfnuC2A
	dKlw80/Wo0dZ+eWZH7ofPoGge3/xuHoz6yB9TbhvxmgcBp1+3WYAQCPjgZOPZQvr
	t6j0jNKCGc6oL5eB/tArr6ClM03LBoXBUAUhdBS5BDqc0F33T2BXjE/7nAelLlWr
	qogaVyhMRVz4IFxtidwrzAJq9M2Ojua8N+/xo+jWR6nmVvQArzD6sD4V5GPMdnC+
	/6fJ+pkWOs5mc1ilvP7ZtN4skHRpE8QDtbfXJYd37+jPcnoa1EzF01DdaTJxonya
	V4g/pg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkm557-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 17:48:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-227a8cdd272so61729555ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220910; x=1744825710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwC1MXd1DUxzL/Pd3IiGa72EeBbd5SeSmY7qcx7CvjY=;
        b=Ou5+XxNGkGYUMQhJqMVP3qP6NaGszOkzoehUqL/pq6WOXoOhBK03Kt8F239SKB841g
         aSwyY1QHc2+XBeEtuiESeupjqZwL0vhqadfT+Q3VaiuPvorWaJjeOq6hjIy+JBde9Jjv
         s/+n3HCmwW5bz1cXWj5O5lM5GEpByLV//SZpD4aJQQBdVvB8rQIMGESXFI7rhhpiFo36
         x1R5SKi9nj2rs85xSZrC06Rv3t6UTPu4Uc5lzWRbueloTaZN/S0Hpg4CiSrC3zjCMr4W
         IjaMmZ33o3NniizyBDqR7KQzUfEzct9qeyp0o3DkSNhI4iCaaPfr6O3FFwOB/i6VDwCW
         1pEA==
X-Forwarded-Encrypted: i=1; AJvYcCUmHi03MwFBME12raq2e3QVGUNr5Pf3LoeEgSYy0+9X1scJJAEGceqvS8x3Wcig/fKVtiaHys93HhevqdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNphLEKNPu5f1ePOIusHQzyqxPTnEWPFo2mgMzlPWhrvUnKLa
	dCUX7hcNeBaCLlTaxYRx9bY3Xd4hRtpyz0KWhB/hqea9QolGK8y1mL9jGKjZZZnYgrKWpITLesR
	Mp1OyuO56oI8C10iDyeTH0dIN4UyPpMd+tUzVC4iCHIdg32r+awxL7+ahvFc/ja8=
X-Gm-Gg: ASbGncs5XZZ8gbjIrUcAzRxUo7sE8giNGG4oHZHhZkovbGVR2P3tjKTB2s7sxNDIGv5
	3pyLFiDI2g9WUFQHKT6YSQ3aXyC8hhnNhE+1zX23BX2NY+WJqfB7PcrJ59jQflZGzPmf4u6N20B
	YflADmegqrdwPZ1O2XDmvn0Xbij77Ljs61VpG13EzBWrEMI8SXxcaFnN4ZzLjZPS0VcKJNLbzMx
	mHpkZO0PQDbgBM29TUKGxH3ZsUq1htoOsnAtO+bEMW8iKlXnQpk376hsOHf8IOI+HqT49mcN6Kv
	Kw6gKDM3sHxtZsZALeUxBkPy95eHA7BgTy2+hDDxH/imjPWUlcprx1NtBP+3JYsFYzo=
X-Received: by 2002:a17:902:ebcb:b0:224:912:153 with SMTP id d9443c01a7336-22ac3f2ea53mr53159295ad.5.1744220910053;
        Wed, 09 Apr 2025 10:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/HnVi786AZiTfGfIZDyZj81/oJeBPPJ71p/LCI5NAQgVjf3mOZuLT+HN9A8Iv/W8Luyl3CA==
X-Received: by 2002:a17:902:ebcb:b0:224:912:153 with SMTP id d9443c01a7336-22ac3f2ea53mr53158875ad.5.1744220909683;
        Wed, 09 Apr 2025 10:48:29 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:29 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:14 -0700
Subject: [PATCH v4 03/10] dt-bindings: usb: qcom,dwc3: Add SM8750
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-3-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1631;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=1Rnys225KK//uVf3TafT/6cgisRuKq1AQ6Bq1g6QnEc=;
 b=ftLP9I1pGcsIdnSe3GtGTUYNbqyLSqb2GgE1fxbjOR9dHurF7yavFOUcdfCgngmGB9tr1cdQR
 BdNrZVNjZO1ApuBapxVg8NZlMpanGCwyt841y6kFWwKtTdcJTxLAGCX
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: UXFRxIRbKuERjyK-u_ovQMqjqM6hLi2R
X-Proofpoint-ORIG-GUID: UXFRxIRbKuERjyK-u_ovQMqjqM6hLi2R
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f6b2ef cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nqcDc_6wAsSP5qgj5vEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=838 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116

From: Wesley Cheng <quic_wcheng@quicinc.com>

SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
to utilize the DWC3 QCOM and DWC3 core framework.  Other than a revision
bump to DWC3 controller rev2.00a, the controller on SM8750 does not add any
additional vendor specific features compared to previous chipsets.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 64137c1619a635a5a4f96fc49bd75c5fb757febb..a681208616f3a260086cff5a28dc23d35bd96f9a 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
+          - qcom,sm8750-dwc3
           - qcom,x1e80100-dwc3
           - qcom,x1e80100-dwc3-mp
       - const: qcom,dwc3
@@ -354,6 +355,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -497,6 +499,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         interrupts:

-- 
2.48.1

