Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822CA268C48;
	Fri,  2 May 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173358; cv=none; b=X1Gckg0e6QGvFY7bMBM8IATVLLW83CGbsTWg0v2t7zW0Vj1mEeiKbiSZ7OFF2ol7QKgxioWO1q6e5ah39YpRErd6Ysavgw4pdM/LiYSW5+3ViXAM/W/9FQvznCKtvsHG5KKOiZ3hX61efGycLdEIV2p2PfvH8D9oKzl5yL2Cfm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173358; c=relaxed/simple;
	bh=ZaYq9BAiU+KCyzZoFN3jF/fpqBwqp0DroBLrOZ4gtX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7MooiIrwzqwFHFLBdPsWTj5HmOByRsBGQ1EUmcO669C23CZZ1n95vg/WkvSaPGV+G/OvgOES3BO1FfUhr0tz8nFOTKAvMRg0IamBV781oXR9dh7xb8AU3UBW0KJf2S7UoOdv3ehzx2GM4rdOoHdeew4c7ROkX+03hVXkgu4Pds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQP96Yno; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQP96Yno"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 024F7C4CEEE;
	Fri,  2 May 2025 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173357;
	bh=ZaYq9BAiU+KCyzZoFN3jF/fpqBwqp0DroBLrOZ4gtX0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QQP96YnotfgI6gRqB6myCcC9F/f0J5O2rB4cRZihh5Mf33AVhgCebW85mF9K6frkW
	 1xie/0y/X6Ns/Qp7ehKNPJqLr0+us8RliR8k+hlxqhThs3n8tuL0EX4w1oEnwmOtCs
	 V1yGHV/qh3ZXR1SeAII01u4xJgB5+CJNXfXclEd84Hmc8f106A//4Az32OMXrz7/Gl
	 bct3oK8u4hw/7lk7NCKWaiZohaTK+ofU0FIi4bddJNkFW15HKRrIPjzBIwuueAYujh
	 b90LxN28up+pw5K/k1mULiETDh9/JkoKyKjklLoZcpxhCXlJHoykwI+95Gvg+k74Zx
	 Qr7jxTFUbR7yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4273C3ABB0;
	Fri,  2 May 2025 08:09:16 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Date: Fri, 02 May 2025 05:09:00 -0300
Subject: [PATCH v3 1/2] platform/x86: alienware-wmi-wmax: Expose GPIO debug
 methods
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-awcc-gpio-v3-1-ea9a932d1124@gmail.com>
References: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com>
In-Reply-To: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6403; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=PwPqgrtl1yTz1rK1jiR06nkew+jFDjS+SiLFbNoiWo4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkitau3d/W9W7/j4+ujO67EqUfVZUx7Wf/IZf//Cr7uI
 w3T1u7931HKwiDGxSArpsjSnrDo26OovLd+B0Lvw8xhZQIZwsDFKQATufqa4X+R3Nqeh9Hst346
 6l/9vfzsv9MP98fdmnCv3GlrzpMdT4pEGRkOiWwRSi9SXxUWxbSgJsL3ukKO82ttTXaZPR67Phh
 1zGMGAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

From: Kurt Borja <kuurtb@gmail.com>

Devices with the AWCC interface come with a USB RGB-lighting STM32 MCU,
which has two GPIO pins with debug capabilities:

 - Device Firmware Update mode (DFU)
 - Negative Reset (NRST)

The WMAX device has methods to toggle or read the state of these GPIO
pins. Expose these methods through DebugFS, hidden behind an unsafe
module parameter to avoid common users from toying with these without
consideration.

Suggested-by: Gabriel Marcano <gabemarcano@yahoo.com>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/ABI/testing/debugfs-alienware-wmi |  20 +++++
 drivers/platform/x86/dell/alienware-wmi-wmax.c  | 105 +++++++++++++++++++++++-
 2 files changed, 123 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/debugfs-alienware-wmi b/Documentation/ABI/testing/debugfs-alienware-wmi
