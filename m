Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D96D221FC9
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599422; cv=none; b=jagIo+HOs44OPQSTon5GMoPS5AqosWEJkv16rcThT8cP+PPxGZCsRFCACQTkxhLkCzVgD3w+d7xBZTo7btkntP8hEsP/1xCfPd15vZMsbRUTdWcNAkVPxbR2g8m3wagLaCACj3MyucuPNjgXDhx8td5j1jHuCQT3gOYJrgAmUa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599422; c=relaxed/simple;
	bh=8it403lhkvaN3M2kdx0D7sGFD/Y9wx01vswL0y7oAqg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxYqqZxDPpYYUQejmNtzt42s+grz6BQnMd1sKbDPtEKAXE1jg58iCnsTC5lSiytt9GeW2p8yK7nlLVKriX3he8Fzg8w9jpam7GvGLjcjMTrWtXQ7jK99MCrgo0AFiIiEueAuFo4kGZwecepXyH5xkKjgVm7igP91Y0bHeM5eAxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4b7zLd2g58z23jkK;
	Fri, 30 May 2025 18:02:33 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id D35B8140113;
	Fri, 30 May 2025 18:03:36 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:36 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:36 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
	<kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
	<lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
	<shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
	<dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
Date: Fri, 30 May 2025 17:54:25 +0800
Message-ID: <20250530095432.1206966-4-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250530095432.1206966-1-shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)

From: Baihan Li <libaihan@huawei.com>

The local variable of irq name is passed to devm_request_threaded_irq(),
which will make request_irq failed. Using the global irq name instead
of it to fix.

Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 768b97f9e74a..4cdcc34070ee 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -32,7 +32,7 @@
 
 DEFINE_DRM_GEM_FOPS(hibmc_fops);
 
-static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
+static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc-vblank", "hibmc-hpd" };
 
 static irqreturn_t hibmc_interrupt(int irq, void *arg)
 {
@@ -277,7 +277,6 @@ static void hibmc_unload(struct drm_device *dev)
 static int hibmc_msi_init(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	char name[32] = {0};
 	int valid_irq_num;
 	int irq;
 	int ret;
@@ -292,9 +291,6 @@ static int hibmc_msi_init(struct drm_device *dev)
 	valid_irq_num = ret;
 
 	for (int i = 0; i < valid_irq_num; i++) {
-		snprintf(name, ARRAY_SIZE(name) - 1, "%s-%s-%s",
-			 dev->driver->name, pci_name(pdev), g_irqs_names_map[i]);
-
 		irq = pci_irq_vector(pdev, i);
 
 		if (i)
@@ -302,10 +298,10 @@ static int hibmc_msi_init(struct drm_device *dev)
 			ret = devm_request_threaded_irq(&pdev->dev, irq,
 							hibmc_dp_interrupt,
 							hibmc_dp_hpd_isr,
-							IRQF_SHARED, name, dev);
+							IRQF_SHARED, g_irqs_names_map[i], dev);
 		else
 			ret = devm_request_irq(&pdev->dev, irq, hibmc_interrupt,
-					       IRQF_SHARED, name, dev);
+					       IRQF_SHARED, g_irqs_names_map[i], dev);
 		if (ret) {
 			drm_err(dev, "install irq failed: %d\n", ret);
 			return ret;
-- 
2.33.0

