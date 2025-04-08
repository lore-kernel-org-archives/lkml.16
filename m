Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFD2690E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104786; cv=none; b=Gmg7MWg2VV9payUR4JIWFW7jH5Jho4VD5RcztYhQrUTMHTnEG313fK5dTDAizkVaimNueCjFociAE7ePCeX+mABjDx4wanx/WwJxP7VXmIFjgz0eMPk16lWvSwzE9WbPFznze+GhotQc2k4jsa5J22ZgtGMB1kJzWGCZRX+iEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104786; c=relaxed/simple;
	bh=39k1vMZOSN1FgOQwMGT7xFm121EqUSXE/MevpdIOhnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2CnMm/E0GJyZC3A8DJbHsRkeLjHkOnXKKlXkDikbE3Ddz3T0qtqTRkCEKhPHbPqRjjlaQUlo3Mjc87rZJ5lC4L2MGpB/obf9Fy5DCmzo6b4Lh9VOuAuwdzTuWuJFZxtsID9Z5RL0vMOiUG2sdbIYa0o11hGTjqmauw8hGHMklg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4WrfCag; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4WrfCag"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so3324845e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104783; x=1744709583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TgeOqjNMjWXjdsbtFz8N1Yu+WJCFeysbiHCnrXKpdc=;
        b=V4WrfCagJ9Ijt5ouMgEB77Cy2UpQ3pdd4zNHgumJTIsX78qqfRVAZKr38xrMoz3ui/
         LRv9U174UDaSHuli97/U6+2RvXnhaFQF5BGdg8tsC0tq0x0dVDS3pkOd3aJ+XD27zZCg
         dJ8+w+Hauj+5KZzkQBrOJCLxph1rGR9T3ywsLA+v5Mi6pd7pLd65qvg69uYtI5o8F/6Z
         shGfzuCl3rz5siLbnkc3MIOUTnMOXZi+UvSeYppU8YvVSwNRRXkd/l7Gi+WL3JBU6a0P
         RFc+RtlIJNR4+CMjs5fPGWEMzEWZc+zrYW2pTvZMbsHfpoPy7M6o97O3vDv1caEkLYHJ
         Ao/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104783; x=1744709583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TgeOqjNMjWXjdsbtFz8N1Yu+WJCFeysbiHCnrXKpdc=;
        b=kpSK/pzWN17C3F6zi36r5/7agjDLywBiiNKh2u2rvEOQUP90esXdl7nxnHY5yqsMHl
         TCrTnj2nGMT8lO5P7AmNJI45/Elds7YH77yXbw52eANHIbKgNUGCQmazGOMKq4F2IM5d
         oTmkBp5j+Fk/0wSS9E1ao/kJoCOKwrJ+l7lEQVD+ctViXtekFrwyk9v6plNE7g89H08N
         HTAEPamwndsgZBnPw9tjIcdwHdMOpmS5Ziyc2YRXpjTvH0aFOKl8N2AbijOntjmJXerE
         bPGRlR9NWvRakECVwP1/hTZr4feskqWZEHUuJ2Hm/lJSekFsdiZuAxAvGZe3H56NiFqm
         1ciw==
X-Forwarded-Encrypted: i=1; AJvYcCX9kY4lEtOwe71FaMxuq/TyHiVnbUfHc3hcK7+6xAkIQYfBlDRZ8OvpGS27z0JUfpC7wlKfvA5vAzfQhU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vfeZCsU0QtJQJIqTdtcE8w2UObO0YkP4p7daS1spj11ECiWS
	/9uylNbFVKbooYSd8STz/leWsxU5gviv3/80HmBQUA/xONJ54u7avkJ36eBJ3Tk=
