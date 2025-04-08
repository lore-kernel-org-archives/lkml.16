Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C855268C4D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104780; cv=none; b=H4+g6GI+F/yyrvDCO08hP8KrrcFFwUhgkdhR4tRtxU42grKtAH/DhvmjeAibPLw9Zny2TB98C655TY08D5v/J3pXf3rpE7By+kU0PrFUE3hCh4QoF0CasMyHFRxjLrzJBKNZlZ3Idz/WoKvjc+NKEMwMWlwdGUlPBvTHrVg+FXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104780; c=relaxed/simple;
	bh=4o0kFvU98q7AruKQqRezkaySutXhhBkMpag4rZRSfwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eTcbatWTH0zsVtETdFq0HQvYm32+fP+waZk3IlnfjR8zt77pV8MKMTjNd6wI681R4Gt3AC8vItq9k/3Jytsb+cuc8cKcPawpD84ENJlR8Po0p98zgr7PXQVQM5f7dIKx0tov9/dPYOa8nwL/MH1+57ZxoxJE7TPnCkOf+y2kZO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fn/9nx4j; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fn/9nx4j"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso4380875e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104776; x=1744709576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnGl7wyk8hxEztA0BNx9ig8bMWAUozEcQ66xqzJpWWY=;
        b=fn/9nx4jstnMHqppXKtP4CWrQJesIDoSEConj2NX+TdK9Fma8EnhXOsr2AVl/dQdyd
         DwHI9960GZPGfS7wclMG/+iyLtF+DrEoF30iTyy1QSbDoB2XaP2UI26J+k/gDeRcB6H9
         oUZUT1SGoZRloaQFdDeohNa89pOCt3d9slYSOgprcTOJMHfLlPotkO+Ac4vo5kp7wq0Q
         3c+ENr27tSV21B3pnJijx2evqe9E3caMs2OjmVUdeFJWZ8FKs25CGJCENhHOeARtZxXl
         Y/DT0URsU5any4IjcgP/BD7BR7TLuVUfMn8f6POJMgeyRhKtpmbb5h20Ccm7Anvxnm/e
         NJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104776; x=1744709576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnGl7wyk8hxEztA0BNx9ig8bMWAUozEcQ66xqzJpWWY=;
        b=e1sNDyX2bA3n9K7K2990KLh55eY58Iw+H52bd+rjfAN++gpMThaxQDQ7LHDMZxb2/m
         /MUQSx2awfJeazAunmnm39vW5x0RaYq0wKF7Z5r6aFjgUiKXywRlsDv6O9Mw+L4AR4Ok
         unuVq3e8qcWduIdLFlJtyHuJfCwde824Cv9p+rOYSjp27GY2XKd2ewCrII6hUVj/5eu3
         JHTz4KAj+6+kD/oBtSDbovQvFOxpph8NA9Au6z+pwzGoIVbISAwvF56hu0andv26wQCg
         4S2R63ImP5zTFrrDUy/OSOy5WZiOk2fuwnK7sP1TTp9QTMyIwEPpY+u5QlFpjkDXkQ8U
         2OAA==
X-Forwarded-Encrypted: i=1; AJvYcCWDWPfo6grNV3tOm4AcQlW9ulPtt6E+VOk7cKalfRBwbfpGbDXWeXi9aOb4l6PxRruZuXvRZDEb9IPG0kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9Pp9pUg/lX9cWqGFMfTz6vrn73Osx6uA7RWV+PkevkdjZI1J
	JyMDNq60DOIFKstsu2DA0nnYCD6uOBhmfwXNOscFxfyEBdkySzrW7vPPH4DpwPQ=
X-Gm-Gg: ASbGncshGSlU578hMj51b27M33/ogAs26D1ken4zHnajNeR2dXa2TGfZjsEUg4WEvA0
	DBMc2HXYqSzfuzZLfCXVr8JE0jnWJkIbZYMQR6tDTSqxtHx1PS46db56+yqm7g2sYBVeRMVZ1ca
	BaW0ay2KmJeh/e0R8v/tDl4swBbnUqR9qcrYgyBrZ4zpVffoDcdQVurs5Q3NlPvpJ6NW9aJAP3a
	EzBSymdTPOOFTzm7G0WU0tDR6ofeTPduGRyAZJmZNcIzcRf40BVH+RxUNQBmfJRdm1augyAmcL5
	IBPjbYxAvF8G5LME+B25+JXxss9Z6lxXWVzrceeoBAC/3SiCX4g9NBdWcSGPsyY=
