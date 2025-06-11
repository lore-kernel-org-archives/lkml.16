Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2B622CBF9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623060; cv=none; b=hVIWIK2W7USZ+7eXbFChqgX3MR2baDWKKVL6bWLxJC9/zwkM5VZ4wPBU3eFis9hwhjfvvjcGW8Yf5oARD4KpEazEWHOrrp9UFTcUErM2tlp4UqNF38BJw7hI3jxMRI2XRSElWxcc25AN0LgY3vjzdxShKcgfafcvR2LtpWRrmz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623060; c=relaxed/simple;
	bh=kiEk/ZTgWEHqlvZDH0biu08pH7LpqLelaz9eTEzcvxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=paHFsv+w5FU8kQWf19t5Ia0VQdXP4q1yRncC3E3NyLBqEFmMbg9wu+8uiSQQlmWM2Th14KZpv3p9Csh9lqc39CiuJpM0irrMjPOceuhg4/JUJK5oR0Z1vpM+E9BQF3b2PgTapCRvGnOcL0ruHbbWu7lQ2Eite01MptnL95bzDQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gRh0O3AQ; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gRh0O3AQ"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86a07a1acffso517340539f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623055; x=1750227855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qbog2jwuTz9DCLB0jUubllQdhYVAN+AQfO1Y2vWOezM=;
        b=gRh0O3AQ+vatfZUdj9xuxO6Ws9Y1f2PxpeP0a1yDJc0bzJOaom2EvItJ6X/2XEYYJY
         ylKnBjOeNxAKli1OuQTC1PMKlOhSEYyIEp5s5BET4uoVNqB5fMvOoNzmgaSLNmfekWeU
         cfv9Y40prMHc3fzm/pxyHxP8l/G6NNPtpUexa5O/eaEEZUg9qmF8troHNICBK0GpWmbM
         E4HisxRWWA+I+TqJJnZA5GT/J0kKY+5Gzm0Ef5c26J/HUqu+4ueZyrTKKXkklmoink/R
         iS38ol7RRybrrAxb1upnhkhMFjjiaHZU+F+hvHSAznz6d9PQrdEGeI5J0hef80Nea0K+
         q0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623055; x=1750227855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qbog2jwuTz9DCLB0jUubllQdhYVAN+AQfO1Y2vWOezM=;
        b=SbZGkvWGlnG67Y5LqB9N5hkofemnhVl+dleegN5Zpktc1mVNT1/1G08B9WX/jGyWdQ
         0ZlAm6ipXNojAuHu28NvrGRNDx9UXLq6uS1wn2AxNuNIuRQ3d9SP1OdTeGe1bbz1BzZF
         P9Is1AF13lXTloZZgyeEFjZH/MYOfQ/MvcaTp6xg5mU5MguCVADdNVNpeodZii5xEoHb
         Uj6kpuA+9YF2ps0xncRUVTK1FVCEoeNcltQg2INw4RgmgchobrZwk7363g3d5XIm7br7
         VyKC2diWjXHR1Wr5DaUaduvxMAbc+wVqrSVgImtBbAoQzhMxd/ogrqNGvaQqZmIeHMnF
         WAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWLT6h4qdiDsKc7jHchlZfQODjOFWL8yI07RK8+TzsRMQ6EZLrZ+tmHwl95y0Rn5BSBgykZNmeK7gCI+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZCtF77FrJp6RgByqx9fFLJNF/SBtys9yrSy9Ei0SJC4ZUiJ3f
	gU3PD/6rEyD4JMwhUlv5Nh8YW4lpTZSYYJZULyHVvmCAdfj8jOqKm6wtlHOgxlQwve70FO08HtR
	pqt+HSSg=
X-Gm-Gg: ASbGncsERUDMPk4JOGXuNbkELVvVxV9QToe4sKj2SRHxgviIsX7BUH3EDU2+RFJ8sat
	8yq+I6NN5/EWIFym5BbPxpa9KyS8Tr2712W0sybrzoMYDUYcuKLtdKXAixLeqADLCigp3gHYWhw
	/kyBUD2C8tEJ0yisfTy4oxfWx5e5WsxHzExlEAgkP6HfNxtv6OvoVF5xSCmWO0b0ynIiFK+zXlt
	O2/LTv6i7gDRw9ArqixLF3wn801dAWy4Ue4kf3QDQvSRCrROMB19YCcRwBuFixtsce1wCFUiJzL
	9s5N2ONkv+Xb4NIkH6kPZ38fT8/VjuGmpifk28e7ZmU8KbFvTtGfRyY9CAhpXzkMP1JmMWQ8Iho
	5z8e4F+mecLkS6SaRUc5HlHKAgg==
X-Google-Smtp-Source: AGHT+IGE45Nw6cMjQHpSv5lLGxPQof36xcySb3y/f0xaMoClmIInPuw4tRKfvCta688qmeWHkxBrmg==
X-Received: by 2002:a17:902:d2c6:b0:234:db06:ac0 with SMTP id d9443c01a7336-23641b16ccbmr26600515ad.45.1749623043547;
        Tue, 10 Jun 2025 23:24:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:03 -0700 (PDT)
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
Subject: [PATCH v5 08/23] dt-bindings: clock: Add RPMI clock service controller bindings
Date: Wed, 11 Jun 2025 11:52:23 +0530
Message-ID: <20250611062238.636753-9-apatel@ventanamicro.com>
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
controller for the supervisor software.

The RPMI clock service group is defined by the RISC-V platform
management interface (RPMI) specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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