X-Gm-Gg: ASbGncs0UpwFObjskIKCSlVF6C/79cVo7vbnogRDLa/ejNI9Q2Pa/fqbQVycpBk+nVV
	UjID8NJtC6AU0fs7Cura0jDAciz4gPglUfDLC0K3tDBCk5qWQp//8eb5uOURq2fvU3TelqJzfn6
	zXWOd7Komr8fiv7XsgN0seNa2VdU+47hWzsE9v7mmyYNsvaZtFxQB7X6lbHcdC2uRDr2C2jZU8v
	xdb6HdTcJpHrcIZ48v2d1VFm+HjrP4YrzdLn1bS2vpiC9PG1+Us0yeFI4LbQxxTktaiXvvKn9R5
	0X/4xtrQvhUbXXTAj8HBdgpeuhPg1bhNmb8INCLjrBLqvz0K1BEDeC6vOCLF4FYYSLfd3nnBew=
	=
X-Google-Smtp-Source: AGHT+IHLuxZriTopdYEcGrXZV1/eETdR0D0OoX59bQRkebIkohtgrntijIg4HdG7lMWQZlN8DM7xSA==
X-Received: by 2002:a05:600c:1c93:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-43ecfa02814mr46107545e9.5.1744104783043;
        Tue, 08 Apr 2025 02:33:03 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:33:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:16 +0200
Subject: [PATCH v2 19/24] arm64: dts: qcom: sm8150: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-19-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=39k1vMZOSN1FgOQwMGT7xFm121EqUSXE/MevpdIOhnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0mDlXJanAZda1ObES7b5BtrdFsfnFDjjwEU
 K4umi231p+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtJgAKCRDBN2bmhouD
 15GtD/0YwrTy6y+fmM577d4lKjwXOJqGpjG2E8vf6LCRr+NAWG1ToDof9TBcbxNtmY+j1HOFm5X
 jEw9jfVvETirmVyEk+ina7S3lG5w9or22L93buc8dd6ycebF84E2RPXMFey6O3WWZr2LYZXM4UN
 v9eo+YVG+E1cwBx0Mp4zMWq0TtfRGHGlhMWYiECKaav0s/zRg7qzdvzVx0kr9T0b0ufWi3DK/c3
 btxN6FrJXgZK+4VkQO3bW9MkMfVTPQfgXwCYnko0mfYgAS6QkaOm+hlAD/0HDVRDSFm19F+Gsb+
 8mTJ7JOaIsEFKBOsHlJkjT3gyvhybeMCU8qwRE9qIMIQUhcW9rG1kp1yTX9S9Ps8cd5HeOH//e3
 q7UwDM+qEFSvrKuqyWsnfag46tMkZgw0AxlHXh8nfFoJjsf9an+lgzmFEgsnij1oIFDLc1F0GJt
 PJlvAkqxpiqKAD/f6XTleGVNTAFbfGSGv+5wwkiZ2ft9EOTXKUuK0QXWoDBy81tbdy1XCVrqWOk
 RCknBTaxP77GBnCDEu4LHPVAiWbTYvW3W7DJWVm7JQ22ttbEeZk4ngFPgrWdeF9nbbM2oG29oo8
 w1QEcSyqb+/Jo8FnKAiciW3FStFAFQZDD8vcfEFLMa9w2Y2gSTse9YADnluew53ZtoPCGgjWkGH
 esnR+Nn8iaGu12g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts |  3 ++-
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 17 +++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 9ac9854b35fd157e0735aaff4e0bdbaa8946e0d5..e1e294f0f462ac824bffe96615b36ddcd8996d80 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -500,7 +500,8 @@ &mdss_dsi1 {
 	qcom,dual-dsi-mode;
 
 	/* DSI1 is slave, so use DSI0 clocks */
-	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 4dbda54b47a54d1fa9c3fbeb441f8bc852e52f75..2aca3fdae47ceef9b3030613ec2b8f3a6c1a3356 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,videocc-sm8150.h>
@@ -3981,8 +3982,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8150_MMCX>;
@@ -4074,8 +4075,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SM8150_MMCX>;
@@ -4130,10 +4131,10 @@ dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8150-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",

-- 
2.45.2

