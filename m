Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29B32253A8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402530; cv=none; b=lxzLASUv7PiFOme1zWWrinjsVAkBjjzfa2xgk4h8sTxizzX4atVWoHlWwJ3NavYFIEFCakVkogSv8+H4lCOJRsRTnRoYj89boYN7fh8QBr/YQUaHnVp9dGkqosco7o3Scv0G8BbOcS9qtKqYHbCsjegP2zlmuSP0Ad3CI8ImtZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402530; c=relaxed/simple;
	bh=x6KYfTAxV0gJ3JjPG75Zz7KUsMDV9Jr+znLjiPxqy1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nA7HcbIMSW5SUVm8BHYQK/mA0KblTq38L456Nd02CDCrtUDcAZ7xP1Oi5jzrv+/J3p/0xLzz0GRTsw1RzLLxsTIHogQ2lGSoN2IQXJQ9t+6f86c0P0yURuhMjHZYVUOEGpZZmijIo620e4H7GKIHA279cdhUq10ntsfocP0P7rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClNZwwGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClNZwwGl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K5sp6U019473
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17KGdEOOi/B4EOUws8a40Ueo26TPu6Eoqi4ECOZce/Q=; b=ClNZwwGlZ0iQTX9S
	6JwhpPsKoBR1QGYgWHqLitf+jsbhcpNBIKC7/nKENHy8qrNefS8RJi2b3qiK9sVK
	8nqO/29zL44BcPwzp2ohvQKGdd8rWfxU5IZvNfVxYmas+nse2UMhw9S9IZgtUF4A
	XDnjPrsKGw0yuI58hPrTgXWi9ajSsnRLyBn5WVQfxWHtJaDAlHJNTel4Kzisngyp
	c1o32AqXuJ0z5at230NFBlcy6lQohLb7/Wp/7r9DfYBeSPNaQWaw32ettRlyXhcw
	6MHSjfEvCszo/DxPyfMcJGNnF5tu6X6GWIek51AiUa90+SnIwnYlx/O0h5HPbhOZ
	KbfosQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9ja0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369261224bso19547695ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402522; x=1751007322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17KGdEOOi/B4EOUws8a40Ueo26TPu6Eoqi4ECOZce/Q=;
        b=ea5HPfgsdCTnK1yxj/0kNhss9D8thnzvqG/EkU3cH/yQWncWx9totVHiNsCdldSDXj
         z1+IQyH6OSXe8h5W/+dPTuaYcRq6KPN57/p/09S+RaCF1u/DfCQJ4bEbCn+dELlbL+PE
         4UmI7HzyN/6DJ8fen9MIWCEquBhAzW0cClpwvWaEeU1HaPyPb/+WiAsqpxUx083nhNRc
         uFOJUbTh4jXr3btX155XBtk6z4DvPRg8i/JQybg5QZditMmi0J9IA6mvLILE6oLar4tU
         nFg81nsuHnjAFG3Fq8MRV0veGxJ31DDBjejTiw8iqp8EvT6qEy64JuGhtKZVjYxzioVK
         I+NA==
X-Forwarded-Encrypted: i=1; AJvYcCWzRoOepTisaTPG+JR7ZGdkTsJ8Wnn6E5AOIHjP1eow8qxaJCK17fma3FFe9sqgKNhLjL6fO8rwltsimqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ceiiUdsqM08wHdGfVqG8Pp+FeiSWWbaITG4QVaqI4bVzPyBA
	qbuvc9nUzpTioCATHDl013qH5/4vpYfE25lB3VT/HAMa84E6zJzV7jyNyAqbDAkhdVkOWTqKoeo
	abySrLCJuMkElpcDTzh55NorDPbz767uvAYOvKzZ09NR0tXnXCvF43ApqRrdUO+vnjwY=
X-Gm-Gg: ASbGncvLNzveRstwIRRp6mnvIQip+MBMgT2siBZWvoVJjtf0kk+VPjoxWBJl7WeZ4do
	okMGYMyVwBupuTm/FF0bJls19B5LK1xRR0Q2f0/8e6OjTSUSxnBEijG0AQ7BmImeBUlJ3KYfk7/
	5tbbb0tRdtPjfEyCQAphzhujX+dycDX+UArbaBrUPAr2J4EIPGb0FTjk7jeoiJPt7ie50XbEeNf
	rj7lOimpzaLyYACwjIh6dK46O1osLJn0FU0G6zdc7i2te0KPsHpO2WZ4G1nJU9MIyCccWN40N0e
	opq5gtAYX11Ab9Kxu/8qzXNEtb8UhTPT
X-Received: by 2002:a17:902:e5c9:b0:235:1b91:9079 with SMTP id d9443c01a7336-237d991ec7fmr29981965ad.32.1750402521917;
        Thu, 19 Jun 2025 23:55:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjX0qsq8I7TurzMv15JYjYPQyRLRkCseBpK5Q3bwCLF+kG5tHGVtId4Uf3azITJkWY5kOJBg==
