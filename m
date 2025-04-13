Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36931AE875;
	Sun, 13 Apr 2025 22:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584614; cv=none; b=lklL5fj8qlECjw898I694bUAvWCw4cEhWcXfflCygiWYdsSg4sf0/NOl4im1GxfC49WITyemRhNC4yPGXlHZApbaz+4kKNTOJtUScbbT61FMrJqHy1YQX8GFTttVSNdPwA2nry53/vBnv9CDcnE37J9sNHxwAkY481yrfna4jtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584614; c=relaxed/simple;
	bh=m1QL4n2hnIEQd1dyErGMiuUFBadyc8JkLZb35bSy5Uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meNZc7PsAqtNARrQAYpzdiJ5bSGeAlq+dieSdPLJMZcI7fySScCp+Yin3nMiCndz+/KkzsugKHuA4RqgeE6A7gvbMetO+c4c0Dgoa/8B/aitJPeGw4Z6MGmTd1Hqg/ldzon1YKcpiLTxa3blX7EYR1UttPtGsk8XvjuGAYDn43c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3x5EB9I; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3x5EB9I"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476a304a8edso35938511cf.3;
        Sun, 13 Apr 2025 15:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584611; x=1745189411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzknkghvm2nSJ8gncEp08HNumOsjilrcwaey6FHX4Cw=;
        b=X3x5EB9I3x5onh9Gx/ambeaxvhnj7mwdo6Laif11quOk3kCL2n203QR/DLX7SYo3fq
         xSLnHs6olHFhPTfSzcEDQqzDoVUSGRjbPDRnAsyV+v0w6cG00D/OcydTD4VefZzr+Da1
         01RLfojBSXXUDvmX9pUwjsjJ4gfsZam+yZC8nQ04JnUrfoRlq4h2bIwdiZmzLUV9m4ib
         Yv2Sad16PAJCGPtStZnIh0AMAdaX2+JJLuAjQUkUZdTFuKtqME3Ozd5/yrX/Ng8Ev5ow
         z98qB3UlKFz8th+NPpNNHzUZk5aHgo8ER6mH+k8S0VuQSYtE2rMaR4ddb/ecCApZhCjo
         EG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584611; x=1745189411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzknkghvm2nSJ8gncEp08HNumOsjilrcwaey6FHX4Cw=;
        b=SEjgp6xTk76LwxpdtrGSjvkKucpqCK2LeiiH/t6mBK7Mv7bmsyP3a7PzYIVORRZYDh
         T3oPJoLkhMN7gf9WefTB/MPC03YxsH3aFd/FFzxiRauw5T7cgqqVgSH5/Kln3pRD0TVD
         J456rhKHqLkAI7315dNC4RhX+NcJG6eTGGGO5+VNC5yrFMpMflr2ODFWtduDq9/mRQkC
         fSvsU31XCYfS1l43DZ1qDOhOJZvRTei4yEHdh7WHNa+ZzMaZ8us9KxWee7oSXbsGeXit
         Bl1Sf4PpRrSpqF+U8I4E72rMv4geadPouu2EDO9eRcX7LGalNGOm5ikZm+9oAAl8HPNQ
         i0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrwXnp0MZS3BZuBCiPCApQiUkjjFZQ/3+j/2Ai71kXcStAvg9fxZ2xpjvs3Ry7E2PctelHiUA+Qvr5@vger.kernel.org
X-Gm-Message-State: AOJu0YzAxGJs/PcGyAsCShCt7jHNXpK31MB3Q30LSvNhAt8ItECqUb9F
	WL1jdb6fBL5ywf8SMVBFrcBEZA25vXJVv0HEAtktv758fW1M7GFF
X-Gm-Gg: ASbGncvgbmcF9Tmte2agY47H6JQPMb+D06CJFnn+zb3SIlma5PlZm1KC5fM7dNREJgo
	SDiwwjIhkyoacw8Iz1zfYK+gyB3WvW0NzLCKdyC/BqYIXkNTwOxoGaF/bTVZW7TaaH8t3juLI6w
	iEnO7612h2pH8w9x61n909qsFMmC+KhqBef/ELskFXxVCnbkXXSaQrL3qa2RMO62sBHty0EygBi
	NZekGXrU7FKkj/8Mlo7OcJtDgaO/d8T7bcRg4HKAGfG/4+5LWkdzaJ0heR5J27MMM3fWQ7jWTlQ
	AQIzS0xaqfwmW/gbpbj4+rQvfuI=
X-Google-Smtp-Source: AGHT+IF+PyqRU43XMrjpdH8Sf/GcfpRnHg9qbypvylMJLHpXBxFaINLCZ1xlBzd+4FY11BwiFGXEFg==
X-Received: by 2002:a05:622a:1903:b0:477:6e6a:8a31 with SMTP id d75a77b69052e-479773feebemr148304991cf.0.1744584611481;
        Sun, 13 Apr 2025 15:50:11 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47983cc92c6sm29498771cf.6.2025.04.13.15.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:11 -0700 (PDT)
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
	Longbin Li <looong.bin@gmail.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v4 2/4] irqchip/sg2042-msi: rename generic function and structure
Date: Mon, 14 Apr 2025 06:49:13 +0800
Message-ID: <20250413224922.69719-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413224922.69719-1-inochiama@gmail.com>
References: <20250413224922.69719-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the driver logic can be used in both SG2042 and SG2044, it
will be better to have a generic name.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 drivers/irqchip/irq-sg2042-msi.c | 46 ++++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 375b55aa0acd..c9bff7ba693d 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -21,7 +21,7 @@
 
 #define SG2042_MAX_MSI_VECTOR	32
 
