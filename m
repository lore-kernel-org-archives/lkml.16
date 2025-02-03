Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A3B1D6DBB;
	Mon,  3 Feb 2025 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563792; cv=none; b=OfjsKgfFapmgEXWLYCs2ouSFoxzZ7FnJcu5eIkgcVP6NgqBiogwdtNyHA7pF47rcnj1tQywg6lS807zkCgNU+HEB2ng3BjX5KiuLhLaQFC1t9YGDoOyUQTJ3fK3qq9I1S2h/t/0FI67//B7SvokpxVSisgtsDhiaJNm4XxGapig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563792; c=relaxed/simple;
	bh=0SCb7PnfHeQ8kfrW/Zn2QZzAmFjjjqEXXXFOgQ2wzDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O218UOD0CDnYba7RY6fAByjqQsciy73m4kAEsUiWnul7lBZ6al4EaXzwS+tYMRsdBAq++o6GrA9eeJ0p13OXaoFEQhOKqxH2tFK2nnOTXi8+7hWBFXRGtIxLplopdH/tQ0CgD6iaIcliMTcS8qMKUtBwj2L1Ka5pVDk1HAV4KzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXoE++8B; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXoE++8B"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-518799f2828so2195429e0c.0;
        Sun, 02 Feb 2025 22:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563789; x=1739168589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KJFejaN2hUA777CdToE/ncuKqP7mW+HC0S8uqtzNoo=;
        b=XXoE++8BygLLLtahE2BefPRJofGhC2T/+unDPL03vqfBCBxDWBZ4nl7KkNqAAoqYfr
         Ywkla2MzIYt1rJrJGUfUa0EMEhmPZJu950JY5bp/ycizSaTuLsjs6jatBKBZMn4RACLN
         Xe2n60ApxGrk6Ec1h0uU206E8Re9r573syZovzjzqXvXeBQreWj3+YlTm69ALiSD8EFf
         sga1Ee/O+StVKz1C4gCzvOO7R8nyKlH5H3RgQWwEbpQ2/Ax3z+WTKlEuQBzi2ol00USC
         gZi5xSnXCHBNzj23jppW3oeou5rxAWVL4ZW3d9zzmJ5Vqd/sN2niNOohVb8bVqrIUQ4S
         OuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563789; x=1739168589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KJFejaN2hUA777CdToE/ncuKqP7mW+HC0S8uqtzNoo=;
        b=wPZ1tvavRBqa1MmzsPhj8HfMNOIUVilq42R5ZWSVROcLdMajuZZXtjLx9Dls45i6PM
         1vKn+0Tiz6cTJTHLJg4dAHCxmWNpQGb/C3uVZI6XBy8LJkuCkPGlk9+WvdCO27DGdtU2
         AA3VnbxGAvULdGKo1yBHqsK7rPKSrGxzUpIYYuCAp69DNarO6xOXxz5qJK7FheNnIPZz
         Wy/xS58xvtPPv+XIfO60V5FfbDRAEmGvsuRQyqli53DnP68BbUrFvXTN8PrK8yIoaXr2
         /nTkTDa/0qXc/hJf7zZBG5Do7/EsaaBMquA0JMdMHx7xJesrUy4YW2w8ehtYTOiancH4
         cH/w==
X-Forwarded-Encrypted: i=1; AJvYcCU4JaO4TMLUowXyeEtjLDMhX3DB1XlR2AakBx5GjZ8pa4sUHwr42hnbbJhXE8i+Koh7675TmtqAXKlsFCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXlvlWLchnh83T13tIzgMfA8PwXeN1gzVGIWQNKpnHXby/gJg
	xmF5yluAaPqJwvGO+H+JLFptROudVKKRVFHWDpWmRQ5tPkBra67xgVb+/A==
X-Gm-Gg: ASbGncuEfGF/yEYQgF4U3L6d/TUBnw96ooFPwebHiqDI3K9uVShwgtYeZ/IOHwKjNmj
	NLH4/Vo1bJi2k3uzU2PUqOAm+x5M3j5NcIY9k9g2+DWXQuLh7S4Uow6+/L1IpwjL3YAT6W9uo74
	MBcG8c9yFOethprPWfQ/+ebTi7E1VWacKgfqesFwaTJxnUOw4Wpyd37updLOt0YAQ9HLMWos3QI
	AO33ZiS7DZ7Zmh8I6HqAQHomLBjFV6w5ZZ0asemY3CWBTkTQHAyu8ILt7SQ5hAHEgEV1XkFJeQL
	0R2y16TmrnbJojRmwPc3/no=
X-Google-Smtp-Source: AGHT+IG5ahipMZuKoIAgu2k+Xt378rUHhulXHdpfraRXzRMTzvVztjVDjc26VJ7Y84PNeqTioaKQug==
X-Received: by 2002:a05:6122:6162:b0:50d:4b8d:6750 with SMTP id 71dfb90a1353d-51eaefabd11mr10324753e0c.1.1738563788780;
        Sun, 02 Feb 2025 22:23:08 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:07 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 07/14] platform/x86: alienware-wmi: Split DMI table
Date: Mon,  3 Feb 2025 01:20:48 -0500
Message-ID: <20250203062055.2915-8-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
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
index e63f232dab80..e426b266239d 100644
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
-	return quirks->hdmi_mux;
+	return alienfx->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -806,7 +783,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return quirks->amplifier;
+	return alienfx->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -879,7 +856,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return quirks->deepslp;
+	return alienfx->deepslp;
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
@@ -1325,7 +1302,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 	struct platform_device *pdev;
 	int ret;
 
-	if (quirks->thermal) {
+	if (awcc) {
 		ret = alienware_awcc_setup(wdev);
 	} else {
 		ret = alienware_alienfx_setup(&pdata);
@@ -1358,6 +1335,26 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 
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
 
@@ -1371,18 +1368,8 @@ static int __init alienware_wmi_init(void)
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

