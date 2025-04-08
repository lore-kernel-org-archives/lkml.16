Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D8325F97F;
	Tue,  8 Apr 2025 05:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088559; cv=none; b=uKlCJdXcPxwFf4WvCoGre9I1ggejamW+y/QWamI5LV4Gi4OMnqjR7qzzoFWl4RqJ6r+U80RbGcdbvedgsnOiEQ14Hb9c62plVMEoaKnasq3sD22JjogPkQLdKAkpmSUyLRev5DintvEcqtQxBKCRHdVFyqAx9ciPtWR+d+0h7Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088559; c=relaxed/simple;
	bh=Oq1lh2FidiUj+CDMswoihJoIU0QAggXbvuD/Q3vI8iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tD1daGVjzZBzgluvSfQj2WMKevk1TyloPSNIE5fOEq+kU8siAWR9wvi5gV1A/pwH0nKxjgpQVPmMzZEMJA9kFkP7znNpP6rmZyc36IDwpt3RsoOYbup2DKRQdeIdDS72fj5rUUVlPKIcv4ddsSdyGpysgjj83lWEvlnsDU6+Pdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeYbYLqf; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeYbYLqf"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47686580529so54500051cf.2;
        Mon, 07 Apr 2025 22:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088556; x=1744693356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT2kEHZNr8vj+MYz0JWD8nBGI5CPzRybb8apCu1RJBQ=;
        b=eeYbYLqfxI4f19TLfOM16g3nuwdFrfHLpn93BjLjzDWoFaAB4sq8VTIO+q+lMzdklS
         aBJsZSGefXrHngBtKmpaUVUpO0V3NGfsG+SfEseUww1haPduUjA5AsDUiOF4w8/zyPLC
         gXX/VEGaLNgcLCgYrShagLieMvX96fmHW3OzBPMfvBKmX7Wx9MxyTTVSnRdXMo2BkzKh
         +xYmeRzzCLSPJH29MyzZeQ9q9gEK7rvthyBY7NakBzgGJlEPf/lw8gLH6vw0Pghv5j8s
         SDH7jwjYhlHxziVc+RnRzrGOAwVyWrqX57bw07abMkfw2uiO2v0iGNkOyIJsZjF1+T6G
         sH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088556; x=1744693356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT2kEHZNr8vj+MYz0JWD8nBGI5CPzRybb8apCu1RJBQ=;
        b=UZUuzk/BGvvrsuiHmw7ka9JwAVKlZzVRlg/tKZ061tmAGOsOJbElGIFUyjZepHej+N
         Djqhk5Y2iuV3gyVE9TQKzbQ++hXQs4f6IW3BkDdL/P2JqJjtTHuJLcEVCYAvoDqK7/op
         XhuFz3fMKAPveTF/mPVMwxsnRty6PEbFAXbB5Cac68p3cr5q8cQg8HR8KmnEQhaSs85z
         H1o+Vv/UYMQttbqIv1dc4xvDm6CQclSzmiqZauqyZ0KGpByTw88vrC4DDRwjVN8K5k0N
         HVK/ykCGIpd5DtjL27roZS3Kc0QqZR231btnwrhWfpuRj56fuzDF7wgGUaFySNHYzUJD
         g5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9LhFtBAAcViRWXaw0+cWNY1PBnv9m2hLYNKmj0iLd5v6Mj3P3xwpHfmXQ2V9/VznIBs/uNaHH185q@vger.kernel.org
X-Gm-Message-State: AOJu0YyJlqiL7hDNFvItT+ckaK1avZ7KCpRvsBVXXDsOaTSuL4FO7HXW
	KRLcK7oyhd3DWYMKiU76F1gNjscq3oXltitmz+2BIBazygrYMjjC
X-Gm-Gg: ASbGncthDH/PuaBugYvOnqHuLELuR5k6gofPhf7CH1znRfLmX5UVAIatXfVtwQ0pTGI
	g4b2FfviIZJ29vucmpl1h4GTiBRcEy/vHY0o7MOICXP+PSV2nOA4X1vVlW2f29xiwD1ocx/zMIR
	Ey+EMiBpuCrpNYlzEKMBQ1UsdXFvqAROgf1/kE8g4hxMYecgApJI10hBEWdavXkZLlDNV374AYV
	yelFui/NMcdrGNCNH1L7BBvcVmIgdoKVyCnE5OnYkT+tC3QcUZM/K5K7EPQHRTxiRAKkJdHvPeM
	xL/5Gu2ht7yywF3DHN82
X-Google-Smtp-Source: AGHT+IHKQdDyX2EWqDCC0KPGFHJefe6z6b/F493fgqH+xcZ9kE/993aaMVDs+OqtFcPoheNjVn78eA==
X-Received: by 2002:ac8:5983:0:b0:476:b858:1f2d with SMTP id d75a77b69052e-47925a2b53dmr221525031cf.42.1744088556512;
        Mon, 07 Apr 2025 22:02:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4791b057e6csm70841471cf.13.2025.04.07.22.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:36 -0700 (PDT)
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
Subject: [PATCH v3 3/4] irqchip/sg2042-msi: introduce configurable chipinfo for sg2042
Date: Tue,  8 Apr 2025 13:01:44 +0800
Message-ID: <20250408050147.774987-4-inochiama@gmail.com>
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

As the controller on SG2044 uses different msi_parent_ops and irq_chip,
it is necessary to add a structure to hold the configuration across
controllers.

Add the chipinfo structure and implement necessary logic for it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 44 ++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index c9bff7ba693d..30a1d2bfd474 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -21,16 +21,33 @@
 
 #define SG2042_MAX_MSI_VECTOR	32
 
+struct sg204x_msi_chip_info {
+	const struct irq_chip		*irqchip;
+	const struct msi_parent_ops	*parent_ops;
+};
+
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
 
 	DECLARE_BITMAP(msi_map, SG2042_MAX_MSI_VECTOR);
-	struct mutex	msi_map_lock;	// lock for msi_map
+	struct mutex				msi_map_lock;
+
+	const struct sg204x_msi_chip_info	*chip_info;
 };
 
 static int sg204x_msi_allocate_hwirq(struct sg204x_msi_chipdata *data, int num_req)
@@ -115,7 +132,7 @@ static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned in
 			goto err_hwirq;
 
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &sg2042_msi_middle_irq_chip, data);
+					      data->chip_info->irqchip, data);
 	}
 
 	return 0;
@@ -174,7 +191,7 @@ static int sg204x_msi_init_domains(struct sg204x_msi_chipdata *data,
 	irq_domain_update_bus_token(middle_domain, DOMAIN_BUS_NEXUS);
 
 	middle_domain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
-	middle_domain->msi_parent_ops = &sg2042_msi_parent_ops;
+	middle_domain->msi_parent_ops = data->chip_info->parent_ops;
 
 	return 0;
 }
@@ -192,6 +209,12 @@ static int sg2042_msi_probe(struct platform_device *pdev)
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
@@ -235,8 +258,13 @@ static int sg2042_msi_probe(struct platform_device *pdev)
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

