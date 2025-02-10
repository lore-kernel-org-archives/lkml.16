Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636B6225A25;
	Mon, 10 Feb 2025 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202836; cv=none; b=VTDqi3HO1o0XbdebpM+Vjg72sfXmWaLuyJuSNo4uVIPFrhWSKwiz4DEKqMuTHxGZmAOCG+QJVvnepF2fpogiBFKfcn2L0TMUOn/ktV60Ra+Uen7YhBGZG/cjMCXj+kydqSj4aOPlBrcy6+YHoIjwfoX5gDZdXt/ItfKXb2URz4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202836; c=relaxed/simple;
	bh=cIgi1DHgDfNqKjDJ0XcW+59oMsLbTI9nYXSJyVdXZeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gW2jpAUM3RjejtRXaFZpjnKYP3ywzXYSEZXg39esafmTg3dZjIvuAoG96feqPScnd8AZhYIuexuf4XbiO5ldlekKF2dzhF1rO7nBARtI2PAHQZnwwkGnIaijwOyy0HLgUxgMzrCkjyN5PUiaC2WaXjROynVFR4cZOHZVsjiMALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfLNFWCl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfLNFWCl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43934d6b155so11843915e9.1;
        Mon, 10 Feb 2025 07:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739202832; x=1739807632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNWUTPT+t4grgeyPMpGy9NCUbuKV1aJrX2mhHwdTFfE=;
        b=UfLNFWCl9kM5bUc5G/ftt6f89j9ABEwpMgp5FBx6p09Rwu5PwpXj7ULsBdc6LpiOj6
         YKpThlv8HzXV/9Hd+WYRW8Li9JJcN6Dpu4SJ2ZE3F+mWlL4QtE0Ly8i7I/o/5chR9oNR
         899rhQCP3WAL2dGhbpazrKe7mfsVYKTIiI4jzawByr4TjCz4bu5YZs7hlvSD0A35DV0K
         aURDIO2gZdM4C6vmGZ8gCbXUjeHr/fT6TrH9dV0jyMkykK+kJKFdRBRaIAbK1MCA9jfX
         c1AXy73PxqjNwTmEvLzLJeMpjxm4FQqWJ5f2SmWOGDhzG/m3B6lVXiu5OqJH8bCtW+XL
         3D2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202832; x=1739807632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNWUTPT+t4grgeyPMpGy9NCUbuKV1aJrX2mhHwdTFfE=;
        b=eXWo3NfP7Tyj5OLO8H54tNCpCU0ELUaF9bktXfUAF0yiXWrhAD2ejUI1bMxs6Hq33w
         jzEzJN4mQf+UnKg6dYArzRd9+wO5DKDQKCKaTkezirBgbOMsMHVcA2im+/gJLjQpcHxE
         0Q2/S8McJJgey0N7ABTkivxgMSqoAr3ZIizqCk/eVG4UKJt1VzGbBKCBGUHwenbktnEw
         9r8c3KPUUWTlGydb3L6aTxasdmTb0i6p6nSuyRuu441ec7z58oMZ1ZwVNGyLBmDseKAK
         s27DsIwb3a3WqnDTpQjHmEcJrGm+qPiw0bdwYx4TBwhLMBfvkaTqORGBTbXCjgiI0Awz
         98KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXtQYtkr9XQuq5hSowiR1/mrOq4h9olCdv5wulXqvK3X9p9T261tuIJ2x6cXmEzW4boJedOLypFdXvQbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9TXZmUrmdFaUcon+EHoHYBZfefmeYENx57xtbzUcqWZ16dTMF
	Ou8iZsFg9Ml5NdHM1KKrSKoBFuLwFv/If9GZloTjXpfo+qjOs/6N
X-Gm-Gg: ASbGncvb5tLpkxfiUu/mbQ1QFaV/GQSvViwKFruKQ3CokqbrEUEZ7cw9Pq6Q4NgYng6
	u4ODJb/5YCOIGuORNobkJ0bsQkmuH6VxHf7Xju88WWk8DzY4CZP6udh0ah2OlNvf4ew7dzP2Zmm
	TC/zVgWrl0Wu2zwMDYd+ZAQkj5lDjPkyTSUL7QeXqu05+0PILTIZCbodsZGWoytUWzgpU3lsNSs
	x7J/jDbriuDJ0RiclfomrwiWfYV1tFwUb1KtAqVZ2q/oH2RsGoMKOP5IovGqNisbqM1xAh1GmTT
	7iPbn+qi8116x7WyDi4kOLd0GuT+OdUOOHypePZb0Yc=
X-Google-Smtp-Source: AGHT+IEtBivb0snLHXxsE1OSuLQfg6PxESIGs0lSyDRH+k1gbp4GS40kpyPhzr07l3BmUp2vchm9SQ==
X-Received: by 2002:a05:600c:1ca9:b0:439:4c7f:e167 with SMTP id 5b1f17b1804b1-4394c7fe345mr3217405e9.1.1739202832420;
        Mon, 10 Feb 2025 07:53:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:2f0e:c501:f600:21cb:f6d7:4e65:6e28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm183980335e9.0.2025.02.10.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:53:52 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: ike.pan@canonical.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: use dev_groups to register attribute groups
Date: Mon, 10 Feb 2025 17:53:33 +0200
Message-ID: <20250210155333.1145867-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of manually adding/removing attribute groups, set
(struct device_driver).dev_groups pointer to have the driver
core do it.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 30bd366d7b58..17a09b7784ed 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -854,6 +854,7 @@ static const struct attribute_group ideapad_attribute_group = {
 	.is_visible = ideapad_is_visible,
 	.attrs = ideapad_attributes
 };
+__ATTRIBUTE_GROUPS(ideapad_attribute);
 
 /*
  * DYTC Platform profile
@@ -1244,21 +1245,6 @@ static void ideapad_unregister_rfkill(struct ideapad_private *priv, int dev)
 	rfkill_destroy(priv->rfk[dev]);
 }
 
-/*
- * Platform device
- */
-static int ideapad_sysfs_init(struct ideapad_private *priv)
-{
-	return device_add_group(&priv->platform_device->dev,
-				&ideapad_attribute_group);
-}
-
-static void ideapad_sysfs_exit(struct ideapad_private *priv)
-{
-	device_remove_group(&priv->platform_device->dev,
-			    &ideapad_attribute_group);
-}
-
 /*
  * input device
  */
@@ -2175,10 +2161,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 	ideapad_check_features(priv);
 
-	err = ideapad_sysfs_init(priv);
-	if (err)
-		return err;
-
 	ideapad_debugfs_init(priv);
 
 	err = ideapad_input_init(priv);
@@ -2265,7 +2247,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 
 input_failed:
 	ideapad_debugfs_exit(priv);
-	ideapad_sysfs_exit(priv);
 
 	return err;
 }
@@ -2293,7 +2274,6 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 	ideapad_kbd_bl_exit(priv);
 	ideapad_input_exit(priv);
 	ideapad_debugfs_exit(priv);
-	ideapad_sysfs_exit(priv);
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -2325,6 +2305,7 @@ static struct platform_driver ideapad_acpi_driver = {
 		.name   = "ideapad_acpi",
 		.pm     = &ideapad_pm,
 		.acpi_match_table = ACPI_PTR(ideapad_device_ids),
+		.dev_groups = ideapad_attribute_groups,
 	},
 };
 
-- 
2.47.1

