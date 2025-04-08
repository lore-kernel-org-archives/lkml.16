Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1408525F963;
	Tue,  8 Apr 2025 05:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088555; cv=none; b=VvZL5hI/9nde4gdpm/kqB9IRI9U7aXUrCn2sCtvu1kBpeQVP+l6fQuiTsqxhNgiy3jUYxXNMitxjkzfogXsWElVGs0oUShIjgUkIfH7RDSSYzE4Q9Zj6CgC9sLyxbqpiWF1cmbKN1D6YdzMM7zCzogoeBiDs1+8E+IuVmrvWVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088555; c=relaxed/simple;
	bh=WkXs5mmhFEGPv/gyC3VgcUbcfCocLQ1q+xN1K/I8jHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIMSVtM8ERT1BF7cQ0ZBXpFWDy/QYFGTRP7hRzGP2CbulDASWtE8ifmrTvu8COLzNnb9EA+OOnTU8IejD13zsydYItddyZTMuRQe09kgZFH6gp8zHMClelkqqD+H5j8un1V+zNbrfQodLhPhmNL57k7pStrCndb0XMJ/agNhO2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gK5WY9Mn; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gK5WY9Mn"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8fb83e137so47203136d6.0;
        Mon, 07 Apr 2025 22:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088553; x=1744693353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFI4oBOICp8WPg8UKe09xaY2SH1Wj5DzXn6kXmiskgI=;
        b=gK5WY9MnkJs6JcVPgYsjwCyXUrWasRB9X0+v6js250fIBuPgE6qKpUKDsm7VInH/UU
         Vsg0YqByaJGIiwPLTr27EUqgQcMRjFYGG93UQ2w1wH4hn8UdGhZ8JlXlNttWva6MNVjZ
         b4DdeZKz+8Bx5R80K4fNUTUNmHbI4xfi0j/HY+1/FuipSBv+ujXZU74yxpM1kVK6863K
         Q3qHViUHzpj3SS8iC7LbqtAIM3ClLSZPddVM46kqsJrEwOchL88llSFvg3GBUljD4fKF
         5xB3mjqnYaUaYrSHus886euEHVIfnWnwV+9A+Wf2ekgODKUI62PQb9mdkb3L9R4VKv6N
         AWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088553; x=1744693353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFI4oBOICp8WPg8UKe09xaY2SH1Wj5DzXn6kXmiskgI=;
        b=YTJOLBCslPDd54uaUv/dmNtwgvUCthV1iFtAksrVU60U7eisrs09BcDZFKem8UnbT7
         ueY8IrciP97+KJhlvtVXepWyZzCKguXSkLc2end3SIRhmECGrUFJYndAy+brKaSmGXEH
         TEaRYlxgPI/OL+ZUZCVmpEXP5z9uIMXKt/EXhZtNUP5gATtBNEch3+kI6SQbghW653gX
         PRtft08dP5JE94yptp640okMPoyGIhOQkP7oPIcl2n+2QzvrPf6iBQiYtCm/ARcHoYIG
         g5EeTZJEV/3VTipXdoJXARCaItUfd1YijZCelTGxHi2v2xG7y/4Vk9bSycGsurMBgsVL
         qG8w==
X-Forwarded-Encrypted: i=1; AJvYcCW0qG9bWiDxTCy0qjwPWS2TfpR0G124DrLXPL51L1sfA1xq+PeGywJdeDgCYd7SIcyBxxm03Fyu3IyL@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5tgu2lSbvhlNYY2vGrRaVLKIqVc/Tp+NhMgaFa6DDfA4CyjR
	QjTjo7OgGWnKLjYq4M9fuTKTPTuCC2UyNTf6heEw/3awG2BW9Byf
X-Gm-Gg: ASbGnctWvjG6VWuiF1/+9tYPnB5bwMS0voXsZuifxgKgR+IWkf+VukZ0ePAhNWiCo+t
	1d4FlYwz10XVcA6XwAK0KdjVyPcvbN1XYMDb9wJ/65OrWfthI+aVUVxuNPLUG54krkMiX5APwe3
	IFqtXAgLDfXqUxKbOrPaLGIg4lLo79L/3ckTZjnXyiZSreT96zLi38akKV4bMvjTMn/WjRkBK5j
	C0jaDnef11ULIfGvp2XXRtGK0OHU2RUI4lPpQWacnGHDf0I8eV5MKzplgsZc5BLU9Mlzl7ugvN4
	ULRIwMkvoDYWuzfJ/ZFR
X-Google-Smtp-Source: AGHT+IGa/AWYSqVZnSUX2M3V6wUqu38PIrP+CCv9/Z5IHSzVs5zNOQUhyQ4p1L+c7R8LGhaOf+3cDA==
X-Received: by 2002:ad4:5ae4:0:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6f0b74a50ecmr224086866d6.27.1744088552936;
        Mon, 07 Apr 2025 22:02:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76eab1659sm705629885a.115.2025.04.07.22.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:32 -0700 (PDT)
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
Subject: [PATCH v3 2/4] irqchip/sg2042-msi: rename generic function and structure
Date: Tue,  8 Apr 2025 13:01:43 +0800
Message-ID: <20250408050147.774987-3-inochiama@gmail.com>
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

As the driver logic can be used in both SG2042 and SG2044, it
will be better to have a generic name.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
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

