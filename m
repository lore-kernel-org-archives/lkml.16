Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB961FCFEE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748260006; cv=none; b=tFOWaYdJxEmLM6jvkSTJB9CNEHOyhn8k1xGtHnYrIhm7c1SNZnVHemd9/sRryMGepi1ha2HRVAc1OwGg+uDZLjHqsWeC1jmakTLT2qw+hzV6v7GcFY4kmUKQ/8DW/WvQmJaj3flTzSLt3xo5oe48P0dkDZUPKY4OfVvkYNB2wFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748260006; c=relaxed/simple;
	bh=bJ6lGifQIT+ZBeucSknj2+MyaK1F5NGNsJWUqaVzyVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIFDnUqkCh9lOdbFbumW6dko4A40marzPmJgRhUNU7N4EeegiaidzPXu1gXVIBg7rGor9CrXKFAnak6Usvrpih7+fh56q96Gngk69bqwx/3KwHHxPBFn9XCWMwTYyPFe6N+Q4UGRP/QkPEEgUdojat506cw/pp2Otk2nuBKrzDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbZV9sRz; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbZV9sRz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4cfa5c8ddso349231f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748260002; x=1748864802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcC6/D6bHu1AIqqOOrM3yvR9MZ9pTE9S6Us8vaRlrZg=;
        b=ZbZV9sRzvmajuzrl7k4JGIroRveOzCzyQ0/ncsMUuTcIoyAxgk2LYntIXnufZX3nxn
         df4gh9ghGH7F9SczulT7eNvDxO3cbUwqGLDSNkNhRTHiwWCRO3VM6TKpuzdrP3E+oJtB
         CPZHmS7fUDQD07DrASxjAtVwfnvSwzsfyy9yhnqJzphqqbp7EF5m8cDgqrzdMald+EcF
         HfGNbm7YYQfRkXJvRI6OesEZpEYKOE+N52PWUiTHTlF2RjmpopYBgzR+Tmieyy5cOeF2
         2y5CecJSnR8JYbHfaWGuuD2iqL4gW8iWAF7pCvNIU8l5x4RGepl0QguofKAaM+z+PTN9
         ZIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748260002; x=1748864802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcC6/D6bHu1AIqqOOrM3yvR9MZ9pTE9S6Us8vaRlrZg=;
        b=Ec7F/zYmDjAuAYeFg/tfHb2qMW+jVNpRtdeSZUbcPlHlpPGZyAGkSpdTX4ZT3dE5Eu
         b/knwsXZf2hrXT6ThZ6X52hoZ54V0pVDdrbvECvYGZ2HesWp0y5m+mqfx7ylPRNV/0xs
         hyLWq3COwTgPM/QsznD5tMgm422TKmTtsL2aDR2+9hp2k5OmgRoOTwDAuuHMuAjXxz4P
         1UZ7j5a1yOGk7PO9hJNuVEfACDCTiWPy5o2sBU46v6tZ5OOVjBf+nYLTycHIGoq9Amx7
         JfNHC/V8mDZgu28UhzbrZK+wqJM/Z6JTwgwpaFhfarw4htx0ODHBklesGOUFfBUKNgCV
         lInQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOGBR3F9oQ7jS1EzwYIJeM8plzSWohA3qoEEJi/4h4FF2oEeTT9v1NVL7tuM6LRJ2YDN9QfKWnda1d5J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ICahBInvupYUSigwRChJbUk1xm6xoCT6dGbXvCyB67H2NWez
	oEDnby9GdrYe6Y5WmD0ETn7jBIEr1NaRQjb4+4h6iOq6obBj2lmih6YPEmlKul3NohI=
X-Gm-Gg: ASbGncs+pPAg/GOJ8/LE9iqwebwCyf6rfcjFcjuCse5YVJK7Nh97mIyb4u4/m/aR5uD
	ed4ETz1nIk59o2PBLzEjvgI2CWqMb7uwz+7YECzyC2b5Texr2/ZWESeNeNrU1He5IUn0ZoOqJwp
	B5kt5QTvSv99a2W3Y47R0uSJhnmlIJnNGEqIdLf8Lx4AjDM+WkfvN3//YkbcpJVsDpI+QwhFufP
	CPf7gGvnNs44fZa9rNuu7lpKftIqsFBCK8M35T58M8zlEUz4Nx1pDfMIQqa2WWGIiSBTOmlyUEc
	O0c+/CTmVHbndTV/kWHb5r1SHYFS8dJ72XX9vqMTa3u0Cvr6PnwvNvexi59zc87BybP5ju4=
