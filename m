Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CB28E60C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513449; cv=none; b=SS9AGydalbCmoAZwTArpVF7vGJo+tVkS1u4Tu+U686yaFdm5UxpDql7JjHpK59WMLqxTvdkv9Y5ho9GyQayy4LMZDNT69NcWKloDq4u8QOIz5I+lRvoo4M3rzUMf9cEey0hAe8IG+0OIc3IC9yuPIHX2UU9w6MXD+txWBp20VqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513449; c=relaxed/simple;
	bh=oR/a4b9Szk7To5ChYKT4GzPnnr5ezZujkWUCJ23TiTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ljf/MeBgc68hwt6UDMtAYwbTRhRQlmd5GPg734mJHQ9X22UcepYTiSJiTymqSUUYPurzUt7L/rLrse2J2x/8fBOcrL+M9WXKdOqpsDahmZF4z2iKhPhCvJy0MBtoukoF+WXbWBlu8RtwKjVw6YQN1kydJeIof4W+vent0XFoW1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=Y0CVLk1C; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="Y0CVLk1C"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feb0db95e6so817552b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513445; x=1746118245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fgUCgCcd6UdxLBiMyVEIH1ieA5nsUGYJTkW0ajZaXU=;
        b=Y0CVLk1CWkGv5Q14+5RhyFTAy5KoIscZ6RyJq0JDvwt6sNXEoW6eLl5y1BCOZ1vK37
         c5mkEKFS4ZX+zvV93483Ap/j2dDoUYZ/t23F9yt7cyxWYGM3KI5c1/WSHVBoBrIDBoBI
         BOtopNVwgS9ovF73NEHRIsHE3PdRNV///OoPc+IPXaFvZMYz8MkzIfetytXggJLXEvqT
         wpwL4WdgARS9guWWRyv2262Ai4WdfvM//1QZmPVz1eppbr9OjUJU73QEQztPoR6IAuaf
         EHYA5AHc5Gg0/e6p9h0/zb5VoC+Jj66ouRku/rTYylTP3ixCXf0E4us5SllaR+0fgbuk
         aRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513445; x=1746118245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fgUCgCcd6UdxLBiMyVEIH1ieA5nsUGYJTkW0ajZaXU=;
        b=kBDI2dAMyoTJ/XR1shOaC8QCe0jJbtBGGy+mDQciVa7P/0A6mmfWUNTo1q+hKf4F4K
         VA1vcJAgseqXym615jpJgjuha6WBwS7HzNpG1hb1UciFrGQh15cZUpyE5zU7Ueoq2yHc
         VbrI1yxie1w28q21Rj8dfkZ7RChfoBDwhJ187qS3DG+G9s4a5ml7pUpp68yu1mmlKPzQ
         NQwv63FJco0u5xWHu3EGqi4Z9Qfmn18rpu4OjpnEFfRa/QOHhI2fpOXSo84++8wWtC0F
         KCgKHIQ2nqJ28EzQXBbsMgtmbVthEawGlXtlROIbdyWDXKFaKTAIrNkZZZ6SiKBO41TD
         rVPA==
X-Gm-Message-State: AOJu0YxryuqhrEmUACak1iJoDLvD68nRHOIXU8rVCl/+ONUdiqsEowDu
	6kvEvVHPoyBl7xUCHwHFRVOIopZXV57qBwHz61OgrCwSJ2QDaH0aK1aZX+jKpHarvsQf7PH/3ym
	m
X-Gm-Gg: ASbGncvcwzpzSoEfCYYw2yRpKdVyNiR23bY3OPsuNyZBNYcZMSW6nN5pjvYwsaZuwb0
	kUQ/9fQHp8zRLfTFqGo6tm6QbQH6ioN8bTZYMkdXQ/ZOiLlyxgtgkYtlk6Io8x2yIFi8WfoiDb1
	0dFu0pMdZNlpOOuwkxOm2nIKGWqN9zjv9C7yaPQ2CyvoLNyVnV37WZ7+Aj47dIXEQgtaWmpCogd
	rM2w8xtZIFlsw903t8qW2FYz3tP5S7mEe6Pcd6UDP508EBFaDFf/m1gV3eDM+PCADK3e/YH0Mbu
	bZc81LbvzPoROVHkEkxrtvENn4rfTrhAw+U=
