Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4873E2E8DF0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946389; cv=none; b=Eq4KZlBqmcW0tpVMfsyCvtIYSXqOOJ5CxPxlnZ+LsubH4wDIO0PLMeeCuHmPEDp3LmFtiYIVPpqecWUfI8hOTDs60VbdB5paGajahJ2EYwKBmPLf4hbxyAzpfMCRdQZaLEXZhZjC1jRcKDR82z7tJOEL5e0kfX3RnGRg8dSIzU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946389; c=relaxed/simple;
	bh=vqofARolJ/XDK2RNgQtOyM8rhX1PFh5KD7Q09TedVbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d0ib/DplhZrG2S59iCmcV8lqGapDB7rVdxWBFZQGqL1DI/jTx8sK8uSRfNtxf7zZJWIJIYqxecvVqSeIgNrb2bQ197Xil6N9Xvu3m0+ByeysK9RRwJAnsORR8yYYEIyFR1/KMbMatWIlyanvJom0ziHW8ug3hjVRrL16yUZhZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOZXQFKC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOZXQFKC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9ca71021541
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cxjSBOB7dOA
	jDuryO4CiO/8WxVjVs2GPsdC3lrPF1ig=; b=YOZXQFKCYIbLMY8UhnU7qI2/Gp7
	tUICRtNjXKc1SgnO1ugf2Oq48Jilc7DlhWIkso0sf8Rlfib3+VkhWDu0c1rNgffd
	8JKhTaOzvpx5uxNRNKGPyJ5D+Aswig5TWTLKD+mKvjpiiwjzZHjUvuXD+eWF41vr
	OskXrkkWmBLRsZ/924FdHdDJgnei74OwhBN0AzrZ9GY4W5YzrFHOWAo6vZBlWUxJ
	hJ+vOuNKcVJzClAk2Q5GAZteNi1VyEKzR1D4RIoCOnbE06iWK9zgEJl41u6FqJD2
	2xPjVNI1XMTrRoVG+RM1Pbr7k48vqeYioXGSWXd6U39bu5nE9wAh+t4aJXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1txw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:59:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d4133a2081so136491585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946385; x=1751551185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxjSBOB7dOAjDuryO4CiO/8WxVjVs2GPsdC3lrPF1ig=;
        b=f1swcRwYPMqYTT6F6xN6pXB+0f3Lp3+Ek2CF36dMLzCRyTFVtXU+mWggkaIC5p89eL
         uw5vNsutfx6El/cmFkmtuNZSA/CnlWHkvBaau8SYvyDKUnIbCf+VMg8pDJiQMR5+Uswf
         ZY/8pfCqApnIwwMfoArt3igT9JTw3shTIYSHXP+uv5TGLe2UViv3+L8CxIUG/PO3/ws0
         +UDpfCu/2t542JZBl7/urqsbxtKtgQkU0C50QbQJcsxkKRpn5+1GqkB69IFErtnBqg+x
         t+GogabNB62tFYis0ezM0rDRnh2QKjFmW+XHb79uGTDhQdQhSq0MkhqyidKv476ySxDR
         eWPA==
X-Forwarded-Encrypted: i=1; AJvYcCVD6pWfIr2+EmJ4W/Mqc5q1pcqopma/Y9Tc7lkpnc+sj31jzLktI/tnerI/xLuQ9cHBjCppv49NWR3DmIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnitME++NMHV2fTp4ELwtpEmDPqFj9DTB+0g3ZJ9DTnIi4MZWc
	rs0bsaejl3YP0HRZpQdVdatpbApaR9muI37o95iqOe2Q+C3oKz53FayInYjEoPmYrM43JHjfAHJ
	hR6+9ecwqEBoodyuHpyKkh4b5v+C08Pk3kexVXK05Vu/PB9pAcebUN9xjPvXFq1+GZjg=
