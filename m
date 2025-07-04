Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8AF274B55
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612797; cv=none; b=b3jta8KL8S4A1aHI3qE9FO5GXZlc8a9bf2wpRLT6w4knZjxj5M1xr9VpTyU//pXhWQ+tbB3HOL+BWr205olWnJGMdxUWmQ1GDi1Yh7TvLMtOaGSrzN+xVhwZUOeeIo9QlAICf1d6zloyG/eqS5N1sQasaMNhdlA0p0totsnWyxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612797; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/9ZIu6jEdTcL6DOiQElCIzvYf+8iQMSj5jYM+zj3atv5nXLq2qOoFaWyvLzBKJes6IExjwUaWwYT4b7ar4mC4ZQzcEJfOvWhHQUAQ0V8wDTI9oouQj12aAmn2MVyJhhIxS6cxufbD2ECBNFBkHgPBn+dFWf7BvKJ9KF4rHbyjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Fz7o/mM2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Fz7o/mM2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so509029a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612795; x=1752217595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=Fz7o/mM2h6wHFr52IKi9GAm8AHNjyqraj5dYG5FGWOJvO27kxOzYrybKpmooljv9c+
         pFMFuFt9P1xTQ7H9WPJtCKm3rEU4BItOM6vtwyqdXLwIneGwH7XFRUQca+IriU2LyHD0
         42rauiw30qO6o5dpYhTUbAmvHEZY09kLW155rQKioyRiHQTEDez7P+UVQZhJUYFUOmj9
         RIn83CiMI4FOFEHjdHGAC0q+7gYFRyIKBPoeY44FNubot59YfNUdEuxnRtaZoWLvPRsQ
         7XOvszfdvG99kepqHsUzFfS1tfj091yHRwV7UdHoMo2h+gnQPSoI4DBEpQvaTnGyBxb0
         5nKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612795; x=1752217595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=S/I4Gw96q4xY1jPIIZadFBNb/VSfEv6QNykDVHLJ247vGJpksN3/l72/+Ki77tSrQW
         ptxccHCrAL12yKJF8J1Tx0tM1Mq/n+bSGw2MZHpr7Npn9t5PHUO6YxJP5fejR2n1eY/S
         pzv4/8swJIAuE1pObQNtSRIz3Os0QUtjJItq+CxBIuPV/lg3wP8ayBLh1XRRbUBEypWT
         rZMfHGqiEMY7qVqqTEFPKDq73D2i0tnJIGxQQ0Es48i+z6JcncPmb9kXWKi1z4HqHNUR
         7GHv+VpRuVATqNks+yAiK9U+emePmxRAl3l8othNOTl8w9RPzVAABPvMNGiIMb6vQ/9A
         sYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf3KgXoOosCndMp8mEpSrh6e36jMckJHJNREYSfPTR9CSm0dcdthyVMaNR2IIkbj+NFhEYltmB4NgP+sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLZ2wXXxYtOMszOHiV6YpZdhzx6+CibW/f4ZxTq3KorA3SGOQ
	vRMbBcgHHT080Yr0NP01JcQp+/eW20O9oDyhjDgfzQXHNg+2paeUf4+W34fGDRPCGxM=
X-Gm-Gg: ASbGncv38+c+JDBXDeAcJMkRrYCSFaQEyUXRPR+iAF86Uk00FDTzyL9b2uuzIhFrGqk
	88ZYIeU3tUyJefkbOv43xzijVHMq6R68JOrPche1jdYTKC7kvENe9VN7LCi6O5Y2Rgam7JJwm5n
	HnfbDeV3lXeuipfE89R//bfQsngjH6a8GZwupiaD2cXq7ZEozh4yiwRTqvcjZcXJE8RctJGm3dZ
	Bd5KES7oBeNuoxH563LLxV3FjVkDI1kafZkF/EW8iIM4PXuxq9cqFQnldXBipGAGtdMoY5OkjeR
	AAK1FtbQdwATJtguy1bEQP+BL9azRdD0BsY2Ut7ApKWvsRz/VnQKTBK8hXEJ87EWEoaxBjJoqlr
	arP8QGe/mpx55vDeylGvc3e2yzw==
X-Google-Smtp-Source: AGHT+IEAV0Fc7OQ+p+N3aeKR4hWU5j0k2m9hYRe0Cek5o/FhAH46ghV+wLUFg/vBseqqFoDBfYSrAA==
X-Received: by 2002:a17:90a:d40b:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31aadcf4c5dmr1655175a91.8.1751612795169;
        Fri, 04 Jul 2025 00:06:35 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:06:34 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 12/24] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Fri,  4 Jul 2025 12:33:44 +0530
Message-ID: <20250704070356.1683992-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

