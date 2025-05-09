Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C16923F417;
	Fri,  9 May 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816207; cv=none; b=slxVYCS7QiE/EGgoI6JWYfMpdxVLQPymHsD/Ce8gubxKZ9bSkAWQB/QXz8hzJ74IZza7gik+EkwKy/TFQWpCew+8HYK4I5Aytr1AcC6Qxk+TpibUsvvIsgncob91kNrbHlEPE9lrgWRIaCXG0lVOFbkYfYMOZqaRkwELJ0E2na4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816207; c=relaxed/simple;
	bh=41w0bk3kuGZ9kIBv+2LW2tbt6aV2CZQ1bo8zA7mqv+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbBFpfq1qhlYmvan7ZdqiGs+oG7PQapVrxYbGmnKVkfpdXvXbFK4XknFuymQLSd0NsZMOl/XBhCZOMMdYNncjLufOx6Rnw87aIIybw9u7hf3oc6o98x1SmJNu0lf6IDzygh8jgrZHMXmESLs1P//iu7sG4ICm8wQHrI+6jTQpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp3IqS3N; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp3IqS3N"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54298ec925bso3625368e87.3;
        Fri, 09 May 2025 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746816203; x=1747421003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhJzNOByoQ6GZyClitKhjcqQJuru+6gmvx6zsuwpmyw=;
        b=Kp3IqS3NlSiTD+4jv5PbGiRqmCC9llEVajM/OftCS/Pxj9zkkv78xePPkC5UJL4hUy
         qN8KZGWKmIzfVzLCKZIV/ekuSqoKnvD1+3AYMG6eKz14SQbrxMYrPyq++/IZFCwND5d2
         OPbPNmwQQoTcUR7SCnRhhfgzSP/s0SeirW+ji05HbKHeSj5lhKCdkID15gznZ1KWAZEL
         tndf012lClXBn39RC2J8TbbkhumF4m0L9InN4rF7YbQkYWp5+JVVidJ9SbUXCa2Jyq4w
         HXMO92kSPJSr4ztj8PfltbjZFWGsRil4M5yrm0cSR4o8GrunccYJRNxiMsrQJa0bfCdN
         Rjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816203; x=1747421003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhJzNOByoQ6GZyClitKhjcqQJuru+6gmvx6zsuwpmyw=;
        b=YWpMAZghH5ieI+b9Nc/gmqIYio8Cq4cjan/lp7Ooo/J/4KhKgdi3LJWt6Yx9zH/2Ej
         CzjQE2lbR6SGDvDfkvgJc7LKg4CgKCOn0Ne2u4/deep6oavOdEDoydTxglDV5IOq4FYu
         lit4GqyzsYpYMTM7LuCdZTXstx4TiRXi9nyclGMRrmt6PsnmkWoGH4P5KQ61sZz1uFUQ
         a8bCrjCaisEiYyRG4wfUWbJoXLZNtyNGqM+y3ghJlLsAb5zfDNBKusvjd47Gux6ZIIGn
         bPCNW8+FgOfd1fz0Nr0zXwzGANb6DjxoqlK99JShrFTWFzTSz6oQj+ApwqWSOegriMfR
         vsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU17/d3URzf2du9GhAKKDUvkV5JuLfY4zXBDK11nsaFiEzbKaIEc0ABvUVw623D42MWTxd3VrcLxUEdVvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xgpJJ6Ley2ZA1Tpcm98sfiV7tWSSayDhxIVpV32N9SGUmqxr
	LFpTvxPTB5mTcQC84yNw4szrgSJGvqjVzXgIeKehxwJpVdZv0ILK638O7X8g
X-Gm-Gg: ASbGncvNpGQzb2oLYS/JxHVhqztBDzt0XxRyzvDPV14tO8evkDljLpV+sFWD+ncgnXm
	CdXz9N/pALchFxIUcu//iJzBGY9sTcYZEtv+sLSErMiEUeghXajAE10A86cYOwrp+qgYYzQMctV
	/zxD3ev8z+R3SFIQAs6An4qCA2D5BRTeKWVD+vKPDWtQJgj30V2l+6nuLEtNYDeIkWLeCm9qVeK
	/S7AYTzJ1RKrwf56c0kicxnmVLJlRUpeCA+DIa3Tm6RYIoWzNbbgdX3RISBCR1WbUs6zSfjPs5w
	qtko6yyIGwbGRadPhCKvz1SurbAI/CkMWg1YxC8UJEGONEt9Z4u6CBfMysrV0Me420ZeuIWadOr
	V2VUBW5jDaK1joNOFWotX1vbD
X-Google-Smtp-Source: AGHT+IFA4V+MeNZUHv9v1knNzBcYL1+0e2L4o+RMw5+4fOqHYA4fdnFiUJqjYx2LDuDSEPo2Rh/dcg==
X-Received: by 2002:a05:6512:3ca9:b0:54e:9c6e:8636 with SMTP id 2adb3069b0e04-54fc67ea0e2mr1495496e87.47.1746816202819;
        Fri, 09 May 2025 11:43:22 -0700 (PDT)
