Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCFE272816
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751413945; cv=none; b=g577nOvghBqgJTCaGZJsdAKM+tI7cflgAQexgcW5XkRM9gLn/yWK6TMX/OKa7F0Tg107yWKYgylviB/nQIuuVkCAlamQ/XVF6Ncl3fuQfpLjYDCIa3zmpE4CLjPRZjmF+JsEjPoCKmIHMip8xswtXJnLz2Fi+YW73HzycrK26xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751413945; c=relaxed/simple;
	bh=tjiBDIKJyNGh8slRUYHUGlQb2/fH8IzZ3HuZgUfr64c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/5N6drs8u25yfLy9Y/qjTFwQ2rEY56CrNEO+DLYPfHhfADc+F1DMa9JpfrYHOdLU8K0AYe0Zqtwkcj+fkshjs2Ejc5/vy0b1ZvtiyOhrzMn+jdX+D24XYzyYUQ5NT0mvamQWZ3nbIbmW6rSNfN3Lu8kbXYww8HM+s5l2+MMDHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFL4gCHH; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFL4gCHH"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3a54690d369so3618820f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 16:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751413942; x=1752018742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMsx/bLIwdUCshMr1seZaeKRpQ4k80hDurVAGXv2D4o=;
        b=jFL4gCHH+WqdlTy0CV6zUEiwL02zyJvruvTRxRCtWIl6+ujKo9R9rHgEEKehyXWDsJ
         XJhA35DYCYMLb6VCPNekr0K4WMqfetbFskavCwUCtieal7Jar21WLAeKonq05f2+FZet
         z8p4jy6Sag4ynTKZraqygo+jbOgu/cZshbhE++m9+sOjAZnks4+xwRZEjefKoPyy1Eku
         /h16BB5y7o76DfwzWtHT3Ywtql12xGGRuLjIZ+MD2AAbZcmiuf7YUlC/z+3A4Gj5Ne50
         VqIc+B18gXesNyzyZsb+DTqh7B1RoG5VFvaWNlfnmxQhb2ECbd2NDpz3SM2rdjTLWv/h
         zhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751413942; x=1752018742;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMsx/bLIwdUCshMr1seZaeKRpQ4k80hDurVAGXv2D4o=;
        b=kBhL7269pCS3dwxwxwi3bPtIgszXQHSEdPnOJG4a5t7RWsQTDlnfn1n8WZerv8WTtI
         O+lPynPc/5BhzDsYbme6qHsE7qeMAD6KKnbYKrFDxzRM/I0pTUtQ3cn/yA3/dOOwFBRg
         QW22gVDFPSGpBUaJT5rvxQXu+/ZEqPTlaoh7LdiMMyj6O5gG4okKBwSZqDWVDMKvpYta
         s9aIs/Uxca2BxLaeD4/5zx8v3NWlJZa0HtPx+hCWW7ETqwE8+eHkKJdsonjv1p/Oc07m
         X5eW11q4rPenJdxGJxdjk0INpa1vyL0E79fcl61GS69Hk3Bh7/1GCJssCfZieGsZtkJ+
         4JVw==
X-Forwarded-Encrypted: i=1; AJvYcCXAXSaCFAXEWsBU6C05YT2OY3CkFw9QAzrtUpkzT4PO2I2+OzVryWU5vS1FmbGTMyESGRmP9hnpp+P8WUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZSNz9riM1hxxrO/qWBH+rpt2R25Y25FhD7Qevh6Pu++Wjy/cW
	NBIQ2/qbf+CU+/bni53yoJBKqdFUV4SbvOFp3TOK94sSTbCMoouFqS3RQlZpAvWRRQU=
X-Gm-Gg: ASbGncu4YL2nof/Zh3+hli3bwsA1JTx6uyXjOhYme4uJln91rUYJm/uz9aSu2lxv3Ll
	I403Ei4oayXyTt0Qs4F7CYByxB4wQAE6cIxXZ3DBAkIAVoXaIrpY/Zy2vS+6uSjgWKRJtdnOJ6k
	HSF7lGp2uCAIPVW+Twgd362L8Q8YFLFVGpo1e7DjqkYtbRzpGDN9auyX6elUYpskLQECqkc6rkN
	0K4DtdABg1SFAey/7duqMW51YeVFd5i9IueWibJRx/YWYkWmGhlIbvNENST4Y2T1FlAjdzimFUJ
	CMzT099SP1h7JuJfjEWqYwIg69RwjTBWvQHYmcb7/GXy1FC9petglc38kcWi10DqiQanvTuiio3
	hMyybgeBJ0mlgHcen/E1SPwWA2Qc=
