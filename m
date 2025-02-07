Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0A25A636;
	Fri,  7 Feb 2025 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943226; cv=none; b=G29N+0XhSYpVz4/Nx7hioR8frPvePW8BGVn+CtyZc65ZjvAwdNEcx9D7MlJueHFO2LKNorrmpkPhtlpMU9vpmw34A6nNTAEgSi61tgQrx6N0df4HqgkgIO17zINxpAu04HKu4xy8PyQg6E2sdRqYSfSAY7Rp8KERBWEeYCKNmcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943226; c=relaxed/simple;
	bh=WNK/zhnhWne1KhFy1ru5tXjKwHW1D7tIpQQubkriI9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdlodYrQF7DJjTOMXAG3Kan7vrqg+BZHbkJ4MlKfTXQ8vbhhr64NA751THQ+oiZeC3+pNYCCIADou+mJWdISjtLm+LUd9Jag72NcIKgR12n9Jqd1mk5fkaK53Y/Q7+sW82QmAJ5SM0x0CuttPXarZ1g2ITFqS78y3RoMMYg6BnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHVmqpmj; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHVmqpmj"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6f95d2eafso242844385a.3;
        Fri, 07 Feb 2025 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943223; x=1739548023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeplABhvsldXq+TfWYcnOdbCWYVX3O6/Sz7wRQiltlA=;
        b=XHVmqpmj+tYwXowNN7JMXKb4xRO+XtzF/OaOQxvuCGef/+uY8gduSETPOAONuupuoy
         FeigxS4iXRLuQF3dWKjQz51k+wnh2K8rMcLcdWOBL+Jgzw9QsAPNzcfy+SByaG9qzdoH
         5toZWtjWuJ3XYVaX/gPqELjDcnBR4H2qrmTBt+womZUAj7QYfXPfus2x+Bfxq+5xsQFY
         3HJb9iN+ZTfBfoPXbRCf7VdSmpC2Y7cW63iGYIrHODPfcFt1jzn6QStsNosjmL3+Oloq
         T89G9au11sqwDaidYTqqKTJ9lizAsooH3K78TVjbb0HpG/AzDzE8EfDYiC6jjACXy5BA
         1LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943223; x=1739548023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeplABhvsldXq+TfWYcnOdbCWYVX3O6/Sz7wRQiltlA=;
        b=oAhfoixYrNqXgBrB23VkT9pyk92gGIcsL3bjNmdGjalnsWFUo8weKQ4F6nkfoD0LXz
         OU22SXWL0f/9KiA1HehEaSTWCThH67+hLAXSwM4FR6sdCFmSVKw/NW7N5b6rje5uOiTt
         wBRTAqFiWx8wB966wTCRFjpIG1g2G56FOGc63N3FXWUSEEQo3XlMrUhdV3f0ATlnGqU1
         3w62BbHYGs4puXgw74ds7witFYvOPN2/1I1nPurxXy1n3fijDAfb+n6Ww9IK2QrU3bMi
         /m8tcY+C0ld0dsNEd8QId9ddDjNjkcNQtLkplCFZizLr/OFsFmYIIQ1Ri7mduqqBofPI
         z+Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUEkH761BxN6J4AKt8TnCpOTcR59VBnIstttD7ScX4fvCgzseN5s7hJjGzHFBFLXtqJy3YetthNbuSQIf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX8/dR/YLlor48oBZ4WbGnjPTBNlBgxgXo7FpU66i08eOzmvER
	PV+AnE1KM2xjrT8DUj2N3ysbMtqUHtn1sGzPsEZHdLQYMlKZVyGDcRZM3g==
X-Gm-Gg: ASbGnctF8U0eY32lgjmfx3fpMnQUACJM+RJzypYLAxUiqLStbYfZUaly9uwrV6gfU45
	MUqWDAANmQQCHEaOChQKhTecPA9RujnAygVrA8WObxrJxh0Es+ceNqPNgdWEtATywajymAWs6uI
	Hz2YcmACc2vr0eqf3wfxxW/F+8XwiultZet/yEQsS2kKuV8m0Fa+fOZ2yoeG2+icVW3q1LUvbRT
	bYb2NsLt8p1trzVwqO5JPNZ3xtZ2cRyu5r/1rD1BnDJcqVfsHIm/ZL1mCx1xk2jGHi9rq0tz7R4
	wNUAE1VZ7rLF73PSPrab/SY=
X-Google-Smtp-Source: AGHT+IFuaQNFrTGmXY7NqA6tqUjmiq0GBFJGWtOLz349YOpWbGXa03G2ngWN+XoLPIgxbBCYC9Xb1g==
X-Received: by 2002:a05:620a:4448:b0:7c0:b82:8f90 with SMTP id af79cd13be357-7c047c2139amr581147885a.35.1738943223176;
        Fri, 07 Feb 2025 07:47:03 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:02 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 07/14] platform/x86: alienware-wmi: Split DMI table
Date: Fri,  7 Feb 2025 10:46:03 -0500
Message-ID: <20250207154610.13675-8-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
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
index 04c526f95c2f..c575b82f11df 100644
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
 
@@ -754,7 +731,7 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && quirks->hdmi_mux;
+	return interface == WMAX && alienfx->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -802,7 +779,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && quirks->amplifier;
+	return interface == WMAX && alienfx->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -873,7 +850,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && quirks->deepslp;
+	return interface == WMAX && alienfx->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -1013,7 +990,7 @@ static int thermal_profile_set(struct device *dev,
 {
 	struct awcc_priv *priv = dev_get_drvdata(dev);
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		u32 gmode_status;
 		int ret;
 
@@ -1079,7 +1056,7 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
 	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
 		return -ENODEV;
 
-	if (quirks->gmode) {
+	if (awcc->gmode) {
 		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
 			WMAX_THERMAL_MODE_GMODE;
 
@@ -1117,7 +1094,7 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	if (quirks->thermal) {
+	if (awcc->pprof) {
 		ret = awcc_platform_profile_init(wdev);
 		if (ret)
 			return ret;
@@ -1312,7 +1289,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	};
 	int ret;
 
-	if (quirks->thermal)
+	if (awcc)
 		ret = alienware_awcc_setup(wdev);
 	else
 		ret = alienware_alienfx_setup(&pdata);
@@ -1338,6 +1315,26 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 
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
 
@@ -1351,18 +1348,8 @@ static int __init alienware_wmi_init(void)
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

