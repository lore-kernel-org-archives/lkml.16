Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0151D61BC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823473; cv=none; b=OWIbjxk8Z3BzEIcrf/W/UivSJJhNPUoEUnyQQ17AmGpN6spHml+8EaIZe24/ms6S3syGoH0cwon4jbR5SJcI1qkk24AYxJqzt9ZfDK6OSYKh6Q3kvGUyroANKreiQVT1JF4QuBc3fyQ6NcBtQWShMU5HBY3tzT1UxrtB1Vc6pzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823473; c=relaxed/simple;
	bh=ESY5GP2xLjO/uuUBIZdrZi4e7ID7ZW6MKv1NQJpQTqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fOrliD2a2jdAnJEa/4EW87mPAEmvR5uRQVeJPKSbEQ7N9DPGAHaFnYOamN85cXeoq1MaXnjXp8JpUCu2fyzk6hQrBAJ6/KRv3yDskJYms/Xmh1TUU/qfv9a/yYR5PlycxWKXa14GA6SXja5j/D7oG7Rm8onuRXFVITBLg2qaOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CD6w4KH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CD6w4KH9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9wuUN027902
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RsM2hPD5yCf
	EMigxxJenV5Fcl8jXieeQmSVNx4nPyPY=; b=CD6w4KH92tYbGASewlIXtdsZ4x/
	xAIBkOMmQJGk3tgeQjTeAyyVuq+yeDXH09KpCRbl1HUsCrHyTAbJepsOlHlAYwRr
	dkHORv82z/b6tTQCXrDKg1apZ04CRcJ4uDvfavruZxHdPkMA9ehv3Eqy1I5uo91B
	V3n7cUeSQGWQEx9bbbQ6ZurW5Pj9fYvOo0/OLaszEH65lzVxV8qJS1Qp8djY1+s6
	hAM5TlSKWGCMuIW4eAtd39umQd2zbUBDwuDAeRZnt3e0fslBPc/w8BuDGrEb5i/o
	8OC3L8Eb2G7hfUpWBp5f52PFybPNRXLyy0ax2SLKzYE1e1MmgaAS7A+jMYA==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhjjmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:30 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-86a5def8869so442824939f.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823469; x=1750428269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsM2hPD5yCfEMigxxJenV5Fcl8jXieeQmSVNx4nPyPY=;
        b=b28fzfrmJQFsm6hkfhm14wYbcmg3Hg1AcAhpT7C6ZzCNKiXvDkMPSNWXVS8SqAWZbR
         2XejGUvQaOBIUCksIFpL1yefyR0Fz5TuRKMGI7DdZLq2T8sV8pPtHq1oa69jRcdgeO2c
         39lkEVTCgZwv9GOW25qS86Ykn3INTj80b7QP/fPjl5iZCbx1WxZj7AktXNOqWbgcns7w
         06PaLhtusQiaXJ77qwrdVpqAw2flkyRarpk74PeUTd72i0EL31V1ribE15Hjvj2zMOAj
         v4HTa8RkqzKXQFdKH6dIa+cyoKBWDM+Ro3QeEJ9XQmF5zIv3Qax3olC/LNB8YkJaeoqi
         dxaw==
X-Forwarded-Encrypted: i=1; AJvYcCVOQG+eS7H3MzaF65t0jiafiUgQkF92gzcJzDeHQSrhF3DiHcegJzmXfPLAaTvYfqbz81xIJjZRW/2vZ+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdaIvNxL5eybqXb8s6V92lDByLc6KYRE6Y0QdtHRjc7+Vmq3X
	hR9X/nRvzcDP3kEBlXCT1waJipEVAuYkgLCWHsGFQz5dcYHuQ8zeDN/EGKhKfn16gEsVMqbVXjs
	L/ueAA39RM1cI+iC3BVEvPN71nUX5dw/WFBMn6ABm2eeipg2DeiJd7fQ7CTq2LSOG8T8=
X-Gm-Gg: ASbGnct9548ZfM7Z1viA2BPS0EB5Bqcq2v42enUjNK2wS7NXexUWB4OM27rWr7Jx+5r
	KnJJg/PoYtHb5EzXGhuGwH+GcKdAcvmlia22+FWoER1Hew6IfP/qKM8L2o7dQKj2N1oMINUzREH
	xIYhj+jtGFxAtUVagADxAwPCKli6f1TFF1eJMduUZ/S/sGpmJFjx45INrHv6YV7aVTg60Uk7st0
	CmchUoTHt4ejD/Pxvjkn+AwhdhXBwTIWt8WovBULM55Cx3yA/NJNbvc7uS9mh22T/vZ0xU6aHeT
	0DtQstnKEliQ8LZfml4J+dbKBcu7OMvFByYu/B+5x8IipGvxXh+fkeX0IRQIQI7Pnt0q0OH/+9C
	W
X-Received: by 2002:a05:6e02:378a:b0:3dd:9164:906a with SMTP id e9e14a558f8ab-3de00bd9d7amr30230995ab.13.1749823467727;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDz0VH3Av7q60En4HuuZIMYCmq560Rv0gKSCOnab2gqKJsosMfxKzcNjWbSyhrF0ZVHcNOeA==
X-Received: by 2002:a05:6e02:378a:b0:3dd:9164:906a with SMTP id e9e14a558f8ab-3de00bd9d7amr30230735ab.13.1749823467257;
        Fri, 13 Jun 2025 07:04:27 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:26 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arch: arm64: dts: qcom: qcm2290: Add venus video node
Date: Fri, 13 Jun 2025 16:03:59 +0200
Message-Id: <20250613140402.3619465-3-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684c2fee cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6cNYJS_lEeBOaWCNo2sA:9
 a=61Ooq9ZcVZHF1UnRMGoz:22
X-Proofpoint-ORIG-GUID: OyUGUe9x3Q_A-YtGu8nVG0yhpneSyLRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX3hYv8FBjszX8
 VW0eEDIcpFZtU73s8IwqgNeRWMouzeDME914YbAPTLfex/qfAAILM5k9VL33qoHJ8CXDd00HOMK
 9uBUi8UOv2g14JGo4dlwQFOqAnnPtWGCaf5pLcR3KcQ6po+wpMZhyUgbZfIolabXU/S/DTPm6qD
 uEpon3Z3MmUR2ph8H4+ONMEH92VN9O+c6OLvpJV0PHTc6d7KaeKIV7vtHqjcLPZiVfa3Of+kTNv
 SVBPSi0O8m71umga8Mu4iKgKzws9SXttGHFcbApyAp9PHCEeTl3ywIO394u9aaJSomz8ixc/CdT
 ne6WibwKHxtrJn9UVwF3uNkDSIuLU4cS3HruMdOG5WbzkSTo05HK4Aq0BaFDO6lDaQhgy8WcERo
 VRfg9cviS/mTZ2y9n1nCZAimJu9onxo3UI/Lm0SVnP8Laly7ixWRaNiUOD7zUB1sg1AFWHCn
X-Proofpoint-GUID: OyUGUe9x3Q_A-YtGu8nVG0yhpneSyLRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103

Add DT entries for the qcm2290 venus encoder/decoder.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..af2c1f66fe07 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,59 @@ adreno_smmu: iommu@59a0000 {
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
+
+			video-decoder {
+				compatible = "venus-decoder";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1

