Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA47267B11
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104769; cv=none; b=eRYAkyGm3sNMz2afnl1n6wmf2GumhWWOHLrM0fKOsldnIc4gzsL0JKSdgLqeybURaZf+MSHYanSOgfr3N+Stwk+BLn2fslTAOGKQW1f8LKkGjFs0ZPAybiwkonAj9LFY7L7CIprKaolzkZBeLn9Yijscf86S1wiDjs/pVmmt9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104769; c=relaxed/simple;
	bh=wyemaxi9F/WK+ikAwcpVodtyRlnYtOZlK2ouk1iRRPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nph6uQTUNrttJB5+bGlZKRvnlro1MGku1Z6kStT9TJ3X9kksVXS5IonXH0HK93+NkRt7nw0E9I2pdtULVKNadR4wka55sU124XRbnLunbRnPB5d/K6a1GMlfnW0IGm5XcsbZhBBSDwxAZjusWhGEpMDFeV2Z4HgiZiJfcz/e32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U9NILFe9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U9NILFe9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so3980545e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104766; x=1744709566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNXHwX3MjBjZlrv7zfjQGDnKrhbHGVdV4rt7uEzlqwI=;
        b=U9NILFe9XUrtEEMMzUHgmEKGmItlropp3ZFlYM8ZkNQbQwA5/cgU8EbuAlSE88Ap5+
         I4tUS0ebh+TEHEhW6WdqAS9CpszQWL19ST0RycXkwyKrFi4L7e4957hdHWbgmByomXw1
         +YgCHvmo/EhQsMiDoz3y/7Ogsl5uJvMIOZgPM3Bel7oiYIYHAE4VVuI6vRXJJTeXDlOp
         iFDIcotWQeUJ7P+FUWimQ3d0cNr7umJs+4BYHtyKg9rwqYdxlI94BZ5U5XJ7WKZVjA9C
         cpdhSmgbzVg81aBBXk+4UO/bwFwD41lFMjmVDW0L7Bd5JYJsk4yu1v/H5enUD5AhP7jE
         iw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104766; x=1744709566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNXHwX3MjBjZlrv7zfjQGDnKrhbHGVdV4rt7uEzlqwI=;
        b=G3Ajq1DIm0m9DClP+E+IGot8LR7Cz1XcBWiHOp4vAzLUSsrqd6B1LMzPBXTLg4FXZL
         pPiFtg4b3/5hrXlj4ldlUEALuVZx28O2HVBXChRqKovPOK9IAhghjQ2QJV3tZ3t0WYUn
         aTV98ssyPHIJRnIJxZoh6h+NZY/HzKSYLfojW2cGVIrbLSsB8cGfepE8gRj3hAh2G6Zs
         fWbDog224lntxa/RR1n5WM1t0DggGr2huJHr1fLU20aoEntnpfMNoRM02KagT1Csxtz/
         Suh5x9uOEYtbObELn6tYm8QxXxS616qHq4JWyDOUwEUcO7FtpT/CVJsYXK3KQ0Eji3yq
         ncGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnnLgIVhrVRTcpqs8ZxCrkPSRGikU7Xq9TYbtTfCK1bvig8PEn7Bof4zU3yZrVVAOFVLRPRMAp6lw7Jo4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0jetSFN0AQWqMfBhWIE9J9lO4EQ2hjKwFfFnRt16SjgD2Fc45
	YIInXknzs04cL/G+BiiyDEocsgezla0MM6mkdIOkIniaVG9xDotke/Hf9rkO8cg=
X-Gm-Gg: ASbGncszosb4moJ1INVfIt4QQuMrtjUjDA8HxneoSSYrxqosAPnTZ40npNogKYU1qVZ
	y/hubeXwfJLAhtZBw653OMuX36XU0ibGiHx6XV+OT4WmMoywSxjpHRF0p51cCqHxGlh8jUgA7+k
	22U4PWMJscsJQwLHpo7AYDtRanAl0jGzWNPJAahDslfVB+Fhyn0i1fHHFBshUBBes+bLxV8inDQ
	U8AtPxRG/eeWWZMPnc3aL0p3WMxprFkbuOahIzYQ4+p3bfzxjThpvfU2J8T4vMBy5M20hgLrQfL
	erasCKs6AqlFrIafQZP72jVKraKrK4COQixm1utLhiKtd0FxMUmpFjBrOcDxVX5lvxVqMDCCSA=
	=
X-Google-Smtp-Source: AGHT+IERxZdoY1wfPSi10ZPhx+Q9Q0+wVMEF5ckSk/Hao4ZtYLIWwgu2JOAUuIeRaUOztnOEqiAs/A==
X-Received: by 2002:a05:600c:3592:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-43ecfa18f83mr54545325e9.7.1744104765916;
        Tue, 08 Apr 2025 02:32:45 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:07 +0200
Subject: [PATCH v2 10/24] arm64: dts: qcom: qcm2290: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-10-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wyemaxi9F/WK+ikAwcpVodtyRlnYtOZlK2ouk1iRRPU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0eLBps0sf65BYJaKrzpQGPZhs6k3fvjpUYa
 /Tj/TEZhxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtHgAKCRDBN2bmhouD
 1wMRD/9YYLQ6MRHLNtrbIVoj+wekiOAjUrMyQwXRjYYvKo7vMQzUXXhn9nnONuXNHs+bBQa20cB
 yQeVNyBRcU0j9eK3K8PW5PqsygbHBl4cYlX/m4WW8a6MRq4+aelrywE8Law0o+UoeYnp0C6Gdhi
 4w0yO2CRN282ZwX8KbYdgP/kVaqYpGtd6qcpO7+cSzTl+FhlIwO3Igq4M1yBXwj9lEX0XFf3y42
 AWQseoZ6RNjauI6k0W74Ee7uEJQL4Aez7Ew7zabSO1UnCV6EXurEVl/CwULt1CPXyPW9BTg9+1W
 S3kDJsY4xZ5g4b/9NYsFsQxBI10VaScdtRlTWGkW6p0aWBOt1GDkOg7GPtPpUjxKD8NRhsf8fQY
 1qhvtW9E1V3tnDtS8q7ati/xR8UOIl6Vjl71ckW3IRcEkxkI76ODaQj6kjXJIhiK6uKf/GUZX5o
 onGdjvXo86WJLPxP3Dc/Wls+0Z8sZ9xI+0BzgkhE5T51NXTUqLXpUtvL3WutndkOpg9pXTJbeh4
 hB3bfh2YdAXDqnSW8+1kox6mv+AKYrW3G2P1KaEL6pltBpjlPAFTZp0jyWltK4oroih5RgIA2dH
 WPUVRwwm6gTYYzNIqKxCElwxtuPDrPvsIkGjkZEsCM7gAFJqgIDPQUejO0hpap9gXNzfbvY/NDR
 +bZgRSz1ZnAmQzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 496e493c5845c7d75508ecfb8e0ffc37863303ff..e4741342e14c2be336dfb26d91ec9685884ab474 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -1726,8 +1727,8 @@ mdss_dsi0: dsi@5e94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd QCM2290_VDDCX>;
@@ -1809,8 +1810,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>;
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 			clock-names = "bi_tcxo",
 				      "bi_tcxo_ao",
 				      "gcc_disp_gpll0_clk_src",

-- 
2.45.2