X-Received: by 2002:a17:902:e5c9:b0:235:1b91:9079 with SMTP id d9443c01a7336-237d991ec7fmr29981395ad.32.1750402521500;
        Thu, 19 Jun 2025 23:55:21 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:55:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:31 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=5779;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=x6KYfTAxV0gJ3JjPG75Zz7KUsMDV9Jr+znLjiPxqy1s=;
 b=8Pobj8Y1JiVR7cCb3mxLOyaa004SP/tr6fyDMxMjmkDRYtG+FDvgLNiU87yVIIRMdXwKaHRzG
 /7OfBKvozMbDU7oCg4a9ji2RP+nuy/yxaDwbP74q96ZVt3G7+nd7c2g
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: XqRNLE99CxC0zJi5lp3Qf_9YOFXtlMRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfX5g24+6jN0tUi
 6RqGiZSZdsSDzpcfNP50N14v8L3ZtbkbYBIq2yDpKird66UlgVwG05NU6ncypqKqdfRYJmgUDfE
 Ub2WIFfFCdMYHGnkDVX7kRdnonjBFj2AwSej72s6PMptTbg7ASxRlFAzpaLZl1pAABKlqdnAaqx
 CT2P4s8d9UzKDTMkqsLh8Luc2S+skdYS/mmTaJAIpYek9u9CZ7ysKyrclTmJMvvlASh678w1OtH
 t0sAWTJ3g4ulJeDSmWySpgCr+DTPRNTNOCoi0etLJhVV2qIyAeWgZGisV+yGX/3L11z7iEG0btG
 SS3Ty1H61tg8Vg+WVDQ6zo7vFXHhDomqkxIon6wTLzydFhUFz+GXZfhkgcipsVKQdT6pZsfnJoc
 OJgN9KD06EG9LSCnA0Cgn6G56CAXPl69t2iMjpuHoEMTeHuoIEfyRKoUT0Cdf8RP4qZqYd5q
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=685505de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=EP7KZQdbA9zuvdDl5SAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: XqRNLE99CxC0zJi5lp3Qf_9YOFXtlMRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=773
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200051

X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
version of Adreno X1-85 GPU. Describe this new GPU and also add
the secure gpu firmware path that should used for X1P42100 CRD.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 120 +++++++++++++++++++++++++++++-
 3 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		qfprom: efuse@221c8000 {
+			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		pmu@24091000 {
 			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0 0x24091000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -15,3 +15,7 @@ / {
 	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
 	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
 };
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..090659b8bb8942cdcc46f8d4a3e7dbcc043a0f78 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -17,15 +17,124 @@
 /delete-node/ &cpu_pd9;
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &pcie3_phy;
 
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
-/* The GPU is physically different and will be brought up later */
+&gmu {
+	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
+};
+
 &gpu {
-	/delete-property/ compatible;
+	compatible = "qcom,adreno-43030c00", "qcom,adreno";
+
+	nvmem-cells = <&gpu_speed_bin>;
+	nvmem-cell-names = "speed_bin";
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2-adreno", "operating-points-v2";
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0xa8295ffd>;
+			opp-supported-hw = <0x3>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+			opp-supported-hw = <0x7>;
+		};
+
+		opp-1107000000 {
+			opp-hz = /bits/ 64 <1107000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-1014000000 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <14398438>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-940000000 {
+			opp-hz = /bits/ 64 <940000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			opp-peak-kBps = <14398438>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-825000000 {
+			opp-hz = /bits/ 64 <825000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <12449219>;
+			qcom,opp-acd-level = <0x882b5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+			opp-peak-kBps = <10687500>;
+			qcom,opp-acd-level = <0xa82c5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-666000000-0 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <8171875>;
+			qcom,opp-acd-level = <0xa82d5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		/* Only applicable for SKUs which has 666Mhz as Fmax */
+		opp-666000000-1 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0xa82d5ffd>;
+			opp-supported-hw = <0x10>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <6074219>;
+			qcom,opp-acd-level = <0x882e5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+
+		opp-380000000 {
+			opp-hz = /bits/ 64 <380000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <3000000>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+
+		opp-280000000 {
+			opp-hz = /bits/ 64 <280000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+			opp-peak-kBps = <2136719>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+	};
+
 };
 
 &gpucc {
@@ -41,6 +150,13 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+&qfprom {
+	gpu_speed_bin: gpu-speed-bin@119 {
+		reg = <0x119 0x2>;
+		bits = <7 9>;
+	};
+};
+
 &soc {
 	/* The PCIe3 PHY on X1P42100 uses a different IP block */
 	pcie3_phy: phy@1bd4000 {

-- 
2.48.1

