Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55215990C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529572; cv=none; b=tKhEvsjbA2OhCfPaR7NT9GJ8KTvI1tOwi/M6IKbBjlo1fL0u+KJLgrdG4hcALfA09OrG9haInAS+Ttkbfe3UcglF3piyu8C1hLuKWPjJRYGLk2KtzU6cXHTHkkBixObrTVo1xZZigwWMLmBGaatb7wq+v/NOdN2I7GZwSwFJXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529572; c=relaxed/simple;
	bh=fehAY3yC24ro6+vZ6beyRqMUmWTlnkKTJtJoxqInxag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzDuLVmVzBTRkK0DWw/nikeMbgK4+H5qGwiX6szQVNTA1V2f30U9RXiYlPkdB2ucRTu6SZLWilpUwcm0b5C7Yq4yofvmMYwrzdT2aAEdSEzpiNCmkLqG3/whLTX+EvOArlxWaeHvxrvxTxE96tEgpp7pQJrnLeyV4BDe6yxl+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctmz3hHo; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctmz3hHo"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-4766631a6a4so30162901cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529568; x=1745134368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjFyocYzTktppiP9pnTPpA+jTKDR4/yXZeC89Tb5gFw=;
        b=ctmz3hHoiD9pV8S0X50h5GwemuZ6LGaO7FM4XkI9uLwKI0Ne7RKsGA1uIxkALDQx9L
         9tDGicNGe5gsD52dXXvphOFV1CnG3oI2QwQE9OvQDXhzXQK+f7atVBWC2rq4MOmhqbE4
         XowZ/2KaMynuRLJ6IXkE25Hv/UfNEGS0XcyN3w1Kuhsly0hvemor0ruIPJUwdZOWTOVI
         KZ6zaD586C/Ww7gq70NwRv93rMq2D9mMuaMOtE5T5gLWKtB2Zp8TGrOJRwun0aqqdsiQ
         J13ca6efW1V4zNceu8nRPEmI/4vjCqKSeGsHoHXIKq2VlCtrejKKDis2GoYZKqVmR2hN
         sA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529568; x=1745134368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjFyocYzTktppiP9pnTPpA+jTKDR4/yXZeC89Tb5gFw=;
        b=plu8ZKLK+1dg83f8nmxp6A+ark5jS7W31TknaA527LFx8BF/Om2R3ANuL29oNh1661
         T7Z180xiCgsXWHnVW4qCbqMNE64VZPm/ELd8F7VR7N5lxH6d+ciZIywChXYNelBXz9+d
         UIauaNxwIz6QUFgPYU3GRLhfmJVAacV2zVxnRFh0sQZA8nchQQQtmVG3/ZtWBmgTWWYY
         fypZez5ZXDXDxjhN1qSdZl1iMBLTfdPBoo6pcDGJGziKJUL2hVL0rJ+KKk2AWUtrEoyL
         SOFxKwUmL2MRewHyw/g+rMuFVjJr4LOxt7A5NnzTaklgl+1jAlPUAu8YnrTOctcNaCmo
         ebrg==
X-Forwarded-Encrypted: i=1; AJvYcCUCcjEbsei2aXsrpDIEIqytPycXAr9Gajtz4GhE5pXgaeNNePzjbrqyzsCNbnzcIdXZwf9Nut5s8xHRAeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPoBq9PeGMhJgYhSZcRypikjZyf0/ya0mpGSfNbt52M0OH7Sl
	R8oIfoGgt3gmr2EOAJ+1moM2EjuLNPNzRsIfiGBSxDW7TJcoWwnTO/Eq9tKmS5964g==
X-Gm-Gg: ASbGncunm3vt4QKYjmKA8Uv6xl1Xyngjgk+Cb8fKeoyTYIMcW1TFGk4Sp4o4HhavLq2
	F3c9qgYrEI4CfBe/eh5SJEiJia06yqvgbU/QkYSxroLVt05dBxs2iW4nVqJzpAzsSei+rnGGxDB
	nbYcptbC4Cy1wDzKWjZwO+X1j32EvjBCVz/uayELMX5iJdWCy71rTZ1+YLCyO/V5YgDuHWraMF/
	mcLMnU5Gdn+IILF/neRS6lXPr70Vd4ArzDrKzsdplPCNete8QWyzcd3JMPK/t+yA9/wE2tDhBsR
	hyrsy9kT/sGPy6JJfTPBoZcsDDFGAlhxiKr8ZXnSPDGtYqki19pVZL8bJEbma5VRADjwgAbSEv2
	HeUne5ns41O98wkydZQ==
