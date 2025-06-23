Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2361F22F76E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668677; cv=none; b=XJtmO9ykU0V6zfjwE6ZjpbulVPu7q/TN17GtJSxBEwyuqeG5FOjzaTq0LjbuH1D91+77zE/KRKEvkIfaOGpL1Ap2WcT7GLfFFJQB8DzGQdQ3LIwFq66sySPTXb+szCesv8ec681o+ZIo1kmj7b+iTOzq8fpAL5pPcQS3yXhGRRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668677; c=relaxed/simple;
	bh=9KXxsPNu2DS9dR67Q0HnHSA3egsXDbdhpklk/Q9iGcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuDFiBR5txX4I2ZQjR8Do618jCUnYqU0fIVdcg11BexKMt9BP6ayjy/ZQFXa2RcYp801pdYVKpUWSDxrSbQ0HMhPxetI8Lw+W4hXcl83ltGmn6NueN4YJhEl2ztfyUkzizQL9SU4S/Q3LRlWQJRoMr8pKOiZd8Q81PhOzRsgtoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lc/BWpDc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lc/BWpDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2296FC4CEED;
	Mon, 23 Jun 2025 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668676;
	bh=9KXxsPNu2DS9dR67Q0HnHSA3egsXDbdhpklk/Q9iGcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lc/BWpDc69aJQn9xhOm3mz02ZwobZUolo57LgD0Dm/g2/TQ2oOivLwqNcs5ITWLfI
	 kbOsEH77w57pC0VVTI+ss3icKkq2iC7dVEJF4IFcOCcvPks4lqmiUkVocuuc5yOcu3
	 ws/p5ou/w8SlIPAjXdIOVnq9Yf9DFoYxSOageyu1Rqu/L7tcDiOQ4N8kOeJbqIyaia
	 U+POcBFwGxqiwFrvMw4AbOBG9fl16+Vcid47zylYGclALNkjBuk2tW0fu4qxOJRwXP
	 PWby3yOp/dbSBFKBIquqGu61ZPYp22T7r9yiaZd8+oI/LmJXzdJ6ROFxQYx+d7vVwk
	 CPvr+o3/J/Ksg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] mei: vsc: Fix "BUG: Invalid wait context" lockdep error
Date: Mon, 23 Jun 2025 10:50:51 +0200
Message-ID: <20250623085052.12347-10-hansg@kernel.org>
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

Kernels build with CONFIG_PROVE_RAW_LOCK_NESTING report the following
tp-vsc lockdep error:

=============================
 [ BUG: Invalid wait context ]
 ...
 swapper/10/0 is trying to lock:
 ffff88819c271888 (&tp->xfer_wait){....}-{3:3},
  at: __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
 ...
 Call Trace:
 <IRQ>
 ...
 __raw_spin_lock_irqsave (./include/linux/spinlock_api_smp.h:111)
 __wake_up (kernel/sched/wait.c:106 kernel/sched/wait.c:127)
 vsc_tp_isr (drivers/misc/mei/vsc-tp.c:110) mei_vsc_hw
 __handle_irq_event_percpu (kernel/irq/handle.c:158)
 handle_irq_event (kernel/irq/handle.c:195 kernel/irq/handle.c:210)
 handle_edge_irq (kernel/irq/chip.c:833)
 ...
 </IRQ>

The root-cause of this is the IRQF_NO_THREAD flag used by the intel-pinctrl
code. Setting IRQF_NO_THREAD requires all interrupt handlers for GPIO ISRs
to use raw-spinlocks only since normal spinlocks can sleep in PREEMPT-RT
kernels and with IRQF_NO_THREAD the interrupt handlers will always run in
an atomic context [1].

vsc_tp_isr() calls wake_up(&tp->xfer_wait), which uses a regular spinlock,
breaking the raw-spinlocks only rule for Intel GPIO ISRs.

Make vsc_tp_isr() run as threaded ISR instead of as hard ISR to fix this.

Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
Link: https://lore.kernel.org/linux-gpio/18ab52bd-9171-4667-a600-0f52ab7017ac@kernel.org/ [1]
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index f5ea38f22419..5ecf99883996 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -497,7 +497,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 	tp->spi = spi;
 
 	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
-	ret = request_threaded_irq(spi->irq, vsc_tp_isr, NULL,
+	ret = request_threaded_irq(spi->irq, NULL, vsc_tp_isr,
 				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 				   dev_name(dev), tp);
 	if (ret)
-- 
2.49.0

