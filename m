Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17112DECDA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882756; cv=none; b=i4ZN1solH34nDL9q/EhXHU4yrNB8dq5ilxsNY4Fe+ReajyHG//MPf8clT/4DqOEFhYDirj3JnxjMLR6T+KcnQYBKvm5RpIN3ucxUMSJIL2sAo4ROwYweesCEwBiStK58ls7UswJksYeT7BpIBr29usEn7lkFbezWK341hobBiM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882756; c=relaxed/simple;
	bh=SuhUWkxepCKwUTJDVQuQYNJ1JlgH4TR7LESd1alMoq4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mtE0Vs6kIVVuGblW/VNQ0mdq8KVTOanQmCNwepfttIURNlc9qZPCWhxYUDlgZy/EkrHRx2dVnKGnMRpEUdT0A8hN6GM+bCNn/f9z6XPCgcUvhkYV/ULkohk/rETLwdPtbT+Uvhqv5yXVHrjU5mY9ZVXT6sN9lBcktooNHqi4JSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je0qoRYL; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je0qoRYL"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40b1c099511so212515b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882754; x=1751487554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjfYUz5Sj9VCDUhJbZKoCap8L6aycyxFsKLXfxsEkRo=;
        b=je0qoRYLVIIpaHoRSy3WFF6cAbO3Svu7lRYle1dhMy36Kf/Y5Pmh5DmTFed/QxzpDf
         zrdLzkVe0F+my1K2glq7oRAvm4tavT6JIWYL8n6sISk1ZJO8UejcTA3uqEJSu17iEPk2
         bF4bXh3f2pwzjY9E7KEfcOxEtbCmlsLTk2eKh/1F8hKZ18U4sjiu3pJwe/XMbFZPkpf8
         M0fIFXzG3zZhuS5mGzr6jxHhegdbIJ6vEy+/Fmh2GC/7gd9lTbjFXJEimzOlNpNQ842A
         aon2Uz8hQ2I9y7TYBuZPakVYp8AKPbQ/1m8i0mwbaMIWfowE8d0P5D8bnJU1NEngfCG+
         pQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882754; x=1751487554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjfYUz5Sj9VCDUhJbZKoCap8L6aycyxFsKLXfxsEkRo=;
        b=nNprKuE/MUmqPmWQWgXjd+wZ6D5uWyew54qpwdzd+nYafDrp4LGXtc3iKPQLvklBp6
         op6SaybZ7UtDITbrjINSuS/Q9od0Do/sNxZNEdyHf8iL0BEKkUJqxscKwxtOrTqm1Tj5
         +L392dGPBIdnR48AdDQ1j5X0iRefxl1Fv4X+WXiBFkGhAUtPh6HsOX2NpIkNqJNxNVdf
         5BfKpJMRk2b13UXuM+0deka+eBo7QAKyL6GLoNjE+uF53n9I53pMUvpsMFF9sPTWOJza
         ytexDbGsrCa15e5ZtuzY3aP+/0Heb25i+9kdGqBN+QQgm/t4hsEPX0ch7onGQv53w+sZ
         mJ2g==
X-Gm-Message-State: AOJu0Yz3E8m3j8XQnj8oyczZ/YVCXxDeuYTDjf0SE21kx8DbxunDzIm8
	MeRlg1VqxvqogMIiPgu3I6uyuo9wl4PvFx96MBbrodX8l/7PWlD8B3r8ukFYtIY0
X-Gm-Gg: ASbGncvWb3hwzLh5EDzUISJPcXObH0uIbPmD6WygL8VzXpcphwWOarfgWB3RKQIMitA
	eztU186ZYuNMg8Xs+w4zFfVIRfQ54K2df9qvcVxXEYui1CHVxMh4BhlMwDxQCQ5QmlIDhPr2Zic
	9EXANoCHCXRxwynVrbKPEs0/uGWoPLwo1UMz8X6CKFgnQ9gz3gPaHNgtem5aqZNLg3Rgs/IhiBy
	2OkCSdhAhuLw+N1nlvMU+07qYgQYm3tPAGX8onTD/Ub4qOxQUzqbk6fjEcDxh/QFSCjd06u7Nh1
	FMvMRyuEj0wa1f+DuMrPh91SDBmbXkaNER+1fGIF0aO4iLpkqXUxeIVDsg6cUWNePFtr49x1YNj
	Lxw1REt4=
X-Google-Smtp-Source: AGHT+IEPPX6GdITt8r22TB09bMzNMI1EoDKyu9xgoJ9OiZYs/o7KlircW0SgMKIhPLWaoccM3UA6HA==
X-Received: by 2002:a05:6808:3021:b0:3f3:d6f9:69a5 with SMTP id 5614622812f47-40b1c8ca908mr942132b6e.8.1750882753614;
        Wed, 25 Jun 2025 13:19:13 -0700 (PDT)