X-Gm-Gg: ASbGnctVMNT+2Kn3cR5T5qL14kPHnzCT3YSjIti+eheY39EXbwZcpilnBbxIsD9Ch2C
	iHWtQbiVVduSMCxC3k1SfoHxlfWK2y4ReS+10CbYu9zPTLaauBxnZINjVqgp0pMn+C5BRXA78iM
	4vExB32FJ9bu7eZ2abk89x6lAdMQNnQf+wokpbhADSmbHxPurm6Tq3A96ued5W30YIgDgpXpve2
	eSFwdaQbUStSjcNA5vRzxWeuTsgeJ6W87/mUVSnbA4b/NJIEpWHE2bFeMoMSxUUI1i3+nU8BfoW
	hfRHKSbfqSnRExFhegyjWAa5EYaUe9QUWwmUELsUsuuk+A1PrHtzPSfUP4oaM5scNfOSCPamVkl
	0
X-Received: by 2002:a05:620a:4113:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d43b9a7dfbmr428118885a.0.1750946385035;
        Thu, 26 Jun 2025 06:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmHdJs0VODNI2DNF+i7tJxFF+pbAlbZUVszbtQeaawx864hlmNY4CDrw7PLSGwgkT+UeOxxA==
X-Received: by 2002:a05:620a:4113:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d43b9a7dfbmr428115785a.0.1750946384541;
        Thu, 26 Jun 2025 06:59:44 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c57d7sm53723365e9.40.2025.06.26.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 06:59:43 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Date: Thu, 26 Jun 2025 15:59:31 +0200
Message-Id: <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -We_bfvuwVkQj5p7oe-vxPut30S8RhGM
X-Proofpoint-ORIG-GUID: -We_bfvuwVkQj5p7oe-vxPut30S8RhGM
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d5251 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4i77JlrBmBHsL2Ry5jEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDExOCBTYWx0ZWRfX7+jWL2/hkQtD
 Uo/WvCdrQWECb0EfTME0L/wRQbymVNPvrvfpUy4n/ELI2/CzM+PsAhtn/+PObYKoZu246O93l9K
 DXikeFmMfRSEUqrAy0Mm60pDmom5kaO3dzmqpk5LRbYYNV2q2K8hDVsneNEoyKd1XFKEFqaOF6u
 JDMddwMzvG7j0WBzEuSmi9GZQDinmtraoN2dkcxIpAPFCheqguI1p1M1bnl87F+rLmVvXuRKt9l
 nlhvCAwjYd3LbakmA5J11lzS/T+uz+DFtekDQDsYEtsmz2XgAo/55ltzleXBPTUrTNlKHuQM1oB
 ByShiozCI/kcHUPnBOtFHDaDJcc/ZpZL7W/s9Ns65ZH71qBqIt5/VdTyDWMDjkncy43jYHYWDfB
 2IPB77Ulyz9t2Y3fFfDgp1K/081iFtVra35wnp8vomRdPC3P7o1u5IZMYR+wW/8PDIN0mcv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260118

Add DT entries for the qcm2290 venus encoder/decoder.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 57 +++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f49ac1c1f8a3..5326c91a0ff0 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1628,6 +1628,63 @@ adreno_smmu: iommu@59a0000 {
 			#iommu-cells = <2>;
 		};
 
+		venus: video-codec@5a00000 {
+			compatible = "qcom,qcm2290-venus";
+			reg = <0 0x5a00000 0 0xf0000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc GCC_VENUS_GDSC>,
+					<&gcc GCC_VCODEC0_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "cx";
+			operating-points-v2 = <&venus_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+				 <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+				 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+				 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+				 <&gcc GCC_VCODEC0_AXI_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "throttle",
+				      "vcodec0_core",
+				      "vcodec0_bus";
+
+			memory-region = <&pil_video_mem>;
+			iommus = <&apps_smmu 0x860 0x0>,
+				 <&apps_smmu 0x880 0x0>,
+				 <&apps_smmu 0x861 0x04>,
+				 <&apps_smmu 0x863 0x0>,
+				 <&apps_smmu 0x804 0xe0>;
+
+			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
+					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
+			interconnect-names = "video-mem",
+					     "cpu-cfg";
+
+			status = "okay";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
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

