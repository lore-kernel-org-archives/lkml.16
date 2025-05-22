Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C529AAFB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935670; cv=none; b=O829b+I2Nx+AbRs1V/41kByBqzOU+5oUM3wUXMPk+15m6o+vgIxHlPyu2f8XUDja/sGhBqibzJN1ufYBmsG5pN+ldRfnCu2Fb396IISLaYPBTTIqy9ROFVM2zdsjFMTbdHy63mXTU4rkK9B+SiETPWwq8/dcv2xZ1b7GpmLzLvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935670; c=relaxed/simple;
	bh=BNbG5QUv7yLKoab3TN7OeJodqrgw8mMfg67bIKIfSyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBBfTD9B2MegydziEdbpe9gDxtkk9QS/eSsYXTvZEyHLPKsymSagMxDXYhHBYd5iSWZkGAHogH+pmfbkjRQFJa/yX1vXsN+uwDiab/FDiDjdDJLwGPoBAsDZu+qDaPu29Oy9VlxzcDsh2SIvTFkQs64eGxWTC+5RCdR8iYs9dsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eysVpu5I; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eysVpu5I"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so69772885e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935664; x=1748540464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6FKwmF5+jLRfV9vx9YGmsHlRfBCaucMwtc4QEoZcek=;
        b=eysVpu5ICm4N9f8+bYyVYcwLGCJzWoCwwCRQErXFDVDy6xdxFMfxDGrJNgJvqR1k+n
         DTVVmxObFK7eX9vnNOjhfzFhq/CVwkwbDSZpqc/UwAF94JXdcz4vFVz0sjWanWK/gkO1
         5dMWeVGia4G84QapwIK1jw1MMMCId1TmLM2RqYmjQ1cE5ODMkXaG27W118L1UodKglQ1
         cNvZOxhfpA5c3D6nbAtpjGpBdElwwmlz0VepUn0nAZD7lsElRVQlLSfY/N6ex9CuDFv7
         wXyHfXJMuv2KMJ3Zga2D4M6BDV+UZU2+cJ/J1zmwyCXN5FeRDeDsxm1Fe8ny1/y5H75i
         fueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935664; x=1748540464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6FKwmF5+jLRfV9vx9YGmsHlRfBCaucMwtc4QEoZcek=;
        b=BS1N/bufLRB9RAvWGFvNGMDgXMBAcizPadSVlUhoMFzAb+kO/3jhaFxzVdH0kCO8Xu
         ZjDLfiPgcjcfgMkDlD+2ctQ3R+6mNS5VMllk4XRRXlf844O95XC2Kf4TEdORDagK8A8x
         EgzFTRBTuOHl3iRFSXRzlNPGM66UXBX69OJMd23K7p9SinVyY6ZinMbn7O7M3vwmIu9q
         vmUxqSpEfCvejtOJDfYbzqR/DWZXuAY5pnSREwbCPJteabsoyMm86zcQhEyEReqK53BG
         ereHI3+ygb/WCk0A8rmhqphfRfHW0tHvXFZDb5L1XMD3rYYHOUio+22ehc0LnJfLS8oM
         HH6A==
X-Forwarded-Encrypted: i=1; AJvYcCW9bqNucMmJq0Asb5jHmzho0dQLsNC3Zsd6yOAmNrgOv9QsCPdsH4sLIaliQzE27dgHYt+fFps0A4k3cPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvdE4SYiToCs9N8xzNyeDsVkRZAW/c43QkABpdT+Mur+dWWj3g
	8Q/RCxCq6eh1nLtosW5CNJ+Vqn6WL288sqdtkEN3+9a8btCxPm6bF1NcVPMHpAH9Oek=
X-Gm-Gg: ASbGncvvufsrnIWVmmNL6IlI7gHyEO2E9VUWrqaR9CRITWiAGdy3Kg/9PqErpqtEV64
	Bb2/h1Ig1o/XTpgyHBLJPcBTC0emiUwXdKkXxo6UBaKVQVLFBYP6nwlb0UVAodcssuhyn1tEsi+
	HmhaBCSnRSpl5yT53WDnQYAgU4nS57AfSFgIi4mC771/1C7ltxSfIO+mn99LDnx8YTloodgzFR4
	mnWB1J2ckw5cLkvigy1O5Y4gzxAJZBAbqPfSDuDysjzp1bZ1Jk8uwFmW01bURgJORt7ZzVER+8R
	o+BtIEBbyqxxvOMnQrtbXpkSgSN3+w2BU0E8OVsuONeFQmvbfXhKGHHX+L0=
X-Google-Smtp-Source: AGHT+IFCO2nalfynMbnFtpdrYcmt4ThnBH12O66Yu9VQd9AYmKtc0tqcoyEJ/k10JkCOLl8VaER1HQ==
X-Received: by 2002:a05:600c:3f07:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-442fd60b516mr271515455e9.4.1747935664465;
        Thu, 22 May 2025 10:41:04 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:03 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:59 +0100
Subject: [PATCH v3 09/12] arm64: dts: qcom: qrb4210-rb2: add wcd937x codec
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-9-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

wcd937x codec contains soundwire RX and TX slave devices
and can convert digital audio to analog audio and vice versa.
The codec node also requires description of reset pin/gpio.

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 47 ++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a37860175d2733214f1b257e84d5cb4821033242..6bce63720cfffd8e0e619937fb1f365cbbbcb283 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -152,6 +153,25 @@ codec {
 		};
 	};
 
+	wcd937x: codec {
+		compatible = "qcom,wcd9370-codec";
+		pinctrl-0 = <&wcd_reset_n>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+		vdd-buck-supply = <&vreg_l9a_1p8>;
+		vdd-rxtx-supply = <&vreg_l9a_1p8>;
+		vdd-px-supply = <&vreg_l9a_1p8>;
+		vdd-mic-bias-supply = <&vdc_vbat_som>;
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,rx-device = <&wcd937x_rx>;
+		qcom,tx-device = <&wcd937x_tx>;
+		#sound-dai-cells = <1>;
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -605,6 +625,26 @@ &sleep_clk {
 	clock-frequency = <32764>;
 };
 
+&swr1 {
+	status = "okay";
+
+	wcd937x_rx: codec@0,4 {
+		compatible = "sdw20217010a00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
+&swr0 {
+	status = "okay";
+
+	wcd937x_tx: codec@0,3 {
+		compatible = "sdw20217010a00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
@@ -689,6 +729,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	wcd_reset_n: wcd-reset-n-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+	};
 };
 
 &uart3 {

-- 
2.47.2

