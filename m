Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E524060D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889236; cv=none; b=HW8jJcUERSIo9aFTKBLJJNDn9CYHXgPa0jQC9QQnv0FYQ3JUbybUjhKjrkFgviLWRhmFc566unOZdDKzeWpAzsEUoc4H48OE5Uvp+UPHPciBnhPJ4smDHp+ARr6hYUdEpXvYrNvQh7mV1E7mp3YaDvorFx4Lpu0l2KnVsYt72S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889236; c=relaxed/simple;
	bh=2nnKPnNKSenGk7oH+W/zKyt+Vs9nyo2TyOcvxnYkJUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AvXU31Sy0n8+72JhDegS46Qvcb2k0xschDBBRrC/YvOCXaeBfFA4HzHrjLchZESZcAwi3QNwAXgW7XwyOVmqT8831ajkR6qSGh80Dk0t4yXxPgcQJY6vlNojoWL1OG7PjwkPcYPkmxAjIom/WMrGO0ORH6B8JjwldfPofBndfZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qce22+Mm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qce22+Mm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso5406985e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744889233; x=1745494033; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mn6UYVV7ZzZexDC3IKQgx7MkJK5bKEbv3iNQ8BNX+8I=;
        b=qce22+MmVOpq8gspYBBebktf0hkeW/6Dw0KtR75F68pVR7+Hl6BcvJoOFpwKp/TZwe
         kmvzaPWy/5TlOKoDwRZRF42Jny/EKAI6ws6Ps3KNqJ9dpEXabrScj30unZ2AEftMUkBh
         Mn5laNRNtXwnCTQb1YUPk20l29xDFUTX6HQygtp+ulkjCcemC8C20WUGlZXxH2zFgTyO
         o/DhMVogOebZG6vU7u5jNkhoelx64jEVrTPoVtHB2jHIJTIsufBu47wO84N2rQOvLSxu
         iwzJbqSTYS84i0IhJK3T2A7lGneE53g6D+SFrb2eCAoE78ceJ9KBJja4sIQlSVkhjf+T
         ZaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889233; x=1745494033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mn6UYVV7ZzZexDC3IKQgx7MkJK5bKEbv3iNQ8BNX+8I=;
        b=xI+cTAm8NnA0+iLYCyKb9P17zUIzrJ7b5TGH4g1lhtGuWyjlf5LYG/etv5F0BsW5ND
         rNW257EBQ631H1cvHLIjtETEAD0k48aHJDGfwCoy2b6BlFzusasNipKlNz3e82iqkDOd
         2QW2tyw6NRFHeDTozUkjM1oVjcE2gFYBBGhHjHQHcy66up3VcbiC1A8ayMAdk5K/QduY
         r8oZeoHaKhuwNu8y3htO5lJ3/C6g2e8ERLuN8hnxhQrkuG7U1IZENnT8lcZBJRFmWPcO
         eVX4L6IoDOBf9lP/24dS8ZbPDYSyE3iAMaSoSGoD1j1pJfW5s0KUukbCzz/RGdR/fH6+
         cyCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6r4yvzu3DBD3X9lmkLnCozbjIzqDmJpANWTZ43LP6N5FkcXw7XLGrviT02K69cGwGMvGf4XHs2QczvdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqwRoZYTghlq39knwKIgu/037wBI2CeQG4mAHYvJdYQgTsxuq9
	++rfPN9DDry+N5HaM+Cs5183gnFDlQJIAlQuOElC5Ze+39cj77USw41Elafzr1s=
X-Gm-Gg: ASbGnctZODqNrxGtgPxxPwn9MT6XW56eHi6P7H87JR2Pfcwik2/GDHWbwVNpobFlrOa
	3jrJ6c+Is6Kc4e8QdEj8bkDTH20QSjcB+wS/0c0pTLS4rRd5QvvJf8j6f/5yD/6Mcu1SUGa6qw/
	8ZSvQUpT7SUjdITaY/FEO2Ejx1GUTI/YqL1gOfzF+ti664AphJZDoykuMNN6sidrNIXHGouf6KV
	gOpl6TMIiafk0Mgg4mv71oX0i+OHmokj2og2Bt31pN+5VLVPRboho/t4ZT1n2waj2247EJXBB2H
	E2oPhGTiMZIVdiCyo6o98/sbxWBPBVGc10Ee/UWfWxz0u+7UGZjtWVZxATlM2WV2NBEMBWhd1NY
	M9xYR4Q==
X-Google-Smtp-Source: AGHT+IEUqScCO1azSIC6mQA8vGrm3CDpp/x7AVftuXoA1RfRc/gtPvrF3kjcLdpXweKxDtGUu+/VdA==
X-Received: by 2002:a05:600c:c0b:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-4405d6df1fcmr54165755e9.27.1744889232626;
        Thu, 17 Apr 2025 04:27:12 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm20144063f8f.11.2025.04.17.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 04:27:12 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Apr 2025 12:27:07 +0100
Subject: [PATCH v7 6/6] arm64: dts: qcom: x1e80100-crd: Define RGB sensor
 for cci1_i2c1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-3fd4124cf35a@linaro.org>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 74bf2f48d93522d3f5b7ca990c06519ca664d905..048e49aa805c7239e1a22b59bd784683d1d0da08 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -894,6 +894,66 @@ &gpu {
 	status = "okay";
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
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
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
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
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
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.49.0

