Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37331F1927
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102537; cv=none; b=Fm3n/5VcnYIPvH61ll+AJJTC2NIeDy3yjKIITJJ6pGQ8eiJVhDfC0/G+501ib9OOE0nECzcHuPEqGYOdYB+YQy6A9ygKxHjmV5sIEqt2XboWe/KJK5CJGt1Um9pane+8uVa09qK+EDjP/RtbxghloJTGhsATXqTvilRl6WLtY2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102537; c=relaxed/simple;
	bh=ocKWQyWFvfo4i8RsaVUWnShGFXwK4VG6l8AjbjrEiVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BC0ItMQKTzxGOT/Pt/M4bGTpIl5b99LgPBj+P0W2/33yzxm5Jl2SguD+YZmBMqfGwRNozyj7mNzwcPCRygDMRN+C1wOSTZR3TXMNpO3MhiF0NYH+h5N/y3sV8DkuURy4xnCAqtiZyNX0olucUwTApCl/S0cKSMMfL7waMwADo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=YFtsD8HI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="YFtsD8HI"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 84E6F25DBC;
	Thu,  5 Jun 2025 07:48:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5fxoGRey88U; Thu,  5 Jun 2025 07:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749102533; bh=ocKWQyWFvfo4i8RsaVUWnShGFXwK4VG6l8AjbjrEiVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YFtsD8HIFsuqZnxPkJox2WRWLBedTnUKsSD6oUrm5qEZE6UjdkRcRkc5qKfOnUYYW
	 luMv6Nbh27pLc+joYChsrRybQhR0W24y604Qk8o+vFLq0JmB4g0jT86lDwEJIKGnB1
	 RQvvd8bKXtQYSYMA8/C+ps2CfQooN/8bY4K8t9vF/o0l/M3O/9ig1DXjJWX0X+6kUX
	 e759oJBynZNngaZYL+kbLOETbmAr1xSHe6AblAHUS1lP43DGrB5Na0bjaOeMmOW/Ko
	 /5LBDvFYZ9wQ3Zn8ZmPzgvyoKnnladuqmo2+IuYoys6fwdpSm6h01nwCExEbyoV8pD
	 mVfEHQjxXSyXg==
From: Yao Zi <ziyao@disroot.org>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 2/2] platform/loongarch: laptop: Support backlight power control
Date: Thu,  5 Jun 2025 05:48:28 +0000
Message-ID: <20250605054828.15093-3-ziyao@disroot.org>
In-Reply-To: <20250605054828.15093-1-ziyao@disroot.org>
References: <20250605054828.15093-1-ziyao@disroot.org>
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
 drivers/platform/loongarch/loongson-laptop.c | 76 ++++++++++----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 828bd62e3596..fe3f5b24c0a1 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -56,9 +56,8 @@ static struct input_dev *generic_inputdev;
 static acpi_handle hotkey_handle;
 static struct key_entry hotkey_keycode_map[GENERIC_HOTKEY_MAP_MAX];
 
-int loongson_laptop_turn_on_backlight(void);
-int loongson_laptop_turn_off_backlight(void);
 static int loongson_laptop_backlight_update(struct backlight_device *bd);
+static bool bl_powered;
 
 /* 2. ACPI Helpers and device model */
 
@@ -354,16 +353,41 @@ static int ec_backlight_level(u8 level)
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
-	int lvl = ec_backlight_level(bd->props.brightness);
+	int ret = 0, lvl = ec_backlight_level(bd->props.brightness);
+	bool target_powered = !backlight_is_blank(bd);
 
 	if (lvl < 0)
 		return -EIO;
-	if (ec_set_brightness(lvl))
-		return -EIO;
 
-	return 0;
+	if (target_powered != bl_powered) {
+		ret = ec_backlight_set_power(target_powered);
+		if (ret)
+			return ret;
+
+		bl_powered = target_powered;
+	} else {
+		ret = ec_set_brightness(lvl);
+	}
+
+	return ret;
 }
 
 static int loongson_laptop_get_brightness(struct backlight_device *bd)
@@ -384,7 +408,7 @@ static const struct backlight_ops backlight_laptop_ops = {
 
 static int laptop_backlight_register(void)
 {
-	int status = 0;
+	int status = 0, ret;
 	struct backlight_properties props;
 
 	memset(&props, 0, sizeof(props));
@@ -392,44 +416,20 @@ static int laptop_backlight_register(void)
 	if (!acpi_evalf(hotkey_handle, &status, "ECLL", "d"))
 		return -EIO;
 
+	ret = ec_backlight_set_power(true);
+	if (ret)
+		return ret;
+
+	bl_powered = true;
+
 	props.brightness = ec_get_brightness();
 	props.max_brightness = status;
+	props.power = BACKLIGHT_POWER_ON;
 	props.type = BACKLIGHT_PLATFORM;
 
 	backlight_device_register("loongson_laptop",
 				NULL, NULL, &backlight_laptop_ops, &props);
 
-	return 0;
-}
-
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
 
 	return 0;
 }
-- 
2.49.0

