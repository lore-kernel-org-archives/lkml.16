Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26AC18D656
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162867; cv=none; b=Rbk2yaSTUM28zQezvPQVQgK8BM37gIPCHynz4TFSdvO8tbgjUqXOFbOxT3ZOJc3Rvy4yspN8ij5ia8dvqss7v0Hvg9DsNUhZPYEi9wRstaqrGYt/lcerJNMAO+IlOLRTeY7OEQajqcZN9jTiDrSTb2fZhtlQuJgmXrCFQZCg/kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162867; c=relaxed/simple;
	bh=Vk4vYgKC5UFZzVHVPeRhKrljiDA9A3EVKLFUDWesyoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e36whJjUsvjvTOAw1McNLYlZKaLfYzztNVK9lPEdJuRM4xQTqHMi09Mgt+f+Jmgyc3lixYHTQ9b8UiVPGfl+atiYXKlDgpFhzsJolIx7KTdplZ4Y01dMnpeF9Z8YBX8wV5v5SJNtfr366jkuNj3Mcwe3t8V6Pqe3rVzIafScUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MTxMBeho; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MTxMBeho"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso966276b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162864; x=1748767664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8RJcqna2SB66zfJXJjyhYjfpxv8SHn2Fs8Xdiu0F08=;
        b=MTxMBehoSxaw7jHN2PO2T5etLyG1LLVLtsbN2cgxuM0EBMu/RkaXrM352e3NhAHtg3
         p+Sx0z/KugOvUfdG2vDP1MshBlKtaMTHxHKCDYC2C5PZ0CNZ+DlvXR8bsTuIGfbj+yg6
         MithaL5FSHTvXrHQZZ9kSJ1ckt6xQ7zZfPiU8cyvcCJOD8gso1rp1PNvI+wxQOXJmRaw
         eAna7Kcg48J3PlswrLBzLUISsTIWNXxUCrNO/myLx/xhSLAasVPGLacxKhv0oAK9QFBj
         Cj2UgNNZhB8f504lgeAwUC8+yGKABePAy481tCKWwwRNWzlh0rqMj8F6n1GQuuGiyevG
         MVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162864; x=1748767664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8RJcqna2SB66zfJXJjyhYjfpxv8SHn2Fs8Xdiu0F08=;
        b=Cs/Dbx2ALAd9sFPwdW87VoHVClWpESRt2Lq1e4s8mIqfWfQTet7JUdmHb4xUzBHkH3
         0A0dWxymU0yUX0Z3cNETSncBOSkLPiSHNjB8+T42jwyvdjgC2QBbbywJ2C/c/XkovRhV
         dlO9E9IjuLpPdYnQSEaQ/urvsxqAYb0V4uQKtHQJWoarZvlNXHgble9bc2F1OTgYS4kO
         1wm6uMuXhMyvHjd+F39tZEY7PVRd3w3a4Jqnc1yTD/qwbCimnjUTCf2EPjwznD2TqhqG
         lbubKKqfYQ7GQWc10nF/qmSisipUIGMS872W149gBCzmPOMfb1Sj/IH9kKzGO0xtMd9n
         TxZg==
X-Forwarded-Encrypted: i=1; AJvYcCX8GX+35FCCl+EUtKSEwlqd8Ex85dbCGBzJH2KHkH/wkYsM7vQxKVDxEuq2Dy+Z82na9qe1GnEXdO2nXSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhe7uuYYxOl0iasK46h2gh0j/4s9vWMpYyGqaUai94fHewMfMI
	3vS069DLBK1wWmZjVW6zyRDRWBuAmrCw+0jykF+m4iJKCjP9ESnVbEvuHHRvqCLEPnA=
X-Gm-Gg: ASbGncvU+KChmv91sfAB5FRAmxwUIcuEJbjleoZkTV0ELtlFR2i+0yQXq9zd0lAq7Sw
	V1z0UV2YSMwE2AvnPpJffhBaA/0pjvKw0RMB9r6p4cSIz7BbHpeq1egEo7GiX4P1tr93CwX+Bxs
	leP10Bo30cijGNXmhSrte5x9wm/7layAySSe22GvF+LXhMf88ryqkbMwaa60grWLOicwd7BTwzH
	FxtAQdPwWOuc8IRVDE/I8dRC84QrZOkmhePzOdLFcClMX9VKuhNLF44BS8UOwcQAVyDCJD4gy1+
	x6xpfAIb8x1Z6FiJG66xLnv1cXiJn+vvncULg+G9gJXoOevFLzd71xqEWEOB7N2ie3vLh4nJz8k
	2p613NTv5y4itrbt4xvc=
X-Google-Smtp-Source: AGHT+IGzswv3vPxMMfMhf/OOZ/Sg39JmvamXC6rvZqSPObCuik53tfcCX/+jQGjFhFxWYHNRrFfFgQ==
X-Received: by 2002:a05:6a21:a4c1:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-2188c3b499dmr9016832637.40.1748162864132;
        Sun, 25 May 2025 01:47:44 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:47:43 -0700 (PDT)
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
Subject: [PATCH v4 02/23] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Sun, 25 May 2025 14:16:49 +0530
Message-ID: <20250525084710.1665648-3-apatel@ventanamicro.com>
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

Add device tree bindings for the common RISC-V Platform Management
Interface (RPMI) shared memory transport as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..a5bcf1fba464
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,rpmi-shmem-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V Platform Management Interface (RPMI) shared memory mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a common shared
+  memory based RPMI transport. This RPMI shared memory transport integrates as
+  mailbox controller in the SBI implementation or supervisor software whereas
+  each RPMI service group is mailbox client in the SBI implementation and
+  supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,rpmi-shmem-mbox
+
+  reg:
+    minItems: 2
+    items:
+      - description: A2P request queue base address
+      - description: P2A acknowledgment queue base address
+      - description: P2A request queue base address
+      - description: A2P acknowledgment queue base address
+      - description: A2P doorbell address
+
+  reg-names:
+    minItems: 2
+    items:
+      - const: a2p-req
+      - const: p2a-ack
+      - enum: [ p2a-req, a2p-doorbell ]
+      - const: a2p-ack
+      - const: a2p-doorbell
+
+  interrupts:
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a wired
+      interrupt and this property specifies the interrupt source.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,a2p-doorbell-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1
+    description:
+      Value written to the 32-bit A2P doorbell register.
+
+  riscv,p2a-doorbell-sysmsi-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The RPMI shared memory transport supports P2A doorbell as a system MSI
+      and this property specifies system MSI index to be used for configuring
+      the P2A doorbell MSI.
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The first cell specifies RPMI service group ID.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - riscv,slot-size
+  - "#mbox-cells"
+
+anyOf:
+  - required:
+      - interrupts
+  - required:
+      - msi-parent
+
+additionalProperties: false
+
+examples:
+  - |
+    // Example 1 (RPMI shared memory with only 2 queues):
+    mailbox@10080000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10080000 0x10000>,
+              <0x10090000 0x10000>;
+        reg-names = "a2p-req", "p2a-ack";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        #mbox-cells = <1>;
+    };
+  - |
+    // Example 2 (RPMI shared memory with only 4 queues):
+    mailbox@10001000 {
+        compatible = "riscv,rpmi-shmem-mbox";
+        reg = <0x10001000 0x800>,
+              <0x10001800 0x800>,
+              <0x10002000 0x800>,
+              <0x10002800 0x800>,
+              <0x10003000 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "a2p-doorbell";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,a2p-doorbell-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0

