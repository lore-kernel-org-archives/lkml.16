Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B169B2EAB7B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248951; cv=none; b=OI+10hR3Zy6NNMz0w73L1tCe1/LFwRR3mCj5Ggdz33Pv25W03F/DJVPZUsVXQRYzVyailZwxZgg3WL2rR40Bh/0aQCFmYVSEHElV1R3N8QD45TPV3QmiIP8POTuCrhYH+6ziKIAw6CjXzGuyIHmY63Heg/+fCeGyZD7L63XpJL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248951; c=relaxed/simple;
	bh=vvd5aEr1EHa2kYCEzZk7/ahZeLh22JQayJGJfQ0Amwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kfOs+E0PWMMoxml7+pRK0h3a+CLFBllVa5bRGeW5Dqa4alrzSzlNocoHTeqWFI4KPctEbrvEXEfTXoBVbUcRLhTMn9Xf+FGMX7CL/9P5wIykh4mgRSUKqWGTbV2Gg6nUzxxMc1+CvMXbIPmo0PuxvA8IMnylV13UUyc4e33bvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=jj1XWjsO; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="jj1XWjsO"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748435ce7cdso5750340b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248949; x=1750853749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=jj1XWjsObftt8ntveRiOwVOvqBJNSoS3uzmLTGuBks0NxgcuZy/FhSkLdrKVeQn7kE
         XcA9mK9cvHF2kgze5TC64In0EToqQbmLlw0i0Fdol0RA9GFe7ud45C2ZjG4oZoofXJIT
         XSriXI/SJMOzT0LK2VKx4ykl7/Rl4qRbf4C8eQb1VnP1qRVgpLgS5KYeyjD5vQkvxmxp
         BbcttEKV8UFe/8ep8lBJyqlE5xsoR7qe2rN0gfuwEKzxDaRJwHI/K4dbfL+DQSxUyGsx
         6bKb5VPsuwYiniq1ByaKCEi8vqtMHNiqH+aYWKAVsgFFYEBlv1aZwDYY4HPEhknHMvAP
         GGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248949; x=1750853749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIoG0/2CSPJ7QI1BAwRn3+gvtI7NC6tH67IoLVRWsu8=;
        b=eelC3Om7/8lfp9iOtGBAGHr+OwxhKzkE9wMFdw6wtt6WG71Uc0x5afXUy4JKXZmoTU
         6KkRed29kKKgy0bG15HdXN/h8k43qXc/yb15/KzRfLtHRlJysE/H1st1AT56C7Hfp8dS
         l8LHILNUJo2xzFtvK2cvpl9fpCwlW+mV1shhlcxbxMWXk3inIB8GnfTu1XZKjxGGcrg9
         SDj3s2Jux2+Z6Uvi4rSc5vG+jVldTTkX0l6Q+KAmZZhgKZ8rAjeVOpncL5inMX+EwbZa
         BzcrAmGwPMeAdJJYMOYoywxSjo8nWwuBtlxS0qMno7aBLqRrllQVfHFRq95dATvv1nLY
         4TsA==
X-Forwarded-Encrypted: i=1; AJvYcCUu+dNG2QsMNeATbW/Nmt7mJyblSkqu/Nk89ftxSNuvy6S8QkM9facXmjf6BvfiAAY4de0vlsaJ46xSGVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyy07m49UFpHTD1YixlYCI3W7f3MrBAX0q9igRmYzlkto4GqP1
	cHzmzzItBZ8E2msyCBOObEDHcfGUZVKhe5l6TQN/J5OQdDZs9R7wGGEQCd0Yvnpa/ik=
X-Gm-Gg: ASbGncsUE7xDOHyBTL02ugIcwnw+ZCeOXBg6ESLfFeZtK1Ej0M414NkfsKiAqqobTOO
	vCNkASPCyqGbIYHnrA6SHYMpMh4bqWPSzd2Y8BGWgGSbhMr1A6Q6a4cs0SK88aztnsEdgpVADOA
	/kIMbqxYQbTHuBLU16hTXUX/6/0i5ffsDnzoEq3SYBjxNXZvdNSKaogH0dMilCgrSqmLPLWMyHk
	8IFblyoCwKf/27ovs1es6tEy4xNU9wyypfwcr/pEJ10TSZadrRP2qkDHOa2bsnqYSKhtCBrPbEV
	yGdr4il0oGkmqMv0bWaHfBaGYMUK4OJA9CxSAmyTlYPZIoiJg6dIPtZ81qwezk4B5LSyCKk131t
	ILC2jOOiw1yr90c9bRA==
X-Google-Smtp-Source: AGHT+IHxs4vjlsnXTSH4C1JU0OK5uY0YpaUonPTvMCQRhAQ03vPs2MAjvWgsEbCbaT+xabScrZbGxQ==
X-Received: by 2002:a05:6a00:9093:b0:748:de24:1ad5 with SMTP id d2e1a72fcca58-748de241b48mr6070569b3a.11.1750248948709;
        Wed, 18 Jun 2025 05:15:48 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:48 -0700 (PDT)
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
Subject: [PATCH v6 11/23] dt-bindings: Add RPMI system MSI interrupt controller bindings
Date: Wed, 18 Jun 2025 17:43:46 +0530
Message-ID: <20250618121358.503781-12-apatel@ventanamicro.com>
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

