Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64020F071;
	Mon,  3 Feb 2025 18:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607258; cv=none; b=P1WbewgOnwlyzXNW4ucKeHGjnQm6FDeShRh7A0ImpZ3/gEGDBaCsHdwBFwNrOnquXoijxa2zBSzUm3gMeRT8xxD9x7bwFredMlIgJP+MjmHRew1/d6KQlwWHVkbjGkU6PgTEJTAjG5MOXXbm3wbd7DEO4sovzpb+XRPRYlJE45A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607258; c=relaxed/simple;
	bh=kZtoBWzE7mQeVDLnVxcdet5FGT8CMcbNZH9qNRUWAMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjHCI9pdE7MWTVo3ByWJJao4NiQbVJiHQx9eeh2SKpMaVG16maD9r+8eT3DbiEUa7XbQm5wfMt+JYQoY7Da6OawHO6/WidUWPw5ZfmI6rju6p6MQDW1ZjV5XJL4jSf7i22KrMoLF/i0rjhNdSq6brsm/kVeCiDIG9JkI4hn6yfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJnqzc/N; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJnqzc/N"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so4920052276.3;
        Mon, 03 Feb 2025 10:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607255; x=1739212055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogva5jVUZ4OXnpC8yztg9C1gtHJbMTLe5UdOSFI3vo8=;
        b=FJnqzc/NK4qXjAGxXvgpTuReqA38ySExl5bIaWAFD+PTa+3EGcF5bxWPtdaeKnHkDc
         QJ1tUQU8aGbacIzbf2wx6tWbLatjxd1cBV6DBBsDb10gdGUT2mMH33o7Rf38zqAGIaMK
         pWmGK54sHpKan6se2xRFlcZ/dmrsABCnksj4EvhC418/gehK7k8otXxpjHKpMWq0VxVY
         XOi+8x+BmS/Um1J/EPUJ6ZPcZqoeHekS09JGrAlvfZ8grZ5TA5/1J4/EiIphrWdxuHdA
         O1zskZMiAappRzIP2zESfC/C5ST4tq7WM/Ki2KtuKNWW9zq6neUBMtBP9pqPleULBj5c
         BPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607255; x=1739212055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogva5jVUZ4OXnpC8yztg9C1gtHJbMTLe5UdOSFI3vo8=;
        b=LFCHogAWC41onwHOmHUPjFTf3e59kwSthhk3kXu2SzYXKU3BIAxgJ+mcScTYDps2Un
         NfcKMyePJOp4p5iVvdVJwqVqH9QCzmIE4LeJGP0OPLiGQXfNoe9kZxEKLfh44/AMxkks
         qxWH5oVHdiV2pTaoQnnaX+KLmVdbogzIgfaiq0RiH1b9VHXJiBTQrRM+smu2DgB9afgW
         5GsezvAZFX3v4wqTKDYngmobh1C2JKx15x8g+dznLy8SXH16FlhxXI9NGInyFYL0pjqB
         D1rG3nvddcucfws5bNV00E2yjCQ42ec7pAj9Z+k9Bv/RPp3GcP9K88IYrfTc1ZCYVHES
         ++8w==
X-Forwarded-Encrypted: i=1; AJvYcCWdFeqeQNGIVrbGrvOw0ZnANfaIw5VYl+RqxHYJ03DrpMMLjBVkWEBI6haTowoEq45+ImkPicE1/tX5/sM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+8xqjBvtgtRtfL8U3LNJNk7QOmPE5NYQaq2V+f/7qbgbShxw
	WARgLIcY5PxY9wJmVGq8nKnP+w1iNhwHmXFOt/W38vuVwv0C46db3Q7ORQ==
X-Gm-Gg: ASbGnctgkvFxHPXP/SXw7ANmGzNKtwZ8OPCIPCqUd35l/wYzPj6mwhmxeeI8mRTo9py
	7kL7YO11YunDeiergP4LQzbtNWNwZj65tsreINk4knIrW30Bxx1z3MbSzP1SJkhzxXc2dxmn34f
	2glHDG+PkYqkdgsDQ9wgsiwvCVulRWVqUy4w3bpUjtKlbMaaX5EQapRVbaoa8vSJa0kMg5r2kiT
	oXY/lDifKR79x9cw5KpjmqF6ryORrldw+va4Wsw7vhvwq3DlAGgSXG9yM7s0fBQfEflmhWiqC+H
	kDbmyuo7S5fSDuIg3vB+aFs=
