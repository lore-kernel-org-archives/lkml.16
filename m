Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D140235360
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745102; cv=none; b=kJI9yT19omyx/yNrc4Z4wM33xPsJ97iCXLx31ugTiTkP165BFgX9+2mv9hCr3udU35Ru7C6aGpnU5KzSb5d4Iq/4quBhKWVYYbhy5SK9PMGa4wWhWkP74VxUDZGmFjMH5VWMTNja21ud6uTZ2yQoccOTCCKNg5Qjygq0C6Yi70Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745102; c=relaxed/simple;
	bh=/g0/ZP4wHtHkgn87d1qyuSHaHZRS6iAOtiw3E5bQBKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MIU8WoMTsOKGbqzOnKYF6xJGFybTrUwsM7pBMNgtZCCdW6TLS7Zda9BFueh9RqYDt6I3kzzlPhmKNeUEInlP4o3e1rblHOYiy6h80ovEzHk1owhi9KQ6NsCr8iC1aDfjK6m6+B+ZVuKjx05qQ9mbBkwsNrjQ7WiWYLz4vMrPs+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqBAxHyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqBAxHyD"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlXjB021092
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=nqBAxHyDFBaUQe7lELFAaV1X57k
	iE3MPmBjSgHZOhVws0HedSNThOc94RrczqMNOIuhdwd7kagpGwcFwAHH7vGMcAih
	NC2JxpwX2Y8fpw+gUeLtSb5XckodLvlB4xd6BDvA7vccfbnYSS+W4O8r4kg7Jbnx
	AQqB0DULZBJja8EvHvxM50WMpurVsl4kFY9zDW8vnGcf0aQ/ScFMnwjqFAsT/IfT
	D9Uy1qzGcN/HEgta/a8i3DCYRzTDG2wpwjXR0Pjx+DOJ50eb6TmFhL3vJ4s5y5S5
	bWL36NN2nF5fIgw5O5SEZ881FFrG+PE5UgxxcUrXHL3jcnjfrxqUez2eYyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfws55b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:04:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce66d7cso64064785ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745098; x=1751349898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=sdLdEKffssoI9EkogtR7AHT+EuSCN85+JL5s1Bg9rQCT5VNP7bxjD48HB/kuZrDupa
         sXn73mmuozutQQJsSH8hpTWy1csXgqvYW0C/XzRREg+qJEDXoaSIaGA4p7MuNguLH/1s
         A/gIVR15rf/tJZvmm/B6spS9nYHKiwrCbOO+U5D1kbe94CZfugtLrrOzvcJQ9Z+omT6j
         5M5FAPigKQzzEmuQUrhBW+O9mMhOCJkyFDlyWXTksu1g9FUcakSzwRWo6bHpAYWWl7g6
         WFBjmqz8e5+eiaAg7afvYQYsrW5lwYvIZJ7JUiQbNJvJefVmOQee765u/NqT35Yac5VO
         0anw==
X-Forwarded-Encrypted: i=1; AJvYcCUO7dRQwexPcKZQDV7qBMlHwDUIC1rc8DFqhxfNg9Pn3zF6pTaeMkvGcHYSkm/jhCHlKOQkbTDuLLTJ428=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0epO20q0ujOoT6Na4DkgoOfIhodcBxnsNwyIECnKo5RPAHq4s
	x2PMLatzNPXFwlsEZ/IcZKeIZMmRf/oDWHSRNjZ5YoLSKav9DRwacPiPkJUmVEY3WyDVMur8vau
	nQZVBCHVeQNAaptyR93a0LbHP3TynpocfzolyJ/R/oNPJGz+Ipa31zYm6WOlPa/aoJRU=
X-Gm-Gg: ASbGncsLjU5SY1EFEabn6bqC5W1/+U6vuDzn9Mz+xEVCDpLpC+KCkg4kOA+146C5qo8
	Yg9aHdSVsLjEjbDH/ILP4q7PN6khHUGuIYPWoD6cs3itD6SIxLPJKC+D2CVCrW6EsrpcbnnFTUn
	7ziVTJd8BWnkgcVjECR9OzdYMGLfMYb0+RteairnrhAYF9ry4+/sAFiUMqjoqztcJt2Jnt3gatR
	AtBXkGSVsSmk3kE/dkyFa1y5TcwXmwBU0Rvz4hftqApnVsSz9ctp5IEmn08IJXai4sDivCqIQCw
	D8rfhy4q38liZMsvNhDGG94vbdViUIAJvNB89Z/HW+DAkRCjKo8kalzQhU2fDpFCxxjWpgRUcim
	wMw==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr276912195ad.16.1750745097815;
        Mon, 23 Jun 2025 23:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkSv1e6yZscpoifQQotP3Hcj8oMsbM5jLX5umPQVB1S7t8NeSUBaboum0YltNjUtaGRZQVxQ==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr276911685ad.16.1750745097450;
        Mon, 23 Jun 2025 23:04:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/10] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Tue, 24 Jun 2025 14:04:31 +0800
Message-Id: <20250624060438.7469-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WaZsPnjqIpog2Tb1twsY0qn5v8Sr4fuQ
X-Proofpoint-ORIG-GUID: WaZsPnjqIpog2Tb1twsY0qn5v8Sr4fuQ
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685a400b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfXx3GiHTp1UfdC
 yJVLqHWgcglZkeqvQ6hlshEVJu2Xqe7+IhRnx62qOevPYyswI8ZIVdkJEbFjO/fCCJzcdJ0WiIr
 fbACA9ly4LqIFuMPth/JoS5pjxYyjaHsNJOeRbQRwiSwoiFXdpdiGlpUTZdnfp8xacM/GJGD2pa
 tKSelwgxcZaYr+e2EXdku01TMUEN6VZ73qziuPcUN/Zn1DlLjBNQ3yrqpvM/FIuO9DedMA/Wg/e
 zL/PtmH9uoIGBOsSbDsqNBcBXAn5atgyrh7I2pyUZP70+0pfB4w2CdNZFp4y8v+CqIveaV2VUqQ
 xbXxiSBulki8YKq9gVWDROj8ZvkgrOuSJW5LP2ODZmV1Cr1TNxgL+S9i3kOijklpP/JxgL/fl0O
 qxgjmpWNeAg+HagAPElcGJIoS0Ofd/WjCQkx5UXEKQdjCh0OuA6/7Fmv4vTmhXk7ndzh1syg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1