X-Google-Smtp-Source: AGHT+IHPcvdv7FB3AhQqLV3hsOXNc3tJB6fClCSl8rmnmdZAKemsfjxh48tjLULNh3+o5YbNVEjOoA==
X-Received: by 2002:a05:6808:3a0f:b0:401:e611:67c7 with SMTP id 5614622812f47-401f123168cmr66506b6e.27.1745513445631;
        Thu, 24 Apr 2025 09:50:45 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec978295sm306930b6e.47.2025.04.24.09.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:45 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 09/23] ipmi:watchdog: Change lock to mutex
Date: Thu, 24 Apr 2025 11:49:46 -0500
Message-ID: <20250424165020.627193-10-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the msghandler does all callbacks in user threads, there is
no need to have a lock any more, a mutex will work fine.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_watchdog.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_watchdog.c b/drivers/char/ipmi/ipmi_watchdog.c
index f1875b2bebbc..01c10bd5f099 100644
--- a/drivers/char/ipmi/ipmi_watchdog.c
+++ b/drivers/char/ipmi/ipmi_watchdog.c
@@ -150,7 +150,7 @@ static char preaction[16] = "pre_none";
 static unsigned char preop_val = WDOG_PREOP_NONE;
 
 static char preop[16] = "preop_none";
-static DEFINE_SPINLOCK(ipmi_read_lock);
+static DEFINE_MUTEX(ipmi_read_mutex);
 static char data_to_read;
 static DECLARE_WAIT_QUEUE_HEAD(read_q);
 static struct fasync_struct *fasync_q;
@@ -793,7 +793,7 @@ static ssize_t ipmi_read(struct file *file,
 	 * Reading returns if the pretimeout has gone off, and it only does
 	 * it once per pretimeout.
 	 */
-	spin_lock_irq(&ipmi_read_lock);
+	mutex_lock(&ipmi_read_mutex);
 	if (!data_to_read) {
 		if (file->f_flags & O_NONBLOCK) {
 			rv = -EAGAIN;
@@ -804,9 +804,9 @@ static ssize_t ipmi_read(struct file *file,
 		add_wait_queue(&read_q, &wait);
 		while (!data_to_read && !signal_pending(current)) {
 			set_current_state(TASK_INTERRUPTIBLE);
-			spin_unlock_irq(&ipmi_read_lock);
+			mutex_unlock(&ipmi_read_mutex);
 			schedule();
-			spin_lock_irq(&ipmi_read_lock);
+			mutex_lock(&ipmi_read_mutex);
 		}
 		remove_wait_queue(&read_q, &wait);
 
@@ -818,7 +818,7 @@ static ssize_t ipmi_read(struct file *file,
 	data_to_read = 0;
 
  out:
-	spin_unlock_irq(&ipmi_read_lock);
+	mutex_unlock(&ipmi_read_mutex);
 
 	if (rv == 0) {
 		if (copy_to_user(buf, &data_to_read, 1))
@@ -856,10 +856,10 @@ static __poll_t ipmi_poll(struct file *file, poll_table *wait)
 
 	poll_wait(file, &read_q, wait);
 
-	spin_lock_irq(&ipmi_read_lock);
+	mutex_lock(&ipmi_read_mutex);
 	if (data_to_read)
 		mask |= (EPOLLIN | EPOLLRDNORM);
-	spin_unlock_irq(&ipmi_read_lock);
+	mutex_unlock(&ipmi_read_mutex);
 
 	return mask;
 }
@@ -932,13 +932,11 @@ static void ipmi_wdog_pretimeout_handler(void *handler_data)
 			if (atomic_inc_and_test(&preop_panic_excl))
 				panic("Watchdog pre-timeout");
 		} else if (preop_val == WDOG_PREOP_GIVE_DATA) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&ipmi_read_lock, flags);
+			mutex_lock(&ipmi_read_mutex);
 			data_to_read = 1;
 			wake_up_interruptible(&read_q);
 			kill_fasync(&fasync_q, SIGIO, POLL_IN);
-			spin_unlock_irqrestore(&ipmi_read_lock, flags);
+			mutex_unlock(&ipmi_read_mutex);
 		}
 	}
 
-- 
2.43.0

