Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456794690;
	Sun, 25 May 2025 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748205751; cv=none; b=QQ9TW8ns6220kpNwwlbmtNoRaiJc1aYbB1kVli6j5AtF8JiP+IqMtnhAYssYYhI3zn187SN6KjYBULFe6CsAfu3WtQ06Q9R/Q3AOQEoPezC2/f8sCuaO6WcbhrukCevVCf12m4YA9cnhOezrddUUi1raM9in6qp0uNlsjv9Sq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748205751; c=relaxed/simple;
	bh=pG3DksZ5niG3gPjDO8DVTQsOM39xmHZzz6PDFj4VTiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDER3j80bsPf4PFwoYH2DfIBrKhYf1kJmjpLrdsIlY8SWaiTXjsmEED4KWhmHx9r0/dH0ur91Fdpzh6YOvctPoTus9tt24iisafDd0rEQBnj+Y482iAn+gYh+5npqTlEZZdquucIj/jfgVvn+1URJ6bw5PKFFNrGA8ejX6GJtjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=UuzPDkAV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kJTlPubK; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="UuzPDkAV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kJTlPubK"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 230251380452;
	Sun, 25 May 2025 16:42:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 25 May 2025 16:42:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1748205747; x=1748292147; bh=nC/xhqrsPKfreoD8yVsiD
	635NRVSdwJZuhOTWVC02Hs=; b=UuzPDkAVxEikR7HTVqbdaLvhGsKOnk3x0kedP
	XoP+1zyQeRuTzxgdbudFETSwV0SBMMlR8AhMXPkIlbTCuYmObheMQ+hnkM0V5lFv
	6/znnJoyG9daHEZZwFAIveOc4TehwOD+foKJy/Ug1X76v7P83KsSmYUj33MBtQzf
	2Tr46fKBBVw5kkCkou5icdQKZgJmX3mP4Y5sWEtaPj75n4Zis2PLkknbZTkTKvfg
	HU+fsijmhzDrg+2ZVeCjSyhJalUtMz/NfSQ1lId5qKCrE9U+xFLIG9Thp3p0/k8p
	WLKaqjS0viMJX3irV4siM/cM5BwFFePBoXzMW7ki31zRcxUtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748205747; x=1748292147; bh=nC/xhqrsPKfreoD8yVsiD635NRVSdwJZuhO
	TWVC02Hs=; b=kJTlPubKefr+MV11QnFysPTK8C5mUOCcTRDHqEgiaNLEGL5r9lN
	DmNub2ODfi0uK9KbqtAHoySmZ0i0J93XicX2qRY9jU6KVCsZHVcFmBn0YBcC4nVI
	JSGmvXzwyy76xt9/cXjaP8Q1jsqoyRSbyQsQy1htK1hUy6mRGzhlmj0pRVQrKYza
	xp/oLkowVFg/M4YX2v+t2SdCs9UVDBZbvKYjsl0LQfrKYnv9uWFy8P3M9QzLq4Cn
	T5pYF1UYK+irC4gnW7ojv83LtKaoY41f/ffEvL4rxe387HQxyU9YxG9/++w3fbAn
	dDWlWEF78objipWtfMlTDd4eK3NaYRScVqw==
X-ME-Sender: <xms:soAzaHUmL_iMc32IZW-fPwIqMwqscjd0vZ3xe33FuVAJs926bjvKSA>
    <xme:soAzaPmZcjqnnP1Hixz7FTphGahjrr8U1cNyzCHMmuDvgvmgP2pm7ZBFarXeHa_P7
    X6zql_Jkg5eas3wPNM>
X-ME-Received: <xmr:soAzaDadDbBrFtsQT9J3ZztQB4XnDSQ95cX1hYJJrcxJ0oT6L4an6ro6_5hWJnscowuHacfTSCE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduheeitdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepnfhu
    khgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvg
    hrnheptdektdeitdetueehueetteffffeggfefhfeitddvgeeifeejheelheffjefggfeh
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukh
    gvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphht
    thhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtg
    hpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:soAzaCXgtTfMXFe1r4sOCw-BjKHhng3O1b4aGoYgt6M2WDvW_SJIyg>
    <xmx:soAzaBlyMRQuJuhfPd53o_nnU233jLkR6Ka8KLVOsw35JoTqoxg8xA>
    <xmx:soAzaPemgmMn59N1M-rBgnlhrcLJmkGGpIW7I8gCpECV0tMvytPCsg>
    <xmx:soAzaLGS9FC0KvCELfRCjF19MUSUCoYwzEwDCyF1s0pf85D0b6YP0Q>
    <xmx:s4AzaPA3LFpib7Q6nNF0JEMtDKFNkqkcfCf6qY8yA-JV09Rk8d-TQ_6t>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 May 2025 16:42:25 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	Luke Jones <luke@ljones.dev>
