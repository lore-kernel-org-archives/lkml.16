Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D662571B5
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970832; cv=none; b=q0P+EXRttCrnR0no99oVfCaxp1vx7tCSHO4Sk2GYojMk5QuvqlmSsNNmVh1xsG+O7eWl5QmdIYiPeipAAgmWziXDpwteWONe6fR4W0vq7KHuGfGI06MVgpx7d73gC11HZfIuCeUb7QnDjEWz7s0Nlvu41AvrfZTxbx1BCgXqVDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970832; c=relaxed/simple;
	bh=AfloaQsqNQYLyX5RmcBGspt+Vq12jXRiVwlGREexJFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwQC8XSakvxH2vKRVQ3lcjBBMW8HrqK/QsDlxzXtTvD03hcboXpT6z/3cCrVWDADnWydyJmk8RQ4fjMl5Bw/uuwzK4CAZ0j9as027q2WcnQywSJWfrOQ//a/HP3/DQ6GA1X7hfa+Sd7Xbm17RxB/yp0coaiph715FPer1XXA7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=issi9yTx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="issi9yTx"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e661313a3so31938175ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970830; x=1747575630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=issi9yTxe3UmCossJpTiSSbzReOr7kwCunoiCrHUnW0DiCpnm6k6sJm/w4ut6cPOiD
         qUkhlrOmCOieflSQj056JL+eORcyJ6rCK6V0AAUn+hYLerb92k9pabGdAVXcU0plqcWM
         Os5/A9MpwCv8w3yOODDkv+ZyidGwJ/aNVF6ewvghQpdac4lPMoCFrZhSHwlWzQBE6J+1
         4P8eqLq9crU9qZsyyMwxk04jjM+wEsgC8LyG3Qu2sc8DbsczzXn1h6bbvgaC02+Xbh9W
         jyarobnAfW5pKA/HSTEu67n/wCIL3M2Ou3ji+fh2lYerYP2l8eQ/CvI4KptELEJU08l1
         7l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970830; x=1747575630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrq/ed0KxjpyuTfPVgQBHoRGk1JS2/KTrIUQ+VEc4ns=;
        b=NU8s1tUCB7Vj7TohlA6iuh+DpmUWgbzDBtkIEsEXikCeLNu+pBITxm/Z9HlrVdPBY2
         VJzwWTvAHnQeI6pRrgFEaskUOWMKzTnskHIx9NemrJt0+LC7zsIaVrm0WM/2EgvNsvWg
         As44SZtAJp74jH2M2q+q3C3AT+ckrkQcrCZwS3ITbLZWeSyq3CW7ecKFlOuJUBS+GwVu
         yVyynPoLK/3Dvk3QdnU6CPTVAfbXppYe+NYb47c66AjPCKlvIfgSYaU/v+QP3gzOovJ1
         /qd8Dk1K9Mud3dGUIQQKul8s+5IhkSLb0DVbOgKyPH8GSgKG2R952xyFn7jlJrBo3YO8
         wQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFlj3XBSg9qGLsmN9jqfmGooCnQLJxPwI03kzUD+vy2mSKs+JmRe2ndZ6HlpnDq68ShFwucMdUUCWhaf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFAc6UecG8dpbEPwNCX8wET/QRNdaQlcQgwdu4u9IOJn//WCOh
	sMCxXIjutfvcgFZQc4imRpul44TClFXLgbVKYScJ9QB4j9AqZqbX3SXK55UUCUE=
X-Gm-Gg: ASbGnct5KlJ4liZOpUKiWSyMj/XDyZ4g60uVr4y4yIC+Yf6JGTeH7t1uUp1wKGR3r6y
	q4NkJoHCnWiPkyM+AEudLounDfuLqSo4Gp2q31v7fsOBTSNZNTPhr13ZhCjOMDwsuQizqY1jvT/
	8Zu5fv0+6kalsc/bnReaVBYysZJoIJFcEU/5D9zar/lCf/l8COwwzq9BmWktzMaX8nIrPgZRHRm
	oXr6GzKkrnGG9X8b/a3qYi2tAxqPGBmsHLq6Y6pOuGeP5NrXS4tkDg0P9pkdDnu2cqMe8NVrU84
	fFc1P90seo4V+TiJ7QKkWCt7J0CpuLzrDBwCmasTZXMYBkmavz8nF9kt3CfFZonJVD34dO57qZz
	HTYTl1rRmpdrjt3uOScm4wDmk
X-Google-Smtp-Source: AGHT+IGPaG5lK9RQjMv7rrdrCjCY/xtoEPE2JRgHnbSEInfBFbrmMEp72jKw6YqleNzDHesrXYvq0A==
X-Received: by 2002:a17:902:e94d:b0:224:1074:6393 with SMTP id d9443c01a7336-22fc918c44amr161896895ad.43.1746970829854;
        Sun, 11 May 2025 06:40:29 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:40:29 -0700 (PDT)
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
Subject: [PATCH v3 03/23] dt-bindings: mailbox: Add bindings for RISC-V SBI MPXY extension
Date: Sun, 11 May 2025 19:09:19 +0530
Message-ID: <20250511133939.801777-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the RISC-V SBI Message Proxy (MPXY)
extension as a mailbox controller.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../bindings/mailbox/riscv,sbi-mpxy-mbox.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml b/Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
new file mode 100644
index 000000000000..ad4c135e0510
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
+  [1] RISC-V Supervisor Binary Interface (SBI)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+  [2] RISC-V Platform Management Interface (RPMI)
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

