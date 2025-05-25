Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FD1E990E
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162913; cv=none; b=VRuQJAlkqqZUNsmhoN2v1F86IqDVOvvDVNxrwwq9GhwhbxCN4pSINBFdkdWsnHk94w8Lg4kf7OKyK4qV3hHriQSUHK4cZQRczseiD/IeRBH7n2eExCtBFJ+ZqVJCSOvXJvDDdQyEUM8CxEjvp+b2vvZ18uNXE1hUF0ikGbKGvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162913; c=relaxed/simple;
	bh=Ex+H6kUov6djH3C9rKVRJ9dQnhJuv3Xa/XrHZBJXO04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ur6/v7U0OMqJ+cW/C2bFE8D47vDHvw8gXKM2cU26AkoQsbfIW25r2RQkhhXCmy9WwADgKS/jEBgRGtOWkW+SUZbLYul8JoS8p1I5DX6dy380IcXi5UZwZEdUHk+fDMiIpbnWsS/khytdxZ73nqaG67NeEQJFrFhKgGLVrZ5jj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QB9IJFR8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QB9IJFR8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3108d54332eso950210a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162911; x=1748767711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoI4ZQkvSe+gzPq+S2m1Njfoq5y1QbcsqoJbpZojWCQ=;
        b=QB9IJFR8OI//PJkQ8l1yoFNbzr/qzjO/dSYDT1xC9Qw/KT1SJx542Hjfc45x9dB84c
         UXimOk4NK0yiX7le+4luGZpDgcr4Xt2A5lTuttSVv0vf1HSVUXsBGxHxGWkeAT3ZJYlX
         FReBQBcYAVE304mCBOzRS9stsj+2xBUTgB4GgMwmeBXWykU1Is3QgLa2pOP+JGd6UuRV
         Ef1g7NlHnMoL638MX/mK3kou70QoFox/orafzYf6q23nS54sGx+se4qiFSE2KTlCx2UQ
         lxxc5VLxvO0ks25nkwZACzpC+IgzarBZytWwHrm30lazWWr04cFOavBt7DlO5bO5csL0
         d+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162911; x=1748767711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoI4ZQkvSe+gzPq+S2m1Njfoq5y1QbcsqoJbpZojWCQ=;
        b=CWT+w1w3sUXypC4BzWn57UcP+XIww3XPWKmTEaurmf4sIYGnZTijplFQixqxjX5qSY
         u1nF5g7Tsozmb4ajfs1JCBTJCEjjS9tp6hZgrGdpj9c5GyE/L7tQ0hxARS+ZDK37Q+xZ
         ubyR/syeNfMjbMnVkoVjrkwXPX+iIRvLdmfIr9vEIaFFP1UfUeaZ6vTE/JVzhEeVLlCJ
         v4YctQ8RHymqKPL4BmHNjUbeAPSlHjc3BJWK2ta9QWuD8Se4OR6Ql9uGr59E3gg23hvE
         PndVr5MSQ4TaciXk0E9oLx9xx2crPNSEU0SarwmzFU22e0+8cSVerBx3khVOG2GQYVhS
         8/dg==
X-Forwarded-Encrypted: i=1; AJvYcCWOHTKX985KfppJOmV9TvyUkx+Ly4/AmapDWt83Lb+fiabV3sEKd7oO0bmGMYydXLmFliQieFCc2hiUhzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhAA2Lm4JkfVIABf2vhNnQGpXW5rgkoGAP6IQqjO5WnAlaUCYt
	DyRYHA5v8Pk0FbNfS4xgtjwBXyrlU1ryCwgcmvizV37GWNY8iNZzQ7AWqDaV7JNTfNY=
X-Gm-Gg: ASbGnctx5EcEhW4IFZD6YKj8arcC+0uEfJ5z+1aNl5EHrge1FMSj6yjSKZV357h0P8/
	TeZ0AehTx7kTfQHvkgTNkRULvEw0AGoQa/q589tNnjrYbdJNK0C4BDIoKg0W+jxlczx+v/v6vT8
	ISC5Z8GbiaLQUq0l8wgLGENY+hpmTp44r6f0q5YJDTAgAbdIYZSzls33sD8Y4Kfz2yAWgVtoQLo
	pZl1MkEIwDMkQ3EiiuYe0jUF9LTouYHb5UVh60kvoFLh22cw1pNxJoqRWouq3l6S+X/Z7NvK/zh
	SyhuvoZ/YvN6wVrWij+hSqqI9e7YJ4+feiRZiECZMQoPti9lUT5gSRYqqr8n0YYzfGsjl2TEufP
	MH/Lmw5g1
X-Google-Smtp-Source: AGHT+IHaa3RGGjUnyc43UOzEBszIqbCoOn4M6INNt/0M6sjpGVykwIm/Pjl2lpAJ2/MaUcFj4kgv9Q==
X-Received: by 2002:a17:90b:1fc8:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-3111089df54mr6591838a91.23.1748162911379;
        Sun, 25 May 2025 01:48:31 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:30 -0700 (PDT)
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
Subject: [PATCH v4 08/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Sun, 25 May 2025 14:16:55 +0530
Message-ID: <20250525084710.1665648-9-apatel@ventanamicro.com>
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
message proxy implemented by the SBI implementation (machine mode
firmware or hypervisor).

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/clock/riscv,rpmi-mpxy-clock.yaml | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml b/Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
new file mode 100644
index 000000000000..39db52de86b3
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
+  [1] RISC-V Platform Management Interface (RPMI)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI)
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

