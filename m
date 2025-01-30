Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A8613FEE
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738257206; cv=none; b=IC7yA/JYFYMz5hSZYKHIP4v7JIndgOh4GjUusoTlfjgWdecvPBQlzBKECAamkmHKUIhwnrmbsXaXhvyz8Y4ojWAwBlDSnYeLBuRfSvIr2CHZKJSNhnnU/auirEncKDbPIfZb17+aksFgvtJS1MR31VGzauXFA1J+4xGjxdekboE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738257206; c=relaxed/simple;
	bh=WMAlqS3Bvb0LabY5Br9y9cQYZu7CIoQi2xBMC80L6TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbVdG09TcwPj2TTHR4f4IbiWv2wvjap8CwyVgh/lDerQ+YFEyAy83uOZwdgaVBspbW4q7O8wxGfU5/m61cQzWPl8mvsG6KiXiw4ECrX3HMjWpaiLs1fp5rMb1/GGGEQ4KRtICXXzIe5APTK5TypdOf2/fJY6EKPrshh6BX1ED+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pi+9UpnO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi+9UpnO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee74291415so1404829a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738257203; x=1738862003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0EV3OdBcPD1ajnFR/jNPfD31GiMfS8OVMSrdDRjbvgg=;
        b=Pi+9UpnO1buzs5fUhv8UYx+aF7PZ2TbpEbscGz49akLa9FqRXOZTl4LPjZIncKTcfc
         PQrpa2MSz8GMlxXpRmYsKHkjKj3sk/MTk/mdc0r0DAClgtSF8UkHBVBRQNiuTZG6MhGF
         Pb4wcBaQxf/3gy20UscsglKWei1Bwix0o4dYEy/cKfuc/7rOtSTl4WN2z0p1ASlzLwAO
         3oq/8HcSQRFu3DSw3rmrlqMevCF9XQIH1Xfr43zbK8VqDNmnmgnzxg8c1d8bxGGzGZct
         wY2JMx7xvyw43QWY1f4wJR7joKklI/3HzMXrikVMRvD3+yX+uQ+O5D/1gYJvWYnt32wW
         B7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738257203; x=1738862003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0EV3OdBcPD1ajnFR/jNPfD31GiMfS8OVMSrdDRjbvgg=;
        b=hNOAngzyAl/EpB+D7pschAFVShvpFqwStbfM+eS7NslCIomI1a9P8O2eLkcORNd6F3
         nC+29zMCEEmKMfEA7A+amrl9bUWxpDyzR6ZsQE12pPaZ2HBsP7TAL0x8P01CPN1aLiGL
         xARbjq17NNQHzvTgJO0ycXZmm9wk/R5ERKT/LGMqf0Wg7OMD0yUta75nO0e/Uq+qXshG
         FalKBcY7NRABHsVyt5nedy0B/nPM/Y72oADmZbQgx38uMmUxYwug5Cxb+5RTO103QiKo
         BKjcwBflvvXtAuIFEaWxUCWa7mCk97AjmRRRgNljaRzD8Ipf8g3y3FEXYCjoCF4GHij7
         hCPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvfSNfKoZmnk1K81NvJ75c/jaggdxeVnQ0LwC4GCW80loDsG/eo0uIZZg4tnGR29kuQP5EI8J9ZjbaAmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybIDNs4DShAKRvT2rK+dAASDoC5j9SdkmjYXBd8CPqK2vrV5Qk
	3Vt5NwUzDGNREdFubON5nSkQvl5Fuj3feYJ9g4I2m03iqAvbUbLF
X-Gm-Gg: ASbGncv6s2BccCv94+TZKo3DlJ8A/+/vCnTEuYqmRrv+BM1Q4pRWf9bErC7e0cD1gOA
	n1FsmC3HJQszbpGnFwDg+ZCWp787qt/FODplGKONR1ULC2KIeBSCHXVNAgRlaffvQ7GKh2OdAYI
	vjFPEvUNsFYVZh//G7As9k3pWn+CqWTBFGWNyvS+6RkKK5f+7LyjL64cHOyeMWDb+BSef/N+rHK
	DBDAphuMqpwHbUOp0khdPH7p9k8EbTXaChMXx4ea2FpilNcG5VAyKO54S7+y44XnXvax7nOBu94
	GfJT
X-Google-Smtp-Source: AGHT+IHof2FRD+TZUtI6PHx4SWglMOy1L9RvjX69AaZHJVXxy/Uh4SGHaz6+JPYp5KH7tOSC1Rwqtg==
X-Received: by 2002:a17:90b:2749:b0:2ee:ba84:5cac with SMTP id 98e67ed59e1d1-2f83abab6b5mr12609111a91.7.1738257203182;
        Thu, 30 Jan 2025 09:13:23 -0800 (PST)
