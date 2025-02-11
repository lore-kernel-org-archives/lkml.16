Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9D7253331
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286135; cv=none; b=lD07eiJa0/3gk+PkZKNsdudkPKzWl+T4yha5yiRpfY97+VFSLoLMwjJvWeZxsx7HzIohg6I9fS0siur/oeWnBiEIa/mRPt+9wt0SbG8wMRaNbTh44/bp3+pYl0dSWNSZxn21zwCy9l5k6Ak0jkmYR2+y/18nQEBaonUt0KrkkPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286135; c=relaxed/simple;
	bh=dvYWvYpE3Jvxu+gXiYuB1dF3brHIeiUKLaI0UmHV/zU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=odllCFz4eogxcK4JvJAWtXoNblqb7Vww+aALoUldlMOOTjCzvBy3a/Rd1L1Te4ndhX/5Fmo5Tli6o1cLB0U0s4LJo/62lDx0WeWOfEZXy1MgDIj1gWhVJhmLUFxyyox6sSwYvnRg/GKltEevpdu9OZnVsa26BuOW5GIhEpksn1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uR70z4Nt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uR70z4Nt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43956fcd608so1800575e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739286130; x=1739890930; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0dC8Epp040zryKszPUJtEjy9aGy98jeZ8PAn2t0IV0=;
        b=uR70z4NtJfIFKJZQnB3+tyt1aEfuYo2//4nEP6tZzFN2wM8X41czcA+VxuulpzppOB
         qi2lultx/XdS7sDJZdYBaqGkVHLI7ZNSPTbiSBg20V90e6Qwrw9s2xuOsMAFSY5vWv4y
         boZZin69uMidYSysOrSf8vdIMRZaQUfBKaBTqZxMHvlAZ+biLg0s6dANIRBz0QDQqjQM
         nfNryHkmqRB/f5Z9U+Y8+7N24Zvqksgdv8BGDyM1oLEn/6hixpg0ElLghNKfZMgDZFdQ
         xbmNBWPUG9nLWsU/JJpiX7lxJ+eiKaBn2lPl3ix8AvRIeU+vLceweNhXNS5K0wcSxvdO
         Iz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286130; x=1739890930;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0dC8Epp040zryKszPUJtEjy9aGy98jeZ8PAn2t0IV0=;
        b=WDrZ5AZFXnV6k8/CUuofO39ONhj8orrNBrZTHrtIDR2qX1jCfHE+NLBdQ3CAFX+BbV
         fBdxciQu9Ez35cnO2TZNf1E0eeNqGWByyKdX4wupziQq69B4QLpZMq1hNPyQnUE/MDOz
         u7NbqktMeFUZ8CYoqinskl9oJqZ+gvaE6NzJIOQxhbh3zjUbNniqTwXaR25mRqXA/r+3
         eFmqFGSGO2ycfZL8MhkS2cMa6cufQdX8B4r2DH/wyME9MK5paxS/POZ7IiCTYtXi+3da
         +CO+svLxJTS7XU/8RgGjWPKtWrqXclSQu05mRtxHtAzZL7HcaEXiuT8XJ57ekOFb9dmh
         aa4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpjQpfYNVKyytHkVDmliIwgm9NIXdk48irsbrE48a5Hn2m5V4KzeZDpIVgos99NUE5XZ3ih8lqjIq23sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxjAIyWZuiHNcUsme2ecYaB/xjWrTfLCJpwBIQUhRcc9wiuFH
	pdrQynD6mVtJPxlZmMj758U36HxzhFAg8/n7vqJLNnAmc7CJ2IYjZnJAzkzrinM=
X-Gm-Gg: ASbGncv2KN9l6pO4ZpoJNFhQ7NdxqqSmaK1IqlGdBrsBCN0Wc0in7qwQq7HaxTv0nFH
	MPpF4lcl0Wox09iWXKw6/ztPuTHgNt4913NJhSWYh1B3sjj1XGZ6JkIgVpaG9skubUX3Pc3d9NE
	WnhWF0ZUMuHYgs/yyXQaoOGlzvTnicHeVHm+q3/z5f+DzUITz5V9Is5FZyz8jqpJZFNBG4lgUiJ
	wBGECvjPwNmjuefNfY+vSxAEae3Z6LZcZFqtH0bH9vu/FKQBSZOjDpsFqg02s15Awd3HLppl7vL
	gDfwwmFHVJCtg8cKqkesXO//E+zWrA==
X-Google-Smtp-Source: AGHT+IE3hOhZQU5ZeJLEQpHMlcLHeykRfe1aYsIU6hPc4YIbHN0eMAEFBWd7Mya11+12QdoFN1ukmQ==
X-Received: by 2002:a05:600c:8408:b0:439:554e:70da with SMTP id 5b1f17b1804b1-439554e74f3mr24840185e9.31.1739286130051;
        Tue, 11 Feb 2025 07:02:10 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d246:cdb8:d31f:c898])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf3c70sm213721975e9.26.2025.02.11.07.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:02:09 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 11 Feb 2025 16:01:56 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGNmq2cC/32NSw6CQBBEr2J6bZvuQT668h6GBWADnRgGegxiC
 Hd35ADu6lVSr1YIYioBrocVTGYN6ocI7niApq+GTlAfkcGROzNRjgtLQTHh+LYgE07NiK5ui0v
 RZJSkCcTlaNLqslvvZeRew8vbZz+Z+df+982MhG3OWZYyVTXnt6cOlfmTtw7Kbdu+jrSFa7cAA
 AA=
X-Change-ID: 20241007-x1e80100-pwrseq-qcp-2bf898c60353
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2

Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
combo chip using the new power sequencing bindings. All voltages are
derived from chained fixed regulators controlled using a single GPIO.

The same setup also works for CRD (and likely most of the other X1E80100
laptops). However, unlike the QCP they use soldered or removable M.2 cards
supplied by a single 3.3V fixed regulator. The other necessary voltages are
then derived inside the M.2 card. Describing this properly requires
new bindings, so this commit only adds QCP for now.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Rebase on qcom for-next, patch 1-2 were applied already
- Mention dummy regulator warning
- Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org
---
The Linux driver currently warns about a missing regulator supply:

  pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy regulator

This supply exists on the WCN7850 chip, but nothing is connected there on
the QCP. Discussion is still open how to hide this warning in the driver,
but since the DT is correct and the same setup is already used on SM8550
upstream, this shouldn't block this patch.
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 144 ++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index ec594628304a9ab9fe2dd7cdc0467953cd82dc1f..4240c608a4087d8173c1e92565e3c729fd15bed6 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -17,6 +17,7 @@ / {
 
 	aliases {
 		serial0 = &uart21;
+		serial1 = &uart14;
 	};
 
 	wcd938x: audio-codec {
@@ -337,6 +338,101 @@ usb_1_ss2_sbu_mux: endpoint {
 			};
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -825,6 +921,23 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie6a {
 	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
@@ -1135,6 +1248,37 @@ wcd_default: wcd-reset-n-active-state {
 		bias-disable;
 		output-low;
 	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
 };
 
 &uart21 {

---
base-commit: 18f0a0ac2430a17949aa3b393ee22f7ad0de37e0
change-id: 20241007-x1e80100-pwrseq-qcp-2bf898c60353

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

