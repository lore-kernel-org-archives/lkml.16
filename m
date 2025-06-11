Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB0A22A7E7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623073; cv=none; b=fpSeglBkmRGueqtoNyG43mX21TjXkm0607i7+z4/p+MOedYlBtBI40guGgiDxZJEYUcB37hOKI3CfzrqxNcXcNSqCP46KZhj1pMLMyBadDMgthmcmX6rjwodvCCA/ql9u4JwTu0eUqdqySSZjchyhgd6yTHcp1YXf8FeFJHx2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623073; c=relaxed/simple;
	bh=8kvFLEv/hykXIxvvHlFxYncEhD8VC0PQqlwZgaO68IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJx71WCNYhAXwNMINmNbx31v0vhCAYvpWpm3rJZXhwszeSYihJb/MGl+cEZsi4X+ALrvtqTRhINazCCiNBWR5iHEIerfiHv2pQP6qqHZPlf8CgCP+ZyypmBLyyjGgOM1eWbuD4MqAi434Mcwc7ntJ055NLGefqB/axKduaCBfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YhNIoPCH; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YhNIoPCH"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d366e5f2so71482885ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623071; x=1750227871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIz85jrszx9X2n7VJMwt6ECwmZMzZVLMduOipCTmFkU=;
        b=YhNIoPCHI27jgGe0L83ONZEY8nSfvRjg9rbB1JWZWWQaSYBRDlqfxpJx2DyCSNg2lI
         XoWhPSMqxljJH9S4ednZbFc2yBBNKJVm/flB34ny8PvalTMQ7mwMLJPToFhMzL4yncnY
         vcg70HtoQRuQyXck1ZkiV9OG+V/F+Kc9yomw4Ays4sBVlnBTNsfKaHwmeWzaCBenu7+H
         7JGB7w633l+hNpaR9udMRG9MStAtn66IAKGsAq7LDTu4hiJiNctfsKoE0x+gh+hlaRrm
         EoeppGYpsvZcdB0m2KYxzJbfpVTQSgcScSeXcVMCZg/wRvsgA5Ynml5DDrWxrUIqx5/l
         tnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623071; x=1750227871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIz85jrszx9X2n7VJMwt6ECwmZMzZVLMduOipCTmFkU=;
        b=axjSPqFJs7TNhCRF8+9vg0FhHX1uTuilOTlpGLwnJZTScXAyHFqsVuBCZPRhv/X1AB
         spdY6SrM8Hez+hDihJ76fsD4ozqrjmnNaTJs0mMe6CHBpDA6C1rsXHyzroK2kwvRxu7H
         sUF4kF50ZAiHueUA53KkPdRSZ6YlF3IHPiK4F53TftSkR7x+ZbvqH0IjrDA6aA7Kcd50
         K+0izSWO2Kb/Rn+t68Z4Wrehaf5bGbSiHHPLPa6BwbRJtKq8nQ4MRmCcEYFAnFvrnVBO
         Cn672nFeNovq2s8BJQYXFYR4U3U4oSlT7LqSHip2eFTQm/AXt6JITxQ3clnnIHeL8hNq
         t0zA==
X-Forwarded-Encrypted: i=1; AJvYcCWt9GcnDvz5sXjrLGbDZnhEpvrpIs52jiOhGcMKoyhaX5fsW4s374EIAR7ab1kixx//seePguRufMQQy0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQ026IRQNnPldXjrnYSepM/FqOdMKQYJ709lCakEo4H52HacD
	d9ZalZy3DUqdKS9z3ZOgWqLbLTFdueTFreHwJPAkPfxZMJLFkoGdYONjVNj9j4WDPSg=
X-Gm-Gg: ASbGncvx1Bdyc5agYaF8mVvlhjjYAGlsiioh0QjYzCc/vIbHzOeUrE8Tyy3Pkp1IwuA
	+h/8/S+W9uTu3MfJGxA8PSl9YpTJw1Q3GHMhbr1AoxRAB5YWOvULW1MbkxVQHga8yFEvLpKSGCB
	0E7K/Gx/c2pZ4RkG+zVv3BuBfTXyS9qod21mN62IE11AlMuH0JPDfkAtGCe10Ytlx28oyhTKyAl
	2YwJEh8YePyqUvWgyrEPObeXT1+i/azYG+sfVEgFCAg+pr7rqsruu9syMmwpD2Ck7hXRlnwr3pb
	NqzauHrET3zYtWx3hL5XpOxiH8rJ8/AsH7DCekyUSdzjD0xdfBVVi2mjqO6tja/okp6ZLOZa+d/
	8jx5Szhej3uroGEQlty1LJ5a5xk68k1io+WZo
X-Google-Smtp-Source: AGHT+IHC5ty5QP/q1J3Y57ZfLhayT8WeAP8B2wlbdhm3ivVDvErbI2rY6NWs1ziwWXlteWWsGN8o0g==
X-Received: by 2002:a17:903:41cb:b0:235:efbb:953c with SMTP id d9443c01a7336-23641a9a43bmr26770115ad.13.1749623070681;
        Tue, 10 Jun 2025 23:24:30 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:30 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 11/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed, 11 Jun 2025 11:52:26 +0530
Message-ID: <20250611062238.636753-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RPMI system MSI service group
based interrupt controller for the supervisor software.

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..b10a0532e586
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based interrupt controller
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
+  The RPMI specification [1] defines system MSI service group which
+  allow application processors to receive MSIs upon system events
+  such as P2A doorbell, graceful shutdown/reboot request, CPU hotplug
+  event, memory hotplug event, etc from the platform microcontroller.
+  The supervisor software can access RPMI system MSI service group via
+  SBI MPXY channel or some dedicated supervisor-mode RPMI transport.
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
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  msi-parent: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+
+required:
+  - compatible
+  - mboxes
+  - msi-parent
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller {
+        compatible = "riscv,rpmi-system-msi";
+        mboxes = <&mpxy_mbox 0x2000 0x0>;
+        msi-parent = <&imsic_slevel>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+...
-- 
2.43.0

