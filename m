Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509DD21CA0F
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748691558; cv=none; b=Hr0y+yMgvzjL3Zpv20mhnYybbrXA76DgO7D8mMcPxVOy96a2k9PDf6QCO9Cy4IU/OBDPEBnx+PB7xwtOoTVgER+4CxXhq/xEZnOePhJMNnL0tXlqn2yIWNP8ucAPXLpTur7p4XrdfYqebQ+QcFe5NpuBOnM9hvxGqtqeN5tvx1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748691558; c=relaxed/simple;
	bh=m65zYeSVVsi7UqG52q+jGdWxFXgZln5/FXtFQtDgwvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2BSoM6uHCme0VlcbQ7kJrU76/60uyRNYY7iJU/uEOwBGufOLhwOBtbhn+LloFtPdexTwM8V+sTdnCoLC/pav1rnJ+gW1yAz1JZLXYd4D9Xr9Jjq33NJWNjYGj8etTW+TDK2NtrjqDGPVZzKYOIprbriJpkl3NHMoR9P7DBP/yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=d2v/VAyH; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="d2v/VAyH"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A654D26082;
	Sat, 31 May 2025 13:39:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rG_HP7124bMt; Sat, 31 May 2025 13:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1748691553; bh=m65zYeSVVsi7UqG52q+jGdWxFXgZln5/FXtFQtDgwvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d2v/VAyH7QNvCtMsgYGlucRpVqiGaFGMUaXWP6g8Y3lfPmZGjBppnppFiBQadgOnC
	 UweEN3t6/0nO+PKcS+hWszcStqnxgfYEgnCr7H2BNGMpLJ6zT+vSpPuljZKRaErJLq
	 AZSF5Jy27K4wJNL8XOxfGc6NBp8Ik5QoRjaEC5JsCOtH5TsV7WYvv3P1HtdioaSGH0
	 TWwDGPP8SJnXBxANE9Pu/GoHGCnFDgyBr1dZEGjpe9mCR4zRkysv2T8tB3swxjhCMn
	 UP6MTO25EKdlh56E2lvgup9OQiOnztxjJHrjrcxvAmmZW6egGUSYOVGnf/E0Tg6HKp
	 JpzNJau5eMu0Q==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 2/2] platform/loongarch: laptop: Support backlight power control
Date: Sat, 31 May 2025 11:38:51 +0000
Message-ID: <20250531113851.21426-3-ziyao@disroot.org>
In-Reply-To: <20250531113851.21426-1-ziyao@disroot.org>
References: <20250531113851.21426-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

loongson_laptop_turn_{on,off}_backlight() are designed for controlling
power of the backlight, but they aren't really used in the driver
previously.

Unify these two functions since they only differ in arguments passed to
ACPI method, and wire up loongson_laptop_backlight_update() to update
power state of the backlight as well. Tested on TongFang L860-T2 3A5000
laptop.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/platform/loongarch/loongson-laptop.c | 53 +++++++-------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 828bd62e3596..f01e53b1c84d 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -56,8 +56,6 @@ static struct input_dev *generic_inputdev;
 static acpi_handle hotkey_handle;
 static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
 
-int loongson_laptop_turn_on_backlight(void);
-int loongson_laptop_turn_off_backlight(void);
 static int loongson_laptop_backlight_update(struct backlight_device *bd);
 
 /* 2. ACPI Helpers and device model */
@@ -354,6 +352,22 @@ static int ec_backlight_level(u8 level)
 	return level;
 }
 
+static int ec_backlight_set_power(bool state)
+{
+	int status;
+	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
+	struct acpi_object_list args = { 1, &arg0 };
+
+	arg0.integer.value = state;
+	status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_info("Loongson lvds error: 0x%x\n", status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int loongson_laptop_backlight_update(struct backlight_device *bd)
 {
 	int lvl = ec_backlight_level(bd->props.brightness);
@@ -363,6 +377,8 @@ static int loongson_laptop_backlight_update(struct backlight_device *bd)
 	if (ec_set_brightness(lvl))
 		return -EIO;
 
+	ec_backlight_set_power(bd->props.power == BACKLIGHT_POWER_ON ? true : false);
+
 	return 0;
 }
 
@@ -394,6 +410,7 @@ static int laptop_backlight_register(void)
 
 	props.brightness = ec_get_brightness();
 	props.max_brightness = status;
+	props.power = BACKLIGHT_POWER_ON;
 	props.type = BACKLIGHT_PLATFORM;
 
 	backlight_device_register("loongson_laptop",
@@ -402,38 +419,6 @@ static int laptop_backlight_register(void)
 	return 0;
 }
 
-int loongson_laptop_turn_on_backlight(void)
-{
-	int status;
-	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
-	struct acpi_object_list args = { 1, &arg0 };
-
-	arg0.integer.value = 1;
-	status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
-	if (ACPI_FAILURE(status)) {
-		pr_info("Loongson lvds error: 0x%x\n", status);
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
-int loongson_laptop_turn_off_backlight(void)
-{
-	int status;
-	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
-	struct acpi_object_list args = { 1, &arg0 };
-
-	arg0.integer.value = 0;
-	status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
-	if (ACPI_FAILURE(status)) {
-		pr_info("Loongson lvds error: 0x%x\n", status);
-		return -ENODEV;
-	}
-
-	return 0;
-}
-
 static int __init event_init(struct generic_sub_driver *sub_driver)
 {
 	int ret;
-- 
2.49.0

