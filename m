Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A8B25FA05;
	Tue,  8 Apr 2025 05:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088563; cv=none; b=FsctwGXRrdkWj5eaaOIowQHwqrjCdFvwjIMhR82sRmV70CmilxF4yA/jn8O7HeyU/IcshLegVr6gS7/yQW729oluY3vmaaYgk7Tpd/ZEdYG/ECcCY8XG/prx3CaZaz0Hst6ZumiGT5zJt1QUuNWRBp7wkPPjhoPDm3nPpvFNnFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088563; c=relaxed/simple;
	bh=4l+o4OGRPWFJRjD8V+YVsupkeWNPcXnlPD7DsuUNeXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgA0T7konPLDxGGnFTB3XSUNsOCxPET9WssTL2Sj5HbxLsejKR/I6GoUz6lQ29BbICevrWvhF+dVHIsyWoJZCNt3mVCSdU3TQc9SUbG6rb5KSctJbzLQKi4U4cfXgQi+qjU/uTzb23lGmqUHrPXQVe953EHZceING72PtJJpits=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb07OsFa; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb07OsFa"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c56a3def84so486116285a.0;
        Mon, 07 Apr 2025 22:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088561; x=1744693361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lMUff57GYX4CzxAbSN/48C3ZVAAUNRCdX4B0uVlZ+E=;
        b=Wb07OsFau0BYRSJ5uRzaIGV23Q8JNxrg9loBUD6pOzwmYS7AHV4TNk9BcrlYBaH5BO
         vWhM1RrX8iKJ/eQ/DRmqc3eD1stQR/f0XsEpiteiPh3BtRnoC62zQExVg2Ppkzh7W2Tu
         1G3nIcSQF0nJZJVxBKnf0vRMo0FGoR3wPlcx04j3cvVz6qMNjeXvibXLyaSXwxoDWB1y
         ck5q+agfJ6vbwl0NE81FakrRT7z3QqGiwHTHBjg92GfTCOt9yD/65gkdTESCbvfqCiaQ
         ia/KkVMgtOgklA4CF5Efnb4cFunjTuD4ToQCjGXaKSqhnn7/4UmrhSqd5kWtJHooLBsh
         nGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088561; x=1744693361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lMUff57GYX4CzxAbSN/48C3ZVAAUNRCdX4B0uVlZ+E=;
        b=G94lIQ0TSwpkX/iu4oL7MffmhPii6AY9Z7MA4wsYmM8NXAfN+fCxM1o16pyCM4cdGy
         c0n4MHU9HM3HTfUr757WZiaF/hCGuz2vu/46GywHa/Am+/fYW+3sGlWj3sAd3CVyTGGO
         1+RsM8Lgzun6NnxYuce6pje3vd7mbHFXtLGmTR9N/qAog85cv9m4tReRkrtMJCbCR6Xw
         LeBPpJj1gNfue3+fu6JNM9sFxCG1onVSTmcs0DaIW+qVfRmtaRyg+8/2BncbJ1gQxn2D
         y5vDiEpkxnO9Pm4UcJjvjPffR/hDwzUH/Wd227jixzwZFrRA+2sO3KIA8tg62kpdLAhu
         HOfA==
X-Forwarded-Encrypted: i=1; AJvYcCXKpPSvjtSkbdlHf2Kowii18f+1fqxg7ZezD+y+b6Rb+MnJFnrtKGEJ7vWcq8+KSl9WbCisLhWoFtv2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOYXZVCDmE0x1J44h26pSM0vUl5bW5BwZawa7Io2khB0TOB5a
	odzYkN0ogCjTN9/kmA8lPqVY+uyThvJsNxhH/EmX6edbgjHfKlLv
X-Gm-Gg: ASbGncskX5elaHQCB9TYLdf5/H3XWvkADqJobLdow7WNWYGm82VY67JX0SyS0MwlFrW
	rbkyvvVvK8i6Vxyg5B0AHxCQ39fXxiwkIV+S1H01Y52fu0T/vZeDB/xUzNz23r7thbSOWMVkgiK
	6HhTYteADHr6a9DnRhef6TM6gtmdFJbyYB9GAhzEjB/mHY2GILQGSb1hQZEEukysTuIT1HBk5ai
	gU+17ho7a4zNRTGDXP1OqEbYTrFhRFfVvDiSEnSDaCgovoW5+6fRfetrCqWETiYw2NARh3YLjo1
	JlTPRSxnNbtWTympLXGR