X-Google-Smtp-Source: AGHT+IFS1vP/5Cv9BvmFda2HPKdYYULEow4Xi68llcAGBd3LmZMnsBWVzW/6pzfXnP5YQBBWppl8zQ==
X-Received: by 2002:a05:6000:2087:b0:3a4:cfbf:5199 with SMTP id ffacd0b85a97d-3b1fdc20c7amr273041f8f.9.1751413941878;
        Tue, 01 Jul 2025 16:52:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5fd2sm179141475e9.15.2025.07.01.16.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 16:52:21 -0700 (PDT)
Message-ID: <d787c6ea-c47b-4dcb-a0a3-15ca8f15528b@linaro.org>
Date: Wed, 2 Jul 2025 00:52:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add support for Dell Inspiron
 7441 / Latitude 7455
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250701231643.568854-1-val@packett.cool>
 <20250701231643.568854-4-val@packett.cool>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250701231643.568854-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/07/2025 23:53, Val Packett wrote:
> Add device trees for both SKUs of the X1E80100 Thena laptop:
> - Dell Latitude 7455
> - Dell Inspiron 14 Plus 7441
> 
> Works:
> - Wi-Fi (WCN7850 hw2.0)
> - Bluetooth
> - USB Type-C x2 (with DP alt mode)
> - USB Type-A
> - USB Fingerprint reader
> - eDP Display (with brightness)
> - NVMe
> - SDHC (microSD slot)
> - Keyboard
> - Touchpad
> - Touchscreen
> - Audio (4 Speakers, 2 DMICs, Combo Jack)
> - Battery
> 
> Not included:
> - Camera
> 
> Co-authored-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>   arch/arm64/boot/dts/qcom/Makefile             |    4 +
>   .../x1e80100-dell-inspiron-14-plus-7441.dts   |   51 +
>   .../dts/qcom/x1e80100-dell-latitude-7455.dts  |   52 +
>   .../boot/dts/qcom/x1e80100-dell-thena.dtsi    | 1658 +++++++++++++++++
>   4 files changed, 1765 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-thena.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a08..d2f932dfcc75 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -315,6 +315,10 @@ x1e80100-asus-zenbook-a14-el2-dtbs	:= x1e80100-asus-zenbook-a14.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-zenbook-a14.dtb x1e80100-asus-zenbook-a14-el2.dtb
>   x1e80100-crd-el2-dtbs	:= x1e80100-crd.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb x1e80100-crd-el2.dtb
> +x1e80100-dell-inspiron-14-plus-7441-el2-dtbs	:= x1e80100-dell-inspiron-14-plus-7441.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-inspiron-14-plus-7441.dtb x1e80100-dell-inspiron-14-plus-7441-el2.dtb
> +x1e80100-dell-latitude-7455-el2-dtbs	:= x1e80100-dell-latitude-7455.dtb x1-el2.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-latitude-7455.dtb x1e80100-dell-latitude-7455-el2.dtb
>   x1e80100-dell-xps13-9345-el2-dtbs	:= x1e80100-dell-xps13-9345.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb x1e80100-dell-xps13-9345-el2.dtb
>   x1e80100-hp-elitebook-ultra-g1q-el2-dtbs := x1e80100-hp-elitebook-ultra-g1q.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> new file mode 100644
> index 000000000000..0ff98752a276
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Val Packett <val@packett.cool>
> + */

Why have you dropped my copyright from this file ?

20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/x1e80100-6.15-rc1-dell-inspiron14-camss-ov02c10-ov02e10-audio-iris-phy-v1/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts?ref_type=heads

> +/dts-v1/;
> +
> +#include "x1e80100-dell-thena.dtsi"
Please retain my authorship and put yourself down as co-author.

❯ diff ~/Downloads/x1e80100-dell-inspirion-14-plus-7441.dts 
arch/arm64/boot/dts/qcom/x1e80100-dell-thena.dtsi
5a6
 >  * Copyright (c) 2025 Val Packett <val@packett.cool>
8,9d8
< /dts-v1/;
<
20,21d18
< 	model = "Dell Inspirion 14 Plus 7441";
< 	compatible = "dell,inspiron-14-plus-7441", "qcom,x1e80100";
40c37
< 		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
---
 > 		qcom,mbhc-headphone-vthreshold-microvolt = <40000>;
156d152
< 		pinctrl-names = "default";
157a154
 > 		pinctrl-names = "default";
165a163
 > 			/* Reuse as a panic indicator until we get a "camera on" trigger */
