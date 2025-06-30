Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8301C248F5E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275988; cv=none; b=p8h5wPqLNyWZ4pvJ8inEYOepAOnGNVjUO/AXe6n8/daj3qPI8sYqVNIT3HZS/nPLu2BvlOkk1w4CThjoXpUrd70nCtc8U9GGcj/4tSkEB/gV1o8CBoiftswupatGqThXIiTQ8V45gB9H6Z1/nyaWGYkSJGfezGyDlaLJJlA4O9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275988; c=relaxed/simple;
	bh=FIfEkbz8JdHJOviN1RQuQrM8W1xMWoKA43IuApPDbZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDq+VLc5oDsCD3/ueboHtV8y75TGPFEbBrZyyLBUS3LQLz4HLtRfFfzZwNufWvkaCLWRfmSQdehkXRhxu9scB3u23nLWI1nmnYRZUYpCfppJhRQ+Zbt+jjLXzNB+ImswNFbrW3lB0KfJx+seV4dJU2LrEKNPBgaVajll+eAqRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wkx3CpU9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkx3CpU9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751275987; x=1782811987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FIfEkbz8JdHJOviN1RQuQrM8W1xMWoKA43IuApPDbZw=;
  b=Wkx3CpU9HcjZaNFDF6e73ltUrHPl386L4ZtlTvZUzR0EdAeU47mdakBT
   FrcOdy9ZtMh+LUWBmdOl+0QQQb+/x9hI1oZjtduObnmpf3C+nzYqtm1MZ
   P7T8h7j2ZX00aJzbdrCgpIMThBW7fIjoGNYnypwdbmzqZ3EDAUd+y8de8
   Lfrx0k6k1/2v1jHgZjxAy1FU2YBfSFAjQXXcdK/jiV7NFRchefbWDbopp
   ApxUv+Uky/YFTHLB0q4StHobNsrqbexZyhvHwFPjkfGn/3ewPt5Vfm2kA
   ukLWKEy3mj+O5m2rHwMteJ/q8byucp2cF0HQNmRCdTNv4/JGd+TtFG21H
   A==;
X-CSE-ConnectionGUID: Lhtr0b78TiWmmzsgJc2LIQ==
X-CSE-MsgGUID: 2SqzciRdSk2jd7b/1TVmxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53218593"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53218593"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:07 -0700
X-CSE-ConnectionGUID: Lf0p4y5bRVubwnspdk+InA==
X-CSE-MsgGUID: HS1TOjSoS2i6DkoHe/oZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153039561"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:33:05 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next v2 2/5] mei: make char device control its own lifetime
Date: Mon, 30 Jun 2025 12:19:39 +0300
Message-ID: <20250630091942.2116676-3-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630091942.2116676-1-alexander.usyskin@intel.com>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate character device dynamically and allow to
control its own lifetime as it may outlive mei_device
structure while character device closes after parent
device is removed from the system.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/main.c    | 36 +++++++++++++++++++++++-------------
 drivers/misc/mei/mei_dev.h |  4 ++--
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 95d4c1d8e4e6..5335cf39d663 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -51,7 +51,9 @@ static int mei_open(struct inode *inode, struct file *file)
 
 	int err;
 
-	dev = container_of(inode->i_cdev, struct mei_device, cdev);
+	dev = idr_find(&mei_idr, iminor(inode));
+	if (!dev)
+		return -ENODEV;
 
 	mutex_lock(&dev->device_lock);
 
@@ -1118,7 +1120,10 @@ void mei_set_devstate(struct mei_device *dev, enum mei_dev_state state)
 
 	dev->dev_state = state;
 
-	clsdev = class_find_device_by_devt(&mei_class, dev->cdev.dev);
+	if (!dev->cdev)
+		return;
+
+	clsdev = class_find_device_by_devt(&mei_class, dev->cdev->dev);
 	if (clsdev) {
 		sysfs_notify(&clsdev->kobj, NULL, "dev_state");
 		put_device(clsdev);
@@ -1223,16 +1228,21 @@ int mei_register(struct mei_device *dev, struct device *parent)
 
 	/* Fill in the data structures */
 	devno = MKDEV(MAJOR(mei_devt), dev->minor);
-	cdev_init(&dev->cdev, &mei_fops);
-	dev->cdev.owner = parent->driver->owner;
-	cdev_set_parent(&dev->cdev, &parent->kobj);
+	dev->cdev = cdev_alloc();
+	if (!dev->cdev) {
+		ret = -ENOMEM;
+		goto err;
+	}
+	dev->cdev->ops = &mei_fops;
+	dev->cdev->owner = parent->driver->owner;
+	cdev_set_parent(dev->cdev, &parent->kobj);
 
 	/* Add the device */
-	ret = cdev_add(&dev->cdev, devno, 1);
+	ret = cdev_add(dev->cdev, devno, 1);
 	if (ret) {
 		dev_err(parent, "unable to add device %d:%d\n",
 			MAJOR(mei_devt), dev->minor);
-		goto err_dev_add;
+		goto err_del_cdev;
 	}
 
 	clsdev = device_create_with_groups(&mei_class, parent, devno,
@@ -1243,16 +1253,16 @@ int mei_register(struct mei_device *dev, struct device *parent)
 		dev_err(parent, "unable to create device %d:%d\n",
 			MAJOR(mei_devt), dev->minor);
 		ret = PTR_ERR(clsdev);
-		goto err_dev_create;
+		goto err_del_cdev;
 	}
 
 	mei_dbgfs_register(dev, dev_name(clsdev));
 
 	return 0;
 
-err_dev_create:
-	cdev_del(&dev->cdev);
-err_dev_add:
+err_del_cdev:
+	cdev_del(dev->cdev);
+err:
 	mei_minor_free(dev);
 	return ret;
 }
@@ -1262,8 +1272,8 @@ void mei_deregister(struct mei_device *dev)
 {
 	int devno;
 
-	devno = dev->cdev.dev;
-	cdev_del(&dev->cdev);
+	devno = dev->cdev->dev;
+	cdev_del(dev->cdev);
 
 	mei_dbgfs_deregister(dev);
 
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index 37d7fb15cad7..0cc943afa80a 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -471,7 +471,7 @@ struct mei_dev_timeouts {
  * struct mei_device -  MEI private device struct
  *
  * @dev         : device on a bus
- * @cdev        : character device
+ * @cdev        : character device pointer
  * @minor       : minor number allocated for device
  *
  * @write_list  : write pending list
@@ -557,7 +557,7 @@ struct mei_dev_timeouts {
  */
 struct mei_device {
 	struct device *dev;
-	struct cdev cdev;
+	struct cdev *cdev;
 	int minor;
 
 	struct list_head write_list;
-- 
2.43.0

