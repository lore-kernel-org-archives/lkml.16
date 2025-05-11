Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8542571AC
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970908; cv=none; b=YoW+V4uqB46ybLNEmTXE6BuI8c54UXlP+VSyBcfK2LfF76R8fWiTzP6/bOMrggtnjIMD9vK63udjHPKtLxVdRiILgwmwLt278/UDFNc9vfvpKOpjAl4PtfvAeTfawbXFqAUQq7oknhOZVWjiA+SXhiLNVgljyfJuNnFR2CNsjqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970908; c=relaxed/simple;
	bh=jCfuPkwpFJl2q7jmzk6VEllmsuHOcm1t3a2xapvV24I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnnXspDQA50PQ4bMdKuvcLEK1wt8jO0GyF5oVtQeA26Koze7oaPzu8zEBckRu46asZGIaWfRRXOmqGpFFjjPxNs+586+mGQOaH0W6EkKw1VVgUxeAyNoMaDZELFuwuRA/Mqi31hNvCBeWEOYsMHDKKM65aUZQjCRTEwIF0o0bUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=d8b2TPAv; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="d8b2TPAv"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so3016450a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970906; x=1747575706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=d8b2TPAvL465YCgfSXVakf856Epz1zsSezGXh16CpRt1uxoJbhb5/RwS4CbrkcWRDB
         AMTB3uOb+ysk6i/IcT7rrfIMWnFKkD9x5ZYHekJxq6VV/CHzndpOULDlr4cdRQMin7iP
         aD5+TLI1O0m/FMk2qYpIYE6qK9RaH3Pqrjj4GDvX9dXFw9YOSzgBD6ql8DlC0WLSOrVM
         JnQI6nk/hqsJbQRhu2Oy/m4JowkggUhO4rhRZAeUoCwFLcLdCnDPyVVKauCV5OPFpkVE
         72jQSVFd5V5i8O79aO68seLwB3G/L0cPZu6zH5mH1mKYVM4r9KzAhDwrCw0XSbNzr5UR
         aQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970906; x=1747575706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=jWoxkK5XOpKf8byWI35dvkf9vQIdJOlZNPlSsrJxD11FS9KuMdgxemrJ66BwIALrxK
         2NrIId/Wvm5sgpxccfBWJEmcivOfTXubOzJCbc132cf22FT3XWLxmIRg/oU5iN7ot6aF
         b/wq72Z7kao9f6kEDqzJfsJbWun6JmVz4fgz4zqWQAoi8hzzolPGtcnvO47Xo2eKtxL5
         u8mLlJ3hX3o54BLhspAIJhh8DqDjGzGG+vUf8BxgxA15BB3N1+omtbb9H3BVAlU0QGMM
         oM4WOFr+zevXOVmOIgvJbU9G7tJDSYtS65zUhBZRuTVvk5c71d2iTfS6WTn44+ocrfnP
         +HnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJJo4A7XjzPaW8pP7+/Daokj4IH12BYCVAoVqy6/pIYAKLDegWyZKudIteeeFWB7619Rg4x647qQQUK3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRXXcY3Sg8+5qCTtv4qbl0oRlkhGdGjO7PA5d6YINAUjrclF1O
	YltHK5aXCrMzoMn1jEY9TR86r0CI5nF4h4rzFFklX7ySclPISZtAMuZESoKReNc=
X-Gm-Gg: ASbGnct0vkptH+eH+L82grrXPELMRuX1lIW7/8FDC3oKlRWvxcS6LNd96EPVJdTySZJ
	LWvESgKDsx6UmHCyGoRHC/MELdbSPKIiWRxX7iiUvc5xyunNBGezC4H8Pd7EeAVxO0IvX+C/Ji9
	pZjrYDsVFNSIV7bwgP+Fa2RGzOIkKrBg37fdbDE9uJjHJL/vg4E6ZWlFY87rjapLi+gTXViHC4C
	GfR0/JAbMJk8bxfnGzKpUEV+rVB/Jok69Kj9Uusk9I/0JhyUgrrfFvsKfzXhttInS3L1c+mZSTI
	nkXXPs1G+rJ/NWmYJU1CcfkJswkFiBTRlYrmpn7EDhpOzfiTT5pkmvvgQAR6aUkDNAxtYw+G913
	QeIrZIkgog7H4VA==
X-Google-Smtp-Source: AGHT+IEBohvepS89G2D6nGzfwIv2tEC45ULnZjbOGIjpp3b+t/Iny3a9MgChCV/InRq66ah2kQHc+Q==
X-Received: by 2002:a17:902:da2d:b0:215:a179:14ca with SMTP id d9443c01a7336-22fc8b0023cmr119115105ad.2.1746970906337;
        Sun, 11 May 2025 06:41:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:41:45 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 12/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Sun, 11 May 2025 19:09:28 +0530
Message-ID: <20250511133939.801777-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
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

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..ac13cec0666e
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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

