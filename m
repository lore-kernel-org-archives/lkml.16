Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E704720126A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648496; cv=none; b=Yt6g7ZU3p9wzdGtABzl6qINyJI9su9QOYOzovQGhLE9h1N4/8juqjJQkiMFo8L9oj+SW9SExEL8Sdv60Cm8aSvDn3roYAuJ899k51Fc9smZKBpjc8OxjMQjhbQBXofqKaXyj2VLW84PEWY+6BkOc+1ubskBFS37OUNQw2ezDJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648496; c=relaxed/simple;
	bh=V8Ru47Fo4tyHI/L6MUoUu/hhtuHkBv+MS4v17qwIbxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbNZ2CKsDvK21MGHpHyQwnmhK1XCKx9cxnIQb1ie/o4/cc+w61A0VDvpKQ7RIwXkx14mUp4cDx97R4aEcwNdwCebUmp+7HIwwxpDgXvfDLW9Frd4/bzswdZdmu6MMQ5eJgxD+XGsaZ0GeCbHRCZv5vmwJvekRAo+DqqzDz1xUFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sK5Ngv5d; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sK5Ngv5d"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a364d442e0so350644f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747648492; x=1748253292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqqCqfFZRXOEhpkUS7pSky/TNFachoRi43aCuktKstc=;
        b=sK5Ngv5dFoBXgWPVp+wQIMfjDacVC3eIpENpcyzNMvH/BqMWuJDPWdojNLnIiJU7Vy
         0WhSe1rDdzfMwi1tzraf21GPFUDIHYVO03r8OhpeYCFQxwN3j1C1WglpBp84UMIhFAt2
         pSCn2DN9GFVOsaYAG9Zl4GIKAFS9CA5CLMXaI73mZHmBCHAKHX8qfWGMrOTZYogsFIxI
         ygZZTTtrSSpULfMrp535z8qzPT1JvuVapd0l8mAajjpy3mL/kIEoRrTfTXh2fU2qPb6S
         BYcLFPnGPJvrBzy58v8wlG5C2CbfpGYaRCnEDkpTfJeNL/gjC1/GZboRzTCFh7uhA+eV
         KWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648492; x=1748253292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqqCqfFZRXOEhpkUS7pSky/TNFachoRi43aCuktKstc=;
        b=i5pM9zbzrN3C4DmZHTIcQdvFR7+v2W0z6dLAGercefnf6cd9yLeJzoKTcRyw0tqlEo
         sQMplRThWcw43c/7pJlXCfJuMlgm6AaI2xVP8gVEEFfg6TebbOqfQQ3Nz76E7abGJOjH
         NRPy+V9WCQoNX/YauyaUPYvELOaq+CyWupl89oU844uCGBEtNFXA803A6wpaNgS7UofM
         cPDyqFR6BPWnYzjuVr6zVb9kzxCAZCctce2UHFW7U2ftUeCJ5cb2rq+y77LRRbvr+DPa
         2pTBl0Te5iQTK+bFU7bIw2oxoteN1/OUnxmU8gewO03gnA1CzcDkKrxHoUC1TK73tP/e
         7XHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO5gtm0hbgrbPiIyHN7KSzh00LPH+/6Uji3wdCruqNoLvi4AvUBiSZ5vDHpfPkkjbDYBwtz9/8cmkMNas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJWTxWYpUuUKiz9IkJ/esIxhDQ964h6yMHhEE5/9iC1Hy48npU
	d/L2lKpMuhwzcRfQkecShyN0can/2407sAf2NE4qjVE1MKF+2NveH/Rl8QV2kdWqiIVveZAIb9j
	LQogI
X-Gm-Gg: ASbGncuWzNprIpiSk6Ok9+Pjb2I3rrOWN0Fbtom3wFRbNSDfXNjFtWRHLEg+nYJqhDh
	jG5oRuDvq+BB2am3zybQHqCKQFMeu6QIkR4Wfe0lySBoBv3mM4YC16a/FrfjFmaH3RZSgwE9Q0H
	y4UKLUeZU7PArfrVRr0BV8UdTPmc045f7y72iVB16QGhxLd2V3f0nEcvoDKRpyDXXzNuYv81UDV
	Z58aO0jV+KTU9NX4XQeT5XURjkHvZdLvpQwaZ+GuiY3JT60tSSQVd82hdI42twV3z6xy27oxUav
	PaTnYys6Cs/tV80Vm8QEZ4KLxSBvKDKJz99x2O6F8c/jWYPLEVD7MxfWyo7bSNegVL5ccv0=
X-Google-Smtp-Source: AGHT+IEn/hlJirgfwgYmAu3I7CImPjVfABma024DDXhy3tyFKMjkzkAKBAqXynPTpjIsJIkbrexjDw==
X-Received: by 2002:a05:6000:438a:b0:3a3:75ea:f9d3 with SMTP id ffacd0b85a97d-3a375eafce5mr354609f8f.11.1747648491756;
        Mon, 19 May 2025 02:54:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d0fasm12282616f8f.8.2025.05.19.02.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:54:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 19 May 2025 11:54:44 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-sm8750-audio-part-2-v2-2-5ac5afdf4ee2@linaro.org>
