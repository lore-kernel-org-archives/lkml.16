Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997B82D59EB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646724; cv=none; b=pKkEhMyMzJtQBfoEpw2EpFVoiOL6cdD3UNbBDpip1nSf4nlgEVZgZZZFzLW/tYc9iQj+Qag301CGtujblfOuPu3znv+LR/mdWjJdf1ss5eOZJUTd7KXnOu7KDmCv2Ivj3kJ+eOR7G853RFUK3joLRpc1QQoUhQ+SVWuOlWa5Dng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646724; c=relaxed/simple;
	bh=LdPFH6oRbQYmT9cq0Y/hHQSHOp9Z0VRztyZKZ01w694=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTET46OmZ5pA5jxEIK7eVWYIBb1wKFYWU2JzKf6geoDhJP367UJ5dK0pSR9EqO732c7wqH2iu1A3PGx07P+LvXjhkmdnOjgX8RCVexcNIEGQs6DJIR3sBuYcB5oneY1QUbdQh6NlO4QDJ7HAer48I21wo6O/ZKRYcU45NgwGGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0IVnfMw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0IVnfMw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CjKA9007047
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CA4cR3EPt0ZKpDXPz76t1inkPsQdE85Hlallld4sOBE=; b=e0IVnfMwi4vHGSyF
	4tprmXwvmhnaLBzF8lnDm7Ank5+Z6eaQvXV82lDs0fKv8O2zET068/ttmg3P2cx4
	MPEX3f1G+RdabbDtvVlAzn9xK+D0y4piJZokwZga3KUifq7T0f0oyg6fJMmhsMxY
	YCpsUJ1DdwAO1gNyNCP+P0sgBMwoosBGRviMIlxDkE3wMLkB/GQhjLyXCcufsVIb
	M2kvg91sz39aZGmjXhXnWiQQsGU5ynpF4uxx28aDQWSb8Fl/aVZQEIyW91QME501
	9P5I/IPq3lGvhsv2lkAVtBchEi8qU1DB0Vuzt6ug1FqzRAXppym6LCnMz1x2v+rT
	skuHyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5js19b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:32:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso162172385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646720; x=1752251520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CA4cR3EPt0ZKpDXPz76t1inkPsQdE85Hlallld4sOBE=;
        b=Ujlt/tFCvSyHvKgzwHPtduEzy9MrTDKKd0KmKl3s/0Po5EldQrZKCaGpdNAS9hS1OC
         Nq4u+N9k72+gB/8jYl497W5437y3n+vMu0UaBlRInI4glgwNleZAXyjHqodbR+25vDTm
         FfButfaUhviCncD911AWyrFCl/0JH6kIqS19jxweKLeqN18M7KYpeYxc6bLG1KFNlSoi
         U0egSvt2FmuatO7obR1/wmk8/ngtE61TE/u1k6CKBPzENj9p1jlgK/KjyJp7mKJsOrED
         Y6ROqvZTQ/33IhHlpYwyzIr8KRptJKSMS6bW2+BbPfYJYRs32Ys4z1wTV6o/fO4hHJnb
         x4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWETDwn+HIZCUJPGRYhYdi8sKmoIP+ewiIGAH1nR2NSEFWMWyEEYvsQb4hRvE6b50IQC46AdL0xDY9IaQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ0NyxrFEuXgpRd6mEUribj6IZxgtyZFLtc4WH4vLmWZEMSIrw
	3OSMZx9Arf9u4x/4qI3mIEjOY9eUtjFdP+GoZRXb3vGRWryQMm/Wt5/b74Wl6zQxR8k7QKSMS0P
	rmioI74+fh676I5ZpPqqTprj0Fl8JpahJcWQiTJcU1AxS+VlXIRa4q5CWr8KcCAUMrAw=
X-Gm-Gg: ASbGncsUBp1l7GKikYrRDy/rrzVKnMxWikaEFQxYIXEJiwo/im+sBG/uPJYTjfm1ylE
	PYiQIdgI5ueWlPkmZwYoh0YZ1XHS+RTNVlkUHdvIrBwVS5PRQNlVQChArJ9tMYa7CHOZkgaIisC
	fwvkf0Dgu/EzYkEpag1KNH3WQoKf6WNJeaLBbFgMuhNF1/Z5EbIEfVBrOXu05Off3wIfAHIYacs
	w6H0o5J741DjX4ryCQT/5jPB/i57zWVb5wkTUvvHdN1eqvx8/1hKCCGegXJf+dTub2b+2JRRwr2
	1zLloBNtwE4OtAp4KzFJZK/dsXl6pd/wP4bP9SWrs6NJUoo89qmJiUlu6WAgF86oC8gi4keOa8H
	D4ZmhmbAuwhR7t4uXdzZ6CjH6SW88ZEUGPLs=
