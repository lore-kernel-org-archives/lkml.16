Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83108267701
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104764; cv=none; b=bhrgdF+OKBeOPZe51wiId+WI/c4NF/a1inYrj9j3vZuaPl2HI8H/gGWtz7z8cHrq0C5mE7BPJRzReLqA6j6HkG3WDWvfOtg/iXNo4wyHYOIi/K7rKQGnKui670WN6x2k3mUvxY0UDuyLF/U7QG99hgDLCiHkdl7FquRKfEN5340=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104764; c=relaxed/simple;
	bh=nKtT69qvhwRTk49MZvN2v7X4GaZFlj11oxGVqHC/0w0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nil/AbGfc6CSUUtXXH1/qrgDKG5Xl9so8c8vuM3+PW4B9uGuMa1/0LIiaTpj/hYZacQAekKQlQAFXMOgUFnf+lOL3tgIpwtimQo+GtBaISMWod0ZlS9LYsOw1/4uIP+gbWdzA6xjmMR65bfezOarcEsfOjFDBwf0IoivK34qvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbNfU+O6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbNfU+O6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so3754335e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104761; x=1744709561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ke4i0sccmYnkzIeEfcvgwv2Qa6GTLK3zqjPfyL+K/do=;
        b=AbNfU+O6lvQ6yds9Vrm5LMilzORSvQ27FjlkU5yKXB5Jrn+CRusQ7tx1VcyoUFD6DN
         mVLyxyp74Z1X8ZkNBeJRNBQuxmqkBUYDO9AgZ+FY43HMEF/jWLLsjHnOW+v51YKmR8HY
         eTI/9p7as6DTnYtRKeapEP1F1JfTBZeWO4fczoq+oJxWZb9xjgdsJ2pXDlfciV9ZRCOB
         4OS/FffvN+84m7PPgY7bmx1C/AkbMq8rzIqnH/toUAKHEe3t4DZFwCNq6Q9aDApkxnlm
         bHB5MoJE5E9m32voROgWWnKnZG3kliyUn2r451PmzfjRyl/vNxD8MxKWiuCiYg8eGw75
         1tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104761; x=1744709561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ke4i0sccmYnkzIeEfcvgwv2Qa6GTLK3zqjPfyL+K/do=;
        b=GsQdRQGkhf4QbWCNCsT/6nCaHY6vHB4ajKjdJe7KLSvXaVn7kosxX9rqnWOU8ZU/g1
         YHn1+7xDGzRgz32IQwUvgBQDbKlsNN3IunNdrPbo9flq+2IIuIiTmqrgmgYe/bhX9Pzh
         61tdCXBt0b7NcH+i6v9RVBMm+itgra+qpkio7Me8NlsBnyOMV40cK2Pt/zL/4JTKV6k0
         f7kvH0eXWsC211IKLvzoQTbJrks/93o02jDHTzLkSMLerOAPRNUv1DH7ugrI3YnTbftb
         OELo1ejvAQ9t1PKMUDLD7XmxmMA0PN12u+HEQPmlA4r5kQQPjLXWTHYu6x1BhaU8HKhs
         UXww==
X-Forwarded-Encrypted: i=1; AJvYcCVKG9a/hweXXY6yMr639RVAaOiExIA/qGPDwxUdvMb4nAEvFgGKIbKXKS115Q9g2dPHIw26HnXBaZOCszk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfnZCsGg9mH+7mzVdwQva3NyiS3hj5VrlQlEYRsLwmR1jBpGrV
	s21Idt6TjcWPHYIHEIVWXCW2d0vh6CMjdQRHeeNCPT3sr+89v5I2Gxyh5nP5mFA=
