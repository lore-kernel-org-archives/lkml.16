Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9428C868
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547104; cv=none; b=DTrFJ0mbgFdnBPfYkSHafrLGPFzvQdPLIH+xxWJfX1P2YVqbNyPRAEdBAOQEIpOsfwS2NOrVk3wj+/E2dD1UT6rSvaw34u+rGMlNjBxC+d+213YLgiHPn0qxmmpTEvYdlh+WJDwGFaZW6ptYTM9ZULP+w3n/gE3UNkZkwJ6gOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547104; c=relaxed/simple;
	bh=HUhoHi1MWPtGdUaOc881gyCv+iH4y9tcRtKU1bwDqHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fCd0wfMZRhk568TbCG6VGBG81SkNz1QrPDQ+zS36KUdYA6FfvwuXWCQrh9nEu4VChXdACt0a66djgnUrJIfMHtwtZQLUH3Bs/AMaYATIqUTclVrJtgkeqxvKgtSo2FM3r1klpwfkMHRC9+HylIhhr5jxm7Zd/tnlkveUdQxAdlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOuY4gDv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOuY4gDv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A64dgw000923
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7cC6/7ZRu9K
	NwaHrJD1RpFcJHBebpSHvwonwylon4MM=; b=DOuY4gDv8vmNF6+V98GKe15Hpte
	O8BQrCd+Uf+drJ8PzbkkcQBgg3DvOXg+AZCc8Or4FjMkuSv71ltA2i+XDj3kIvmO
	sRZyud0C3dIMZ+BnjAZXDQvloLKfhQL95j57V+YgjWG2yOGe6SgxrLndsyKh7/me
	SSM0eGLozpS5xAFqpGr5eTNk2cHBv0aiHqzMnBLUuDEE7OQKFQd7pnfP/R2yTS2w
	uesZmecsrB+DaSCaSWG1NObPmdE7mlQ0V/IMiJAzP4j7nUmlFRUwo7fbj46g8v4X
	zHOnwPZP6WbDfzQ7AG4bQ4msaDJYmextEhj7XgU53tPzVgo4SdXvY8W/KSA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tbhak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:18:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so1589585a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547100; x=1750151900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cC6/7ZRu9KNwaHrJD1RpFcJHBebpSHvwonwylon4MM=;
        b=wR1l38HXgKU71q/qATFHY0VYKOakiDJ2nWKDje1WopYOmwK2J0QZkpvlFu05cRg3CU
         s+pnoPllj5LShjvL4OaU6ouyVkBEbE3bwAHLFgTxUh286fNbt+lNxK1mlJ0h3s8sbhzn
         gj5Gja4yTpHucW1cUBuc+ydM49FP1x79SAq5tfvdL7TIFh/2p6JsnDW/yjuY55/hokl9
         jpg4DUdvO6NYDdgybMwrg/OqMIZ0Fxb6HVjxfHNsxAOXe8ilgWE7sjw6PfB5eVuK4StD
         eF7D/EpqaqTjk1Xy903d5THFtIPfZKSMqEyoSVGWO3+Njy40y1Z8wmdcEexSwZ7bbtqF
         RhgA==
X-Gm-Message-State: AOJu0YwC/ZUyk/bd3PKdJluJt/Ry2BSZ+TpEhAduoEJLg1gj4/pIn/qj
	3gQfkoelZTGKQNJDNgAB8D28w31EO08R5+poUTj/mQOdMWXllt8biNUzJn7m1gLJgzgMw+V9HSl
	sWAJnqqask2ojCpW5Wwq+bUBrWO0jwbBGARYrdY4snvX4e1FSpyPkb5xMfDC+W0kLJt6kj3M6ar
	Y=
X-Gm-Gg: ASbGncvYDcfQYdtBSLMgka9zcE8bVtmcyO1dOOEf0IFimJv/AOGrRft4I+kp9iCSBRj
	mKXKOaKw4VS3hC2Nea35EZtQ+gLMqtLsrEHj78Q/E7fI7oVSxzPMsan7iE0eMkj5zSL6rRqt2fg
	mFeLDoUT4Feu5VR+lGYCQEe4/T+5izSQ8KobjIxIe+Hj/u+tv+KhnEgPZIl8rw5TMyKspEVkAZQ
	MGZJDruvh/qNmSrmT7Rv05lBQeSDt+NWUHAijQPc28ou6ceWkyWgoSKzAyBFCovzNTiNRLa30Zx
	h2YRHSaBG3nZbcpm6RKhApCZ+3nxNlJFjfVOBME9KmR3vazi/W1IUEXB4Rbi
