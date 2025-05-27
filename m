Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E5225A2BB
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344446; cv=none; b=DQVq+yPjvEnqRi8g01/8O9kyqmJ0r92zzGHdlFxLlDUCyBSO8XJzzLRjTaETSfkKjrN75nF0HAghDqIGGYd+hdc1GaUXpXThw22sZvPXZg8AJwWS3DuoecjqCbucrxELN0yGgJTHztIPIVKhs/pY5dqAR4mhSpjhVc6DCeHiAQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344446; c=relaxed/simple;
	bh=7xV9gBlCY8b19EKcOHBAPhpFl9Egi1GXkjeOkA6dkIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYJDlQZYU1GUG//niQ/Iy4v6VNOOFY8Fju2nn1DiRNVivRn5DTgK0Fp33mILVKNp0tjQfKN50ZZRy5UkVJ2KohYo8EBrpyfHNFK03elaALnRmyxqGrSiHPQbM5dPojwsJ3RBD8CsANBQFAd1AQsuMeml+KB9eKPcwRV+JkfcFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rbi+klCS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rbi+klCS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4cad7d6bdso2089752f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748344442; x=1748949242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9Mv8rBtATew6MrRBMBX7UtmzjFrS1BeqdLPFyFXnvs=;
        b=rbi+klCSz4q96Q5wVC6oWubQyiDjYZaDMnvcReGiWsZmwFTpCLcOpbpvfP436Km8Aw
         kyonLx7sOfw5XYlmNpzb7KplCQ42QcWrYdoWB2C+LKk5AE/gUqUwRW2sBFDnn1Y5le/N
         nSoAD5vyTDWJwMugiRPa9eT21ipSismGVQ2/qoE9oZwusw8YTYcbTgylXvdFFjvQxEiP
         O2NiC7+gIvAeeM0t33EMNml4YAYALzJXYgJ+Z7gzO4EKqjAJ2keNgBhxBnO6TWhQJAjm
         kjdeOGv8LeIB7DoA4ipFtRnBdEInGsldYTh/uD6urvfn5asHfbVBGB3Nn+wic1OKBq/b
         JKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344442; x=1748949242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9Mv8rBtATew6MrRBMBX7UtmzjFrS1BeqdLPFyFXnvs=;
        b=MgM6kTaCgXPIEQubLJCO/iUYWneAlAR1YmZOD1cz0je21os+EYc9bZtucrfmIQQOI1
         6zSC0eipZu6219Sd0+hqOJoO6UrbqYFuuwUbooKCI64JaclVeuz6VlV9RgqPKqxM6zLz
         R3mR5WfFIIbjyIGjQxC2Cg7vlhJQEp9V8Qdd3nvb37qWy2dn3VTkzFo16vttLqvrtbBX
         QbGy+8AezHnfF//itn32VhwKVcV0nFnx85PBbdHzpEcayEbZjObW99sRlaMBtO+v1gIe
         3lGYK/5Yk7YnLToBWNW8K14+UXjIukiNK5SNdjvZOBnNyz9/NzXZE1HsFSfenzE6UM14
         HlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxGxxNbgFfz5uebAOsfnkFB4uVdlDaDeEatt4O8PdC6xF1w06PjAfhlckg2GcRlRamGvdOoWDx0x9kvXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkCDMz00JiDg6qutu8qkwQm4lPPQByfwFAntB1GRtNM8Qol4t5
	EiTqttFqFt4puiYAt78qHz1aBXaGSzdgxGhcAKYXx7Rz8/kwF3VRX+CA0/+LRyCyLHo=
X-Gm-Gg: ASbGncvI6AILS647QtMj+IGoF2ffW8K6Gfeu9FEaS9VbCP23k3Mj0FCRGeULsZ4764b
	ozuUwFF7BlpnmA4TJfLWZqfCOf12fkLGM5/eHOwRCVrtfx7nC8YRHLfTyIMUA5Dm0bdvSHm+zns
	01+Kc5BT7fFVh2PGJxKMor49nw58T7S8zdxkFKQpv/Bjkj+QHhaw5tNmr6lyPWAyZ0u9vFWLSY6
	akfOdD5i0HQMMoOpsoRnnWflhnHv++cvFONuleDeOUAJ8lQKdazu/aOGn37fdYFm4CZhBLNWhsA
	1YPBY64G3/wiVj+EX/UMvNr7rVFUtBhYCuQENGnVJtllawZXlAs=
X-Google-Smtp-Source: AGHT+IGEfaGDigCwu7r4I2UXBnlCsbwxk6WCqIVgjikS5CsXO+Dp82HB5UCqMOdEXfU3JqXv+5KJ6w==
X-Received: by 2002:a05:6000:2583:b0:3a4:cc8f:a3d5 with SMTP id ffacd0b85a97d-3a4e5e69de5mr162780f8f.15.1748344441464;
        Tue, 27 May 2025 04:14:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:bd12:adce:b990:490a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm260935355e9.27.2025.05.27.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:14:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
Date: Tue, 27 May 2025 13:13:53 +0200
Message-ID: <20250527111353.71540-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Currently for CONFIG_GPIO_GENERIC=y each struct gpio_chip object
contains the fields relevant only for gpio-mmio users. It's not an
insignificant number either as it's several pointers and integers.

It makes sense to remove these fields from struct gpio_chip into a
dedicated structure but this is not trivial due to how the bgpio_init()
function is implemented.

Add a task for tracking this rework.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 4a8b349f2483a..ef53892cb44d7 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -131,6 +131,11 @@ Work items:
   helpers (x86 inb()/outb()) and convert port-mapped I/O drivers to use
   this with dry-coding and sending to maintainers to test
 
+- Move the MMIO GPIO specific fields out of struct gpio_chip into a
+  dedicated structure. Currently every GPIO chip has them if gpio-mmio is
+  enabled in Kconfig even if it itself doesn't register with the helper
+  library.
+
 -------------------------------------------------------------------------------
 
 Generic regmap GPIO
-- 
2.48.1

