Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA651F4C8A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433264; cv=none; b=tHn30fMHa/tL6BdBffnMJbgfezmdsy6X0XzyIUP3H5rR7UGrcST696+Jc7S3iOeXo4iI6FPlOoN0wRCEUqNHC33q2Km/suW8K6ZbZdOoTJMphUfkk2Pzcirq79gmzWij711Vo7LiwG7/yv03gyOUCdccDkGseP1SmeO9cOPhd5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433264; c=relaxed/simple;
	bh=wpGteD02sLvwEnKA7TBa2+SX4iYwOSU082ERtl6/Vjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TK0jDssltPFtXX3C7s0J75QDSeTWC/FxEZqjlX60E58JLStAZMJZSS7XxQyLft5yDaRimEVeUYfe4GoNXOV8Lu2ifRLYtzy3GB5q7E+kOeegxiF7XoDW4sZsgCmd8xlAF4j19gtSVlrgsA3cmeU61ye3EFALdBo3/MwUJtwYIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dHQZ3EnM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dHQZ3EnM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235d6de331fso51539785ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433262; x=1752038062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=dHQZ3EnMGfJHsTfcH8UnP1mMvdJmezlR7gQfYTJShx9qFPtZKDvUy/sxQPNyTWDkhp
         xpAKFbrgESKJ/Z6YtnlvKIrWLVn5Aw8hXX58mszoyIhmad1tpJAVPuiKL5vlgIMTbEMR
         4FmxbXLmRRSDGHktMF7GT16OltAbyxdiOSJq9zVpRIn8Eo3iaTj9oF5K2wlcVfT2kQF3
         yApim1ixps4ywvuMqpOp6Cz+xW1RxeAFAtdXc+B3we7kWxCv2DcT0Sx0XxFlr3xoYv+h
         zofLffD+SLP86Plj1zTWwnMxKa2OPRteXWtVXQpYSVlYBusJG+A76MaOT6WsFDvUbRuL
         lWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433262; x=1752038062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFMyHcY75Un2ey32rj/OGQJrYLrfBUEB3tHZxTx41w=;
        b=X6MIxcMcpaGY+99CIETHjNPkYdhojdWUXxRauFj19azGUhiDgYAiWMRC3rLWlXJTN6
         bDVk2SEXonT4gqhKPm7VKyEbXMSYENnB29mMkjcD03mp8+JDiP0DfMLGW7xEhrdRuSy5
         +5uC3HYPgQQqba4opsiEPYTS/kXm5v4Ff7LqRS03zJ25BzFtkNoedvvYEUyISzzC7+MK
         1e3RlqbaEEmWgn0DMP5CYDCs3/m795/CyvXTVyhsoXdVHYMY03pVzqEYbh4BzAEAkuUG
         NhDtSl5Bs1z9SUUkzi2mqlNeNtKkBMp/tdMtVAqyJuC1naeUxhs8B1Jh0aM3VfX2R25I
         iVyw==
X-Forwarded-Encrypted: i=1; AJvYcCU352MgJu4fnMQ1j3tsBwaSfNcdUj9V1cWYLrosduNWacdiEugD08E59M9OZVfNKctU2yXMVoJ60Fs8DNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLiAv/i2CeGZxbrq+tq30btv+0HD6sVvENgrbHyx/b9woFY+U8
	MAPtGD30DpjPrk7y36MDEY4kXDVhmLihso460XVPkpGMMQ0uqP4dq9PJ3XeQkSJBDO4=
X-Gm-Gg: ASbGncs5+LLXffIEErrPWLHi/mTCih8bTjSP2ulK6CEkKWsaKRC57pcoXuH4gYNVGNZ
	E/8197iDDKFIu8h5xZLpSLS2qqpX5ny+A2J6SSXccqEjOJnU0WjhvKbNFCDFvbp9aapvhmvSaxI
	uvqyhiSQ4Rozl4yLk52yAdAjPakdF/KfKCYJkvaUTIx2m+4s5/ElurIb74P0uU4dcTB5g4uehiP
	ExG8+et/TlU0B0lubWGeMrV/O2ozTvhkskwUCoWVeL13a58KWBFSUofc1CNYWToRapy5rDHob/8
	Okmp86eslqXs7mtbjXTqlBmLgtKWm23uyaBBbZwTGCtA1vDEvKRJOOyKQ0ZkgSBBgdgGgeh0ePB
	etgJvXVL52dO/ezEf
X-Google-Smtp-Source: AGHT+IFyaNYbGu3J51YigXq7SSnInqGclIg3bY+r/3Kl6d4xMMAbKmX0D6qCx0IXUy6MpajxqM48mw==
X-Received: by 2002:a17:902:e852:b0:234:df51:d16c with SMTP id d9443c01a7336-23c6e5826camr22426015ad.45.1751433261848;
        Tue, 01 Jul 2025 22:14:21 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:21 -0700 (PDT)
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
Subject: [PATCH v7 02/24] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Wed,  2 Jul 2025 10:43:23 +0530
Message-ID: <20250702051345.1460497-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..061437a0b45a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/riscv,sbi-mpxy-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V SBI Message Proxy (MPXY) extension based mailbox
+
+maintainers:
+  - Anup Patel <anup@brainfault.org>
+
+description: |
+  The RISC-V SBI Message Proxy (MPXY) extension [1] allows supervisor
+  software to send messages through the SBI implementation (M-mode
+  firmware or HS-mode hypervisor). The underlying message protocol
+  and message format used by the supervisor software could be some
+  other standard protocol compatible with the SBI MPXY extension
+  (such as RISC-V Platform Management Interface (RPMI) [2]).
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+properties:
+  compatible:
+    const: riscv,sbi-mpxy-mbox
+
+  "#mbox-cells":
+    const: 2
+    description:
+      The first cell specifies channel_id of the SBI MPXY channel,
+      the second cell specifies MSG_PROT_ID of the SBI MPXY channel
+
+required:
+  - compatible
+  - "#mbox-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mailbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
-- 
2.43.0

