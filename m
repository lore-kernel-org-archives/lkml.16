Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F523ED6A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675883; cv=none; b=WNU2Ht4TejUwZrPiRXUTTNFtHFeRrBf6f82KZErJxjiU0Ysx3BJYFPfzA/XEQRbYPPqrV8stqXDMj+yxAojDpsL2ojU44lIwthr4q9cimI+IlrbOoprfWVbmwmUSurRT9XBO6DTsjdg9KcIYJYGlDNq5VIcRCRubYhtjXAyLCCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675883; c=relaxed/simple;
	bh=v2+PUpyQuEpd6Qy8uGCa9JWlCfSUOoQ6R2C6kBCVvKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LReWJRCR8KrEic1en2vSXjLB1gvauj8xSieU4+bFlbRWy9ikbwyTlf6YWGH3T1bS5UFmKkHLE82+aplLbgFDIOZvoEZPskbRPtV6YMIo18OkQqxtgOjiQfvReefo321GpaxXN9Pnt95nb09VipHfPWD9UAysXMaSg62gwZbSZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFTDNmbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFTDNmbC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N931fN015230
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/IEG3Lw7qKW
	3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=; b=aFTDNmbC4gERKiqYpPjNcyRg6VB
	a1+LFmWTF+y5RykWGGeOBOq9ntqj7WL873c8hyvO83obJMTB1YwIvq6maVL5GjQ4
	g6WL0wExK8GSABXZAMpUai0GBpYdK1ZddIb9PdyWvTMMZ7kR6JhC+08hn6pDObY1
	bGSuBcKdILA0Slm7rwvCDm+5HO9nTA5vyEnY6rJe27hxjVlhnNwmrWU1zdtOeF57
	IKhEfHgy4EjLnQ8eWZcKO3LBjd+umCP46yPjwsKRZ8OTx9g8hpUjQIiKmcnz5Thi
	h/KAx3hrzrjxZH4UsCC5qdNJdNK5qFSz0leRUa2Aza+jZPjsFDqCuwTYo3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu0ajg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so663091285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675873; x=1751280673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IEG3Lw7qKW3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=;
        b=aMHkvPeXsffh/W1QziYj3/pCGDBO8qHCEM29yTcWwB5ymH3udlCf2qKgQubcyuwudS
         cjYVrvTSKnWFyQe3ELdcDH1h2b4IqTfH1npW/vIeiEV6/q/y7s6sSaX4pM7catUw/aPg
         s/Le+OgEEdDyFj9y73Pd+wKYgaKW6DO8zHq0wBGyPGuR3PjGNLwB6CiCpzORWJliyT9g
         xdh+FoAeOIC475hti7NIpsHVuqukAQTZTQD6RX9AzG6YVPZDj57PBHBTbDJIchoLbQz/
         onbVb8pxnFD2mYOxleL8ZsnF4ZfEfQVi20p2fmc7YxrU/7HlhYAH6HyIwk5e+HFvS8AG
         /4BA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Iowwsgr28VoxtSHVScca4PLjGWxTnxS5FUU+Qw7hbyp4s3UQBfJ+KidLk9ZDnZSfQbW+uaL8iVkJztU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0x9YwgqwgoVhxSCJgylBCDkKdkgTVwKqqC+yUEYBzsUCl0jd
	o6wdZw5gZk+d0JsS2gyFSd87oMTQF0Gq0Vx8Oy//RG62T80OfoSIyv9ZkGrxYhgRBqSG1DtVUz1
	8/JvnAzEdZfrV+bBGKyVTPfOiuUD67MGJ4Ulrc9+gWmumAESQgSs3yzknsrv8GJZSnmk=
X-Gm-Gg: ASbGncvCnk8SLLB8iP6VMUALCDJ6WuPBZIiJcJp/n21Z98+WqY8vfvnWaq9vfRx84H9
	e+m0QL6WZsB9AbMNNyATqq1TtzCv/Ru98ojKbyRKvmpBLyf7Wq5SvqHPJ4R5gowh961hcldqY0h
	UaHbZxCbDiBMX/NyaCCYRF76PpvC0HgDpUAv8g3PJnE2Po7Z7tciq3BEz9T5OvRlCx7cY++Khf1
	b6Od0MOsUzq5bmjVT2PDIWxCEBRb1O2kSFRcmwdo12IfoRYncGhnV8TjvZIUPmtFExkdNhjyFLF
	CDMY8Uk1hiKJ/6QaMKfUVP4hhRSYff4m+4Il9kJsxG+J2jdd3R0/RjNDYzhuBiJ3739UzVAPEfg
	B
X-Received: by 2002:a05:620a:190a:b0:7d3:ce9a:565b with SMTP id af79cd13be357-7d3fc02d785mr1549173185a.14.1750675872908;
        Mon, 23 Jun 2025 03:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeczlrp2KZQuD787VGdM6ojUIpBwCMHv7W0cpZRLBJhUTOy72V7bvnKIlMEc3J+WFbW7fSOw==
X-Received: by 2002:a05:620a:190a:b0:7d3:ce9a:565b with SMTP id af79cd13be357-7d3fc02d785mr1549169785a.14.1750675872434;
        Mon, 23 Jun 2025 03:51:12 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:11 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Mon, 23 Jun 2025 12:51:03 +0200
Message-Id: <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfX0v9pg6QwmoeG
 LPAZ0yiVBrXBRet4NCDC0wlGjkduoAvAIHBRJY34XOWLZNpGqg0rNfD1P4S59WaNWwU0m27akrh
 OR2DGy1EUOHzOFHcmdwFy+ylXp9XJ6++UpLAVVOjmE9imPFE94F0Wlamy0SwWsEZTHGlH5huAHM
 tuUm2cxGfI5rB8nyi1HIwujLeJpsx558sTd/qGvXfAbgcvKnXQoDmHCM4I2JU9AhvNzcyOnfxfL
 YOmz6qwcYrCLwwll2+DV43gNgP24hIu6iOGD7jeJmc66kcZkwFuQ/AomPDoHv8qaZ5MmqbBgfyn
 Pzj0iHaGQbtduNdd1LcKVgKwdo7Ok3/z9TGUIidgKlVYXo4Q8xY2+GRtNHAjQfqOgk2zjpEZYB8
 cu7Gch+s53gyRCw5NH3YangkJL4zlUlUAcOJ8mx2doB+isywxywlNs4rs6sDCnTlzKtfCqyf
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=685931a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UBg8vxrJu69tSQrAULkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: s7bIk7ylJtHobucbuk_S76NPfGRHjM8r
X-Proofpoint-GUID: s7bIk7ylJtHobucbuk_S76NPfGRHjM8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230065

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..1b94a95ce514
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+
+description:
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xff000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus", "vcodec0", "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core", "iface", "bus", "throttle",
+                      "vcodec0_core", "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+                        <&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem", "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+    };
-- 
2.34.1

