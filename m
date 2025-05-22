Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D828DB64
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925421; cv=none; b=R7Ns11n4zib6vx2wBwzuEARGMW9KQRAobBriJv1NswpmN72p9+MYC8TurbeNRNB83X+BCMo5QhbDA3OecfLrHOIUs71Qkf9IhesoFZXXOp2KWVGXhlgV04Icp1j7IULo1C+799elij6lbjtlj8N/3DB7gAeN5pIzxWuROEyZHN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925421; c=relaxed/simple;
	bh=YwtMVRRf8kJ22avchfvJG+KxJpfzNSQSnpIwmkk1p0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pETKPWIzu0yGygkq+y1ALseXW0DZflfyoUEuUPt/LxObijC9bPpT0SRGfHwVXaMgIezpAek9hUmNugC+2RBzhyODxWP0wbbd4NcgG6dPItES0KEzcICJW7QiMffd08qyb8A/mDbptWqydOtaRUToae9FzQnY8xZhVzcJqyUd1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZYbMvnLo; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZYbMvnLo"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f6dccdcadaso6176795b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747925418; x=1748530218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIM5NpqKSxCNfb1OJCfsBv7sQidggBRQu0Cr/nYznV0=;
        b=ZYbMvnLoGRJvujVeDt41XYMAnhMs0yoFsyfpoz6iHGSkYkDMnnIYhBqMt+Ml+tHU2/
         wm4s38RXivY2T8fTtBUPbbn1+DzYNtOko436Uh/ODtGC3CfEaYuo+U/Le5n3WLJiyWq4
         4tBt0IlrE+nlcQpy4cc+EkNp1CEdS3SgTbLx204bwayLHFZWccKLTLHPi2o1XBYBc9sg
         f03ukE5xcOQaBvBFe/MT3bSD95LRaKHGvrqAXtOMpBNAbyO8cVN9NOCA8eR8e36q2zX3
         RNG8smXuG1AUMPTZTeHDbYQrSlCu0YD247RJ4++7mmT3TQZNo94c4YCCoGfo9UatgUs5
         DQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925418; x=1748530218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIM5NpqKSxCNfb1OJCfsBv7sQidggBRQu0Cr/nYznV0=;
        b=YezTa6+sR0u263Gu5eVIvCqOWnoEVxoj6HwQ0a9K5jNj5DIn/RpSWQPmmpnQVTuc9k
         IbQlQAe+9rFV659NVeLfwOneWe8+7qdtvlw0L0KM8LBQsFSnGaCbhHFYwAd1jt6j5m7N
         MCEn3YasM7VIPEHgAcInVaItBV6HpmkTpxqWzNZHWxXQm0mKBmWr1Qf8zI4aOeELWbhS
         nU93yEoNedJkj76fOfi1kHVzDTGNe79La5m3saUPclbShkAVRHgZluZSqrq669pHHoX0
         J3ifI/U6TN94/xUZ4T8fs176KI2lYIjCKtVuk00FQaAr31CfXeSI8QmYICbtuQZl0adc
         pxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeieMqdWCvjruwWHbD1EWza5mFJvcVQ4oKDukr/2paPiXrePDtNwsdEfqjDsQK0xjipJceCkePK9EaBj4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7FuVEN29s8AwLWT+G02+lU+srv2xtmCz31i3KrUYjnBCEnLAZ
	cUGF3RkDpT6WreE/kJIx/SYMtX1TmBRUeXKAHqCYi6tl3uI7a2nowVbBTIGabW2NO0s=
X-Gm-Gg: ASbGncv1wwfuVZY7Dnm9GlFdticJnLKGPNP5qxJbEZvj9PNVLhqzNTDXdkQ/eerVWbt
	jl7SHpsh90op+xr75ggdf4kv6/4onyzluUvPghzt3GkQxFaBqCoZi3hZLRpb+gWVkRust6Cos1t
	13gE+knVLUolBrkVGgnDkQ//nfbSKAi2iTVPSAAG/RhEn2qXkW4dmbuHlTYbf4IIeFICGS/cBC6
	abvKMSGo7zTS7mbPjIPJ2N2BW8cRm4ScTaFko8tBntMEMKlGO9v2MqoGQGE0WyOUQiFAIAkOm3G
	y7JV2N0XylVuzdlzANSODq31rPvQqGU2MkeC/yuk6dI4H39Dv43liNwh1FqMMwt44UPo