-struct sg2042_msi_chipdata {
+struct sg204x_msi_chipdata {
 	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
 
 	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
@@ -33,7 +33,7 @@ struct sg2042_msi_chipdata {
 	struct mutex	msi_map_lock;	// lock for msi_map
 };
 
-static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_req)
+static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
 {
 	int first;
 
@@ -43,7 +43,7 @@ static int sg2042_msi_allocate_hwirq(struct sg2042_msi_chipdata *data, int num_r
 	return first >= 0 ? first : -ENOSPC;
 }
 
-static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwirq, int num_req)
+static void sg204x_msi_free_hwirq(struct sg204x_msi_chipdata *data, int hwirq, int num_req)
 {
 	guard(mutex)(&data->msi_map_lock);
 	bitmap_release_region(data->msi_map, hwirq, get_count_order(num_req));
@@ -51,7 +51,7 @@ static void sg2042_msi_free_hwirq(struct sg2042_msi_chipdata *data, int hwirq, i
 
 static void sg2042_msi_irq_ack(struct irq_data *d)
 {
-	struct sg2042_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data  = irq_data_get_irq_chip_data(d);
 	int bit_off = d->hwirq;
 
 	writel(1 << bit_off, data->reg_clr);
@@ -61,7 +61,7 @@ static void sg2042_msi_irq_ack(struct irq_data *d)
 
 static void sg2042_msi_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
 
 	msg->address_hi = upper_32_bits(data->doorbell_addr);
 	msg->address_lo = lower_32_bits(data->doorbell_addr);
@@ -79,9 +79,9 @@ static const struct irq_chip sg2042_msi_middle_irq_chip = {
 	.irq_compose_msi_msg	= sg2042_msi_irq_compose_msi_msg,
 };
 
-static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
+static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned int virq, int hwirq)
 {
-	struct sg2042_msi_chipdata *data = domain->host_data;
+	struct sg204x_msi_chipdata *data = domain->host_data;
 	struct irq_fwspec fwspec;
 	struct irq_data *d;
 	int ret;
@@ -99,18 +99,18 @@ static int sg2042_msi_parent_domain_alloc(struct irq_domain *domain, unsigned in
 	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
 }
 
-static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
+static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
 					  unsigned int nr_irqs, void *args)
 {
-	struct sg2042_msi_chipdata *data = domain->host_data;
+	struct sg204x_msi_chipdata *data = domain->host_data;
 	int hwirq, err, i;
 
-	hwirq = sg2042_msi_allocate_hwirq(data, nr_irqs);
+	hwirq = sg204x_msi_allocate_hwirq(data, nr_irqs);
 	if (hwirq < 0)
 		return hwirq;
 
 	for (i = 0; i < nr_irqs; i++) {
-		err = sg2042_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
+		err = sg204x_msi_parent_domain_alloc(domain, virq + i, hwirq + i);
 		if (err)
 			goto err_hwirq;
 
@@ -121,25 +121,25 @@ static int sg2042_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
 	return 0;
 
 err_hwirq:
-	sg2042_msi_free_hwirq(data, hwirq, nr_irqs);
+	sg204x_msi_free_hwirq(data, hwirq, nr_irqs);
 	irq_domain_free_irqs_parent(domain, virq, i);
 
 	return err;
 }
 
-static void sg2042_msi_middle_domain_free(struct irq_domain *domain, unsigned int virq,
+static void sg204x_msi_middle_domain_free(struct irq_domain *domain, unsigned int virq,
 					  unsigned int nr_irqs)
 {
 	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
-	struct sg2042_msi_chipdata *data = irq_data_get_irq_chip_data(d);
+	struct sg204x_msi_chipdata *data = irq_data_get_irq_chip_data(d);
 
 	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
-	sg2042_msi_free_hwirq(data, d->hwirq, nr_irqs);
+	sg204x_msi_free_hwirq(data, d->hwirq, nr_irqs);
 }
 
-static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
-	.alloc	= sg2042_msi_middle_domain_alloc,
-	.free	= sg2042_msi_middle_domain_free,
+static const struct irq_domain_ops sg204x_msi_middle_domain_ops = {
+	.alloc	= sg204x_msi_middle_domain_alloc,
+	.free	= sg204x_msi_middle_domain_free,
 	.select	= msi_lib_irq_domain_select,
 };
 
@@ -158,14 +158,14 @@ static const struct msi_parent_ops sg2042_msi_parent_ops = {
 	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
 };
 
-static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
+static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 				   struct irq_domain *plic_domain, struct device *dev)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	struct irq_domain *middle_domain;
 
 	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs, fwnode,
-						    &sg2042_msi_middle_domain_ops, data);
+						    &sg204x_msi_middle_domain_ops, data);
 	if (!middle_domain) {
 		pr_err("Failed to create the MSI middle domain\n");
 		return -ENOMEM;
@@ -182,13 +182,13 @@ static int sg2042_msi_init_domains(struct sg2042_msi_chipdata *data,
 static int sg2042_msi_probe(struct platform_device *pdev)
 {
 	struct fwnode_reference_args args = { };
-	struct sg2042_msi_chipdata *data;
+	struct sg204x_msi_chipdata *data;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *plic_domain;
 	struct resource *res;
 	int ret;
 
-	data = devm_kzalloc(dev, sizeof(struct sg2042_msi_chipdata), GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(struct sg204x_msi_chipdata), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -232,7 +232,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 
 	mutex_init(&data->msi_map_lock);
 
-	return sg2042_msi_init_domains(data, plic_domain, dev);
+	return sg204x_msi_init_domains(data, plic_domain, dev);
 }
 
 static const struct of_device_id sg2042_msi_of_match[] = {
-- 
2.49.0

