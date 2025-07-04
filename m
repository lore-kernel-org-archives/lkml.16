Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D62749EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612750; cv=none; b=Y0PhQdrMSHErqTmxkzjz5t5vR4Q+0DH/KFawrylnWjhF3NouSj3F0WuAHsEW2cS9aT5U3ragixMgZU4Si2Qan8ZGa3Lu7bzJnxq5jT9WoRmrevfJ+hHsjITNfyXbOR4RzoWansz1DTr8BtKUM7M8a8EKsvHU9du99afArsEVgY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612750; c=relaxed/simple;
	bh=psnTedHrRclNzYfKOxzNdzEC/lgie9/9OjOQXPUJ9ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3K+PnS8uY6dCts/f4up9IWCIwn26AtwEy1fwKM1loGWL3iYZPlxEVEUtJR9tRTZXoxqg7OCkRs58O1qg7UwSkA/3UijjGpX3DjqrMSr2ZB5IZmXTFBfwLbNYU2oAh+M+HkQ0LWiMqLMbZai4MHIWttx94EGofzDdisPfoI9uhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=mEENh5AU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="mEENh5AU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31a93a4b399so571768a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612747; x=1752217547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=mEENh5AU/6DrOVelUFhjxKgJLY0Xnf83sNPuu4aUEB9ePkYmX68dcjdc2rL/v4/k/L
         GkiItF+tcvx4X2IeiIKTwTbTvqw0tlKd+6tsOQRTjV6GuoLsyvm5uPcttENLy+tAlHp5
         1EN0V1EcMH0/nHAEws+7djM4R0AMRipQi4G6g2DIMIHW/huE32eui2PlJ1/7oPKeUeta
         516nai761esP8gsq1okr9RPPNqryQlNm3ed6HmGAdnZDQDZWhRAMaSrjjmyBmIct+kWF
         IOZ81BJ+uunhGUD4Tc2qgkE3iJGr8HzQb5c52cHf72vXkeUQzByjDuUbbWG+Yu3PLEzF
         7kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612747; x=1752217547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM/HZQdb2lcK8V7OkC2GVlA2nnGt1f60vmRpDyo8E4k=;
        b=ELXaFI/2Erzdhe4eKMSRREPiqxrZTKkdylY2tJlkVPSJEjlnlCgz7SjL36PpOf4nWj
         FPbP0Q3V5qGCJ4vSlkFInubWicADW8eOV3j6xkb5ESJq+rH0/HB7CcHRjys/vHdQauJ5
         zhj3m3r4vnB7pB7L/uICsrbomtPDuuoKpMrJw0V5m36wVQUiWzyYmzScYIaFzGFiWrfq
         yZAb7jxzeWAiWKJxtUKSTK3V7pGfK1PmZYA9K91ktZg/YhjWcLF3HLieczntWicFyf1j
         w6Lx2H4cw9b6xKI1CclTBwRvUf20pkPrqd70W8mtXMcBGz9HVOF87v1omonulIWjI8iM
         fS5w==
X-Forwarded-Encrypted: i=1; AJvYcCXMVNHNbfJgaDYhdgXAasQVKRL4z/L/0fvftNma9lsKQXned56PVhhgg3xMNfM5MrTKR45SyHzFrBWTa1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBY2HSWCooP8U/vTJlT9lCSyjFwVkGe82qK9WIjRYalr8WOKiB
	nqSTdeqLnJPLsCTMF0//WdMXDnE1CHtleZMLB1mVI1mB6oJ2T4/pGUwmPKLbYMEqk0Y=
X-Gm-Gg: ASbGncuxlaCSQchXHz+blzpeCJMITb6vO2Vn3N+Ukx8Lru8Z6Z43knIMF11XGHpr0lG
	zE3cbyFa5XEEtNZE9/PX64YJ8gVYpRc+92miffioXK1YUkGtMPlIuJ7l/5F+RvV+MDFTJHjR5lA
	qp1yvXDl6DBO6kPz8Y0Mnv24NRzyvmG+ImpONgK5037g6itlss8trM/KZtIG089jVCFl7B0t8i8
	bXG1EnwEmOky8IAbcKj4QcuiLHTo+Ty8zwEIdm2vicBFO8X1CYmp8q8DHEdelyTLJLTaAbvKR08
	uaJoPRAjSuNEIDtNPHITVSZJfy17oOs5YgqJ1setURkkfJnQgQJlLOOwfnAIj2Dcj9uupNz+OhK
	AQ0PSeWeMqvdy0T/JpnULRWCCXQ==
X-Google-Smtp-Source: AGHT+IHtmFW2/QY9JlxyY/sNpsmHaQgh9pPlylF9L8hp3qD/XtkbiHA4dJh1wnEy5Pds8AHMwLTi9A==
X-Received: by 2002:a17:90b:582d:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-31aaae6d975mr3196784a91.0.1751612747456;
        Fri, 04 Jul 2025 00:05:47 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:46 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Fri,  4 Jul 2025 12:33:40 +0530
Message-ID: <20250704070356.1683992-9-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI clock service group based
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..70ffc88d0110
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-mpxy-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based message proxy
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
+  The RPMI specification [1] defines clock service group for accessing
+  system clocks managed by a platform microcontroller. The SBI implementation
+  (machine mode firmware or hypervisor) can implement an SBI MPXY channel
+  to allow RPMI clock service group access to the supervisor software.
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
+    const: riscv,rpmi-mpxy-clock
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
+    clock-controller {
+        compatible = "riscv,rpmi-mpxy-clock";
+        mboxes = <&rpmi_shmem_mbox 0x8>;
+        riscv,sbi-mpxy-channel-id = <0x1000>;
+    };
+...
-- 
2.43.0

