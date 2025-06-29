Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773AF2253B5;
	Sun, 29 Jun 2025 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751202891; cv=none; b=cQYcE6JwBf8Mi53TUCx6KqKWs6cI0Zu/aCif8EFh3b7k8b/+1CoG5LJBXaxb5VF4Aky/lHhXyEHj/Hg1S5oP/fmCfhS3M0Dg1dGM4ZMVRW2Afe/SFlz/Ag8EVRZkUYdrlRKZVjbXPBYiynfjsuSoOgnUtFeXG+kJea+3F3XBLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751202891; c=relaxed/simple;
	bh=mpSs5hLMVJMMzjRnslltEjL3KE3Pmy4BjxHZnvp/E7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfHsQVlQG4v9wyWOwBD5lPZULaBQq8Gzi7JcH7TgHL6Pl5MVIJ0HneL6hz7keougat7QLhw4z7KFOo0sxqpk8I9aIaP4WUOkwGJC412YJumHUe7DRWLiqlhGkRRG7VGi1dQXtUWf8yTmNV5nHtKz+yjJhcasD0YygEikqiI7cIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cw71ubHU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cw71ubHU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d54214adso24660205e9.3;
        Sun, 29 Jun 2025 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751202887; x=1751807687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQQARNYUCU5YN+CTiKhKyW3fe32kcASuo1ORd1lgGYo=;
        b=cw71ubHUrznLoSLQrXZs2xAOBKkqY+CMg36k6lZKJtW9SpxQ74elMS4f+Cj+VrbY2g
         kxuLyCnAgJqY9RJi1cHA/PguhkBPeEb2EAzwnjBC+cBwdupmIpqtaqQlpD2SUukVZaKn
         kzfsq5o+XSdK22JT+yYk5MQJX1AVanihdkYJU1llu1YNC7PCNLcvmbnrNNoJeVlTTwHr
         gEpUt0TwIz32L+hrhZa+DOcmfVY/vtKTRT9p9TnkAcWVrKu7tVN2IAmeilTFI0A/qnyd
         g/w4GFauwMpVjXAL0/niyen5AFWjx/j6awmfI1BXbgf5/0sfywYjX3QiifRnwU0VnpEY
         XuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751202887; x=1751807687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQQARNYUCU5YN+CTiKhKyW3fe32kcASuo1ORd1lgGYo=;
        b=SlrJi5/Qa4LE1MriJIx206mWHQe2jQ3o055mOKYuWIFHz6dHhPka5ER+Q2RC/fZo3t
         lZBL625Xup95LGzWXl9jB7cePy2wzdJtFk5eOGdv38aAZXLQKxzwmKbjZCA5rOvw8HeQ
         +aaTpg1CLW0PIuF4+OeLgiOX3c7f1tnKqhMZ2LKaFYMapnSbe8eCxFQz2WDmGc6WOTRl
         F/aRvfqct70V7z5BBYd0Ms861PqIXkN8HvhlY9qZCVTJUECeprYM1EX70xubsOLr0Jvs
         hL4T5/FB5Jx9Z4bzdfuizCPlO0DiI6npPiNMtxgpUZteBXC9/F50OSm5AAgVGRr1esd0
         zCGw==
X-Forwarded-Encrypted: i=1; AJvYcCUK5l255XgEaEdkP7ReDidINNOpvgRkrVrIfJFSx0n8Ix2vleHl5kaLN6J+0VVL0KnynUi6SlauAq3GYnVp8jKubvJU@vger.kernel.org
X-Gm-Message-State: AOJu0YzCI/akPl1TAUu0cqT7ivvlW2YZ+Qq14DLIcUHg3utMs7/zCjBa
	tG60IZD05nYLAfLSq/2ren4AZZn1m0Xc56uRtd2WpyrlZkqtzWII4Yyvk6FQJg==
