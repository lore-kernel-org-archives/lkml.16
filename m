Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7F27C17F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499887; cv=none; b=m4pajGgNs5Eeldx9vz74wSJD5b8nqNyaqOESrjV7pixQd4ewG690eSea65iKKw7mTSD8de/Y3mBietVR2yOdpjyoyvHPjS21GGQzra4477WvucUt4mfbngIsMqgLMbA7nOJOhurYbTQlpxhdLRWPO2EsK2mruDkTWa55eQBBoVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499887; c=relaxed/simple;
	bh=i9iAShUceIpLsFwMkQWLMhsv4ypR95GsTISxh9DtKsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRpnK/VdHO4dOrsC072T0mTAuvvxXCKh4448IRQn70cylSnvutP3k0jt5VU/shVEdp+MPaQRAItTkB+RAMjr0f1q4BY/hTn6E1rhj9ZdkfK4Ns11hl9B2pztu994y3dYpVlUd9zs0JsudNLE5W5uK/7tKfuiMfmbj9bbLlIOFnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnSJdYvB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HnSJdYvB"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb94bf7897so11544066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745499884; x=1746104684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFy6LfZrrQ3Ec4dLUHga70j/5w640VgvYLPY8K+UokE=;
        b=HnSJdYvBgexTvw7V3Oo3A2X1IWJgk5hZlaxnjCP9BFQkuT0gOjfFeD5Ow9+CpXMTHt
         4IYr67Frlugfb4UlpJzW4ADulbzubntUG6+KPqccUV/0Xv/wDv0kgXDnYqckWzvapRvp
         nty07PHxWw+lzcv8J4u3Q9FMNpNuPCwJmcgYbFHvVfoHzlL5gTvmDea9Sp5ldjkpG/p2
         uMj2pdiQZHWpKb6sb4gYvExKpFKsNduXAUbfcawsFtx2BCO/DHsrpgwhHnt/Wuhpw9Ct
         5YogcxtzE9ZVy5RpRa2I8zUYcS/Q7DKylaQfg/nYdjkhBr7EdMr+g29/W8KJqDrn9Dvj
         fyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499884; x=1746104684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFy6LfZrrQ3Ec4dLUHga70j/5w640VgvYLPY8K+UokE=;
        b=f44yrY0TvVeI1XwoSw++PBeAPN6xmvhKrnDeGcQE7zq78L3QPcl4rWaV7YfjQbrhqc
         PvlEXgqWNYX4qxiCz5EIMxLU53im7adcAUctUVWz/JJPyemGQ4UV9FvRuIEYoSlu5Hm5
         1JVbwbzdRiCZRS+HxFMZdyth6H6kjs1wKjKkY4sRi4iGl/vjjAxDl6/ediPXxgPwW+D2
         lR5G0pmvCsJ0g+ZQMnDvZVnJOKBBIk707b13qm/esrLk2/B9EdmyPxRikExmafJv7hDz
         qP6HAWRAsxbNJrxYR2K7veIS9EtXkS/mE2bLSBuMc2p9oas+wAQzJEq1u66+0y6iE/aj
         tiYw==
X-Forwarded-Encrypted: i=1; AJvYcCUsqjcGHZUTRMLF8TTuFrTZG4IEON1eH/A5y44GrprmP5m6i/e+caGcw68zs5LPaFmpDYD9ZVltSx+7/RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkeVr+MXd+z2p8+4hZGqjncZkRkkI3OTBSbqqcLIlFEMuUkYvQ
	ZTTxeNQvxvNiWQucbeirPm6W11In10s4rijt1NNgOcGPB3jESuSbR0J9940OHJs=
X-Gm-Gg: ASbGncs6nQZm+Gx4WoUXzHidSgzVl1AoZjQ3numKEKQClIb7oa5ESbqk2sRw6daElYk
	7+dPT/J0s27Ej1UjPo5YbJi641aXSHO6PaAv2K8vyfQFhqTm6JeB71ykBZpmMxlHDZBp1ktvFgh
	OTPLhZWCNNcxUOL+53DvmqyWfjbKn2u+aOlnGTtXchEv+bh5+UZTbDFYtq+GZ6w8YlXwg2GNzwx
	uhYgZxT4Z+H0KzIrxAKFZF3cPP6GfLOsQx53Y1P8vn6FeV0D3duXKJFNEhL832Tac1kTGrJwg8Y
	bah/S3iRSGt6RKOIx4Srz9LwcJGQaefNd85Bh664nqCJwMz095ijeBvPC4WOi2Ny86VApQ==
