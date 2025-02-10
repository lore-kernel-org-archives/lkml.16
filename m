Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D7E15C15C;
	Mon, 10 Feb 2025 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163873; cv=none; b=hYXVkPuDyjRBmxRQocpJJdI0vi7hyU/WgPzx/rK3oNnwXT7hc+6J5JPyNzwpa1UFl+NKIfg8REL6rzU8JLwuvk1Mo5dNlZyyaPjNFFEPzZE+TnPbsiRLcDF8v5ejjQeGm1AjAiwOhucMUdjbNzvJHHRVgc5YhI/AjTLact1Q4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163873; c=relaxed/simple;
	bh=6QJhc/pVjnuDT5lFO0/4gF8LnYEl0nBu1j712TzjUKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uD/83UTcaA3rXiO24eK4Ahm6YOizfizBm84m+Wd6eBU4y8Ng5DxkKUT+Ln3ErjkCyWwE6FfBcLDjS2CNUEWA+Mw9dKwmQVnyOfRM3k3zP+8rFp2UZ+xJBmK6wMnbkmhPg0UdP3XRZwvIZlXHPxbRL5WzjjbPyI+uM2hIM2/SPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/1LErHz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/1LErHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739163871; x=1770699871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6QJhc/pVjnuDT5lFO0/4gF8LnYEl0nBu1j712TzjUKA=;
  b=P/1LErHzNm6WR8UnWCvvEKPB8dWE32kODMTSNyxaOCkjn/OU80GCxxBT
   Gbu2o9AxP6+get6l4u6RT+nyHeK7QMzfmUTjMUWVZGmsuWfsAj+R13bAo
   1vO9gTG6fgDpjykmv57oNDDoLBF4OQ7UNbKsAmes/tNxYA95G1li5vYJ7
   BCgKRmkcRnT6A6DVRDuSq5P7OXok3eTpws3qxt/7Ypd/2GnSvcwiJGnaC
   hLcLg7ELH6of0T/ZhreJhztRoor76GCLMuE6W7nN0lbrH7BOi2E682E1D
   Lxf9DZrx3pMZEHl1xa6TMQ4E+wtxA8az4CdZrpyz0AJresrl/TNDGi5uw
   g==;
X-CSE-ConnectionGUID: NRtr/QdRThmoQBA1hBV6gQ==
X-CSE-MsgGUID: neKuSr66QOmlKnvEize7SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50369435"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="50369435"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:04:31 -0800
X-CSE-ConnectionGUID: 4+JL7L71TTOs+BQyCmhqFg==
X-CSE-MsgGUID: tr1zglFHThCVN7TF53Xcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112312195"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:04:27 -0800
From: subramanian.mohan@intel.com
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	giometti@enneenne.com,
	tglx@linutronix.de,
	corbet@lwn.net
Cc: eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	subramanian.mohan@intel.com
Subject: [PATCH v13 1/4] drivers pps/generators: replace copy of pps-gen info struct with const pointer
Date: Mon, 10 Feb 2025 10:34:18 +0530
Message-Id: <20250210050421.29256-2-subramanian.mohan@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250210050421.29256-1-subramanian.mohan@intel.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Subramanian Mohan <subramanian.mohan@intel.com>

Some PPS generator drivers may need to retrieve a pointer to their
internal data while executing the PPS generator enable() method.

During the driver registration the pps_gen_device pointer is returned
from the framework, and for that reason, there is difficulty in
getting generator driver data back in the enable function. We won't be
able to use container_of macro as it results in static assert, and we
might end up in using static pointer.

To solve the issue and to get back the generator driver data back, we
should not copy the struct pps_gen_source_info within the struct
pps_gen_device during the registration stage, but simply save the
pointer of the driver one. In this manner, driver may get a pointer
to their internal data as shown below:

struct pps_gen_foo_data_s {
        ...
	struct pps_gen_source_info gen_info;
	struct pps_gen_device *pps_gen;
	...
};

