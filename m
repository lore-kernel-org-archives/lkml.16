Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575978F39
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 09:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869457; cv=none; b=qzhLuCe8jxzCrUNa1Q95mkMkaeKvrXuGC1bCdj04/RjFUqTzOhmDQdiEfgsKT2cIldIrVxnmHYcgUSfU+73nqn1OY1yxH7OIdUW+98mSAB00xXzVHdSK0Lx7Psiyyp9/K2idBaNp//YnXWrvM2fZrNSh6Cr4eKzcrNgzsZp+1UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869457; c=relaxed/simple;
	bh=B/rp+opmpsKwWO3OR+xcnlHBWgqfAq6PqFespyLJhN0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kOzPV+wlq7sx3iR9nTFpUHXtLuNuRqaseIt/Edt8CuQehre9O8/N44j/YUqM5frzNMDLkJIZwxOvLgm4x1SDhbQeEHW+rCZp7HdScunPdhrMCYoSdclTTQVlmllahwD9kXFgT5/LsYC7JewUfFJFcAjbtB3YCEdq8WPdB5qR6MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Zvgc671xyz27hNk;
	Sat, 10 May 2025 17:31:34 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 7305D140146;
	Sat, 10 May 2025 17:30:48 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 10 May
 2025 17:30:47 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <tzimmermann@suse.de>, <airlied@gmail.com>,
	<maarten.lankhorst@linux.intel.com>, <mario.kleiner@tuebingen.mpg.de>,
	<airlied@redhat.com>, <mripard@kernel.org>, <simona@ffwll.ch>
CC: <bobo.shaobowang@huawei.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/vblank: Fix hard lockup in drm_handle_vblank()
Date: Sat, 10 May 2025 17:47:57 +0800
Message-ID: <20250510094757.4174662-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf100008.china.huawei.com (7.202.181.222)

When we performed fuzz testing on DRM using syzkaller, we encountered
the following hard lockup issue:

Kernel panic - not syncing: Hard LOCKUP
CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.6.0+ #21
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Call Trace:
 <IRQ>
 hrtimer_cancel+0x52/0x70 kernel/time/hrtimer.c:1449
 __disable_vblank drivers/gpu/drm/drm_vblank.c:434 [inline]
 drm_vblank_disable_and_save+0x27f/0x3c0 drivers/gpu/drm/drm_vblank.c:478
 vblank_disable_fn+0x15d/0x1b0 drivers/gpu/drm/drm_vblank.c:495
 call_timer_fn+0x39/0x280 kernel/time/timer.c:1700
 expire_timers+0x22d/0x3c0 kernel/time/timer.c:1751
 __run_timers kernel/time/timer.c:2022 [inline]
 run_timer_softirq+0x315/0x8a0 kernel/time/timer.c:2035
 handle_softirqs+0x195/0x580 kernel/softirq.c:553
 __do_softirq kernel/softirq.c:587 [inline]
 </IRQ>

This is a deadlock issue as follows:

    CPU3				CPU 7

vblank_disable_fn()
  drm_vblank_disable_and_save()
  spin_lock(vblank_time_lock)
				hrtimer_interrupt()
				  vkms_vblank_simulate()
				    drm_handle_vblank()
				      // wait for CPU3 to release vblank_time_lock
				      spin_lock(vblank_time_lock)
    vkms_disable_vblank()
      // wait for vblank_hrtimer on CPU7 to finish
      hrtimer_cancel(vblank_hrtimer)

The call of hrtimer_cancel() has hold vblank_time_lock which would prevent
completion of the hrtimer's callback function.

Therefore, in drm_handle_vblank(), we move the check for the
vblank->enabled variable to the time when vblank_time_lock() is acquired.
If the CRTC event has already been canceled, the drm_handle_vblank() will
be terminated and will no longer attempt to acquire vblank_time_lock.

In the same time, in drm_vblank_disable_and_save(), we set vblank->enabled
to disable before calling hrtimer_cancel() to avoid endless waiting in
hrtimer_cancel_wait_running().

Fixes: 27641c3f003e ("drm/vblank: Add support for precise vblank timestamping.")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/gpu/drm/drm_vblank.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 78958ddf8485..56b80e5ede2a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -471,6 +471,8 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 	if (!vblank->enabled)
 		goto out;
 
+	vblank->enabled = false;
+
 	/*
 	 * Update the count and timestamp to maintain the
 	 * appearance that the counter has been ticking all along until
@@ -479,7 +481,6 @@ void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe)
 	 */
 	drm_update_vblank_count(dev, pipe, false);
 	__disable_vblank(dev, pipe);
-	vblank->enabled = false;
 
 out:
 	spin_unlock_irqrestore(&dev->vblank_time_lock, irqflags);
@@ -1932,14 +1933,13 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	 * vblank enable/disable, as this would cause inconsistent
 	 * or corrupted timestamps and vblank counts.
 	 */
-	spin_lock(&dev->vblank_time_lock);
-
-	/* Vblank irq handling disabled. Nothing to do. */
-	if (!vblank->enabled) {
-		spin_unlock(&dev->vblank_time_lock);
-		spin_unlock_irqrestore(&dev->event_lock, irqflags);
-		return false;
-	}
+	do {
+		/* Vblank irq handling disabled. Nothing to do. */
+		if (!vblank->enabled) {
+			spin_unlock_irqrestore(&dev->event_lock, irqflags);
+			return false;
+		}
+	} while (!spin_trylock(&dev->vblank_time_lock));
 
 	drm_update_vblank_count(dev, pipe, true);
 
-- 
2.25.1

