Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39D19FA93
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162922; cv=none; b=i13UsY/ybvZwqkl7Gbh06rQOS05VPa+/3dTNgx7aKcXBpO9DEZiUygikiHdCHAsZPtbHwHeqNI6Q8BW2ZgJl/pp7Z0UgRxm6YwPcgAlpTFTewKnrzvTeJn52lx0HUIltop0TRLorxMTiBUbwmTyvektU/QfFoYAcM58RYTTNupg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162922; c=relaxed/simple;
	bh=Q274OnfG3podIQmVKmeGWN09V8KF3qj8jlwfrCOnBJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmdpnRY21rSuenD5eSmaJPkTG+pkXp4rgiNxtqW9B5gR1Ht0RxU9Nr+MuDCZC/tHghaovrrke2uuCFChXuKPmOo5zZPomLmjg7iGCyMjuht41FU76WcgdS1TkIZc0dj+kQHj5NWrbDsmWPMawAHwCTYKZM/lz0xYAYiR5a/zNNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=HxCuwtn0; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="HxCuwtn0"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7426c44e014so1023036b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162920; x=1748767720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=HxCuwtn0gy8YQpVaZ/DqyOYs+FDe88YLvUYkbeOgNQazfou4atN6bfO9ujK4v3uyow
         0NMfEBBT25gFjMoSN0QCcBQz7RA2sOZVCug6pVcJcX7iAUO0cQVA5C0jys7oUehBBHOs
         a9qrlztxJPoey3HuuRtlMzF4sCuU70OrT28yVzEKPWsyo6+jAhUq5Ipm742w1JEMp5ST
         El83n3S7IPfUZPi4MJJKtYIJOeMvFvJuKkmE6lCH7JI+XkcyF33F00nrvnVaohJeTybz
         BKYp47WnVt1/aEQog2huNBY2FuHGtplLIu5AxV8xT81cRq0jU9H51Z2LAp2x2Zue9QjP
         jC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162920; x=1748767720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYmzV5+laFQZlY1OUMxuPLa7G32W7v4o4U3ZvBmHKpM=;
        b=cPN8Rx0axstzsEs5F8NycBM/Ceqncx8ft7dqhCQp/NIeuumXqbaWx6xaQHzr8kuab/
         K3I63D0OYVu7sBiXm+hWvBIBOhif89DK5DJb2WWJEElOuTmU42DDLp22pUBGbJeCeTFd
         B480EkH+hcKbxSG+22i2yxVc4XTF+klnm8vhxsfF0++jcK9U6/rI+O2V6cX5dGoiHCsi
         tUlOiyK3pJvKrIMrebSXMNfE+eDjEGQCLw1tAEw7OMWIyWviQWTBShNsXnxKZwi424DM
         OMolDXLkzT8wdJNvI46y808Y3UkKVaBZ9OO9qpAKdHwmzJJYZH8pH5Vn9C4Pf8dcJT3z
         q40w==
X-Forwarded-Encrypted: i=1; AJvYcCWpCAPAwgZemlirubzJ+HFzuF5w+t+R8eaTngeSJFLsxfnJaol5mKc7VGRT+JsOsGxLB4RzvHbLXosAKSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhx15kvqRNvXymriFohsB9jUSxkokZUK8vORyJBAKbMCTReJAc
	c1qN3rYZDrrKo8YImfNnUCVFHEN2RPTdJKR/sJF4YxoxBmp7wrM1OWUmsXLHIiPSvvQ=
X-Gm-Gg: ASbGncvb3xRcrzsfixA2K8ncQYSxryd7CHyfiVXCLNZNum2iIxnfMejvLYyZd7HC/V9
	TujfTPjORKFyD0BKf+xfRteptmJhLMIW2F1KBbXyJAB0jwmZyqC3nKKH1z70oJjxTiv+oz+1tzr
	bPfrf3JUtL0vNKQmHgeisNkjGnW4JgbSyv8GgRUBH34kisx7e9+uDcNoy532+O92+edsUH7LXql
	nUbr/zSEj0b42TWCo6kHiitQ2BHq2Lb7ORvKnzQGhBxZGoStPTt3V+t177g13JCzUkUz2ZfqQan
	WpzJ+UjHKoRyXg26hlM+oM3+nPkyxazD9sGAcV62+Mgnz+PtH9hJwb6NqI5nTJ+beEsJ+UxA45A
	6sqg9sq8gOSYlqMfIwg8=
X-Google-Smtp-Source: AGHT+IHUnb/u4n1K3qHty9R2e5pY494m3bRF78DjZ/CBOUPR5X0ZgCZesJiwyw+6JH9lhPQ/s8o6iw==
X-Received: by 2002:a05:6a21:8ccb:b0:215:d38f:11d1 with SMTP id adf61e73a8af0-2188c37f541mr9574210637.29.1748162919824;
        Sun, 25 May 2025 01:48:39 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:39 -0700 (PDT)
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
Subject: [PATCH v4 09/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Sun, 25 May 2025 14:16:56 +0530
Message-ID: <20250525084710.1665648-10-apatel@ventanamicro.com>
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

Add device tree bindings for the RPMI clock service group based
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..9c672a38595a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,61 @@
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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