X-Received: by 2002:a05:620a:4553:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d5dcd4048bmr562638785a.53.1751646720146;
        Fri, 04 Jul 2025 09:32:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr3+g6l0u0WyfYKx74vE0m1HBQS0pRyhe4KErDw8IpkZJfjmohlKg+ZO0KDPYK/r6AiAHRXw==
X-Received: by 2002:a05:620a:4553:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d5dcd4048bmr562631885a.53.1751646719489;
        Fri, 04 Jul 2025 09:31:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:54 +0300
Subject: [PATCH 2/4] dt-bindings: display/msm: describe DPU on SC8180X
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-2-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LdPFH6oRbQYmT9cq0Y/hHQSHOp9Z0VRztyZKZ01w694=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH6nnSALyAuxHSso/6VMpuKfgpAStkiLnufr
 MDtUiOt/YGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+gAKCRCLPIo+Aiko
 1bkWB/9UNkOrPbaYrvefY+V+F6irbPlq67sccAvejlrV8j2Mb88fT40wYeT7W9kBfH5Q5H/zeeQ
 tTyZjZiZoO9n9j33gJvEuIdF7w6FW+Ig6A4VDoeIfR7ANqfqAx4lG6qcQI+Pm/pKF//LSSYtKrp
 mj+NVmr40rTTyAgnf2t7wWtFHBw9kzJcSIVzF6X2qtw07L6F7kT5gE5VDsw7iQjP9YgPFFggKGv
 Tv2z25esKQwQWn6VC0V/SW3xT8AIPik6P9teglDVl9WBmNepe+ZZAipmQBe+BsuY+74ea55lXkb
 MCHJYpQoyXr4xOYl16wxxOTukOyvw0JbaTFA13Z/QKe92m9c
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68680201 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=PRzSAg5HSsxOSwAYWMMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UKyWCNVlrOfW45f-6E-ZcEjzGI_S1wdt
X-Proofpoint-GUID: UKyWCNVlrOfW45f-6E-ZcEjzGI_S1wdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX0b4/4ZJn+6Mq
 RuuU4cQvwkis5VpT+xBWsrShBgaxDM9r1h9K35VDf1hoT8TYZpT7jgAcx1cr3Wl7xtqQ6HLI4Sv
 QaZ+fA4kYNWkVzrI66jBLMFGaiaTKBGa7vkXHMxpx71KutsaHk5LTivh4qwHvOlskJPhFsWZIZs
 DmF1UNkJ7Por6dCt4MbzMBunalDzmz3PdQ8T2KVlXHWtni1Kt6U+hGWKZfygpVT/z+7jtjJ9hDc
 +9D/b9TMBK276wMifB/gmjPn/C8CBTGeO87/uwj83um2qP4SxQrv3+j6tkP2KO7DRgY5jqW4/qf
 dkWrf0BpoXTymT+l1ir9JVH08nz/jWxTEemdF2LYP2OJRFcBIfwZ+s2mhF1CJCBNIpZCXhXs3Ui
 NkMPvuoQpC0ngUO6yCJvqAwqomodfK13uPiHJrD9G2aQkVmeS/So3ESmIVjEb0IpmhZ9/Oo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040125

Describe the Display Processing Unit (DPU) as present on the SC8180X
platform.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a411126708b80f77bde88d7dd1ed49184856969c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc8180x-dpu.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC8180X Display DPU
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+$ref: /schemas/display/msm/dpu-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sc8180x-dpu
+
+  reg:
+    items:
+      - description: Address offset and size for mdp register set
+      - description: Address offset and size for vbif register set
+
+  reg-names:
+    items:
+      - const: mdp
+      - const: vbif
+
+  clocks:
+    items:
+      - description: Display AHB clock
+      - description: Display HF AXI clock
+      - description: Display core clock
+      - description: Display vsync clock
+      - description: Display rotator clock
+      - description: Display LUT clock
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: core
+      - const: vsync
+      - const: rot
+      - const: lut
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sc8180x.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    display-controller@ae01000 {
+        compatible = "qcom,sc8180x-dpu";
+        reg = <0x0ae01000 0x8f000>,
+              <0x0aeb0000 0x2008>;
+        reg-names = "mdp", "vbif";
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&gcc GCC_DISP_HF_AXI_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+                 <&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+                 <&dispcc DISP_CC_MDSS_ROT_CLK>,
+                 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>;
+        clock-names = "iface",
+                      "bus",
+                      "core",
+                      "vsync",
+                      "rot",
+                      "lut";
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+        assigned-clock-rates = <19200000>;
+
+        operating-points-v2 = <&mdp_opp_table>;
+        power-domains = <&rpmhpd SC8180X_MMCX>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                endpoint {
+                    remote-endpoint = <&dsi0_in>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&dsi1_in>;
+                };
+            };
+        };
+    };
+...

-- 
2.39.5