X-Google-Smtp-Source: AGHT+IEbvoqk7gJskuQpvUR7QPX/lNdeeNBLSgIuD9wBT+/ZZsxHmlbQkeu0Re4A25CoUWD1p6efEQ==
X-Received: by 2002:a05:6808:83c8:b0:3fe:ab15:5ed6 with SMTP id 5614622812f47-404d86d8c97mr11952293b6e.12.1747925418083;
        Thu, 22 May 2025 07:50:18 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3407:53d5:68cd:400d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404e303ffcasm2228234b6e.4.2025.05.22.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:50:16 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 22 May 2025 09:49:40 -0500
Subject: [PATCH v2 2/3] dt-bindings: pwm: adi,axi-pwmgen: fix clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pwm-axi-pwmgen-add-external-clock-v2-2-086ea9e6ecf0@baylibre.com>
References: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
In-Reply-To: <20250522-pwm-axi-pwmgen-add-external-clock-v2-0-086ea9e6ecf0@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=YwtMVRRf8kJ22avchfvJG+KxJpfzNSQSnpIwmkk1p0g=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoLzmTqUb9mqfNnT61fY09rAc1PxMF6lBQxA+kH
 p4Fj56HLPyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaC85kwAKCRDCzCAB/wGP
 wDf4B/9JaAIz5MAT5pRx8xZXPYOs+PS3M+7aiZkLW/+RHoq7LJzMFkrItZfC2ZM/lxF+lyAYFh7
 DU/RaWpha8k258skVDF4khovXUftuUzWmWcyQniitsRl1bHaUEYQknZBTRlnwPTNhZcCdbhEJuy
 Xkm/qR9Cyj7UDxyaOJumoRFTkoZB87K8bLYzswQuMPhSzsJ4u+z/QxdYCdl6XaR7mkFEFYclfWq
 /+90/4iSQ94DYD6gD6Xf3n507tqmU9GyO5eaTYPFUkeuf3aXQ9+oupM71vF3jnYjzZbp4GvkART
 lmJZYmDxIfrj+GRPF7bE/keYCx2xtEVZ3mVq2Xk4djAXBEHQ
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix a shortcoming in the bindings that doesn't allow for a separate
external clock.

The AXI PWMGEN IP block has a compile option ASYNC_CLK_EN that allows
the use of an external clock for the PWM output separate from the AXI
clock that runs the peripheral.

This was missed in the original bindings and so users were writing dts
files where the one and only clock specified would be the external
clock, if there was one, incorrectly missing the separate AXI clock.

The correct bindings are that the AXI clock is always required and the
external clock is optional (must be given only when HDL compile option
ASYNC_CLK_EN=1).

Fixes: 1edf2c2a2841 ("dt-bindings: pwm: Add AXI PWM generator")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
index bc44381692054f647a160a6573dae4cff2ee3f31..887185ba89daf6eb18ffa2cba164ba546bfbcf2c 100644
--- a/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
+++ b/Documentation/devicetree/bindings/pwm/adi,axi-pwmgen.yaml
@@ -30,11 +30,20 @@ properties:
     const: 3
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    enum:
+      - const: axi
+      - items:
+        - const: axi
+        - const: ext
 
 required:
   - reg
   - clocks
+  - clock-names
 
 unevaluatedProperties: false
 
@@ -43,6 +52,7 @@ examples:
     pwm@44b00000 {
         compatible = "adi,axi-pwmgen-2.00.a";
         reg = <0x44b00000 0x1000>;
-        clocks = <&spi_clk>;
+        clocks = <&fpga_clk>, <&spi_clk>;
+        clock-names = "axi", "ext";
         #pwm-cells = <3>;
     };

-- 
2.43.0