X-Google-Smtp-Source: AGHT+IE0VI5ghBpvpoBulLaSxnAC+korsgJE7w7jptTWZA/tLkhxL5lFocuc3k1VVPc3L4llWsMmcA==
X-Received: by 2002:a5d:5f8b:0:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3a4cb483096mr2280103f8f.12.1748260002407;
        Mon, 26 May 2025 04:46:42 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm7592310f8f.11.2025.05.26.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:46:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 13:46:34 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8750-qrd: Add sound (speakers,
 headset codec, dmics)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-sm8750-audio-part-2-v3-3-74429c686bb1@linaro.org>
References: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
In-Reply-To: <20250526-sm8750-audio-part-2-v3-0-74429c686bb1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7176;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bJ6lGifQIT+ZBeucSknj2+MyaK1F5NGNsJWUqaVzyVA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNFSchHytWbez+Qd8A/hVJjiW13w2q5aDOwFd6
 uTHP0TPkRGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRUnAAKCRDBN2bmhouD
 18uZEACTnKznZ310+iR7yhsCg+Pl+vPpDx3nbZeLGf6NGo0Exkzjiz68q2KeESj8DZAFys4cBtG
 DoxhAnrRKD6BD3GhtNFx1qJPN0njCh5MhF3415NBmWC2hvP2bEdyh6sJeMY1Z4n3NJWdFnLNp8x
 NeLh4gb9pcGPWHwI+m423bY3v1kAT56U35qnHlFYvtJPnSLr5gXsgKKx9nt6VJy8nxm8IIEGDhU
 Cd9DRvhS15urPZPQRdJL8K6KLJFqvbV/IKCJRC6bGZoArjNuFbqZUJxTPVUNtcDfeivjflOzDZj
 gXmh9KqbT0QzcGaCxEYygyHMrGm5GRHp7Q8MnxfNKYavVFimgrQ5hARibE0HIzFS/izjvwsrbw6
 Ybp+1/f+2CUUk1/eK9UaP88OpmqTwvvho9WNA/HmL1LEBPc3MeL66E1xncBj/8BelN8kp3gC+YQ
 A6GOXs4bbERU/ZWg9q97WDPnpRBSj/4oxu7jG3VXxZl5EQ20Gz2GMATaNsCPABqTe7SM6cS3M5q
 a7D2jCeSRkisC+n+xUQorwLnZOh5h7yf9OD3SegL8d4ApteWl/XOEm/BFx2lbzx9gtgHHKQuV7u
 eBU1X8NlIdgWpZnOCvdwp1/zGov9a2GSSImQu/8+mYIr0JRTLzvQbtzc0ZLJKx8FuQmdBLVsBMl
 1KxFkY7Aqpw72wQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add device nodes for most of the sound support - WSA884x smart speakers,
WCD9395 audio codec (headset) and sound card - which allows sound
playback via speakers and recording via AMIC microphones.  Changes bring
necessary foundation for headset playback/recording via USB, but that
part is not yet ready.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 225 ++++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 840a6d8f8a24670a01376f8fce511da222159016..87e983a5c0e9b82487196adc3b50cc314b6ed0e6 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -28,6 +28,37 @@ aliases {
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
+		/*
+		 * Mismatch with schematics - downstream DTS has L15B at 1.8 V,
+		 * schematics L2I at 1.2 V
+		 */
+		vdd-px-supply = <&vreg_l15b_1p8>;
+
+		#sound-dai-cells = <1>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -80,6 +111,88 @@ key-volume-up {
 		};
 	};
 
+	sound {
+		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
+		model = "SM8750-QRD";
+		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA_SPK2 OUT",
+				"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC1", "MIC BIAS1",
+				"AMIC2", "MIC BIAS2",
+				"AMIC3", "MIC BIAS3",
+				"AMIC4", "MIC BIAS3",
+				"AMIC5", "MIC BIAS4",
+				"TX SWR_INPUT0", "ADC1_OUTPUT",
+				"TX SWR_INPUT1", "ADC2_OUTPUT",
+				"TX SWR_INPUT2", "ADC3_OUTPUT",
+				"TX SWR_INPUT3", "ADC4_OUTPUT";
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
+				sound-dai = <&north_spkr>, <&south_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
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
 
@@ -803,9 +916,121 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Speaker North */
+	north_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		pinctrl-0 = <&spkr_0_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <1 2 3 7 10 13>;
+	};
+
+	/* WSA8845, Speaker South */
+	south_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		pinctrl-0 = <&spkr_1_sd_n_active>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b_1p8>;
+		vdd-io-supply = <&vreg_l2i_1p2>;
+
+		/*
+		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
+		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
+		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
+		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
+		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
+		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
+		 */
+		qcom,port-mapping = <4 5 6 7 11 13>;
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
+
+	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio101";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart7 {

-- 
2.45.2

