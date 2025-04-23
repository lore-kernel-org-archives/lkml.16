Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0E26E167;
	Wed, 23 Apr 2025 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394617; cv=none; b=utP1PESvYe3bBD/l5oJiZYH9pCXRTmEpD1e+PLVf7HcstPvw1KbpkGJc0yZLvwx+oqJuKQjXmVPmX4FpXUdg4zNgnCZm6oSFI+S7sGBwglJCS6b47vhr4mv2BnpfYYVdhEV+hTWK6hCA3kYO6B3sm+4S3vB4/Mcuq9VIA1aU5f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394617; c=relaxed/simple;
	bh=BSkmljNcR5XKuO2lHzJZltw1Tg20FD0eJOJOzW/cZ0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sgujKd9aQVdPptiyWwh5awJACE+Ind6+OGfrPAvrTZBZQIHF0egHoWDh/p+2GKfS0pIsW2xJ0DGNjZbrNCkT7kiXqZSyhPO3sFF0Jvh6wQtS9SPqACbjhbX94yLlfYQ9IzpoJH8+ZV+kEgSKpDzDtChEL9lIadmY8G3fAbPSgYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnGIx7fx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnGIx7fx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2243803b776so94625535ad.0;
        Wed, 23 Apr 2025 00:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745394613; x=1745999413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEbtAYWd1HrV4Fuz8yI6hPGJ0r4m8IAcKae2wHUYcC0=;
        b=dnGIx7fxNsULCugy4iQMZiLR8A5JMHXuDjSt/zMUDe2fmTRFHtENgYlhze9FA/ucdc
         rygUvn+iP1N92cmWC6vkB/gddB4ThjkxAbug+peLz7IT20x4kZbc6LcBjVFk5fDL6X19
         Reg2kr40wOqGTfBf8g/qCNW8zzAiUEpGD4pcjWc7jUcyggvzseTYPYvi4w17rXZFatdV
         cdJyLrJH/E4q+641wBInX2cF9Bvr98Mjx7aEXmfiK+aRW4W6YHiLzL3vcYiv1qkyFXze
         9MFXZjI4ragSE8fh97cBVs3q+lh15KiCsM9Jqdu2KSISfOZwPaNwGzhEkiBq14Ts5+Ts
         qpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394613; x=1745999413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEbtAYWd1HrV4Fuz8yI6hPGJ0r4m8IAcKae2wHUYcC0=;
        b=p77qI2SX1vemvMu6pXAvO398pWYjI69+iRc76LkQgiJzuwaVb2s6dIlPzuO5FWejnt
         DySKaWJcNeQzE3BoF1kDvh8R6bxPBvY5dzl3dbX1jocbCzcvcoHrmENVo+GBA8Rkfm4L
         8ORUTnCBF/Spdg0WbxpZ+pKShg3dzRVKlqFGmTWYffyW7VksBuTrB26a1Lbb5LiCa2uw
         d9xXaewWQuOYLZZKzrAxO9Zk/2KvR68+uZjuPGqWjrfNvEdAsUGidDbEBNHYuJLlbNaG
         xDfJx3UN5ts98y/hjMcX96V1o2fRvDJt5cMVZlIytDHy22bwVQQ+E+GxyR3NTAfqcgo8
         W+uA==
X-Forwarded-Encrypted: i=1; AJvYcCWGKkh4G97iXWWSACrGTxbseMXZnaNxphg/npNiWcHPR4lFTnnrjqWPNzafWOv6XuFwVffa4iXReHQjmsk=@vger.kernel.org, AJvYcCWSIOdInsoH6Z1Pp5cpgwxzIsSPNQOj9pRoZ80dKaOphFK2pXD5NBBLJbW1zEpfTdaE5CQXOVTkkbAHTSkPS3ltgFL4Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHAuPp7cE2bKERhmTpAvP62R6D+/Qr4HbvDKGkJdtMk7MBdsxn
	GP0m4w+DBNAl+MXU8igQ3zfkvWnX2HojPo/nY5hBPTBhkNXUwFcL
