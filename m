Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42632265CC0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104767; cv=none; b=acaCXQHMTziEAbqtaTqAnXHOAK3zRuXRlYAhj6kxJtV0b9s1GgJYfBl7y94mgaVOW8PZ3/lmRd9Jx0PAStZvt4o87Oxv7iJX6VPAeFDIOaMwJUGYeJZEOCx8WuSoxOSK8DF8D4omKb8SavVME3dl0XUlTrHoIRAop5l6T3rl1P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104767; c=relaxed/simple;
	bh=bk7oShd1EBsHQMygmaaykcEstK59VA3uWxaotr5RiHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pGgHZND8RxgT2QFx43f5Anj3y7AfyHmleuuDekCinjqzrVOqAyOyMfuUN+s8sc4hVuDaEtJWD9be5slCzN/3220u5AwqaWOfCR63UEgvH3c0NV++ubW4K9/QzU9FoV78m9Q2u0e1l5q+A75kq0XugiVYVC8t62rE/OZV1O+IWag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iap9ftVD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iap9ftVD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so3324605e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104763; x=1744709563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cnz805lxSkxvOcqCchm0aKFwDBCMCqQRd59tG8nvQUI=;
        b=iap9ftVD2daOTUJ15qeCRtABKA1CUNxG/8OYaMAn0pMsPdE8q84ihWl2oisn3Rv06r
         inhDYUjCleAG14OfJDrUgY1OFEt2Cvgvodyo7uhUKnH3rctAjq2QdPNcTwOdCkjckiJQ
         0woA+DSyUJy7zGU6WdRCfZfSGSQZLhpsRx/qx2eqO16vc8P/UC352iKJGrhevy+sQChR
         lOYyAt5xz7JkZFywtpDCPvnYL/ykRsMPIQAAl1j3avppmG0y2dlTU1/7FLzKEaTZN8yY
         Jf17lnhKKYFmN4W/5KNxQfqx51cxu+AHreFxBBwl8ThqIF3Jzn/P/O32jtpAQV47RuXo
         0dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104763; x=1744709563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cnz805lxSkxvOcqCchm0aKFwDBCMCqQRd59tG8nvQUI=;
        b=s5K/NNoFCpQ1yAeATdodYjkpiNN4VbxDYc2h7cpD+Fa8OvTQBZoiCL7wqhsrdH3QF0
         C9Yuvn44Z+R9cNKOMOudaLex1ScpR2eiHlQOBkMSvMvFYp3BNrxaDaU2TAXGc9WJ96cU
         h8vkJAGYQAdcLv0Pq0KinAidkyVMmpHyTkbXs9pSqC9k79BV0hoh7eQeQp/+nqmIfLWr
         YWSB3+xodKdK0Se1MaQn7/13vh6YZ1WpXqvckgd5pYITW9sXX7fmB+PevFFNYBlW2pMv
         XRHthS2uIuLJcww6VMDWNcVzp0zcvC7zBc0ARbg/2ugLSSuPjuOQv0wiwo1Kg/Ov8+re
         lT/w==
X-Forwarded-Encrypted: i=1; AJvYcCU/Dot9a9afBvLoogo+gcE/j/cbC7GP8t++N7O5snhl4DulPg+Dp6L7XNfm5oKAPzD813+XneYcDO9i5Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJxMaAf4Z9dbvexm0VYXuikBMV/h11GE3irfjuD4p3hfOISV4A
	Qg7gWSNPv/ywMiB5V/r2YfiJ+68DtQFfCw1YaNGTbrRtZex8bJBBoFqwR9An6rw=