Received: from localhost.localdomain ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2319188b6e.42.2025.06.25.13.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:19:13 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v10 4/5] driver core: shut down devices asynchronously
Date: Wed, 25 Jun 2025 15:18:52 -0500
Message-Id: <20250625201853.84062-5-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add code to allow asynchronous shutdown of devices.

Devices allowed to do asynchronous shutdown can start to shut down in their
own thread as soon as all of the devices dependent on them have finished
shutting down. All other devices will wait until the previous device in
the devices_kset list have finished shutting down.

Only devices with drivers that have async_shutdown_enable set will be shut
down asynchronously.

Devices shutting down asynchronously will be shut down in their own thread,
but synchronous devices in the devices_kset list between asynch devices
will be put in a list, and that list will be shut down in a single thread.
This avoids burdening the system with hundreds of threads on shutdown.

This can dramatically reduce system shutdown/reboot time on systems that
have multiple devices that take many seconds to shut down (like certain
NVMe drives). On one system tested, the shutdown time went from 11
minutes without this patch to 55 seconds when this patch.

Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/base/base.h           |   8 ++
 drivers/base/core.c           | 157 +++++++++++++++++++++++++++++++++-
 include/linux/device/driver.h |   2 +
 3 files changed, 165 insertions(+), 2 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 123031a757d9..214207ca5392 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -10,6 +10,7 @@
  * shared outside of the drivers/base/ directory.
  *
  */
+#include <linux/async.h>
 #include <linux/notifier.h>
 
 /**
@@ -85,6 +86,11 @@ struct driver_private {
 };
 #define to_driver(obj) container_of(obj, struct driver_private, kobj)
 
+union shutdown_private {
+	struct device *next;
+	async_cookie_t after;
+};
+
 /**
  * struct device_private - structure to hold the private to the driver core portions of the device structure.
  *
@@ -98,6 +104,7 @@ struct driver_private {
  *	the device; typically because it depends on another driver getting
  *	probed first.
  * @async_driver - pointer to device driver awaiting probe via async_probe
+ * @shutdown - used during device shutdown to ensure correct shutdown ordering.
  * @device - pointer back to the struct device that this structure is
  * associated with.
  * @dead - This device is currently either in the process of or has been
@@ -115,6 +122,7 @@ struct device_private {
 	struct list_head deferred_probe;
 	const struct device_driver *async_driver;
 	char *deferred_probe_reason;
+	union shutdown_private shutdown;
 	struct device *device;
 	u8 dead:1;
 };
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 39502621e88e..f0484ceefc52 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/async.h>
 #include <linux/blkdev.h>
 #include <linux/cleanup.h>
 #include <linux/cpufreq.h>
@@ -4786,6 +4787,8 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
 }
 EXPORT_SYMBOL_GPL(device_change_owner);
 
+static ASYNC_DOMAIN(sd_domain);
+
 static void shutdown_one_device(struct device *dev)
 {
 	/* hold lock to avoid race with probe/release */
@@ -4821,12 +4824,116 @@ static void shutdown_one_device(struct device *dev)
 	put_device(dev);
 }
 
