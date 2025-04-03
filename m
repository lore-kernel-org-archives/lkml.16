Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B9619E97C;
	Thu,  3 Apr 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743683433; cv=none; b=h/WWIR0Lnu+syJZOzXjwZxJ+gAhO+Qr3m99et2wy40ej88tdlbM3Y10wfg/wFPn3H0cwWYqub2WObdQfBrpca6JG9tzh8sKsCTwZNzsYWPnffTahJNtf5RNRLV3paHFB9cO6moXaf1SQU2kqlUSyqtdIj1shwLBastDpE1IDe/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743683433; c=relaxed/simple;
	bh=l8d45MOAJqQaKSZET+6WBscFEKepqap7VURFSXH1eWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bToJDdbTGuNxa2Rd+TIXciTIiiPCne2b5lC6Y7FiQosnzOvXX84W5CzBz1k11sZkxh4LHJ+vAtk8gFtnFMe97rrc3JDQP4NFWHbTimjrGO0XKD0ZyrYwYENXX4ODyksI4iIHU8xRyZbX0gFiAnFEtmMZmkj48lI/IKqY/8gkaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=xwenWuPl; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="xwenWuPl"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BW8nE010585;
	Thu, 3 Apr 2025 14:30:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	XU+axVzB2LWANk6CATV5cEHkuzcB8twTOz2qnMVk0Jc=; b=xwenWuPlgN1FH83r
	ijJ0qWC0Xr2G0u4jAQQjQRcxjn1guTplkr9eYScbYturrp5qDTUWfPCIx1RWPSXi
	G9V45EkOdlIoNl4pqiWGK0dp4lrNcAfB4pJhKvhZ6mIYYAVxDBKZBTXbLdP/RNRJ
	a7G48S+yIa47kVRUnx+c/yHpfo6bznnsGYyhncr5zdSq+I5rFhW3n8Ax/2C5vFIT
	RqDIcnHMIjJMaKIlIVs3pQkm7NmhWP1dixwD6azQZ/mOSlNUY6NGuxUze8X3y0mp
	SHnYPZsIdv7AffMCwVwE/Ak3HkdqaFTTPnDq+sgMnbqoompXe9X6gPaD3yzHixfK
	Gr3o/A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2ctee9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:30:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 51EE64004A;
	Thu,  3 Apr 2025 14:29:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CCF48EEC93;
	Thu,  3 Apr 2025 14:28:33 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:28:33 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <maz@kernel.org>, <tglx@linutronix.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 2/3] irqchip/gic: Use 0x10000 offset to access GICC_DIR on STM32MP2
Date: Thu, 3 Apr 2025 14:28:04 +0200
Message-ID: <20250403122805.1574086-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01

When GIC_4KNOT64K bit in the GIC configuration register is
0 (64KB), address block is modified in such a way than only the
first 4KB of the GIC cpu interface are accessible with default
offsets.
With this bit mapping GICC_DIR register is accessible at
offset 0x10000 instead of 0x1000, thus remap accordingly

