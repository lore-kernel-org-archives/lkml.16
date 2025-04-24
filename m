Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 0088C15573A;
	Thu, 24 Apr 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745506117; cv=none; b=e7VbQqrPcyDoYiBMgmkUHR0ziuXU32i3XcM7R7fMTFQY2ybAkQZgtvEjOinciLUDMmFRWpjNirbcQsqwvVfJv5ZoKsmx6Ymj0pwV7P7o5iZmLplXxsh7tiN425HQAaKrXjtL8+/ekHc51BlEoWMrtE+9JnJdnzWpMrhyYySSLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745506117; c=relaxed/simple;
	bh=XB+Lspht3JiXhBFV+R5zHwFM9Ml8AwPDyWG7DuawO7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=O0zwT6ADiPogoAsKApxLEPcPZEtr26sYfwr1TgcQ12h4cBU313t+UyP+2SnGAQ/GcaP1lGQm/ccMy3rRpPRKsX09Hy3ig8GqtzlgD8gJBIDD2ZMgRCj0rnen6YGWOHviWw6d7pE+r0fTA4ylENFhR9XFjTl0M45BG2Tldwu9k9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPA id 0723760497EAF;
	Thu, 24 Apr 2025 22:48:30 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH 3/3] alarmtimer: switch spin_{lock,unlock}_irqsave() to guard()
Date: Thu, 24 Apr 2025 22:48:20 +0800
Message-Id: <20250424144819.24884-4-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250424144819.24884-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are two code styles for the lock in alarmtimer, guard() and
spin_{lock,unlock}_irqsave(). Switch all these to guard() to make code
neater.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 kernel/time/alarmtimer.c | 84 ++++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 47 deletions(-)

diff --git a/kernel/time/alarmtimer.c b/kernel/time/alarmtimer.c
index e5450a77ada9..920a3544d0cd 100644
--- a/kernel/time/alarmtimer.c
+++ b/kernel/time/alarmtimer.c
@@ -70,12 +70,10 @@ static DEFINE_SPINLOCK(rtcdev_lock);
  */
 struct rtc_device *alarmtimer_get_rtcdev(void)
 {
-	unsigned long flags;
 	struct rtc_device *ret;
 
-	spin_lock_irqsave(&rtcdev_lock, flags);
-	ret = rtcdev;
-	spin_unlock_irqrestore(&rtcdev_lock, flags);
+	scoped_guard(spinlock_irqsave, &rtcdev_lock)
+		ret = rtcdev;
 
 	return ret;
 }
