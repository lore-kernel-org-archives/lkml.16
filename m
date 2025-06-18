Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752792877E7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241363; cv=none; b=RX2HStw5T9GkB5gygnW+bXwXCaT2ODvfbsC+NG/wvBA25wcTLXEyFBzuKnQ57gs3yHqTaQuKTd6Z+LoLt3lZ4h6CWn6KAEdxHjmPPRvJ1JMe5Ade3yLazzUqdyDhgAzX9DoUIyitV+bhT7rp2gg1gVFvH7mJNLFvD5Yba0LiUXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241363; c=relaxed/simple;
	bh=xpn/EHIABiAzTJLgy/jCZXbyjPag492xA6bZdLVSFwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0dL9LrGRbFcgT5FCHlro54Rp/0udteC6TJ3F8U9SSl2dGkUtU0p9p3KsuunIrFSprV0ty5xGT6EFtzHIykkWXWJffB+Vuuzz72ulQLylMFtIeqBqu5jKIaLtV8XmNCFXeRYncoIfahIgFZeAVBATyJ7M+cDRmirr7gSUqAMDcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QewFDs4v; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QewFDs4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750241362; x=1781777362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xpn/EHIABiAzTJLgy/jCZXbyjPag492xA6bZdLVSFwI=;
  b=QewFDs4vcdiXg4YwOfOdxrLP8WeXB/yXsoqqRCD666eK+yZ6ko8oIVWL
   kpkmLyIVe/TCRmhkMmv1WSgkSGANZOHA2tN6rdEs0Vy1wCbv7OlVL8ruD
   6Chz7pJbBbEasR9tYG7veSihuzy0tx8oEoPstOiMRN38ZpvZKkWXY7dLM
   /r7mxJTDsBUXPOq+dKt7rb/23QJHgB4YpAr6qLdwWKoTBsoyMPz2voble
   4VsSpOdCrHRbYogYTOAMDFAkcIMx5aof7I4Zz+A8CJDhSNsBAzrE4Rq1p
   glDik6tvf35eAkL6VVOD6e7sxW4W5+ugWSKu6m34pQhb6LR8AQbgB6j3g
   w==;
X-CSE-ConnectionGUID: PGIVtt8+TzKcbJGFYkK0TA==
X-CSE-MsgGUID: BGlCwLKITDizssDjo1BRaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52591024"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52591024"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:12 -0700
X-CSE-ConnectionGUID: dxAJV6kYS1CuINge0wA7hQ==
X-CSE-MsgGUID: zrRYSo7sShikWKGAWN8j3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149461269"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 03:08:10 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [char-misc-next 3/3] mei: make char device control its own lifetime
Date: Wed, 18 Jun 2025 12:54:33 +0300
Message-ID: <20250618095433.3943546-4-alexander.usyskin@intel.com>
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

Allocate character device dynamically and allow to
control its own lifetime as it may outlive mei_device
structure while character device closes after parent
device is removed from the system.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/main.c    | 34 +++++++++++++++++++++-------------
 drivers/misc/mei/mei_dev.h |  4 ++--
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index c160703d0782..2162a8de9e6a 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -51,7 +51,7 @@ static int mei_open(struct inode *inode, struct file *file)
 
 	int err;
 
-	dev = mei_device_get(container_of(inode->i_cdev, struct mei_device, cdev));
+	dev = mei_device_get(idr_find(&mei_idr, iminor(inode)));
 	if (!dev)
 		return -ENODEV;
 
@@ -1122,7 +1122,10 @@ void mei_set_devstate(struct mei_device *dev, enum mei_dev_state state)
 
 	dev->dev_state = state;
 
-	clsdev = class_find_device_by_devt(&mei_class, dev->cdev.dev);
+	if (!dev->cdev)
+		return;
+
+	clsdev = class_find_device_by_devt(&mei_class, dev->cdev->dev);
 	if (clsdev) {
 		sysfs_notify(&clsdev->kobj, NULL, "dev_state");
 		put_device(clsdev);
@@ -1227,16 +1230,21 @@ int mei_register(struct mei_device *dev, struct device *parent)
 
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
@@ -1247,16 +1255,16 @@ int mei_register(struct mei_device *dev, struct device *parent)
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
@@ -1266,8 +1274,8 @@ void mei_deregister(struct mei_device *dev)
 {
 	int devno;
 
-	devno = dev->cdev.dev;
-	cdev_del(&dev->cdev);
+	devno = dev->cdev->dev;
+	cdev_del(dev->cdev);
 
 	mei_dbgfs_deregister(dev);
 
diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index b745cde80662..8f081c6735c4 100644
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
  * @refcnt      : struct reference count
@@ -559,7 +559,7 @@ struct mei_dev_timeouts {
  */
 struct mei_device {
 	struct device *dev;
-	struct cdev cdev;
+	struct cdev *cdev;
 	int minor;
 
 	struct kref refcnt;
-- 
2.43.0