X-Gm-Gg: ASbGncsdFoXX+YACk1PNGbISm4yQK61iA5xoqs52U34v287WXHwFcMr0+Ss2gRYwuoT
	rk7NqcomkUDx7RGL97/8/coBzislMIeHy7rNHhDfVHl6pbMdDr7JwKc6FzA3nmIFAtLSqIrgbW9
	8CNNtCTMsbfLlJEPX8mHnbSh05pMlj+9wGsWZRUUlSR8KvOzq4vzfV6D9HZVSfA80i1F9Zb9b0j
	9L8Ji4h54leLGukJcwM0Hk1xUG7nlJQBw2sQHo1Bk4gikGJ0T5mtMs578Yl85W+V/8lTTKjJPk9
	hjni/f6S8hNS1WwWv+vC2N5u39HaUAfG8A3+EZxbxPsxt8CJgJ62Hjhou73XYEc=
X-Google-Smtp-Source: AGHT+IEia35BJd3VFgs7aypFxX0bnnNYiiwNTL6aPSz8vsqL2UvwqOWrUg2tlF90avyDJR6s078bDA==
X-Received: by 2002:a05:600c:8889:10b0:453:99f:b1b0 with SMTP id 5b1f17b1804b1-4538ee7df67mr54129475e9.20.1751202886356;
        Sun, 29 Jun 2025 06:14:46 -0700 (PDT)