+static bool device_wants_async_shutdown(struct device *dev)
+{
+	if (dev->driver && dev->driver->async_shutdown_enable)
+		return true;
+
+	return false;
+}
+
+/**
+ * set_wait_cookies
+ * @dev: device to find parents and suppliers for
+ * @cookie: shutdown cookie for dev
+ *
+ * Look for parent and suppliers of dev that want async shutdown, and
+ * set shutdown.after to cookie on those devices to ensure they
+ * don't shut down before dev.
+ *
+ * Passing a cookie of zero will return whether any such devices are found
+ * without setting shutdown.after.
+ *
+ * Return true if any async supplier/parent devices are found.
+ */
+static bool device_set_async_cookie(struct device *dev, async_cookie_t cookie)
+{
+	int idx;
+	struct device_link *link;
+	bool ret = false;
+	struct device *parent = dev->parent;
+
+	if (parent && device_wants_async_shutdown(parent)) {
+		ret = true;
+		if (cookie)
+			parent->p->shutdown.after = cookie;
+		else
+			goto done;
+	}
+
+	idx = device_links_read_lock();
+	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
+				device_links_read_lock_held()) {
+		if (!device_link_flag_is_sync_state_only(link->flags)
+		    && device_wants_async_shutdown(link->supplier)) {
+			ret = true;
+			if (cookie)
+				link->supplier->p->shutdown.after = cookie;
+			else
+				break;
+		}
+	}
+	device_links_read_unlock(idx);
+done:
+	return ret;
+}
+
+#define is_async_shutdown_dependency(dev) device_set_async_cookie(dev, 0)
+
+/**
+ * shutdown_devices_async
+ * @data: list of devices to be shutdown
+ * @cookie: not used
+ *
+ * Shuts down devices after waiting for previous devices to shut down (for
+ * synchronous shutdown) or waiting for device's last child or consumer to
+ * be shutdown (for async shutdown).
+ *
+ * shutdown.after is set to the shutdown cookie of the last child or consumer
+ * of this device (if any).
+ */
+static void shutdown_devices_async(void *data, async_cookie_t cookie)
+{
+	struct device *next, *dev = data;
+	async_cookie_t wait = cookie;
+	bool async = device_wants_async_shutdown(dev);
+
+	if (async) {
+		wait = dev->p->shutdown.after + 1;
+		/*
+		 * To prevent system hang, revert to sync shutdown in the event
+		 * that shutdown.after would make this shutdown wait for a
+		 * shutdown that hasn't been scheduled yet.
+		 *
+		 * This can happen if a parent or supplier is not ordered in the
+		 * devices_kset list before a child or consumer, which is not
+		 * expected.
+		 */
+		if (wait > cookie) {
+			wait = cookie;
+			dev_warn(dev, "Unsafe shutdown ordering, forcing sync order\n");
+		}
+	}
+
+	async_synchronize_cookie_domain(wait, &sd_domain);
+
+	/*
+	 * Shut down the async device or list of sync devices
+	 */
+	do {
+		next = dev->p->shutdown.next;
+		shutdown_one_device(dev);
+		dev = next;
+	} while (!async && dev);
+}
+
 /**
  * device_shutdown - call ->shutdown() on each device to shutdown.
  */
 void device_shutdown(void)
 {
-	struct device *dev, *parent;
+	struct device *dev, *parent, *synclist = NULL, *syncend = NULL;
+	async_cookie_t cookie = 0;
 
 	wait_for_device_probe();
 	device_block_probing();
@@ -4857,11 +4964,57 @@ void device_shutdown(void)
 		list_del_init(&dev->kobj.entry);
 		spin_unlock(&devices_kset->list_lock);
 
-		shutdown_one_device(dev);
+		get_device(dev);
+		get_device(parent);
+
+		if (device_wants_async_shutdown(dev)) {
+			/*
+			 * async devices run alone in their own async task,
+			 * push out any waiting sync devices to maintain
+			 * ordering.
+			 */
+			if (synclist) {
+				async_schedule_domain(shutdown_devices_async,
+						      synclist, &sd_domain);
+				synclist = syncend = NULL;
+			}
+
+			cookie = async_schedule_domain(shutdown_devices_async,
+					       dev, &sd_domain);
+			device_set_async_cookie(dev, cookie);
+		} else {
+			if (!synclist) {
+				synclist = syncend = dev;
+			} else {
+				syncend->p->shutdown.next = dev;
+				syncend = dev;
+			}
+			if (is_async_shutdown_dependency(dev)) {
+				/*
+				 * dev is a dependency for an async device,
+				 * kick off a new thread so it can complete
+				 * and allow the async device to run its
+				 * shutdown.
+				 */
+				cookie = async_schedule_domain(
+							shutdown_devices_async,
+							synclist, &sd_domain);
+				device_set_async_cookie(dev, cookie);
+				synclist = syncend = NULL;
+			}
+		}
+
+		put_device(parent);
+		put_device(dev);
 
 		spin_lock(&devices_kset->list_lock);
 	}
 	spin_unlock(&devices_kset->list_lock);
+
+	if (synclist)
+		async_schedule_domain(shutdown_devices_async, synclist,
+				      &sd_domain);
+	async_synchronize_full_domain(&sd_domain);
 }
 
 /*
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index cd8e0f0a634b..c63bc0050c84 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -56,6 +56,7 @@ enum probe_type {
  * @mod_name:	Used for built-in modules.
  * @suppress_bind_attrs: Disables bind/unbind via sysfs.
  * @probe_type:	Type of the probe (synchronous or asynchronous) to use.
+ * @async_shutdown_enable: Enables devices to be shutdown asynchronously.
  * @of_match_table: The open firmware table.
  * @acpi_match_table: The ACPI match table.
  * @probe:	Called to query the existence of a specific device,
@@ -102,6 +103,7 @@ struct device_driver {
 
 	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
 	enum probe_type probe_type;
+	bool async_shutdown_enable;
 
 	const struct of_device_id	*of_match_table;
 	const struct acpi_device_id	*acpi_match_table;
-- 
2.39.3

