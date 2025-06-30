Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C926ADD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288665; cv=none; b=nyc9VGLHe+r3iaY5zJm3RjojcsO75rjXQ7l3GUWaLhN+PyuUvgmDUBLHI0f8CqNSIQc0ZA6M7K1z7D+WWHGPpc4yD60ifu1XTe+QzZ9eRLRUU3r0vVV1MxzG5CQeF29JkQ4qei4VFnxtU5s+yZRfVyTOPKg6VYy9SkwChizoK+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288665; c=relaxed/simple;
	bh=8ma29XIVyrlocB2TwxvieiVhXjMJz8cDSr2I0wEXjA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0Ht0r7rwS2fBW7Cz4xl5OwpECPoy19UH02s9fWWxolRLpDliIU6YQ9fZbv3XibV2p8dvbZFOIf8oBQE2HYOwJeHi0tLIrsQuovQzQD8HPuiyy9Ma4gSaike8oidxgmpWcZtoKam5Vedbq/RIJ/zrmWQ/FwqGWYgTA8XfcVmu6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OvP4la4T; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OvP4la4T"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso2383563f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751288662; x=1751893462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtRCoaZRuy3SHZyDIOBlh8AQRBZoYHsrOyl5I3M3Usg=;
        b=OvP4la4Ts2imD7kHl11x6TSySGOLVGHb5zDHKhB69o7ZV22ItVIVbriWPX0MKk8L8F
         lwcfw2hItq9Ju0XCvwx4rxVh2EjMybs4C0L3WeIN6fcgpMAsr9qrvVIF7mX6tgg1p6FR
         /mDNMM7k81px30WZPQoA9ds986DYq4ON6hRoJK9EoN6ZqrkXRngBpiQ64MKmdzRFVul2
         F/smPVSrHgWQwroWqHWv8sfOZ9lzNQB87EL8w8OMH00oCuf7vcANK0mMKUhDAR+L9hte
         wUqzaYGOc34hOBfOd67ZJA+vPodAG1eAGSz4OwIrR+rhOhS5TuHBn/7TaCoknExSl523
         zuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288662; x=1751893462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtRCoaZRuy3SHZyDIOBlh8AQRBZoYHsrOyl5I3M3Usg=;
        b=uE1dJIyxK2CmoBCkFJCBQDvSnhbYVkS4yYR1sbP21Vq/1CfYol9uhCFd2KcSJ0amC6
         EvN9mVg74xiT1A1hN2g6/mJGzbcNt4nZSZL/rAiXFSJ8xHs60iT+Amzeuem1p3uQHCjB
         wTwYAG2eOwuY91cDHGNh7BDwjAeyzNXSbWzko9EVuenIjMtqZh7tx6iGnX4ghPHPTAfA
         3S3LwmoiudBgNo5/owbNvcTMdsOl7lDwBurzuvvWzjW3Au1qkSwnm9VqTyCTsQTmswbD
         ArcfweKZjX5ddzKUDf5F2M7Tu6HRR2r3X7jyObOfhNnS0uqYbZlvu5mXICTt2mC6WAJ6
         tfNw==
X-Forwarded-Encrypted: i=1; AJvYcCVVzSAXG942qJjhLli2+SO8S2zzBsiTnNrEr3AgdsFuhtuictJx7ZoMESWkHV5ZGSFvUFy57aMeLru9PNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmk4LeiVeKobjnZO5BZYozIpQV4ch2b5cvfEtbpVygK4rFZ7yx
	wloUEIMKcbwyo9wcsujfZ3dKP72LFq5ICxKhpKc8GN6qm2DWiKGiufkVZDonulbHTAM=
X-Gm-Gg: ASbGnctiTmW2HxQqlHFQvGcGpwo/eFYUVZyIvsPSDA+kDc4wU0R6pI22bO1zYBTEAyr
	J3KCy/tCbk5WrYzsXkCfkwL6M+S9f356jkQo/pwRwtQwSlFjziLOu35JUO6BG5MkRKbbHvtK40G
	m242/3fu9+cjr+XOSljydo+UpdmuGJWnoK3JbxIewvE4RA8WNzbCXEmwXWiX+oyXPZXR3BOcW8p
	xyYMj97QnUgig1cwhi1uZB71N2ZeDs7vncNQe/SIg5vX8uNoP14XTxAU9ezVEjgLqgJUUjkA4JD
	J1eS34U1rC4hxCXoooOi5ubpLbWgoF8kyj9gIw2HVWmCwCjzfH4Mv4mgHUh9FXE=
X-Google-Smtp-Source: AGHT+IG+KISEPRT59mnSmUbFYKshwUKdJDSOtcgpmTFgZsp3fC/pg+et65cMv5g4qUkmZujHStqtzA==
X-Received: by 2002:adf:b649:0:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a8fdb29f1emr11225299f8f.2.1751288660266;
        Mon, 30 Jun 2025 06:04:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7facb3sm10447413f8f.30.2025.06.30.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:04:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpio: sim: allow to mark simulated lines as invalid
