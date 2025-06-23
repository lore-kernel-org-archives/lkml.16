Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977723F294
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675882; cv=none; b=Dlml6phgNZ4FWqFXKuknM2a4k9gSf+xcZ7gqul6hFGPIdlLAybrQkiKLdZVjMjdNXF79iUxoKM2f2t2QsjSabw/yi1FlZZ6wstfDBrtQe70/qjwQhRzUOQOgfQ0k7VJEcc7xnrb9JT61o9KdMSgWGJpJP5hbBypxE0WZwun8OmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675882; c=relaxed/simple;
	bh=Nn1SUHbdtz+bHl8aKw5FbLQmxNDmU9kBm/3nok286Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tsjp0tRDMN/R68FrkZ3KBtKNv8L0f3ePyoFJvGdeTN9g+512fx7GtubDSoAz/KcJnh5YQLTlIXyBvLQk4q12wQ5ni1SvnMoHLlVmAqTcCwIWYQCFY9PMxJqGoEqlMUQLYuU4xCgnM68gboszkRlA0aOxLSyItw+GAwsXfsCkdRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikINJB0n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikINJB0n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N3fQsb031468
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jQR+8/Rp8f5
	ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=; b=ikINJB0ncyff9TeXSlsPxja5CCF
	T7MUpAk7noiFFnkzsUF+eCBV5UxOISgWSPdugxCv168LT1TuhSTUu3k6VFOVByeT
	RqmeNr8zxxl3es89eNMU4DJuFyeHyxnxxb59Ia8Oj0JbBXl7aFaXN60TQ6C8xkV8
	z+XiI8VMVbE8ws8/NA92QqSMu/9erwc6g/NNchV8KELkiZJa4BOnfWrNOaI+4ivb
	AzA9P97ci1bvCfBKvigCTKXP6AggY2oVPqhl308DgcWe8Rq44pHl2eCthAjZ2L9l
	1ZfUcQWjlCnrAmge8eX5u4s7DkSVSwkMTK6yw/Nl9SD9GVvNgco8kKz86uQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k14t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:51:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so663110085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675879; x=1751280679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQR+8/Rp8f5ejzW/Cs4Zyl6AAG5h3mREu2uxrmhGHwM=;
        b=uZqIBavJn4G1JQLzWkuTQlH4k8kULjUWcPq855KXr1KUG3+RYPryY6EViDTrSSv2s4
         FJzotSZ25PkNNlB0zN8+GPqVFSn3Tw9/awMICoFjtKZeg+GJLSr3Pk6A0ZgJllNC0AXH
         DJbSS27jbJbX3N5fqCVi7pGjQy7KbgvvFWfQnkK4+2WnUdIM8Uum+2KkEfdULM5hAnBk
         OxJ8Eq+IMALlI0buCfZ2noMiW+LiULtz1/4apnggoPIwiVSZt4fE9ZAmA7jnGeq9wPUV
         W8oVy9CXnwG1ryR5ctf3Xr8dnZQhFl7h5DK7IYSDqJzB0fvw5RxADDVsi6hpY++bFIfE
         hMTA==
X-Forwarded-Encrypted: i=1; AJvYcCWvpxYU7Fce3zox1CVQ6mXUiK5bKMDvBlXi3P1DAQy7PN1F1WAA+orCJmEP5i7L9qDYJgToPVUF13O67O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyELDiazjQSNQlBbKstDORqwLlSnq5meq8YlyWrRsCA1Q8/Tt++
	9QP4pnBv5x9BcHXir0pwZT0qWX3fNo2n8qPfhTle0tGGSTR/nW8nJ6l7U8VKOp+4TvZJCkf/d6l
	5AQw21PSiiGTyxZp6714y8JiKUlGKOIvcjq/ImomtOUIkwujSQcWtTFIbUtQPYRcdgiI=
X-Gm-Gg: ASbGnctIX4nGIr53yeeb8mXNr74Z8fPvkZUNQopCmizS7zoElNtri00mD2v+Zpj7+u1
	AUGQ2gEjnTVAZMS7/xFrrQH+svMBtvFPfNeLAYdubO2fN3MyTTDdnI+FtRZA67AHZWji6FTnKmj
	+bP5IH3/+ki1eM/gzE2j3RB+14Ekqv39lx0xyubnDUDNN1AnQRMvjlQyfIbKg2aUUoaZnTkO1gK
	S/ZG3gu/IECHKC0q2/NJt40U9d292hrEoD7lW0GIy4CFhqq0AFg2oUCNsSGBJsG9ss6/Y3tz3Fe
	CnDLgSN8KBuriOiHDwi0VfeGwAJKG9gEktAUANVCVDkdmW76Rg0FlafD0h4K37X5wR16KX9Lm7T
	q
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d3fc06d5f4mr1399917185a.25.1750675878838;
        Mon, 23 Jun 2025 03:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLSf0V1aFEye6cMJMjuH8hB5YBXXK0jKMAug6/pk8Ammt8c4DGwEOFQRHtcZNo9kQ3R952kA==
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id af79cd13be357-7d3fc06d5f4mr1399915185a.25.1750675878425;
        Mon, 23 Jun 2025 03:51:18 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:17 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Date: Mon, 23 Jun 2025 12:51:07 +0200
Message-Id: <20250623105107.3461661-6-jorge.ramirez@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=685931a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lt2HfdhEH4QgLqM7UhojwEuPgUWf3VYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfX3Evb2LcH8NLz
 DRdUty9oJU6qxGbE3gj50H9FKuP7gzzmImVNVXsAlyVkm9Bc2ZM9E2Z+gCazCmAkv/AMPLo6STq
 noEJldfbfQNGP+xn1Cjxu99sobwBFkQq58ub/isIVMGL7wNUZ9VJY6GxsYb2Eu767JdR77BGTVl
 7USwTooi7VQxZHZ6y02mOpOBuk/8FGJimIokWwRXHBDzSQx3CTPO5VmuieyL3iuGdqEurA7+M/Y
 RdKAYLZvf3g7+NkmE9B58Hn5/LiUOM3xf0gXQ5Pnn/Z13qE21GVxPwydUcqDpL0+ngOlSChjyvG
 Iiu1IWWGqM0pwpcgTTiiBJi/sEoGwUFzIQbg0JXc5IlfNsNpnQFW+PHOnXlYcRq13ctVGaJoBBj
 jO7qtBosxPCzbHeCLtUHSsygZ9ahVDPrX9OU94PUOgdLVEV/op8gxQ5UJZGWXWFf/sec97Nv
X-Proofpoint-GUID: lt2HfdhEH4QgLqM7UhojwEuPgUWf3VYj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230065

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..b7e789d1f639 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,51 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xff000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus", "vcodec0", "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core", "iface", "bus", "throttle",
+				      "vcodec0_core", "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xE0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+					<&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+			interconnect-names = "video-mem", "cpu-cfg";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+				opp-133000000 {
+					opp-hz = /bits/ 64 <133000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1

