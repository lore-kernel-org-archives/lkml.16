Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A99F23E34C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889233; cv=none; b=VYXmhcd+932iWZSyrq1wevjGGHcJLMFRP/bI5wsAFgdr3DNb72L08nS6sTNAiwl773dGeim/uSzBGgYkQ3P4w6e2K2SItnlTB2UOzB0JJmThObF4Pl9J7dTptGEN/ZEqnfumyB3Z6hX5XbrRVPucx16800fS9gb1x5yCZZKutzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889233; c=relaxed/simple;
	bh=UUY8XNfF4dRzWt4suGlt9o9BBxToYMQT10AYr05Fajg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THbXUs3KiGGl5gjk+0Wb2ETDYwVhOYhUl394t5RwJEztkXQF2XGusOVlPLDyuO8iih27879fz5aNo2zykeuwtAYZ8ZjuBKCm80wJzt3TbkWlmNZ1cOWP6Cy3rWoaSZdXLF6aPEXi9JuS0uqylG4RQX2zFZCsSuEv7dQOfUgAgmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LGDATElQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LGDATElQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac9aea656so873854f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889229; x=1745494029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idQApIo2Y/V8jTW/gFHieZs9cN4yOYyA4VylQhX2Lig=;
        b=LGDATElQ83H+HNn48LWWrPlRkVpB/ESztY9r6bi8CJNjgIYiYy1hSSMkx0VQJJMRam
         IAE3Net7W19JtV03Sd4Wbx8oEHJyrYTGbT1JPeGofe9K1PsuCChbOMutQr28QGmL/1zu
         zQ8gpecjacLG2uajEzSjlj0f95OQ83T7JfNajNX27/KEPNbGMzV89hmTyYOdDixZCxQR
         i/a9pXZUxmr3/ZpZT5ElMFM6MJkOR4qR5eMkyJkJE+0deebFZR22ZNjQ28dWo0N19YA4
         3xsm9MicoIcuWDY5gbRrEWSWxu9MdYKuSU7pqKbaAs8lrIAE9NHxxWJIOTDsjGc3GsLQ
         fRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889229; x=1745494029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idQApIo2Y/V8jTW/gFHieZs9cN4yOYyA4VylQhX2Lig=;
        b=EVzaMseROxU4N+LBJFHMeZch5Hks73WpdeFuXF4m1/apkWQSXOJ7qtKoE6s837SOoQ
         skKoV33KdKDNFqa5GnYEU59uqAlzEwXHpegxUlvtcvoWu/GECla+CDOv5EkP9HGEWUax
         G8aW+NYORhC93ZRu9bKymTdb97zhL5g9zp+VYjm8hFuzRRcLZBt0tcBEunyyDxPF4XtU
         NjkwYC2UU+9mFW8/BW9mBqpnbjj3RmIv+mmjQ+7LFQL+VLUqmUYHtHSZ4o02Rqq/DvON
         GNCzSe9BGT4fHsMGRj++nwmbqxEql0sN62v+JldXFOTEjBkTLOBlYLz2nasT/LBPB54Z
         VxGA==
X-Forwarded-Encrypted: i=1; AJvYcCXm158XG2AQvom5iRnd0TypCpIkgTlpEnljnfHP9dU5pQZyQ1MBQNT6XOrhOfjGqEpB4RksVg/E09bnAGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dFc+pPWt80mUU+VeshQlWzyMAky/bVlqpBTJGuTcpnzpXhs8
	eIzl3IKRjbTPiubTlbS9IHC35A6TLEC9cYXF3s9VFHwty7I9eRorhTK84iYB8aJPOwJj41AEovN
	4NJQ=
X-Gm-Gg: ASbGncv16xbd40RIGNXW13RpT457nTlpR/tEUntb7yGp42JuIgAuAf/3w6K8sZMugIl
	9jDNSGCCQzqocOquRs8NpTek0VTy7jiPVWVXq14pPxQWzmOagZVTFB71+heP//TbJQSBisr6yI4
	uDR6oOoZgnVsmDzV8pVn7hWJuRlHPAjyuvCefvnOJmZbJgyD+Ow3IZ/uYGp/IJeOp+rm6FjNTm3
	5p8oFz+Dow4f6GZd5Q5kXLVo2T5pDCFCDThYWn1Gfx0SLR1+daZ2vTTB+9HvsOYkZePqDpAdJG2
	agDiFUt72m9FfUO/9uUyPpwfAeUKaZTUnBhYiSLaJ+u6okw1tB2HzdCraDa5fm19it5mkVDSOi4
	apqDOsg==
X-Google-Smtp-Source: AGHT+IFZTqmDvEfGHPWJHtYU9u0dIPyE8hYBPPfi9argkTx1SKj4F4Bcu7fByR9F5YWTiCJjs2sLQg==
X-Received: by 2002:a5d:59a8:0:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-39ee5b37a82mr4931060f8f.25.1744889229037;
        Thu, 17 Apr 2025 04:27:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:08 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:04 +0100
Subject: [PATCH v7 3/6] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-3-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 185 +++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 3ef3ebde4b2476c1da1fe11383718fba5ff87f85..01a33005969d7df132b1aca26cb0884828c3c8ea 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5195,6 +5195,191 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb6000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0x0 0x0acb7000 0x0 0x2000>,
+			      <0x0 0x0acb9000 0x0 0x2000>,
+			      <0x0 0x0acbb000 0x0 0x2000>,
+			      <0x0 0x0acc6000 0x0 0x1000>,
+			      <0x0 0x0acca000 0x0 0x1000>,
+			      <0x0 0x0acb6000 0x0 0x1000>,
+			      <0x0 0x0ace4000 0x0 0x2000>,
+			      <0x0 0x0ace6000 0x0 0x2000>,
+			      <0x0 0x0ace8000 0x0 0x2000>,
+			      <0x0 0x0acec000 0x0 0x2000>,
+			      <0x0 0x0acf6000 0x0 0x1000>,
+			      <0x0 0x0acf7000 0x0 0x1000>,
+			      <0x0 0x0acf8000 0x0 0x1000>,
+			      <0x0 0x0ac62000 0x0 0x4000>,
+			      <0x0 0x0ac71000 0x0 0x4000>,
+			      <0x0 0x0acc7000 0x0 0x2000>,
+			      <0x0 0x0accb000 0x0 0x2000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x1800 0x60>,
+				 <&apps_smmu 0x1860 0x60>,
+				 <&apps_smmu 0x18e0 0x00>,
+				 <&apps_smmu 0x1900 0x00>,
+				 <&apps_smmu 0x1980 0x20>,
+				 <&apps_smmu 0x19a0 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
2.49.0