References: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
In-Reply-To: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6636;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V8Ru47Fo4tyHI/L6MUoUu/hhtuHkBv+MS4v17qwIbxk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoKv/nBOdHYgHix3bFwSOiZEOMBHbyc1/NkyPzq
 PFXliyDdUSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCr/5wAKCRDBN2bmhouD
 13sDEACAicYxV+J+bZzFxQ9W/wCNWuzug91257AlHH0jsRrl7nkHCXWF/9pm/pIdS9W8fydcWLP
 VKBsBsO3yfA4TziBMWrLGpwwFAZpjL/1ZdNQEBZcz2I4CSv0cOQsRGsdIT0PzNav5MjFh7hBAxC
 /LVrg/5+XOZeGS+74cjkFRqqN6oOwegTfLDKKctayVnDdz+01nci4hnEYk+eZMD21nXuzL12K+m
 bt0CVVOUWZj/ZjvqsaF7oZC1slD23VV8mNDbnGPFe/5S+pfA1ZdTyTZo247gZySV/rvinuawaQY
 B5w9RBqjimm/f73/vAbLx7YrpXQZnUifq4ZNcbFk8w/Uyan9v/zx25wD74tBi0g5B9MOXL/hirt
 6y65RCC1obS1d9a5YMIsds0cR5/eAh0i3KkYE3ogHNmE7Zt7fS/HbzGHDJCJIt7y+LTf0d1KyHM
 RrAzXPtxYUbmoAlt9MdU+JXtSYWvfgZYxWrPVI7myWVoZ/2dgbLurn0AtCU/QcOB8zYhCvh8BD+
 o5h6oZrMQ/LYCmacCn8/diYGnnAMlldWnbINqyH7ZZJ1DkpRULgbikGCM2+cEmRbSE+/OlMIKRo
 eJIKpugIV4sbfN4i/GutNzZe8WOoGLK5omwaSH9G7L8TcLDi2bJHIwc3BAEE3avEr6KORwjlfXn
 MulTpAOuC8KvsvQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add device nodes for most of the sound support - WSA883x smart speakers,
WCD9395 audio codec (headset) and sound card - which allows sound
playback via speakers and recording via DMIC microphones.  Changes bring
necessary foundation for headset playback/recording via USB, but that
part is not yet ready.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 214 ++++++++++++++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..a5a791f039b240ee9922371f43f3aa98b32b00f0 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -29,6 +29,32 @@ aliases {
 		serial0 = &uart7;
 	};
 
+	wcd939x: audio-codec {
+		compatible = "qcom,wcd9395-codec", "qcom,wcd9390-codec";
+
+		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
+
+		qcom,micbias1-microvolt = <1800000>;
+		qcom,micbias2-microvolt = <1800000>;
+		qcom,micbias3-microvolt = <1800000>;
+		qcom,micbias4-microvolt = <1800000>;
+		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
+		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+		qcom,rx-device = <&wcd_rx>;
+		qcom,tx-device = <&wcd_tx>;
+
+		reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+
+		vdd-buck-supply = <&vreg_l15b_1p8>;
+		vdd-rxtx-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l15b_1p8>;
+		vdd-mic-bias-supply = <&vreg_bob1>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -81,6 +107,89 @@ key-volume-up {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8750-MTP";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2",
+				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
+				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */
+				"VA DMIC2", "MIC BIAS1",
+				"VA DMIC3", "MIC BIAS1",
+				"VA DMIC0", "VA MIC BIAS3",
+				"VA DMIC1", "VA MIC BIAS3",
+				"VA DMIC2", "VA MIC BIAS1",
+				"VA DMIC3", "VA MIC BIAS1",
+				"TX SWR_INPUT1", "ADC2_OUTPUT";
+
+		wcd-playback-dai-link {
+			link-name = "WCD Playback";
+
+			codec {
+				sound-dai = <&wcd939x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wcd-capture-dai-link {
+			link-name = "WCD Capture";
+
+			codec {
+				sound-dai = <&wcd939x 1>, <&swr2 0>, <&lpass_txmacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -702,6 +811,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+
+	vdd-micb-supply = <&vreg_l1b_1p8>;
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -806,6 +923,74 @@ &remoteproc_mpss {
 	status = "fail";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA883x, left/front speaker */
+	left_spkr: speaker@0,1 {
+		compatible = "sdw10217020200";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lpass_tlmm 17 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l15b_1p8>;
+	};
+
+	/* WSA883x, right/back speaker */
+	right_spkr: speaker@0,2 {
+		compatible = "sdw10217020200";
+		reg = <0 2>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		#thermal-sensor-cells = <0>;
+		vdd-supply = <&vreg_l15b_1p8>;
+	};
+};
+
+&swr1 {
+	status = "okay";
+
+	/* WCD9395 RX */
+	wcd_rx: codec@0,4 {
+		compatible = "sdw20217010e00";
+		reg = <0 4>;
+
+		/*
+		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
+		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
+		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
+		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
+		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
+		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
+		 */
+		qcom,rx-port-mapping = <1 2 3 4 5 9>;
+	};
+};
+
+&swr2 {
+	status = "okay";
+
+	/* WCD9395 TX */
+	wcd_tx: codec@0,3 {
+		compatible = "sdw20217010e00";
+		reg = <0 3>;
+
+		/*
+		 * WCD9395 TX Port 1 (ADC1,2,3,4)         <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 2 (ADC3,4 & DMIC0,1)   <=> SWR2 Port 2 (TX SWR_INPUT 0,1,2,3)
+		 * WCD9395 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3 (TX SWR_INPUT 4,5,6,7)
+		 * WCD9395 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4 (TX SWR_INPUT 8,9,10,11)
+		 */
+		qcom,tx-port-mapping = <2 2 3 4>;
+	};
+};
+
 &tlmm {
 	/* reserved for secure world */
 	gpio-reserved-ranges = <36 4>, <74 1>;
@@ -814,3 +999,32 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+/* Pinctrl */
+&lpass_tlmm {
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
+		pins = "gpio17";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&tlmm {
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+};

-- 
2.45.2