Date: Mon, 30 Jun 2025 15:03:57 +0200
Message-ID: <20250630130358.40352-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new line-level, boolean property to the gpio-sim configfs
interface called 'valid'. It's set by default and the user can unset it
to make the line be included in the standard `gpio-reserved-ranges`
property when the chip is registered with GPIO core. This allows users
to specify which lines should not be available for requesting as GPIOs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/admin-guide/gpio/gpio-sim.rst |  7 +-
 drivers/gpio/gpio-sim.c                     | 83 ++++++++++++++++++++-
 2 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/gpio/gpio-sim.rst b/Documentation/admin-guide/gpio/gpio-sim.rst
index 35d49ccd49e0..f5135a14ef2e 100644
--- a/Documentation/admin-guide/gpio/gpio-sim.rst
+++ b/Documentation/admin-guide/gpio/gpio-sim.rst
@@ -50,8 +50,11 @@ the number of lines exposed by this bank.
 
 **Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/name``
 
-This group represents a single line at the offset Y. The 'name' attribute
-allows to set the line name as represented by the 'gpio-line-names' property.
+**Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/valid``
+
+This group represents a single line at the offset Y. The ``valid`` attribute
+indicates whether the line can be used as GPIO. The ``name`` attribute allows
+to set the line name as represented by the 'gpio-line-names' property.
 
 **Item:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/hog``
 
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index f638219a7c4f..9503296422fd 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -39,7 +39,7 @@
 #include "dev-sync-probe.h"
 
 #define GPIO_SIM_NGPIO_MAX	1024
-#define GPIO_SIM_PROP_MAX	4 /* Max 3 properties + sentinel. */
+#define GPIO_SIM_PROP_MAX	5 /* Max 4 properties + sentinel. */
 #define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
 
 static DEFINE_IDA(gpio_sim_ida);
@@ -629,6 +629,7 @@ struct gpio_sim_line {
 
 	unsigned int offset;
 	char *name;
+	bool valid;
 
 	/* There can only be one hog per line. */
 	struct gpio_sim_hog *hog;
@@ -744,6 +745,36 @@ gpio_sim_set_line_names(struct gpio_sim_bank *bank, char **line_names)
 	}
 }
 
+static unsigned int gpio_sim_get_reserved_ranges_size(struct gpio_sim_bank *bank)
+{
+	struct gpio_sim_line *line;
+	unsigned int size = 0;
+
+	list_for_each_entry(line, &bank->line_list, siblings) {
+		if (line->valid)
+			continue;
+
+		size += 2;
+	}
+
+	return size;
+}
+
+static void gpio_sim_set_reserved_ranges(struct gpio_sim_bank *bank,
+					 u32 *ranges)
+{
+	struct gpio_sim_line *line;
+	int i = 0;
+
+	list_for_each_entry(line, &bank->line_list, siblings) {
+		if (line->valid)
+			continue;
+
+		ranges[i++] = line->offset;
+		ranges[i++] = 1;
+	}
+}
+
 static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
 {
 	struct gpiod_hog *hog;
@@ -844,9 +875,10 @@ static struct fwnode_handle *
 gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 			  struct fwnode_handle *parent)
 {
+	unsigned int prop_idx = 0, line_names_size, ranges_size;
 	struct property_entry properties[GPIO_SIM_PROP_MAX];
-	unsigned int prop_idx = 0, line_names_size;
 	char **line_names __free(kfree) = NULL;
+	u32 *ranges __free(kfree) = NULL;
 
 	memset(properties, 0, sizeof(properties));
 
@@ -870,6 +902,19 @@ gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
 						line_names, line_names_size);
 	}
 
+	ranges_size = gpio_sim_get_reserved_ranges_size(bank);
+	if (ranges_size) {
+		ranges = kcalloc(ranges_size, sizeof(u32), GFP_KERNEL);
+		if (!ranges)
+			return ERR_PTR(-ENOMEM);
+
+		gpio_sim_set_reserved_ranges(bank, ranges);
+
+		properties[prop_idx++] = PROPERTY_ENTRY_U32_ARRAY_LEN(
+						"gpio-reserved-ranges",
+						ranges, ranges_size);
+	}
+
 	return fwnode_create_software_node(properties, parent);
 }
 
@@ -1189,8 +1234,41 @@ static ssize_t gpio_sim_line_config_name_store(struct config_item *item,
 
 CONFIGFS_ATTR(gpio_sim_line_config_, name);
 
+static ssize_t
+gpio_sim_line_config_valid_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_line *line = to_gpio_sim_line(item);
+	struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
+
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%c\n", line->valid ? '1' : '0');
+}
+
+static ssize_t gpio_sim_line_config_valid_store(struct config_item *item,
+						const char *page, size_t count)
+{
+	struct gpio_sim_line *line = to_gpio_sim_line(item);
+	struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
+	bool valid;
+	int ret;
+
+	ret = kstrtobool(page, &valid);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+
+	line->valid = valid;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_line_config_, valid);
+
 static struct configfs_attribute *gpio_sim_line_config_attrs[] = {
 	&gpio_sim_line_config_attr_name,
+	&gpio_sim_line_config_attr_valid,
 	NULL
 };
 
@@ -1399,6 +1477,7 @@ gpio_sim_bank_config_make_line_group(struct config_group *group,
 
 	line->parent = bank;
 	line->offset = offset;
+	line->valid = true;
 	list_add_tail(&line->siblings, &bank->line_list);
 
 	return &line->group;
-- 
2.48.1

