Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091381B3957
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043802; cv=none; b=NiglKEX/sNqjyC2GcVCWvgDw4vfmPtc8tuy1uZQNchMCUMFfgV1/SUEjO0lIiZnS2ghKRUdY9mDEeKxNWiCed7vhKdKc0MrZwa8HOWLqvVoIvdOZYmv6si1cgcavKLT0FhSvIJScnW6iM48U5ts8BUl98c/IMCKSBmCvX5OKpi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043802; c=relaxed/simple;
	bh=USOkd1y4ycHMowXJ+u5Y9yR9NhJuLmYlCUcma8AFsCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFn9lpugfAlammgJeSSBz87UGzbbhNzTC2SpfBKKls+f/KoOKetIY+6x8dIWfdrtkNyrvevEYX1z3EKIKhaJ9noHx3/AY5F5cIc0RNl8XOjbmtGRz4lW3nq15Uuc2cPD5xq6ZFHzMgGcPZE0eHqt8hLOd81vGoDeJMOVhQ5QmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA3/Fd9c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA3/Fd9c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QJYcjt025368
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QD71Ni1FveV
	VZof6qkP0cuev2m7lS02QbhD8vpJivU0=; b=aA3/Fd9cHaTbugi6ubuknnfO/7V
	LjqIaMo1JFB5Fvw9DL0iQLoKUZQDahrzzQJCxLmrUmu7QJLHS2cTztlYlDXgRlRL
	dosWV+NcROOfLlKh6gvt6rBeITag61lSp6G7PQiEemtf6eY2nxDE2TuLoTJPpVak
	oEeyxt2wVo/Ml+7/nzn03D5967k8CXOPnmfhlTeUbtagG4aPJgDPAI+8s3V6xmbo
	t2yo/2tskW0nPFflyC4EYr2G8rmWHYe1TgXk/fwRztvZohKG+acXAVHsnr6B68i3
	05fGlVFpUlqepSLso43wOoDqwnfKY16W/pwgh1fMPKEwBPpg4+fSj2p6d2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcjg0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:49:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2255ae39f8fso30001495ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 19:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043798; x=1743648598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QD71Ni1FveVVZof6qkP0cuev2m7lS02QbhD8vpJivU0=;
        b=LzUvONXmdJwnR/73Z/lzOixGKrzYURH7vs2wkalqhruXO3pMyu6Xt5zfDumHAb6/DV
         WUuVJ49aTi4llcAKqxTitfUqPuFzMq3A5br65f9DaloOgrrbhVAyLTkux9HBm5QyIZdB
         ii14b8hIPqpBDa+/uzaMcnm3J9HZLu5hLX2ryyKNSyr+QCIc0+FKsQWph2KJyAoxS2Ut
         izYZSULqzWcwUfrPyDruQ8b6CuqC4zS27GHQHCuYGPT46Js24K69jfyQFkJ2Y1lA0tRx
         zfXy8G6kBZipA8D69MxFTNpogC9iW8N4xQdR94+UUGJig/kUQ7BXIkN0oHOi+C6PC2pZ
         66OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwjD+1ZPep0PTPD5bDcprV+Sg115b6EGR6UMGe/jtn+gf814yDRDJR3xWm5Uz0YI1tBPh4PVN7hLyUtcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTw6SmoOCScqYrkOoaUV3dhFaciajyUD4fKkbhWcS79NKVqSet
	Gxj+i/oITMLfMHWIUfJy1HJv30XQoHF32YLqOOxFHQ3G1tU0ERoiIFNfgUOx9rbon/qwVV58H7K
	0ZsVZ2L8hfqVlV0VQi8hqkMKwx8nUPetv9QzZVYHtoDoUUHDZsYlw3hARkBJgsOI=
X-Gm-Gg: ASbGncv/pWhwcsghfdhWyych/sfpyamWCFGv0r+Gb6UDG5le3x1hS7B0pi/zX6AINd2
	mOysZdmYawur14vxLrh7xOGti/FmUE8791wXTgUwUQjrLiz8scaz/x3Kmmkeri+XwtPjY7ksiu2
	H569Tm6mrveQ/kdNM+BaYnAmU1vsjD5IE4d3PQJggSKcXQhrOqBqNdCU2NmuCLngwQZ2uf31Fgv
	6ut0pZbz9xp56kgbG8IIIAFmfppr0X5UaV3xCh2DR+9lyBaUfeEhYtsyBO7J6HobKyMJWRcAcfe
	k228tl7LFjU+ZDeyjs/Hga4s0P+VA200w9pA/e6lzk47NMi1OuOEtZvyOh0i5JK+o8plTQ9Y0kA
	=
X-Received: by 2002:a05:6a00:3d4c:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-7395150171emr9107929b3a.6.1743043798166;
        Wed, 26 Mar 2025 19:49:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqgDFWBWUHHujpcGvf8Zk51GgGNpxoy+ZAlmzYdSYb4mPJVtPeBRnRTX187a1MRs0gTAKK8Q==
X-Received: by 2002:a05:6a00:3d4c:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-7395150171emr9107894b3a.6.1743043797621;
        Wed, 26 Mar 2025 19:49:57 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615874csm13511878b3a.143.2025.03.26.19.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:49:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
Date: Thu, 27 Mar 2025 10:49:43 +0800
Message-Id: <20250327024943.3502313-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e4bcd7 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=iat8tipS0Inmowy2WboA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: CQQItgtOSQKpFlYtsz7NgZRwAlynJYQU
X-Proofpoint-ORIG-GUID: CQQItgtOSQKpFlYtsz7NgZRwAlynJYQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270017

Add CTCU and ETR nodes in DT to enable expected functionalities.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 037cd366a09b..17a799e6f55e 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2146,6 +2146,35 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ctcu@4001000 {
+			compatible = "qcom,qcs8300-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x04001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x04002000 0x0 0x1000>,
@@ -2340,6 +2369,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@4046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x04046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc@4048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x04048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04c0 0x00>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@404e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0404e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@404f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x0404f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04a0 0x40>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@4841000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x04841000 0x0 0x1000>;
@@ -2769,6 +2914,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
-- 
2.34.1

