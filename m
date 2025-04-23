Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F02561A8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745452425; cv=none; b=jLku4Oa8ucqh9EGweHcD/iyfggV6drs6yVsqR5lEMgRxBJbmu34FiW6OC77MrFtKnW8M9YUf4TQWfP9ZNQn5lppLYC/N6AE8TO+bRyeenyTgHBvWwg1S4DJKZrzOYhwfXL8pI90NJzHYFx2JIWNm22ZkCZJPOzM+8q4DjkwkE58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745452425; c=relaxed/simple;
	bh=CgPfChGYkYZwzqPaR62nTm4YG2M4v0JMtH8KJAOU9X4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/3+GRA4+Y0NoSP69TqR/9WFee1K1KwH//Z4wzKX6tQbZVxyMOI2n8dXqRvNbHT2NzXalNJw7w9U/vOdBHYhocsO99F+lIxOhZFvothd7WJexRtymsBExvEtQ5UoPIm8/z1MgaM5dakvspk0l/kUk3BTsQry/kF2eTB1Py5SXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyJlHHsA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyJlHHsA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso348561f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745452421; x=1746057221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwLBPEynKL1wju0MgNxJTHdjrLotKS+QD9x4JLTZx+M=;
        b=hyJlHHsAbW7XN1aF3qlOwmo1OJCOpwaC8vW2YIYClNosdz022pMDF1nk5K9ZbL+dcQ
         UJCs4jJsGBW3iUTR3ZPeh5WAGrOljpWvT13La0ZUlBdR3ccSQjene96Xl6H9JHXEo2S7
         MBDecn2yKR36iWrNmO2MPPUkPO8f8IH5CQmlgKpUS7PKEWfODQjygMUq4IM+v0wS1Uxc
         blu/EhCVjzWazLhVUGkXaMupV0HXtae7tW5Wtc0iwobAY0b2Ju6+g53Y8ZXYiv2lZ/Cg
         fzvSYqLl7sibJpkHb5WqxSEWogxVdEwbtaue4MZH0/tr1ADcvEjtP24XeHwMBDOil16w
         877A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745452421; x=1746057221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwLBPEynKL1wju0MgNxJTHdjrLotKS+QD9x4JLTZx+M=;
        b=L+erJBSWR/nG5mpdLQTZxROILQb98erCdxTtRUWVSOMvZSjjHQjCrnppRZNI7g0peZ
         h+u6asm8D29Qw5GyJgCaJZoo8GtLbIwIk5CMqCVt71hlny7aINucb1N2rFpUO+HbKSJN
         M1FPg1IARXfZlRBkfKwilnL9Idm+7StJiFIL++B/2s5XsZ+SqrOTfxGkDASB/NP0CzOh
         FjNUEh6Js1FzVaV1k/BEuf5ssHj8MY+newUHIRhGgqYY7tkQaETTyqj0ZGPqCtEYfMZ7
         zT7Ymr42ASRtcp+oMTaoVIEI5rMBvTgXCcPDNEFmis6rhT2vqHjwaA/XcWcEyuABRy6P
         efDA==
X-Forwarded-Encrypted: i=1; AJvYcCVKHv0zwxJ7XAY6Fa16nzr6t4hzXl6Au6cP1H38ftIxeqghP/vZOIrL8INs6fhSmUVBw6CYRKb7idipO2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRxSIMUuAjoUt2n4fQnvQNZnP4dFaVsflL1UzXurUnrmaM7Zg
	04ygmSj2AcozkPW3WFPZLDy3wn09db9+m88swydCDV6GntCcxMs3GIshCsaMjEg=
X-Gm-Gg: ASbGncuiekW7PNF5lbLTnJJJzPXvXJSxMSIS2kOHXMYo9FWwID272IFMddiNEPGx69L
	Pgo3gG3dwmO2A/oy2INYVo35iv49Rme8NLJ8aXKdZcNLmNWXtPE/vZHfomFj4revxWtRI2fE4pG
	ijJIDsCiew0Hmfj2/zot+AovdgCju0D9wNqWRZoBCwVWKLMqtBTKmbrgWlGuqsDB2IsTDoRAkow
	Q1IJtGLj/PJ+u2Z2srgjec2pdPcsQB0MHkZZfD6REKzgpEIGzF28en5TOCfaNjUSZ0gnsYE154H
	3ylpXsxL+bNtimnvSp0AtyaGUt24PIap537081GJ5OxHfJd1p33DjlAfERdG/MA++tTZDSn4I2W
	F4s5Nxw==
X-Google-Smtp-Source: AGHT+IFJP3TMShgZm2zs5Bo+tgGxZI2YPRYASIJhCwPJSJ8AwH0APgB65lXIUXUB0TAFZMbtxwStJw==
X-Received: by 2002:a5d:6486:0:b0:39c:1efd:ed8f with SMTP id ffacd0b85a97d-3a06cfb2d02mr270029f8f.50.1745452421325;
        Wed, 23 Apr 2025 16:53:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm267265f8f.13.2025.04.23.16.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 16:53:40 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 24 Apr 2025 00:53:32 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-3-ace76b31d024@linaro.org>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=CgPfChGYkYZwzqPaR62nTm4YG2M4v0JMtH8KJAOU9X4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoCX18jURnf7z2FqvMN+OkxjnjJe7u9mTCCSXuk
 jktMFkj8mWJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAl9fAAKCRAicTuzoY3I
 Og71EAC4qrll1AH5fWzu728PwmNwdin3hy5VtWrW1YV+kxkAGJebVzak2a+FCWJiyFSVI052Y86
 DmLcmEkXpK/wrcUiP+4/GzE4fg3WIW/KJyRw7LfMyPW/A/0cvwpuZrc629r30UEHEL1oMM5eM7E
 btL0ZT+LnMCI1wSHGKZxaBom+Ur9nGgW1e6RSgr21PKYCK7WLPJwfmohbTBKgno8X+cY3W756LE
 vWXTjXebfdPxlr3bIA2zox9TpdVHO3eDpucIZSr3vAAZfK2Qaoi9SQk5bieyb0f1jlPUe0wSA8H
 kqzUxmOd6KupX0LuHlM8vEf7DtY7TIf36VQh+xrXT42fZpr1a7/Seb5Fp5K7axEivtnxUUGfQjC
 oe4V0ca6jro4MjCd1yKrnn3aYBQEzcAzWm+qCDRYhAgc0UahGfRK6xW8Mh41GVXmTP3IApxUZkz
 MMTH++msjgYrXciZXZPK/RqeU+z5MCLpys+o6DRUpX0X/1EDr8qXYHxXJ2WH0U31o5gvxlqEumf
 BJHQEEOQ7xqnntHQHFJ0JPyYo73g3G6TwKnVh9QdIC67H98I5+LPhMVtMi2i5/Sq5PZgsQR1jKG
 yDMlOcPdYecPKI5ub1MUxp+RbTHHCYDVFzh6taJREiUYBItxdkGZPCZ1fvxKNSbHMNE67cSIHhR
 4VuR0KYfp+WgKsg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts  | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts
index c38a65598637f74e2939b5491028c1e15d573d00..51abd89fe08ff671b8e508707ca4dac055302fb3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspirion-14-plus-7441.dts
@@ -686,6 +686,67 @@ zap-shader {
 	};
 };
 
+&camcc {
+	status = "okay";
+};
+
+&camss {
+	vdd-csiphy-0p8-supply = <&vreg_l2c_0p8>;
+	vdd-csiphy-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			csiphy4_ep: endpoint@4 {
+				reg = <4>;
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";

-- 
2.49.0