X-Gm-Gg: ASbGncv4KU4gIDUm7agolMjouGwGS0eEMbUyXobIg1Pka27ZFmAB8Qdga3CaL2A+9KY
	J+8PJ7mmrhdUs4H50kujy8YRjSGBuFdNM54pLOyHNMa8bNfB/BAqhF7um6wk6aVvrvckM38A5Od
	6RCzI69H7NSBvRA4l+26uXims6pKUhV052txEJ4cbLFvmxE7RDW9mVU9V55QFGePpant1zxLQuo
	t3jYinbjF6OX8DFN9sSqkPh0GmXnpeNE71oeO6O6rvnLnikFMA08WaVFwaGFl+ucccCeOmeoqyb
	E4c8GbFP1X5diReM6iD750nUfLkY3e5TJFmuB4pX/8B9zUlXf1/P4WiHlfJMbXE=
X-Google-Smtp-Source: AGHT+IF+vNWpAKxX/kvdT3V7U5L/S2NzX2CfvOkZrvYh71vlED8zzX0qsUOSZhJBx3v9Xu9ayiTwFg==
X-Received: by 2002:a05:600c:5107:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-43ecf85f893mr45733465e9.3.1744104763620;
        Tue, 08 Apr 2025 02:32:43 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:06 +0200
Subject: [PATCH v2 09/24] arm64: dts: qcom: msm8998: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-9-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2382;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bk7oShd1EBsHQMygmaaykcEstK59VA3uWxaotr5RiHY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0en9F5OLfPVZaDh7nOzG974Jh2EQQ/XLwxy
 8SISWmWXlqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtHgAKCRDBN2bmhouD
 184WEACAUo2/y0vzaJQj1K5HVa/IZyc6PhoJg+ExZ3Q59UHE4fN7U1EA2L1SCJAgrWtxXVQt7+P
 puga8OKE6pKt//licii5wgp2DwA1AnfKnLttPkef8SGuTC2g3QQWLE/xoukl6DCuvnSFJXI1ZJR
 b532VmSe4cOLhyBu5aMoOZaCWrY5AJB5oA1fLiI3wNZLhdBPOl1HiOX8bDJ16snbqVxHJuy6cbz
 npGYg7NYjuwduW9IXIBUzJVjNpjkBI27A/+aoPHIlIcITuZLSaBAipWoFgDN9shATWi4kzyOcbX
 ojV+ydIeGmj0T+AQZQ+YNW6hk3ZgNxO7s1cgp7bgnH7xnLG6kASEavh69N1DsP6oIktOsTCj5D/
 Uc4gpe/6Ne2UbP+uryy2g16PEslXZAeVR3EShxuldO1hHtjQ6fUblNTbpZckHmm0SoGBXoDt6wd
 9dA4v/6ii+t9q8Pd4LMmCgN75aYNwF0yh5IaG0+sdYEUgMAPUZFphmSyIN8+TFj6XUpCTSIqYX7
 z0gxaUsmDIlPkeqdjyy7YdtdEmuBP5/vIMIUxE3r3B+a9QRjm6LluOXXyXcHj9PfJqLxcT+Qq8Y
 b6zFnswd5AVnfaM75CsqL9BFjLX8FihzFW6rcy8vR2MhDEolTom37kaXUqCd/RlFFTm5hud4WRe
 Eh5xKdXyLHRbYWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c2caad85c668df2ebe900bc560e39480ae03e353..7eca38440cd7ea60caa3e8467097aaf0d7928df5 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2,6 +2,7 @@
 /* Copyright (c) 2016, The Linux Foundation. All rights reserved. */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
 #include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
@@ -2790,10 +2791,10 @@ mmcc: clock-controller@c8c0000 {
 				      "gpll0_div";
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&gcc GCC_MMSS_GPLL0_CLK>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_hdmi_phy 0>,
 				 <0>,
 				 <0>,
@@ -2932,8 +2933,8 @@ mdss_dsi0: dsi@c994000 {
 					      "bus";
 				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
 						  <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd MSM8998_VDDCX>;
@@ -3008,8 +3009,8 @@ mdss_dsi1: dsi@c996000 {
 					      "bus";
 				assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
 						  <&mmcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd MSM8998_VDDCX>;

-- 
2.45.2

