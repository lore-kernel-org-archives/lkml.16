Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C7274B49
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612787; cv=none; b=gccbz9XR0QwqXsLpFNtaicYPEQkLCCxUVEBeZrUL7cYYstxPLKpUC0eRe9BnWGvFovcoMj+xL/uGGmsVk0vtb/NJ0rB/S+JZvmEwOMHztHtP8uLG1vp06MF1bup9LeJL+FbEaToMBk89PGH2Xc3xGh0SKmxDuLFwBI+9J4YJjFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612787; c=relaxed/simple;
	bh=sbelvMc++opfxCsxTvRuuhoDW5jErxOHLIiEYhi1zkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVSZePFyelzIIZSQRPnQ76MwgloRyvwVA16vmbm07v9bpl8Uwy91P/RPITfHwK6RQMu57VcE3RX4bG/J1dYYreChPJRPS4Fh/pugqhC06EmNq9T1ncBw2G/8WKZvb99Any6klanJku7CVzcWJUheu9ZUkKhWw5Rsgwt7q5nmvt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gAGd50uE; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gAGd50uE"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so639020a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612784; x=1752217584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=gAGd50uECtTd26+oVC9QOx2AprRxabtvAf1FEXGJlqRCq5eLGY/sz5zgtfMRTVABX/
         ZRF+FSMuYHwTVQ8C8jktlwGB+AVCiIFBcMxulCJJ0JK3XVEG2+chP+vwz6ZwB5zEvFay
         zIVWWPqSya4+P50oFNAkm0/INdUXggtDlpsRtz+0+rrJpfCg26beF4SiFV+0Te1URGTY
         cPYScCp91Ajn3i8xR0IE/1bkCqewL4z5SHtX32lquunBSTvtupgS7QwwcdrGsj/F7I6k
         nPQGRakIsm/IqivWkUDlHLeigq8RKIWFW+1MRxZO0oat1BBsF1ub6duWkMoFVUs5kKVB
         M/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612784; x=1752217584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9cEkN+1nA6DRTpT1SF2rNqhyyXGV6gcs+oqiG40Gi8=;
        b=lj13qCFXmBsgIqbIsCGWUCGWZ50BadCSUIsTHytpV0PVPjnBEf93uaYecy6Dd42ap3
         LUa58V2O8KYt9AkPvogel0i5aoR4m8xwpVoREq9KzXFgy75gHsQs+KUgd/XHB0z4nSKa
         T+vopzKwxFPBfPmtgQmxgwQaRT6EGq/OTyeJuvpKDx2RlENUphDxEJmS+pgDVI6knh4r
         c8cAwCD6RbJhHkWf6zFnSlrFXzXx/qw3j4SaOZMEwoH5JsUse1v6PBLYxfthDCT/TPlO
         3C7cPUYEkYh2PVCMncBhJEAi5ADhRcxf1zmvE0irQIOWMX6XVJBDrx6uCaOK5TyupeuP
         wqwg==
X-Forwarded-Encrypted: i=1; AJvYcCVBmBwCIGCT7Uktp00gUQD+NiN7XhbxiCgt6Sv7Lcf52Idbx+e2iDcYVwF3jqxwxqrEQ9D0PEiu3eIXT48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGLvBdloL41Tz2ftapkvbug2QOfFD4Ervlji3XRRDfjhwbZdQ+
	gwKD6TjJpRadQxkjcUU1Xr0A0MhJDkhGqd/HvUNKHsMNDB5mku5kf6p8dO4DRrtevOE=
X-Gm-Gg: ASbGnctJ2DR75DFOa0lsDimK6dk9+waJupzlpMEfZGZJqEVkQ4yP7Srvaw0n4lpEBZe
	VlwMkzjxUdJ764qk+FHGadB31U1dcRjzOQc6rfpqg7VkSOmQ/kuZwZPnnEntm9VpQ+6capT8g6D
	+D8Y7WWXxVFcUKJGNbJ98ZQcsKADSGuAaE/UKRMYRmLAt+VHCDLXjR7PfpWBlCWmGK049eWdcBo
	EloYdqDAfStQ6/4VnsoM0jXD5QIRF1QBjT//CKF5zlotxWHeGzpndj84jy7GJQHTkbes9JSv2pC
	8UO/9wSdATcFe9A/76gVU8T2lk+6RhC0mmxkZ+zeS6U3XsPSnH/rcf1m1gyTYyxGC5M7U6nyckN
	SuMMypFFtJKo3RNVlvUx54K0HCw==
X-Google-Smtp-Source: AGHT+IF+TdlZoELuuTjQaFBwsOfjj9nVaP6qUAJ2uy4CPsdX0ww7K5CWHbfKzfTy6kNCQU07DyLnCw==
X-Received: by 2002:a17:90b:3fcd:b0:312:1c83:58fb with SMTP id 98e67ed59e1d1-31aadcf8f13mr1549627a91.1.1751612783864;
        Fri, 04 Jul 2025 00:06:23 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:06:23 -0700 (PDT)
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
Subject: [PATCH v8 11/24] dt-bindings: Add RPMI system MSI message proxy bindings
Date: Fri,  4 Jul 2025 12:33:43 +0530
Message-ID: <20250704070356.1683992-12-apatel@ventanamicro.com>
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

