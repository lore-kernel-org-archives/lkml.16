Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294C2E4241
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248925; cv=none; b=YuHYUKAEwTUUWoAT7URrAyTUO0P+8zdVIPo4+9t+YxqvyBP4m/R/qFJ5y5tbmF2W9kYig1686pxrzXoGtpsvcYLkrz+2BmfcgQn/NzqQvp4u1oJ4IzAgBfmOvrSBcJSxF0y3yltGu+6U8rmvUTSu1hICsjUXNR20xgKDAVdz9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248925; c=relaxed/simple;
	bh=g/mEKxnduPVnA4j2RQ4xuGgcCbhqHJCjD2NPYnMDHj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dj28sse9r4f3p1WwxnH9rQQGyMjfqd8HWh+RMB6SNWoGd8RtP7swM0KoodfaPyFedBdcKomD9RwIXKez46EHakjdsLMKGW4w5d1PsIlaPPlB+PURojZk7exvyjATWWRNKGhjV0l/TMlus2FBz7UnU33FQ5yJvgleWQlc1eczeys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TAgH1ZP3; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TAgH1ZP3"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748e378ba4fso1083757b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248923; x=1750853723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBBfxF5Fj3S5/9YMcAuYqu1Hni5U+f+rs2XZF3KHDuE=;
        b=TAgH1ZP3kKhsNGODsyXeNli9EXQ7PGogpHnoXEhZzA/8fl2ylqm5bvWwUI8NXeE4Mj
         +IAq6jWCh3PI9egHf+u1I6try050Czonj/apiB8KgZbzA1tX+3EjnUMDuIy9LYXWJadK
         mW6FMuHExilfKdzTqDpHlEFCpl0owJzZXuz7LBxyf68yQlls+dKJWeJZ0wjRufE4U0Ol
         p2cTgP20pk6jpcNM0n9p3b9Am9pnYyJRx8Nk0sXadqhambZDHVD7JVcMVSkuhRCZpaNE
         9le297HeZji7cfXrdTJNSf/0YD0KXv2LbVWXmo/5QMcE8F7M6mEEM/QgFpO4iSo5tjlM
         BB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248923; x=1750853723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBBfxF5Fj3S5/9YMcAuYqu1Hni5U+f+rs2XZF3KHDuE=;
        b=wJW3kyBSNFVFRyYmOJIjV+hG3SigiXivUcKrWER/MNDrEvIMs0glp0tvgzMZzyiFNx
         YD85qz8xQUBIHQXZLT65xEZ7d8xHum0gPCCI7NoFcotusrL4nBgv99L0J7wZIgSXEG5D
         cBlrlf3Th0UYSB/KcBjoUy7FXmxBxQuf2EfsyaIilR0K/WoTBO66WqNYTvGH7CT014Gv
         LjwMHKLFnEptMfpVI7yes5lRJ+Nc/XGw+FPX/O7/iOzT/fuT/NwlwzS2SJsNDEXJSXM7
         l7JxaqzW11biKfGclB3uvGRfY4XvKlwq13848kqLX29CYe60icqQ9LolFb0TgGJNXQLy
         ZGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4+ga/C2KYSQp2jad2zt78g9V/aVhXo3QhND0EIdo30BEcMEumNXOXFH9h/1roiAp48lkdYBlH3UWIPYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbK35quVzhRVuYc7LLbzMSYyMH8ddqcfcFWFcPvhFBhfF44TK
	T5DNv7lpNTHFVGWL6w02ldGOD6Vj0GoAWVfQlJkhIWbOlg9TKuiNWhG3/F2h+BV9L3M=
X-Gm-Gg: ASbGncssUGzEkcv/dX1H5aecAQ2FUm+Xue9yPYZgg10bwBKQ5/4DUB+EZlkcbI6ZFCn
	SFwdgs4NIFD9oVFNL0Gx1G+KuKoXEweX1r2biyTRZMaZRKLnOOu/FQ9C2IujdtEcr8W7hqfRmaY
	aN3IzV4QBr0ypB45c3BSD6iyfDzKSBZcNG2q7qocHjiRRdFYltpDEeyPbIv3PERF1sO0Tdmn5Us
	wCJWd1dQ0UbHkgn377xbFoHOB9ao5YNAExsxzWDJZi/iYsiK3pEgqUWd8RtSsPQ8PrYDNoioo6p
	J0eKxicqd5xeZ1Am++xmdQqg2YAJVbFRnjqqz5zTVauVnZzJjyv9SWaI6MG1vaQnosMKuDJCwKC
	irjOAA6GJricw0DHUr/O71/VuJM8r
X-Google-Smtp-Source: AGHT+IFMKwBOWWxohctdj1ZfYXunjODSapma1HKAoKx1zL6qjMZuHVAg90lx4/8R5CLCW9migGeDbg==
X-Received: by 2002:a05:6a00:b4b:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7489cffc1d9mr21468139b3a.13.1750248922660;
        Wed, 18 Jun 2025 05:15:22 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:15:22 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed, 18 Jun 2025 17:43:43 +0530
Message-ID: <20250618121358.503781-9-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..5d62bf8215c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI clock service group based clock controller
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
+  system clocks managed by a platform microcontroller. The supervisor
+  software can access RPMI clock service group via SBI MPXY channel or
+  some dedicated supervisor-mode RPMI transport.
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
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-clock
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#clock-cells":
+    const: 1
+    description:
+      Platform specific CLOCK_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0