Use st,stm32mp2-cortex-a7-gic for this purpose.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 drivers/irqchip/irq-gic.c | 47 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 6503573557fd..d61dcd0eb4c6 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -72,6 +72,7 @@ struct gic_chip_data {
 	union gic_base cpu_base;
 	void __iomem *raw_dist_base;
 	void __iomem *raw_cpu_base;
+	phys_addr_t cpu_phys_base;
 	u32 percpu_offset;
 #if defined(CONFIG_CPU_PM) || defined(CONFIG_ARM_GIC_PM)
 	u32 saved_spi_enable[DIV_ROUND_UP(1020, 32)];
@@ -108,6 +109,8 @@ static DEFINE_RAW_SPINLOCK(cpu_map_lock);
 
 #endif
 
+static DEFINE_STATIC_KEY_FALSE(gic_stm32mp2_gicc_dir_access);
+
 static DEFINE_STATIC_KEY_FALSE(needs_rmw_access);
 
 /*
@@ -225,6 +228,8 @@ static void gic_eoi_irq(struct irq_data *d)
 	writel_relaxed(hwirq, gic_cpu_base(d) + GIC_CPU_EOI);
 }
 
+#define GIC_STM32MP2_CPU_DEACTIVATE 0x10000
+
 static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
@@ -236,7 +241,10 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 	if (hwirq < 16)
 		hwirq = this_cpu_read(sgi_intid);
 
-	writel_relaxed(hwirq, gic_cpu_base(d) + GIC_CPU_DEACTIVATE);
+	if (static_branch_unlikely(&gic_stm32mp2_gicc_dir_access))
+		writel_relaxed(hwirq, gic_cpu_base(d) + GIC_STM32MP2_CPU_DEACTIVATE);
+	else
+		writel_relaxed(hwirq, gic_cpu_base(d) + GIC_CPU_DEACTIVATE);
 }
 
 static int gic_irq_set_irqchip_state(struct irq_data *d,
@@ -1377,17 +1385,50 @@ static bool gic_enable_rmw_access(void *data)
 	return false;
 }
 
+/*
+ * 8kB GICC range is not accessible with the default 4kB translation
+ * granule. 0x1000 offset is accessible at 64kB translation.
+ */
+static bool gic_8kbaccess(void *data)
+{
+	struct gic_chip_data *gic = data;
+	void __iomem *alt;
+
+	if (!is_hyp_mode_available())
+		return false;
+
+	alt = ioremap(gic->cpu_phys_base, GIC_STM32MP2_CPU_DEACTIVATE + 4);
+	if (!alt) {
+		pr_err("Unable to remap GICC_DIR register\n");
+		return false;
+	}
+
+	iounmap(gic->raw_cpu_base);
+	gic->raw_cpu_base = alt;
+
+	static_branch_enable(&gic_stm32mp2_gicc_dir_access);
+
+	return true;
+}
+
 static const struct gic_quirk gic_quirks[] = {
 	{
 		.desc		= "broken byte access",
 		.compatible	= "arm,pl390",
 		.init		= gic_enable_rmw_access,
 	},
+	{
+		.desc		= "4kB GICC access disabled",
+		.compatible	= "st,stm32mp2-cortex-a7-gic",
+		.init		= gic_8kbaccess,
+	},
 	{ },
 };
 
 static int gic_of_setup(struct gic_chip_data *gic, struct device_node *node)
 {
+	struct resource cpuif_res;
+
 	if (!gic || !node)
 		return -EINVAL;
 
@@ -1395,6 +1436,8 @@ static int gic_of_setup(struct gic_chip_data *gic, struct device_node *node)
 	if (WARN(!gic->raw_dist_base, "unable to map gic dist registers\n"))
 		goto error;
 
+	of_address_to_resource(node, 1, &cpuif_res);
+	gic->cpu_phys_base = cpuif_res.start;
 	gic->raw_cpu_base = of_iomap(node, 1);
 	if (WARN(!gic->raw_cpu_base, "unable to map gic cpu registers\n"))
 		goto error;
@@ -1510,6 +1553,7 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	gic_cnt++;
 	return 0;
 }
+
 IRQCHIP_DECLARE(gic_400, "arm,gic-400", gic_of_init);
 IRQCHIP_DECLARE(arm11mp_gic, "arm,arm11mp-gic", gic_of_init);
 IRQCHIP_DECLARE(arm1176jzf_dc_gic, "arm,arm1176jzf-devchip-gic", gic_of_init);
@@ -1519,6 +1563,7 @@ IRQCHIP_DECLARE(cortex_a7_gic, "arm,cortex-a7-gic", gic_of_init);
 IRQCHIP_DECLARE(msm_8660_qgic, "qcom,msm-8660-qgic", gic_of_init);
 IRQCHIP_DECLARE(msm_qgic2, "qcom,msm-qgic2", gic_of_init);
 IRQCHIP_DECLARE(pl390, "arm,pl390", gic_of_init);
+IRQCHIP_DECLARE(stm32mp2_cortex_a7_gic, "st,stm32mp2-cortex-a7-gic", gic_of_init);
 
 #ifdef CONFIG_ACPI
 static struct
-- 
2.34.1

