Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A6F23C505
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580518; cv=none; b=Kkc2Webq9scgs0RH43HjLnXugKs19lBWw2qt1rpJ7tpvuY4kdtrWEBJrldibJsCnhhvLOgp+9mXTsKSGJsvKCJTYaiUS7QfGt+GBGDRY2FMyKlduTPv9BsgKL+6bawEPMP1kfp6M33Fq35jBHUvEp/ZoACFkdisVBIFsxSlmYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580518; c=relaxed/simple;
	bh=qxQ6o3p0Ciniy1S9YcN5KUYCK4coA3e7sgRnz1nORww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZUpAcutUFdhQMMwI0FhTpXjjyvTesoblkSlxIJOKOF/sSMAQ1b46sRn7bZoTrHf0lNYxfIL3LLFE6ERNg+flNWyRMe3AjOvDTS2cdWrGV/9Bd5YJOP/WrdjvBPYVDKRxkog8Etm9gQQO7if470QV1AHC/Kc//7D3MfE/hW87ryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OEsQvRXN; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OEsQvRXN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749580513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQPziwwh6H26Tq1mEhJ6t2TBINF6L2+4x4ZuoYmhM/M=;
	b=OEsQvRXN4ZDb1Gdel17/vnI/EiHP4ISAKsdvePxzGZ8/y/GBctQpTkUvUdo4+qYd81nACq
	/XmdpHK/pYeM4dJ2K4sqtBKKfCzLUXspFhDde8vlPNTHuEc2760zTyFtbua4fRK5rn/qvx
	Wywi3kriFdOldEQe0yY2MFV4+b575ds=
From: Sean Anderson <sean.anderson@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Rob Herring <robh+dt@kernel.org>,
	Grant Likely <grant.likely@linaro.org>,
	Saravana Kannan <saravanak@google.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] driver core: Prevent deferred probe loops
Date: Tue, 10 Jun 2025 14:34:59 -0400
Message-Id: <20250610183459.3395328-1-sean.anderson@linux.dev>
In-Reply-To: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
References: <cb354fd2-bece-42ef-9213-de7512e80912@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

A deferred probe loop can occur when a device returns EPROBE_DEFER after
registering a bus with children:

deferred_probe_work_func()
  driver_probe_device(parent)
    test_parent_probe(parent)
      device_add(child)
        (probe successful)
        driver_bound(child)
          driver_deferred_probe_trigger()
      return -EPROBE_DEFER
    driver_deferred_probe_add(parent)
    // deferred_trigger_count changed, so...
    driver_deferred_probe_trigger()

Because there was another successful probe during the parent's probe,
driver_probe_device thinks we need to retry the whole probe process. But
we will never make progress this way because the only thing that changed
was a direct result of our own probe function.

To prevent this, add a per-device trigger_count. This allows us to
determine if the global deferred_trigger_count was modified by some
unrelated device or only by our own children. The read side does the
work of summing children because I expect most deferred devices to be
childless. The alternative is to walk up the device's parents in
driver_deferred_probe_trigger.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/base/base.h    |  2 +-
 drivers/base/core.c    |  8 ++++-
 drivers/base/dd.c      | 67 ++++++++++++++++++++++++++++++++++--------
 include/linux/device.h |  3 ++
 4 files changed, 66 insertions(+), 14 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 123031a757d9..54263b186d1f 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -201,7 +201,7 @@ int devres_release_all(struct device *dev);
 void device_block_probing(void);
 void device_unblock_probing(void);
 void deferred_probe_extend_timeout(void);
-void driver_deferred_probe_trigger(void);
+void driver_deferred_probe_trigger(struct device *dev);
 const char *device_get_devnode(const struct device *dev, umode_t *mode,
 			       kuid_t *uid, kgid_t *gid, const char **tmp);
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbc0099d8ef2..8ba231ec469b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1858,7 +1858,7 @@ void __init wait_for_init_devices_probe(void)
 
 	pr_info("Trying to probe devices needed for running init ...\n");
 	fw_devlink_best_effort = true;