X-Google-Smtp-Source: AGHT+IHUHzKfbEbDwqmmS6vH4KVf3JUUzqwVhlIyrJnu4BIeEnuIEhrmOaHwXjGD3HcWVaRYWKgWNg==
X-Received: by 2002:a05:600c:45d0:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-43ecf57e769mr54413845e9.0.1744104776530;
        Tue, 08 Apr 2025 02:32:56 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:12 +0200
Subject: [PATCH v2 15/24] arm64: dts: qcom: sdm845: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-15-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4o0kFvU98q7AruKQqRezkaySutXhhBkMpag4rZRSfwM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0jOPiwU74fqwrSWMuEEMMjUVNjmTlkn9dm7
 TrVOavAWsyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtIwAKCRDBN2bmhouD
 1+KTEACVSkTVgDN2638foncprSL71enk+5+uCzVku7xT/b1UuNTWZZRsWHOg4vaBODJ06nsE4Fj
 OksfhjB4TLQhEHgv8GR0Pnbe3IQPdHIek//EGH/Pjn1Kfk3oqsuS48ntlakwIuviO4TeSBucwOp
 qW9qAK4fO9Xo65z8TAd0lhEvxSgjV5Rl/DbRvj58p0PLvtiVClPDblqNErR7SRZ5Cjrgotnbu2A
 rdEdpf+bY+NV/hfiN6oVpz7ZafWlNw91FZyFkW0sCwmk4+uSSgZ236GIqpmQ7sJnZ4Gz1ntJVVQ
 dtF5BMKnmpRmylRTiVoLzto4pjF1SMHDjFSQxxdsnRo8IcKm2VjOzcszXmR+4Nhg9k4UmpsF8xU
 QLYUBcdwzXvl2zD4D81VNrjZNHs/hnsJuoGKSANY7PtJt+NKkwlI9Ovezbjlrz1NHltBV0MFlxu
 fINZ8pCWIUuBIwT5PbTmC2VAZ/Y+kiTqABTPRWUNfE6U/uVbPu12DJKA5leWBYQ75A/K0tgyvwh
 W0hjQwLxvhNVAi8E+CzLX/5MLC31Z7R+UXtYgydoRPys2rC72/shyJYEiOkH16ZfTN8xfXU4GTW
 pUG5nHyUggFxFScGx8kDa1EHX7/JcMNotrZEnwlXJAPHBNRSEJMpoi1nVR2b0GDKHSs23jIJjx9
 avNYkPAQPq9oeGA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts |  3 ++-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    |  3 ++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 21 +++++++++++++--------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index a5932a61893be02ab118ab366348d8cce27a4bd1..2b2ef4dbad2fc55b27fd176baf1b4205802e1c42 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -555,7 +555,8 @@ &mdss_dsi1 {
 	qcom,dual-dsi-mode;
 
 	/* DSI1 is slave, so use DSI0 clocks */
-	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index cd5172ad24906ca8eadda5a25912d13b62ea5ded..a98756e8b965fe7aa475271f72c0b73b20fbceaa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -495,7 +495,8 @@ &mdss_dsi1 {
 	qcom,dual-dsi-mode;
 
 	/* DSI1 is slave, so use DSI0 clocks */
-	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 	ports {
 		port@1 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2968a5c541dc0a6c1c28e32160c4c40a8f332497..5808129e2dde061dbc79d63cce9f5254de2d7d96 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/qcom,camcc-sdm845.h>
 #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sdm845.h>
 #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
 #include <dt-bindings/clock/qcom,lpass-sdm845.h>
@@ -4708,8 +4709,10 @@ mdss_dsi0: dsi@ae94000 {
 					      "core",
 					      "iface",
 					      "bus";
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
@@ -4780,8 +4783,10 @@ mdss_dsi1: dsi@ae96000 {
 					      "core",
 					      "iface",
 					      "bus";
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SDM845_CX>;
@@ -4973,10 +4978,10 @@ dispcc: clock-controller@af00000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
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

