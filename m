Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F34A285056
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248919; cv=none; b=E0AkBmOQXNJExBRJWcZa/0nZil/zN4vnc5wDc0q3w6+SKxYJbyFmG/qhCMM+bDxq557YlAWFV2CY8HoroMkW4d3OMR1c1IvNVbb9GSZA10bmbv9E4g/smdJrLQgii7uDdSsxzG74pHJiq94ow1ja8DUARrg7+8AbAv41ht9PtRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248919; c=relaxed/simple;
	bh=psnTedHrRclNzYfKOxzNdzEC/lgie9/9OjOQXPUJ9ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXWnyAeQ+7Ehs+gIExvVe0csX3qAvg0Qi+z4DZZ0I9DxFRi81Ua+vueJbp1FP5U743Ek8654ORYOglNUMMpYz3kE30zD4uX4TMGTkek9BAgfcBrY07P98/DnWc+i3CCJ0vrqfe/wcofuBBXhFoTjpizW66MqcWtqgOTx6AvavNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=LYmhLDPo; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="LYmhLDPo"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31c978688dso378318a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248914; x=1750853714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=LYmhLDPofo6qxx7KvJQRfuxNHsONrkWruyoGMTAL3uvEtvjPSHgleHaylDMPtjnfGN
         rp8SPHeofSmbeHOBP9E2YQN1Waz8KntRGrdXXSxtys4c/NuEdJFs+IAV+Cra+RZFFqji
         MkoaBvPw7erHc+iHECO9UdyNcpNWBf7wysKwtbnOE9Uk52lKqKcb4a0b7negPY5UCSLd
         7dTc7zIMxBNKaNGxNCc75iw5Df03PzOwtqw5V855iRkPspPV0Kb/t73d7WJ/fbAupUeq
         g3VKxGaa5ed5ObIxmcDy616pV/DvGSGnPXX3DoYUwdMgJR9hZskZTwByPUlnHZikcIzu
         fJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248914; x=1750853714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=Oqh9VAkW3tf3a+vxlI6yrbiiQCQcGq0DDj33twsCgtLP9VVoebU0CRoi+hXgechE41
         epHFhoCA3lb+Yn1o9qgxiErDD+ymNHfAAJGXeuDPYU60kBe9EEOIuO0o9TIapcrQaPxH
         lPNPcdhbOgtGM4zjPPbJMECoYy5mEl9q0e7DIzNZjNmZp6BhUk/tvGAep94KMxdP1/4v
         2s/0EbzkZdO8ivV3mhog+GK3N53GlB1JRZCE6pDmqUnz7t7avkeP9/SshMNwXYld2Tbh
         pvPk5le26ZHY+HgKpInqnl1JBCevcYg3JB0jlUPY5dskomHurFCaxhKwA7P1NP435uUC
         N10w==
X-Forwarded-Encrypted: i=1; AJvYcCVaObPodheb27xkD0y59OeifSzd1Ex68PE3+BkSiKfRC1Ce3mJimLPdjOfyxJshP8tYc9eKEekKb/n4tuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOE4wAaFI0vB3/Dsv7LxMprZTSF5O7lQHHqMrDBDMh3LX7OPWq
	o8vF32SmPgQwwy/+4wQMr/dCQFwJ+Sqe/IMAX7Z6lMhZEQDh1Hb/3iJ9Yd4tIFAobp8=
X-Gm-Gg: ASbGnct4LtPCz4jBO3GIeRI4uKgjf9Ny3C+i+AAy+wjRAIpLHIkjozOXgNGSgZTgEY/
	xeMS+51Y2+MH8qOc18QHX/rIVEgHSbcDhP8vCeEF92rBZX0hcDulfcu3XGrSQ2+gSbmrPUiFTw5
	9uHZHPXjh/YQdcR0ogIht2UJvlNp4sl0yQ6GeOHCKZ8/xvVeyUJKWzNta3rmwDquJvMd6eSY6ff
	iMuR1cY9h+zOTif4J3fcF1f+eh0QDtOje6m1OR3PF04Te0ZtTYeBWfe5kZ+1xASbK19H6bdm0Qn
	WuDNEjls+R0RL3fnJZMwO1uMC1bGcSyV2Ee/GaFQawOXxWRUrcjczgekBUpvZ59qJM6uTmKxh1y
	RKVU8ZAdOGi22JQ7WGg==
X-Google-Smtp-Source: AGHT+IGpDJao2qZOumFSvvfbkzlCDWzk3wE0Q5eIberU12DIM26VmJ5PFPyH0X+lTLfK2UXnDjT87g==
X-Received: by 2002:a05:6a20:9e48:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-2200eefeademr41789637.23.1750248913920;
        Wed, 18 Jun 2025 05:15:13 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed, 18 Jun 2025 17:43:42 +0530
Message-ID: <20250618121358.503781-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..70ffc88d0110
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0