X-Google-Smtp-Source: AGHT+IGuSzrFyPWJt2trcansOZ3rfJX9pXHBBq4wLTrDbisJaG5tsy22yySc7YRo3G+CTYp8klrU8g==
X-Received: by 2002:a05:620a:4607:b0:7c5:f696:f8e5 with SMTP id af79cd13be357-7c77dd8612cmr1566906185a.14.1744088560675;
        Mon, 07 Apr 2025 22:02:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76ea587c2sm707724085a.81.2025.04.07.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:39 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Tue,  8 Apr 2025 13:01:45 +0800
Message-ID: <20250408050147.774987-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408050147.774987-1-inochiama@gmail.com>
References: <20250408050147.774987-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Sophgo SG2044 MSI interrupt controller.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 61 ++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 30a1d2bfd474..2935ca213306 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -19,8 +19,6 @@
 
 #include "irq-msi-lib.h"
 
-#define SG2042_MAX_MSI_VECTOR	32
-
 struct sg204x_msi_chip_info {
 	const struct irq_chip		*irqchip;
 	const struct msi_parent_ops	*parent_ops;
@@ -44,7 +42,7 @@ struct sg204x_msi_chipdata {
 	u32					irq_first;
 	u32					num_irqs;
 
-	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
+	unsigned long				*msi_map;
 	struct mutex				msi_map_lock;
 
 	const struct sg204x_msi_chip_info	*chip_info;
@@ -96,6 +94,35 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
 	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
 };
 
+static void sg2044_msi_irq_ack(struct irq_data *d)
+{
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+
+	writel(0, (unsigned int *)data->reg_clr + d->hwirq);
+	irq_chip_ack_parent(d);
+}
+
+static void sg2044_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	phys_addr_t doorbell = data->doorbell_addr + 4 * (d->hwirq / 32);
+
+	msg->address_lo = lower_32_bits(doorbell);
+	msg->address_hi = upper_32_bits(doorbell);
+	msg->data = d->hwirq % 32;
+}
+
+static struct irq_chip sg2044_msi_middle_irq_chip = {
+	.name			= "SG2044 MSI",
+	.irq_ack		= sg2044_msi_irq_ack,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+#ifdef CONFIG_SMP
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+#endif
+	.irq_compose_msi_msg	= sg2044_msi_irq_compose_msi_msg,
+};
+
 static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
 {
 	struct sg204x_msi_chipdata *data = domain->host_data;
@@ -175,6 +202,22 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
 	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
+#define SG2044_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS |	\
+				   MSI_FLAG_USE_DEF_CHIP_OPS)
+
+#define SG2044_MSI_FLAGS_SUPPORTED (MSI_GENERIC_FLAGS_MASK |	\
+				    MSI_FLAG_PCI_MSIX)
+
+static const struct msi_parent_ops sg2044_msi_parent_ops = {
+	.required_flags		= SG2044_MSI_FLAGS_REQUIRED,
+	.supported_flags	= SG2044_MSI_FLAGS_SUPPORTED,
+	.chip_flags		= MSI_CHIP_FLAG_SET_EOI | MSI_CHIP_FLAG_SET_ACK,
+	.bus_select_mask	= MATCH_PCI_MSI,
+	.bus_select_token	= DOMAIN_BUS_NEXUS,
+	.prefix			= "SG2044-",
+	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
+};
+
 static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
@@ -255,6 +298,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 
 	mutex_init(&data->msi_map_lock);
 
+	data->msi_map = devm_bitmap_zalloc(&pdev->dev, data->num_irqs, GFP_KERNEL);
+	if (!data->msi_map) {
+		dev_err(&pdev->dev, "Unable to allocate msi mapping\n");
+		return -ENOMEM;
+	}
+
 	return sg204x_msi_init_domains(data, plic_domain, dev);
 }
 
@@ -263,8 +312,14 @@ static const struct sg204x_msi_chip_info sg2042_chip_info = {
 	.parent_ops	= &sg2042_msi_parent_ops,
 };
 
+static const struct sg204x_msi_chip_info sg2044_chip_info = {
+	.irqchip	= &sg2044_msi_middle_irq_chip,
+	.parent_ops	= &sg2044_msi_parent_ops,
+};
+
 static const struct of_device_id sg2042_msi_of_match[] = {
 	{ .compatible	= "sophgo,sg2042-msi", .data	= &sg2042_chip_info },
+	{ .compatible	= "sophgo,sg2044-msi", .data	= &sg2044_chip_info },
 	{ }
 };
 
-- 
2.49.0

