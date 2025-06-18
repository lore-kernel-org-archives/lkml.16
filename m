Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E82E8E15
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248942; cv=none; b=bTKkOvo6MN8yxFHu+HSGdGfo2UHG5CqsTWgTJnnAbIHfMgp81Z5p97bhI7uo7TWBuR24wWvT+VVXOKeZUXKTUSibXrfrjqzthOizatEfZlnj0xUMCO5nM/+xaj4MRdv/LqgttgKyzP40sH25RWQBgXNTW0WYehjVMCRb07AekDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248942; c=relaxed/simple;
	bh=sbelvMc++opfxCsxTvRuuhoDW5jErxOHLIiEYhi1zkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CySwKASJpgMUSHfggk9FhzTkZaKH7l2N3bWRD2V2TUtPeoCiwcHoZYOTcQarmOzDF4UJHoj5WgIc0tuWv9j+jO7DDcXvAxAtNC4XvN7CucmuKgV9jma3cKLEWQMwv3+PO/ywvWxDb3ATTGJkTWtM1Dox5tOCuKTjyfDPRJF3LVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Q6T1e+vE; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Q6T1e+vE"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b31c84b8052so911235a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248940; x=1750853740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=Q6T1e+vERjFeXGD5t2Orf+F65gMPI/NAC2xN228ygIxHrGKchSHtkg+ng96LCbPO42
         YLbhccvtIpFsnF1o+Az0BPWR+RIzueuw26mo9+CNiLnOjyK8IM1Aus+r6kfBBHrEoktp
         2NQefy47hwEP6XffqhK5/ql/rA2ejMuOlfuDcXy+fRx+CXtZB6YJImBgTXu+CLVRk16r
         ejYJfP0eumPBxS7Ih/vd85PAVwVeRPbnOyV7+hogZVaAJ4/ayaPmIx38IfYKHrytgPP/
         DK1h6Q4I/Tt2QH3NsM0dgCz39MQgfNG4lmjWHTrk2LaBj825PBgaWNZjlBEDEWj2Oq1j
         Ojjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248940; x=1750853740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=NQjUDGGcGS5qDmwWIaiERvuunit01aAi0ON2uwoqS3ZnS7mJBoFuV2xgtzDdJUKlpl
         PaKoktH9Sp+z0Yl6xO9Uy/wqY2jmkZKv2MEmU1tviMcX1wipnKu4On7ov61IvkL2FoeX
         JTyBxAfKiZxqtzYGmNPkHgDwXkn5cUFqPOa5QuwwktPGGVBylJi+m8FRKByMNWhVuswo
         KjiDSh9kGmTKGa+lWNhctxDcU73neQ2tNygiCtNLiTTlFdRtO4GbfvkIz7mGnfmip4kP
         p6/8qkFKmyPES0IvWHPN0Wf7Tm21G31cYKuc6wY1JKpHfwHbF0hkr9oIUo6PnBZtV8t5
         Tiww==
X-Forwarded-Encrypted: i=1; AJvYcCVTLKgfLhd0pT5oAdWiLWMIcS671Ygq/aUQWgCG8TwLsjJxpV6rFLmLu48FLz96SQF9E6SP4bEp/CdT6t0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1bgTzp3mIzS/wB0VjP+QhKb7dSsdYf+kb9zGhTTXfGRwIDWSj
	GV7a9nSghAvEyEF3hg5Zsq8dL3cvR1reD3+7Awy7D7p8ExHswNXofeFiWBIBU5GLI74=
X-Gm-Gg: ASbGncvBeaDbSJiwsjWDyNAUDkCoO1T3JHtNb3Fm+AONWJUAZP/7p5yuWhoUESAjSuZ
	v+alaNvl3G1ftSfTDws8ajNJFrhAdHb+C28G/50XWr7rTbULKXWda2atzaPE8p9OLP313WUsTCy
	x/5JFENdgLz8bR42p8LrpcFnuy61rpW7jmcqUB8M+sgKd1WJdfUy1Rh9JXosCasJdRtBFZ47VXR
	XqPL6yHIUdqm8BBIG5xxrf1X/g+E1WJPFKuKkO4dc392D9+FtK3VanBqPGL/IGcUvpQ0VWCms+v
	dl41t3y9JPqBwj91piWb7uGrwoRaCC8qIAzUVT8dbFkxlD/QLd+NfTJcrThvD2Clgo619FQbemL
	IiqSRJee9sn4vvxydzA==
X-Google-Smtp-Source: AGHT+IEK8qZ+gXPmLTnhrSUH6t88V4GWdt5zL017JHCoKp0U8HqJO2SVy0J385g1j8q2Yo2wHBbtdQ==
X-Received: by 2002:a05:6a21:9ccb:b0:215:eafc:abda with SMTP id adf61e73a8af0-21fbd4d48f6mr24066795637.18.1750248939720;
        Wed, 18 Jun 2025 05:15:39 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:39 -0700 (PDT)
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
	Atish Patra <atishp@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 10/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Wed, 18 Jun 2025 17:43:45 +0530
Message-ID: <20250618121358.503781-11-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI system MSI service group
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../riscv,rpmi-mpxy-system-msi.yaml           | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
new file mode 100644
index 000000000000..1991f5c7446a
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI system MSI service group based message proxy
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
+  The SBI implementation (machine mode firmware or hypervisor) can
+  implement an SBI MPXY channel to allow RPMI system MSI service
+  group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-system-msi
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
+    interrupt-controller {
+        compatible = "riscv,rpmi-mpxy-system-msi";
+        mboxes = <&rpmi_shmem_mbox 0x2>;
+        riscv,sbi-mpxy-channel-id = <0x2000>;
+    };
+...
-- 
2.43.0

