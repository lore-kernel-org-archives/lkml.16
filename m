Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8092853F6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241361; cv=none; b=uai3PSkGl3VmJNW6zUzoG9m9yWBrLQJngrHqizkkjRl8trkBeyOGfu9eD573zfr7I5FIMOH29oK7pcFDXygUjwpEBGTwu0T925eX801nZ/cGG546gbN5FfCWfIxtGdRM1E5m9gBupHIzUSaHw3gBoNzBOnz5CcYzCAf5WW4mu60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241361; c=relaxed/simple;
	bh=1tJ2d/lN3+UrL4g9qzU73LtY+bAG6q0wkYciipeCLQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gj3tFgYJfx7Tn2Hcuh72vMiTb2PQSC5K8+C+a3n/m/BS1fp+yZQE6PcYqZP1gVC8/Nk6VbSLVv64uAWvExGwjGavCxKwS7b8HWe8WjrK7IhumW20MrM0hjQsAUn1gTD6NAwz3cU0kUrrYBorlk2VVq/S5FwxZs5nmVpNhCqWKo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W94xfTtI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W94xfTtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750241359; x=1781777359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1tJ2d/lN3+UrL4g9qzU73LtY+bAG6q0wkYciipeCLQI=;
  b=W94xfTtIgxdCrJZrjyjtCNCe2rPv/F/zfPKXghKLsBf7LmSnsUzYcQV5
   5P6fdaSwGzrcxMVeP+P/i6srMi8GAQzZ6PhA5ICPHvh0C91YqkCW8Uf72
   OIA2IglygV/68okFf08GPPSHm7xYvPq9NaX6i1+hzWyY1Rlxi4CaU4cIE
   oxkOnhGXM7i8HjdmrbzNwqsQqZR/I9Fvoab7PUsvKvPvBk5i5PyNAEYo8
   79fL2IVoqRntof1blhK7ANhEWfyx7239IxKIUrdR0+ZUKI6S2synxs9og
   TCcUL+s3abpNLZJYtxkMy16Oi82n36OE6S1GPB857yNKNJ5P40X1PTCfI
   w==;
X-CSE-ConnectionGUID: +I0N1zQLSj6JnCN6prB+ng==
X-CSE-MsgGUID: qDwTbluqTUiyy7weNm6V7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52591001"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52591001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:09 -0700
X-CSE-ConnectionGUID: 00G6yquTS+6Z+WF2zuOo3A==
X-CSE-MsgGUID: wymknRrNQaGuuhP9cH/cdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149461193"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:07 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next 1/3] mei: refcount mei_device
Date: Wed, 18 Jun 2025 12:54:31 +0300
Message-ID: <20250618095433.3943546-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618095433.3943546-1-alexander.usyskin@intel.com>
References: <20250618095433.3943546-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mei_device lifetime is managed by devm procedure of parent device.
But such memory is freed on device_del.
Mei_device object is used by client object that may be alive after
parent device is removed.
It may lead to use-after-free if discrete graphics driver
unloads mei_gsc auxiliary device while user-space holds
open handle to mei character device.