X-Google-Smtp-Source: AGHT+IEcwdt0DKxrVuj2hKIfU0uwrAPI5oaE8KPi+LGAe6+/lhgdzv2ZAhK11jkMBcmeo+yV3Ko6ug==
X-Received: by 2002:a05:6902:cc4:b0:e57:8b0d:27e0 with SMTP id 3f1490d57ef6-e58a4b7d82emr16384231276.31.1738607255139;
        Mon, 03 Feb 2025 10:27:35 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:34 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 07/14] platform/x86: alienware-wmi: Split DMI table
Date: Mon,  3 Feb 2025 13:27:06 -0500
Message-ID: <20250203182713.27446-8-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split thermal features into a new DMI table to support upcoming file
split. While at it:

Rename quirk_entry -> alienfx_quirks,
Rename quirks -> alienfx

and change hdmi_mux, amplifier and deepslp types to bool, because they are
already being implicitly used as bools.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 363 +++++++++++-----------
 1 file changed, 175 insertions(+), 188 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index d94690e50ecb..7e0a74555e91 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -114,102 +114,68 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
 	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-struct quirk_entry {
+struct alienfx_quirks {
 	u8 num_zones;
-	u8 hdmi_mux;
-	u8 amplifier;
-	u8 deepslp;
-	bool thermal;
-	bool gmode;
+	bool hdmi_mux;
+	bool amplifier;
+	bool deepslp;
 };
 
-static struct quirk_entry *quirks;
+static struct alienfx_quirks *alienfx;
 
 
-static struct quirk_entry quirk_inspiron5675 = {
+static struct alienfx_quirks quirk_inspiron5675 = {
 	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_unknown = {
+static struct alienfx_quirks quirk_unknown = {
 	.num_zones = 2,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_x51_r1_r2 = {
+static struct alienfx_quirks quirk_x51_r1_r2 = {
 	.num_zones = 3,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_x51_r3 = {
+static struct alienfx_quirks quirk_x51_r3 = {
 	.num_zones = 4,
-	.hdmi_mux = 0,
-	.amplifier = 1,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = false,
+	.amplifier = true,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_asm100 = {
+static struct alienfx_quirks quirk_asm100 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = false,
+	.deepslp = false,
 };
 
-static struct quirk_entry quirk_asm200 = {
+static struct alienfx_quirks quirk_asm200 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 0,
-	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = false,
+	.deepslp = true,
 };
 
-static struct quirk_entry quirk_asm201 = {
+static struct alienfx_quirks quirk_asm201 = {
 	.num_zones = 2,
-	.hdmi_mux = 1,
-	.amplifier = 1,
-	.deepslp = 1,
-	.thermal = false,
-	.gmode = false,
-};
-
-static struct quirk_entry quirk_g_series = {
-	.num_zones = 0,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = true,
-	.gmode = true,
-};
-
-static struct quirk_entry quirk_x_series = {
-	.num_zones = 0,
-	.hdmi_mux = 0,
-	.amplifier = 0,
-	.deepslp = 0,
-	.thermal = true,
-	.gmode = false,
+	.hdmi_mux = true,
+	.amplifier = true,
+	.deepslp = true,
 };
 
 static int __init dmi_matched(const struct dmi_system_id *dmi)
 {
-	quirks = dmi->driver_data;
+	alienfx = dmi->driver_data;
 	return 1;
 }
 
@@ -241,51 +207,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_asm201,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware m16 R1 AMD",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m16 R1 AMD"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware m17 R5",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware m18 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware x15 R1",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
-		},
-		.driver_data = &quirk_x_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Alienware x17 R2",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
-		},
-		.driver_data = &quirk_x_series,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Alienware X51 R1",
@@ -313,60 +234,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_x51_r3,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G15 5510",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G15 5511",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G15 5515",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G3 3500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G3 3590",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
-		},
-		.driver_data = &quirk_g_series,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "Dell Inc. G5 5500",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
-		},
-		.driver_data = &quirk_g_series,
-	},
 	{
 		.callback = dmi_matched,
 		.ident = "Dell Inc. Inspiron 5675",
@@ -441,6 +308,116 @@ struct alienfx_platdata {
 
 static u8 interface;
 
+struct awcc_quirks {
+	bool pprof;
+	bool gmode;
+};
+
+static struct awcc_quirks g_series_quirks = {
+	.pprof = true,
+	.gmode = true,
+};
+
+static struct awcc_quirks generic_quirks = {
+	.pprof = true,
+	.gmode = false,
+};
+
+static struct awcc_quirks empty_quirks;
+
+static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware m16 R1 AMD",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m16 R1 AMD"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware m17 R5",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware m18 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x15 R1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Alienware x17 R2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
+		},
+		.driver_data = &generic_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5511",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G15 5515",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G3 3590",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Dell Inc. G5 5500",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+};
+
+static struct awcc_quirks *awcc;
+
 static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 				 void *in_args, size_t in_size, u32 *out_data)
 {
@@ -623,7 +600,7 @@ static DEVICE_ATTR_RW(lighting_control_state);
 static umode_t zone_attr_visible(struct kobject *kobj,
 				 struct attribute *attr, int n)
 {
-	if (n < quirks->num_zones + 1)
+	if (n < alienfx->num_zones + 1)
 		return attr->mode;
 
 	return 0;
@@ -631,7 +608,7 @@ static umode_t zone_attr_visible(struct kobject *kobj,
 
 static bool zone_group_visible(struct kobject *kobj)
 {
-	return quirks->num_zones > 0;
+	return alienfx->num_zones > 0;
 }
 DEFINE_SYSFS_GROUP_VISIBLE(zone);
 
@@ -757,7 +734,7 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && quirks->hdmi_mux;
+	return interface == WMAX && alienfx->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -806,7 +783,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && quirks->amplifier;
+	return interface == WMAX && alienfx->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -879,7 +856,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && quirks->deepslp;
+	return interface == WMAX && alienfx->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -1020,7 +997,7 @@ static int thermal_profile_set(struct device *dev,
 {
 	struct awcc_priv *priv = dev_get_drvdata(dev);
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		u32 gmode_status;
 		int ret;
 
@@ -1086,7 +1063,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
@@ -1124,7 +1101,7 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	if (quirks->thermal) {
+	if (awcc->pprof) {
 		ret = awcc_platform_profile_init(wdev);
 		if (ret)
 			return ret;
@@ -1319,7 +1296,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	};
 	int ret;
 
-	if (quirks->thermal)
+	if (awcc)
 		ret = alienware_awcc_setup(wdev);
 	else
 		ret = alienware_alienfx_setup(&pdata);
@@ -1345,6 +1322,26 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 
 static int __init alienware_wmax_wmi_init(void)
 {
+	const struct dmi_system_id *id;
+
+	id = dmi_first_match(awcc_dmi_table);
+	if (id)
+		awcc = id->driver_data;
+
+	if (force_platform_profile) {
+		if (!awcc)
+			awcc = &empty_quirks;
+
+		awcc->pprof = true;
+	}
+
+	if (force_gmode) {
+		if (awcc)
+			awcc->gmode = true;
+		else
+			pr_warn("force_gmode requires platform profile support\n");
+	}
+
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
@@ -1358,18 +1355,8 @@ static int __init alienware_wmi_init(void)
 	int ret;
 
 	dmi_check_system(alienware_quirks);
-	if (quirks == NULL)
-		quirks = &quirk_unknown;
-
-	if (force_platform_profile)
-		quirks->thermal = true;
-
-	if (force_gmode) {
-		if (quirks->thermal)
-			quirks->gmode = true;
-		else
-			pr_warn("force_gmode requires platform profile support\n");
-	}
+	if (!alienfx)
+		alienfx = &quirk_unknown;
 
 	ret = platform_driver_register(&platform_driver);
 	if (ret < 0)
-- 
2.48.1

