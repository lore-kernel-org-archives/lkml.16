Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7481E98E0;
	Sun, 13 Apr 2025 22:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584618; cv=none; b=a93snQLcikyUIr5HYXdFuRYKdSk53len8ufI4g6hsgv+TA8/47+sB3F2NvK958MhKpsInkN05JE1YDZw2ve3kgoyROdBvT+qF0AEv3FXC3UhdJ7DFQvBVrGwMsZ+QijclCJwTLrwh9WXloQ1juYqcvcA+8H/+0BNq3wI0lR4AtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584618; c=relaxed/simple;
	bh=TvussfnRfYLYN7bMCiS4qcHL2BvUF7ky1QmPmFU0WC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjMjJJLl/P6SENDqX5XFdFW/9b5qHDdGA/f0+83VgXz8GKpfd10Di5FrfeNjq9CE3p/3qqYBW1Lk5x2DRgXjxX03zwJGOWLOYTTJ8J12JRYXuW/JgVpKCEKy33upEXgsyDf9fsWVIW6Q8LPhmMhB00XL8G20U9ZoBF4iOgdevZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Seiu6yXw; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Seiu6yXw"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad74483fso40823576d6.1;
        Sun, 13 Apr 2025 15:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584615; x=1745189415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNuAwK5l1qg5eZzpnXcElimfuBDVA1SQBHeuFqgCLXY=;
        b=Seiu6yXwU+W4smzimWo92Z3UXUWyI3AiJBN5KdNej3/IIu0O4BK0VFoWxq9UTpc7Vz
         S/11bOQwpQbrKPP53s8mK6J3Ym6OdSlRu/BdAMH7IiVq4NsAsbMFa/LKgEeun5M9mb00
         Gwk5dgzHVdZ3zV68vaESfSUcoJzEO9+1ICbY5a/8Hj60Ffh/741/ewCvhy77mlg+m8lL
         Ajn63ozeB0otlhgLxkwblyAoct94sLxrjI/51Ur/o5SLF92EputSE+RvA7SVyzeO7YHX
         OhRqAlh7HwKe/GrGmC7NvpiaMZhh8MTJfuOJVGFnmQJ+O6Sz7KpSXsnQckKbIA5/EJFY
         kI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584615; x=1745189415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNuAwK5l1qg5eZzpnXcElimfuBDVA1SQBHeuFqgCLXY=;
        b=PBYUUpKBWbbPnuUXzPxbEbsViz+5x/JsNQl5NQ0ufa96hIBxr9YC07AxktOKzEnCW8
         lvIXQ4dv+ZLwKeYgTt6B40eCG5XyIsEplhcZj0RS/maliE1xNJvLboWI4kmGG+GMyIye
         K2TJvr1IIFxN0208RH0kXNpHdI49Mup42su7rBRG/3Rd1McrHd8YJqXnvIOVJjjkDNu0
         6u2nIEvRTDnX+eO3HEahrW9WW5J4pplr8G8Si3J+VgYDm72h+JUzI1WsaNxptTMassXQ
         p7bGkrz4JyK5RTsPTZAZPDOdMMIpXKGcA11eHuR8mqRoPNmqmmzOrjJW3sVYzSTmZKQQ
         LuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqYpDrqBQMXfAXqCik+iNdCz7F+FzzmW47aXtrKSQ4mmhgYuyt5iPJ/A1/Yc96pcDNhjuahbW3LgEg@vger.kernel.org
X-Gm-Message-State: AOJu0YzWN+rSJJvGzyRiPJ69GYnHuughkGvBASBILocFscpxg3xHm9jc
	BZkyAyDMdWc8MKXOmRENBHjsR3ypsBJ+GoKgddCFNCqmAbqtNWoE
X-Gm-Gg: ASbGnctyWMLBHlYHiqDDjgr7yelM8zEk4bW4SNYItBSWqPnlNAsTI23b6FbYJC9echL
	241mvN37Smh7Mf6IzG6rlN34xlCT339uke3RgNvidOa4V9v2b4uaE2zr3ojgIcCAEB2pwQNThDH
	yaviWTrVajgSAv6v7N3u7u91/QfPUa/Vf3VeVfPPdkxYAjMxRLmCY5QoH9tZHz81gol39dBze2W
	er4brP3+DIPxlRiV/G5pkOEcb6h+I+iQE7gAYE+P4APddLCJINruuJYbIeeTzTAxLyYqGm9MlOt
	FciHRTwUiobhkwlv
