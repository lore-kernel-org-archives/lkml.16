Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAAA22A7EA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623036; cv=none; b=DPftHp6rgVgusXQXX2CyGd7zm8ty1mFADmqkm4lR4EEPd1n/M71yQiCpT7ygc49lmV+mTYZvMmlRS3hhZbY0ULYxbuaBF+Dkt0LhtSNvQxHjk+NbKWqHu2LecbGibqY3jNdkTpo+WkAEK+nEMJDpGBnj6+aacZ3sFooGH+cp+Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623036; c=relaxed/simple;
	bh=ixtMiU2D4CI1HtrYrYpElhcrFaz7rwFs2Q8kTElmxqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q8TOMxfwRyyk5BcE+VojIv2RxJnGLKoqzimt8eVtR7sSjhsECj8WbEm4zxEFR4cgGiHvvElo4oxidETF4/ZZxxQOD1tV+cpBhS5O1vafpCLcLjKCve0OtHBN3kxK7h9f/lDRWttf9HhQeg8uZHGyHN5tHcJqQr62xBbb3YkbRhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=kwD1nFQl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="kwD1nFQl"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2360ff7ac1bso29899975ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623035; x=1750227835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=;
        b=kwD1nFQlke8qAryYMGsggQ3VsGwfpOZ0QD1iUSx+cs5djaanqnCpWtVdnlMhgGQgDE
         K4qcaEE20UiAAs641m/KDHhPDIZeOsoRGTcUNNey5kyYAniFjn/n6vqiri+w2wXYcqiY
         LtuBQ/rftbuG+r9r7qQpEKvORj4nTJcxUI+F7bsxEI/BQXaUehqZa7FP+NcZHL4Og5jg
         Jl2BO6aaglx0hROdfb6qeZKZpy3OKf6ijz3k6P3rexeb6YOHpfFsPu4vk8l9k5I+zCc6
         4XCoufjMVEiB2eVk+I2udVeqnMdfPfNUbWMmUxiEpZW1XjDvUM3RplJ0ljgFuzv1aAXV
         LfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623035; x=1750227835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwcoSzaHJb2ZCurp/5PmtA9kG6Ysfjka/p/8DDzX1ZM=;
        b=VEEPLm1l/5HIyz60PKNdMLbny4SM3g0tRQibUg8iBD6u9cL7TlhUTo2PfSpxP8ojy8
         HFubD0QC/Neef/lNVtjxMtejUs4DUAdoqi4L8lMP+vZShkzCBlvtzJ8crQwfNVrRPU3q
         PnvOqxggacHtLDQWLE1Qq9sG6ECc+yRwly7UGW0Yazuz9Ac5TzECEx11bDS3DAPejsEf
         nOA0vtrKF/BVwGb2rsd8SULYCxcGbzBlUK2hG86XxWcr99AZaQwkL5AXZ3bNe6Wgv0tX
         D+axxeE5/3bFVEE80cTRa4aw/qT0Ubf71pV5Z+fLCsNKHwPQBjPfCzCMXFw+O4D/Kh28
         XP1A==
X-Forwarded-Encrypted: i=1; AJvYcCWvSjJniGPqsPi6AIUe1yzOkTFrZAwxCsgrzbpy9v/YFqpniZsswYZOa3YiZubz873IG67Vf6AVvBh5Iwc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ZUswuUAtCh0yokW+dm80i+c1Afky5R6Zb8DeNXd+1cJiICAX
	ZCgKeEnJDdbwfaHJpV5bjJwlEM5nhxcwAJLobI9VtAwhfPfb0/dD8bnhCnJKzosLn1w=
X-Gm-Gg: ASbGncsk2JkQFSeIe4/i2ATkribPh4hUNpIhUPNe7aACQgaNzpSnuiiEclsjTSTFOu4
	3w6dDDh7cCl24bMF/bLnOBzswSmL/oNu3s0q90rETJ1O+vzlqowSwfqkVTeZOwwYdjFpv5H2tz7
	z46dDeIDdWUQPkwk3SRS01p52XiUsEyMyXnataO3KL0aJlbBvx0Dur2YnrWHO0OUgSjhuaj70lN
	3IdxKjiLxcWO35B2LINMhXQ8dTi6Iep7L/5tyerzf8y/rpryrtVoyDJAQC3YLwnllgZbkQDw05a
	W0mXcPpo7z0dhisKIQWNSGQWsPHhUiUZIkYLZrsV+g0iTmoKQ+e3+oHXHWRWpOeDy5zbjfZeBet
	xYXdrcEBosTzg4LINRl8XUvhcAvBlApLW4pmP
X-Google-Smtp-Source: AGHT+IG9id6m8Zy9UeNhLHSX7++7xXKKHDlsuc22eIa03d0VgxiugN4v4fTC06zY+RU03tXIbah2jg==
X-Received: by 2002:a17:902:d552:b0:224:1af1:87f4 with SMTP id d9443c01a7336-23641abe7c2mr35316405ad.22.1749623034551;
        Tue, 10 Jun 2025 23:23:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:23:54 -0700 (PDT)
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
Subject: [PATCH v5 07/23] dt-bindings: clock: Add RPMI clock service message proxy bindings
Date: Wed, 11 Jun 2025 11:52:22 +0530
Message-ID: <20250611062238.636753-8-apatel@ventanamicro.com>
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