Received: from denis-pc ([151.49.78.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm106301495e9.30.2025.06.29.06.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 06:14:46 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v9 7/8] platform/x86: asus-wmi: deprecate bios features
Date: Sun, 29 Jun 2025 15:14:22 +0200
Message-ID: <20250629131423.9013-8-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629131423.9013-1-benato.denis96@gmail.com>
References: <20250629131423.9013-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

With the existence of the asus-armoury module the attributes no longer
need to live under the /sys/devices/platform/asus-nb-wmi/ path.

Deprecate all those that were implemented in asus-bioscfg with the goal
of removing them fully in the next LTS cycle.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Denis Benato <benato.denis96@gmail.com>
---
 .../ABI/testing/sysfs-platform-asus-wmi       |  17 +++
 drivers/platform/x86/Kconfig                  |  11 ++
 drivers/platform/x86/asus-wmi.c               | 121 ++++++++++++++----
 3 files changed, 124 insertions(+), 25 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index 28144371a0f1..765d50b0d9df 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -63,6 +63,7 @@ Date:		Aug 2022
 KernelVersion:	6.1
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Switch the GPU hardware MUX mode. Laptops with this feature can
 		can be toggled to boot with only the dGPU (discrete mode) or in
 		standard Optimus/Hybrid mode. On switch a reboot is required:
@@ -75,6 +76,7 @@ Date:		Aug 2022
 KernelVersion:	5.17
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Disable discrete GPU:
 			* 0 - Enable dGPU,
 			* 1 - Disable dGPU
@@ -84,6 +86,7 @@ Date:		Aug 2022
 KernelVersion:	5.17
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Enable the external GPU paired with ROG X-Flow laptops.
 		Toggling this setting will also trigger ACPI to disable the dGPU:
 
@@ -95,6 +98,7 @@ Date:		Aug 2022
 KernelVersion:	5.17
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Enable an LCD response-time boost to reduce or remove ghosting:
 			* 0 - Disable,
 			* 1 - Enable
@@ -104,6 +108,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Get the current charging mode being used:
 			* 1 - Barrel connected charger,
 			* 2 - USB-C charging
@@ -114,6 +119,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Show if the egpu (XG Mobile) is correctly connected:
 			* 0 - False,
 			* 1 - True
@@ -123,6 +129,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Change the mini-LED mode:
 			* 0 - Single-zone,
 			* 1 - Multi-zone
@@ -133,6 +140,7 @@ Date:		Apr 2024
 KernelVersion:	6.10
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		List the available mini-led modes.
 
 What:		/sys/devices/platform/<platform>/ppt_pl1_spl
@@ -140,6 +148,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the Package Power Target total of CPU: PL1 on Intel, SPL on AMD.
 		Shown on Intel+Nvidia or AMD+Nvidia based systems:
 
@@ -150,6 +159,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the Slow Package Power Tracking Limit of CPU: PL2 on Intel, SPPT,
 		on AMD. Shown on Intel+Nvidia or AMD+Nvidia based systems:
 
@@ -160,6 +170,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the Fast Package Power Tracking Limit of CPU. AMD+Nvidia only:
 			* min=5, max=250
 
@@ -168,6 +179,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the APU SPPT limit. Shown on full AMD systems only:
 			* min=5, max=130
 
@@ -176,6 +188,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the platform SPPT limit. Shown on full AMD systems only:
 			* min=5, max=130
 
@@ -184,6 +197,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the dynamic boost limit of the Nvidia dGPU:
 			* min=5, max=25
 
@@ -192,6 +206,7 @@ Date:		Jun 2023
 KernelVersion:	6.5
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set the target temperature limit of the Nvidia dGPU:
 			* min=75, max=87
 
@@ -200,6 +215,7 @@ Date:		Apr 2024
 KernelVersion:	6.10
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set if the BIOS POST sound is played on boot.
 			* 0 - False,
 			* 1 - True
@@ -209,6 +225,7 @@ Date:		Apr 2024
 KernelVersion:	6.10
 Contact:	"Luke Jones" <luke@ljones.dev>
 Description:
+        DEPRECATED, WILL BE REMOVED SOON
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f3464e30bd23..a8bde431d541 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -284,6 +284,17 @@ config ASUS_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called asus-wmi.
 
+config ASUS_WMI_DEPRECATED_ATTRS
+	bool "BIOS option support in WMI platform (DEPRECATED)"
+	depends on ASUS_WMI
+	default y
+	help
+	  Say Y to expose the configurable BIOS options through the asus-wmi
+	  driver.
+
+	  This can be used with or without the asus-armoury driver which
+	  has the same attributes, but more, and better features.
+
 config ASUS_NB_WMI
 	tristate "Asus Notebook WMI Driver"
 	depends on ASUS_WMI
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9ffcd74c6328..153112502e34 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -336,6 +336,13 @@ struct asus_wmi {
 /* Global to allow setting externally without requiring driver data */
 static enum asus_ally_mcu_hack use_ally_mcu_hack = ASUS_WMI_ALLY_MCU_HACK_INIT;
 
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
+static void asus_wmi_show_deprecated(void)
+{
+	pr_notice_once("Accessing attributes through /sys/bus/platform/asus_wmi is deprecated and will be removed in a future release. Please switch over to /sys/class/firmware_attributes.\n");
+}
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
+
 /* WMI ************************************************************************/
 
 static int asus_wmi_evaluate_method3(u32 method_id,
@@ -722,6 +729,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
 }
 
 /* Charging mode, 1=Barrel, 2=USB ******************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t charge_mode_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -732,12 +740,16 @@ static ssize_t charge_mode_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", value & 0xff);
 }
 
 static DEVICE_ATTR_RO(charge_mode);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* dGPU ********************************************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t dgpu_disable_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -748,6 +760,8 @@ static ssize_t dgpu_disable_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
@@ -801,8 +815,10 @@ static ssize_t dgpu_disable_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(dgpu_disable);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* eGPU ********************************************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t egpu_enable_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -813,6 +829,8 @@ static ssize_t egpu_enable_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
@@ -869,8 +887,10 @@ static ssize_t egpu_enable_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(egpu_enable);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Is eGPU connected? *********************************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t egpu_connected_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -881,12 +901,16 @@ static ssize_t egpu_connected_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
 static DEVICE_ATTR_RO(egpu_connected);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* gpu mux switch *************************************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t gpu_mux_mode_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
@@ -897,6 +921,8 @@ static ssize_t gpu_mux_mode_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
@@ -955,6 +981,7 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(gpu_mux_mode);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* TUF Laptop Keyboard RGB Modes **********************************************/
 static ssize_t kbd_rgb_mode_store(struct device *dev,
@@ -1078,6 +1105,7 @@ static const struct attribute_group *kbd_rgb_mode_groups[] = {
 };
 
 /* Tunable: PPT: Intel=PL1, AMD=SPPT *****************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t ppt_pl2_sppt_store(struct device *dev,
 				    struct device_attribute *attr,
 				    const char *buf, size_t count)
@@ -1116,6 +1144,8 @@ static ssize_t ppt_pl2_sppt_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->ppt_pl2_sppt);
 }
 static DEVICE_ATTR_RW(ppt_pl2_sppt);
@@ -1158,6 +1188,8 @@ static ssize_t ppt_pl1_spl_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->ppt_pl1_spl);
 }
 static DEVICE_ATTR_RW(ppt_pl1_spl);
@@ -1201,6 +1233,8 @@ static ssize_t ppt_fppt_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->ppt_fppt);
 }
 static DEVICE_ATTR_RW(ppt_fppt);
@@ -1244,6 +1278,8 @@ static ssize_t ppt_apu_sppt_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->ppt_apu_sppt);
 }
 static DEVICE_ATTR_RW(ppt_apu_sppt);
@@ -1287,6 +1323,8 @@ static ssize_t ppt_platform_sppt_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->ppt_platform_sppt);
 }
 static DEVICE_ATTR_RW(ppt_platform_sppt);
@@ -1330,6 +1368,8 @@ static ssize_t nv_dynamic_boost_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->nv_dynamic_boost);
 }
 static DEVICE_ATTR_RW(nv_dynamic_boost);
@@ -1373,9 +1413,12 @@ static ssize_t nv_temp_target_show(struct device *dev,
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%u\n", asus->nv_temp_target);
 }
 static DEVICE_ATTR_RW(nv_temp_target);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Ally MCU Powersave ********************************************************/
 
@@ -1416,6 +1459,7 @@ void set_ally_mcu_powersave(bool enabled)
 }
 EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
 
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t mcu_powersave_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -1426,6 +1470,8 @@ static ssize_t mcu_powersave_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
@@ -1461,6 +1507,7 @@ static ssize_t mcu_powersave_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(mcu_powersave);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Battery ********************************************************************/
 
@@ -2334,6 +2381,7 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 }
 
 /* Panel Overdrive ************************************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t panel_od_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -2344,6 +2392,8 @@ static ssize_t panel_od_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
@@ -2380,9 +2430,10 @@ static ssize_t panel_od_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(panel_od);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Bootup sound ***************************************************************/
-
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t boot_sound_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -2393,6 +2444,8 @@ static ssize_t boot_sound_show(struct device *dev,
 	if (result < 0)
 		return result;
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", result);
 }
 
@@ -2428,8 +2481,10 @@ static ssize_t boot_sound_store(struct device *dev,
 	return count;
 }
 static DEVICE_ATTR_RW(boot_sound);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Mini-LED mode **************************************************************/
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t mini_led_mode_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -2460,6 +2515,8 @@ static ssize_t mini_led_mode_show(struct device *dev,
 		}
 	}
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "%d\n", value);
 }
 