Subject: [PATCH] asus-wmi: fixup screenpad brightness
Date: Sun, 25 May 2025 22:42:14 +0200
Message-ID: <20250525204214.104030-1-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix up some inconsistent behaviour involving the screenpad on some
ASUS laptops. This fixes:
- illogical screen off control (0/1 flipped depending on WMI state)
- bad brightness depending on the last screenpad power state
- incorrect brightness scaling

Signed-off-by: Luke Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c | 52 +++++++++++++--------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f52884e90759..cec509171971 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -123,7 +123,6 @@ module_param(fnlock_default, bool, 0444);
 #define NVIDIA_TEMP_MIN		75
 #define NVIDIA_TEMP_MAX		87
 
-#define ASUS_SCREENPAD_BRIGHT_MIN 20
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
@@ -4239,43 +4238,37 @@ static int read_screenpad_brightness(struct backlight_device *bd)
 		return err;
 	/* The device brightness can only be read if powered, so return stored */
 	if (err == BACKLIGHT_POWER_OFF)
-		return asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
+		return bd->props.brightness;
 
 	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &retval);
 	if (err < 0)
 		return err;
 
-	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) - ASUS_SCREENPAD_BRIGHT_MIN;
+	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK);
 }
 
 static int update_screenpad_bl_status(struct backlight_device *bd)
 {
-	struct asus_wmi *asus = bl_get_data(bd);
-	int power, err = 0;
+	int err = 0;
 	u32 ctrl_param;
 
-	power = read_screenpad_backlight_power(asus);
-	if (power < 0)
-		return power;
-
-	if (bd->props.power != power) {
-		if (power != BACKLIGHT_POWER_ON) {
-			/* Only brightness > 0 can power it back on */
-			ctrl_param = asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
-			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
-						    ctrl_param, NULL);
-		} else {
-			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
-		}
-	} else if (power == BACKLIGHT_POWER_ON) {
-		/* Only set brightness if powered on or we get invalid/unsync state */
-		ctrl_param = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
+	ctrl_param = bd->props.brightness;
+	if (ctrl_param >= 0 && bd->props.power) {
+		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1,
+					    NULL);
+		if (err < 0)
+			return err;
+		ctrl_param = bd->props.brightness;
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
+		if (err < 0)
+			return err;
 	}
 
-	/* Ensure brightness is stored to turn back on with */
-	if (err == 0)
-		asus->driver->screenpad_brightness = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
+	if (!bd->props.power) {
+		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
+		if (err < 0)
+			return err;
+	}
 
 	return err;
 }
@@ -4293,22 +4286,19 @@ static int asus_screenpad_init(struct asus_wmi *asus)
 	int err, power;
 	int brightness = 0;
 
-	power = read_screenpad_backlight_power(asus);
+	power = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
 	if (power < 0)
 		return power;
 
-	if (power != BACKLIGHT_POWER_OFF) {
+	if (power) {
 		err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
 		if (err < 0)
 			return err;
 	}
-	/* default to an acceptable min brightness on boot if too low */
-	if (brightness < ASUS_SCREENPAD_BRIGHT_MIN)
-		brightness = ASUS_SCREENPAD_BRIGHT_DEFAULT;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW; /* ensure this bd is last to be picked */
-	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX - ASUS_SCREENPAD_BRIGHT_MIN;
+	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX;
 	bd = backlight_device_register("asus_screenpad",
 				       &asus->platform_device->dev, asus,
 				       &asus_screenpad_bl_ops, &props);
@@ -4319,7 +4309,7 @@ static int asus_screenpad_init(struct asus_wmi *asus)
 
 	asus->screenpad_backlight_device = bd;
 	asus->driver->screenpad_brightness = brightness;
-	bd->props.brightness = brightness - ASUS_SCREENPAD_BRIGHT_MIN;
+	bd->props.brightness = brightness;
 	bd->props.power = power;
 	backlight_update_status(bd);
 
-- 
2.49.0