X-Received: by 2002:a17:903:1b45:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23601d82e8bmr240818015ad.33.1749547099790;
        Tue, 10 Jun 2025 02:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtD01ys/IAJLoEmeaCTfMoHAoprVb/k5dZuU12KwjLOp6GW+Z8kpx3SnIZJJP7azlyc6ucSQ==
X-Received: by 2002:a17:903:1b45:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23601d82e8bmr240817685ad.33.1749547099394;
        Tue, 10 Jun 2025 02:18:19 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603d14206sm66951195ad.34.2025.06.10.02.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:18:19 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8450-qrd: Flatten usb controller node
Date: Tue, 10 Jun 2025 14:48:05 +0530
Message-Id: <20250610091805.2997546-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
References: <20250610091805.2997546-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WhPOAtoOVFpRSbktKV01Fo0haBZQdTce
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6847f85d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gStOZqofneW8nAW_eEwA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: WhPOAtoOVFpRSbktKV01Fo0haBZQdTce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfX83sL5psB0uj/
 KBdU6xMUI7T1dy0n7sPCZDmdS2/hm2jlQw8W92F/U+YPGtzb8v/wGrk6115HNlQ+MrWCS7a3305
 9v6ZJufkLRSpQNYANq3OPVxrqFnr5RUHUwU+Q5FTn/YRidoF7oJ7oyPLVPiL2ftD5NRyfRgI5q8
 U5kA7t2+uGBqrKCTHtOa+mey9JRzPBp4Dus8rH7SHsc988tP7TADYBpfoYnApgt01upswHReqmD
 6R5yMmEHUrhGS+IOcwDlLdkykuJAkSbR+xqGNW247N3Tffh9jVkr9L+yKH+3pFOVdOPs5RUh3vR
 BFME1OV18tpc01VWhNvKM14eQnmFzD/CefKJ1eoVf3FdlJpgogoqTy8dlmV9xARwCs9Tw12IxPd
 zjCor8KFddAW+sYOWaMaGiwSOyHAICTPxWrvNZJ4siCj1G7XbJ5s9q1ALJWj8N6+3gfzRffg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=780 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100070

Flatten usb controller node and update to using latest bindings
and flattened driver approach.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 60 +++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 0580408485eb..bd6cb895b65b 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -500,19 +500,73 @@ &ufs_mem_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+/delete-node/ &usb_1_dwc3;
+
 &usb_1 {
-	status = "okay";
-};
+	compatible = "qcom,sm8450-dwc3", "qcom,snps-dwc3";
+	reg = <0x0 0x0a600000 0x0 0x10000>;
+
+	/delete-property/ ranges;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+			      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+			      <&pdc 14 IRQ_TYPE_LEVEL_HIGH>,
+			      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+			      <&pdc 17 IRQ_TYPE_EDGE_BOTH>;
+	interrupt-names = "dwc_usb3",
+			  "pwr_event",
+			  "hs_phy_irq",
+			  "dp_hs_phy_irq",
+			  "dm_hs_phy_irq",
+			  "ss_phy_irq";
+
+	iommus = <&apps_smmu 0x0 0x0>;
+
+	maximum-speed = "super-speed-plus";
+
+	phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+	phy-names = "usb2-phy", "usb3-phy";
+
+	snps,dis_u2_susphy_quirk;
+	snps,dis_enblslpm_quirk;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
 
-&usb_1_dwc3 {
 	dr_mode = "otg";
 	usb-role-switch;
+	wakeup-source;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb_1_dwc3_hs: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			usb_1_dwc3_ss: endpoint {
+			};
+		};
+	};
 };
 
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
+&usb_1_dwc3_ss {
+	remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
-- 
2.34.1