-	driver_deferred_probe_trigger();
+	driver_deferred_probe_trigger(NULL);
 
 	/*
 	 * Wait for all "best effort" probes to finish before going back to
@@ -3739,6 +3739,9 @@ int device_add(struct device *dev)
 	kobject_uevent(&dev->kobj, KOBJ_REMOVE);
 	glue_dir = get_glue_dir(dev);
 	kobject_del(&dev->kobj);
+	if (parent)
+		atomic_add(atomic_read(&dev->trigger_count),
+			   &dev->parent->trigger_count);
  Error:
 	cleanup_glue_dir(dev, glue_dir);
 parent_error:
@@ -3899,6 +3902,9 @@ void device_del(struct device *dev)
 	kobject_uevent(&dev->kobj, KOBJ_REMOVE);
 	glue_dir = get_glue_dir(dev);
 	kobject_del(&dev->kobj);
+	if (parent)
+		atomic_add(atomic_read(&dev->trigger_count),
+			   &parent->trigger_count);
 	cleanup_glue_dir(dev, glue_dir);
 	memalloc_noio_restore(noio_flag);
 	put_device(parent);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index b526e0e0f52d..8ce638c02275 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -156,6 +156,7 @@ void driver_deferred_probe_del(struct device *dev)
 static bool driver_deferred_probe_enable;
 /**
  * driver_deferred_probe_trigger() - Kick off re-probing deferred devices
+ * @dev: the successfully-bound device, or %NULL if not applicable
  *
  * This functions moves all devices from the pending list to the active
  * list and schedules the deferred probe workqueue to process them.  It
@@ -172,7 +173,7 @@ static bool driver_deferred_probe_enable;
  * changes in the midst of a probe, then deferred processing should be triggered
  * again.
  */
