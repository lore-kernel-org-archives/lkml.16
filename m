Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52A1BF58
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168382; cv=none; b=potnjO2RReQlW930s7FOgCuhYlLSJ+5+rzMYyJvtCSJiaMWp5zI6KdAOXiGa6Dkf5Ou0hy8r79r8Nc8tdkLZdJme49MGKNdqK9V9pttFI7rR442awxVBfv1Jg2cWbUnRU4FzEop2lJpgwKPFnVOmc/xyyLe1N8q/3z+tvQAx2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168382; c=relaxed/simple;
	bh=ZjPEwmC8d6yJXPD/Af2mmAD/CXzsaS4nGWUuqYQ2klA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9WFkg702lvzXnKdXjAfK13FA5ULLqV+51J24Had9hhgxWZevANrX68BnTF5aJNBJ8eaJ6oWtbdyUc2ozu7OnB7ClhlhqyPf0VcUhjENzz2+lLCNFH+nUqDvl4D8f2pTm/FZzKqM5udFHZKKhTnTyoG5v3X1RnAjZxOQ1++giVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PmYIas4L; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PmYIas4L"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso3569238a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743168379; x=1743773179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x92zjhfd2x6noSpfStll/xqcTYe/rT8zkKTNHbnXK/I=;
        b=PmYIas4LH8O/EEOvr9KFy5oceDv+6EM9YEbtfz3lQ4AYUXId/yftUdyzP9hv5LOrjS
         VfxmoqockuVO2gpVfJi8+cOTSc+tx8Mv+/4ogUNus6Bbycs+ggKTsiobm8L5DXx9a4bN
         6nbniHTTPqDTf+aQXhCF6/PqcsM2y1GBlAkdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168379; x=1743773179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x92zjhfd2x6noSpfStll/xqcTYe/rT8zkKTNHbnXK/I=;
        b=wbkY8EGprv0X/rq0+5u+qmdFhmS+d/Q3FTEW4/S1Y4Eqqy7y6dJfWDk/S8v8bIwwvg
         79E4FaDi0d9VdNQMGnH9BMHx8v0x8te2MzQuV4OqlfukMvL26SduPsdrzpnHiKxcBC2n
         uXnmXRMMYYojIu8M3hnAAAzMyZyeE9FlDO/+6ZF1uUSFFvRQg/HSYvcIvyIhWVSGjSSb
         9TVmH6VgPpDrWuMgV7o5fM6zZPFMZ+WemEykA5f748+dPX8x3tS3Rb+CQGpRc7rjAbxn
         4mW157J5Kntq1rn1VLoYufnlDq9qUimUcyVLebXYuJV9gpfLGYqmqh2/r3pe4YoW26w+
         ob1w==
X-Forwarded-Encrypted: i=1; AJvYcCXvfPVpugq8Wlrq1xmbXv84R2U5fnvNORTm2A2BLCzSk9h416hSrEJpFYQ/f6rq2D4ELVUj0HszlA0AjPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VONvxj1t2sXRpCo9c96BXKijjY+V5UWWC+6gc+BA3vMnpCM9
	V+DDaBblmjkcQcrxk4tKHX0bxgCuWmqr/T99XXCdrVwyjYRLO8hEnyF+EdFHmw==
X-Gm-Gg: ASbGnctlsrJ0C1xsDm2Nc9chUCQ6bLqV7fKYGIdbQPh5Q8L4mXpXPO0r/Ce3RIvmZIX
	pi/hVzKG+HoAfh2bBOAVAyXQdVxqlsqy7M43320Kwfqq+YNP1AZxjhEnWrjq5QDD5gqDxtAhxuj
	2q638rYYWgAYV34HptMlXSnY1TKtjOPXWBryZmNgqh0Qr2o73K96lS9MYXYKg8AWCGyDvDYPeZ0
	wp2OVLHp1WyvpeDqGrJM9BjO++qfzepsvLPQ/8WGzEfgZI/R4RX9NVaC2FzgbBlhAWA6N5Qro/9
	Yd8UTvkBseA8QuSju+HJvutO6Xpsrg2qSVP6KqAEa1ih8E3v87KBdh0dqYioLomroet4zmNXc5S
	unZdqhgCqU+/WTeZW16Inorb1e16YTOc7LQ==
X-Google-Smtp-Source: AGHT+IGZz7/5rdEd+k2LnpfWVd2CubAVWU4pOV0U+4t4bZFMZn0KMjyPhCW1xU9L8mZ2Wc+waAiwmg==
X-Received: by 2002:a05:6402:270b:b0:5e5:bcd6:4ad8 with SMTP id 4fb4d7f45d1cf-5ed8e28ae2dmr7247798a12.9.1743168378947;
        Fri, 28 Mar 2025 06:26:18 -0700 (PDT)
Received: from srosek-gl03.c.googlers.com.com (157.250.32.34.bc.googleusercontent.com. [34.32.250.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16eda94sm1413457a12.33.2025.03.28.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:26:18 -0700 (PDT)
From: Slawomir Rosek <srosek@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ukaszb@chromium.org,
	Slawomir Rosek <srosek@chromium.org>
Subject: [PATCH v1] platform/chrome: cros_ec_proto: allow to build as module
Date: Fri, 28 Mar 2025 13:26:12 +0000
Message-ID: <20250328132612.511471-1-srosek@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to build ChromeOS EC communication protocol helpers as
kernel module which is particularly useful for Android GKI (Generic
Kernel Image) configuration. With this change the ChromeOS Platform
(CONFIG_CHROME_PLATFORMS=y) can be enabled directly from the vendor
kconfig fragment whithout additional configuration in gki_defconfig.

Signed-off-by: Slawomir Rosek <srosek@chromium.org>
---
 drivers/platform/chrome/Kconfig         | 2 +-
 drivers/platform/chrome/Makefile        | 3 ++-
 drivers/platform/chrome/cros_ec_proto.c | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 1b2f2bd09662..f523ae3d3be0 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -155,7 +155,7 @@ config CROS_EC_LPC
 	  module will be called cros_ec_lpcs.
 
 config CROS_EC_PROTO
-	bool
+	tristate
 	help
 	  ChromeOS EC communication protocol helpers.
 
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 1a5a484563cc..b981a1bb5bd8 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -25,7 +25,8 @@ endif
 obj-$(CONFIG_CROS_EC_TYPEC)		+= cros-ec-typec.o
 
 obj-$(CONFIG_CROS_EC_LPC)		+= cros_ec_lpcs.o
-obj-$(CONFIG_CROS_EC_PROTO)		+= cros_ec_proto.o cros_ec_trace.o
+cros-ec-proto-objs			:= cros_ec_proto.o cros_ec_trace.o
+obj-$(CONFIG_CROS_EC_PROTO)		+= cros-ec-proto.o
 obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)	+= cros_kbd_led_backlight.o
 obj-$(CONFIG_CROS_EC_CHARDEV)		+= cros_ec_chardev.o
 obj-$(CONFIG_CROS_EC_LIGHTBAR)		+= cros_ec_lightbar.o
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 877b107fee4b..f90d2e7b616c 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -1157,3 +1157,6 @@ int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd)
 		return resp.version_mask;
 }
 EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ChromeOS EC communication protocol helpers");
-- 
2.49.0.472.ge94155a9ec-goog

