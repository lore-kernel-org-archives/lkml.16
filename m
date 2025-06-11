Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD922D9EA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623145; cv=none; b=u4UzqM9m4+tPHmRVF74a8hG1iPYhURBRRmDvptvWK2yICgPy8cPinTlpJ7+s+7sk8ugjYEyve6mKTF52xWukcPDcAQ2LqMz/96BJjDdppPxiJQxDgD9CTTxWa1e0PI3t4mTHfArI19U/CCxAUQYYgGRaJqbh+nnvvawOYkZhUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623145; c=relaxed/simple;
	bh=Pb4fKfMGleHNMPqEtSCsUXXEOw0RGKvlO14pbjto6vU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBgx26Oc6wrKg0hsPr6XBaDJ12xRZAKo3cXv557Yk/CUpJcqUBksL/YjC0cxEecpqmsuouMbzUXYKwomhvCoS43I87H5jtHeowzO4VYbhhAnSsftB4vF5jxE7JqAIH8CpF+DOzwvO7biTuj4sSnTonsGFifdlTeejxiDFKO+ivk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aGLZ/zBU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aGLZ/zBU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235d6de331fso73696965ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623142; x=1750227942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=;
        b=aGLZ/zBU+cZooKEvosxzzaymDEQZq23CAExcmS07T35i5QHUfqc0aEs2KjFq6wnCHv
         FDgP/+OkyCu1o8hcbHDBUBTGKQ1i1Weke5bYONMRHEblHMHddOdeupxhUJDDXn/PGoAS
         DQrfSOJMtJC+av2YjRC4eOb8i6DT+haU34ZOnJSHKURNHSdFQXCBCwTcWNbYanILxOQg
         9eOUtHEVTLzzop8GSpF6VXzALYUiN1gmgUy1qctCMxVNXOfbABgpiBDZ5/OiWMEDCMd0
         VGvkk6K38rMRK1fEhDZQOrwKi7Bw+tL8X6jCgjiqTPC2G0bX2p5ju1j2Aa9ycNm8PMyt
         GWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623142; x=1750227942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7mx0GUiR5U+ns4+v9sHac9w9AvSdl9HF8/h3RrjQkc=;
        b=PmkFFXGHhBKgGpPuoiF/DQinHiimBcwM8Q+xa1FVumXNAeF7eOasyXzD1+Q3FeLTnY
         +YuBnyuJCrFE8id4S+Y7lWncf86bDKWRPfvT4fE5fPy7gHidadHUXKvb6rIqXWD1bKqi
         SRH/up1VLwPSnzZXE9phtSOMOn9sP2rAB7TptC9RvCxQd791XbuBuh/GM0QFiJw9qwGn
         mhapV3BLYEjDK8Tw8lVfF/lsPqsjZmraQqWj4VZMrSAEhceLpfXXebvZwpd0s1m7i1o6
         pMxHeMEHgB/1dEzKbYr05JwPQ0Jh22tArP3Dj/sMpbwRgkwY4xwHgmL2gXX7XphRJWhn
         dqAg==
X-Forwarded-Encrypted: i=1; AJvYcCWxImtnDHWTqR7cAHHISiA8NYYNRehPkol0A3ISvWSybCUTq8KNQ9nt8Qz9CyqLnbw1AIRBDj+nFdr6Yes=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVslLUuSt253Qy8lvcG1XlwZpuSvo116kOLESdo5KEqtwxnGB
	aib2WIZ7xd6O5d56kQwW4adUMrvA/qSqZaEbvGiNgADDzGWIYa8GWd56ne5lrDEzPZE=
X-Gm-Gg: ASbGncvUjFdlXBQ/E4U+NyWIOBlXwPLGd3094nSFIoJN9K0YHLFYRKXtOqDnYhORhvd
	rsS0mqWKn7tLbfDCe8LOSGKjSikUagbbuhLIhMskq8xftRdiC1FgrDJFtOpFk+3zX7q4ytOtJgg
	cpPyVtHPDrL4CmLv4pzARkFAOhfj6gAAzdO7p+f21J7Y+bqwAnkh0cxdJazTtno8dEMJLTY1E1s
	z+HPlWEqlmIyOpaJdaciAcFES0TWJFJ6gDnin0FleI+04lNNk7l2yD58GKVQei28K5zUqYtp/me
	3PBeJ2l8YqvssfamIKsqZ8Xqr7nrWtOF34t3tLTiBp/WiHCvqs5PNoZL+hYYoSg/dyT6rd/7uLe
	h5jTu3do1rJNYx11HeISBnCF4xeP1k8VL1FLe
X-Google-Smtp-Source: AGHT+IEfcy/atZIXks3ZUrd+ueaz0kGJBeRvccpphWnGgi4UbEP5A+4LOl8ZEzl2YZ+s8KI4mCAfHA==
X-Received: by 2002:a17:903:144f:b0:235:eb8b:9968 with SMTP id d9443c01a7336-236426b4f43mr22663805ad.36.1749623141716;
        Tue, 10 Jun 2025 23:25:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:25:41 -0700 (PDT)
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
Subject: [PATCH v5 19/23] irqchip/irq-riscv-imsic-early: Export imsic_acpi_get_fwnode()
Date: Wed, 11 Jun 2025 11:52:34 +0530
Message-ID: <20250611062238.636753-20-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

ACPI based loadable drivers which need MSIs will also need
imsic_acpi_get_fwnode() to update the device MSI domain so
export this function.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index d9ae87808651..1dbc41d7fe80 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -215,6 +216,7 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev)
 {
 	return imsic_acpi_fwnode;
 }
+EXPORT_SYMBOL_GPL(imsic_acpi_get_fwnode);
 
 static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 					const unsigned long end)
-- 
2.43.0

