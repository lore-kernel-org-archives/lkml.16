Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAE81CEAD6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174927; cv=none; b=aoVU8E2nWtrRweqARKVrxpt2kOCkW8rw0yQH3yYP8j0zA0lrJiJSDxmXZBimOwIAsO89in+Ln0nCRX56Dp8nBX/pLNkVAqOph4MVPdYeR4qqB4ihFOdim8U3oAm12PdZSSjbTBbQDhAusRxc4GGb/ioDSwP/ICDbPMP5NcIILyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174927; c=relaxed/simple;
	bh=MYogVCHGeRc42nAQYUSM9/OiTxNHcGg1Ng9UgC1OpPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJd6cBSrLb92umQh22AmEqGzd2QVC1Yr4O1pcvIz9pEroyaUK1FuZiIf20hoeKAyLJqNUy291m3a20YR3FhhbWlYXlrANJqWzK/UzT+idq6yho+CcWjw14qnb0f3EQvGtJ8u5NBKcjmkwsb8aD7qiScyMzi552ApHBBvjv0AbCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmeZpGCf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmeZpGCf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac29fd22163so390473766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174922; x=1743779722; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbMd9XdkWBLdkj8rOcFnOleEDKh/N4y+bdq1J1Qswv0=;
        b=tmeZpGCfl8lhxL5Fd7vl8SGWNrVdVyvoR9W1/Cxg8jnajCBXeDfyJpMpOWo/SpAsCJ
         hgaXF+f38FZYCPgWGW0TKzqrjdQFmJXnHguqHGO5zE5/ArmYdyJ13+RkWx634X1PsiEi
         f+SgSPJEBfckCVM5teUwFKxlndRQ1jXFBjfbqbI11l5w4gt2YWfVe/E8djU3438mC1ze
         YkyJS45JUiphANiHnFWH559sf4xHl51ujWyWZyiiIIsNOxHhAYh6qsi+Nq8pjUyfUhau
         oYGcJjRVyugdRiIs4elgbn8XMlmiNTcV3Gb0Hn+ySnwklSzHnFEpFSAqbAsoQxhcTAjy
         Q/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174922; x=1743779722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbMd9XdkWBLdkj8rOcFnOleEDKh/N4y+bdq1J1Qswv0=;
        b=vJoXZB9g8nih2yNJvwB+qI2ZUwbzh5s06xDS9rrKg24jSgvmXBbLfn3AXNyd3E73Et
         Ph8HaYGZ5bXyde64wx666lWKknA3w7j4b6N08UuXMmjhKkg/7OGb3rUJHIB/psUeROm5
         Fw+4Z1ZPY8wvbr1IdS7KuuWZaRxwHN9v7/Zvgh6LqV093iJjFStoJFEeXtP7zQpHRcPp
         qC/3iMc7mH+6EuMdHXmsJ0YJbdbmHf7ItMAit6n6Lwy96IbFWnu8W1ltnKU4Cta24Q6V
         IXZq+sENauFgGmeVJ1+3MjTuY1uI1imyyDrfq7Dbh1mgtkOhDR5e3mRofMxw7WQe0Mj3
         gqzw==
X-Forwarded-Encrypted: i=1; AJvYcCV1/ZwpTHOMsD5+4lBbHuWTYIUyPdx/XtZuf/SZvb4PlX8HJL+kpR4roXmz/zZTi8O1TahUSquFlyfSeOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxl0tZWgsWbjOYB189NSE56Od4qaDGD7I2gNsXU/vpEl5g5RLe
	n5xt9eHEbmfYYNm10An+sVGQ/hP8uD7TX2jhKTl7ZtC7ElD6Cz+zTjpuGiCL6LIODUCnjYuuTuG
	XjDA=
X-Gm-Gg: ASbGncsW4m7/T5/goCSrk7EcDPbiYehgnX8GOrpfizSyZ2YIXMIKZAVZfJk9Ly3P3nX
	hIh9QUfXNAObRXNajhYa+uZEYYBs3Sl2zw7KHNtkIVISG6D1H19RvO9QLMhD+GNkQDfdjHIHEd9
	vXklxsjRj1a2LYe13Zf3dxVXhz90DKUBycLNUWcLsaS/tW/jRyLj0cAQYJU9jjp7bal4xGl7jye
	1hykrz75JlMjoiHePU75/2BcvznRdYbDxsvEc04BO15dIGc0fT4C5FgN8GI8rZ/Bmr58ub0ewXx
	FWp1GEJDQ2slMpirRAj+9hMRQD7ESOhI4T2Xcu0dgdGQx+CeqvWlJNorM5LguEUlZw9xYh83x/c
	wzy1tItFagwk23lO5uLc5zuwH4l+u
X-Google-Smtp-Source: AGHT+IHlWUcyOlOhaiUcfzknimHxQgiCSYmuaKhmBSK+QhakuXA6Sp7y7IZq0RbnF2cO1nyQaKeRzw==
X-Received: by 2002:a17:907:971d:b0:ac4:3e0:7ca3 with SMTP id a640c23a62f3a-ac6fae9bf5bmr718303266b.18.1743174922099;
        Fri, 28 Mar 2025 08:15:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b742sm178789266b.65.2025.03.28.08.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 15:15:20 +0000
Subject: [PATCH v4 2/3] dt-bindings: soc: samsung: exynos-pmu: update reset
 for gs101
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-syscon-reboot-reset-mode-v4-2-77ba57703ace@linaro.org>
References: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
In-Reply-To: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add the gs101-specific reset node, allow it on gs101, and disallow it
on !gs101. Similarly, disallow the generic 'syscon-reboot' on gs101, as
we want the specific one in that case.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..8c7362cf3eeab11f6bb13a27eb295d5ee6721b71 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -97,6 +97,12 @@ properties:
     $ref: /schemas/phy/samsung,dp-video-phy.yaml
     unevaluatedProperties: false
 
+  gs101-reboot:
+    $ref: /schemas/power/reset/google,gs101-reboot.yaml#
+    type: object
+    description:
+      Node for gs101-specific reboot method
+
   interrupt-controller:
     description:
       Some PMUs are capable of behaving as an interrupt controller (mostly
@@ -136,6 +142,21 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pmu
+    then:
+      properties:
+        gs101-reboot: true
+        syscon-reboot: false
+
+    else:
+      properties:
+        gs101-reboot: false
+        syscon-reboot: true
+
   - if:
       properties:
         compatible:

-- 
2.49.0.472.ge94155a9ec-goog

