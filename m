Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345B1AAE13
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971741; cv=none; b=R5v4Sv5pcd4yUBu0+1QyavraN9FuNSSNXbiavKdTotLDP/lWZXKRPhoxvCAVOW0/Jvpaeci3qPG1QstYMZ6bBb3TMoE/Xh7g7FsAQq94adir9t6rrRbu6ALZeyANAuLapA/w2/AF6ernMa5LJtLf16FlPp4z/DhNrahsdKf0LVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971741; c=relaxed/simple;
	bh=uxBiam5DW4fuTxINZdCznl0HQyCEFQQbzh0ALsr6FA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0C9QzxI80gbWZbw7ClTf891l5Sg+31MtVIwakpPPDohFOTSQVLNzgR/GUuu+52Aq8wXGTx1pxeQx79/xzlE38OmC0iZT4TvLmVVn16r66W02lH6aUVEbXZUsc44gljHjJfsCLwf1gFQjh4O6AW1eJlCk+1XSnNuh0rjZxs2buo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmdZc6YK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmdZc6YK"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so3159375e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971738; x=1744576538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=;
        b=LmdZc6YKLWjjGvfDJFbbHiKFN6qSAL3CYaF0k3vCxV0eJfPzGfjoL+ytqWNzUyXaZi
         DZ/l8woh48oBPO79bC/1faGiI81LCsDND2Hj589/Ce7EpFSFlBADVBguzJxUJV/hZe9j
         cP4j+Zzfu7VaTuUc3OTYHZDxIXEr4hA9QFZyyPftW2YouTuJKmcJ+6XR89jgbxjKDS24
         dxPYQ876x2W02KHb1Td6BK5axG15wbV1d2sTBlr8cLNHjzPTvlAWt3vKltgwh5RVd6RW
         bhPN0xbaDpeA4LL4d8noujrsErmhqkvaBblm3a44uGRLxxW3j+0rCtBN9GwdawBNz9YB
         GWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971738; x=1744576538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Oni6Z/lHvJDm4dC2qfnAqvwTkcCLV7N0fQ4hIhJQyc=;
        b=wex50Fhw/zeiiUenT9N0jGGQoi8FMgRnkzUgoJW7JlXIp4HjcW4EBcsfcmktHFNaqj
         gx7bEyc+YTF9XHAffsOb60q2oSr56qZK9ebjmYa/by/MPPFuQo5lW0zHjoWqHGgtit/t
         KdfY/kEK2bNXoBJaHvz8GxRdUyrPXZ7S5N2Vdj8eArWjjCJKoT6vqpmW7O+yFh5CgeV1
         z43EuUwFbTzkWdk1y+1OtZNEPhlnLbotTQhEpH8y5OJ4hXDx8ckVJ3phM9/cb07HxYNP
         b+h+LCEB4L5vBGkeTgEswrM8Dy8uwAn2Zc3vbc4HRe7GaD5Kckt8j4Pxb4qp5oOvuNSQ
         Vj5g==
X-Forwarded-Encrypted: i=1; AJvYcCU6KzOz6wVy0PjelO0DrdC0Y+8c0cxoIALXC0gMWC5uTFTewNAs4Cx69fsnQVSBswNWamOtgq8dZWeD0o4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEyfS4KsUNAVfmRSbSwCrUcwWHgKESVacl1J7+2KikCx7YsRxB
	4m3m5RP03sE1GkkRp2qbSPJysG6Q7lc8opEVlIxsSjigsmmBFjd2MDlfmLDtMX0=
X-Gm-Gg: ASbGncuf6fHQLisSTeMIronNC1MQtER8jRQzdRzNc2DfT5RThhOJYBXY+pDZUIZsuVK
	wJVWxmY1jKxMQ1S7cakDnc2H/BLPqZHzM4s3YQGAVKaAlC4O4UzhAoUe2D1LIJyo+qeWeHfqfeq
	aIXCeOTpBedNXfd28JVX6PivpT/XUyRLul8b2CIPqIOVQzfg5eVPSWSehMnActxOrb30ru/txkf
	fmtt3IPOAhVEvnF4NSFvwngbUCKLTy2PIRjj3YD+X7KQt6kB/PuDoK6sz6JrMs71gFICBhVKU5F
	wwJYoWvm9vRKEnbHkNh9NEPMb3cpzDmgB7yEtYIlh5exoJGhCzno4A==
