Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D82571D9
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970977; cv=none; b=ImPLouwMNu+SnBamTXorR8DTxj3+Y3Eu1ULw4xaun8LS/iYYotUTR0Bde1OYXMWsnZndWJhU5g8hMRffKt0iSftPdjftUfNmcAYJtI//t1zsm2G7oqcjbZwGi+QVz0T97m9mdeCtDom9/qEmOkfzO/fngv7wXFBeatbiEk6RIEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970977; c=relaxed/simple;
	bh=yeB8y5RPUW/U2H9IsZ88Rp/3g33hiQ8JvNdsuBTNXdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tUooGT25uxGYfWuBWbPGSkl0mEdHHvwImbzx482Z2uEQFqyvA4Lq7C4YCEcBgo9nUKtgie31eAdzb+0u9Ajjv/Y0zJNTRwGTOb2L2klUW3mfJACqt2vG0s5y+3BItwti501kpziuy7qBG0y8gPhjGP/ROOLVGPmU8Qz4lJrOyxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aeS4EtiJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aeS4EtiJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af548cb1f83so3100626a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970975; x=1747575775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQArumrrnU/ogtbn7Qd/AO+fc3Ys7a312xLrFyKayPY=;
        b=aeS4EtiJQdm2mDlrTjtA9vGPX67ibIvJyvAl+/4Kh7Kg4WogPzeYYWFnpy9ne+k145
         zH1FjDufo7ZTfGHhxTkk86y2MdJoZBSJlIbNseGMJ3oeJu7HrBsssLcuwDSLJxTo6R1k
         CuC6PU4HiNda7mkbcQhXHevGzq0+hU8nvLaoBViz3DRY2BER8qpti62X5YCHr35yGwix
         wss0AKDo7jQSkHHqZIY/OiOJfwEVypzh2mSv8mElU+R5xwZOiH2mOH6l4/QIZLh0swFF
         rVOW8mX14k0iLPEU4Tdqc3wtRCJnNJqU4sh7Sgn1dIlMlSd8/IYY18iK5ebnWJOByXJr
         2mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970975; x=1747575775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQArumrrnU/ogtbn7Qd/AO+fc3Ys7a312xLrFyKayPY=;
        b=Zx6CEQ+QRkAKkiNXkueukWIdjpz+jWpXzc0pDrIzOdetpm/deemUdgAS9L3+OeV/X7
         /k59hgdpLbaf5v8Rt/A0J2Ti3sqrNpvCdYD1iOISNLctqgh6AVVyj9FIHZGuhJZszQbL
         CXCtw0vGvkB58Vr8VzY5AGaQ4TGCyKxeRjrijaY6oLFl09a2TFQOftopWBCqyQtnWAQb
         R6uzIhbGpw26euY3j2x5rMghLwhG7AZ8LhYjeGqC6K46w2LnE8iFmwbRSe3G4V1wIt0Z
         t2fUnDJUgJhZQ57V7CR8RUthSjA40Jsh/zlZG4p7bOgQrUGhXyex+v+gY7/yTZZpN/Cc
         DToQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz7pmawATI3ypFMpQGEZ9aXg9jdcuofrcWpTszEBEQ6yILOzP9au5GXZ6H1Of6DotczscPYQLocpKsY7g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+k1zyxRylhXetWUk4LOCz41/OmuQ7erGQ1krRYUmXzFkCL2Xo
	4cMmAVHjpNflI5y2kQeBrDdOuQQd68XIW1DiFz7QqrKAx4AlTRtFYWcaAk+rlvc=
X-Gm-Gg: ASbGncsEH5Ms21idQh6pnZEqRrQy0cY4B4x1CRvmQj3z6Y/aI6mWi41RtYHX/zGPuch
	0rppfMzqB/9ono5ajYJ9Or6fdxhqWB6HJTXJJEJYjCu5Ptl392YPqPZPogfCYM68Y4kXkBdn6Zf
	96C55PoMYG8kDDIs9Hcfwf1NK8zgqbXi2Wk7zUt5qhslI8lRHSeTa4G2VNzkULu70HTTBZnOW/D
	IQrdxjQ9Om8iVW5s3p2ArWVZpyRrG8jWQ8tAfWzJGH4GWxym4yikC8fuKNQiBvOlP29lFC8ysrR
	QNk5tvYhpeVPNPTr9F+JOKjutEFZ9wWg4T1YE1tJpuUCtBCWKKZQIrzOTCPeu7vuaRaT8GeWt0P
	F1wbJVVkjpgy6PfCHWDFT1mJV
X-Google-Smtp-Source: AGHT+IH99Zv1aZv5nsnBv9MERKHyTW4da2QONHroI0asr7GANUih2QJUdTnOxyfgJFsPzfiGqRq0gQ==
X-Received: by 2002:a17:903:2448:b0:223:f928:4553 with SMTP id d9443c01a7336-22fc91a735fmr156129915ad.44.1746970974847;
        Sun, 11 May 2025 06:42:54 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:54 -0700 (PDT)
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
Subject: [PATCH v3 20/23] mailbox/riscv-sbi-mpxy: Add ACPI support
Date: Sun, 11 May 2025 19:09:36 +0530
Message-ID: <20250511133939.801777-21-apatel@ventanamicro.com>
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

From: Sunil V L <sunilvl@ventanamicro.com>

Add ACPI support for the RISC-V SBI message proxy (MPXY) based
mailbox driver.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/mailbox/riscv-sbi-mpxy-mbox.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/riscv-sbi-mpxy-mbox.c b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
index 240df2f9d5c2..eae84b26d628 100644
--- a/drivers/mailbox/riscv-sbi-mpxy-mbox.c
+++ b/drivers/mailbox/riscv-sbi-mpxy-mbox.c
@@ -6,9 +6,11 @@
  */
 
 #include <asm/sbi.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_controller.h>
@@ -775,6 +777,7 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpxy_mbox_channel *mchan;
+	struct irq_domain *msi_domain;
 	struct mpxy_mbox *mbox;
 	int i, msi_idx, rc;
 	u32 *channel_ids;
@@ -907,8 +910,13 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		 * then we need to set it explicitly before using any platform
 		 * MSI functions.
 		 */
-		if (is_of_node(dev_fwnode(dev)))
+		if (is_of_node(dev_fwnode(dev))) {
 			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
+		} else {
+			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
+							      DOMAIN_BUS_PLATFORM_MSI);
+			dev_set_msi_domain(dev, msi_domain);
+		}
 	}
 
 	/* Setup MSIs for mailbox (if required) */
@@ -953,6 +961,11 @@ static int mpxy_mbox_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+#ifdef CONFIG_ACPI
+	if (!acpi_disabled)
+		acpi_dev_clear_dependencies(ACPI_COMPANION(dev));
+#endif
+
 	dev_info(dev, "mailbox registered with %d channels\n",
 		 mbox->channel_count);
 	return 0;
@@ -972,10 +985,17 @@ static const struct of_device_id mpxy_mbox_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mpxy_mbox_of_match);
 
+static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
+	{ "RSCV0005" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
+
 static struct platform_driver mpxy_mbox_driver = {
 	.driver = {
 		.name = "riscv-sbi-mpxy-mbox",
 		.of_match_table = mpxy_mbox_of_match,
+		.acpi_match_table = mpxy_mbox_acpi_match,
 	},
 	.probe = mpxy_mbox_probe,
 	.remove = mpxy_mbox_remove,
-- 
2.43.0

