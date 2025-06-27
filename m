Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3574C22B8D9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011324; cv=none; b=q+tIj9HqAyglw4uZs4z6xtPdbKCHrjIhVyLpzqYJh6tTETpRMSMigQaWP1UdZLcILUS6ecDSt6brMd1OQIDYsZHdY76lHk4QgB5hBnGN6jgDHb5VKe82OTnyRaygVvhjChO9L22nMUeBZ1PkoMb5rtlswx6qNMP6lVr42ngmF94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011324; c=relaxed/simple;
	bh=PwmTdHsj4/TIhdqdhH2xWAIrULM+XVHbnLKlVFqmrQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lj1qTmK+n9thJHLVxvlToiUpdut1nnGqzyfZ0ktm9LNSnNDphzoEGqg2j0SCbUbomJPjf82wt8FltqAmZuFMzOD76X+rbwP8Li7y667Oml+NRLPtttDI2l3qniNe7MBvvnc3IMq4XgHKSZWMaPow/YBopMiCDOXloKBkn/LQgcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PsOzgwgS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PsOzgwgS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-453442d3a15so734365e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011321; x=1751616121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYKyHT6aO5DOvkeXEodSr/zn4tG0sPpdUKZb0fO86vs=;
        b=PsOzgwgS3Gy9VrlLf2Ub++c0tjjE8KPUUW05h/0bQIb+3XDlKLe8C1dlwAAPueyHR4
         Hse+ejm58Yh2C82DsiuL+EmtejSaA0DMPvxB+08kSLU9CJxrsOb+/9Npz7HWf2CNnVmB
         yLM2bprcU5yVLkaqgZbFHq0y7pt/3CLNPv4/4EwQUDappLy/fIekbV9mBBLqebzcYqpJ
         ZzMqvPN9hRWA/U8/z8TnUP8O2Xcsm7zuiEWumbNDldserLHBlk4JMpd07QHQSTvT/Fey
         BJVKthL9gPnW1vgRJbLFNaPbGFDTbFHI4MlJfUqCs2N998oY9E3JZSHe2hoJ8N9nNYG/
         t18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011321; x=1751616121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYKyHT6aO5DOvkeXEodSr/zn4tG0sPpdUKZb0fO86vs=;
        b=AbzhQmar7WRAjvzwbqFMfhaQxX5HqUqVblq8KcCg1B06xvoa2r797bo8WWvsXmeQT1
         i+t6nG53Qd6pvB0ujVA5+vm6Et1xVDQ2lIAnMeEBFkW4ZY9J92ondNnfiMe2OlYp9/zO
         eyD7x/Wto7ZY1/6iyZ4Jv6ANGWcN4gXvXqF3vteLfk87sd8zfHTYRrK2b9FVlqgawj0q
         XcjdL07k69tj05BbfJfQyeXM3ZuHg+HI5aOLMG1t6D7DcimAnFlcLyVkmTtX9eCYDu44
         sIYMRV/O2UtBQin3PVNQDTNR5Sumx1SBInCDTT0wgAKDxxEtGMlYc5kvMKkzqb191A1h
         hy9g==
X-Forwarded-Encrypted: i=1; AJvYcCWiOG54rQP5xLKBXdvCgcAQ6eWqVSTduiqXXT77fjQlC3GW56ftflQ+K2eHd3g8c8FSPT8PATs4ieXywr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhaYKSYbSK1WajQxaAsezpTsGuYaVUW55gNRj7p2NxtoYwn5S
	F9LClIrviC8Gmh4hEXjRrL/4qxke/HSHo91g99gdp6+9sN+SNYEl70fNXvLr2PEU6i9S1/R03V0
	vFoIb
X-Gm-Gg: ASbGncsfm6P+i8P6SRjSOcZAetXS5fnG7foCj400EYxY6M5rcxLSb6+9JBXUFuXXPQo
	AmF+3t/jzK/VVFCXQEmrhvIvIkrHfR9Bbu5LYFqN3OxpT7Z+uUsdLpfVvE/BPGS32aFGot0jZmq
	qBapHC94BiIHyQpQu77a9dhSBLLx8MRznqY2gdDgsLGjvZmj98jTWfXgCotEov2KYKqYcSGziC2
	/JxZUzXhYmlBrhwEyU5AYuD/nbCZ48h7Bk+vl1XdgTKRXIj3IBrGPKM8ORBxZxojVYTYo5Epnk+
	1JC4/bwP6Yzw6dbAbP6qFTeT2uO1FINP04XgA5s4zBNS9D0DRBbR7mpw1Lb2WDoy1c2rbAkcQns
	U
X-Google-Smtp-Source: AGHT+IGbEV2sUnNrxRFYjuNrRGMB7WXW//KusOejXZ3SR2Oskrso+cf6bF7nRXl/S837W13BPpM60A==
X-Received: by 2002:a05:600c:358d:b0:453:8c5:95d3 with SMTP id 5b1f17b1804b1-4538ee5d303mr8805925e9.7.1751011320856;
        Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 27 Jun 2025 10:01:51 +0200
Subject: [PATCH 1/2] dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix
 duplicating dtschema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dt-bindings-db-v1-1-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PwmTdHsj4/TIhdqdhH2xWAIrULM+XVHbnLKlVFqmrQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/zDffaVv55xO33AhhgMDKyChlptnb0LKWur
 /dA0UkREASJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8wAKCRDBN2bmhouD
 1yO3D/wMQLq1PsZux5RgQ00wXyiyyHfReZ+crthyF6UOADtqrkzEfMMHGxklbh8VFbm4OwQmyVd
 gQCQmXR3RSty42vCDsZK235jY80s6ogQudAcA7sudV9l03aos+6xp7c/FASx8Ziko10NlvSgyIE
 pfX4xD7FqMA//3i5ze18WV1q69K3iCcXy25FYV7bWbJJl1eHBBikOphoDL4HAeSMjG3U0GJ/MCh
 eyqUfl6OuiP2DJId69jXKDhc7OHJt8BGTBlh3KIoGc/3MF1ufLTnUc0cISc9cX7jk6aBSKBXZEl
 +U5JHKpIhuSPNZ4utuTREOV3BUO37GgGhdUnS6jOeLgePHd++txihWJ6zePHEzwGqkC7A7s2BeU
 +y7SXiwWPY45eVNiF5m4FlVdiA7GKi3KnaSu4BGwAg3vqaxS1ykJmQzjCHMmbwQK52sSFzlbnSW
 WPW9Qas3JC74gC623P192CvfOVPvyYv46Ul6REyHemhEo5eg7AduALAPCadm5Bk32gzTgGeOnKG
 uzNXOGn/N+8WVXWWKPBaxl1YaQeOAjaAWdAJ5M6f2iftZWDwXqbRpFmQx+EZXkzUEKWNSR9CVX9
 9P+fR7ARSG9kkSXJPCBWQec9OM4CShzGn9tpkRr7dESn6Gtteg9gCombIJ0NNhiw0s7muTsiNMC
 /rzMX3sNs4DelnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

A common property unit suffix '-db' was added to dtschema, thus
in-kernel bindings should not reference the type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166
---
 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 3c0431c51159e549920b17cf2ddfd1b85ecde810..906735acfbaf94fa08244f771139df207dd6e4da 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -42,7 +42,6 @@ properties:
     description: GPIO attached to the SDB pin.
 
   audio-gain-db:
-    $ref: /schemas/types.yaml#/definitions/uint32
     default: 0
     description: Audio gain selection for external analog modulation input.
     enum: [0, 3, 6, 9, 12, 15, 18, 21]

-- 
2.43.0

