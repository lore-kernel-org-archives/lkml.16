Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8801DF97A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410036; cv=none; b=rxqSTMh6iQTK4h5jJ1pPgEgRY0lokIHUVThO8+QO7KgM9R1O9MWIOKjcrYGY9/EJNT7iSvC4toTLdN7g31IzjH099uHFsG8WDiO/hS7IRwSuTFXGdpnyd4TkplNygmsl457qIW9p4FL6fJnrs7g6W1c/m8f3sS0K6EFdy2qk8Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410036; c=relaxed/simple;
	bh=kGmKANfdhOWMc2NIICGd2lHsDUK4va4x4t/FbpdrmFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsymkbDF0NmYv8bxMKyZEt+6GMw22lUqg4z7yQqXae3SOSzXwx42gceY0Nj0GZRROeHiWfmw2O26CzlVjGCgIGcaZzBs19rMpxjZdddyI3ueMrWZ7dkyOupKx8xZSrD0uC2olbfkDnbcrQZefyfnUx1QFdL01VLWORY1PX0KVF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g7PytPKm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g7PytPKm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so21731345e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743410033; x=1744014833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmivEDxcKd/UbFOnvXCzL0UGhUqRvj82zaS96zCSDCM=;
        b=g7PytPKmyxiymBIctbGNRdE870PaBjsi2l23S89S3Pv5G5a0itOOKLKhl0oJuawa11
         0ZFwapcm0lnMcrFT90YnFoS7dmFT7OBpEdnLd9uaNK0wirFns9Zmx5DIPFBazR39nzkm
         kodd2PMIH158mDCYTzLHLqpnmDn8+M5KXLHGKOPAcmE7065e+Y6kTEQ+oXBk9Db1xWcB
         Fvi+ufeP7EFoB0+m0ARhWwrCA5RACIPF3K9lHwxsMRQcGV7ySpTY2zL/KCEhGvpigfvC
         0BYqkaTc553U6+5R2Qf30uuK/7HED2LZ5hfkFmHPgLYYrmAsbL7h2cur1fRsAld4T0Qh
         yOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743410033; x=1744014833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmivEDxcKd/UbFOnvXCzL0UGhUqRvj82zaS96zCSDCM=;
        b=UjLmpKCn1cLqjJPBGDm5FDmrimd7s4cVUbuAJwaaaYg849LD+BdRzjzPjoHzGc9kJP
         qDXsIpe2A4I2fFDAxbGZAOQR68Y3w03ME4F+JDxi8lrLzbfJC3gA0+4iKrUVcBhQ7j9O
         KrtbH2sO2XHxRiB9zxO6aJQ5g8hUe5i27Ybwc1aZaFvptfGmNaSUzMVX+g/iJpAcz9fM
         kigPXglFtxQzVlkYA5zl0UHiyrl4jV++yu0wIN8EBk9kGFm4O61mEkolkcTqIcCmoZ7e
         QA4Irj43Qe4K+tut9cphUK+KO5ZgXsedJINmayfW5BbIURAESKyLZ0weQjvp1lXgi+jc
         Oo3w==
X-Forwarded-Encrypted: i=1; AJvYcCVs/X6tx2+3xDQSwIFMwsisqc4i16lfe1rbIXBwSe26Q9uSA131t3UAA/6FRIaIzaBkI+3V1rpo01j0Fkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmCwWRHU1VaiP5A+vdAGAdVwHRTMq98n8Zf1abal3UbKpFi8y
	OuU4TS14aQFvnWwtHxTVxfU7oDfnVF+gZ8oNobtgzqZHT3wZQkx7K5K3b667YGg=
X-Gm-Gg: ASbGncsmTNRMPPBq7NxjiALhqIrJWRwyfzLnYGHeQ9lasovD3dZvoYetwjdBeIi57bB
	2RJcQENqlBv9lLkcC0X06fwbH98AUTTohB2iv4a2trzv6Oo7yZXp/t77fUneVV+KEoSemlRYJg1
	hP/gTBaRorXy28VvhljyPbS6ESeeAlm8+EVb2kHS/a9olvYBB4cHX9vveTab/6ipsZpLCfW5Oqd
	mZNhJ8QEY5nddcikmXAMKLqt+kpR7/KQOePr/QNqkYvlH/w5Sq7X3Xw1NN+YqgA+gF6IBM2ctxF
	i0N7j1HIVu6J61Extj2mpTfsuzNeCvs8dM0bGOOQcLnaD94KuNMSyRqyGkj60fWHt+vfPlh6ln3
	ZTB7QpkwIFA==
X-Google-Smtp-Source: AGHT+IEd8vUIf1JHm87j1DCw1Cfnb4ezxw96NApi1eQpFk5PeIhWnlWWz+ge5ggt0lnKoX9Qd3qZZQ==
X-Received: by 2002:a05:600c:154a:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43db61d6e2dmr63950065e9.6.1743410033034;
        Mon, 31 Mar 2025 01:33:53 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4294sm10424250f8f.89.2025.03.31.01.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 01:33:52 -0700 (PDT)
Message-ID: <c88b3350-00a8-4596-8713-a8acd829155d@linaro.org>
Date: Mon, 31 Mar 2025 09:33:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <Kmx7uzaPq9EGzQRvF45vBLhnHsciykaPCkrFKQdJlalp9j3T9eM0ENFJjIf_zYng1nEoq9cLOfzgLb03XgK2sg==@protonmail.internalid>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250331073423.3184322-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/03/2025 08:33, Aleksandrs Vinarskis wrote:
> Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> WiFi/BT pwrseq").
> 
> With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> X1-based Dell XPS 13 9345")
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>   .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 144 ++++++++++++++++++
>   1 file changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index d259a0d12d7b..c924f2a67939 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -22,6 +22,7 @@ / {
> 
>   	aliases {
>   		serial0 = &uart21;
> +		serial1 = &uart14;
>   	};
> 
>   	gpio-keys {
> @@ -288,6 +289,101 @@ vreg_vph_pwr: regulator-vph-pwr {
>   		regulator-always-on;
>   		regulator-boot-on;
>   	};
> +
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_1p9: regulator-wcn-1p9 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_1P9";
> +		regulator-min-microvolt = <1900000>;
> +		regulator-max-microvolt = <1900000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wcn_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddaon-supply = <&vreg_wcn_0p95>;
> +		vdddig-supply = <&vreg_wcn_0p95>;
> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
> +
> +		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wcn_wlan_bt_en>;
> +		pinctrl-names = "default";
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
>   };
> 
>   &apps_rsc {
> @@ -861,6 +957,23 @@ &pcie4_phy {
>   	status = "okay";
>   };
> 
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	};
> +};
> +
>   &pcie6a {
>   	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>   	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> @@ -1127,6 +1240,37 @@ reset-n-pins {
>   			drive-strength = <2>;
>   		};
>   	};
> +
> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +		pins = "gpio116", "gpio117";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +		pins = "gpio214";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};

wcn_sw should come before wcn_wlan

> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		max-speed = <3200000>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	};
>   };

Other than that this looks fine and is equivalent to what I have on 
Insprion14p - with the exception I see that I don't have the 3v3 rail, 
which I probably should.

https://git.codelinaro.org/bryan.odonoghue/kernel/-/blob/x1e80100-6.14-rc6-dell-xps-inspirion14-lenovo-slim7x-t14s-camss-sound-wip/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts?ref_type=heads

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