X-Google-Smtp-Source: AGHT+IFdkV0qo7M6MnBRCoiFVbhYiS1XD9xft1NUY735rauYmXbOkSn8HVSEp3wFfmum1Z3fJ/qIqQ==
X-Received: by 2002:a5d:59ac:0:b0:391:2a9a:47a6 with SMTP id ffacd0b85a97d-39cb3595265mr3095383f8f.4.1743971737746;
        Sun, 06 Apr 2025 13:35:37 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm38022f8f.69.2025.04.06.13.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:35:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] watchdog: Correct kerneldoc warnings
Date: Sun,  6 Apr 2025 22:35:31 +0200
Message-ID: <20250406203531.61322-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct kerneldoc syntax or drop kerneldoc entirely for function
comments not being kerneldoc to fix warnings like:

  pretimeout_noop.c:19: warning: Function parameter or struct member 'wdd' not described in 'pretimeout_noop'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/pcwd_usb.c         | 6 +++---
 drivers/watchdog/pretimeout_noop.c  | 2 +-
 drivers/watchdog/pretimeout_panic.c | 2 +-
 drivers/watchdog/wdt_pci.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/pcwd_usb.c b/drivers/watchdog/pcwd_usb.c
index 132699e2f247..b636650b714b 100644
--- a/drivers/watchdog/pcwd_usb.c
+++ b/drivers/watchdog/pcwd_usb.c
@@ -579,7 +579,7 @@ static struct notifier_block usb_pcwd_notifier = {
 	.notifier_call =	usb_pcwd_notify_sys,
 };
 
-/**
+/*
  *	usb_pcwd_delete
  */
 static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
@@ -590,7 +590,7 @@ static inline void usb_pcwd_delete(struct usb_pcwd_private *usb_pcwd)
 	kfree(usb_pcwd);
 }
 
-/**
+/*
  *	usb_pcwd_probe
  *
  *	Called by the usb core when a new device is connected that it thinks
@@ -758,7 +758,7 @@ static int usb_pcwd_probe(struct usb_interface *interface,
 }
 
 
-/**
+/*
  *	usb_pcwd_disconnect
  *
  *	Called by the usb core when the device is removed from the system.
diff --git a/drivers/watchdog/pretimeout_noop.c b/drivers/watchdog/pretimeout_noop.c
index 4799551dd784..74ec02b9ffca 100644
--- a/drivers/watchdog/pretimeout_noop.c
+++ b/drivers/watchdog/pretimeout_noop.c
@@ -11,7 +11,7 @@
 
 /**
  * pretimeout_noop - No operation on watchdog pretimeout event
- * @wdd - watchdog_device
+ * @wdd: watchdog_device
  *
  * This function prints a message about pretimeout to kernel log.
  */
diff --git a/drivers/watchdog/pretimeout_panic.c b/drivers/watchdog/pretimeout_panic.c
index 2cc3c41d2be5..8c3ac674dc45 100644
--- a/drivers/watchdog/pretimeout_panic.c
+++ b/drivers/watchdog/pretimeout_panic.c
@@ -11,7 +11,7 @@
 
 /**
  * pretimeout_panic - Panic on watchdog pretimeout event
- * @wdd - watchdog_device
+ * @wdd: watchdog_device
  *
  * Panic, watchdog has not been fed till pretimeout event.
  */
diff --git a/drivers/watchdog/wdt_pci.c b/drivers/watchdog/wdt_pci.c
index dc5f29560e9b..3918a600f2a0 100644
--- a/drivers/watchdog/wdt_pci.c
+++ b/drivers/watchdog/wdt_pci.c
@@ -264,7 +264,7 @@ static int wdtpci_get_status(int *status)
 	return 0;
 }
 
-/**
+/*
  *	wdtpci_get_temperature:
  *
  *	Reports the temperature in degrees Fahrenheit. The API is in
-- 
2.45.2