Received: from sultan-box.localdomain ([142.147.89.224])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f84897a52esm2082877a91.8.2025.01.30.09.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:13:22 -0800 (PST)
Sender: Sultan Alsawaf <sultan.kerneltoast@gmail.com>
From: Sultan Alsawaf <sultan@kerneltoast.com>
X-Google-Original-From: Sultan Alsawaf
To: mhklinux@outlook.com
Cc: Martin.Belanger@dell.com,
	axboe@fb.com,
	djeffery@redhat.com,
	dwagner@suse.de,
	gregkh@linuxfoundation.org,
	hch@lst.de,
	jallison@ciq.com,
	jan.kiszka@seimens.com,
	kbusch@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	lukas@wunner.de,
	nathan@kernel.org,
	oohall@gmail.com,
	rafael@kernel.org,
	sagi@grimberg.me,
	spasswolf@web.de,
	stuart.w.hayes@gmail.com
Subject: [PATCH v2] driver core: optimize async device shutdown
Date: Thu, 30 Jan 2025 09:12:48 -0800
Message-ID: <20250130171248.3405-1-sultan@kerneltoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250130030625.4461-1-sultan@kerneltoast.com>
References: <20250130030625.4461-1-sultan@kerneltoast.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sultan Alsawaf <sultan@kerneltoast.com>

The async device shutdown scaffolding assumes any device may be async and
thus schedules an async worker for all devices. This can result in massive
workqueue overhead at shutdown time, even when no async devices are
present.

Optimize async device shutdown by only scheduling async workers for devices
advertising async shutdown support.

This also fixes the (data) race on shutdown_after so that shutdown_after
isn't modified for a device which has already been scheduled for async
shutdown.

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
Changes in v2:
 * Fixed the unbalanced device refcounts, since queue_device_async_shutdown()
   itself needs an extra set of refcounts on top of the refcounts required for
   taking a device off of the devices_kset list

Sultan
---
 drivers/base/base.h |   4 +-
 drivers/base/core.c | 137 +++++++++++++++++++++++++++-----------------
 2 files changed, 89 insertions(+), 52 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index ea18aa70f151..28eb9ffe3ff6 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -105,6 +105,7 @@ struct driver_private {
  * @dead - This device is currently either in the process of or has been
  *	removed from the system. Any asynchronous events scheduled for this
  *	device should exit without taking any action.
+ * @async_shutdown_queued - indicates async shutdown is enqueued for this device
  *
  * Nothing outside of the driver core should ever touch these fields.
  */
@@ -119,7 +120,8 @@ struct device_private {
 	char *deferred_probe_reason;
 	async_cookie_t shutdown_after;
 	struct device *device;
-	u8 dead:1;
+	u8 dead:1,
+	   async_shutdown_queued:1;
 };
 #define to_device_private_parent(obj)	\
 	container_of(obj, struct device_private, knode_parent)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index df0df531b561..a697c13a6787 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3515,7 +3515,6 @@ static int device_private_init(struct device *dev)
 	klist_init(&dev->p->klist_children, klist_children_get,
 		   klist_children_put);
 	INIT_LIST_HEAD(&dev->p->deferred_probe);
-	dev->p->shutdown_after = 0;
 	return 0;
 }
 
@@ -4856,37 +4855,68 @@ static bool device_wants_async_shutdown(struct device *dev)
  * @data: the pointer to the struct device to be shutdown
  * @cookie: not used
  *