Received: from localhost.localdomain (91-159-131-140.elisa-laajakaista.fi. [91.159.131.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fbabsm355965e87.35.2025.05.09.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:43:22 -0700 (PDT)
From: Valtteri Koskivuori <vkoskiv@gmail.com>
To: jwoithe@just42.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valtteri Koskivuori <vkoskiv@gmail.com>
Subject: [PATCH] platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys
Date: Fri,  9 May 2025 21:42:49 +0300
Message-ID: <20250509184251.713003-1-vkoskiv@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S2110 has an additional set of media playback control keys enabled
by a hardware toggle button that switches the keys between "Application"
and "Player" modes. Toggling "Player" mode just shifts the scancode of
each hotkey up by 4.

Add defines for new scancodes, and a keymap and dmi id for the S2110.

Tested on a Fujitsu Lifebook S2110.

Signed-off-by: Valtteri Koskivuori <vkoskiv@gmail.com>
---
 drivers/platform/x86/fujitsu-laptop.c | 33 +++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index a0eae24ca9e6..162809140f68 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -17,13 +17,13 @@
 /*
  * fujitsu-laptop.c - Fujitsu laptop support, providing access to additional
  * features made available on a range of Fujitsu laptops including the
- * P2xxx/P5xxx/S6xxx/S7xxx series.
+ * P2xxx/P5xxx/S2xxx/S6xxx/S7xxx series.
  *
  * This driver implements a vendor-specific backlight control interface for
  * Fujitsu laptops and provides support for hotkeys present on certain Fujitsu
  * laptops.
  *
- * This driver has been tested on a Fujitsu Lifebook S6410, S7020 and
+ * This driver has been tested on a Fujitsu Lifebook S2110, S6410, S7020 and
  * P8010.  It should work on most P-series and S-series Lifebooks, but
  * YMMV.
  *
@@ -107,7 +107,11 @@
 #define KEY2_CODE			0x411
 #define KEY3_CODE			0x412
 #define KEY4_CODE			0x413
-#define KEY5_CODE			0x420
+#define KEY5_CODE			0x414
+#define KEY6_CODE			0x415
+#define KEY7_CODE			0x416
+#define KEY8_CODE			0x417
+#define KEY9_CODE			0x420
 
 /* Hotkey ringbuffer limits */
 #define MAX_HOTKEY_RINGBUFFER_SIZE	100
@@ -560,7 +564,7 @@ static const struct key_entry keymap_default[] = {
 	{ KE_KEY, KEY2_CODE,            { KEY_PROG2 } },
 	{ KE_KEY, KEY3_CODE,            { KEY_PROG3 } },
 	{ KE_KEY, KEY4_CODE,            { KEY_PROG4 } },
-	{ KE_KEY, KEY5_CODE,            { KEY_RFKILL } },
+	{ KE_KEY, KEY9_CODE,            { KEY_RFKILL } },
 	/* Soft keys read from status flags */
 	{ KE_KEY, FLAG_RFKILL,          { KEY_RFKILL } },
 	{ KE_KEY, FLAG_TOUCHPAD_TOGGLE, { KEY_TOUCHPAD_TOGGLE } },
@@ -584,6 +588,18 @@ static const struct key_entry keymap_p8010[] = {
 	{ KE_END, 0 }
 };
 
+static const struct key_entry keymap_s2110[] = {
+	{ KE_KEY, KEY1_CODE, { KEY_PROG1 } }, /* "A" */
+	{ KE_KEY, KEY2_CODE, { KEY_PROG2 } }, /* "B" */
+	{ KE_KEY, KEY3_CODE, { KEY_WWW } },   /* "Internet" */
+	{ KE_KEY, KEY4_CODE, { KEY_EMAIL } }, /* "E-mail" */
+	{ KE_KEY, KEY5_CODE, { KEY_STOPCD } },
+	{ KE_KEY, KEY6_CODE, { KEY_PLAYPAUSE } },
+	{ KE_KEY, KEY7_CODE, { KEY_PREVIOUSSONG } },
+	{ KE_KEY, KEY8_CODE, { KEY_NEXTSONG } },
+	{ KE_END, 0 }
+};
+
 static const struct key_entry *keymap = keymap_default;
 
 static int fujitsu_laptop_dmi_keymap_override(const struct dmi_system_id *id)
@@ -621,6 +637,15 @@ static const struct dmi_system_id fujitsu_laptop_dmi_table[] = {
 		},
 		.driver_data = (void *)keymap_p8010
 	},
+	{
+		.callback = fujitsu_laptop_dmi_keymap_override,
+		.ident = "Fujitsu LifeBook S2110",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LIFEBOOK S2110"),
+		},
+		.driver_data = (void *)keymap_s2110
+	},
 	{}
 };
 
-- 
2.49.0