Replace devm lifetime management with reference counting
to eliminate the use-after-free.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/bus.c          | 10 +++++++---
 drivers/misc/mei/gsc-me.c       |  6 ++++--
 drivers/misc/mei/hw-me.c        |  2 +-
 drivers/misc/mei/hw-txe.c       |  2 +-
 drivers/misc/mei/init.c         | 35 +++++++++++++++++++++++++++++++++
 drivers/misc/mei/main.c         |  6 +++++-
 drivers/misc/mei/mei_dev.h      |  6 ++++++
 drivers/misc/mei/pci-me.c       |  5 ++++-
 drivers/misc/mei/pci-txe.c      |  5 ++++-
 drivers/misc/mei/platform-vsc.c |  7 ++++---
 10 files changed, 71 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..0a6176e72d10 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -1286,16 +1286,20 @@ static const struct bus_type mei_cl_bus_type = {
 
 static struct mei_device *mei_dev_bus_get(struct mei_device *bus)
 {
-	if (bus)
-		get_device(bus->dev);
+	struct mei_device *rbus;
+
+	rbus = mei_device_get(bus);
+	if (rbus)
+		get_device(rbus->dev);
 
-	return bus;
+	return rbus;
 }
 
 static void mei_dev_bus_put(struct mei_device *bus)
 {
 	if (bus)
 		put_device(bus->dev);
+	mei_device_put(bus);
 }
 
 static void mei_cl_bus_dev_release(struct device *dev)
diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index 5a8c26c3df13..6b34645e4504 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -69,7 +69,7 @@ static int mei_gsc_probe(struct auxiliary_device *aux_dev,
 	hw->mem_addr = devm_ioremap_resource(device, &adev->bar);
 	if (IS_ERR(hw->mem_addr)) {
 		ret = PTR_ERR(hw->mem_addr);
-		goto err;
+		goto free_dev;
 	}
 
 	hw->irq = adev->irq;
@@ -131,7 +131,8 @@ static int mei_gsc_probe(struct auxiliary_device *aux_dev,
 	mei_stop(dev);
 	if (!mei_me_hw_use_polling(hw))
 		devm_free_irq(device, hw->irq, dev);
-
+free_dev:
+	mei_device_put(dev);
 err:
 	dev_err(device, "probe failed: %d\n", ret);
 	dev_set_drvdata(device, NULL);
@@ -159,6 +160,7 @@ static void mei_gsc_remove(struct auxiliary_device *aux_dev)
 	mei_disable_interrupts(dev);
 	if (!mei_me_hw_use_polling(hw))
 		devm_free_irq(&aux_dev->dev, hw->irq, dev);
+	mei_device_put(dev);
 }
 
 static int __maybe_unused mei_gsc_pm_suspend(struct device *device)
diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index d11a0740b47c..7a49c4bd2734 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -1804,7 +1804,7 @@ struct mei_device *mei_me_dev_init(struct device *parent,
 	struct mei_me_hw *hw;
 	int i;
 
-	dev = devm_kzalloc(parent, sizeof(*dev) + sizeof(*hw), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev) + sizeof(*hw), GFP_KERNEL);
 	if (!dev)
 		return NULL;
 
diff --git a/drivers/misc/mei/hw-txe.c b/drivers/misc/mei/hw-txe.c
index e9476f9ae25d..c6e396ad2e9e 100644
--- a/drivers/misc/mei/hw-txe.c
+++ b/drivers/misc/mei/hw-txe.c
@@ -1197,7 +1197,7 @@ struct mei_device *mei_txe_dev_init(struct pci_dev *pdev)
 	struct mei_device *dev;
 	struct mei_txe_hw *hw;
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev) + sizeof(*hw), GFP_KERNEL);
+	dev = kzalloc(sizeof(*dev) + sizeof(*hw), GFP_KERNEL);
 	if (!dev)
 		return NULL;
 
