Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F74267B88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104771; cv=none; b=dv0dExqw2yr7jDQA5LckGreCv1/JWE28GqonuH4DrS6twAIvVmgkRd2hwYbZNXnr7K366oE0I3nZcazZ7LGV/slx/uS5CyG2Jrg3CUNv+ncCZeWg4xUvnC/kE5E8W3uU6D6mLZrejV/rBbxz3zXODq/bNREsuGn8vZyHXEqB1qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104771; c=relaxed/simple;
	bh=iFGdqZHw3eVy6wQKrqHQ6Jd/6PYAgGQLiGcWKrEFasw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYDGz7FLEgtALiBBvwqAx5APj8h1k4FQ8OpFO12zlyb/wEv3lSJwNxvxQIpkoICWYxvQN9sMkUV1zwHxS8IJN5BQ9WWN4cpiP0v9MgFZOgwvnWCXT60/cZALvP6UcIcS4rZo8vjhwxRcrHZzq4MBKR/vMHclrYuDh0jBQ4f8EdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIng9QGH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIng9QGH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so4655635e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104767; x=1744709567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7N8vtlUIKAT7uWK8aNXxI9lA9gK3w1bYYIGqJAhN1wU=;
        b=EIng9QGHyWtv1oq9Uz2IEpuCfme5rTNAk8eZzPxzKYrtp88lVck8+JZh69CHT5x5/F
         QkcbiS9UmCFRsBGV+DFQE7VmvYEGwlZCGApEbx+dKwTcjM1V6rSz4zGYqlNu5NlLKMUS
         2ZE7FXvme5knrS6SwzvH2ckMRtb8ZxeW/SEkD65C/1cr0d0peEmFNyi53xaIqN2+ptZW
         0mCRMrG7WwO0/2BV8RrBf04b0tBZ7FgC5KSUOKotPjxcHPBgI0nAsHtFiFC6smxnVDJb
         B9YqD5QoSNrRMOvSUXmK5eE+dTQoDTXpthegtNhz2uEZ/3ijD87/7klfXoJvuJjAM/pR
         muDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104767; x=1744709567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7N8vtlUIKAT7uWK8aNXxI9lA9gK3w1bYYIGqJAhN1wU=;
        b=siljMtub7RWWYyKxFbqKsA9p9BzzBsQDlsaL1bj8YFPn7fpEnpZZzaqeTj3bL01SsI
         li3OsPMm9l/vK5EjxIcZ8Lo2Oea/tRZKSo9kBm++qXS5BC0Zw3DY5bE/Dz/HvLerNqGn
         dG6lZj9WInXv/idBhzw+f+qS9wTaT6iBvk8DEKAmOuWXeWh+2rjslBrY0Yr0CuA8bs4v
         HRNnzb+mbLb98QGHZZG+zYv6wNKS9U2VLQvG9pW1l9n1sz50vNuFAHOkTFUtiHx0Mjkb
         8HnpcSTkdaphtcmj7DfrmQ3JmSjJ2UwYZYWxq67gdkVOGC6FBMi+F9kScZAXLttQU4v4
         fcUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH6LaLCKy+JYyOw2X9toHJL/BJ1wYVm1xS5I/LiNuj4D8TG+wAqGoYgNtpE6l+kC1eYfHcSAo3ALv3/8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAeFsqfooifWjCcFO9AlpRrvQXnmwF+MEXAePbHpdJIwQZoAJz
	/CbN3F1d513GAfBQSx2rv3sl6UMolrfltMtofMpohHn+fXMalX4XV04UKoaeocc=
X-Gm-Gg: ASbGnctUynKwYJ55iYeW6cf+Uut7jrm865EJCGVTBdDVXPHtGobHl21di26+IbBMdpp
	NmHbR/hrWeRzi9CpS1+ioufWIKNLHJaVeyFYt0nEjKFSirTgu7iGMGsEZLNfGRPOt0XvZkyuTj6
	5d/669YaK6sHjZ2klDp84Y9Cz1wEvH/ZaoTG/6sEf8R3UUpY8Ap6oMNy1Z+uQo0i0Qw9nxlf57A
	XJQvtsh9+KCyoPMua02n48mvTMoElOPEoPfdIbHdVQyxGzpnEsu9gG2wN/tHS9JBpHcHPyQcwCw
	Eiv5+wpWNPnWsnHWrXpCYsovaAF/swGwPsnJJjwCeU5LXinFFVI3iBI8eTEz6MU=
X-Google-Smtp-Source: AGHT+IGwRwzp8dgc7ekIGJqewdC6lObYgeLAaDHpf2sona7KHrppNyrPjI9IkVJYCqGr1bua4rzL4A==
X-Received: by 2002:a05:600c:3b9e:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-43ecf57e944mr54223735e9.0.1744104767243;
        Tue, 08 Apr 2025 02:32:47 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:08 +0200
Subject: [PATCH v2 11/24] arm64: dts: qcom: sc7180: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-11-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=iFGdqZHw3eVy6wQKrqHQ6Jd/6PYAgGQLiGcWKrEFasw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0f9bBEOMUt8JTOH7MCppRiFrGcVBOiBTZLV
 uOPVOrsFseJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtHwAKCRDBN2bmhouD
 1745D/wMs7I7SIYBJ7MXt8NvWkqMNs+ldqF3dlbtu4mkvZbByhztgZzBfNnwExdsK54LiImf8ic
 qPO5iULIO6vjiCnavpp5pnfyOvORhSJzO2E787hgtVTsubKXTkITh3BxjjiakMZDyuf/4FinerP
 08FELvpKbcf2OD1aURL73qEOdDQ3SumUnYCkeOVi4xyp7nZpRtC+NLNOPtqZGm8JMPyMs7R6vQ9
 yp0Fk3Ya9lCI9IEDEq9Re3kTwLGCY1xoiW69QnpB3rtbaLIow9Cw8xNr1VbxLw/nvNyAUqF+FV1
 ZksG8BUnRZ3Y59FwYSt0ygUL7RoM3jq7JUEMfIdXyTeR+2nD7AXpyRlHBvC7C7HrZGBohk3mNIX
 n/qPi+aHLBg0jJdJOB9E0QGwSXrO/ZSr3zjTKi++eUHgWcK3vBX1oU1xe7dZ0LNwh/bE5i9avVK
 /FD3WH+mGOW2rIYDI8LQ+IwzSYJhO3N7vga4ylF2X53P9GTwxPjo+EfPM0gnUD7Mbz5xzB89P1w
 t0KEZ9zwPBe2susMYHVtuq9SEFMDXg76cMfEhGTf2eK0HZJ6a3e0w7fFth46akZrjEubqDso29Y
 1Tvm5X2h0TZxv4/YQU8UWP4Er8F5Yd4AFFhbRb47FMdWmp9ZqahIrySoqAL5UqPTIUyBQqeOeag
 aodzyid62jnoDQA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 87c432c12a240f8035753ad10ce8662584a3f1f3..d157863dbc4a18b6861060579a148632f8ae9e3a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc7180.h>
 #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
@@ -3284,8 +3285,10 @@ mdss_dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
-				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
@@ -3433,8 +3436,8 @@ dispcc: clock-controller@af00000 {
 			reg = <0 0x0af00000 0 0x200000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
 			clock-names = "bi_tcxo",

-- 
2.45.2