X-Gm-Gg: ASbGncuu9XOwQmktVoEJqBKrlYaz95vaOTm0bYe0L/UNcFKUDSkR290VwpdhAC9HJRg
	mNYM11AFeKkxgZyGWq6hEw7uq5hprDLPAB1hHPwaqZuFsXM2MlsdBdquAMHzKgSElHIK+aD6Kg1
	yG9HwS/qz7XTiWsVcJt/FuchFgOhBEZjPCi7KiWCkfGJgE5aSSVGtb5AUKxVAf6hz9WcZ6nkgZl
	Q6EnUBnhIt7rEA5dN9TznW2q7V8dJwUDZCoKrwB+sPU5n53XwYNLVoWf7ktCOtBIOnZ5/UBhhwm
	ro4kz+7AR/KhPL4bHHuUKhCyHvrObaeeJ2ktdjJV
X-Google-Smtp-Source: AGHT+IExt4FFYDjxRErCxpt5eAyt6muoT34J32i5NQRNc9T48iQoMtOo6j3bxMKdhAHejzg+H6vp0A==
X-Received: by 2002:a17:903:1b0c:b0:224:76f:9e44 with SMTP id d9443c01a7336-22c5357a13dmr254381115ad.8.1745394613450;
        Wed, 23 Apr 2025 00:50:13 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdac67sm98240235ad.29.2025.04.23.00.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:50:13 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 23 Apr 2025 04:49:45 -0300
