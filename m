Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A796268C66
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104781; cv=none; b=Xa9+LhNMgOsg0INxe5uJsq5pVfL9uzOg62XFZC6PKufabKl2wRPQy+kijRI8YB/HFCuzrLdWNW2aHDnUIYkoo4eSMY0pELWgbiNLyg/e/iXeMrEt2nJXsVEGT83y5M8MP06zxftkfHVFWlE5E7SZAmEQcpoLPnkeIzw9ev0LmvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104781; c=relaxed/simple;
	bh=nuW/vxcb/ZKgkR3gzpTaJBTlNLt2STmXWCfO+HzV3Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPdIoMuGbHID0Jiyf6tZxn26LLuePMCmlUKR/y/87qxBZW1FvsNyE2Bpkipn82p4TRmQ1jcn0roOITCJ19C9DsctjVPwHPfalda/6r9MYjd87Uq9fkf56897s6Zki+gSzyncOv3YWNfpmsvi2lLU3dM0pJ5I4blLfdBqPGwvdcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoKGBMiD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoKGBMiD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf861f936so5231275e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104778; x=1744709578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+XprdFtgaQu6ySSqwjo1DQRvEYVehxDPmieYGF7z3g=;
        b=MoKGBMiDMEztAEhztk6221joM1dExCWfYh1mTx/uNeljbD5/g4DdYXH0Twwsfh1ehu
         hROof1PxeO49Y6FZamMuZFR6m/gc9X7fC66bNxZOUeS2J+8gtf7K/k2uP5JPLlM8bW+F
         aM74UXOLBveLiiEgxEU18Fi0Q43abz+0zjcR3eCEUo3tSPz+OVdxM/0DUMCxVf66UaW1
         z5kO5W15y2whfMj3pgtWrPb1EPnndC/747tfh7n2ilLgI+WCwg88LhIJU2JHdn+ekYiw
         K74FK6Gx6amA+dUUa+CTG+T5XYgDvARYXFVw3i+0BbN1OqFMh3D1LacB/zMXIucCFT5O
         GfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104778; x=1744709578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+XprdFtgaQu6ySSqwjo1DQRvEYVehxDPmieYGF7z3g=;
        b=EOCkF1JVLJx/yvdM5a7BahJd6Y9aGyk+jC1LK2rRShOAwaS1+KlFBZEDEp9PxMLX4h
         XMBjkq3Rfx0yn3Z5Xi5EwGMBOJI834poQlAAwp+S7LQhTwhCrUEN8EOVnjn86+jUHgEy
         DQYw8QOb/9a0lZrilgifwwVlW5cWPJ8dfxpmqE4bCIf0fnei89rYZFUC/fTxp30mfN5E
         CFOaE+s27dWD4GKqNo0COFNrrd968/if0XMboy18BaT8lVsBYXMXqHw5mq/w7HabT7dT
         W4jzmUS2maiIj0eNnqcShq9l7loMw/7A/7MVj0M4zrrvind3ZSg4wm3GWAU+1olNMH+D
         KFQw==
X-Forwarded-Encrypted: i=1; AJvYcCUCZmoon+qfWjrACc26Iov5gWbO9ufnE+GvILGPMXnREX207SJmyfXzFs0ENpQz8YfHNihmRv4OdpZOMoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwThApLDvbWpYnmtaGNRhkaTn8SASuqkzcJlXg9OzbFWwvJua0B
	qZL1EEy8AaN1gO8X7Ewfi9IGCSw3ik7cZXs5Bf+7noU7ZP6p9rNxMeN6pU9tOIQ=
X-Gm-Gg: ASbGncvOzDkSkH4JBR1S6Sps0YRSH7AFARkvaYKaAajm6VNBDUebnIpXFdSryTYhfyi
	PJ7Fjk8/U7H8zrx7UgkAOY1bXfgmm7emqcHa9L9afRBx29N/lSlOLFLF8V2vsPCM9eerIq40cR8
	pwql98f1N6kba7PHO2ANbJQ3iZ7cz/DAB9d9fKsuypMnfQnVQC3TpFDtYlA2EaiknRDhKlAz3si
	JP5qQnlI9vC55/o7B7TAYOd4RKaqG3iAg5556vNJV9T2kNurC0WQQKFlNC7i63JmkluD6YNh4mm
	NJqEkt2tMBXHNXW5kNC2oozvHq0Jw0rrG9q/K/ZTHUNnl6VspuVQ7oQ+Se37whw=
X-Google-Smtp-Source: AGHT+IEAlvKsvmekTE8MbaYfld0A5jk8A0PjrBe0iOBb/4upO1FB706dd+fBeOivbMd67C6ajFF/0w==
X-Received: by 2002:a05:600c:5247:b0:43b:c228:1ee0 with SMTP id 5b1f17b1804b1-43ecfa45bcfmr54294495e9.7.1744104777933;
        Tue, 08 Apr 2025 02:32:57 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:13 +0200
Subject: [PATCH v2 16/24] arm64: dts: qcom: sm6115: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-16-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nuW/vxcb/ZKgkR3gzpTaJBTlNLt2STmXWCfO+HzV3Ts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0k6k41a2POziiz2ffLEe8lnNt7dHRTGtgR1
 K0f0LFD1UGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtJAAKCRDBN2bmhouD
 1+LoD/9Bi+gLhxWqfVCROZ1sIcikTmFnb6M+cl5wNUVy1E2zuDro3WQ8j8ICGwAWtQMwUrjg4aw
 yokzxLJEExG5wh26JuMXo/b6a7iU9Keezzct0cS9a3kAwraJ4pT6IGJXQ04If6p0MDpyrz+U12M
 cMsIU8c0pNCzwXalVDcc+LERcoVZX3xqKnBXHE8bbh7NsZ3ZJPVEjwwZgoEovWHp494EWNL0QNJ
 /bmjGFu1Rq4uwRdE5JfSl5/KBMh41ArrnEh0fuy4UiStRJp7F7oNxhMapUWM9o7zLeHHCwFWySK
 DmsdbU5MykDe63g0WchN91YQnagZEORXZKxW36pnOvUCdauEVlcA4Ii/mykqysciVEckyjwwij7
 8DALEXUqmeEJ53cqQjD7MRH8Gc0esBmQuJ92jRUETu8gsOBOWlUqoW7SQFjSBGKt20zrvdFt5I2
 apYl9K2ZGdbboAI4+v4HfAzxryoHowFnEngX39ORMT+OYkF8s3EnWkc6thBFStE7dU7Cgvkq38C
 q1mfiPukyw6lP5sC09OO7y+AvawaZGJAXpn/hzOdx5lJUxHE/Nm9RtcLRZ9IpuB8H00B7Ewn3hl
 X44S91XN5ya4tkTDP5AwZWGw4ne1Q7k/Z7OcjfkzVlWc+sXweH9Q2HJSFE73ff+eMO42pbr2RQz
 c5+QjbaSTGTd0wA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 94c081bf7a892654e684ad806621a14dfd4407ab..55a0db0ed9cbfa2560e94ca8160a31ff3f1efc25 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm6115.h>
 #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -1960,7 +1961,8 @@ mdss_dsi0: dsi@5e94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd SM6115_VDDCX>;
@@ -2034,8 +2036,8 @@ dispcc: clock-controller@5f00000 {
 			reg = <0x0 0x05f00000 0 0x20000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.45.2