179c177
< 	sound {
---
 > 	sound: sound {
181d178
< 		model = "X1E80100-DELL-Inspiron-14p";
184c181
< 				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
---
 > 				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
432,437d428
< 	/*
< 	 * TODO: These two regulators are actually part of the removable M.2
< 	 * card and not the CRD mainboard. Need to describe this differently.
< 	 * Functionally it works correctly, because all we need to do is to
< 	 * turn on the actual 3.3V supply above.
< 	 */
564,567c555,565
<                         regulator-min-microvolt = <1800000>;
<                         regulator-max-microvolt = <1800000>;
<                         regulator-initial-mode = 
<RPMH_REGULATOR_MODE_HPM>;
<                 };
---
 > 			regulator-min-microvolt = <1800000>;
 > 			regulator-max-microvolt = <1800000>;
 > 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 > 		};
 >
 > 		vreg_l6b_1p8: ldo6 {
 > 			regulator-name = "vreg_l6b_1p8";
 > 			regulator-min-microvolt = <1800000>;
 > 			regulator-max-microvolt = <2960000>;
 > 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 > 		};
582a581,587
 > 		vreg_l9b_2p9: ldo9 {
 > 			regulator-name = "vreg_l9b_2p9";
 > 			regulator-min-microvolt = <2960000>;
 > 			regulator-max-microvolt = <2960000>;
 > 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 > 		};
 >
777,778c782,783
< 			regulator-min-microvolt = <1200000>;
< 			regulator-max-microvolt = <1200000>;
---
 > 			regulator-min-microvolt = <1256000>;
 > 			regulator-max-microvolt = <1256000>;
791,859d795
< &gpu {
< 	status = "okay";
<
< 	zap-shader {
< 		firmware-name = 
"qcom/x1e80100/Dell/inspiron-14-plus-7441/qcdxkmsuc8380.mbn";
< 	};
< };
<
< &camcc {
< 	status = "okay";
< };
<
< &camss {
< 	vdd-csiphy4-0p8-supply = <&vreg_l2c_0p8>;
< 	vdd-csiphy4-1p2-supply = <&vreg_l1c_1p2>;
<
< 	status = "okay";
<
< 	ports {
< 		/*
< 		 * port0 => csiphy0
< 		 * port1 => csiphy1
< 		 * port2 => csiphy2
< 		 * port3 => csiphy4
< 		 */
< 		port@3 {
< 			csiphy4_ep: endpoint@4 {
< 				reg = <4>;
< 				clock-lanes = <7>;
< 				data-lanes = <0 1>;
< 				remote-endpoint = <&ov02e10_ep>;
< 			};
< 		};
< 	};
< };
<
< &cci1 {
< 	status = "okay";
< };
<
< &cci1_i2c1 {
< 	camera@10 {
< 		compatible = "ovti,ov02e10";
< 		reg = <0x10>;
<
< 		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
< 		pinctrl-names = "default";
< 		pinctrl-0 = <&cam_rgb_default>;
<
< 		clocks = <&camcc CAM_CC_MCLK4_CLK>;
< 		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
< 		assigned-clock-rates = <19200000>;
<
< 		orientation = <0>; /* front facing */
<
< 		avdd-supply = <&vreg_l7b_2p8>;
< 		dvdd-supply = <&vreg_l7b_2p8>;
< 		dovdd-supply = <&vreg_cam_1p8>;
<
< 		port {
< 			ov02e10_ep: endpoint {
< 				data-lanes = <1 2>;
< 				link-frequencies = /bits/ 64 <360000000>;
< 				remote-endpoint = <&csiphy4_ep>;
< 			};
< 		};
< 	};
< };
<
861a798
 >
891,895d827
< &i2c1 {
< 	clock-frequency = <400000>;
< 	status = "okay";
< };
<
902c834
< 		compatible = "parade,ps8830";
---
 > 		compatible = "parade,ps8833", "parade,ps8830";
953,958d884
< &i2c4 {
< 	clock-frequency = <400000>;
<
< 	status = "okay";
< };
<
964c890,892
< 	/* Type A Port1 */
---
 > 	/* EC @0x3b */
 >
 > 	/* Type A Port */
979c907
< 	/* FRP eUSB */
---
 > 	/* Fingerprint scanner */
1001c929
< 		compatible = "parade,ps8830";
---
 > 		compatible = "parade,ps8833", "parade,ps8830";
