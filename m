Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8594C2192F2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566316; cv=none; b=sK9w59W/lqyETXhrJjM9xzOdIbMW5ODmM3mCG1MOiESF/ua5w2Vami3qj0bbwaU42ELJkFB6661VSe7ReZvEStnQ+PbZTmpkPPpfMtvCIdyG4a+o8O531IJztfJjVx5TFY9L/G1UV55AciQK0gNaxE/1AKkitjfpsSj2tWYZBqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566316; c=relaxed/simple;
	bh=Qq9fIseB6gb/ver++jBeKOrouYgQmp9/vrQcSFqI4mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q8sRPF0sfnPqkD43iQAA7r1NzJfu46MCvAoi2AFGN5leFgDDeIn5E6/6ViQNe7HH5ZP7Me2Lec5RbZEtLbgTmMS71mG5YLsNoEFXUGGUrJR42x3i5X9rzc4f+e5jg6GwB6N+MH/0m7SDEWEPOeiH4CAmVWaTedRwUb/Qeaap7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oZ30zpe3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oZ30zpe3"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45310223677so19987485e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566313; x=1750171113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxAwG+kplqaCnxCSj5FTH8TFj3pQX00WZhLLV2ey3uk=;
        b=oZ30zpe3a1Y5tTnMYyM7uibd4THq8tiOvg0xuB/Fi07S8wYUg98PnD2fzZhtzMTT/y
         GIpERtvijYK+Isn8QwVLthORC3XMxbmh4V7cBjB7xJVI6hZ4o16lwdQsegWQUESIZVLB
         36og5PmjsTnnCmOJQ5iUZyVLHAek4JSZ0jrLfsViLo+mvMcZ9OaSMTh/WijAumM4IXHp
         WV6yqZ2D+v0X1BuVZmCVO630WMMTbyr/7EU7ImWZARYQc9CUb6ZvAxO/WolysAYPWHzg
         7VbkOeK24qCrILzUiUISJ/JHTMyB/rKRNElSmvGrKV7qEM7oThFaQC8LKhqyFl9GBfzw
         hu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566313; x=1750171113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxAwG+kplqaCnxCSj5FTH8TFj3pQX00WZhLLV2ey3uk=;
        b=YTRFG4jleldUCHaSsCJCWPo2fDlT6zGgOUjeFGjqJj/InPa3Bwna/zfDOcT86/tluT
         vr7lV9oH48dQs1mImJsPOtbj8n86ecJxYHta7roGz3NhC1+k3R4aSMApOiMHXLkjE0y0
         A4zsBCOVYAMZZfvg1MFNy2tm+17TxhJMtYujXaRLAlHaA/dNXKkwJ4ZmBssskWtOUcU0
         ovNdoOpCwFb9kRm6VTMsT76inpiURiEztc5C0hIl4gQqxfTXdYetsvocv9Ix8gXCt0/7
         W07OcZ+Cqh9OutFezWxC7Z077xF0E0qfBZA3H32TY0VZWn+Jw2s1GQtePMMk1GcHwnpv
         OCVA==
X-Forwarded-Encrypted: i=1; AJvYcCWjJVxdpXU06wFIPJJcqg1OqGyZwsnO8hKEw0dSqswZW2RAu5uszmbTyXddokTfEwg8XTMuy1ia6eEj2yw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvQ45W8Rz1hYkR9jFvnQZCLyZwbFKNRbk883t3C9IKIzyD0bS
	N0bQ3yFI5nBuBB7pqSGi6c0BuoJW28mCXzWk40HF8773tSgNUHj4tdPcaNPMQq9r5HU=
X-Gm-Gg: ASbGnctJRN+CNq7bcitbS/fMxZWlCxjOJsg4t4SdCAI92R/nU0pycAPoUR0wyZ9pGt5
	yj38gCHlzH++6dZoW2lrbcMzd4INRYPA2DLKGYOcIVtAPwC3XpE4rXKCXi+QtCOQbsKPKqNv8uZ
	uMQmnkAMN9jvLEK/3P0/cQ5rpnZwzZKlLxIKkPI9K2C/e8XkncdmLEJKyLBwLIhUEsR7yKjl6Ml
	a1BScunWP1Xr61MV1U5+hLVSSCmnXzRI6jJy74+FqrCue3VEmtHRiO/8xVU4bWG1uyyZv+Uf2r2
	IiAweVbqJeCB9ZhKQ8G456Kk+yKJ2h6G1wq9W7A6ZPaYtVvIak/8
X-Google-Smtp-Source: AGHT+IEFyaeIP3T0Ehi8PeMDhGrDKSKdxzezZvGSc6n8IFLaX5lda2NAuMtyShPdC8E0HiY6ckXmbA==
X-Received: by 2002:a05:600c:6792:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-4520138974bmr162802165e9.11.1749566312788;
        Tue, 10 Jun 2025 07:38:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 16:38:20 +0200
Subject: [PATCH RFC/RFT 05/15] gpio: sysfs: remove unneeded headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpio-sysfs-chip-export-v1-5-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZzKrszs+G8SUIpo3FlFljAL+3IaTQq3RZ1Iz/yMv618=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENgtdqTN36J6Qox+cSHpKqwAD9+WMqD+FfJB
 O5atuCP4ZOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDYAAKCRARpy6gFHHX
 cnTfD/0YorOW4Ei+N4MZBlIZyNGgK8lOHbL+HNZhFrp/s+Zoh2Xx8ZU6mnhKCYBOIl7QAwyDo3c
 GdhVB07w4VQ0dEUM9PczqLhmbngp4Hr12I1OVLRFf2YR1b9zcqdT80A6nC7fpWRDgcNYWWB/8qO
 +SagL6UW3zfMgzv82PBxUWnGLCPgUAXDLMszFapYHPL4Z3ePACnH2vi/81nf+DhcyB3NKI4ycTr
 BmqQTrZHnIyxM2392Dv8Rx2UlFAtQD1myM6VWeNreSEP7k8HIaO9VRsgorxJFDzbCF4Jgad/Nbp
 vDwgBB46nPx3V/tvo4psJyqk/46OwHktfFPn7vRJfuFyX6mV9wQNAMYur7JKuNbPNqxWz1MGBO6
 B8GFOB1aAy2q+VUfFqF7ucb0+a6/OAMysrZJQESwbxadQORTduXeyMS5QVELcWStBFnuePICpUX
 b4KRFbvbXEFlu78lD8Ax7Ic2nZDU4QptsMqVcDF3iFZdoYjnoTMQ29RDo3tNMegNPmjgUKZm+4W
 f0r5szXPKWVUB8gBYtuGoVcmU5zbGywRjVNEGWwoP4Xmh5uiC0vUxsd3d0946rKjeGyusZxSSY8
 keELNr1ncsvKSbvTPYcu8otg9KkLQ3meVVzuivn+pCBsRa9kyOXQK9b3QgquIuvj6mTaecvjalV
 5z1LFmCt3xRIk+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

No symbols from the linux/idr.h or linux/spinlock.h headers are used in
this file so remove them. We also don't technically need linux/list.h
currently but one of the follow-up commits will start using it so let's
leave it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 88f97018fc7995c1e1195c0da4b6a8377af62e0b..f23b4efea5905a9eab51ed9e50b5159135a8e26c 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -3,7 +3,6 @@
 #include <linux/bitops.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
-#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kdev_t.h>
@@ -12,7 +11,6 @@
 #include <linux/mutex.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
-#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/srcu.h>
 #include <linux/sysfs.h>

-- 
2.48.1

