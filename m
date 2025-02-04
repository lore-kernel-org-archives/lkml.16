Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16332066C2
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655684; cv=none; b=mHFOK9LAAFenDFf1fc5XAx1PlB15hO//gbqa1HiMRP7a0knl1llNYsQ1VzxM3Dz4BcEX+PQtPlwAkIsVkguzmGunm6IkrW9Ot3Kk/dsiPAd2rQ2ADCrAbc/VUhvgSs4V7mVXF6/zY4weiJI7X6AH+oVPDH7WAqUczs6vnmIbdVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655684; c=relaxed/simple;
	bh=GQ6h6qnifBeRvwI5lbrzx5DePz9FG/7AwYjLLcTRLyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gvr9MN0JyvCNhoujN7BAzll1ex/Fy4oBHi0tKZLAjcqu6x/0e5VODTohLx7apGo6Ai0GMDn5CUKeeWDRfbClTZQH4+8VwAOGL/oE8HIH0BkfsDwGuyEBfW7uuwCTE/Nt1wSlrn6li6LC6EN6fA5BJvsXP8ykNE847GOdAG/uu6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EO29P91Q; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EO29P91Q"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7be8f281714so472420785a.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655682; x=1739260482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=EO29P91QA63DYCtsi8wInhhpySP5x01bNaX9mdBeGmKnElvTBIaRdwY5Jj0dTl9OB6
         hMbCIAH8CwFGZ8+JzTacV3xraYfoXXbafTdsVQvjbH635bqOzPUXApoSHKt0+wrcz6sk
         kNw0NiH0wj7DtyhBhSKqUxiRhC7kLEyEXsJChV8arT/ou3jm/bapHAulhCWUF9hcH71z
         30KC7RLGQwM1u3aq5wHh7XuLMl0ROLZzY5aL1FR2IzrED35zSgTFION7vIJMrgT+5u1O
         rGQyQ7MRfgK26GKLBImj9Ic5jsID84NDdM8Ydwx9x5rOJXQWeiAlqj+byvsqAgRFGjtZ
         jZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655682; x=1739260482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDa5uVtGTmKoF+EGxYZ14lQBrXBy+Zgm46G016g9yok=;
        b=ts0H86zpsyHyhp7+eEql4BgqRqt88eLwMRaLqzlYoz8KzCI5RBXeRclGP1CduOPScR
         CSwmKLybwbLqp9DDfCIgt4D6FWXwoeKJh/ndEFwRwpoG+1u0m7RgbNFK5SnJATRPkD5x
         uc4jmGn3OZ5eWKXKbGTU0N9LqZrmEYlfSLQ99MS2tZ8PskNOqukMcIc5NjveyGUQ6GKU
         2L6v0Q8zzihlYFAaDaSrYc5VJ6YawXj+d0t/P75tYyAjHtDBN7cdFMknLUaZ1UX6rjrT
         XLKTww/vPppUGgy6K3h6/e3kEU6nw67jCtj9cdLjGHeh33/VAhzXx5BnBHD1PGS7DLDT
         rcHA==
X-Forwarded-Encrypted: i=1; AJvYcCUCqDBrOascEVhxcppAU7wQyckJOjIhN9BEZoM/kXsb0j/jdlFDsdhlLADfy3ET/oZTHByqZeQyzYwWItg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYiNe8nTTOe63FU6JKeEkF5nm+WirrhlHtWPtoUnCjYbnmbIEm
	3Hx32yWRrrhxI10sVlSF9/MgRdlbrwX4++KU546gbmySwUsajj5Mv0qNTrnYHx4=
X-Gm-Gg: ASbGncvxm83G/pdkkkmnBVH5LqCglCmYJfBINt+w31E49GIXgD3sbG4Ebr4WdBIJy6a
	inOqCb8lU0OF3l5ng52uANrnYBsbYQcKELvG6mvhtv7t7VzQbr8+QtD5dgyY2KvgWyCB2jv+lxS
	FhKrxU/xdPh+sTacRLvpKajbunwGdv0uA9Ua87NEWTBwRGuRaj7Sm1U2lv6wkQKDaA/7egXj41A
	XmxSOvSxX77I6UEzKuB2agoC94ZzwGLi9yxonZ6vIfubuX70ImL4XLNY7/2fZ3Z3wKVe5nwLQNy
	wSkX7KgQ3E9fh4DZqKzelrB+D1Tzvs+8571E872VQhgzblDk2sw2Ock=
X-Google-Smtp-Source: AGHT+IEhdMB+vtxDJGF7LVgqcjkCxx8rRK71YEAfpN/qTx2NMyGfi0QyTUHVXR86sg4Wl/xvt3qxrw==
X-Received: by 2002:a05:620a:278e:b0:7b7:2de:6fd3 with SMTP id af79cd13be357-7bffcc3cdfamr3041523085a.0.1738655681635;
        Mon, 03 Feb 2025 23:54:41 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:41 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 02/10] irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
Date: Tue,  4 Feb 2025 13:23:57 +0530
Message-ID: <20250204075405.824721-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204075405.824721-1-apatel@ventanamicro.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