X-Google-Smtp-Source: AGHT+IHRHcxaQs9JOgRbASUfsmCG+mgKORamgJ6TgwFCiz5A/92qYj0zVZrm7+cqXUE9dwCrha9Ddg==
X-Received: by 2002:a05:6214:1252:b0:6e8:ee44:ce9f with SMTP id 6a1803df08f44-6f230d72b03mr159468186d6.20.1744584614751;
        Sun, 13 Apr 2025 15:50:14 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de982674sm71540476d6.67.2025.04.13.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:14 -0700 (PDT)
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
Subject: [PATCH v4 3/4] irqchip/sg2042-msi: introduce configurable chipinfo for sg2042
Date: Mon, 14 Apr 2025 06:49:14 +0800
Message-ID: <20250413224922.69719-4-inochiama@gmail.com>
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

As the controller on SG2044 uses different msi_parent_ops and irq_chip,
it is necessary to add a structure to hold the configuration across
controllers.

Add the chipinfo structure and implement necessary logic for it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
---
 drivers/irqchip/irq-sg2042-msi.c | 52 ++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index c9bff7ba693d..1001c1117b00 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -19,18 +19,33 @@
 
 #include "irq-msi-lib.h"
 
-#define SG2042_MAX_MSI_VECTOR	32
+struct sg204x_msi_chip_info {
+	const struct irq_chip		*irqchip;
+	const struct msi_parent_ops	*parent_ops;
+};
 
+/**
+ * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
+ * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+ * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
+ * @irq_first:		First vectors number that MSIs starts
+ * @num_irqs:		Number of vectors for MSIs
+ * @msi_map:		mapping for allocated MSI vectors.
+ * @msi_map_lock:	Lock for msi_map
+ * @chip_info:		chip specific infomations
+ */
 struct sg204x_msi_chipdata {
-	void __iomem	*reg_clr;	// clear reg, see TRM, 10.1.33, GP_INTR0_CLR
+	void __iomem				*reg_clr;
 
-	phys_addr_t	doorbell_addr;	// see TRM, 10.1.32, GP_INTR0_SET
+	phys_addr_t				doorbell_addr;
 
-	u32		irq_first;	// The vector number that MSIs starts
-	u32		num_irqs;	// The number of vectors for MSIs
+	u32					irq_first;
+	u32					num_irqs;
 
-	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
-	struct mutex	msi_map_lock;	// lock for msi_map
+	unsigned long				*msi_map;
+	struct mutex				msi_map_lock;
+
+	const struct sg204x_msi_chip_info	*chip_info;
 };
 
 static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
@@ -115,7 +130,7 @@ static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
 			goto err_hwirq;
 
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &sg2042_msi_middle_irq_chip, data);
+					      data->chip_info->irqchip, data);
 	}
 
 	return 0;
@@ -174,7 +189,7 @@ static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
 
 	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
+	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
 
 	return 0;
 }
@@ -192,6 +207,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	data->chip_info = device_get_match_data(&pdev->dev);
+	if (!data->chip_info) {
+		dev_err(&pdev->dev, "Failed to get irqchip\n");
+		return -EINVAL;
+	}
+
 	data->reg_clr = devm_platform_ioremap_resource_byname(pdev, "clr");
 	if (IS_ERR(data->reg_clr)) {
 		dev_err(dev, "Failed to map clear register\n");
@@ -232,11 +253,22 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 
 	mutex_init(&data->msi_map_lock);
 
+	data->msi_map = devm_bitmap_zalloc(&pdev->dev, data->num_irqs, GFP_KERNEL);
+	if (!data->msi_map) {
+		dev_err(&pdev->dev, "Unable to allocate msi mapping\n");
+		return -ENOMEM;
+	}
+
 	return sg204x_msi_init_domains(data, plic_domain, dev);
 }
 
+static const struct sg204x_msi_chip_info sg2042_chip_info = {
+	.irqchip	= &sg2042_msi_middle_irq_chip,
+	.parent_ops	= &sg2042_msi_parent_ops,
+};
+
 static const struct of_device_id sg2042_msi_of_match[] = {
-	{ .compatible	= "sophgo,sg2042-msi" },
+	{ .compatible	= "sophgo,sg2042-msi", .data	= &sg2042_chip_info },
 	{ }
 };
 
-- 
2.49.0