@@ -2530,10 +2587,13 @@ static ssize_t available_mini_led_mode_show(struct device *dev,
 		return sysfs_emit(buf, "0 1 2\n");
 	}
 
+	asus_wmi_show_deprecated();
+
 	return sysfs_emit(buf, "0\n");
 }
 
 static DEVICE_ATTR_RO(available_mini_led_mode);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Quirks *********************************************************************/
 
@@ -3821,6 +3881,7 @@ static int throttle_thermal_policy_set_default(struct asus_wmi *asus)
 	return throttle_thermal_policy_write(asus);
 }
 
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 static ssize_t throttle_thermal_policy_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -3864,6 +3925,7 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
  * Throttle thermal policy: 0 - default, 1 - overboost, 2 - silent
  */
 static DEVICE_ATTR_RW(throttle_thermal_policy);
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* Platform profile ***********************************************************/
 static int asus_wmi_platform_profile_get(struct device *dev,
@@ -4465,27 +4527,29 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_camera.attr,
 	&dev_attr_cardr.attr,
 	&dev_attr_touchpad.attr,
-	&dev_attr_charge_mode.attr,
-	&dev_attr_egpu_enable.attr,
-	&dev_attr_egpu_connected.attr,
-	&dev_attr_dgpu_disable.attr,
-	&dev_attr_gpu_mux_mode.attr,
 	&dev_attr_lid_resume.attr,
 	&dev_attr_als_enable.attr,
 	&dev_attr_fan_boost_mode.attr,
-	&dev_attr_throttle_thermal_policy.attr,
-	&dev_attr_ppt_pl2_sppt.attr,
-	&dev_attr_ppt_pl1_spl.attr,
-	&dev_attr_ppt_fppt.attr,
-	&dev_attr_ppt_apu_sppt.attr,
-	&dev_attr_ppt_platform_sppt.attr,
-	&dev_attr_nv_dynamic_boost.attr,
-	&dev_attr_nv_temp_target.attr,
-	&dev_attr_mcu_powersave.attr,
-	&dev_attr_boot_sound.attr,
-	&dev_attr_panel_od.attr,
-	&dev_attr_mini_led_mode.attr,
-	&dev_attr_available_mini_led_mode.attr,
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
+		&dev_attr_charge_mode.attr,
+		&dev_attr_egpu_enable.attr,
+		&dev_attr_egpu_connected.attr,
+		&dev_attr_dgpu_disable.attr,
+		&dev_attr_gpu_mux_mode.attr,
+		&dev_attr_ppt_pl2_sppt.attr,
+		&dev_attr_ppt_pl1_spl.attr,
+		&dev_attr_ppt_fppt.attr,
+		&dev_attr_ppt_apu_sppt.attr,
+		&dev_attr_ppt_platform_sppt.attr,
+		&dev_attr_nv_dynamic_boost.attr,
+		&dev_attr_nv_temp_target.attr,
+		&dev_attr_mcu_powersave.attr,
+		&dev_attr_boot_sound.attr,
+		&dev_attr_panel_od.attr,
+		&dev_attr_mini_led_mode.attr,
+		&dev_attr_available_mini_led_mode.attr,
+		&dev_attr_throttle_thermal_policy.attr,
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 	NULL
 };
 