Introduce chip_flags in struct msi_parent_ops. This allows
msi_lib_init_dev_msi_info() set default irq_eoi/irq_ack
callbacks only when the corresponding flags are set in
the chip_flags.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-gic-v2m.c    |  1 +
 drivers/irqchip/irq-imx-mu-msi.c |  1 +
 drivers/irqchip/irq-msi-lib.c    | 11 ++++++-----
 drivers/irqchip/irq-mvebu-gicp.c |  1 +
 drivers/irqchip/irq-mvebu-odmi.c |  1 +
 drivers/irqchip/irq-mvebu-sei.c  |  1 +
 include/linux/msi.h              | 11 +++++++++++
 7 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index be35c5349986..1e3476c335ca 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -255,6 +255,7 @@ static void __init gicv2m_teardown(void)
 static struct msi_parent_ops gicv2m_msi_parent_ops = {
 	.supported_flags	= GICV2M_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICV2M_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
 	.prefix			= "GICv2m-",
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 4342a21de1eb..69aacdfc8bef 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -214,6 +214,7 @@ static void imx_mu_msi_irq_handler(struct irq_desc *desc)
 static const struct msi_parent_ops imx_mu_msi_parent_ops = {
 	.supported_flags	= IMX_MU_MSI_FLAGS_SUPPORTED,
 	.required_flags		= IMX_MU_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_NEXUS,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "MU-MSI-",
diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index d8e29fc0d406..51464c6257f3 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -28,6 +28,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 			       struct msi_domain_info *info)
 {
 	const struct msi_parent_ops *pops = real_parent->msi_parent_ops;
+	struct irq_chip *chip = info->chip;
 	u32 required_flags;
 
 	/* Parent ops available? */
@@ -92,10 +93,10 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	info->flags			|= required_flags;
 
 	/* Chip updates for all child bus types */
-	if (!info->chip->irq_eoi)
-		info->chip->irq_eoi	= irq_chip_eoi_parent;
-	if (!info->chip->irq_ack)
-		info->chip->irq_ack	= irq_chip_ack_parent;
+	if (!chip->irq_eoi && (pops->chip_flags & MSI_CHIP_FLAG_SET_EOI))
+		chip->irq_eoi = irq_chip_eoi_parent;
+	if (!chip->irq_ack && (pops->chip_flags & MSI_CHIP_FLAG_SET_ACK))
+		chip->irq_ack = irq_chip_ack_parent;
 
 	/*
 	 * The device MSI domain can never have a set affinity callback. It
@@ -105,7 +106,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 	 * device MSI domain aside of mask/unmask which is provided e.g. by
 	 * PCI/MSI device domains.
 	 */
-	info->chip->irq_set_affinity	= msi_domain_set_affinity;
+	chip->irq_set_affinity = msi_domain_set_affinity;
 	return true;
 }
 EXPORT_SYMBOL_GPL(msi_lib_init_dev_msi_info);
diff --git a/drivers/irqchip/irq-mvebu-gicp.c b/drivers/irqchip/irq-mvebu-gicp.c
index 2b6183919ea4..d67f93f6d750 100644
--- a/drivers/irqchip/irq-mvebu-gicp.c
+++ b/drivers/irqchip/irq-mvebu-gicp.c
@@ -161,6 +161,7 @@ static const struct irq_domain_ops gicp_domain_ops = {
 static const struct msi_parent_ops gicp_msi_parent_ops = {
 	.supported_flags	= GICP_MSI_FLAGS_SUPPORTED,
 	.required_flags		= GICP_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token       = DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "GICP-",
diff --git a/drivers/irqchip/irq-mvebu-odmi.c b/drivers/irqchip/irq-mvebu-odmi.c
index ff19bfd258dc..28f7e81df94f 100644
--- a/drivers/irqchip/irq-mvebu-odmi.c
+++ b/drivers/irqchip/irq-mvebu-odmi.c
@@ -157,6 +157,7 @@ static const struct irq_domain_ops odmi_domain_ops = {
 static const struct msi_parent_ops odmi_msi_parent_ops = {
 	.supported_flags	= ODMI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= ODMI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.prefix			= "ODMI-",
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 065166ab5dbc..ebd4a9014e8d 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -356,6 +356,7 @@ static void mvebu_sei_reset(struct mvebu_sei *sei)
 static const struct msi_parent_ops sei_msi_parent_ops = {
 	.supported_flags	= SEI_MSI_FLAGS_SUPPORTED,
 	.required_flags		= SEI_MSI_FLAGS_REQUIRED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
 	.bus_select_mask	= MATCH_PLATFORM_MSI,
 	.bus_select_token	= DOMAIN_BUS_GENERIC_MSI,
 	.prefix			= "SEI-",
diff --git a/include/linux/msi.h b/include/linux/msi.h
index b10093c4d00e..9abef442c146 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -558,11 +558,21 @@ enum {
 	MSI_FLAG_NO_AFFINITY		= (1 << 21),
 };
 
+/*
+ * Flags for msi_parent_ops::chip_flags
+ */
+enum {
+	MSI_CHIP_FLAG_SET_EOI		= (1 << 0),
+	MSI_CHIP_FLAG_SET_ACK		= (1 << 1),
+};
+
 /**
  * struct msi_parent_ops - MSI parent domain callbacks and configuration info
  *
  * @supported_flags:	Required: The supported MSI flags of the parent domain
  * @required_flags:	Optional: The required MSI flags of the parent MSI domain
+ * @chip_flags:		Optional: Select MSI chip callbacks to update with defaults
+ *			in msi_lib_init_dev_msi_info().
  * @bus_select_token:	Optional: The bus token of the real parent domain for
  *			irq_domain::select()
  * @bus_select_mask:	Optional: A mask of supported BUS_DOMAINs for
@@ -575,6 +585,7 @@ enum {
 struct msi_parent_ops {
 	u32		supported_flags;
 	u32		required_flags;
+	u32		chip_flags;
 	u32		bus_select_token;
 	u32		bus_select_mask;
 	const char	*prefix;
-- 
2.43.0

