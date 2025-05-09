Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8652918C1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788836; cv=none; b=SSPhLghkNwqS+9lB5Gk8dsQjdjhiN6zmLWTMKx9mGkusWjSDUAZV8ZANOagMGAz1NX2qlMLRBQALVzXqga397cw41DvuLfqZyhBEeZU2SFmV9Db3lY01ZNZKPfdp4rst4XWuQYZZP6V/DKGaX+sXou80yUQh8SsK+1do5hxP4h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788836; c=relaxed/simple;
	bh=mx5u03b5TB/f2q1YQ3KCyV5h99vYZyaZPDhhfpjU5fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzVCGWjxsmsClWUxZ9qVOXybznvxgUJTlDfDjA3r7xFAO/NQJJjneaFMJnGtCrb2LRq14ueiM0QPL3rI5/s5xT7cHOOf6WABgHaXgcZrFPPCQcZiX8Li93vCjKHZbNvABumg3fLN4KE5G8dcMmyGCfo0FoxEYCLmolySyQPeyXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fHcu4fmR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fHcu4fmR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso847405f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788831; x=1747393631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=;
        b=fHcu4fmRqgAt/OAAqTExKWu9HZrsj8DvarkWF/BhT6M97ZW0V1BX7D69JGD7/I1nkl
         RNVL6qzK3ED43OHgytRW7mbMOSUjBgvY0Ire5N0kizQ1Bq2By9wZ6dHAamnNaS7wSPZe
         XuvemSQoz9jBqV16l3eLeMJznHtNwqxsormH0GC4qKnuC5E3AwBDefN9btpsIapYq2rW
         v+7DWGqrAzhIWaJkxYKQ6so4qjSgDrKNvlpV6LcCFxzCVkOs3DfNaUM5hAYuBrQc6UNF
         Z/EItATDoxhPLF+D/3EZbA+Pu8MWaU7cBHVZFmf8bLUuJ0kQVV84fH2LrRVW7gtS07Kh
         WHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788831; x=1747393631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=;
        b=qQruIEZvd0J5FatmoBxjPF1fhrllo9MEQb1OXIRODwyFqpx3G14Pt76cXOVi1ln7Fr
         LmJ2TzSB3uAiPo71EHXAx19PL+hl0VgXGfnNKsmAAZl781VZOtjN+TvineESlknoNpCD
         BRnd9YKEHjIe2tIOyP9yGuSxQpVyhdbSOVS0B1Twjr+OLIZM5Ic01zBJjVXdz+VD6rlb
         uJOWEu2o9Qv4As5+JekErOi3DblqXrvgWFQdyOr3QuII5OiL9mWh+PnWvYtf7XZp6Fvo
         HLMxcBfrxe6DJDuwfSUygTJ8Rirkdr3rtj3N1vFZ0SZeO8jfbYlWjEEsTQwk3GbDP6YW
         eOKg==
X-Forwarded-Encrypted: i=1; AJvYcCU44b7LES1i0BFz1jT1VvQnnx+eAxkoT5cceYz3b0BIzC50czmdTKOCo8JN6k0YhVtMt0+8BCk2jtQce/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jNd+O9sNl6t6/3dQ5Ic7ui0SK0eOHHoU2PEfzYLrC4g4HbHZ
	c5UfI4qObhGv6HCNHQ7imzej+BAv2X6nfhec4K+wEA671OyCQOoBXtX47dV6wcE=
X-Gm-Gg: ASbGncthKRhWwQsW+ietoferp2HABz6mE//K92/xRfwOZxkf3bVent3afMrZfZfr18j
	CBhOrPJKE7pPa2YVqocOtzPIPM/dVIXG6kDY5hpZvh966rvlr2wotZVdgAtbhE4w14ps/e1rHGY
	vLd7HpJaqqri8VKvQcdKuq2sPqHpiWJlZud3ow8uW/p4/fC868V2Q1wjpHcRb7FpDVpRUZX23aK
	QQcFr/tXUZ0vb5KJvN/+8MHY/dfLrDDu1Ue+SevUn30NSrtw3oWrN3G+sT7yYdosqr4XquNCdyd
	vCTuhb5YUVxlhD6YWpzqv5B7MTw6NEBFs/2IWZpDi+UaYLM=
X-Google-Smtp-Source: AGHT+IGJvDt+LaY1QQLl2SlTRe/DojIZ4tpeJAXa/uWwNzG6xIzfPYcQgejyyHruKfc7448qtaeZfA==
X-Received: by 2002:a05:6000:228a:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a1f6a0fc42mr2727736f8f.4.1746788831370;
        Fri, 09 May 2025 04:07:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:59 +0100
Subject: [PATCH 12/14] dt-bindings: spi: dspi: Add S32G support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-12-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>

Document S32G compatible strings. 's32g2' and 's32g3' use the same
driver so 's32g2' must follow 's32g3'.

The SPI controller node in dts can define both host and target pinctrl.
The selection between them will be done based on pinctrl-names. The
default pinctrl will be loaded first and will be used by the host. If
the controller is configured as target (spi-slave property is added in
the dts node), the driver will look for the "slave" pinctrl and apply it
if found.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..b5fac0bb142a 100644
--- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
@@ -23,6 +23,7 @@ properties:
           - fsl,ls2080a-dspi
           - fsl,ls2085a-dspi
           - fsl,lx2160a-dspi
+          - nxp,s32g2-dspi
       - items:
           - enum:
               - fsl,ls1012a-dspi
@@ -37,6 +38,9 @@ properties:
       - items:
           - const: fsl,lx2160a-dspi
           - const: fsl,ls2085a-dspi
+      - items:
+          - const: nxp,s32g3-dspi
+          - const: nxp,s32g2-dspi
 
   reg:
     maxItems: 1
@@ -114,3 +118,17 @@ examples:
                 spi-cs-hold-delay-ns = <50>;
         };
     };
+  # S32G3 in target mode
+  - |
+    spi0: spi@401d4000 {
+        compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+        reg = <0x401d4000 0x1000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 26>;
+        clock-names = "dspi";
+        spi-num-chipselects = <8>;
+        bus-num = <0>;
+        dmas = <&edma0 0 7>, <&edma0 0 8>;
+        dma-names = "tx", "rx";
+        spi-slave;
+    };

-- 
2.34.1