@@ -4507,7 +4571,11 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		devid = ASUS_WMI_DEVID_LID_RESUME;
 	else if (attr == &dev_attr_als_enable.attr)
 		devid = ASUS_WMI_DEVID_ALS_ENABLE;
-	else if (attr == &dev_attr_charge_mode.attr)
+	else if (attr == &dev_attr_fan_boost_mode.attr)
+		ok = asus->fan_boost_mode_available;
+
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
+	if (attr == &dev_attr_charge_mode.attr)
 		devid = ASUS_WMI_DEVID_CHARGE_MODE;
 	else if (attr == &dev_attr_egpu_enable.attr)
 		ok = asus->egpu_enable_available;
@@ -4545,6 +4613,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		ok = asus->mini_led_dev_id != 0;
 	else if (attr == &dev_attr_available_mini_led_mode.attr)
 		ok = asus->mini_led_dev_id != 0;
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 	if (devid != -1) {
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
@@ -4800,6 +4869,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	}
 
 	/* ensure defaults for tunables */
+#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
 	asus->ppt_pl2_sppt = 5;
 	asus->ppt_pl1_spl = 5;
 	asus->ppt_apu_sppt = 5;
@@ -4822,17 +4892,18 @@ static int asus_wmi_add(struct platform_device *pdev)
 		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX;
 	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_GPU_MUX_VIVO))
 		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
-
-	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))
-		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE;
-	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE2))
-		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE2;
+#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
 	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO;
 
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))
+		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE;
+	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE2))
+		asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE2;
+
 	err = fan_boost_mode_check_present(asus);
 	if (err)
 		goto fail_fan_boost_mode;
-- 
2.50.0

