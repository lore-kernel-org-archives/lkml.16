Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22DF23E328
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889231; cv=none; b=gU1cMm7TQwfZuPwuteIwzCIaDjOIvLdWuVytlWqJPmAhW/CA0rQk8sbLtDeF3dy0nLALDJWuhreFIQIKjX0YPA9sHFboFCBAd6oc3wcSawNwXvPcicSOrivM0iF+QEJPmsXlCDKbWd2YNHo2bK5MoGpEd6A818aOzD272qCD/m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889231; c=relaxed/simple;
	bh=yHkoD2LLNVtOlp4+3CahP5h/AR17CZ0yLXBiSRySPsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UECsSiABDGxW1PwfgV/bL2RtyRrgW0S0b458mzfDTOSxDbfQ5tVLHgplUUJy2rZBD4q+1eiPynn+g6VKE71IH/Mt5nZMgWQiNzYT+a2z7X8wrsyULvxadIn4tNO1aT+O7jOq1ejG7fTbCzagRH7nJeaZhjvAQ38RxZMF17L4b38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cND32fRM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cND32fRM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2f391864so346721f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889228; x=1745494028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+yrwEk3Nrka0pmkGJr3BxDshhuy89tcK7yEvs60tYQ=;
        b=cND32fRMxkVUt5dt7qt0NJWyFb90BKfkKoTirRj1EsLJJSnyclk/oaUcXVVoXTVkXu
         o+DANo4P16jrnkpQ+b4j3Q3Zg4qEtlpjoaiucHo8dxyjlSO5kBy16l4kgwrB8qsdRMM1
         OWRzH+KTGIkQoVTZcuuU2MzSf6gIH6Hgr05I8TfhEsyOiO8MdftZeINFzkYBPafQA647
         a3JJzNYhtLKDRBq6REuV134tyy5caSSfS80uISetF2jPW0/97X+vKUPuEidK/Q70P901
         +JpxesLUCjWHQcLkazeOGlwQGj+GLI9bAWGfIbSjYxK0DMMV43MNFeUKOXM92KrG8X+H
         0o/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889228; x=1745494028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+yrwEk3Nrka0pmkGJr3BxDshhuy89tcK7yEvs60tYQ=;
        b=VzM9eaBYN9jBwIiXcNPwL3fqXpi3HJAks5/ft7Kjv11ZyilAHFNcSIAWsomq1dMB2D
         qNAV+PeFR2xHUiU/Z0Q3mxwfme4yTlOVemrUr+Q5RTJOHDYm9zV2HPcPlNeGGAMeeLaG
         QUao2JvQfLXdy9hKq+Vvn2RidCwgt44jKmEIByDVWOlUdSEZ42YbRmnWYOMknzSm2DHl
         6vPRp1TqnEsYMhKl4ED1VlVG8J1MJ+T3HhvkT7XByeovFeDG4d2GBnlP4sHgcWLaVlcN
         0c+sgCBYI7ttstSDYAY9A9Mi4agZ/9byut9iCdgvIGxs0Y7VrvwVtdniM/risuQhavVj
         sp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeJ36vrJ+jgTHSlCT5en4b77rTNTDfYROo4ulk+t6GekToCD7GfFyEW2NQYwQVM9m8E51dlzfhtyS2Sok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHyRyg1sj58KnWZXesBupq/o3CCL0IIxbSNv4LZzswrK+eil9
	7wivmqToEzXUZ51uFm2H3Cd3wuO4krBuZvXl9zytvR+SaDaIrvPyO09FjFgNEyXYQTTz19OCZPT
	uQ4k=
X-Gm-Gg: ASbGncssIaYoluhqh2pgtzVWhD7qYhqwq/f/ieBTj3F4L9dWBwbWLHt3LRO1Q+KNDkb
	rFDswixSLzpInYFPZgH9M8vrD71c7dUOPUv5HT2pUxyFEoNfaVBlTtjqFg8MgEnfK339HKLCnyo
	ag7nyUEiqGjW1Fw3ciaiF4v8SNhTLPdATmq4FwR2xWWs00FnmnkpCeFbXB00Grs3HgNb/gpCuK4
	eZkjlWsGcM1DI46pObo/UxX98YAF2PEYbycxFptuEdd02g9o96olTIwK0x4F8jebfzoC3ppUeFD
	IGWN8poollLxSYoCZSI9pS1PxGy2PVHY293R2jGUWo7sXfnVkSyAi8D3ETTWwipxKipVcOG65sz
	fbHvHlg==
X-Google-Smtp-Source: AGHT+IHUQ5BLdAA2VHGA+nSpSqiLYvZyhqSsq+Y/9zmdY8Lr9fjXisyMa0PSuafwlHLT6YWAdJn6Ug==
X-Received: by 2002:a05:6000:40da:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-39ee5b993a4mr5186891f8f.39.1744889227797;
        Thu, 17 Apr 2025 04:27:07 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:03 +0100
Subject: [PATCH v7 2/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-3fd4124cf35a@linaro.org>
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

Add in two CCI busses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 17e044dbb3b6de278d446eaf448561333e407843..3ef3ebde4b2476c1da1fe11383718fba5ff87f85 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5117,6 +5117,84 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;
@@ -5741,6 +5819,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.49.0

