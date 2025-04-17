Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736C723DE80
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889230; cv=none; b=QBLogs0gg66WWnvqtkygFi7wWOo5Obddwoxo71Sgdivxw9/iYVHiwFhv8ZE5Ld55B4JA7P3Xq84+R8H/3sm2RF72wXlL+znXaUh302BQiNMesjaNRJjce7kgQi7vgplDDMITkd0GTvY9x0nmUvVm7sreVNMQT0c1BS7ga8QvJ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889230; c=relaxed/simple;
	bh=hDddIwvlTDMzReVuUyCkrtqQUet2IXs5iUQX60KMgaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKj5WSOczP56ufEcB/SqdPElXKeCGvAhAFPseViT31t/un74n/QLEq74p08SW4dPsTcTON7LMNNPxfn3qV3lzYqDRy6uCqzWCNVSfNIDvr3yCy3IhqoxAdjc4MC8Mam4UKGrd7zm4DBVBC0545zvoH1pz6vplkJlYoMlz1Kt8SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z9TAXcW0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z9TAXcW0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ede096d73so4393845e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889226; x=1745494026; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jgi1FQ5Hy/QuNveGTgtne5MVjuvQZSqeo7o4egSVbSw=;
        b=Z9TAXcW04nmtXvI8nRCsOd7I2QIW6PSILHCk2GSJud/vZu41UniREoRfcZgrxRp2JW
         oFoHV61ojvGYAK2w405TO7LorskBo5q7NbuNcRMxDPJU0x7WNNpUQ7ZDLz5tM3CW0blt
         9J4Zc+djEk9UctDU8Wy9sSrj0QjsTziG/IpOsmWhEtDFc6QP7x3BCemH7YX4FsQrJ7em
         2oYRlESbPsb+uAl2HR7vOrR3+Ub398FWoclcE2wF7PtXBGq1D7o3P8+gD8xp0cloeNZL
         QJWbPn3WBevby+lwERiIvY5D04gbG7AwRvoXPatyn+yAzkeWfdfptcYYalWUShCaynO+
         nJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889226; x=1745494026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgi1FQ5Hy/QuNveGTgtne5MVjuvQZSqeo7o4egSVbSw=;
        b=azgdv7UAlG3+/8VScREPjKOys41IJ4CvHVLx/RMpFobsV4/0bNrVhYtsfY/+QGmPei
         3hSFMT6dQoKfs9KK8xeK9WuZ/RfgleMz/hP5ia0EQZOB3a1QyFt3fRxDk/zky4Hqx0Xh
         QpqiSMyIzscV8nGP2Js2qYsY+NSmD5IVNW/E1x644NkY6RHLNUf7eU+d1RBDHKhRouB+
         H0fIMDQuRaoL+2QrcyicrhrHf1nYwVuUQHOLm5YlxHlK0p4jZR93pglmYeCE8Yf8cn/P
         zYKPsDoY+uokCcXg6TYNZnDHReoTiGhmkAaFDf5obHnkwiuBB18e9l+dA+o0qWiCjhoL
         mcXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqNbm7EngqnNs7LV4hjs+2acK6ysMVbLwOkgj5ei8NBh0v1W5Vs4Po7bEnQ+/K1Pwt+yDbjADkyljQ3MA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYFvD4z0oAQVXKNf+Pl2SEZbCEEkIztVA9TYplz6aY+kkg6A+K
	DylqpkrhuXaMFkw5s+IFUXcvX9bp0CQfjY+oWBlWebl6kzBnABY4fzU0clUrZDPtdXgqjElA91n
	ZokQ=
X-Gm-Gg: ASbGncvrSyP2pzCd7//olWiujBx0t6M2pK1VERoGuURzcTqX/9GUC0190vLVM8BlN/0
	42DJ5UVbyPL3cXSp1Jxj6JPlLbY/VRpyS4WKrcgqvpwYO47TNYCf5aIbkO4fjywYNWYV0QOp3+g
	9w37QzKxCaayu2dYkRxAE7S7/6NRphhpciwgidPRYlKp86EulvWt18JkNKhxM2wKtVFVVVjsG6c
	XqjQ230qlNq10eAswNO1x6s5L96PIfmw6bIWvFGxbA0Skc8lh6LGTW5qkNT1fSxR3WOROrDFYYy
	DtR1s2Iw62BugMLhlAOaY0SsC8ir2/1sCiQO9MkZmQpbfgRo4J6K+hQ7ngFEFm6im6Ct2YBTQAI
	O84Iajw==
X-Google-Smtp-Source: AGHT+IGN81sMeD9tcxfnFwYfOV4hKuARvvD9rpzZ33eZh0pIDM265CED5xrBR0aBqKfLf+uRTRzidw==
X-Received: by 2002:a05:6000:430e:b0:39a:e71d:ef3f with SMTP id ffacd0b85a97d-39ee5b13fe8mr4740139f8f.5.1744889226436;
        Thu, 17 Apr 2025 04:27:06 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:02 +0100
Subject: [PATCH v7 1/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-1-3fd4124cf35a@linaro.org>
References: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
In-Reply-To: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-3fd4124cf35a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
of previous CAMCC blocks with the exception of having two required
power-domains not just one.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce92c90d969e3de48bc88e27915d1592bb..17e044dbb3b6de278d446eaf448561333e407843 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
@@ -5116,6 +5117,22 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,x1e80100-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,x1e80100-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.49.0