diff --git a/drivers/misc/mei/init.c b/drivers/misc/mei/init.c
index 8ef2b1df8ac7..26ae60f26772 100644
--- a/drivers/misc/mei/init.c
+++ b/drivers/misc/mei/init.c
@@ -389,6 +389,7 @@ void mei_device_init(struct mei_device *dev,
 		     bool slow_fw,
 		     const struct mei_hw_ops *hw_ops)
 {
+	kref_init(&dev->refcnt);
 	/* setup our list array */
 	INIT_LIST_HEAD(&dev->file_list);
 	INIT_LIST_HEAD(&dev->device_list);
@@ -445,3 +446,37 @@ void mei_device_init(struct mei_device *dev,
 }
 EXPORT_SYMBOL_GPL(mei_device_init);
 
+/**
+ * mei_device_get - increases mei device refcount
+ *
+ * @dev: the mei device
+ *
+ * Return: mei device or NULL on failure
+ */
+struct mei_device *mei_device_get(struct mei_device *dev)
+{
+	if (dev && kref_get_unless_zero(&dev->refcnt))
+		return dev;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(mei_device_get);
+
+static void mei_device_release(struct kref *ref)
+{
+	struct mei_device *dev = container_of(ref, struct mei_device, refcnt);
+
+	kfree(dev);
+}
+
+/**
+ * mei_device_put - decrease mei device refcount and free object if necessary
+ *
+ * @dev: the mei device
+ */
+void mei_device_put(struct mei_device *dev)
+{
+	if (dev)
+		kref_put(&dev->refcnt, mei_device_release);
+}
+EXPORT_SYMBOL_GPL(mei_device_put);
diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 1f5aaf16e300..03898246ab16 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -51,7 +51,9 @@ static int mei_open(struct inode *inode, struct file *file)
 
 	int err;
 
-	dev = container_of(inode->i_cdev, struct mei_device, cdev);
+	dev = mei_device_get(container_of(inode->i_cdev, struct mei_device, cdev));
+	if (!dev)
+		return -ENODEV;
 
 	mutex_lock(&dev->device_lock);
 
@@ -77,6 +79,7 @@ static int mei_open(struct inode *inode, struct file *file)
 
 err_unlock:
 	mutex_unlock(&dev->device_lock);
+	mei_device_put(dev);
 	return err;
 }
 
@@ -152,6 +155,7 @@ static int mei_release(struct inode *inode, struct file *file)
 	file->private_data = NULL;
 
 	mutex_unlock(&dev->device_lock);
+	mei_device_put(dev);
 	return rets;
 }
 
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index 37d7fb15cad7..b745cde80662 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -474,6 +474,8 @@ struct mei_dev_timeouts {
  * @cdev        : character device
  * @minor       : minor number allocated for device
  *
+ * @refcnt      : struct reference count
+ *
  * @write_list  : write pending list
  * @write_waiting_list : write completion list
  * @ctrl_wr_list : pending control write list
@@ -560,6 +562,8 @@ struct mei_device {
 	struct cdev cdev;
 	int minor;
 
+	struct kref refcnt;
+
 	struct list_head write_list;
 	struct list_head write_waiting_list;
 	struct list_head ctrl_wr_list;
@@ -706,6 +710,8 @@ void mei_device_init(struct mei_device *dev,
 		     struct device *device,
 		     bool slow_fw,
 		     const struct mei_hw_ops *hw_ops);
+struct mei_device *mei_device_get(struct mei_device *dev);
+void mei_device_put(struct mei_device *dev);
 int mei_reset(struct mei_device *dev);
 int mei_start(struct mei_device *dev);
 int mei_restart(struct mei_device *dev);
diff --git a/drivers/misc/mei/pci-me.c b/drivers/misc/mei/pci-me.c
index 3f9c60b579ae..7acfdd04924a 100644
--- a/drivers/misc/mei/pci-me.c
+++ b/drivers/misc/mei/pci-me.c
@@ -235,7 +235,7 @@ static int mei_me_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err) {
 		dev_err(&pdev->dev, "request_threaded_irq failure. irq = %d\n",
 		       pdev->irq);
-		goto end;
+		goto free_dev;
 	}
 
 	if (mei_start(dev)) {
@@ -286,6 +286,8 @@ static int mei_me_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	mei_cancel_work(dev);
 	mei_disable_interrupts(dev);
 	free_irq(pdev->irq, dev);
+free_dev:
+	mei_device_put(dev);
 end:
 	dev_err(&pdev->dev, "initialization failed.\n");
 	return err;
@@ -338,6 +340,7 @@ static void mei_me_remove(struct pci_dev *pdev)
 	free_irq(pdev->irq, dev);
 
 	mei_deregister(dev);
+	mei_device_put(dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/misc/mei/pci-txe.c b/drivers/misc/mei/pci-txe.c
index 2a584104ba38..bad1577d283d 100644
--- a/drivers/misc/mei/pci-txe.c
+++ b/drivers/misc/mei/pci-txe.c
@@ -106,7 +106,7 @@ static int mei_txe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err) {
 		dev_err(&pdev->dev, "mei: request_threaded_irq failure. irq = %d\n",
 			pdev->irq);
-		goto end;
+		goto free_dev;
 	}
 
 	if (mei_start(dev)) {
@@ -150,6 +150,8 @@ static int mei_txe_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	mei_cancel_work(dev);
 	mei_disable_interrupts(dev);
 	free_irq(pdev->irq, dev);
+free_dev:
+	mei_device_put(dev);
 end:
 	dev_err(&pdev->dev, "initialization failed.\n");
 	return err;
@@ -199,6 +201,7 @@ static void mei_txe_remove(struct pci_dev *pdev)
 	free_irq(pdev->irq, dev);
 
 	mei_deregister(dev);
+	mei_device_put(dev);
 }
 
 
diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 435760b1e86f..e1ec992211c3 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -340,8 +340,7 @@ static int mei_vsc_probe(struct platform_device *pdev)
 	if (!tp)
 		return dev_err_probe(dev, -ENODEV, "no platform data\n");
 
-	mei_dev = devm_kzalloc(dev, size_add(sizeof(*mei_dev), sizeof(*hw)),
-			       GFP_KERNEL);
+	mei_dev = kzalloc(size_add(sizeof(*mei_dev), sizeof(*hw)), GFP_KERNEL);
 	if (!mei_dev)
 		return -ENOMEM;
 
@@ -373,8 +372,9 @@ static int mei_vsc_probe(struct platform_device *pdev)
 
 err_stop:
 	mei_stop(mei_dev);
-
 err_cancel:
+	mei_device_put(mei_dev);
+
 	mei_cancel_work(mei_dev);
 
 	mei_disable_interrupts(mei_dev);
@@ -393,6 +393,7 @@ static void mei_vsc_remove(struct platform_device *pdev)
 	mei_disable_interrupts(mei_dev);
 
 	mei_deregister(mei_dev);
+	mei_device_put(mei_dev);
 }
 
 static int mei_vsc_suspend(struct device *dev)
-- 
2.43.0

