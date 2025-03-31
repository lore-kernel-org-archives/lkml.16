Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B731D5CFB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407424; cv=none; b=Jl4h7zJQs+sBh47SAME9MO04zma+34usGFgQvCNcIMgILTD+78h4BuxCQd53eGDuKpexCNvb9lQptWz1diKRkJSREJApKFjov8awDvjON+Gby4AH5Ht+O0gB9VQZ7TlxRLVbb6tWJXDB7eME2A9VT4kAPryG/YaK70v17whxsr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407424; c=relaxed/simple;
	bh=AuhnF22lBIPI4J8+aDvGKlxpt8YZz4FYBxTZj4hFY/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0mhgmFghOm793RhpcCSbXsJJE5MsE4MWxHURwn7jzjX5t//XaJ7QRgvqtQmBkQ7mJun91hC2s3qPD1z+K3bqAXf6Tdg73IsWRJkBnSMCXz4nf3oFr5/rSCoBxAcf3S5tqnFieCDpjgfeDx/FJX7CQVkqubYR1ObZ7UAB/STFgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZR38G3nnHz1jBX4;
	Mon, 31 Mar 2025 15:45:34 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
	by mail.maildlp.com (Postfix) with ESMTPS id F376B140120;
	Mon, 31 Mar 2025 15:50:19 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 31 Mar 2025 15:50:18 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
	<shenjian15@huawei.com>, <shaojijie@huawei.com>,
	<jani.nikula@linux.intel.com>, <dmitry.baryshkov@oss.qualcomm.com>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 drm-dp 8/9] drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
Date: Mon, 31 Mar 2025 15:42:11 +0800
Message-ID: <20250331074212.3370287-9-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250331074212.3370287-1-shiyongbang@huawei.com>
References: <20250331074212.3370287-1-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500013.china.huawei.com (7.221.188.12)

From: Baihan Li <libaihan@huawei.com>

To realize HPD feature, request irq for HPD , add its handler function.
We use pci_alloc_irq_vectors() to get our msi irq, because we have two
interrupts now.

Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
ChangeLog:
v4 -> v5:
  - remove pci_disable_msi() in hibmc_unload()
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 74 +++++++++++++++----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  3 +
 3 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
index 5614b727a710..394b1e933c3a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
@@ -99,6 +99,9 @@
 
 #define HIBMC_DP_TIMING_SYNC_CTRL		0xFF0
 
+#define HIBMC_DP_INTSTAT			0x1e0724
+#define HIBMC_DP_INTCLR				0x1e0728
+
 /* dp serdes reg */
 #define HIBMC_DP_HOST_OFFSET		0x10000
 #define HIBMC_DP_LANE0_RATE_OFFSET	0x4
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 98b01c8aee8e..768b97f9e74a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -32,6 +32,8 @@
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
+static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
+
 static irqreturn_t hibmc_interrupt(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
@@ -49,6 +51,22 @@ static irqreturn_t hibmc_interrupt(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t hibmc_dp_interrupt(int irq, void *arg)
+{
+	struct drm_device *dev = (struct drm_device *)arg;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	u32 status;
+
+	status = readl(priv->mmio + HIBMC_DP_INTSTAT);
+	if (status) {
+		priv->dp.irq_status = status;
+		writel(status, priv->mmio + HIBMC_DP_INTCLR);
+		return IRQ_WAKE_THREAD;
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int hibmc_dumb_create(struct drm_file *file, struct drm_device *dev,
 			     struct drm_mode_create_dumb *args)
 {
@@ -251,15 +269,48 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
 	return 0;
 }
 
-static int hibmc_unload(struct drm_device *dev)
+static void hibmc_unload(struct drm_device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
-
 	drm_atomic_helper_shutdown(dev);
+}
 
-	free_irq(pdev->irq, dev);
+static int hibmc_msi_init(struct drm_device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	char name[32] = {0};
+	int valid_irq_num;
+	int irq;
+	int ret;
 
-	pci_disable_msi(to_pci_dev(dev->dev));
+	ret = pci_alloc_irq_vectors(pdev, HIBMC_MIN_VECTORS,
+				    HIBMC_MAX_VECTORS, PCI_IRQ_MSI);
+	if (ret < 0) {
+		drm_err(dev, "enabling MSI failed: %d\n", ret);
+		return ret;
+	}
+
+	valid_irq_num = ret;
+
+	for (int i = 0; i < valid_irq_num; i++) {
+		snprintf(name, ARRAY_SIZE(name) - 1, "%s-%s-%s",
+			 dev->driver->name, pci_name(pdev), g_irqs_names_map[i]);
+
+		irq = pci_irq_vector(pdev, i);
+
+		if (i)
+			/* PCI devices require shared interrupts. */
+			ret = devm_request_threaded_irq(&pdev->dev, irq,
+							hibmc_dp_interrupt,
+							hibmc_dp_hpd_isr,
+							IRQF_SHARED, name, dev);
+		else
+			ret = devm_request_irq(&pdev->dev, irq, hibmc_interrupt,
+					       IRQF_SHARED, name, dev);
+		if (ret) {
+			drm_err(dev, "install irq failed: %d\n", ret);
+			return ret;
+		}
+	}
 
 	return 0;
 }
@@ -291,15 +342,10 @@ static int hibmc_load(struct drm_device *dev)
 		goto err;
 	}
 
-	ret = pci_enable_msi(pdev);
+	ret = hibmc_msi_init(dev);
 	if (ret) {
-		drm_warn(dev, "enabling MSI failed: %d\n", ret);
-	} else {
-		/* PCI devices require shared interrupts. */
-		ret = request_irq(pdev->irq, hibmc_interrupt, IRQF_SHARED,
-				  dev->driver->name, dev);
-		if (ret)
-			drm_warn(dev, "install irq failed: %d\n", ret);
+		drm_err(dev, "hibmc msi init failed, ret:%d\n", ret);
+		goto err;
 	}
 
 	/* reset all the states of crtc/plane/encoder/connector */
@@ -375,7 +421,7 @@ static void hibmc_pci_remove(struct pci_dev *pdev)
 
 static void hibmc_pci_shutdown(struct pci_dev *pdev)
 {
-	drm_atomic_helper_shutdown(pci_get_drvdata(pdev));
+	hibmc_pci_remove(pdev);
 }
 
 static const struct pci_device_id hibmc_pci_table[] = {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index daed1330b961..274feabe7df0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -22,6 +22,9 @@
 
 #include "dp/dp_hw.h"
 
+#define HIBMC_MIN_VECTORS	1
+#define HIBMC_MAX_VECTORS	2
+
 struct hibmc_vdac {
 	struct drm_device *dev;
 	struct drm_encoder encoder;
-- 
2.33.0