Subject: [PATCH 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO debug
 methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-awcc-gpio-v1-1-160a11bc3f9a@gmail.com>
References: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
In-Reply-To: <20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Devices with the AWCC interface come with a USB RGB-lighting STM32 MCU,
which has two GPIO pins with debug capabilities:

 - Device Firmware Update mode (DFU)
 - Negative Reset (NRST)

The WMAX device has methods to toggle or read the state of these GPIO
pins. Expose these methods through DebugFS, hidden behind an unsafe
module parameter to avoid common users from toying with these without
consideration.

Suggested-by: Gabriel Marcano <gabemarcano@yahoo.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 116 ++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..2e83be02d7c5f8ca8176f1ec39d9929790da0844 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -38,6 +38,9 @@
 #define AWCC_METHOD_GET_FAN_SENSORS		0x13
 #define AWCC_METHOD_THERMAL_INFORMATION		0x14
 #define AWCC_METHOD_THERMAL_CONTROL		0x15
+#define AWCC_METHOD_FWUP_GPIO_CONTROL		0x20
+#define AWCC_METHOD_READ_TOTAL_GPIOS		0x21
+#define AWCC_METHOD_READ_GPIO_STATUS		0x22
 #define AWCC_METHOD_GAME_SHIFT_STATUS		0x25
 
 #define AWCC_FAILURE_CODE			0xFFFFFFFF
@@ -65,6 +68,10 @@ static bool force_gmode;
 module_param_unsafe(force_gmode, bool, 0);
 MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
 
+static bool gpio_debug;
+module_param_unsafe(gpio_debug, bool, 0);
+MODULE_PARM_DESC(gpio_debug, "Exposes GPIO debug methods to DebugFS");
+
 struct awcc_quirks {
 	bool hwmon;
 	bool pprof;
@@ -217,6 +224,11 @@ enum AWCC_TEMP_SENSOR_TYPES {
 	AWCC_TEMP_SENSOR_GPU			= 0x06,
 };
 
+enum AWCC_GPIO_PINS {
+	AWCC_GPIO_PIN_DFU			= 0x00,
+	AWCC_GPIO_PIN_NRST			= 0x01,
+};
+
 enum awcc_thermal_profile {
 	AWCC_PROFILE_USTT_BALANCED,
 	AWCC_PROFILE_USTT_BALANCED_PERFORMANCE,
@@ -571,6 +583,38 @@ static int awcc_thermal_information(struct wmi_device *wdev, u8 operation, u8 ar
 	return awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
 }
 
+static int awcc_fwup_gpio_control(struct wmi_device *wdev, u8 pin, u8 status)
+{
+	struct wmax_u32_args args = {
+		.operation = pin,
+		.arg1 = status,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+	u32 out;
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_FWUP_GPIO_CONTROL, &args, &out);
+}
+
+static int awcc_read_total_gpios(struct wmi_device *wdev, u32 *count)
+{
+	struct wmax_u32_args args = {};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_READ_TOTAL_GPIOS, &args, count);
+}
+
+static int awcc_read_gpio_status(struct wmi_device *wdev, u8 pin, u32 *status)
+{
+	struct wmax_u32_args args = {
+		.operation = pin,
+		.arg1 = 0,
+		.arg2 = 0,
+		.arg3 = 0,
+	};
+
+	return awcc_wmi_command(wdev, AWCC_METHOD_READ_GPIO_STATUS, &args, status);
+}
+
 static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
 				  u32 *out)
 {
@@ -1318,6 +1362,63 @@ static int awcc_debugfs_pprof_data_read(struct seq_file *seq, void *data)
 	return 0;
 }
 
+static int awcc_debugfs_total_gpios_read(struct seq_file *seq, void *data)
+{
+	struct device *dev = seq->private;
+	struct wmi_device *wdev = to_wmi_device(dev);
+	u32 count;
+	int ret;
+
+	ret = awcc_read_total_gpios(wdev, &count);
+	if (ret)
+		return ret;
+
+	seq_printf(seq, "%u\n", count);
+
+	return 0;
+}
+
+static int awcc_gpio_pin_show(struct seq_file *seq, void *data)
+{
+	unsigned long pin = debugfs_get_aux_num(seq->file);
+	struct wmi_device *wdev = seq->private;
+	u32 status;
+	int ret;
+
+	ret = awcc_read_gpio_status(wdev, pin, &status);
+	if (ret)
+		return ret;
+
+	seq_printf(seq, "%u\n", status);
+
+	return 0;
+}
+
+static ssize_t awcc_gpio_pin_write(struct file *file, const char __user *buf,
+				   size_t count, loff_t *ppos)
+{
+	unsigned long pin = debugfs_get_aux_num(file);
+	struct seq_file *seq = file->private_data;
+	struct wmi_device *wdev = seq->private;
+	bool status;
+	int ret;
+
+	if (!ppos || *ppos)
+		return -EINVAL;
+
+	ret = kstrtobool_from_user(buf, count, &status);
+	if (ret)
+		return ret;
+
+	ret = awcc_fwup_gpio_control(wdev, pin, status);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(awcc_gpio_pin);
+
 static void awcc_debugfs_remove(void *data)
 {
 	struct dentry *root = data;
@@ -1327,7 +1428,7 @@ static void awcc_debugfs_remove(void *data)
 
 static void awcc_debugfs_init(struct wmi_device *wdev)
 {
-	struct dentry *root;
+	struct dentry *root, *gpio_ctl;
 	char name[64];
 
 	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wdev->dev));
@@ -1344,6 +1445,19 @@ static void awcc_debugfs_init(struct wmi_device *wdev)
 		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
 					    awcc_debugfs_pprof_data_read);
 
+	if (gpio_debug) {
+		gpio_ctl = debugfs_create_dir("gpio_ctl", root);
+
+		debugfs_create_devm_seqfile(&wdev->dev, "total_gpios", gpio_ctl,
+					    awcc_debugfs_total_gpios_read);
+		debugfs_create_file_aux_num("dfu_pin", 0644, gpio_ctl, wdev,
+					    AWCC_GPIO_PIN_DFU,
+					    &awcc_gpio_pin_fops);
+		debugfs_create_file_aux_num("nrst_pin", 0644, gpio_ctl, wdev,
+					    AWCC_GPIO_PIN_NRST,
+					    &awcc_gpio_pin_fops);
+	}
+
 	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
 }
 

-- 
2.49.0