1048d975
<
1057,1067d983
<
< 	touchscreen@10 {
< 		compatible = "hid-over-i2c";
< 		reg = <0x10>;
<
< 		hid-descr-addr = <0x1>;
< 		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
<
< 		pinctrl-0 = <&ts0_default>;
< 		pinctrl-names = "default";
< 	};
1071d986
< 	/* GPIO_80, GPIO_81 */
1077,1080d991
< &iris {
< 	firmware-name = "qcom/x1e80100/Dell/inspiron-14-plus-7441/qcvss8380.mbn";
< };
<
1100c1011
< 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
---
 > 	pinctrl-0 = <&dmic01_default>;
1110a1022,1039
 > &mdss_dp0 {
 > 	status = "okay";
 > };
 >
 > &mdss_dp0_out {
 > 	data-lanes = <0 1>;
 > 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 
8100000000>;
 > };
 >
 > &mdss_dp1 {
 > 	status = "okay";
 > };
 >
 > &mdss_dp1_out {
 > 	data-lanes = <0 1>;
 > 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 
8100000000>;
 > };
 >
1112d1040
< 	compatible = "qcom,x1e80100-dp";
1262,1271c1190,1199
< &remoteproc_adsp {
< 	firmware-name = 
"qcom/x1e80100/Dell/inspiron-14-plus-7441/qcadsp8380.mbn",
< 			"qcom/x1e80100/Dell/inspiron-14-plus-7441/adsp_dtbs.elf";
<
< 	status = "okay";
< };
<
< &remoteproc_cdsp {
< 	firmware-name = 
"qcom/x1e80100/Dell/inspiron-14-plus-7441/qccdsp8380.mbn",
< 			"qcom/x1e80100/Dell/inspiron-14-plus-7441/cdsp_dtbs.elf";
---
 > &sdhc_2 {
 > 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
 > 	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
 > 	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
 > 	pinctrl-names = "default", "sleep";
 > 	vmmc-supply = <&vreg_l9b_2p9>;
 > 	vqmmc-supply = <&vreg_l6b_1p8>;
 > 	bus-width = <4>;
 > 	no-sdio;
 > 	no-mmc;
1385d1312
< 			/* cam_aon_mclk4 */
1516a1444,1450
 > 	sdc2_card_det_n: sdc2-card-det-state {
 > 		pins = "gpio71";
 > 		function = "gpio";
 > 		drive-strength = <2>;
 > 		bias-pull-up;
 > 	};
 >
1588,1600c1522,1534
<         wcn_sw_en: wcn-sw-en-state {
<                 pins = "gpio214";
<                 function = "gpio";
<                 drive-strength = <2>;
<                 bias-disable;
<         };
<
<         wcn_wlan_bt_en: wcn-wlan-bt-en-state {
<                 pins = "gpio116", "gpio117";
<                 function = "gpio";
<                 drive-strength = <2>;
<                 bias-disable;
<         };
---
 > 	wcn_sw_en: wcn-sw-en-state {
 > 		pins = "gpio214";
 > 		function = "gpio";
 > 		drive-strength = <2>;
 > 		bias-disable;
 > 	};
 >
 > 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 > 		pins = "gpio116", "gpio117";
 > 		function = "gpio";
 > 		drive-strength = <2>;
 > 		bias-disable;
 > 	};
1619a1554,1565
 > &usb_1_ss0 {
 > 	status = "okay";
 > };
 >
 > &usb_1_ss0_dwc3 {
 > 	dr_mode = "host";
 > };
 >
 > &usb_1_ss0_dwc3_hs {
 > 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
 > };
 >
1636,1637c1582,1583
< &usb_1_ss0 {
< 	status = "okay";
---
 > &usb_1_ss0_qmpphy_out {
 > 	remote-endpoint = <&retimer_ss0_ss_in>;
1640,1641c1586,1587
< &usb_1_ss0_dwc3 {
< 	dr_mode = "host";
---
 > &usb_1_ss1 {
 > 	status = "okay";
1644,1645c1590,1591
< &usb_1_ss0_dwc3_hs {
< 	remote-endpoint = <&pmic_glink_ss0_hs_in>;
---
 > &usb_1_ss1_dwc3 {
 > 	dr_mode = "host";
1648,1649c1594,1595
< &usb_1_ss0_qmpphy_out {
< 	remote-endpoint = <&retimer_ss0_ss_in>;
---
 > &usb_1_ss1_dwc3_hs {
 > 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
1666,1677d1611
< };
<
< &usb_1_ss1 {
< 	status = "okay";
< };
<
< &usb_1_ss1_dwc3 {
< 	dr_mode = "host";
< };
<
< &usb_1_ss1_dwc3_hs {
< 	remote-endpoint = <&pmic_glink_ss1_hs_in>;

---
bod