X-Gm-Gg: ASbGnctkvo0lyQu3flfdLY7L435OMrizRlQcvgy3m5HVTsxJIEuAGSEk6fVzknLUiiq
	iNlCVjGOatAhlX8JOPHhHMFVMnWJVtiw3qXJCEcJBH/l0cgEvL2054gbPeaWhWmeDYvAe3tMyTX
	AlZS4a9ePdsOYXA9aIhA0zDeGTMQt1HFQhi929i9EWgLdVXkkXTJ5I0HNxBPze6y5txIl0qFOtV
	kGTbFEJrS3r3P9BFxRyM6O57+bSUBQORGVMlQTSCysDvlgDN15Rf4013u7pQBHIoLbrn8dy2ghr
	oTXKoTG1//7D4WWwg/F+hcYgvKbY9xCu8gQd5K367I6cfulnvGv38x6B39nVH9s=
X-Google-Smtp-Source: AGHT+IFu6McdkHFhsucQjj/v/FK75uWflBzaZ84B4oOwfaXDnBmn4UN/BCAN/YPn+GO9M/J3OJbjPQ==
X-Received: by 2002:a05:600c:3107:b0:439:9a5a:d3bb with SMTP id 5b1f17b1804b1-43ecf81d976mr54258625e9.2.1744104760926;
        Tue, 08 Apr 2025 02:32:40 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:04 +0200
Subject: [PATCH v2 07/24] arm64: dts: qcom: msm8976: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-7-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nKtT69qvhwRTk49MZvN2v7X4GaZFlj11oxGVqHC/0w0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0c7KEW6xsI8ire61ZwT1f6dnJjArEkk4tBZ
 zVgAAJrfDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtHAAKCRDBN2bmhouD
 12EAD/9hE1guHJBwFmnLwtgjFyCCS2WYHdiViotnpqB7Z9MHMxZcSKaOyRDgBNi8UuQQGQryAp1
 HfLt7z/W++ppFoZqGWWoTLSbE90MSxYy0N04Knmo4nPUUVHNM51Hd0HqLvDdImsCDUHjuB0J/WX
 1njAxyG4uP+XVzPmU+zxOnB1ASBqd+vbbzkeuo7uQ4U4fB36daxeCo8G34+fLt161Ld3HbyUPRQ
 wbjBi1tVmHtBS7ClGXfI066fxVULwYwoNZMJVnMb1EHz/fxrwZnOFzawk/dm7vqz2SiKSc7PtDh
 JEwRJYUO/wJXqoKGQbf99VHgC/Gpsc3QPcxZV22DlDiNX96Df+Kz9wlL/sEBr4nrsKzDxKkuWvT
 KecD7aBZdbdpBLClq4x7CMOlnsC+hLSRaNeMUmzTNhhl2R+IJTmDutFjc58GWtovnMHyeRjdwbf
 SulhnPoWo1xN3j0X3dcbFpZgeuGSt9ffscaNhSbYDhswmelTKH+58HCdTbbEytXxzsByki5VAEw
 tB8g88p0sCfYVZhrtRErL0oRu+U0LHudMACfWLS1MCJnuaVMK6ETeujzF+yZMTBXOeq/EdlLAH5
 /3YlvQwteOoeWpZmpJhTGSee5mV4ydJmR0PLpKxeDSQYHm1DctoxX2r0NsA8rrzKAmRBTLHQ1HA
 NbSoCC4rFZskTjg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index d036f31dfdca162debe18ed6ed9a7767a34aced6..e2ac2fd6882fcf47e846a92d45e0fcb9beba633a 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -6,6 +6,7 @@
  * Copyright (c) 2022, Marijn Suijten <marijn.suijten@somainline.org>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8976.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -824,10 +825,10 @@ gcc: clock-controller@1800000 {
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "xo_a",
 				      "dsi0pll",
@@ -970,8 +971,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc GCC_MDSS_BYTE0_CLK_SRC>,
 						  <&gcc GCC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi0_phy>;
 
@@ -1046,8 +1047,8 @@ mdss_dsi1: dsi@1a96000 {
 
 				assigned-clocks = <&gcc GCC_MDSS_BYTE1_CLK_SRC>,
 						  <&gcc GCC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi1_phy>;
 

-- 
2.45.2

