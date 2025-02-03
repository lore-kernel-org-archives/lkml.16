Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DCE1FECC0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572663; cv=none; b=AWbe0uNMR8AY2Ox2KkIunb3qviiEsF3T178sS3M/DSYs3FWzoMlDuuY3hQmusTO/UXTofldOyuU1S0xYIXLdbs4vQiVFPzVVtVXsUZgMQoSRfT3yHkWbJh/1Tnr8mQrsHU6Tmw7kWGxnkHsuz8mf77SI3OholPhdAOSUoGgUdg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572663; c=relaxed/simple;
	bh=PKCozwgCuABhJm3FGiso9S7XEa6OmbDF8ANr4JIaqWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqUEInwwvYXmycZYoJBxhEFDXiWq794JcxzYpJ08rFZxeVXJ5WOkGOcn44PlfgMxN0i3m+F33YA7RVY6/rjeFt7CtKDQ6Wzewx+alz2t0FchailKBEx4Qw/mRu4cB65TTOw88gCW0QFNCrVjKbpxp5hHcr+GueuCk2+yO9gXhrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=XkLbecf4; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="XkLbecf4"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4678cce3d60so42833481cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738572661; x=1739177461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq5bgx7F73e7S2pMGqlkagc7SWpAwEk+Db7gTuqwgBU=;
        b=XkLbecf4xRPUphzZm9AErUDJM1oxk9IVUbqliV5/il4hwLs5PvcnduTGUlBsCR38a/
         BcHWG7XX6QE75WgCOYlJ1UmgFU9RGapQQHneIEltqp1RkIfGEtAL8MalPnEGUqJbab9l
         poN91SzCSiW7Z5LCBrNgfBNsXKqdd9mFGlDNkXUMoJVrH9KNoHZc68OkLXpC98H7EO/9
         VvWesxl45ve2eVWeEMjqWv3Zypi9ipcq6Pd2k/pIlRtsiJHx1PMlJevTnccBxoC2OmSS
         Cwq/PZqZ+In66K5OM+r2AI3h/wJNB4nlKA/4Kj1ANDJMoSx6HfBk264+BMgejAvxcRK8
         s6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572661; x=1739177461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq5bgx7F73e7S2pMGqlkagc7SWpAwEk+Db7gTuqwgBU=;
        b=hb1WI97cScAco9I63h8fT0LwromaSGWEmPKDuED7gd+FzJUmcvU2cbi6eJoTI7uF/x
         gNsIILTOW1Hyu6wdrg9yDciG1BORgqsjV9eaIXI8/esiD+GnzxHJYU/y5PKqK6bBS/QK
         XVyDE2Rz9XCTOheT9eWBOxGumXhlj3RiurbdTQ6tbjm6wfR/sa3nN5hWlHk6xKxRrIZ4
         4GRic0//MmkZwReI3ALge3yKK6GByEqBc1Jy14oaE33YAAe6uzFC0AZLt+YNsZpZRqbq
         tzQ97hbIsRuAUnpgA9h3eHyyveJyRkoftflGzxGr3meJYNZ9nD6GKy348i6VKrRzJR4o
         9+og==
X-Forwarded-Encrypted: i=1; AJvYcCUg5HusPVRi63FisgORgI+OLt09rb+tekP/CbRlHjul8mR4z+tbqB7WsMaHrKB7CKu4ik/NGm6DaaRbhFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYFMlcyOXYf9lId8HqnTTjFWBe2w2aEoLjzYaMk/zPOaI+d8Sc
	ipM2YJZ4GAiuUAeh1Crrp+wjl1x4059T9taTFv3EKN46bKRPgkjQEW7767xw8TM=
X-Gm-Gg: ASbGncuhtbdHgcjWL/T7AkapkzfKfW/JbydIv0dRG9DVr/TDKEJ29O+3esHzgr4K+i0
	14ceOBVc1AtvOLfakQO580uF2UqhXZcUpeMjX9tmCjHg53Ir/UEIPTO4Ptc7khcRe9G/Y3wEKLs
	vz+xjD9RdYii6xEELUZmQ5nb94a9zMKVrletbgsGk/XkWiOemYzpr6N5MFV4CChv+MOWhNsUpNd
	+4HsyfETa5rSIgqmfdXzgsWuqSnwZUEABW8tbgKTHRsN+Ue+3flw7VIiOlb9HcyuL3B/vXaQbL5
	8lk9iyprP1nNdIud1LIFMJwfkaVxDISjxHSMBdeAsfJxk3dkRmyjwV8=
X-Google-Smtp-Source: AGHT+IHKSWjJnml9P2k8xe3WTZy7gZVOr3y2y3l5W1mAhUBR6IAIbnAkFVzcudNqB834buJx1oU/1w==
X-Received: by 2002:ac8:7d92:0:b0:45d:8513:f29a with SMTP id d75a77b69052e-46fd09e25c1mr202526631cf.9.1738572660838;
        Mon, 03 Feb 2025 00:51:00 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0e3089sm47657911cf.46.2025.02.03.00.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 00:51:00 -0800 (PST)
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
Subject: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V RPMI clock service group
Date: Mon,  3 Feb 2025 14:18:57 +0530
Message-ID: <20250203084906.681418-9-apatel@ventanamicro.com>
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

Add device tree bindings for the clock service group defined by the
RISC-V platform management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-clock.yaml      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
new file mode 100644
index 000000000000..c08491c04926
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
@@ -0,0 +1,77 @@
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
+  system clocks managed by a platform microcontroller.
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
+    oneOf:
+      - description:
+          Intended for use by the SBI implementation in machine mode or
+          software in supervisor mode.
+        const: riscv,rpmi-clock
+
+      - description:
+          Intended for use by the SBI implementation in machine mode.
+        const: riscv,rpmi-mpxy-clock
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
+      riscv,rpmi-mpxy-clock compatible string.
+
+  "#clock-cells":
+    const: 1
+    description:
+      This property is mandatory when using riscv,rpmi-clock compatible string.
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    mpxy_mbox: sbi-mpxy-mbox {
+          compatible = "riscv,sbi-mpxy-mbox";
+          #mbox-cells = <2>;
+    };
+    rpmi-clk {
+        compatible = "riscv,rpmi-clock";
+        mboxes = <&mpxy_mbox 0x1000 0x0>;
+        #clock-cells = <1>;
+    };
+...
-- 
2.43.0