static int __init pps_gen_foo_init(void)
{
        struct pps_gen_foo_data_s *foo;
	...

        foo->pps_gen = pps_gen_register_source(&foo->gen_info);
	...
}

Then, in the enable() method, we can retrieve the pointer to the main
struct by using the code below:

static int pps_gen_foo_enable(struct pps_gen_device *pps_gen, bool enable)
{
        struct pps_gen_foo_data_s *foo = container_of(pps_gen->info,
	       			      struct pps_gen_foo_data_s, gen_info);
        ...
}

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
---
 Documentation/driver-api/pps.rst       |  3 +--
 drivers/pps/generators/pps_gen-dummy.c |  2 +-
 drivers/pps/generators/pps_gen.c       | 13 +++++++------
 drivers/pps/generators/sysfs.c         |  6 +++---
 include/linux/pps_gen_kernel.h         |  4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/driver-api/pps.rst b/Documentation/driver-api/pps.rst
index 71ad04c82d6c..04f1b88778fc 100644
--- a/Documentation/driver-api/pps.rst
+++ b/Documentation/driver-api/pps.rst
@@ -206,8 +206,7 @@ To do so the class pps-gen has been added. PPS generators can be
 registered in the kernel by defining a struct pps_gen_source_info as
 follows::
 
-    static struct pps_gen_source_info pps_gen_dummy_info = {
-            .name                   = "dummy",
+    static const struct pps_gen_source_info pps_gen_dummy_info = {
             .use_system_clock       = true,
             .get_time               = pps_gen_dummy_get_time,
             .enable                 = pps_gen_dummy_enable,
diff --git a/drivers/pps/generators/pps_gen-dummy.c b/drivers/pps/generators/pps_gen-dummy.c
index b284c200cbe5..55de4aecf35e 100644
--- a/drivers/pps/generators/pps_gen-dummy.c
+++ b/drivers/pps/generators/pps_gen-dummy.c
@@ -61,7 +61,7 @@ static int pps_gen_dummy_enable(struct pps_gen_device *pps_gen, bool enable)
  * The PPS info struct
  */
 
-static struct pps_gen_source_info pps_gen_dummy_info = {
+static const struct pps_gen_source_info pps_gen_dummy_info = {
 	.use_system_clock	= true,
 	.get_time		= pps_gen_dummy_get_time,
 	.enable			= pps_gen_dummy_enable,
diff --git a/drivers/pps/generators/pps_gen.c b/drivers/pps/generators/pps_gen.c
index ca592f1736f4..bea00113b55f 100644
--- a/drivers/pps/generators/pps_gen.c
+++ b/drivers/pps/generators/pps_gen.c
@@ -66,7 +66,7 @@ static long pps_gen_cdev_ioctl(struct file *file,
 		if (ret)
 			return -EFAULT;
 
-		ret = pps_gen->info.enable(pps_gen, status);
+		ret = pps_gen->info->enable(pps_gen, status);
 		if (ret)
 			return ret;
 		pps_gen->enabled = status;
@@ -76,7 +76,7 @@ static long pps_gen_cdev_ioctl(struct file *file,
 	case PPS_GEN_USESYSTEMCLOCK:
 		dev_dbg(pps_gen->dev, "PPS_GEN_USESYSTEMCLOCK\n");
 
-		ret = put_user(pps_gen->info.use_system_clock, uiuarg);
+		ret = put_user(pps_gen->info->use_system_clock, uiuarg);
 		if (ret)
 			return -EFAULT;
 
@@ -175,7 +175,7 @@ static int pps_gen_register_cdev(struct pps_gen_device *pps_gen)
 	devt = MKDEV(MAJOR(pps_gen_devt), pps_gen->id);
 
 	cdev_init(&pps_gen->cdev, &pps_gen_cdev_fops);
-	pps_gen->cdev.owner = pps_gen->info.owner;
+	pps_gen->cdev.owner = pps_gen->info->owner;
 
 	err = cdev_add(&pps_gen->cdev, devt, 1);
 	if (err) {
@@ -183,7 +183,7 @@ static int pps_gen_register_cdev(struct pps_gen_device *pps_gen)
 				MAJOR(pps_gen_devt), pps_gen->id);
 		goto free_ida;
 	}
-	pps_gen->dev = device_create(pps_gen_class, pps_gen->info.parent, devt,
+	pps_gen->dev = device_create(pps_gen_class, pps_gen->info->parent, devt,
 					pps_gen, "pps-gen%d", pps_gen->id);
 	if (IS_ERR(pps_gen->dev)) {
 		err = PTR_ERR(pps_gen->dev);
@@ -225,7 +225,8 @@ static void pps_gen_unregister_cdev(struct pps_gen_device *pps_gen)
  * Return: the PPS generator device in case of success, and ERR_PTR(errno)
  *	 otherwise.
  */
-struct pps_gen_device *pps_gen_register_source(struct pps_gen_source_info *info)
+struct pps_gen_device *pps_gen_register_source(
+					const struct pps_gen_source_info *info)
 {
 	struct pps_gen_device *pps_gen;
 	int err;
@@ -235,7 +236,7 @@ struct pps_gen_device *pps_gen_register_source(struct pps_gen_source_info *info)
 		err = -ENOMEM;
 		goto pps_gen_register_source_exit;
 	}
-	pps_gen->info = *info;
+	pps_gen->info = info;
 	pps_gen->enabled = false;
 
 	init_waitqueue_head(&pps_gen->queue);
diff --git a/drivers/pps/generators/sysfs.c b/drivers/pps/generators/sysfs.c
index faf8b1c6d202..6d6bc0006fea 100644
--- a/drivers/pps/generators/sysfs.c
+++ b/drivers/pps/generators/sysfs.c
@@ -19,7 +19,7 @@ static ssize_t system_show(struct device *dev, struct device_attribute *attr,
 {
 	struct pps_gen_device *pps_gen = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%d\n", pps_gen->info.use_system_clock);
+	return sysfs_emit(buf, "%d\n", pps_gen->info->use_system_clock);
 }
 static DEVICE_ATTR_RO(system);
 
@@ -30,7 +30,7 @@ static ssize_t time_show(struct device *dev, struct device_attribute *attr,
 	struct timespec64 time;
 	int ret;
 
-	ret = pps_gen->info.get_time(pps_gen, &time);
+	ret = pps_gen->info->get_time(pps_gen, &time);
 	if (ret)
 		return ret;
 
@@ -49,7 +49,7 @@ static ssize_t enable_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	ret = pps_gen->info.enable(pps_gen, status);
+	ret = pps_gen->info->enable(pps_gen, status);
 	if (ret)
 		return ret;
 	pps_gen->enabled = status;
diff --git a/include/linux/pps_gen_kernel.h b/include/linux/pps_gen_kernel.h
index 022ea0ac4440..6214c8aa2e02 100644
--- a/include/linux/pps_gen_kernel.h
+++ b/include/linux/pps_gen_kernel.h
@@ -43,7 +43,7 @@ struct pps_gen_source_info {
 
 /* The main struct */
 struct pps_gen_device {
-	struct pps_gen_source_info info;	/* PSS generator info */
+	const struct pps_gen_source_info *info;	/* PSS generator info */
 	bool enabled;				/* PSS generator status */
 
 	unsigned int event;
@@ -70,7 +70,7 @@ extern const struct attribute_group *pps_gen_groups[];
  */
 
 extern struct pps_gen_device *pps_gen_register_source(
-				struct pps_gen_source_info *info);
+				const struct pps_gen_source_info *info);
 extern void pps_gen_unregister_source(struct pps_gen_device *pps_gen);
 extern void pps_gen_event(struct pps_gen_device *pps_gen,
 				unsigned int event, void *data);
-- 
2.35.3

