Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6471E7C20
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231055; cv=none; b=HK+W+Zp0y7sEkIbfUF1bRnehqcJrcG31zPaETxxuV1kDbmVbgDfA13S0JbieNfXlpHaOeffE7v/KtreqAbdwQTH+/wLV7xL/isyp/qiJyuz9ZZCjnwZHF4alm33x6OwjJKqa0odf2fETO9cFWB3ltx/qFh1Z03SmeToJ9WGzt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231055; c=relaxed/simple;
	bh=RcRt0jlJL86GJhitXVjW6XXaG8VYI54Lns//RyeOLMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRURT3DgY9l/eMgTuE+vOf/Xdx9cuMCK/1jgHUUclYZyyX9klvD553CHe3c8l+8obIhWhEMzRrF9odwSRilHeBsCONab4NZtM6A2Kztw3XNBh7rZlvDR2yr9WW/P+gq3zyqWBEZQ12OtjxdPZaN391PDi+1P1AM/8/TSSBKcLCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0kxE7NS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0kxE7NS"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac73723b2d5so21222366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231050; x=1744835850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkaEGUM0nmTBd/L91+ubJHG0un6i+kZ4jUPyHnK90Ec=;
        b=I0kxE7NSp6U2K6lKe63ep9drDmA1XCoQcLtSfDcU7q+KrRDnSv9lf58V4ndqHNjRVk
         hb8jiIxvX1JegiI2Fti+IJo2svsxVuntI9aBoseipHFmmLDqSKOEXd9Gm+wqn/MdYvnh
         JaQDwtDtkAnOpoBZHR/B70NHDj6x5gHq3xVmKz92f/TnnL1icH75G/7yfrJdd3OtKgh2
         TWKdn7sTlhByuBBlYJFCd8kQlD96cC0Tl5YcFwXP/G6oSSgc387ivRsHMWQVBvctqdvF
         IjPxjdpHSt3BKlrJvk6ROqVURuDldrZTvtYhQimihhitzgwHBGSTsMoXk95/v/8xCmT4
         Ul4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231050; x=1744835850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkaEGUM0nmTBd/L91+ubJHG0un6i+kZ4jUPyHnK90Ec=;
        b=nZ2kR/k8SgKZrDoKJbPFPe7TySoDFgej3OllIRqPw6j4uM+atiADTlsVH4C34Dwe5R
         KNAcIGHUIJ41zVg/EaDSJ6RiUT3hKy9nyPfY7V+KdwQgumsVU/ApMsEBbUuiv5NKPO7W
         GA0lVVU6Ey8cM9mJn80M6jxrWBcOPqZj1qblYrw6LnQ1KUuc6RavqgJ8Fnf2GQxLz7Ue
         UGOp48NAJLZ36tHaZN/8FT+Zw75iKZzwleBfBr6sIp5zoyHlCxMQJruFUko4tG8/GtEb
         nQ/tDR5mgzJOxRpqydjWhRHnBARnf2yyB+DJKF2WP89MRbrAN7Hl6vqi5cWDA8X1XFQg
         oSgA==
X-Forwarded-Encrypted: i=1; AJvYcCWCFjAZMp/feOMNzvqv8+A50ZDnzMJxjeEAU16acOPdo5IQijeV9ZizMukPfm0phvc6STDUrG4GEQ7JcvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt9yAVHBVmm7SXpUlXISdy2KwNnYSFIoaQ2aGG1hXtBMTaQ7sA
	ME4Wuq7V2M/8bL+KczZBtrw2MQqf3XqGdnmsW0JBRNaqsLH8Na4QOPIpmUIlldo=
X-Gm-Gg: ASbGncugK6fcidsisZiW9wBETxnYWJUGULbowP6YjxdYu4bQcINSGShPNMNsK1JQcry
	6u3u04oizjdF62wyW/kxRz3hUw297+KZ5vPcBOOgyMTdxXKNp0wkClD4UknLZYw6JSYa0v/OqA5
	QhqjkKqRV/eMpwrICjMmtsrKVfep/CAu0uwJ9pTkAgqaDSeMMMlGI4o/qRZOQaWY0RUx5lpJ5UU
	Dydcytt+jcnZC8fUdnDqr7CLS/JGNucbMMDxM7E6z6xKmxOAg0e3ahawF0EEF3D4ByyU4LCvlCV
	1xnzNfZNLj907X5Tfw8f+8DEEsD7GBJht5Nh+LVu8P5pXfQumzIzdt9gjwa+FMQlWvOJEyNFjvx
	lj6PRuK5mH+7P4wjajKhx7VACqjc=
X-Google-Smtp-Source: AGHT+IEPjIei3RK/9A8Tp+rrhp1bR2HYslRxdh3PdoW9/JZ8jdttJ9N/bFj93kTMX29T5OJTm7P8YA==
X-Received: by 2002:a17:907:720a:b0:ac7:ec90:2ae5 with SMTP id a640c23a62f3a-acabd20157cmr6631666b.25.1744231050061;
        Wed, 09 Apr 2025 13:37:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:29 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:22 +0100
Subject: [PATCH v4 01/32] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-1-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
this binding.

It is a Power Management IC for mobile applications with buck
converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIOs interfaces.

Unlike other Samsung PMICs, communication is not via I2C, but via the
Samsung ACPM firmware, it therefore doesn't need a 'reg' property but
needs to be a child of the ACPM firmware node instead.

S2MPG10 can also act as a system power controller allowing
implementation of a true cold-reset of the system.

Support for the other components like regulators and power meters will
be added in subsequent future patches.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v3:
* keep 'regulators' subnode required even for s2mpg10 (Krzysztof)

v2:
* drop ACPM phandle 'exynos,acpm-ipc', and expect this to be a child
  node of ACPM directly instead
* allow, but still don't enforce, regulators subnode, to ease adding it
  in the future
* deny 'reg' property, it's incorrect to optionally have it for S2MPG10
* enforce 'interrupts' or 'interrupts-extended' property. S2MPG10 can
  not work without. Note this is done as-is using the oneOf, because
  dtschema's fixups.py doesn't handle this nesting itself
---
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..d6b9e29147965b6d8eef786b0fb5b5f198ab69ab 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-pmic
       - samsung,s2mps11-pmic
       - samsung,s2mps13-pmic
       - samsung,s2mps14-pmic
@@ -58,16 +59,39 @@ properties:
       reset (setting buck voltages to default values).
     type: boolean
 
+  system-power-controller: true
+
   wakeup-source: true
 
 required:
   - compatible
-  - reg
   - regulators
 
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpg10-pmic
+    then:
+      properties:
+        reg: false
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+      oneOf:
+        - required: [interrupts]
+        - required: [interrupts-extended]
+
+    else:
+      properties:
+        system-power-controller: false
+
+      required:
+        - reg
+
   - if:
       properties:
         compatible:

-- 
2.49.0.604.gff1f9ca942-goog