X-Google-Smtp-Source: AGHT+IGpMWIVWiaLD+lZUi3FoY3HlefhbjuHhYs+GY72x7GKKVsUGlazfJiv8se0ZguiIp9mskaJEg==
X-Received: by 2002:a05:622a:592:b0:474:fab0:6564 with SMTP id d75a77b69052e-479775d5f9bmr121885351cf.37.1744529568160;
        Sun, 13 Apr 2025 00:32:48 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:47 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 2/4] staging: greybus: replace sprintf with sysfs_emit in sysfs show functions
Date: Sun, 13 Apr 2025 07:32:18 +0000
Message-ID: <20250413073220.15931-3-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces deprecated uses of sprintf() with the safer
sysfs_emit() helper in multiple sysfs show functions across the
Greybus staging drivers.

The sysfs_emit() API is designed specifically for sysfs usage and
ensures proper formatting, length checks, and termination, aligning
with current kernel best practices.

Affected files:
  - audio_manager_module.c
  - loopback.c (sysfs-related only)
  - arche-platform.c
  - arche-apb-ctrl.c
  - light.c
  - gbphy.c

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c       | 11 ++++++-----
 drivers/staging/greybus/arche-platform.c       | 11 ++++++-----
 drivers/staging/greybus/audio_manager_module.c | 13 +++++++------
 drivers/staging/greybus/gbphy.c                |  3 ++-
 drivers/staging/greybus/light.c                |  5 +++--
 drivers/staging/greybus/loopback.c             | 15 ++++++++-------
 6 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..9862188e8367 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -17,6 +17,7 @@
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
+#include <linux/sysfs.h>
 #include "arche_platform.h"
 
 static void apb_bootret_deassert(struct device *dev);
@@ -299,16 +300,16 @@ static ssize_t state_show(struct device *dev,
 
 	switch (apb->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off%s\n",
+		return sysfs_emit(buf, "off%s\n",
 				apb->init_disabled ? ",disabled" : "");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..2e706c1169d5 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -21,6 +21,7 @@
 #include <linux/time.h>
 #include <linux/greybus.h>
 #include <linux/of.h>
+#include <linux/sysfs.h>
 #include "arche_platform.h"
 
 #if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
@@ -374,15 +375,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..781144be4eec 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 
 #include "audio_manager.h"
 #include "audio_manager_private.h"
@@ -76,7 +77,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +86,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +95,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +105,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +116,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +127,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..72d72aa7cb0f 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/device.h>
 #include <linux/greybus.h>
+#include <linux/sysfs.h>
 
 #include "gbphy.h"
 
@@ -31,7 +32,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..db0e98faec08 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/greybus.h>
+#include <linux/sysfs.h>
 #include <media/v4l2-flash-led-class.h>
 
 #define NAMES_MAX	32
@@ -173,7 +174,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +221,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..c194afea941a 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -26,6 +26,7 @@
 #include <linux/atomic.h>
 #include <linux/pm_runtime.h>
 #include <linux/greybus.h>
+#include <linux/sysfs.h>
 #include <asm/div64.h>
 
 #define NSEC_PER_DAY 86400000000000ULL
@@ -125,7 +126,7 @@ static ssize_t field##_show(struct device *dev,			\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);			\
+	return sysfs_emit(buf, "%u\n", gb->field);			\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -137,8 +138,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
 	/* Report 0 for min and max if no transfer succeeded */		\
 	if (!gb->requests_completed)					\
-		return sprintf(buf, "0\n");				\
-	return sprintf(buf, "%" #type "\n", gb->name.field);		\
+		return sysfs_emit(buf, "0\n");				\
+	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
@@ -158,7 +159,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
 	rem = do_div(avg, count);					\
 	rem *= 1000000;							\
 	do_div(rem, count);						\
-	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
+	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
@@ -173,7 +174,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
@@ -199,7 +200,7 @@ static ssize_t field##_show(struct device *dev,		\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);				\
+	return sysfs_emit(buf, "%u\n", gb->field);				\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -209,7 +210,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
-- 
2.43.0