@@ -83,7 +81,6 @@ EXPORT_SYMBOL_GPL(alarmtimer_get_rtcdev);
 
 static int alarmtimer_rtc_add_device(struct device *dev)
 {
-	unsigned long flags;
 	struct rtc_device *rtc = to_rtc_device(dev);
 	struct platform_device *pdev;
 	int ret = 0;
@@ -101,22 +98,21 @@ static int alarmtimer_rtc_add_device(struct device *dev)
 	if (!IS_ERR(pdev))
 		device_init_wakeup(&pdev->dev, true);
 
-	spin_lock_irqsave(&rtcdev_lock, flags);
-	if (!IS_ERR(pdev) && !rtcdev) {
-		if (!try_module_get(rtc->owner)) {
+	scoped_guard(spinlock_irqsave, &rtcdev_lock) {
+		if (!IS_ERR(pdev) && !rtcdev) {
+			if (!try_module_get(rtc->owner)) {
+				ret = -1;
+				break;
+			}
+
+			rtcdev = rtc;
+			/* hold a reference so it doesn't go away */
+			get_device(dev);
+			pdev = NULL;
+		} else {
 			ret = -1;
-			goto unlock;
 		}
-
-		rtcdev = rtc;
-		/* hold a reference so it doesn't go away */
-		get_device(dev);
-		pdev = NULL;
-	} else {
-		ret = -1;
 	}
-unlock:
-	spin_unlock_irqrestore(&rtcdev_lock, flags);
 
 	platform_device_unregister(pdev);
 
@@ -198,7 +194,7 @@ static enum hrtimer_restart alarmtimer_fired(struct hrtimer *timer)
 	struct alarm *alarm = container_of(timer, struct alarm, timer);
 	struct alarm_base *base = &alarm_bases[alarm->type];
 
-	scoped_guard (spinlock_irqsave, &base->lock)
+	scoped_guard(spinlock_irqsave, &base->lock)
 		alarmtimer_dequeue(base, alarm);
 
 	if (alarm->function)
@@ -230,15 +226,15 @@ static int alarmtimer_suspend(struct device *dev)
 	ktime_t min, now, expires;
 	int i, ret, type;
 	struct rtc_device *rtc;
-	unsigned long flags;
 	struct rtc_time tm;
 
-	spin_lock_irqsave(&freezer_delta_lock, flags);
-	min = freezer_delta;
-	expires = freezer_expires;
-	type = freezer_alarmtype;
-	freezer_delta = 0;
-	spin_unlock_irqrestore(&freezer_delta_lock, flags);
+	scoped_guard(spinlock_irqsave, &freezer_delta_lock) {
+		min = freezer_delta;
+		expires = freezer_expires;
+		type = freezer_alarmtype;
+		freezer_delta = 0;
+	}
+
 
 	rtc = alarmtimer_get_rtcdev();
 	/* If we have no rtcdev, just return */
@@ -251,9 +247,8 @@ static int alarmtimer_suspend(struct device *dev)
 		struct timerqueue_node *next;
 		ktime_t delta;
 
-		spin_lock_irqsave(&base->lock, flags);
-		next = timerqueue_getnext(&base->timerqueue);
-		spin_unlock_irqrestore(&base->lock, flags);
+		scoped_guard(spinlock_irqsave, &base->lock)
+			next = timerqueue_getnext(&base->timerqueue);
 		if (!next)
 			continue;
 		delta = ktime_sub(next->expires, base->get_ktime());
@@ -352,13 +347,13 @@ EXPORT_SYMBOL_GPL(alarm_init);
 void alarm_start(struct alarm *alarm, ktime_t start)
 {
 	struct alarm_base *base = &alarm_bases[alarm->type];
-	unsigned long flags;
 
-	spin_lock_irqsave(&base->lock, flags);
-	alarm->node.expires = start;
-	alarmtimer_enqueue(base, alarm);
-	hrtimer_start(&alarm->timer, alarm->node.expires, HRTIMER_MODE_ABS);
-	spin_unlock_irqrestore(&base->lock, flags);
+	scoped_guard(spinlock_irqsave, &base->lock) {
+		alarm->node.expires = start;
+		alarmtimer_enqueue(base, alarm);
+		hrtimer_start(&alarm->timer, alarm->node.expires,
+			      HRTIMER_MODE_ABS);
+	}
 
 	trace_alarmtimer_start(alarm, base->get_ktime());
 }
@@ -381,13 +376,11 @@ EXPORT_SYMBOL_GPL(alarm_start_relative);
 void alarm_restart(struct alarm *alarm)
 {
 	struct alarm_base *base = &alarm_bases[alarm->type];
-	unsigned long flags;
 
-	spin_lock_irqsave(&base->lock, flags);
+	guard(spinlock_irqsave)(&base->lock);
 	hrtimer_set_expires(&alarm->timer, alarm->node.expires);
 	hrtimer_restart(&alarm->timer);
 	alarmtimer_enqueue(base, alarm);
-	spin_unlock_irqrestore(&base->lock, flags);
 }
 EXPORT_SYMBOL_GPL(alarm_restart);
 
@@ -401,14 +394,13 @@ EXPORT_SYMBOL_GPL(alarm_restart);
 int alarm_try_to_cancel(struct alarm *alarm)
 {
 	struct alarm_base *base = &alarm_bases[alarm->type];
-	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&base->lock, flags);
-	ret = hrtimer_try_to_cancel(&alarm->timer);
-	if (ret >= 0)
-		alarmtimer_dequeue(base, alarm);
-	spin_unlock_irqrestore(&base->lock, flags);
+	scoped_guard(spinlock_irqsave, &base->lock) {
+		ret = hrtimer_try_to_cancel(&alarm->timer);
+		if (ret >= 0)
+			alarmtimer_dequeue(base, alarm);
+	}
 
 	trace_alarmtimer_cancel(alarm, base->get_ktime());
 	return ret;
@@ -479,7 +471,6 @@ EXPORT_SYMBOL_GPL(alarm_forward_now);
 static void alarmtimer_freezerset(ktime_t absexp, enum alarmtimer_type type)
 {
 	struct alarm_base *base;
-	unsigned long flags;
 	ktime_t delta;
 
 	switch(type) {
@@ -498,13 +489,12 @@ static void alarmtimer_freezerset(ktime_t absexp, enum alarmtimer_type type)
 
 	delta = ktime_sub(absexp, base->get_ktime());
 
-	spin_lock_irqsave(&freezer_delta_lock, flags);
+	guard(spinlock_irqsave)(&freezer_delta_lock);
 	if (!freezer_delta || (delta < freezer_delta)) {
 		freezer_delta = delta;
 		freezer_expires = absexp;
 		freezer_alarmtype = type;
 	}
-	spin_unlock_irqrestore(&freezer_delta_lock, flags);
 }
 
 /**
-- 
2.30.2

