Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132C239096
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668675; cv=none; b=iwkNOv0syuEr/LU0oE1si7OA3O1IpDn9dvvwYZpX0zZgsdhfcCamSO77niTkh+VHSryaENLAQXXQtEDhdZO3QkjxOXyUhUnGUBcb+rNUSYjUsyMk5YTrl0bUdzeXQHC5i74iVkg91wfCMew2O60ClfV5QH5wmxh8OwtD8/7hgc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668675; c=relaxed/simple;
	bh=CbT+W+tiJULj9yW7xTL6IzQw4d0WxvSiWbMt/Ikfrhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUL23jpc5J8omeT+3/yX0pVTDoepK0UNqjOYYb9ihvpc0zT+/Qzp/dmI2duuSCNstHcl5IhoNrOwsXrxnXbAdX4hZ06YzzvMQmMpmMXL7vqgj8kRxwNRqnqPGP7aL3Nq1BvYerzXjWhjjXxg9L604S/b/fndeRpZZRDAesKM4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1gOCDje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1gOCDje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB365C4CEF1;
	Mon, 23 Jun 2025 08:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668674;
	bh=CbT+W+tiJULj9yW7xTL6IzQw4d0WxvSiWbMt/Ikfrhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R1gOCDjeMNib6vEqwp3qwarx2z44DXFp6i43dctlavcgz9awDOxXfPZgncDjVn4AR
	 +ezcEJUnkGzwPhKosWaBX34YQ9W6rvKmKmlzFToCy9SRmMXNycD42T1n2qaGfUPsE6
	 z+0STeMBT+U2kVOickL6Hj7v9R0uf31ZGgEMjR/0iYlQeVP+1jVtM+7V7umbvtGZh1
	 00FnPksZUhD6fZ/HODHGntY8cudNqGoaFZkb+vGw/yZpXABIsLBQD1Co4WyGwwlcUy
	 uC1C5eJyWEuxELv9KhgpkqSICtUK/5OeBuGs6x36izGliVRhtm6oGWFN+h7JdFzBQ7
	 ozO2soPnyjsDA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] mei: vsc: Run event callback from a workqueue
Date: Mon, 23 Jun 2025 10:50:50 +0200
Message-ID: <20250623085052.12347-9-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event_notify callback in some cases calls vsc_tp_xfer(), which checks
tp->assert_cnt and waits for it through the tp->xfer_wait wait-queue.

And tp->assert_cnt is increased and the tp->xfer_wait queue is woken o
from the interrupt handler.

So the interrupt handler which is running the event callback is waiting for
itself to signal that it can continue.

This happens to work because the event callback runs from the threaded
ISR handler and while that is running the hard ISR handler will still
get called a second / third time for further interrupts and it is the hard
ISR handler which does the atomic_inc() and wake_up() calls.

But having the threaded ISR handler wait for its own interrupt to trigger
again is not how a threaded ISR handler is supposed to be used.

Move the running of the event callback from a threaded interrupt handler
to a workqueue since a threaded ISR should not wait for events from its
own interrupt.

This is a preparation patch for moving the atomic_inc() and wake_up() calls
to the threaded ISR handler, which is necessary to fix a locking issue.

Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 76a6aa606a26..f5ea38f22419 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include "vsc-tp.h"
 
@@ -76,6 +77,7 @@ struct vsc_tp {
 
 	atomic_t assert_cnt;
 	wait_queue_head_t xfer_wait;
+	struct work_struct event_work;
 
 	vsc_tp_event_cb_t event_notify;
 	void *event_notify_context;
@@ -105,19 +107,19 @@ static irqreturn_t vsc_tp_isr(int irq, void *data)
 
 	wake_up(&tp->xfer_wait);
 
-	return IRQ_WAKE_THREAD;
+	schedule_work(&tp->event_work);
+
+	return IRQ_HANDLED;
 }
 
-static irqreturn_t vsc_tp_thread_isr(int irq, void *data)
+static void vsc_tp_event_work(struct work_struct *work)
 {
-	struct vsc_tp *tp = data;
+	struct vsc_tp *tp = container_of(work, struct vsc_tp, event_work);
 
 	guard(mutex)(&tp->event_notify_mutex);
 
 	if (tp->event_notify)
 		tp->event_notify(tp->event_notify_context);
-
-	return IRQ_HANDLED;
 }
 
 /* wakeup firmware and wait for response */
@@ -495,7 +497,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 	tp->spi = spi;
 
 	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
-	ret = request_threaded_irq(spi->irq, vsc_tp_isr, vsc_tp_thread_isr,
+	ret = request_threaded_irq(spi->irq, vsc_tp_isr, NULL,
 				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				   dev_name(dev), tp);
 	if (ret)
@@ -503,6 +505,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 
 	mutex_init(&tp->mutex);
 	mutex_init(&tp->event_notify_mutex);
+	INIT_WORK(&tp->event_work, vsc_tp_event_work);
 
 	/* only one child acpi device */
 	ret = acpi_dev_for_each_child(ACPI_COMPANION(dev),
@@ -527,6 +530,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 err_destroy_lock:
 	free_irq(spi->irq, tp);
 
+	cancel_work_sync(&tp->event_work);
 	mutex_destroy(&tp->event_notify_mutex);
 	mutex_destroy(&tp->mutex);
 
@@ -542,6 +546,7 @@ static void vsc_tp_remove(struct spi_device *spi)
 
 	free_irq(spi->irq, tp);
 
+	cancel_work_sync(&tp->event_work);
 	mutex_destroy(&tp->event_notify_mutex);
 	mutex_destroy(&tp->mutex);
 }
-- 
2.49.0