X-Google-Smtp-Source: AGHT+IEqxlm+C4zPmUZztYOo+O71IivVUdD9uO2+BCuxgVw8VPVSB/N0y3iidE3AdXsH1B8+9cD06A==
X-Received: by 2002:a17:907:868a:b0:acb:1e98:1a19 with SMTP id a640c23a62f3a-ace5727e5bbmr87084566b.8.1745499883800;
        Thu, 24 Apr 2025 06:04:43 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59898006sm105101766b.46.2025.04.24.06.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:04:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 24 Apr 2025 15:04:26 +0200
Subject: [PATCH RFC/WIP 2/4] arm64: dts: qcom: sm8750-mtp: Enable display
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-sm8750-display-dts-v1-2-6fb22ca95f38@linaro.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2390;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i9iAShUceIpLsFwMkQWLMhsv4ypR95GsTISxh9DtKsE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCjbkxCX+DFB/zE/Qp++piPauiqNmcTUqvonna
 jMHHJqsMISJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAo25AAKCRDBN2bmhouD
 17F7D/9bgvsuSmXLFGIGmhVmwzD42p821ZAgY6YcN54VKz2jXNUmZQ2zan1E3AW/200n5WMIUW1
 GVbeq5QsnclztXLLuICZQKFmNCPTRmxfxDKDvpXw+eGV9rRlPNuxSaKyeLVkhpGuRc3tdPJlJEO
 DIAq17Rlo5YcKCuaKWlCs0KSdqvTmfZqAuHuYU1v0cZVnj3goIZTGF/JaR+KDEAukqTx/FDcPBC
 pxtJxeH4UKPiJAqec/6FnydilJgpIDJtUat8b3tAmp8pkHLSA6DSTk1A/g6j2POkxrDdcPQFUkS
 5E4H3HGCoRhYkUDuLiwDQ9wVyVt1Z4ANasEh9riZ54xY6Vu6afdvC1Z/3sW26nvb/IQGOyy7er4
 uBcwlSzMCVKvVAflJMvGcyV54X72Hf3gK5o2l/W5a0xfzYzTH9LmZmpBtVPa9wi8Ia6kzSgdbNp
 600CfEz+oli1W2gqglSXevEFS8CwgfQGMAr4XZnxDfFE9OYvOy2/H5s9pcRxW5mtyHKHNZpAanb
 aWsMp/7aMa2uEYPifO1L5LfwxVOxb1xyiywiTCShPzUF+A/M2H3NJ+7lkzWmZuha9dOpJtdldp5
 ajVY92vIEW5DBlGD3Q4vf+PhUvCXU2gKWrqw02jP/Az7uBxMKGyxxEdo0ckghaugYzj+2K1l8xr
 RpA0RXDdB4b7VKA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Enable display on MTP8750 board with Novatek NT37801 panel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on WIP
https://github.com/krzk/linux/tree/b4/sm8750-display-panel for display
panel bindings (novatek,nt37801)
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 70 +++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 140a3a36d03008f700bb54ca52f437f81e6c68e2..bd0918e8a7a7e03530eea577c7609454fecfdaf7 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -853,6 +853,48 @@ &lpass_vamacro {
 	qcom,dmic-sample-rate = <4800000>;
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "novatek,nt37801";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l3i_0p88>;
+
+	status = "okay";
+};
+
 &pm8550_flash {
 	status = "okay";
 
@@ -1078,6 +1120,34 @@ spkr_1_sd_n_active: spkr-1-sd-n-active-state {
 };
 
 &tlmm {
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_active: mdp-vsync-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdp_vsync_suspend: mdp-vsync-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio101";
 		function = "gpio";

-- 
2.45.2

