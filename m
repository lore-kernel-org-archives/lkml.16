Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AB1A2C0E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169363; cv=none; b=ZfLMnmp/cYiajEj42ZLXcBlWL32NYn4TDxM681UUrdyBhZ+Tlsk+lNs2Ea7/GCqFaHCiwnabLkyi2twKBsfEmQViUY14L1pgQ1ezI00E/9kAGUPWINMhAa+w/LTxET+NHtfS96IQjya3obildctqNe1gPfm2OoPNIM1cx+3y85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169363; c=relaxed/simple;
	bh=KnK08SjT3+vJxmB8oE4UeYWWRZyoFWCDWPTt6jkVE+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G2nmUwkP5hLZdzCiEfrVl1VTMVttw9nL5NMme1S6rYZz0Fa/VD4j4x+qSuqTrzYAj0byNnyNQCZ5hZpVELrA8k95tH7xqdJM3FaKd1WZFHvaqn0hbr7tlabfmHqLmRwCJVOOEtqL81v2nFrUhjv0nXpyAfR3tnIEniwdupVYKR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5N+M7v9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5N+M7v9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1575676f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743169360; x=1743774160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=;
        b=H5N+M7v9s1ER2jOSQWMElU32YjMy37Muu0JTn0PG8rXa8q98FMn+A5X+4bweEaGRTp
         SNClPKlFxOFT9Be2nj9HgKgIbApwiQYF7t7QfGlJxtgttxrX6ltFVwfapKWXHeWZpJ2i
         X2we0XtLJTgujsXXxySj5XVwRqakS4WzlQr9ft+0G/HCUROfXDxSRkMMML4SBfCVtu5C
         0593tVNsPACL1xotL+MVdNO7i58oo9U11hLedc2dbU5csu8pOeXCmbiYb6oE1ymXNToS
         qn0XmVFy8qx/Ke01/5nencF7ErhPCACwD3O8i1Awvc541rf3me5USPw5mWDAAKduqcOy
         Mbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743169360; x=1743774160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDlZeNaPnXFvOZPkil6XrMTN1ssI/Frn8lmsMRzm7J8=;
        b=M911FWZ7yqPwgch88S8vj7LeJkw7S+A7NkCRsthwBizSzy6XjQpHXjpraxWE4Q9noK
         P7WH2lijBfu2kNY5UmfaFXkYCPuuN8appwAfkA7ZgICOEU6L5/fj7CjLtYtS6yjwF9GV
         4/LMz+8/j4ptoeEc8bbmAkxZvYZtIDJR8xBcnH87W+wAW4i0SEU4Ay1D+NDV1d700BHB
         JuGfE//46iZ7zYMalwP+HZKrDo/3tLUE57XzvvyURMTlVrw+UoCaLE5im6JXGQCC76F7
         C6+FZ+sh/BcwxNsTXkcoawaBnJqWE3CwGKIr3bKIfUgD3pIZPrD11HXHBB4kUxspyOcQ
         ZNqQ==
X-Gm-Message-State: AOJu0YwlqyQL3xnDcKknVAabk0NOu6azOPb6IwG1kTSlsPkWfYEIyjgZ
	83YQ3abkZl53sJjap0TOMnWGZIQBZRSpmETND+3ivvGb7n4BpjH6UFYYTR3nS5M=
X-Gm-Gg: ASbGncurqUxbVxMgbvy3idblmPTcnvs1XEuS6yN28SvqKcVK/pEoiW/3ny/R8LVhyVI
	nGHbsVkIytm7oFaJVQKk+SSQSi9us24H+nO9PioLvANk5x8y1WAZARzdYZlZIGc7Bx07j4k2TTC
	ekfWLpwXDiwe8ZkSbYVDRwp1ukHnu0pVF/tNEclrpbUtjWqvUwuSryMXReA9s14R+rwbAkrOLIH
	9FU3n48OTjXU34vwH7wss/PrCrZnwYCoE1fhdQSR5gMpiDeOBNNs/Oz0sZNhr8wzTAQbhypBeOe
	pq7FIuzh8lybmh+rYDjXohJ9HK569doQKSpJELWdGsjeejHg7D2nSK3pDAUL6ULBWralPHg=
X-Google-Smtp-Source: AGHT+IFfkVBjPznrQd4PYLz9zI+l9POMSzQ664uGOWa4mIRuS2P4bJKmnzLPS24Z1UOidJRlioYduA==
X-Received: by 2002:a05:6000:40e0:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39ad1748dc1mr6639623f8f.24.1743169359728;
        Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e097sm2595454f8f.80.2025.03.28.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:42:39 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	thomas.fossati@linaro.org,
	Larisa.Grigore@nxp.com,
	ghennadi.procopciuc@nxp.com,
	krzk@kernel.org,
	S32@nxp.com,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
Subject: [PATCH v2 1/2] dt-bindings: timer: Add NXP System Timer Module
Date: Fri, 28 Mar 2025 14:42:05 +0100
Message-ID: <20250328134208.2183653-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the System Timer Module description found on the NXP s32 platform
and the compatible for the s32g2 variant.

Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../bindings/timer/nxp,stm-timer.yaml         | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
new file mode 100644
index 000000000000..a9c0151d62be
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP System Timer Module (STM)
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@kernel.org>
+
+description:
+  The System Timer Module supports commonly required system and application
+  software timing functions. STM includes a 32-bit count-up timer and four
+  32-bit compare channels with a separate interrupt source for each channel.
+  The timer is driven by the STM module clock divided by an 8-bit prescale
+  value.
+
+properties:
+  compatible:
+    enum:
+      - nxp,s32g-stm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    timer@4011c000 {
+        compatible = "nxp,s32g-stm";
+        reg = <0x4011c000 0x3000>;
+        interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 0x3b>;
+    };
-- 
2.43.0