-void driver_deferred_probe_trigger(void)
+void driver_deferred_probe_trigger(struct device *dev)
 {
 	if (!driver_deferred_probe_enable)
 		return;
@@ -184,6 +185,10 @@ void driver_deferred_probe_trigger(void)
 	 */
 	mutex_lock(&deferred_probe_mutex);
 	atomic_inc(&deferred_trigger_count);
+	if (dev) {
+		smp_wmb(); /* paired with device_needs_retrigger */
+		atomic_inc(&dev->trigger_count);
+	}
 	list_splice_tail_init(&deferred_probe_pending_list,
 			      &deferred_probe_active_list);
 	mutex_unlock(&deferred_probe_mutex);
@@ -216,7 +221,7 @@ void device_block_probing(void)
 void device_unblock_probing(void)
 {
 	defer_all_probes = false;
-	driver_deferred_probe_trigger();
+	driver_deferred_probe_trigger(NULL);
 }
 
 /**
@@ -308,7 +313,7 @@ static void deferred_probe_timeout_work_func(struct work_struct *work)
 	fw_devlink_drivers_done();
 
 	driver_deferred_probe_timeout = 0;
-	driver_deferred_probe_trigger();
+	driver_deferred_probe_trigger(NULL);
 	flush_work(&deferred_probe_work);
 
 	mutex_lock(&deferred_probe_mutex);
@@ -347,7 +352,7 @@ static int deferred_probe_initcall(void)
 			    &deferred_devs_fops);
 
 	driver_deferred_probe_enable = true;
-	driver_deferred_probe_trigger();
+	driver_deferred_probe_trigger(NULL);
 	/* Sort as many dependencies as possible before exiting initcalls */
 	flush_work(&deferred_probe_work);
 	initcalls_done = true;
@@ -359,7 +364,7 @@ static int deferred_probe_initcall(void)
 	 * Trigger deferred probe again, this time we won't defer anything
 	 * that is optional
 	 */
-	driver_deferred_probe_trigger();
+	driver_deferred_probe_trigger(NULL);
 	flush_work(&deferred_probe_work);
 
 	if (driver_deferred_probe_timeout > 0) {
@@ -415,7 +420,7 @@ static void driver_bound(struct device *dev)
 	 * kick off retrying all pending devices
 	 */
 	driver_deferred_probe_del(dev);
-	driver_deferred_probe_trigger();
+	driver_deferred_probe_trigger(dev);
 
 	bus_notify(dev, BUS_NOTIFY_BOUND_DRIVER);
 	kobject_uevent(&dev->kobj, KOBJ_BIND);
@@ -806,6 +811,47 @@ static int __driver_probe_device(const struct device_driver *drv, struct device
 	return ret;
 }
 
+/**
+ * dev_get_trigger_count() - Recursively read trigger_count
+ * @dev: device to read from
+ * @data: pointer to the int result; should be initialized to 0
+ *
+ * Read @dev's trigger_count, as well as all its children's trigger counts,
+ * recursively. The result is the number of times @dev or any of its
+ * (possibly-removed) children have been successfully probed.
+ *
+ * Return: 0
+ */
+static int dev_get_trigger_count(struct device *dev, void *data)
+{
+	*(int *)data += atomic_read(&dev->trigger_count);
+	return device_for_each_child(dev, dev_get_trigger_count, data);
+}
+
+/*
+ * device_needs_retrigger() - Determine if we need to re-trigger a deferred probe
+ * @dev: Device that failed to probe with %EPROBE_DEFER
+ * @old_trigger_count: Value of deferred_trigger_count before probing the device
+ *
+ * The resource @dev was looking for could have been probed between when @dev
+ * looked up the resource and when the probe process finished. If this occurred
+ * we need to retrigger deferred probing so that @dev gets another shot at
+ * probing. However, we need to ignore deferred probe triggers from @dev's own
+ * children, since that could result in an infinite probe loop.
+ *
+ * Return: %true if we should retrigger probing of deferred devices
+ */
+static bool device_needs_retrigger(struct device *dev, int old_trigger_count)
+{
+	int dev_trigger_count = 0;
+	int new_trigger_count;
+
+	dev_get_trigger_count(dev, &dev_trigger_count);
+	smp_rmb(); /* paired with driver_deferred_probe_trigger */
+	new_trigger_count = atomic_read(&deferred_trigger_count);
+	return new_trigger_count > old_trigger_count + dev_trigger_count;
+}
+
 /**
  * driver_probe_device - attempt to bind device & driver together
  * @drv: driver to bind a device to
@@ -830,12 +876,9 @@ static int driver_probe_device(const struct device_driver *drv, struct device *d
 	if (ret == -EPROBE_DEFER || ret == EPROBE_DEFER) {
 		driver_deferred_probe_add(dev);
 
-		/*
-		 * Did a trigger occur while probing? Need to re-trigger if yes
-		 */
-		if (trigger_count != atomic_read(&deferred_trigger_count) &&
-		    !defer_all_probes)
-			driver_deferred_probe_trigger();
+		if (!defer_all_probes &&
+		    device_needs_retrigger(dev, trigger_count))
+			driver_deferred_probe_trigger(NULL);
 	}
 	atomic_dec(&probe_count);
 	wake_up_all(&probe_waitqueue);
diff --git a/include/linux/device.h b/include/linux/device.h
index 4940db137fff..9c9153adb8d6 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -486,6 +486,8 @@ struct device_physical_location {
  * @p:		Holds the private data of the driver core portions of the device.
  * 		See the comment of the struct device_private for detail.
  * @kobj:	A top-level, abstract class from which other classes are derived.
+ * @trigger_count: Number of times this device (or any of its removed children)
+ *              has been successfully bound to a driver.
  * @init_name:	Initial name of the device.
  * @type:	The type of device.
  * 		This identifies the device type and carries type-specific
@@ -581,6 +583,7 @@ struct device_physical_location {
  */
 struct device {
 	struct kobject kobj;
+	atomic_t		trigger_count;
 	struct device		*parent;
 
 	struct device_private	*p;
-- 
2.35.1.1320.gc452695387.dirty

