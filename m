Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665DE228CB2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623064; cv=none; b=LVXtYZQmiP4dzoMqKCJnnenkj/OYT2qtQukkxWO1p0Pav2dTugimzVAPFQo4Qo+fO3JpX3Bt9Y2vhmX0PgH0MQJnc6H5PQkj1nx6hqDk2RqGX9AUpPnbv97eiVtgWSHrAr9LJwVNAq/mn0LZ5t2MXJi401PcHuR5Y1RKyB3m/SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623064; c=relaxed/simple;
	bh=mi0izh3V1w9zIu9t+K/AZ06nOfi2ewD/Fyi9Z/NlWW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVSyLWKwaAsH43+6JTFW77+f+YM0iBcb90YNBaAvPdnL7fETYrLD0thdMQJkDdm0LxsfnsoNCoQSRsgHQ2ZqkAuhVccKWJZFOjyCEIzxeLlWAvV+tYoK60PKBJcdGWEWlKLOnc8HSL2VyTutfk38RUfVDABaNeq/J1+QuVToR6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=BQURl9rx; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BQURl9rx"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so5830263a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623061; x=1750227861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=;
        b=BQURl9rxH41i8jWffVV62xJwi0LH0e93chV92Nwbv8C6uKn5BGyPPqW9GveJAFfVh4
         1uzcI0mAEecmCtkFbLMTAam3tWip1swqn4kl45h+d2aEFvcyMm1c6WqeJKTiYFxwIxME
         Lq+yotyqOzsH3ntxdemRijB866dWHv3Jmvjul/xKQ7RZg1KyJ5AC6p1RYqFIZVngGc1a
         XwXWkM3pqZSE0z1zRgJlTSm4YzYKQjXfg9EJgNaCfJ5VWdi4GquZYmyC1eT9GKWnIQIB
         PraHXFXgfV4ihkDQIrZjh6W/TWQ2oHsyk5tOQ5XrI5ne/ypRX9luz4RmGiehvBZ3LHvU
         7BmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623061; x=1750227861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouV1lfFQuaSRkTiMApd+jhohkzp55I7SRD5LPqlFAqQ=;
        b=i/NAUuR9HKghgDZhYm8oqx2BoESKsX6DvAx9kPpeRPX7J3Xtv12XertYnWhV3Y9sGk
         4UtBW2jZOdMVfrc7kIHmotcmOdevdCQZ6q+mBAMJEogp4OsCDfPfDbci7LsTaMFRbPfX
         x1v9jsbtJtvYBIIwl4K/x4IwETX8syDfTnBa5vfp2TQcKz33bO1NHU9pGBS4e+p7uVJg
         G1WMHCY2tERZXvgnawU3spKOn5xmjhkMHmeRJrD8pvPuv9jTFvSAAEfqfHhdaeO6Pl+L
         1PiWYXaYz4v4E4ITJ+QeAGaqgcg3muuveUKDcYDJa1u569ap9C8cwO6X4zMvlHZcfQCL
         t32Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvDkVH2Wq/oArCvcZOG74P/IRoz4MRVTvRpeVvhQjgrHNPqJO70mF/K5abvIHQQSRFzJ1S4dAgaW+aGJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywziu4xsar7YEmCg0FUgum8SwGFRTIfb0eH+jx9ofuaGae6zisA
	QnwP69Y2a1wfatoBaPWAHmWUpCHREsZ+poCiR+GWDWCSs5ScePTYk6HpiIkJcUnL1+4=
X-Gm-Gg: ASbGncvwvBDzfpjVA7cWr1oodcWicTDKhuuOC008zE2py1Uxt0wzxF6QVbGyxvqmhaa
	5wFUReA8ZVz0p8ZvbqDC+dHl1x2o6vmcvVB3385hAzbs0qFdKSPCFahuHjme+hLZ1hDx+0+gisH
	LCx51kMysxAbR1MxxWSIVpX41e8tqbwt+C9a+hS/5iMEJEIGtAp1bDX4o023gQS8hcVx2VyyRgH
	G1spNNoZRzgFA/sM7kl8E2OEXHCYl9mYw0SrQkXtho8YpIhdFIimUX34dZAo3V1wg/Lc3MkYgML
	OMUvrBCNxClNEEoFuDfMUfwddp8c+1hw0Z56iu64NDt2Uu+dfMjE2HFmr3wUOvEMPfiWAALVbL0
	+uqbmfsQNfkcoJTuPeQT8Iu3vyA==
X-Google-Smtp-Source: AGHT+IF5xkQyWQjwsl09XW4wn7LAnApaVtCZljCguqKxttJEhx2sYRFEJxu4xU+pC+wX1ttAHSWSbA==
X-Received: by 2002:a17:90b:1dcf:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-313b1ef5898mr2232034a91.10.1749623061442;
        Tue, 10 Jun 2025 23:24:21 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:20 -0700 (PDT)
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
Subject: [PATCH v5 10/23] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Wed, 11 Jun 2025 11:52:25 +0530
Message-ID: <20250611062238.636753-11-apatel@ventanamicro.com>
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
based message proxy implemented by the SBI implementation (machine
mode firmware or hypervisor).

The RPMI system MSI service group is defined by the RISC-V
platform management interface (RPMI) specification.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

