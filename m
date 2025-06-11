Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1BF22E01E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623183; cv=none; b=OoshkVxZgdVyz8Q3TG0gAEIQFSoJOUHLo7JNpIQlDp2Qxr1CKZ5ol8MYBVmMY67YAlqie6+IQitaryMV796WHLUZDbACMglMXI5h+txEuCPyj4VUXEoAPJBGOyd9dB+O4vjlqIEz69LXd8gmrwpX/fBufbxjo+m3bE4PiwDRqjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623183; c=relaxed/simple;
	bh=hR1n8x0Puv7CTZWZxD0bA8wGkXIKo6DifapRtybNFHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pO6TH+KNm4xkGwe8A3/y0HKfzjrKptlF0wYAG0qPNqPLmu61KGfFX40boYqTGNSZcUHKo+j6zaYfe2Eug7Bh+MZAiPs+A8Si0CNSmFtbEodZM9F/2auBkFl3rSBJ1DGNa6fe/pgRp0iFfByoEho23VSiYjB08C12EkUiIncoPj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Uu+uBohp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Uu+uBohp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235d6de331fso73702335ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623178; x=1750227978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2ugGpXC4o/CNHHmtI6Ytb/JDD4uHU55rBbbL+FpeXA=;
        b=Uu+uBohpwjzphPE9rzlGsE8JsFoFTE4976zPzsLwAi8Goknqv0ZijLTY4lAveaov4N
         PGaSLm/r01w56mLagiXxSufJCsGcjO8Vidg6WbqmoBK+JjGD3JZWtG75E0erWEWYoSqd
         p66hoznAJCWBoNKmwn4bz03X8uNjrGxte6Z4/RpqaQANVRLXZl4tNh4WVKnDI+5IsO+W
         UrF5+bMXzhLqO8V54rSsJK2iSEddGC9Qub5i+Es+wVN98B8fw2onubNbqAWVVFWaBtzN
         84MSqrRbqoGfRWTRZI75btmnhWJmQqXw7TEJHF6s+pdyqbi+2Sqoda2hLe6xeQ6AUIbq
         1nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623178; x=1750227978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2ugGpXC4o/CNHHmtI6Ytb/JDD4uHU55rBbbL+FpeXA=;
        b=TMi2+vfmGLna0w+3kV3t52kZ5pDUNKZQuJe2jnFn72vZ3RaVh9JQEULkRzwc/gONqZ
         iFDLHWAdda7w/91ocDaSEcpDkyR3/EO67WutctMktZ1pOqVzTmlweIRSjwOMc9sK2SQj
         LxLpL7Yo2mIc0+s91jIVyxa3tyAoAf7oLR0eGNvAEO6CvyCU1OtXbxS8fWRhUCk/qAS/
         ekGVhheP54T3I9v0VzBbMsCpkxEFUgmNypb8lCB3N50wU03Sz2NiMLGEQRxvpczQg2er
         BF1w4SqNHCsj3N7SE/2tBjKLojuOVqyjDDHMGaQOUt7ER+JNM2F9L9w1SJQbyR7YJjbh
         uLiw==
X-Forwarded-Encrypted: i=1; AJvYcCVJRbSedYBoa13GLX8m6qoDHGoxDuc/opxnuwc8GxGBldEuPKPCzD1Fx8oncHRIYmoHTIe2xykCYx7EAUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8JHVe2Ohs9sXjLQHSsxLCmtfuw/54zBlN9rTqvLpHsETnVlU
	owePwUHZ6/AWIbIzu39XGAa1iqH00P3SA8+/EmRg0YL9kGgRW+CKkLZKM/8ZhZ1GMSQ=
X-Gm-Gg: ASbGnctTMfkDe0Bz/cwfJArSpz2BIUt2G0hR4+L/nI2X6zsWMZ7pmyyEtLlC5WLdgs6
	NaacZola+a6zDvLJAaPYlI13uMVRfCexiyOp50CDQijMjUgKdiZ4J96r+SWM9PCY0osdx7kXwS7
	TmTLvJz7/4rW3XAuvhD7vasmfaI08j7Yh3yzevxrAmyc7BnYrEXmTgXrvGdAErlN1AFCwffbB6W
	jgqlNYTQRQSccYG0Xme0C2Ry57bNMCv4jQ8zE2kHPpR21BJHIYmyK2gZmLGVqS26etTm1GZ2du9
	qbs6ICZ9tVOKNxKB3ILPmKNn2v+RkG8Ka1AygYlBIlU95br42f95S5QAOWLAWbWyS8ql8l9eIJY
	W+rwlh1VKrnMx1uji+L3ilyeOaQ==
X-Google-Smtp-Source: AGHT+IHWcPo2T5oWAHxVCtrvEXenhjJ10/Omq5VoGqBDmOSNSjGENAvaM/GRXOOcD2Yi8BQMsG2wZQ==
X-Received: by 2002:a17:902:d48c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-236426b4fbcmr25446925ad.38.1749623177773;
        Tue, 10 Jun 2025 23:26:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:26:17 -0700 (PDT)
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
Subject: [PATCH v5 23/23] MAINTAINERS: Add entry for RISC-V RPMI and MPXY drivers
Date: Wed, 11 Jun 2025 11:52:38 +0530
Message-ID: <20250611062238.636753-24-apatel@ventanamicro.com>
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

Add Rahul and myself as maintainers for RISC-V RPMI and MPXY drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa16..5ac1746f3086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21361,6 +21361,21 @@ F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
 
+RISC-V RPMI AND MPXY DRIVERS
+M:	Rahul Pathak <rahul@summations.net>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
+F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
+F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
+F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
+F:	drivers/clk/clk-rpmi.c
+F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
+F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
+F:	include/linux/mailbox/riscv-rpmi-message.h
+
 RISC-V SPACEMIT SoC Support
 M:	Yixun Lan <dlan@gentoo.org>
 L:	linux-riscv@lists.infradead.org
-- 
2.43.0