- * Shuts down one device, after waiting for previous device to shut down (for
- * synchronous shutdown) or waiting for device's last child or consumer to
- * be shutdown (for async shutdown).
+ * Shuts down one device, after waiting for device's last child or consumer to
+ * be shutdown.
  *
  * shutdown_after is set to the shutdown cookie of the last child or consumer
  * of this device (if any).
  */
 static void shutdown_one_device_async(void *data, async_cookie_t cookie)
 {
-	struct device *dev = data;
-	async_cookie_t wait = cookie;
+	struct device_private *p = data;
 
-	if (device_wants_async_shutdown(dev)) {
-		wait = dev->p->shutdown_after + 1;
+	if (p->shutdown_after)
+		async_synchronize_cookie_domain(p->shutdown_after, &sd_domain);
+
+	shutdown_one_device(p->device);
+}
+
+static void queue_device_async_shutdown(struct device *dev)
+{
+	struct device_link *link;
+	struct device *parent;
+	async_cookie_t cookie;
+	int idx;
+
+	parent = get_device(dev->parent);
+	get_device(dev);
+
+	/*
+	 * Add one to this device's cookie so that when shutdown_after is passed
+	 * to async_synchronize_cookie_domain(), it will wait until *after*
+	 * shutdown_one_device_async() is finished running for this device.
+	 */
+	cookie = async_schedule_domain(shutdown_one_device_async, dev->p,
+				       &sd_domain) + 1;
+
+	/*
+	 * Set async_shutdown_queued to avoid overwriting a parent's
+	 * shutdown_after while the parent is shutting down. This can happen if
+	 * a parent or supplier is not ordered in the devices_kset list before a
+	 * child or consumer, which is not expected.
+	 */
+	dev->p->async_shutdown_queued = 1;
+
+	/* Ensure any parent & suppliers wait for this device to shut down */
+	if (parent) {
+		if (!parent->p->async_shutdown_queued)
+			parent->p->shutdown_after = cookie;
+		put_device(parent);
+	}
+
+	idx = device_links_read_lock();
+	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
+				device_links_read_lock_held()) {
 		/*
-		 * To prevent system hang, revert to sync shutdown in the event
-		 * that shutdown_after would make this shutdown wait for a
-		 * shutdown that hasn't been scheduled yet.
-		 *
-		 * This can happen if a parent or supplier is not ordered in the
-		 * devices_kset list before a child or consumer, which is not
-		 * expected.
+		 * sync_state_only devlink consumers aren't dependent on
+		 * suppliers
 		 */
-		if (wait > cookie) {
-			wait = cookie;
-			dev_warn(dev, "Unsafe shutdown ordering, forcing sync order\n");
-		}
+		if (!device_link_flag_is_sync_state_only(link->flags) &&
+		    !link->supplier->p->async_shutdown_queued)
+			link->supplier->p->shutdown_after = cookie;
 	}
-
-	async_synchronize_cookie_domain(wait, &sd_domain);
-	shutdown_one_device(dev);
+	device_links_read_unlock(idx);
+	put_device(dev);
 }
 
 /**
@@ -4894,16 +4924,37 @@ static void shutdown_one_device_async(void *data, async_cookie_t cookie)
  */
 void device_shutdown(void)
 {
-	struct device *dev, *parent;
-	async_cookie_t cookie;
-	struct device_link *link;
-	int idx;
+	struct device *dev, *parent, *tmp;
+	LIST_HEAD(async_list);
+	bool wait_for_async;
 
 	wait_for_device_probe();
 	device_block_probing();
 
 	cpufreq_suspend();
 
+	/*
+	 * Find devices which can shut down asynchronously, and move them from
+	 * the devices list onto the async list in reverse order.
+	 */
+	spin_lock(&devices_kset->list_lock);
+	list_for_each_entry_safe(dev, tmp, &devices_kset->list, kobj.entry) {
+		if (device_wants_async_shutdown(dev)) {
+			get_device(dev->parent);
+			get_device(dev);
+			list_move(&dev->kobj.entry, &async_list);
+		}
+	}
+	spin_unlock(&devices_kset->list_lock);
+
+	/*
+	 * Dispatch asynchronous shutdowns first so they don't have to wait
+	 * behind any synchronous shutdowns.
+	 */
+	wait_for_async = !list_empty(&async_list);
+	list_for_each_entry_safe(dev, tmp, &async_list, kobj.entry)
+		queue_device_async_shutdown(dev);
+
 	spin_lock(&devices_kset->list_lock);
 	/*
 	 * Walk the devices list backward, shutting down each in turn.
@@ -4928,37 +4979,21 @@ void device_shutdown(void)
 		list_del_init(&dev->kobj.entry);
 		spin_unlock(&devices_kset->list_lock);
 
-		get_device(dev);
-		get_device(parent);
-
-		cookie = async_schedule_domain(shutdown_one_device_async,
-					       dev, &sd_domain);
 		/*
-		 * Ensure any parent & suppliers will wait for this device to
-		 * shut down
+		 * Dispatch an async shutdown if this device has a child or
+		 * consumer that is async. Otherwise, shut down synchronously.
 		 */
-		if (parent) {
-			parent->p->shutdown_after = cookie;
-			put_device(parent);
-		}
-
-		idx = device_links_read_lock();
-		list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
-				device_links_read_lock_held()) {
-			/*
-			 * sync_state_only devlink consumers aren't dependent on
-			 * suppliers
-			 */
-			if (!device_link_flag_is_sync_state_only(link->flags))
-				link->supplier->p->shutdown_after = cookie;
-		}
-		device_links_read_unlock(idx);
-		put_device(dev);
+		if (dev->p->shutdown_after)
+			queue_device_async_shutdown(dev);
+		else
+			shutdown_one_device(dev);
 
 		spin_lock(&devices_kset->list_lock);
 	}
 	spin_unlock(&devices_kset->list_lock);
-	async_synchronize_full_domain(&sd_domain);
+
+	if (wait_for_async)
+		async_synchronize_full_domain(&sd_domain);
 }
 
 /*
-- 
2.48.1

