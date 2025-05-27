Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC167211299
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379900; cv=none; b=hCDnOvJMcsbrzovgVRfwaMP8DR7Xdatw2BWuDJBr0Bt8BOv19Qlq3b8hBAPSgqgACce7n2nxpUXAoJ5kn9o9w+Xoe7PkY91+BXdKWoKTBAZmwVunLKaez9T+qt2iTjDg+Puv3Zhl6F0BviYQANCb2PvDPN+gCL4MennlKaCaC7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379900; c=relaxed/simple;
	bh=Fz5Xv5kyUKBPX7FBV3s+Hc184GjMe84b+FHiXhLBQqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fe5fl9xvHLwCcpfwyWwChKr7UhjppvaePuzRpCjrb6yxzP0dx7Pi/L8FYbvoBpG6uRrYoTgCMe0OlopqOU56vP7APwADD/snrHOpyJ4AfXZTuo2x0NeI5/Q0lqkkuSjc79eg/DHnN6iIO/k8Ctz+CBNbYpi9i1EW85/fxKq2KCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMjK2La9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMjK2La9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFW31a027799
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=BMjK2La916AdOnI6
	lzQQ9SL18WKflK2peCZr8vrC450kRR5I8FDfuL5Pj+GkL8I7Rv9a4P9kDncVKXhM
	dWm826x6Vj4bcq8rJ2bV9duZRQgUoldLVYjQynNoMSbwgmNJJeH4q1yheR54s7b1
	gzHijNHQ1PRSzblnFIb4/kwrupmvXYlEM/+24dkqiwpP2qNr6ImaW/4ktiQy++Nx
	mf6wwLjaOEgMW91/Q00xJNjTfVf0pF67dS3gM5LD+d6DSLYPhgVwM5aGqTE/Iq9v
	7F+Sp+WNciE5LGqCLXJkGJLP2236iK7u0V5yI1+5qszTY8ckSDbZK2z7omAn4Kno
	w2EInQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992j8ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:04:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7401179b06fso3047143b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379897; x=1748984697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=u8Hnw+9yozvwP6nRcmcrgvLnxXHTmh2LwlB7HkELxMZv0ewN73K5t1Py3msGiEqIdD
         o80k+h6u6b3O81Y6uJuA8ThsXwYii9PosPUn4F7FaCq3SEHX5ha+d8OMy0DYoPQk0snV
         8iehLSaAY9ZsQtZp0kWRb4DcGfAZWJzf5fbWYtqZ5C2cexDXzW6Qe2tlZ8iM3DnJn2f2
         FCBN3f7YJURLXkkOgQWaMpbF+uYLKizzbYzFh3kXXUunxRn8ViclgGfw9q4lqCdD5Ug5
         /ylQn+V3mXZu9rAfcM3jomJCK8xZfhu0o9fBnWDwkVetyns5QwPzrRDj0M+qzDQKFqno
         vAWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzMZmzaMAWcZIE2hgsuuzawV+ND4dWgr4jYhkxHOUFYkYfBOsMv/rFo6B2dHSrjfS7rmy3somgPiDaf3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHLCdjZsXYd0//WXTWXy3JI39vaF7mngduWoTna4/WTfzT6vV
	qVDHLFmY2+RaLaTmKixb6mJwVF+hs5MkQG2xOvdddiexw94jOJGsLMpu+ypdiZ0v5A0DI21IAGj
	VhDGtSt5ZX8OzHxzj/yTa8apHGRK2YyTDSgq9QymThYKs69YuWV/S7VPfn0bX2xI6xW0=
X-Gm-Gg: ASbGnct2wzbPKn+AVQ9j5d0aJOXk/ZOUNZkv1S64prdjvrvHkb1S/d/sEDHgaI0UQI3
	ZEUfGO44gz/fhs6H5nv4059VCyQdNQYskFAOY4M0B5FAg7r/Cp8XwktAn5zXtFvh/VYAgFGBg92
	PoNiBRqLn3mMTXACUbUZVjEql3HG/Q9p11SwL72c92I6JaCyPRwzmIthNFbH3O1BRpyfmHvLVuZ
	p476a8/G2AqrlH94Edtb6hPGkWI1cJM2jJyYSzuRPFvr0jnP31sirKFKhyUTSXnH1D/9C0k4OiW
	alaFC5th6LGbfSo880gAdyRpaLUQUIultEUhaI4wI70xwCJSm1Q4HAlvXWKJId5QeHw=
X-Received: by 2002:a05:6a00:10d4:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-745fe079d33mr22845431b3a.21.1748379896594;
        Tue, 27 May 2025 14:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmO+062jTwbk+EfgkjkNmUp7R+SdrABrfM3fDJ/G+vfmwLBFmJuRS/yzv+9kvtX5aAipJvAw==
X-Received: by 2002:a05:6a00:10d4:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-745fe079d33mr22845375b3a.21.1748379896160;
        Tue, 27 May 2025 14:04:56 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:04:55 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:38 -0700
Subject: [PATCH v6 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-2-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=FY9GlYlq2N3inwoifO8SkqjWHfzym3tmZX9bN0v1+GLtkQYvAnQtIlcyN/BdOACenHmj7V2hZ
 v5nudmTRmjBB3osJUy0giMKvuZiEGeBQCXn1Nmhej2+rqFaHmkZ3juW
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3OCBTYWx0ZWRfX8k3YYAhOry9Q
 hlt8sqzR0UNUJwR2wg4yl+ZMbg6GQ003GaEVwVGML0hI5esuqs73MVzMrSEesY/yjalxqveVtUN
 RtwkLNflRV58xGId93+iRWdEM4Apzrrj39JD24Iq9N5xzICQjKYWnVAPtqu0gtOqjwqrgETyzNm
 QoAr9ClL6bXdOab3CtKZ258cZWwl3179GWtDYHA1JWP6Xwp8Ua2fiKqKWjzMjN1DUUkKkjiS/r9
 39G8m8bZw3wcOlUyrzhpm6mC1TVF8gU3gHO6LdCngZ1fRtqkYwf5WtijRrKr2AHNOpTHloFGrfp
 dWmPXqfIm1drOHTuMRTagZqy56maprnDYf9XPey3Te6Lhydb7OCrY4bbi4NqePYWRORCFqEPfLr
 gdQvOEUylPH5Z3mqGWY6X7b7JPCPt+NJDdwYjG8GzAlVzagcHpTZwkoWQg9U1YnEs5WOqNpB
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683628f9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QtBD-zYiKu5vL_YDhMzEx3rTvyB_iiAA
X-Proofpoint-ORIG-GUID: QtBD-zYiKu5vL_YDhMzEx3rTvyB_iiAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270178

From: Wesley Cheng <quic_wcheng@quicinc.com>

On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
binding definition for the PHY driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c84c62d0e8cbd9fc1c0da6538f49149e5bc7e066
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,m31-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M31 eUSB2 phy
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  M31 based eUSB2 controller, which supports LS/FS/HS usb connectivity
+  on Qualcomm chipsets.  It is paired with a eUSB2 repeater.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8750-m31-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc_usb2_clkref_en>;
+        clock-names = "ref";
+
+        resets = <&gcc_qusb2phy_prim_bcr>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+    };

-- 
2.48.1

