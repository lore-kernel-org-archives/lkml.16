Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7E11E5734
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162947; cv=none; b=lI1TjzVuIZQDBtmqiylDznUYVDcl2qaS+v3e2Z7Fk1jU4rkzigaVRsS/c8EPQJgqb+dEGdGunUdAOSkNOI0bQhCgPlNAM11dnQb5pyUpts/06G84zS8pIcJ8ryrkdLzstrAriYbZUcAmSZolsQFWtcYBpYc+Bgrt1/tPOYvkvGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162947; c=relaxed/simple;
	bh=jCfuPkwpFJl2q7jmzk6VEllmsuHOcm1t3a2xapvV24I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBCw79Qpr44SQxLOtrd0T3UOkev5UnTreirsRlEgCds1Q/1hp1+6mRZ44FdpaZU9gJR5Ff8P0Teyj9qs1EZHut4ZitecYtx9O3jA78qBJJKi1PBlxG8HQex195jD4YWIAxlkdeavf0RZOiNZWnD+AzJ96ICmCm1SOZoNoMbjn68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pBnRgwQm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pBnRgwQm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74019695377so817301b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162945; x=1748767745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=pBnRgwQmsbo2GyRqSCnhr+dz5mLieFeDBLegzz9RdyD6OaSWK0NCKyJXhUywsSlavv
         VqK8XToACDYrGcAugAX9x9ZSiGOtZTpngLUM5cNTzWSPGMVF6/4EKytmnR/YOjKmWR+s
         qlgfMSz0t9ixxRZD67iDVYegDPzQdobwupEq4JJEKG4H/IubX9lLBEzfUO3GX2vrlqzl
         yGn/XOWDIyJwIoe7lWCEqQ6x0eMHdxL72w+FbHrJBf3v/WPe8pYn1XHXlP1lurCnTYRG
         t78q3gPgp0LSE5j7fF5HqtywQXDS/9zvEbSnXyombTmoBw9g1VnYXTfX4ZmaJxIknLD7
         SlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162945; x=1748767745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/DNAxy6LD72V0mVtTg/UEQNRHKlif24WvYR5Aku8k=;
        b=Cm2cZuH4dLJEgRwhXexoy9qpyHgVFC2HXDo+7x9yFqoRV5oxxqvnYogVB14QPqUxaC
         OFdbJ3oEr7Wp6ItDw8gAP09x3sbNUHL07CmXNgH1RhORyR3CzXGCeXQ3rHC4J9SQ3bAG
         VDRJnZ+EbKucaem54eQTBtXMnIdMwjjSweiVCFZ5PDb/Zdfi3rbMtrqaczzct0sFHZz4
         ToVaUqbeaY+jK6nfineBuhBFJ6olgaZ+a82bZ351sh108hmMWvrxQupA1m+Oj47t/FGY
         /v/2vVckUlgTEQF9oK3WU+ZnGlWQqv8LwUYIBxo/fedOswHaahMFNEQ/vZTvFITE7PA5
         LvSw==
X-Forwarded-Encrypted: i=1; AJvYcCUcN6Q4NBzRQkffyvrQwXBuCWCebpv5s3lTgAdx7ghWWFHpj3xaOaisJppZSpTKEZbaT8ec3SUJHrXqicg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlzJ5YWrFXT2sJSO9HhCv8Lcq5wJm0gYmbalUjcmIt/Q3ZLZTo
	9nEy5uCFNUXoU763ZxeE8+wc7GAV48LGzqrWuUO5Fxz1Vv4i35965urZqp9upIRm6e8=
X-Gm-Gg: ASbGncs484gMhPqr9bHJMWg5byfsmzdpLTdQ8ID5ILgBSc0PUqDxfXIgNsJhdcDrWgo
	QQVqO5vevFAEu4aEC8JEVXKZc8GN+tQvjFKECC+sAM4uLmu59AYvxP1kXZXabjyxVxiOl+sn8kR
	Cxo2qqHAwanyTVy/co6TUUOxTMLTZX0enz0iMEU1xWCPQkEs+GErEuP8Y1buktb0sg7atKP5rbM
	L42YDVeVrlSPV1L22jij6odxR+2zmVDGaffubZ92EIKe1pXIJ7q5/650Tde7/WptGqlNwmqMCEY
	/5xXMXlBozXshifKxy2yugH9JRcSXqvemWMDl2YumMroSDIbPXybxtL8fBEbZm9Sa3+murpann+
	UZMPtw9dA
X-Google-Smtp-Source: AGHT+IH/fcI4Z7YkM4eWj7+IfWaRWzXa4Www+cl3fFM30tPCyJdhZKdj4mWnUuJpZel2KT/5AvPyKw==
X-Received: by 2002:a05:6a21:3403:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-2188c299855mr8237866637.23.1748162944740;
        Sun, 25 May 2025 01:49:04 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:04 -0700 (PDT)
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
Subject: [PATCH v4 12/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Sun, 25 May 2025 14:16:59 +0530
Message-ID: <20250525084710.1665648-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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

