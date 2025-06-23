Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD32367CC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668670; cv=none; b=oKSNosvTHpNJz2OMSP1twOZ1YLsxkztwUO7Im6bJaufbfJQHXIF3dqTB819nwPji44kiomyO2twzj7zBLO28ERDraanduafAOCE61MiJe1gcTqu8gqdqBHiZXOBkk1tHcg7lsqLySpWvY9lq45cke7gYUEUu93VHE/kAc+Xdql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668670; c=relaxed/simple;
	bh=Hwrcx7bSN2Q64gKzKoyNC9kLUgY3eRMYO5s66lvzboM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6ejlt10a2ILpiwrfbuPdg6pxgMjU9SMChrAHkFpkjuTXlEGywPu2RkI+R7ltHsnoEwAfssgkHCM+9g/37IL0IL15AhuXthPnbPAPpY0bIXmV6SpBldvZ3kP6EyPfeV2z/f1J6WzG9QCOrkvdV1+dIWouWzG6MA2u1pNX+7nDxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIF7OuxA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIF7OuxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00ACAC4CEEA;
	Mon, 23 Jun 2025 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668670;
	bh=Hwrcx7bSN2Q64gKzKoyNC9kLUgY3eRMYO5s66lvzboM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BIF7OuxAWbyFWv201CpYKfPznnWRed9DUZ3f9YKrPdFJHRpZxb5fcUA2X1eE1Bykw
	 NFXrro+S+AacGrYuaMURQwAWcoLsffnsb5zxyIy3JW4r4ehrI/dRo4e1zp7T0Xb5sC
	 IRIJMWQngY2tkB7mhQOyq3ZlG5mvF6erVLGAUHNo1Pu4/JguoAA0k93H8fGPOL4hHs
	 JnlJFXUgga49VnUcOH0oyyIBKLw4TRMmvTZuepm/vQAfaqZVRLcbcr3G8qe+yP7faq
	 X63JTvhjk4uubV9UL7z6Ac9yvhD6T96Ea/HneNp5wNb/VfgtOlzS3smrT9SNDn5pI1
	 XHe9x61oGu+aw==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] mei: vsc: Event notifier fixes
Date: Mon, 23 Jun 2025 10:50:48 +0200
Message-ID: <20250623085052.12347-7-hansg@kernel.org>
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

vsc_tp_register_event_cb() can race with vsc_tp_thread_isr(), add a mutex
to protect against this.

Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 0feebffabdb3..76a6aa606a26 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -79,9 +79,8 @@ struct vsc_tp {
 
 	vsc_tp_event_cb_t event_notify;
 	void *event_notify_context;
-
-	/* used to protect command download */
-	struct mutex mutex;
+	struct mutex event_notify_mutex;	/* protects event_notify + context */
+	struct mutex mutex;			/* protects command download */
 };
 
 /* GPIO resources */
@@ -113,6 +112,8 @@ static irqreturn_t vsc_tp_thread_isr(int irq, void *data)
 {
 	struct vsc_tp *tp = data;
 
+	guard(mutex)(&tp->event_notify_mutex);
+
 	if (tp->event_notify)
 		tp->event_notify(tp->event_notify_context);
 
@@ -399,6 +400,8 @@ EXPORT_SYMBOL_NS_GPL(vsc_tp_need_read, "VSC_TP");
 int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
 			    void *context)
 {
+	guard(mutex)(&tp->event_notify_mutex);
+
 	tp->event_notify = event_cb;
 	tp->event_notify_context = context;
 
@@ -499,6 +502,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 		return ret;
 
 	mutex_init(&tp->mutex);
+	mutex_init(&tp->event_notify_mutex);
 
 	/* only one child acpi device */
 	ret = acpi_dev_for_each_child(ACPI_COMPANION(dev),
@@ -523,6 +527,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 err_destroy_lock:
 	free_irq(spi->irq, tp);
 
+	mutex_destroy(&tp->event_notify_mutex);
 	mutex_destroy(&tp->mutex);
 
 	return ret;
@@ -537,6 +542,7 @@ static void vsc_tp_remove(struct spi_device *spi)
 
 	free_irq(spi->irq, tp);
 
+	mutex_destroy(&tp->event_notify_mutex);
 	mutex_destroy(&tp->mutex);
 }
 
-- 
2.49.0

