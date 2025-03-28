Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F81419AD89
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168660; cv=none; b=RN00x/DmXUNr8GYekFKTRYDONqaZNdDhH7zvqK+8Fl9MjEfPAjCHgoo8KH9xiacvqL+dume0gv97UWd0x75b3BVPB+k6rx0WXdpm+966LuyZqTY0j2LZfwzhQEf1/mVo2T6P3gmEGGc6Ty/IkgBgrWqM6Q+NT3qjVoP8/GrPdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168660; c=relaxed/simple;
	bh=qCh6oRLfLTgTThIJ6lv+09+QKw9X55onfRfdQJjsxHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPTByhpfO1l/Q6yagu4KYjkfqmlEALEjOAerj00pVvQAfr//lOp9xhj3w8AZC6QEdSNsxjyvPmSqe2kkNq4wrcJduVUsBewRovMfyRknnHvQJF/hS7C5vm88kfsKuXqbug1q/80CwUlvmnifGiDzx0Py6WzhAxnh2dvxKuAoLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IUsUDsty; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IUsUDsty"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac29fd22163so372143666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168655; x=1743773455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=IUsUDsty209X8KDYmlOHZZUCwwfH3dNQZN6IEd8gF0m+DviV3e0ysaK43kubxQ+4iu
         yP2d3C5+5d/f1X1oIWNwHxlEew9DaKhyJFQi6y5Y/M6YIVEyvYoLtZezW6H7DmlhZk72
         Ih5D3imEE1lSKmtAG9UBX3DbnApu1w/3nLb51YLY3iQnja4Nh+6g4bkzia1nET8C2E3O
         t9/IC5yPqM3vDw3BiPO8qkuOuxWn6C9oV2OpZ6woFpcAzUnLgHMKCSpZpU/9FsvvouZt
         33ACMOHxhBGHr/MQZqLPEJtOImI2V53474tN0AhzQ+7CtbIcZFHFZGO6BwDEUl8fxV1w
         T00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168655; x=1743773455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1w11rlVw/TNBQvhMqe/HobIw1/0AFB8/Oe+GpWOJoY=;
        b=cSvGzKPRA+rLzauIFzjAPHgT9COLO3tzTlFEbjLmbePyabJILV4i9Pypdi243OQU1W
         wnEUKNiyHMiN52+/PVdvYH1xNgA/nSwhOIXsiD2JMkLMbc8sah6DHTtb7EF8Sw+9b8R+
         4Idm5p23u6IyxIgbkmJ/qJVXrY7qN/zfQRx21cP8uz6EgommhEHvGfObFJUI+gJZEtLn
         n3eGDCWXuABeq2rD6cm3dhhyP6BvCE0SxFGnO5bgKVfdO/WIuIIqyK+8f4ptBjnjecZ4
         HVzKiKRuHB7ZxmieG10wX9ceTVQr0LYIv719anYKKwxKrfGs9WyP4xc8m3UaqqDVUJRA
         S1Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXSzKCjs0upTnuhE//5iUs79TspdwPDVAn0+SaaSoSFlQdKGeJDI7mMgp7nxcS+P2ZWdxG7GT6OnDxG2pU=@vger.kernel.org
X-Gm-Message-State: AOJu0YycJ0JqDO8p0BhAmmTlTe59/BFTxJtvnltN6NXHkf3EurN3Z8by
	DVuhpjMlCt53BUYj7Nr126hpNvkQmg4ZLA1qR0UW8LZ3WRL+YTeUpA0K4Q0AWOQ=
X-Gm-Gg: ASbGncu3RTTGcQb+N+YQtOoRbVP0Q2UmozjdIE3Qn8VVaFfL95dQMbUrZ3EzSg9U/EZ
	jr7tbs3EbjrMYhNF76Wy7pBNNhPYucB58l4deVUXdZEANilzovURyRrV0j5gIooveuKMLQsabgJ
	JVsJaymeXZ7TTJKMCeQXR+8Wtq993l6hROTeZErnxqYssCYwf6oOz2uphOOvlYjotZIlkI8hDAg
	zQBxI4r/oFeeWq7rPZ/7naox4TUqXf2WkTfHcSThs6l7BoPULqgPYUSOT5pcid3gPAB1U65VOMf
	8wu9d+wLyU5rMz2bOKNmgsy9QmGfKWUj8PRtcPs6eYnRkzoMPJCnYSt2FI1ZcU9oilJjxJzqqJ5
	JdI9ld5DVBIqqC0BcSP9UiefZLRoL
X-Google-Smtp-Source: AGHT+IEq06ryYPSRFnijp9zBT7TVwvuxmad5wvipQF5Or+uJmUZMEkHYbtpAEod3NTnJDeU/8eOeEA==
X-Received: by 2002:a17:907:7b99:b0:ac2:7ec8:c31d with SMTP id a640c23a62f3a-ac6faea0f0amr608739366b.17.1743168654961;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:49 +0000
Subject: [PATCH v2 03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add
 PMIC child node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-3-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The PMIC is supposed to be a child of ACPM, add it here to describe the
connection.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 2cdad1bbae73bb1795eccf47e1a58e270acd022c..5524f2af5bda2d29b5113f8fe14ece7f02366a60 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,16 @@ properties:
   mboxes:
     maxItems: 1
 
+  pmic:
+    description: Child node describing the main PMIC.
+    type: object
+    $ref: /schemas/mfd/samsung,s2mps11.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: samsung,s2mpg10-pmic
+
   shmem:
     description:
       List of phandle pointing to the shared memory (SHM) area. The memory
@@ -43,8 +53,15 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     power-management {
         compatible = "google,gs101-acpm-ipc";
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
+
+        pmic {
+            compatible = "samsung,s2mpg10-pmic";
+            interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
+        };
     };

-- 
2.49.0.472.ge94155a9ec-goog

