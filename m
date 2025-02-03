Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0651FCCFB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572593; cv=none; b=ZunAfCrEDuHL9uA2yILrQ0eDUdmtKsc6qSyEIO15Bu8hijgNTquGQfksCVVuoxne5A0gFUrZsYSbrS7RjVEqBtUyVipv6TgW+zjnOubjvfHrXHaTMuatCOaZV0aFH4DyOoRKGVoyFjw6dtwg7g+wTheyA2YP2KKLrO0Jp4U6Oys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572593; c=relaxed/simple;
	bh=r+JxCWQ+jyLorjrIiBewIuh3h00Bk6D4rc4yzMNvnkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeSUQEMRGiLZchTUiZinFaqG2DBlHdmLRNu/QQjcXtqfLGI94QXA5ehlxNrr0t85Eo3peGIdLjUFdNdYStHK2ursS+Bm2Gkhixyix9+cb+heRBWVu1sTsv3M8qfHHdWiuTJNasPmz+MKSlDULQeWwsBOx6GwgsUnDeZEpxeCDn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=fgW8L/rU; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="fgW8L/rU"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-46fa7678ef3so39862351cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572590; x=1739177390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIptlls0lSoEbPx5zusAvJxAewxDBRI9b9ePSXx/HLg=;
        b=fgW8L/rUPNZjf4RkvujjIbTBFcqb/n08Py7O7Va+lz0ozFRjHU7iiEOwT9BOv79eix
         2Z8N4O4u5odf6LATjerfMP5vxsfFzu+jX46BP+phBtQ01P6rNjZK7QxSgcRcKThvNR9P
         rgtvSYu7DuMCGqSjHNXtQS1yluNhKjUqePYMmV63eD9BuG8IuoAznY7hYwZrKVIHgXGQ
         KBt8f0SWK0VjrpGfXULHQ74a24UGJ3byT/3Y6o+Zt5ny3j9EqAEPs8FvHTN8mv1Rm2s0
         ZvLfIsq969n3IMnEJmwGPuhmlvXUCX95p8/B3cZC9OPxJYk2+o5N5k7DgStyADCP6h6F
         EsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572590; x=1739177390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIptlls0lSoEbPx5zusAvJxAewxDBRI9b9ePSXx/HLg=;
        b=px4DjhgK5cO2QUIK0VGPwbIihNvLW9uL5q9Ng5me9waF6MvvLBTc6ncqMDsZtEyo2i
         kFBciO2O7HcJP0J5w7E0fTbu+AusPRypTcdFX4Z2KaqevQus59z4xVU4Kh1CHTb5lQp2
         BusRhBpOFnnJNTCsSVD0Lj5z5bKbtPZAkYqZpIcerVDrdFVRr1sHS7fYJHsrnMrove1Z
         FoHQ2V4DQ154/aALXW8mwVPA76gXPwY0xoFW1s98TuaeA9wTIxVJsJ6gyimXbpP8krmp
         wxdVQqhjQoCeMs1DZgqNO4ss6gKqx9FVDMPQev45n3pRmZnVtGv9ZoNPdciKOvsbqf1a
         LwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWe2kfybCZ6Ll6wVl7pbLubB+hcXKiL1OqVVSQ61ap8HP1bBptZHDNz5GuT4lhD8aX7+2GsJhoCCfj/Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbOL4/bouAFZ2Re21dgMTsbeTKH5TxVrBT+KzmXEAxax8DiQLO
	FBMwMMqjcB5LMz65wTqx7ZIOTrJTaURnfr4/K4Vk53NimbuYo3eHUosDT9JINAE=
X-Gm-Gg: ASbGncvSADbvnnu/dRxOsGL2TZqQ+i1rraX6ZDaGTscemk/zSdUn7Paah+iei3XSW6s
	/j6SDEXDo/EmxmLMbZnCbsrs2lauW8llzCiMpIRmHjANmN/bfrTu1MTSVLrFHX5aF9CVIqQWNIf
	ilMsCBIIcYRiHBq+7CK+foeYYAg4UejaU1sLzvva2TDOhU14FONJxrOLTy5yp3bpOLO8y8HeR9/
	gpxSbxHsz+eYGWc5GdTi2C5mxhKa0uBPrA/I6gdCXNj1AdaWXQ5BDnlauCQ4vhOoCdbXj8+AwuY
	ITO0IoJvEkc67RM2h1hgQ0pAruk/Z7EIwLydRQKNjBNNTVj93aWvT2g=
X-Google-Smtp-Source: AGHT+IFHHlk6yRWs1ijlylKke56DmU0/tkygTt4Q+373jN4c1Xddg6tNHv+laUzh55eYL8Gx++jhPQ==
X-Received: by 2002:a05:622a:258f:b0:46e:23ad:a120 with SMTP id d75a77b69052e-46fd0b89329mr324786311cf.35.1738572590072;
        Mon, 03 Feb 2025 00:49:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:49:48 -0800 (PST)
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
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [RFC PATCH v2 02/17] dt-bindings: mailbox: Add bindings for RPMI shared memory transport
Date: Mon,  3 Feb 2025 14:18:51 +0530
Message-ID: <20250203084906.681418-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250203084906.681418-1-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
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
 .../mailbox/riscv,rpmi-shmem-mbox.yaml        | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
new file mode 100644
index 000000000000..c339df5d9e24
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
@@ -0,0 +1,150 @@
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
+    oneOf:
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: P2A request queue base address
+          - description: A2P acknowledgment queue base address
+          - description: A2P doorbell address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: P2A request queue base address
+          - description: A2P acknowledgment queue base address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+          - description: A2P doorbell address
+      - items:
+          - description: A2P request queue base address
+          - description: P2A acknowledgment queue base address
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+          - const: doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: p2a-req
+          - const: a2p-ack
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+          - const: doorbell
+      - items:
+          - const: a2p-req
+          - const: p2a-ack
+
+  interrupts:
+    maxItems: 1
+    description:
+      The RPMI shared memory transport supports wired interrupt specified by
+      this property as the P2A doorbell.
+
+  msi-parent:
+    description:
+      The RPMI shared memory transport supports MSI as P2A doorbell and this
+      property specifies the target MSI controller.
+
+  riscv,slot-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 64
+    description:
+      Power-of-2 RPMI slot size of the RPMI shared memory transport.
+
+  riscv,doorbell-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0xffffffff
+    description:
+      Update only the register bits of doorbell defined by the mask (32 bit).
+
+  riscv,doorbell-value:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0x1
+    description:
+      Value written to the doorbell register bits (32-bit access) specified
+      by the riscv,db-mask property.
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
+              <0x10090000 0x10000>,
+              <0x100a0000 0x4>;
+        reg-names = "a2p-req", "p2a-ack", "doorbell";
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
+        reg-names = "a2p-req", "p2a-ack", "p2a-req", "a2p-ack", "doorbell";
+        msi-parent = <&imsic_mlevel>;
+        riscv,slot-size = <64>;
+        riscv,doorbell-mask = <0x00008000>;
+        riscv,doorbell-value = <0x00008000>;
+        #mbox-cells = <1>;
+    };
-- 
2.43.0

