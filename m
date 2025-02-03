Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C0A2045B2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572689; cv=none; b=pWg4A0xJcLOivc4w9dSDo0IJtMPUNSpVPRo6CCcjCjiZ9yRmSLOhlDqFP6Xy6vme667X06ZENCnlf0jQKgSol+AAuW6G47FqlQmRr3siULuwuOx5sWTS4t1+e5yxoFBxkJRI9oNE0Mt2qmbkda4+g00dqtWS5Xz5jaYYeaIcSHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572689; c=relaxed/simple;
	bh=jXo7IkWXMmnQanNQDO6EVHZ2aM7G0ET88p0IIgenlSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uK90M5SsYiYeiQQSOZDyCdhKxgBZ6r8aV8p/7OxkzcHfKfmGQFIG+2zPz0gyRXQ1omupbR0xkcm+Qtw3by1TQ5bHRpZYQxdXssIMKjUlHTpbrb87H1Q/m8xQLdP0dn/5rL3UkDfGEnOl/Kf14PXsMP7o8tu0eil3Rz6MDRXKqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=UePnpHCJ; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="UePnpHCJ"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4679eacf25cso26960821cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572685; x=1739177485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvjolPh9gzwNtAL7PAOP6t0zOgR6ztGKXQcTpBeekWw=;
        b=UePnpHCJpTMtctB4TlIhrd3K6JvkmYBWEE081Lli4mRaZO9oB6inJiND4HsEH78wEW
         itW+Phg7unlOGaMP10zOyWXAF7LGG8rVoGmYLHUO0Ok20bymp/YjWrvdACHOK2cFzCDD
         DnRECR1GHBY5nRkxSRPh9D5aSIMK7Q6xcGjlqGVOrhbZ8ZwKyxNa1S788otNI3QgbLzR
         j3Vs4n59Oz3ztxRSvLMX0KM9ndUWAjZ0/AqhJV7kgXjRruy4g6JaUw2yw3ET87LcQMOL
         +Olt/5kQlStFClO2mMQAcMn5ZXDtdIbVTKcEkjbjA41QHyJ8j4sPIZ7yhGi00wntLk+Q
         93aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572685; x=1739177485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvjolPh9gzwNtAL7PAOP6t0zOgR6ztGKXQcTpBeekWw=;
        b=NSXAMrETvG5NXZyYPPTxgtWT//muikUcoiC0J3rBy9/2p8MGwBvmGwztakCGJCSt5U
         tSJxG3GLKe/O+hGkedJGGMsfGbkNLk5rMmDZjKAKErQNuwMYvoDfSqirZMWKl8oF+ho0
         98kEqcwoM33dk+WD8v1FMZOuO9tKFdMzWdSaJuc4hXIBGbWSJc81PeR2ObzfCcM/Ca7r
         PETAk0zx1T93hs8fxu9sIncW9YcMZjSwDPFXppeDfA6QbMbq8clvdW06sweO2UpVijWs
         entVSheWH/OGz8vfih1P7A6duFbKwkNMqrXL3/La2vq94R2FzLaLpHVypuPZnUxcpiAy
         siog==
X-Forwarded-Encrypted: i=1; AJvYcCXgF4fsgCDHEM8FBEg2m/CDyi8KAAQ2t975DQzBtDKrcrOfD9Q8T2zBe/Le9iFvxfO5ZLdiplC0qw632j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaG3yVEkrUU9fBWWrQXsC8FV4JCu5wzjsWj8GVEEm/CkLQjXR
	ejS9szg401o+BF9MXq/jlJaizoYoMCLaKqle9OU/TWxqm4xCe4Sj8E2iYIr5UJk=
X-Gm-Gg: ASbGncsB06Ig491PxoF9DeJangnk6TqZwhrajYKy2CmR5zCo3LLqQJKtopMpZCTAqAO
	Qg6X5E1nkHX01fI7ZdswinPo/wlWsSTCRZAIikxxSUDunMu/libxl2iyK+/jneDJqIJ+aYk/Qnh
	sK6YXyqg+SDDdY8kInEa5WIe1Ls1GDLCa5ymIc0bTDMGdL5rQNVmHTnvRQdqLvOEA9Y/ViRxf2z
	ztpDowMMQN9asBNYsd3vDv6dbQ3oxviU6tUcbzI+GH/ZHR1cDXSPAdxnYsCbmP4+Jr1U0WNdspj
	0jyZccpCxp94N/o43hnP5lr2akn1ugL4U/vhd/VA/no+8Zl7IAIWh7Y=
X-Google-Smtp-Source: AGHT+IFPm/vGjoafGFVBb0pWO9IDvnrcujPXX6jDysAgsWknrhSPZ6VlgmiZ8V/8drmHUDea6Xx6YA==
X-Received: by 2002:ac8:59d0:0:b0:467:76cc:622d with SMTP id d75a77b69052e-46fd0a13014mr330274181cf.11.1738572685403;
        Mon, 03 Feb 2025 00:51:25 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:24 -0800 (PST)
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
Subject: [RFC PATCH v2 10/17] dt-bindings: interrupt-controller: Add bindings for RISC-V RPMI system MSI
Date: Mon,  3 Feb 2025 14:18:59 +0530
Message-ID: <20250203084906.681418-11-apatel@ventanamicro.com>
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

Add device tree bindings for the system MSI service group based interrupt
controller defined by the RISC-V platform management interface (RPMI)
specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-system-msi.yaml                | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
new file mode 100644
index 000000000000..e6c297e66c99
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
@@ -0,0 +1,89 @@
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
+    oneOf:
+      - description:
+          Intended for use by the SBI implementation in machine mode or
+          software in supervisor mode.
+        const: riscv,rpmi-system-msi
+
+      - description:
+          Intended for use by the SBI implementation in machine mode.
+        const: riscv,rpmi-mpxy-system-msi
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software. This property is mandatory when using
+      riscv,rpmi-mpxy-system-msi compatible string.
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
+    mpxy_mbox: sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
+    rpmi_sysmsi_intc: interrupt-controller {
+        compatible = "riscv,rpmi-system-msi";
+        mboxes = <&mpxy_mbox 0x2000 0x0>;
+        msi-parent = <&imsic_slevel>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+    };
+...
-- 
2.43.0