index 48cfd4d0b002efd7b68d9c1d3aa91a3a05f49db5..c7f525d6baac962be82780608f8da5c0368600cc 100644
--- a/Documentation/ABI/testing/debugfs-alienware-wmi
+++ b/Documentation/ABI/testing/debugfs-alienware-wmi
@@ -42,3 +42,23 @@ Description:
 		details.
 
 		RO
+
+What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/total_gpios
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Kurt Borja <kuurtb@gmail.com>
+Description:
+		Total number of GPIO pins reported by the device.
+
+		RO
+
+What:		/sys/kernel/debug/alienware-wmi-<wmi_device_name>/gpio_ctl/pinX
+Date:		May 2025
+KernelVersion:	6.16
+Contact:	Kurt Borja <kuurtb@gmail.com>
+Description:
+		This file controls GPIO pin X status.
+
+		See Documentation/wmi/devices/alienware-wmi.rst for details.
+
+		RW
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..2bf9d85426b8f2cc5482be48050c81f9b6a30d00 100644
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
@@ -281,6 +284,8 @@ struct awcc_priv {
 	struct device *hwdev;
 	struct awcc_fan_data **fan_data;
 	unsigned long temp_sensors[AWCC_ID_BITMAP_LONGS];
+
+	u32 gpio_count;
 };
 
 static const enum platform_profile_option awcc_mode_to_platform_profile[AWCC_PROFILE_LAST] = {
@@ -571,6 +576,38 @@ static int awcc_thermal_information(struct wmi_device *wdev, u8 operation, u8 ar
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
@@ -1318,6 +1355,47 @@ static int awcc_debugfs_pprof_data_read(struct seq_file *seq, void *data)
 	return 0;
 }
 
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
@@ -1327,11 +1405,15 @@ static void awcc_debugfs_remove(void *data)
 
 static void awcc_debugfs_init(struct wmi_device *wdev)
 {
-	struct dentry *root;
-	char name[64];
+	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
+	struct dentry *root, *gpio_ctl;
+	char pin_name[8], name[64];
+	u32 gpio_count;
+	int ret;
 
 	scnprintf(name, sizeof(name), "%s-%s", "alienware-wmi", dev_name(&wdev->dev));
 	root = debugfs_create_dir(name, NULL);
+	gpio_ctl = debugfs_create_dir("gpio_ctl", root);
 
 	debugfs_create_devm_seqfile(&wdev->dev, "system_description", root,
 				    awcc_debugfs_system_description_read);
@@ -1344,6 +1426,25 @@ static void awcc_debugfs_init(struct wmi_device *wdev)
 		debugfs_create_devm_seqfile(&wdev->dev, "pprof_data", root,
 					    awcc_debugfs_pprof_data_read);
 
+	ret = awcc_read_total_gpios(wdev, &gpio_count);
+	if (ret) {
+		dev_dbg(&wdev->dev, "Failed to get total GPIO Pin count\n");
+		goto out_add_action;
+	} else if (gpio_count > AWCC_MAX_RES_COUNT) {
+		dev_dbg(&wdev->dev, "Reported GPIO Pin count may be corrupted: %u\n", gpio_count);
+		goto out_add_action;
+	}
+
+	priv->gpio_count = gpio_count;
+	debugfs_create_u32("total_gpios", 0444, gpio_ctl, &priv->gpio_count);
+
+	for (unsigned int i = 0; i < gpio_count; i++) {
+		scnprintf(pin_name, sizeof(pin_name), "pin%u", i);
+		debugfs_create_file_aux_num(pin_name, 0644, gpio_ctl, wdev, i,
+					    &awcc_gpio_pin_fops);
+	}
+
+out_add_action:
 	devm_add_action_or_reset(&wdev->dev, awcc_debugfs_remove, root);
 }
 

-- 
2.49.0


