Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4535F200BA9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580494; cv=none; b=jmYZggRWK7CQSEkairc31/8EtahGUAEBOW5kgwR+E9o/EY6J2Gf7o4TLFRDcLDb3p/MHMduM2WTc58+LvboAWs+Qyl81eOn7VUbHbRXnCnztQ9MtP5dswO87Sr0XLzSHk1lYf+0V1aZ7H1O11fbJKpqxk99V2of1Wl6tRG/Nt2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580494; c=relaxed/simple;
	bh=YdZ1F2UIY2BKSTH/78CeGePqnoOFXkPUh4G0+xOW8I4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nM3ctUx80TeGipNCRBPAOi4UttDkCOJqcjXa0KLUOXNFZxhTI0fKbIHq+DKgvBwjGXWprkYUuquixMJAquNxtyqiamZpXnw9Tiy5DgNwyp+F30pMNZmBUTpf1gkfG6hXQywwRT4S1UdEpOfarHP2O6vvZLfG+QqxZtbsdLaPABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w8HRxYe2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w8HRxYe2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4355434f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738580489; x=1739185289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cw22mpAU6PFV8UovQOXfDj306Sn0bhW1MdW6JnCSix8=;
        b=w8HRxYe24ch3I7IIFKjLd/PrqMMPVcbflsiYPAwG1alizGMJ/1q1X13LWO43k+wH6a
         M+PDBWKHa1mthMyLDWq9o7moSVlSUYevttc2CSDdL7cCtyh8ecdkqygwPn1fVmvwcarL
         FkK0qZ2qJIMHTtIeBAyCvFWweAu5qjeA+4XanWQKVJ9KfjWdzakkmXqaoV+s6sXz+3PA
         BJncAWN9InY6p7logdzYs571M5DWiMUWQkSZytyOjgnzL2i+7ZDm8hoGM1Q6IDXkgfXw
         yZF+/S0ZD5cNH0uBQSGiZ7dcZ/5Pq9RyuSYwmluBccy68qigHZCr0+mK3BO4wnnbA/30
         ul8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580489; x=1739185289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cw22mpAU6PFV8UovQOXfDj306Sn0bhW1MdW6JnCSix8=;
        b=GlmIIVvtY7xQ2epSmeMpCKE2bB8rS5EvQXTTWNQ51jpvjh/XsABFKvkvR0vb8gVmg8
         NJoXpdv1OEzOZZQnNxAOAxWnZ/yo8/xAjxROQfeK+ayTgWQ4i9Gm2X8REhxjkk5PmrrI
         ls+uJ8bl02S7QF/CK8KRkdnKUjsjBd7FILws449mtNFCj2sbu20AIaKJ1CbkOCoINuVG
         zoHXjPuYTHYVrHWqdNSFzjcKnyDGpJRKBdAPSYERZ7J3gQHNikhRs7RfFDRwT245vlJS
         PcibYhKOvd/1MdE2LydNEvvcHN5f5cDW8oHTQMJ92tPfJM8bIXVofgJdzI+zPiGFSeR5
         TkeA==
X-Forwarded-Encrypted: i=1; AJvYcCWRumaCrLZvmdi8feftZbGojPZuciPcLFHj9UEpz1OpI0eVf/hB1H/lJ/z92vnITsNOqFyqj5+ue95Ic64=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWtos3C74294UAlYscO5jzfmcT4HtSfXkqV5OZzIE9si3Qhzny
	8QGm2Lj/CgQzTrtG3YJZSPuU++5v91Fy3DQnAd1k/07JTx0jbxwUIuQv6AGLjHb/snKqQIlIgh2
	WVvqrBQ==
X-Gm-Gg: ASbGncu0uM0GGKSLXAAoxEyOVpS7ksQg429wyRjcP5OsscNASTSVRAtg6WvxdYhVnyj
	Ha0BqI9UvsXc6dtSKYO2L+EPsFm+2iIR0UFtCarpZUSk0DjeIMUOXbTORAGhcHNCFQ5zVkU8h45
	dhC/Y8GH/ZDepkQA6Ds0Art0FEQ1mrSa9dAvI9Zr8vSyNB+6V8LA2Eis4/b62Hyop2xL8bEexH+
	Bh374ynXPSVCeYfrxX6gEDXBSsIGL4SiqaO2Kj5pX7etzJaQGcpjvMHL+fpdNmL8T5ontcrTM5z
	CPg2pqbNBxRw3w==
X-Google-Smtp-Source: AGHT+IHnarVZWqY3vGCVzchvGea+YM7uiTfqLn9N97rzsoYlda8HMAkD7/6sIilZA3qM5d1MQ2HkQA==
X-Received: by 2002:a5d:6c65:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38c5cd0efe3mr13978813f8f.11.1738580489130;
        Mon, 03 Feb 2025 03:01:29 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec78esm12245894f8f.3.2025.02.03.03.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:01:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: lock hog configfs items if present
Date: Mon,  3 Feb 2025 12:01:23 +0100
Message-ID: <20250203110123.87701-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Depending on the user config, the leaf entry may be the hog directory,
not line. Check it and lock the correct item.

Fixes: 8bd76b3d3f3a ("gpio: sim: lock up configfs that an instantiated device depends on")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index a086087ada17..b843682b47e9 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -1028,6 +1028,7 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
 	struct configfs_subsystem *subsys = dev->group.cg_subsys;
 	struct gpio_sim_bank *bank;
 	struct gpio_sim_line *line;
+	struct config_item *item;
 
 	/*
 	 * The device only needs to depend on leaf line entries. This is
@@ -1036,12 +1037,14 @@ gpio_sim_device_lockup_configfs(struct gpio_sim_device *dev, bool lock)
 	 */
 	list_for_each_entry(bank, &dev->bank_list, siblings) {
 		list_for_each_entry(line, &bank->line_list, siblings) {
+			item = line->hog ? &line->hog->item
+					 : &line->group.cg_item;
+
 			if (lock)
-				WARN_ON(configfs_depend_item_unlocked(
-						subsys, &line->group.cg_item));
+				WARN_ON(configfs_depend_item_unlocked(subsys,
+								      item));
 			else
-				configfs_undepend_item_unlocked(
-						&line->group.cg_item);
+				configfs_undepend_item_unlocked(item);
 		}
 	}
 }
-- 
2.45.2

